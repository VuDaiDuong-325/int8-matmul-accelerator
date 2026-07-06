`timescale 1ns / 1ps
//==============================================================================
// Module   : l2_tiling_agu_v5_FINAL_FIXED
// Project  : INT8 GEMM Accelerator - KV260 / Qwen2 MLP Block
// Date     : June 2026
//
// BẢN TỐI ƯU KIẾN TRÚC SILICON - SỬ DỤNG XILINX XPM MACRO (ĐÃ FIX ĐỒNG BỘ)
// 1. Áp dụng XPM_MEMORY_SDPRAM (BRAM cho A/B, URAM cho C_ACCUM).
// 2. Fix lỗi đồng bộ Pipeline 1-cycle: Thêm cờ req_done để chống tràn dữ liệu.
// 3. Fix lỗi thiếu khai báo genvar gc cho vòng lặp cộng dồn.
// 4. Fix lỗi [Synth 8-6058] URAM WRITE_MODE_B("read_first").
//==============================================================================

module l2_tiling_agu #(
    parameter N      = 16,
    parameter M_BLK  = 256,
    parameter N_BLK  = 256,
    parameter K_BLK  = 256,
    parameter ADDR_W = 32,
    parameter DIM_W  = 16,
    parameter FIFO_DEPTH = 1024,
    parameter BRAM_DEPTH = 1024
)(
    input  wire           CLK_i,
    input  wire           RST_i,

    input  wire [DIM_W-1:0]   cfg_m_total_i,
    input  wire [DIM_W-1:0]   cfg_n_total_i,
    input  wire [DIM_W-1:0]   cfg_k_total_i,
    input  wire [DIM_W-1:0]   cfg_k_dim_i,
    input  wire [DIM_W-1:0]   cfg_num_k_tiles_per_block_i,
    input  wire [ADDR_W-1:0]  cfg_base_a_i,
    input  wire [ADDR_W-1:0]  cfg_base_b_i,
    input  wire [ADDR_W-1:0]  cfg_base_c_i,
    input  wire [DIM_W-1:0]   cfg_n_stride_i,
    input  wire [4:0]          cfg_scale_shift_i,
    input  wire [7:0]          cfg_zero_point_i,

    input  wire   start_i,
    output reg    busy_o,
    output reg    done_o,

    output reg  [71:0]     mm2s_cmd_tdata,
    output reg             mm2s_cmd_tvalid,
    input  wire            mm2s_cmd_tready,
    input  wire [N*8-1:0]  mm2s_tdata,
    input  wire            mm2s_tvalid,
    output wire            mm2s_tready,
    input  wire            mm2s_tlast,

    output reg  [71:0]     s2mm_cmd_tdata,
    output reg             s2mm_cmd_tvalid,
    input  wire            s2mm_cmd_tready,
    output reg  [N*8-1:0]  s2mm_tdata,
    output reg             s2mm_tvalid,
    input  wire            s2mm_tready,
    output reg             s2mm_tlast,
    output wire [N-1:0]    s2mm_tkeep,
    input  wire [7:0]      s2mm_sts_tdata,
    input  wire            s2mm_sts_tvalid,
    output wire            s2mm_sts_tready
);

    localparam LOG2N    = $clog2(N);
    localparam LOG2BLK  = $clog2(M_BLK);
    localparam MI_COUNT = M_BLK / N;
    localparam NI_COUNT = N_BLK / N;
    localparam BEATS_A  = K_BLK / N;
    localparam [ADDR_W-1:0] M_BLK_ADDR = M_BLK;
    localparam [ADDR_W-1:0] N_BLK_ADDR = N_BLK;
    localparam [ADDR_W-1:0] K_BLK_ADDR = K_BLK;
    localparam [3:0] MI_MINUS1 = MI_COUNT - 1;
    localparam [3:0] NI_MINUS1 = NI_COUNT - 1;
    localparam [8:0] MBLK_MINUS1 = M_BLK - 1;
    localparam [8:0] KBLK_MINUS1 = K_BLK - 1;
    
    // Đếm đúng 256 beats (0 -> 255) cho A và B
    localparam [7:0] KCOL_MINUS1 = K_BLK - 1;

    localparam [3:0] F_IDLE = 4'd0, F_WAIT_SLOT = 4'd1, F_A_CMD = 4'd2, F_A_DATA = 4'd3, F_B_CMD = 4'd4, F_B_DATA = 4'd5, F_DONE = 4'd6;
    localparam [3:0] C_IDLE = 4'd0, C_WAIT_SLOT = 4'd1, C_FEED_AB = 4'd2, C_RECV = 4'd3, C_RELEASE = 4'd4, C_DRAIN_PREFETCH = 4'd5, C_DRAIN_FEED = 4'd6, C_DRAIN_WAIT = 4'd7, C_DRAIN_CMD = 4'd8, C_DRAIN_DATA = 4'd9, C_NEXT_BLOCK = 4'd10, C_WAIT_STS = 4'd11, C_DONE_ST = 4'd12;

    // =========================================================================
    // [BUG FIX 1] S2MM STATUS COUNTER
    // FSM cũ báo done_o ngay khi DRAIN_DATA cuối hoàn thành, nhưng AXI DMA S2MM
    // vẫn đang commit data vào DDR. Phải đếm s2mm_sts_tvalid và chờ cho đến
    // khi tất cả write được xác nhận.
    //
    // Tổng drain ops mỗi output block = M_BLK * (N_BLK/N) = 256 * 16 = 4096
    // Tổng blocks = (M/M_BLK) * (N/N_BLK) - được tính tự động từ FSM.
    // Ta dùng 1 counter tổng thể cho toàn bộ run, reset khi start_i.
    // =========================================================================
    reg  [15:0] s2mm_sts_expected_r;   // Tổng số DMA writes cần confirm
    reg  [15:0] s2mm_sts_received_r;   // Số DMA writes đã được confirm

    reg [3:0] fetch_state_r, compute_state_r;

    wire [ADDR_W-1:0] r_a_row_stride_w = {{(ADDR_W-DIM_W){1'b0}}, cfg_k_total_i};
    wire [ADDR_W-1:0] r_a_mblk_step_w  = r_a_row_stride_w << LOG2BLK;
    wire [ADDR_W-1:0] r_b_row_stride_w = {{(ADDR_W-DIM_W){1'b0}}, cfg_n_total_i};
    wire [ADDR_W-1:0] r_b_kblk_step_w  = r_b_row_stride_w << LOG2BLK;
    wire [ADDR_W-1:0] r_c_mblk_step_w  = {{(ADDR_W-DIM_W){1'b0}}, cfg_n_stride_i} << LOG2BLK;

    wire [DIM_W-1:0] m_blk_tiles_m1_w = (cfg_m_total_i >> LOG2BLK) - 1'b1;
    wire [DIM_W-1:0] n_blk_tiles_m1_w = (cfg_n_total_i >> LOG2BLK) - 1'b1;
    wire [DIM_W-1:0] k_blk_tiles_m1_w = (cfg_k_total_i >> LOG2BLK) - 1'b1;

    reg buf_ready_r [0:1];
    reg fetch_sel_r, compute_sel_r;

    // ===== COUNTERS & REGISTERS =====
    reg [DIM_W-1:0] f_m_blk_cnt_r, f_n_blk_cnt_r, f_k_blk_cnt_r;
    reg [ADDR_W-1:0] f_addr_a_mblk_r, f_addr_a_mk_r, f_addr_a_cur_r;
    reg [ADDR_W-1:0] f_addr_b_nblk_r, f_addr_b_kn_r, f_addr_b_cur_r;
    reg [8:0] a_cmd_row_r, a_recv_row_r; reg [3:0] a_beat_cnt_r; reg a_cmd_tx_r;
    reg [8:0] b_cmd_row_r, b_recv_row_r; reg [3:0] b_beat_cnt_r; reg b_cmd_tx_r;

    reg [DIM_W-1:0] c_m_blk_cnt_r, c_n_blk_cnt_r, c_k_blk_cnt_r;
    reg [ADDR_W-1:0] c_addr_c_mblk_r, c_addr_c_tile_r;
    reg [3:0] mi_cnt_r, ni_cnt_r;
    reg [7:0] a_col_k_r, b_step_k_r;
    reg a_send_done_r, b_send_done_r;
    reg [3:0] recv_row_r;

    reg [7:0] drain_row_r; reg [3:0] drain_ni_r;
    wire [3:0] drain_mi_w = drain_row_r[7:4]; wire [3:0] drain_row_sub_w = drain_row_r[3:0];
    reg [ADDR_W-1:0] r_addr_c_drow_r, r_addr_c_cur_r;

    // =========================================================================
    // XPM MEMORY INSTANTIATIONS (BRAM & URAM)
    // =========================================================================
    
    // -- 1. GBUFA (16 Block RAMs chạy song song) --
    wire [127:0] gbufa_dout_w [0:N-1];
    reg  core_a_tvalid_d1_r, core_a_tlast_d1_r;
    reg [3:0] a_rd_byte_d1_r;
    wire core_a_tready_w;
    
    genvar gr;
    generate
        for (gr=0; gr<N; gr=gr+1) begin : GBUFA_BANKS
            wire wea_w = (fetch_state_r == F_A_DATA && mm2s_tvalid && (a_recv_row_r[3:0] == gr));
            xpm_memory_sdpram #(
                .ADDR_WIDTH_A(9), .ADDR_WIDTH_B(9),
                .WRITE_DATA_WIDTH_A(128), .READ_DATA_WIDTH_B(128),
                .MEMORY_SIZE(128 * 512), .READ_LATENCY_B(1), .MEMORY_PRIMITIVE("block"),
                .WRITE_MODE_B("read_first") // [FIX LỖI 8-6058] Bổ sung cấu hình Write Mode B
            ) u_gbufA (
                .clka(CLK_i), .clkb(CLK_i), .ena(1'b1), 
                .enb(core_a_tready_w || !core_a_tvalid_d1_r), // Đóng băng xuất dữ liệu khi bị stall
                .wea(wea_w), .addra({fetch_sel_r, a_recv_row_r[7:4], a_beat_cnt_r}), .dina(mm2s_tdata),
                .addrb({compute_sel_r, mi_cnt_r, a_col_k_r[7:4]}), .doutb(gbufa_dout_w[gr]),
                .sleep(1'b0), .regceb(1'b1), .injectsbiterra(1'b0), .injectdbiterra(1'b0)
            );
        end
    endgenerate

    wire [N*8-1:0] core_a_tdata_w;
    generate
        for (gr=0; gr<N; gr=gr+1) begin : GBUFA_MUX
            assign core_a_tdata_w[gr*8 +: 8] = gbufa_dout_w[gr][ a_rd_byte_d1_r*8 +: 8 ];
        end
    endgenerate

    // -- 2. GBUFB (1 Block RAM lớn) --
    wire [127:0] core_b_tdata_w;
    reg core_b_tvalid_d1_r, core_b_tlast_d1_r;
    wire core_b_tready_w;
    wire we_b_w = (fetch_state_r == F_B_DATA && mm2s_tvalid);

    xpm_memory_sdpram #(
        .ADDR_WIDTH_A(13), .ADDR_WIDTH_B(13),
        .WRITE_DATA_WIDTH_A(128), .READ_DATA_WIDTH_B(128),
        .MEMORY_SIZE(128 * 8192), .READ_LATENCY_B(1), .MEMORY_PRIMITIVE("block"),
        .WRITE_MODE_B("read_first") // [FIX LỖI 8-6058] Bổ sung cấu hình Write Mode B
    ) u_gbufB (
        .clka(CLK_i), .clkb(CLK_i), .ena(1'b1), 
        .enb(core_b_tready_w || !core_b_tvalid_d1_r),
        .wea(we_b_w), .addra({fetch_sel_r, b_beat_cnt_r, b_recv_row_r[7:0]}), .dina(mm2s_tdata),
        .addrb({compute_sel_r, ni_cnt_r, b_step_k_r}), .doutb(core_b_tdata_w),
        .sleep(1'b0), .regceb(1'b1), .injectsbiterra(1'b0), .injectdbiterra(1'b0)
    );

    // -- 3. PIPELINE FSM ĐÃ FIX ĐỒNG BỘ (Độ trễ 1 Clock chống tràn) --
    reg a_req_done_r, b_req_done_r;
    wire req_a_w = (compute_state_r == C_FEED_AB) && !a_req_done_r;
    wire req_b_w = (compute_state_r == C_FEED_AB) && !b_req_done_r;

    always @(posedge CLK_i) begin
        if (!RST_i) begin
            core_a_tvalid_d1_r <= 0; core_b_tvalid_d1_r <= 0;
            a_send_done_r <= 0; b_send_done_r <= 0;
            a_req_done_r <= 0; b_req_done_r <= 0;
            a_col_k_r <= 0; b_step_k_r <= 0;
        end else begin
            if (compute_state_r == C_WAIT_SLOT || compute_state_r == C_RECV) begin
                a_send_done_r <= 0; b_send_done_r <= 0;
                a_req_done_r <= 0; b_req_done_r <= 0;
                a_col_k_r <= 0; b_step_k_r <= 0;
                core_a_tvalid_d1_r <= 0; core_b_tvalid_d1_r <= 0;
            end else begin
                // Băng chuyền A (Handshake AXI an toàn)
                if (core_a_tready_w || !core_a_tvalid_d1_r) begin
                    if (req_a_w) begin
                        core_a_tvalid_d1_r <= 1'b1;
                        core_a_tlast_d1_r  <= (a_col_k_r == KCOL_MINUS1);
                        a_rd_byte_d1_r     <= a_col_k_r[3:0];
                        if (a_col_k_r == KCOL_MINUS1) a_req_done_r <= 1'b1;
                        a_col_k_r <= a_col_k_r + 8'd1;
                    end else begin
                        core_a_tvalid_d1_r <= 1'b0;
                    end
                end
                if (core_a_tvalid_d1_r && core_a_tready_w && core_a_tlast_d1_r) a_send_done_r <= 1'b1;

                // Băng chuyền B (Handshake AXI an toàn)
                if (core_b_tready_w || !core_b_tvalid_d1_r) begin
                    if (req_b_w) begin
                        core_b_tvalid_d1_r <= 1'b1;
                        core_b_tlast_d1_r  <= (b_step_k_r == KCOL_MINUS1);
                        if (b_step_k_r == KCOL_MINUS1) b_req_done_r <= 1'b1;
                        b_step_k_r <= b_step_k_r + 8'd1;
                    end else begin
                        core_b_tvalid_d1_r <= 1'b0;
                    end
                end
                if (core_b_tvalid_d1_r && core_b_tready_w && core_b_tlast_d1_r) b_send_done_r <= 1'b1;
            end
        end
    end

    // -- 4. C_ACCUM (Tối ưu dùng UltraRAM do kích thước 2Mb) --
    wire [511:0] c_accum_dout_w;
    reg  c_valid_d1_r, c_last_d1_r, c_k_0_d1_r;
    reg  [11:0] c_addr_d1_r;
    reg  [511:0] c_data_d1_r;
    wire [511:0] core_c32_tdata_w;
    wire core_c32_tvalid_w, core_c32_tlast_w, core_c32_tuser_w;
    
    // [FIX LỖI CỜ READY]: Ép chỉ nhận data khi FSM đang ở State C_RECV
    wire core_c32_tready_w;
    assign core_c32_tready_w = (compute_state_r == C_RECV);

    always @(posedge CLK_i) begin
        if (!RST_i) begin
            c_valid_d1_r <= 0; 
        end else begin
            if (compute_state_r == C_RECV) begin
                c_valid_d1_r <= core_c32_tvalid_w;
                c_data_d1_r  <= core_c32_tdata_w;
                c_last_d1_r  <= core_c32_tlast_w;
                c_addr_d1_r  <= {mi_cnt_r, ni_cnt_r, recv_row_r};
                // [BUG FIX 2] c_k_0_d1_r chỉ = 1 khi đang accumulate K-block 0.
                // Cập nhật mỗi cycle trong C_RECV để nó luôn phản ánh đúng c_k_blk_cnt_r.
                c_k_0_d1_r   <= (c_k_blk_cnt_r == 0);
            end else begin
                c_valid_d1_r <= 0;
                // [BUG FIX 2] Khi rời C_RECV (ví dụ sang C_RELEASE), clear c_k_0_d1_r = 0.
                // Điều này ngăn edge case: nếu C_RECV K-block 1 bắt đầu và c_valid_d1_r
                // vẫn còn pipeline từ chu kỳ trước, c_k_0_d1_r phải = 0 để ACCUMULATE.
                if (compute_state_r == C_RELEASE || compute_state_r == C_WAIT_SLOT ||
                    compute_state_r == C_FEED_AB) begin
                    c_k_0_d1_r <= 1'b0;
                end
            end
        end
    end

    // [FIXED] Khai báo genvar gc để cộng dồn
    wire [511:0] c_new_row_w;
    genvar gc;
    generate
        for (gc = 0; gc < N; gc = gc + 1) begin : CACC_ADD
            assign c_new_row_w[gc*32 +: 32] = c_k_0_d1_r ? c_data_d1_r[gc*32 +: 32] :
                   $signed(c_accum_dout_w[gc*32 +: 32]) + $signed(c_data_d1_r[gc*32 +: 32]);
        end
    endgenerate

    // C_RD_ADDR tự động Prefetch chính xác trước 1 nhịp
    wire [11:0] c_rd_addr_w = (compute_state_r == C_DRAIN_PREFETCH || compute_state_r == C_DRAIN_FEED) 
                            ? {drain_mi_w, drain_ni_r, drain_row_sub_w} : {mi_cnt_r, ni_cnt_r, recv_row_r};

    xpm_memory_sdpram #(
        .ADDR_WIDTH_A(12), .ADDR_WIDTH_B(12),
        .WRITE_DATA_WIDTH_A(512), .READ_DATA_WIDTH_B(512),
        .MEMORY_SIZE(512 * 4096), .READ_LATENCY_B(1), .MEMORY_PRIMITIVE("ultra"), // Ép chạy UltraRAM
        .WRITE_MODE_B("read_first") // [FIX LỖI 8-6058] Bổ sung cấu hình Write Mode B cho UltraRAM
    ) u_c_accum (
        .clka(CLK_i), .clkb(CLK_i), .ena(1'b1), .enb(1'b1),
        .wea(c_valid_d1_r), .addra(c_addr_d1_r), .dina(c_new_row_w),
        .addrb(c_rd_addr_w), .doutb(c_accum_dout_w),
        .sleep(1'b0), .regceb(1'b1), .injectsbiterra(1'b0), .injectdbiterra(1'b0)
    );

    // =========================================================================
    // COMPUTE L3 CORE & RESCALE (XUẤT KẾT QUẢ)
    // =========================================================================
    gemm_compute_core #(
        .N(N), .DATA_WIDTH(8), .FIFO_DEPTH(FIFO_DEPTH), .BRAM_DEPTH(BRAM_DEPTH)
    ) u_gemm_compute_core (
        .CLK_i(CLK_i), .RST_i(RST_i),
        .k_dim_i({{(32-DIM_W){1'b0}}, cfg_k_dim_i}), .num_k_tiles_i({{(32-DIM_W){1'b0}}, cfg_num_k_tiles_per_block_i}),
        .s_axis_a_tdata_i(core_a_tdata_w), .s_axis_a_tvalid_i(core_a_tvalid_d1_r), .s_axis_a_tready_o(core_a_tready_w), .s_axis_a_tlast_i(core_a_tlast_d1_r),
        .s_axis_b_tdata_i(core_b_tdata_w), .s_axis_b_tvalid_i(core_b_tvalid_d1_r), .s_axis_b_tready_o(core_b_tready_w), .s_axis_b_tlast_i(core_b_tlast_d1_r),
        .m_axis_c32_tdata_o(core_c32_tdata_w), .m_axis_c32_tvalid_o(core_c32_tvalid_w), .m_axis_c32_tready_i(core_c32_tready_w), .m_axis_c32_tlast_o(core_c32_tlast_w), .m_axis_c32_tuser_o(core_c32_tuser_w)
    );

    reg  [N*32-1:0] rescale_s_tdata_r; reg rescale_s_tvalid_r; wire rescale_s_tready_w;
    wire [N*8-1:0]  rescale_m_tdata_w; wire rescale_m_tvalid_w; reg rescale_m_tready_r;

    int32_int8_rescale #(.N(N)) u_int32_int8_rescale (
        .CLK_i(CLK_i), .RST_i(RST_i), .scale_shift_i(cfg_scale_shift_i), .zero_point_i(cfg_zero_point_i),
        .s_axis_tdata_i(rescale_s_tdata_r), .s_axis_tvalid_i(rescale_s_tvalid_r), .s_axis_tready_o(rescale_s_tready_w), .s_axis_tlast_i(1'b0), .s_axis_tuser_i(1'b0),
        .m_axis_tdata_o(rescale_m_tdata_w), .m_axis_tvalid_o(rescale_m_tvalid_w), .m_axis_tready_i(rescale_m_tready_r), .m_axis_tlast_o(), .m_axis_tuser_o()
    );

    assign s2mm_tkeep     = {N{1'b1}};
    assign s2mm_sts_tready = 1'b1;   // Luôn sẵn sàng nhận status, nhưng bây giờ ta ĐẾM chúng
    assign mm2s_tready    = (fetch_state_r == F_A_DATA) ? 1'b1 : (fetch_state_r == F_B_DATA) ? 1'b1 : 1'b0;

    function automatic [71:0] mk_cmd;
        input [ADDR_W-1:0] addr; input [22:0] btt;
        begin mk_cmd = {4'b0, 4'b0, addr, 1'b0, 1'b1, 6'b0, 1'b1, btt}; end
    endfunction

    // =========================================================================
    // MAIN FSM LOGIC
    // =========================================================================
    always @(posedge CLK_i) begin
        if (!RST_i) begin
            fetch_state_r <= F_IDLE; compute_state_r <= C_IDLE;
            busy_o <= 0; done_o <= 0;
            mm2s_cmd_tvalid <= 0; s2mm_cmd_tvalid <= 0; s2mm_tvalid <= 0; s2mm_tlast <= 0;
            rescale_s_tvalid_r <= 0; rescale_m_tready_r <= 0;
            buf_ready_r[0] <= 0; buf_ready_r[1] <= 0; fetch_sel_r <= 0; compute_sel_r <= 0;
            s2mm_sts_expected_r <= 0; s2mm_sts_received_r <= 0;
        end else begin
            done_o <= 1'b0;

            // ---------------------------------------------------------------
            // [BUG FIX 1] Đếm s2mm_sts_tvalid để biết khi nào DMA thực sự xong
            // ---------------------------------------------------------------
            if (s2mm_sts_tvalid) begin
                s2mm_sts_received_r <= s2mm_sts_received_r + 16'd1;
            end

            // --- FETCH PROCESS ---
            case (fetch_state_r)
                F_IDLE: begin
                    if (start_i) begin
                        f_m_blk_cnt_r <= 0; f_n_blk_cnt_r <= 0; f_k_blk_cnt_r <= 0;
                        f_addr_a_mblk_r <= cfg_base_a_i; f_addr_a_mk_r <= cfg_base_a_i; f_addr_a_cur_r <= cfg_base_a_i;
                        f_addr_b_nblk_r <= cfg_base_b_i; f_addr_b_kn_r <= cfg_base_b_i; f_addr_b_cur_r <= cfg_base_b_i;
                        fetch_sel_r <= 0; buf_ready_r[0] <= 0; buf_ready_r[1] <= 0;
                        fetch_state_r <= F_WAIT_SLOT;
                    end
                end
                F_WAIT_SLOT: begin
                    if (!buf_ready_r[fetch_sel_r]) begin
                        a_cmd_row_r <= 0; a_recv_row_r <= 0; a_beat_cnt_r <= 0; a_cmd_tx_r <= 0; fetch_state_r <= F_A_CMD;
                    end
                end
                F_A_CMD, F_A_DATA: begin
                    if (fetch_state_r == F_A_CMD) fetch_state_r <= F_A_DATA;
                    if (!a_cmd_tx_r && (a_cmd_row_r < M_BLK_ADDR[8:0])) begin
                        a_cmd_tx_r <= 1; mm2s_cmd_tvalid <= 1; mm2s_cmd_tdata <= mk_cmd(f_addr_a_cur_r, K_BLK_ADDR[22:0]);
                    end
                    if (a_cmd_tx_r && mm2s_cmd_tready) begin
                        mm2s_cmd_tvalid <= 0; a_cmd_tx_r <= 0; a_cmd_row_r <= a_cmd_row_r + 1; f_addr_a_cur_r <= f_addr_a_cur_r + r_a_row_stride_w;
                    end
                    if (mm2s_tvalid) begin
                        if (mm2s_tlast) begin
                            a_beat_cnt_r <= 0;
                            if (a_recv_row_r == MBLK_MINUS1) begin
                                mm2s_cmd_tvalid <= 0; b_cmd_row_r <= 0; b_recv_row_r <= 0; b_beat_cnt_r <= 0; b_cmd_tx_r <= 0;
                                fetch_state_r <= F_B_CMD;
                            end else a_recv_row_r <= a_recv_row_r + 1;
                        end else a_beat_cnt_r <= a_beat_cnt_r + 1;
                    end
                end
                F_B_CMD, F_B_DATA: begin
                    if (fetch_state_r == F_B_CMD) fetch_state_r <= F_B_DATA;
                    if (!b_cmd_tx_r && (b_cmd_row_r < K_BLK_ADDR[8:0])) begin
                        b_cmd_tx_r <= 1; mm2s_cmd_tvalid <= 1; mm2s_cmd_tdata <= mk_cmd(f_addr_b_cur_r, N_BLK_ADDR[22:0]);
                    end
                    if (b_cmd_tx_r && mm2s_cmd_tready) begin
                        mm2s_cmd_tvalid <= 0; b_cmd_tx_r <= 0; b_cmd_row_r <= b_cmd_row_r + 1; f_addr_b_cur_r <= f_addr_b_cur_r + r_b_row_stride_w;
                    end
                    if (mm2s_tvalid) begin
                        if (mm2s_tlast) begin
                            b_beat_cnt_r <= 0;
                            if (b_recv_row_r == KBLK_MINUS1) begin
                                mm2s_cmd_tvalid <= 0; buf_ready_r[fetch_sel_r] <= 1;
                                if (f_k_blk_cnt_r < k_blk_tiles_m1_w) begin
                                    f_k_blk_cnt_r <= f_k_blk_cnt_r + 1;
                                    f_addr_a_mk_r <= f_addr_a_mk_r + K_BLK_ADDR; f_addr_a_cur_r <= f_addr_a_mk_r + K_BLK_ADDR;
                                    f_addr_b_kn_r <= f_addr_b_kn_r + r_b_kblk_step_w; f_addr_b_cur_r <= f_addr_b_kn_r + r_b_kblk_step_w;
                                    fetch_sel_r <= !fetch_sel_r; fetch_state_r <= F_WAIT_SLOT;
                                end else if (f_n_blk_cnt_r < n_blk_tiles_m1_w) begin
                                    f_k_blk_cnt_r <= 0; f_n_blk_cnt_r <= f_n_blk_cnt_r + 1;
                                    f_addr_b_nblk_r <= f_addr_b_nblk_r + N_BLK_ADDR; f_addr_b_kn_r <= f_addr_b_nblk_r + N_BLK_ADDR; f_addr_b_cur_r <= f_addr_b_nblk_r + N_BLK_ADDR;
                                    f_addr_a_mk_r <= f_addr_a_mblk_r; f_addr_a_cur_r <= f_addr_a_mblk_r;
                                    fetch_sel_r <= !fetch_sel_r; fetch_state_r <= F_WAIT_SLOT;
                                end else if (f_m_blk_cnt_r < m_blk_tiles_m1_w) begin
                                    f_k_blk_cnt_r <= 0; f_n_blk_cnt_r <= 0; f_m_blk_cnt_r <= f_m_blk_cnt_r + 1;
                                    f_addr_a_mblk_r <= f_addr_a_mblk_r + r_a_mblk_step_w; f_addr_a_mk_r <= f_addr_a_mblk_r + r_a_mblk_step_w; f_addr_a_cur_r <= f_addr_a_mblk_r + r_a_mblk_step_w;
                                    f_addr_b_nblk_r <= cfg_base_b_i; f_addr_b_kn_r <= cfg_base_b_i; f_addr_b_cur_r <= cfg_base_b_i;
                                    fetch_sel_r <= !fetch_sel_r; fetch_state_r <= F_WAIT_SLOT;
                                end else fetch_state_r <= F_DONE;
                            end else b_recv_row_r <= b_recv_row_r + 1;
                        end else b_beat_cnt_r <= b_beat_cnt_r + 1;
                    end
                end
                F_DONE: begin
                    if (start_i) begin
                        f_m_blk_cnt_r <= 0; f_n_blk_cnt_r <= 0; f_k_blk_cnt_r <= 0;
                        f_addr_a_mblk_r <= cfg_base_a_i; f_addr_a_mk_r <= cfg_base_a_i; f_addr_a_cur_r <= cfg_base_a_i;
                        f_addr_b_nblk_r <= cfg_base_b_i; f_addr_b_kn_r <= cfg_base_b_i; f_addr_b_cur_r <= cfg_base_b_i;
                        fetch_sel_r <= 0; buf_ready_r[0] <= 0; buf_ready_r[1] <= 0; fetch_state_r <= F_WAIT_SLOT;
                    end
                end
            endcase

            // --- COMPUTE PROCESS ---
            case (compute_state_r)
                C_IDLE: begin
                    if (start_i) begin
                        busy_o <= 1; c_m_blk_cnt_r <= 0; c_n_blk_cnt_r <= 0; c_k_blk_cnt_r <= 0;
                        c_addr_c_mblk_r <= cfg_base_c_i; c_addr_c_tile_r <= cfg_base_c_i;
                        compute_sel_r <= 0; mi_cnt_r <= 0; ni_cnt_r <= 0; compute_state_r <= C_WAIT_SLOT;
                        // [BUG FIX 1] Reset counters khi bắt đầu run mới
                        s2mm_sts_expected_r <= 0; s2mm_sts_received_r <= 0;
                    end
                end
                C_WAIT_SLOT: begin
                    if (buf_ready_r[compute_sel_r]) compute_state_r <= C_FEED_AB;
                end
                C_FEED_AB: begin
                    if (a_send_done_r && b_send_done_r) begin
                        recv_row_r <= 0; compute_state_r <= C_RECV;
                    end
                end
                C_RECV: begin
                    if (core_c32_tvalid_w) begin
                        if (core_c32_tlast_w) begin
                            if (ni_cnt_r < NI_MINUS1) begin
                                ni_cnt_r <= ni_cnt_r + 1; compute_state_r <= C_FEED_AB;
                            end else if (mi_cnt_r < MI_MINUS1) begin
                                mi_cnt_r <= mi_cnt_r + 1; ni_cnt_r <= 0; compute_state_r <= C_FEED_AB;
                            end else compute_state_r <= C_RELEASE;
                        end else recv_row_r <= recv_row_r + 1;
                    end
                end
                C_RELEASE: begin
                    buf_ready_r[compute_sel_r] <= 0; compute_sel_r <= !compute_sel_r; mi_cnt_r <= 0; ni_cnt_r <= 0;
                    if (c_k_blk_cnt_r < k_blk_tiles_m1_w) begin
                        c_k_blk_cnt_r <= c_k_blk_cnt_r + 1; compute_state_r <= C_WAIT_SLOT;
                    end else begin
                        drain_row_r <= 0; drain_ni_r <= 0; r_addr_c_drow_r <= c_addr_c_tile_r;
                        compute_state_r <= C_DRAIN_PREFETCH;
                    end
                end
                C_DRAIN_PREFETCH: begin
                    compute_state_r <= C_DRAIN_FEED;
                end
                C_DRAIN_FEED: begin
                    if (!rescale_s_tvalid_r) begin
                        rescale_s_tvalid_r <= 1; rescale_s_tdata_r <= c_accum_dout_w;
                    end else if (rescale_s_tready_w) begin
                        rescale_s_tvalid_r <= 0; rescale_m_tready_r <= 1; compute_state_r <= C_DRAIN_WAIT;
                    end
                end
                C_DRAIN_WAIT: begin
                    if (rescale_m_tvalid_w && rescale_m_tready_r) begin
                        rescale_m_tready_r <= 0;
                        r_addr_c_cur_r <= r_addr_c_drow_r + ({{(ADDR_W-4){1'b0}}, drain_ni_r} << 4);
                        s2mm_tdata <= rescale_m_tdata_w; compute_state_r <= C_DRAIN_CMD;
                    end
                end
                C_DRAIN_CMD: begin
                    if (!s2mm_cmd_tvalid) begin
                        s2mm_cmd_tvalid <= 1; s2mm_cmd_tdata <= mk_cmd(r_addr_c_cur_r, {17'b0, N[5:0]});
                    end else if (s2mm_cmd_tready) begin
                        s2mm_cmd_tvalid <= 0; s2mm_tvalid <= 1; s2mm_tlast <= 1; compute_state_r <= C_DRAIN_DATA;
                    end
                end
                C_DRAIN_DATA: begin
                    if (s2mm_tready) begin
                        s2mm_tvalid <= 0; s2mm_tlast <= 0;
                        // [BUG FIX 1] Ghi nhận ta vừa issue 1 DMA S2MM write
                        s2mm_sts_expected_r <= s2mm_sts_expected_r + 16'd1;
                        if (drain_ni_r < NI_MINUS1) begin
                            drain_ni_r <= drain_ni_r + 1; compute_state_r <= C_DRAIN_PREFETCH;
                        end else if (drain_row_r != 8'd255) begin
                            drain_ni_r <= 0; drain_row_r <= drain_row_r + 1;
                            r_addr_c_drow_r <= r_addr_c_drow_r + {{(ADDR_W-DIM_W){1'b0}}, cfg_n_stride_i};
                            compute_state_r <= C_DRAIN_PREFETCH;
                        end else compute_state_r <= C_NEXT_BLOCK;
                    end
                end
                C_NEXT_BLOCK: begin
                    c_k_blk_cnt_r <= 0;
                    if (c_n_blk_cnt_r < n_blk_tiles_m1_w) begin
                        c_n_blk_cnt_r <= c_n_blk_cnt_r + 1; c_addr_c_tile_r <= c_addr_c_tile_r + N_BLK_ADDR; compute_state_r <= C_WAIT_SLOT;
                    end else if (c_m_blk_cnt_r < m_blk_tiles_m1_w) begin
                        c_m_blk_cnt_r <= c_m_blk_cnt_r + 1; c_n_blk_cnt_r <= 0;
                        c_addr_c_mblk_r <= c_addr_c_mblk_r + r_c_mblk_step_w; c_addr_c_tile_r <= c_addr_c_mblk_r + r_c_mblk_step_w;
                        compute_state_r <= C_WAIT_SLOT;
                    end else begin
                        // [BUG FIX 1] Không báo done_o ngay - chờ DMA S2MM flush hết trước
                        compute_state_r <= C_WAIT_STS;
                    end
                end
                // [BUG FIX 1] Trạng thái mới: chờ tất cả DMA S2MM writes được confirm
                // AXI DMA nhận s2mm_tvalid (data vào internal FIFO, s2mm_tready=1) nhưng
                // còn cần nhiều cycles để thực sự ghi vào DDR và phản hồi s2mm_sts_tvalid.
                // Phải đợi s2mm_sts_received_r == s2mm_sts_expected_r trước khi báo done_o.
                C_WAIT_STS: begin
                    if (s2mm_sts_received_r == s2mm_sts_expected_r) begin
                        compute_state_r <= C_DONE_ST;
                    end
                end
                C_DONE_ST: begin
                    done_o <= 1; busy_o <= 0; compute_state_r <= C_IDLE;
                end
            endcase
        end
    end

endmodule
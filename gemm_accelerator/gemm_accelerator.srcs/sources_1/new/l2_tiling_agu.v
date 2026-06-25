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
    input  wire           aclk,
    input  wire           aresetn,

    input  wire [DIM_W-1:0]   cfg_m_total,
    input  wire [DIM_W-1:0]   cfg_n_total,
    input  wire [DIM_W-1:0]   cfg_k_total,
    input  wire [DIM_W-1:0]   cfg_k_dim,
    input  wire [DIM_W-1:0]   cfg_num_k_tiles_per_block,
    input  wire [ADDR_W-1:0]  cfg_base_a,
    input  wire [ADDR_W-1:0]  cfg_base_b,
    input  wire [ADDR_W-1:0]  cfg_base_c,
    input  wire [DIM_W-1:0]   cfg_n_stride,
    input  wire [4:0]          cfg_scale_shift,
    input  wire [7:0]          cfg_zero_point,

    input  wire   start,
    output reg    busy,
    output reg    done,

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
    // FSM cũ báo done ngay khi DRAIN_DATA cuối hoàn thành, nhưng AXI DMA S2MM
    // vẫn đang commit data vào DDR. Phải đếm s2mm_sts_tvalid và chờ cho đến
    // khi tất cả write được xác nhận.
    //
    // Tổng drain ops mỗi output block = M_BLK * (N_BLK/N) = 256 * 16 = 4096
    // Tổng blocks = (M/M_BLK) * (N/N_BLK) - được tính tự động từ FSM.
    // Ta dùng 1 counter tổng thể cho toàn bộ run, reset khi start.
    // =========================================================================
    reg  [15:0] s2mm_sts_expected;   // Tổng số DMA writes cần confirm
    reg  [15:0] s2mm_sts_received;   // Số DMA writes đã được confirm

    reg [3:0] fetch_state, compute_state;

    wire [ADDR_W-1:0] r_a_row_stride = {{(ADDR_W-DIM_W){1'b0}}, cfg_k_total};
    wire [ADDR_W-1:0] r_a_mblk_step  = r_a_row_stride << LOG2BLK;
    wire [ADDR_W-1:0] r_b_row_stride = {{(ADDR_W-DIM_W){1'b0}}, cfg_n_total};
    wire [ADDR_W-1:0] r_b_kblk_step  = r_b_row_stride << LOG2BLK;
    wire [ADDR_W-1:0] r_c_mblk_step  = {{(ADDR_W-DIM_W){1'b0}}, cfg_n_stride} << LOG2BLK;

    wire [DIM_W-1:0] m_blk_tiles_m1 = (cfg_m_total >> LOG2BLK) - 1'b1;
    wire [DIM_W-1:0] n_blk_tiles_m1 = (cfg_n_total >> LOG2BLK) - 1'b1;
    wire [DIM_W-1:0] k_blk_tiles_m1 = (cfg_k_total >> LOG2BLK) - 1'b1;

    reg buf_ready [0:1];
    reg fetch_sel, compute_sel;

    // ===== COUNTERS & REGISTERS =====
    reg [DIM_W-1:0] f_m_blk_cnt, f_n_blk_cnt, f_k_blk_cnt;
    reg [ADDR_W-1:0] f_addr_a_mblk, f_addr_a_mk, f_addr_a_cur;
    reg [ADDR_W-1:0] f_addr_b_nblk, f_addr_b_kn, f_addr_b_cur;
    reg [8:0] a_cmd_row, a_recv_row; reg [3:0] a_beat_cnt; reg a_cmd_tx;
    reg [8:0] b_cmd_row, b_recv_row; reg [3:0] b_beat_cnt; reg b_cmd_tx;

    reg [DIM_W-1:0] c_m_blk_cnt, c_n_blk_cnt, c_k_blk_cnt;
    reg [ADDR_W-1:0] c_addr_c_mblk, c_addr_c_tile;
    reg [3:0] mi_cnt, ni_cnt;
    reg [7:0] a_col_k, b_step_k;
    reg a_send_done, b_send_done;
    reg [3:0] recv_row;

    reg [7:0] drain_row; reg [3:0] drain_ni;
    wire [3:0] drain_mi = drain_row[7:4]; wire [3:0] drain_row_sub = drain_row[3:0];
    reg [ADDR_W-1:0] r_addr_c_drow, r_addr_c_cur;

    // =========================================================================
    // XPM MEMORY INSTANTIATIONS (BRAM & URAM)
    // =========================================================================
    
    // -- 1. GBUFA (16 Block RAMs chạy song song) --
    wire [127:0] gbufa_dout [0:N-1];
    reg  core_a_tvalid_d1, core_a_tlast_d1;
    reg [3:0] a_rd_byte_d1;
    wire core_a_tready;
    
    genvar gr;
    generate
        for (gr=0; gr<N; gr=gr+1) begin : GBUFA_BANKS
            wire wea = (fetch_state == F_A_DATA && mm2s_tvalid && (a_recv_row[3:0] == gr));
            xpm_memory_sdpram #(
                .ADDR_WIDTH_A(9), .ADDR_WIDTH_B(9),
                .WRITE_DATA_WIDTH_A(128), .READ_DATA_WIDTH_B(128),
                .MEMORY_SIZE(128 * 512), .READ_LATENCY_B(1), .MEMORY_PRIMITIVE("block"),
                .WRITE_MODE_B("read_first") // [FIX LỖI 8-6058] Bổ sung cấu hình Write Mode B
            ) u_gbufA (
                .clka(aclk), .clkb(aclk), .ena(1'b1), 
                .enb(core_a_tready || !core_a_tvalid_d1), // Đóng băng xuất dữ liệu khi bị stall
                .wea(wea), .addra({fetch_sel, a_recv_row[7:4], a_beat_cnt}), .dina(mm2s_tdata),
                .addrb({compute_sel, mi_cnt, a_col_k[7:4]}), .doutb(gbufa_dout[gr]),
                .sleep(1'b0), .regceb(1'b1), .injectsbiterra(1'b0), .injectdbiterra(1'b0)
            );
        end
    endgenerate

    wire [N*8-1:0] core_a_tdata_w;
    generate
        for (gr=0; gr<N; gr=gr+1) begin : GBUFA_MUX
            assign core_a_tdata_w[gr*8 +: 8] = gbufa_dout[gr][ a_rd_byte_d1*8 +: 8 ];
        end
    endgenerate

    // -- 2. GBUFB (1 Block RAM lớn) --
    wire [127:0] core_b_tdata_w;
    reg core_b_tvalid_d1, core_b_tlast_d1;
    wire core_b_tready;
    wire we_b = (fetch_state == F_B_DATA && mm2s_tvalid);

    xpm_memory_sdpram #(
        .ADDR_WIDTH_A(13), .ADDR_WIDTH_B(13),
        .WRITE_DATA_WIDTH_A(128), .READ_DATA_WIDTH_B(128),
        .MEMORY_SIZE(128 * 8192), .READ_LATENCY_B(1), .MEMORY_PRIMITIVE("block"),
        .WRITE_MODE_B("read_first") // [FIX LỖI 8-6058] Bổ sung cấu hình Write Mode B
    ) u_gbufB (
        .clka(aclk), .clkb(aclk), .ena(1'b1), 
        .enb(core_b_tready || !core_b_tvalid_d1),
        .wea(we_b), .addra({fetch_sel, b_beat_cnt, b_recv_row[7:0]}), .dina(mm2s_tdata),
        .addrb({compute_sel, ni_cnt, b_step_k}), .doutb(core_b_tdata_w),
        .sleep(1'b0), .regceb(1'b1), .injectsbiterra(1'b0), .injectdbiterra(1'b0)
    );

    // -- 3. PIPELINE FSM ĐÃ FIX ĐỒNG BỘ (Độ trễ 1 Clock chống tràn) --
    reg a_req_done, b_req_done;
    wire req_a = (compute_state == C_FEED_AB) && !a_req_done;
    wire req_b = (compute_state == C_FEED_AB) && !b_req_done;

    always @(posedge aclk) begin
        if (!aresetn) begin
            core_a_tvalid_d1 <= 0; core_b_tvalid_d1 <= 0;
            a_send_done <= 0; b_send_done <= 0;
            a_req_done <= 0; b_req_done <= 0;
            a_col_k <= 0; b_step_k <= 0;
        end else begin
            if (compute_state == C_WAIT_SLOT || compute_state == C_RECV) begin
                a_send_done <= 0; b_send_done <= 0;
                a_req_done <= 0; b_req_done <= 0;
                a_col_k <= 0; b_step_k <= 0;
                core_a_tvalid_d1 <= 0; core_b_tvalid_d1 <= 0;
            end else begin
                // Băng chuyền A (Handshake AXI an toàn)
                if (core_a_tready || !core_a_tvalid_d1) begin
                    if (req_a) begin
                        core_a_tvalid_d1 <= 1'b1;
                        core_a_tlast_d1  <= (a_col_k == KCOL_MINUS1);
                        a_rd_byte_d1     <= a_col_k[3:0];
                        if (a_col_k == KCOL_MINUS1) a_req_done <= 1'b1;
                        a_col_k <= a_col_k + 8'd1;
                    end else begin
                        core_a_tvalid_d1 <= 1'b0;
                    end
                end
                if (core_a_tvalid_d1 && core_a_tready && core_a_tlast_d1) a_send_done <= 1'b1;

                // Băng chuyền B (Handshake AXI an toàn)
                if (core_b_tready || !core_b_tvalid_d1) begin
                    if (req_b) begin
                        core_b_tvalid_d1 <= 1'b1;
                        core_b_tlast_d1  <= (b_step_k == KCOL_MINUS1);
                        if (b_step_k == KCOL_MINUS1) b_req_done <= 1'b1;
                        b_step_k <= b_step_k + 8'd1;
                    end else begin
                        core_b_tvalid_d1 <= 1'b0;
                    end
                end
                if (core_b_tvalid_d1 && core_b_tready && core_b_tlast_d1) b_send_done <= 1'b1;
            end
        end
    end

    // -- 4. C_ACCUM (Tối ưu dùng UltraRAM do kích thước 2Mb) --
    wire [511:0] c_accum_dout;
    reg  c_valid_d1, c_last_d1, c_k_0_d1;
    reg  [11:0] c_addr_d1;
    reg  [511:0] c_data_d1;
    wire [511:0] core_c32_tdata;
    wire core_c32_tvalid, core_c32_tlast, core_c32_tuser;
    
    // [FIX LỖI CỜ READY]: Ép chỉ nhận data khi FSM đang ở State C_RECV
    wire core_c32_tready;
    assign core_c32_tready = (compute_state == C_RECV);

    always @(posedge aclk) begin
        if (!aresetn) begin
            c_valid_d1 <= 0; 
        end else begin
            if (compute_state == C_RECV) begin
                c_valid_d1 <= core_c32_tvalid;
                c_data_d1  <= core_c32_tdata;
                c_last_d1  <= core_c32_tlast;
                c_addr_d1  <= {mi_cnt, ni_cnt, recv_row};
                // [BUG FIX 2] c_k_0_d1 chỉ = 1 khi đang accumulate K-block 0.
                // Cập nhật mỗi cycle trong C_RECV để nó luôn phản ánh đúng c_k_blk_cnt.
                c_k_0_d1   <= (c_k_blk_cnt == 0);
            end else begin
                c_valid_d1 <= 0;
                // [BUG FIX 2] Khi rời C_RECV (ví dụ sang C_RELEASE), clear c_k_0_d1 = 0.
                // Điều này ngăn edge case: nếu C_RECV K-block 1 bắt đầu và c_valid_d1
                // vẫn còn pipeline từ chu kỳ trước, c_k_0_d1 phải = 0 để ACCUMULATE.
                if (compute_state == C_RELEASE || compute_state == C_WAIT_SLOT ||
                    compute_state == C_FEED_AB) begin
                    c_k_0_d1 <= 1'b0;
                end
            end
        end
    end

    // [FIXED] Khai báo genvar gc để cộng dồn
    wire [511:0] c_new_row;
    genvar gc;
    generate
        for (gc = 0; gc < N; gc = gc + 1) begin : CACC_ADD
            assign c_new_row[gc*32 +: 32] = c_k_0_d1 ? c_data_d1[gc*32 +: 32] :
                   $signed(c_accum_dout[gc*32 +: 32]) + $signed(c_data_d1[gc*32 +: 32]);
        end
    endgenerate

    // C_RD_ADDR tự động Prefetch chính xác trước 1 nhịp
    wire [11:0] c_rd_addr = (compute_state == C_DRAIN_PREFETCH || compute_state == C_DRAIN_FEED) 
                            ? {drain_mi, drain_ni, drain_row_sub} : {mi_cnt, ni_cnt, recv_row};

    xpm_memory_sdpram #(
        .ADDR_WIDTH_A(12), .ADDR_WIDTH_B(12),
        .WRITE_DATA_WIDTH_A(512), .READ_DATA_WIDTH_B(512),
        .MEMORY_SIZE(512 * 4096), .READ_LATENCY_B(1), .MEMORY_PRIMITIVE("ultra"), // Ép chạy UltraRAM
        .WRITE_MODE_B("read_first") // [FIX LỖI 8-6058] Bổ sung cấu hình Write Mode B cho UltraRAM
    ) u_c_accum (
        .clka(aclk), .clkb(aclk), .ena(1'b1), .enb(1'b1),
        .wea(c_valid_d1), .addra(c_addr_d1), .dina(c_new_row),
        .addrb(c_rd_addr), .doutb(c_accum_dout),
        .sleep(1'b0), .regceb(1'b1), .injectsbiterra(1'b0), .injectdbiterra(1'b0)
    );

    // =========================================================================
    // COMPUTE L3 CORE & RESCALE (XUẤT KẾT QUẢ)
    // =========================================================================
    gemm_compute_core #(
        .N(N), .DATA_WIDTH(8), .FIFO_DEPTH(FIFO_DEPTH), .BRAM_DEPTH(BRAM_DEPTH)
    ) u_core (
        .aclk(aclk), .aresetn(aresetn),
        .k_dim({{(32-DIM_W){1'b0}}, cfg_k_dim}), .num_k_tiles({{(32-DIM_W){1'b0}}, cfg_num_k_tiles_per_block}),
        .s_axis_a_tdata(core_a_tdata_w), .s_axis_a_tvalid(core_a_tvalid_d1), .s_axis_a_tready(core_a_tready), .s_axis_a_tlast(core_a_tlast_d1),
        .s_axis_b_tdata(core_b_tdata_w), .s_axis_b_tvalid(core_b_tvalid_d1), .s_axis_b_tready(core_b_tready), .s_axis_b_tlast(core_b_tlast_d1),
        .m_axis_c32_tdata(core_c32_tdata), .m_axis_c32_tvalid(core_c32_tvalid), .m_axis_c32_tready(core_c32_tready), .m_axis_c32_tlast(core_c32_tlast), .m_axis_c32_tuser(core_c32_tuser)
    );

    reg  [N*32-1:0] rescale_s_tdata; reg rescale_s_tvalid; wire rescale_s_tready;
    wire [N*8-1:0]  rescale_m_tdata; wire rescale_m_tvalid; reg rescale_m_tready;

    int32_int8_rescale #(.N(N)) u_rescale (
        .clk(aclk), .rst_n(aresetn), .scale_shift(cfg_scale_shift), .zero_point(cfg_zero_point),
        .s_axis_tdata(rescale_s_tdata), .s_axis_tvalid(rescale_s_tvalid), .s_axis_tready(rescale_s_tready), .s_axis_tlast(1'b0), .s_axis_tuser(1'b0),
        .m_axis_tdata(rescale_m_tdata), .m_axis_tvalid(rescale_m_tvalid), .m_axis_tready(rescale_m_tready), .m_axis_tlast(), .m_axis_tuser()
    );

    assign s2mm_tkeep     = {N{1'b1}};
    assign s2mm_sts_tready = 1'b1;   // Luôn sẵn sàng nhận status, nhưng bây giờ ta ĐẾM chúng
    assign mm2s_tready    = (fetch_state == F_A_DATA) ? 1'b1 : (fetch_state == F_B_DATA) ? 1'b1 : 1'b0;

    function automatic [71:0] mk_cmd;
        input [ADDR_W-1:0] addr; input [22:0] btt;
        begin mk_cmd = {4'b0, 4'b0, addr, 1'b0, 1'b1, 6'b0, 1'b1, btt}; end
    endfunction

    // =========================================================================
    // MAIN FSM LOGIC
    // =========================================================================
    always @(posedge aclk) begin
        if (!aresetn) begin
            fetch_state <= F_IDLE; compute_state <= C_IDLE;
            busy <= 0; done <= 0;
            mm2s_cmd_tvalid <= 0; s2mm_cmd_tvalid <= 0; s2mm_tvalid <= 0; s2mm_tlast <= 0;
            rescale_s_tvalid <= 0; rescale_m_tready <= 0;
            buf_ready[0] <= 0; buf_ready[1] <= 0; fetch_sel <= 0; compute_sel <= 0;
            s2mm_sts_expected <= 0; s2mm_sts_received <= 0;
        end else begin
            done <= 1'b0;

            // ---------------------------------------------------------------
            // [BUG FIX 1] Đếm s2mm_sts_tvalid để biết khi nào DMA thực sự xong
            // ---------------------------------------------------------------
            if (s2mm_sts_tvalid) begin
                s2mm_sts_received <= s2mm_sts_received + 16'd1;
            end

            // --- FETCH PROCESS ---
            case (fetch_state)
                F_IDLE: begin
                    if (start) begin
                        f_m_blk_cnt <= 0; f_n_blk_cnt <= 0; f_k_blk_cnt <= 0;
                        f_addr_a_mblk <= cfg_base_a; f_addr_a_mk <= cfg_base_a; f_addr_a_cur <= cfg_base_a;
                        f_addr_b_nblk <= cfg_base_b; f_addr_b_kn <= cfg_base_b; f_addr_b_cur <= cfg_base_b;
                        fetch_sel <= 0; buf_ready[0] <= 0; buf_ready[1] <= 0;
                        fetch_state <= F_WAIT_SLOT;
                    end
                end
                F_WAIT_SLOT: begin
                    if (!buf_ready[fetch_sel]) begin
                        a_cmd_row <= 0; a_recv_row <= 0; a_beat_cnt <= 0; a_cmd_tx <= 0; fetch_state <= F_A_CMD;
                    end
                end
                F_A_CMD, F_A_DATA: begin
                    if (fetch_state == F_A_CMD) fetch_state <= F_A_DATA;
                    if (!a_cmd_tx && (a_cmd_row < M_BLK_ADDR[8:0])) begin
                        a_cmd_tx <= 1; mm2s_cmd_tvalid <= 1; mm2s_cmd_tdata <= mk_cmd(f_addr_a_cur, K_BLK_ADDR[22:0]);
                    end
                    if (a_cmd_tx && mm2s_cmd_tready) begin
                        mm2s_cmd_tvalid <= 0; a_cmd_tx <= 0; a_cmd_row <= a_cmd_row + 1; f_addr_a_cur <= f_addr_a_cur + r_a_row_stride;
                    end
                    if (mm2s_tvalid) begin
                        if (mm2s_tlast) begin
                            a_beat_cnt <= 0;
                            if (a_recv_row == MBLK_MINUS1) begin
                                mm2s_cmd_tvalid <= 0; b_cmd_row <= 0; b_recv_row <= 0; b_beat_cnt <= 0; b_cmd_tx <= 0;
                                fetch_state <= F_B_CMD;
                            end else a_recv_row <= a_recv_row + 1;
                        end else a_beat_cnt <= a_beat_cnt + 1;
                    end
                end
                F_B_CMD, F_B_DATA: begin
                    if (fetch_state == F_B_CMD) fetch_state <= F_B_DATA;
                    if (!b_cmd_tx && (b_cmd_row < K_BLK_ADDR[8:0])) begin
                        b_cmd_tx <= 1; mm2s_cmd_tvalid <= 1; mm2s_cmd_tdata <= mk_cmd(f_addr_b_cur, N_BLK_ADDR[22:0]);
                    end
                    if (b_cmd_tx && mm2s_cmd_tready) begin
                        mm2s_cmd_tvalid <= 0; b_cmd_tx <= 0; b_cmd_row <= b_cmd_row + 1; f_addr_b_cur <= f_addr_b_cur + r_b_row_stride;
                    end
                    if (mm2s_tvalid) begin
                        if (mm2s_tlast) begin
                            b_beat_cnt <= 0;
                            if (b_recv_row == KBLK_MINUS1) begin
                                mm2s_cmd_tvalid <= 0; buf_ready[fetch_sel] <= 1;
                                if (f_k_blk_cnt < k_blk_tiles_m1) begin
                                    f_k_blk_cnt <= f_k_blk_cnt + 1;
                                    f_addr_a_mk <= f_addr_a_mk + K_BLK_ADDR; f_addr_a_cur <= f_addr_a_mk + K_BLK_ADDR;
                                    f_addr_b_kn <= f_addr_b_kn + r_b_kblk_step; f_addr_b_cur <= f_addr_b_kn + r_b_kblk_step;
                                    fetch_sel <= !fetch_sel; fetch_state <= F_WAIT_SLOT;
                                end else if (f_n_blk_cnt < n_blk_tiles_m1) begin
                                    f_k_blk_cnt <= 0; f_n_blk_cnt <= f_n_blk_cnt + 1;
                                    f_addr_b_nblk <= f_addr_b_nblk + N_BLK_ADDR; f_addr_b_kn <= f_addr_b_nblk + N_BLK_ADDR; f_addr_b_cur <= f_addr_b_nblk + N_BLK_ADDR;
                                    f_addr_a_mk <= f_addr_a_mblk; f_addr_a_cur <= f_addr_a_mblk;
                                    fetch_sel <= !fetch_sel; fetch_state <= F_WAIT_SLOT;
                                end else if (f_m_blk_cnt < m_blk_tiles_m1) begin
                                    f_k_blk_cnt <= 0; f_n_blk_cnt <= 0; f_m_blk_cnt <= f_m_blk_cnt + 1;
                                    f_addr_a_mblk <= f_addr_a_mblk + r_a_mblk_step; f_addr_a_mk <= f_addr_a_mblk + r_a_mblk_step; f_addr_a_cur <= f_addr_a_mblk + r_a_mblk_step;
                                    f_addr_b_nblk <= cfg_base_b; f_addr_b_kn <= cfg_base_b; f_addr_b_cur <= cfg_base_b;
                                    fetch_sel <= !fetch_sel; fetch_state <= F_WAIT_SLOT;
                                end else fetch_state <= F_DONE;
                            end else b_recv_row <= b_recv_row + 1;
                        end else b_beat_cnt <= b_beat_cnt + 1;
                    end
                end
                F_DONE: begin
                    if (start) begin
                        f_m_blk_cnt <= 0; f_n_blk_cnt <= 0; f_k_blk_cnt <= 0;
                        f_addr_a_mblk <= cfg_base_a; f_addr_a_mk <= cfg_base_a; f_addr_a_cur <= cfg_base_a;
                        f_addr_b_nblk <= cfg_base_b; f_addr_b_kn <= cfg_base_b; f_addr_b_cur <= cfg_base_b;
                        fetch_sel <= 0; buf_ready[0] <= 0; buf_ready[1] <= 0; fetch_state <= F_WAIT_SLOT;
                    end
                end
            endcase

            // --- COMPUTE PROCESS ---
            case (compute_state)
                C_IDLE: begin
                    if (start) begin
                        busy <= 1; c_m_blk_cnt <= 0; c_n_blk_cnt <= 0; c_k_blk_cnt <= 0;
                        c_addr_c_mblk <= cfg_base_c; c_addr_c_tile <= cfg_base_c;
                        compute_sel <= 0; mi_cnt <= 0; ni_cnt <= 0; compute_state <= C_WAIT_SLOT;
                        // [BUG FIX 1] Reset counters khi bắt đầu run mới
                        s2mm_sts_expected <= 0; s2mm_sts_received <= 0;
                    end
                end
                C_WAIT_SLOT: begin
                    if (buf_ready[compute_sel]) compute_state <= C_FEED_AB;
                end
                C_FEED_AB: begin
                    if (a_send_done && b_send_done) begin
                        recv_row <= 0; compute_state <= C_RECV;
                    end
                end
                C_RECV: begin
                    if (core_c32_tvalid) begin
                        if (core_c32_tlast) begin
                            if (ni_cnt < NI_MINUS1) begin
                                ni_cnt <= ni_cnt + 1; compute_state <= C_FEED_AB;
                            end else if (mi_cnt < MI_MINUS1) begin
                                mi_cnt <= mi_cnt + 1; ni_cnt <= 0; compute_state <= C_FEED_AB;
                            end else compute_state <= C_RELEASE;
                        end else recv_row <= recv_row + 1;
                    end
                end
                C_RELEASE: begin
                    buf_ready[compute_sel] <= 0; compute_sel <= !compute_sel; mi_cnt <= 0; ni_cnt <= 0;
                    if (c_k_blk_cnt < k_blk_tiles_m1) begin
                        c_k_blk_cnt <= c_k_blk_cnt + 1; compute_state <= C_WAIT_SLOT;
                    end else begin
                        drain_row <= 0; drain_ni <= 0; r_addr_c_drow <= c_addr_c_tile;
                        compute_state <= C_DRAIN_PREFETCH;
                    end
                end
                C_DRAIN_PREFETCH: begin
                    compute_state <= C_DRAIN_FEED;
                end
                C_DRAIN_FEED: begin
                    if (!rescale_s_tvalid) begin
                        rescale_s_tvalid <= 1; rescale_s_tdata <= c_accum_dout;
                    end else if (rescale_s_tready) begin
                        rescale_s_tvalid <= 0; rescale_m_tready <= 1; compute_state <= C_DRAIN_WAIT;
                    end
                end
                C_DRAIN_WAIT: begin
                    if (rescale_m_tvalid && rescale_m_tready) begin
                        rescale_m_tready <= 0;
                        r_addr_c_cur <= r_addr_c_drow + ({{(ADDR_W-4){1'b0}}, drain_ni} << 4);
                        s2mm_tdata <= rescale_m_tdata; compute_state <= C_DRAIN_CMD;
                    end
                end
                C_DRAIN_CMD: begin
                    if (!s2mm_cmd_tvalid) begin
                        s2mm_cmd_tvalid <= 1; s2mm_cmd_tdata <= mk_cmd(r_addr_c_cur, {17'b0, N[5:0]});
                    end else if (s2mm_cmd_tready) begin
                        s2mm_cmd_tvalid <= 0; s2mm_tvalid <= 1; s2mm_tlast <= 1; compute_state <= C_DRAIN_DATA;
                    end
                end
                C_DRAIN_DATA: begin
                    if (s2mm_tready) begin
                        s2mm_tvalid <= 0; s2mm_tlast <= 0;
                        // [BUG FIX 1] Ghi nhận ta vừa issue 1 DMA S2MM write
                        s2mm_sts_expected <= s2mm_sts_expected + 16'd1;
                        if (drain_ni < NI_MINUS1) begin
                            drain_ni <= drain_ni + 1; compute_state <= C_DRAIN_PREFETCH;
                        end else if (drain_row != 8'd255) begin
                            drain_ni <= 0; drain_row <= drain_row + 1;
                            r_addr_c_drow <= r_addr_c_drow + {{(ADDR_W-DIM_W){1'b0}}, cfg_n_stride};
                            compute_state <= C_DRAIN_PREFETCH;
                        end else compute_state <= C_NEXT_BLOCK;
                    end
                end
                C_NEXT_BLOCK: begin
                    c_k_blk_cnt <= 0;
                    if (c_n_blk_cnt < n_blk_tiles_m1) begin
                        c_n_blk_cnt <= c_n_blk_cnt + 1; c_addr_c_tile <= c_addr_c_tile + N_BLK_ADDR; compute_state <= C_WAIT_SLOT;
                    end else if (c_m_blk_cnt < m_blk_tiles_m1) begin
                        c_m_blk_cnt <= c_m_blk_cnt + 1; c_n_blk_cnt <= 0;
                        c_addr_c_mblk <= c_addr_c_mblk + r_c_mblk_step; c_addr_c_tile <= c_addr_c_mblk + r_c_mblk_step;
                        compute_state <= C_WAIT_SLOT;
                    end else begin
                        // [BUG FIX 1] Không báo done ngay - chờ DMA S2MM flush hết trước
                        compute_state <= C_WAIT_STS;
                    end
                end
                // [BUG FIX 1] Trạng thái mới: chờ tất cả DMA S2MM writes được confirm
                // AXI DMA nhận s2mm_tvalid (data vào internal FIFO, s2mm_tready=1) nhưng
                // còn cần nhiều cycles để thực sự ghi vào DDR và phản hồi s2mm_sts_tvalid.
                // Phải đợi s2mm_sts_received == s2mm_sts_expected trước khi báo done.
                C_WAIT_STS: begin
                    if (s2mm_sts_received == s2mm_sts_expected) begin
                        compute_state <= C_DONE_ST;
                    end
                end
                C_DONE_ST: begin
                    done <= 1; busy <= 0; compute_state <= C_IDLE;
                end
            endcase
        end
    end

endmodule
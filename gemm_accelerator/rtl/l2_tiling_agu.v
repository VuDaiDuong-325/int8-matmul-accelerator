`timescale 1ns / 1ps
//==============================================================================
// Module   : l2_tiling_agu   (v6 - arbitrary M/K/N, INT32 out, per-channel requant)
// Project  : INT8 GEMM Accelerator - KV260 / LLM
//
// Kiến trúc nền (fetch/compute song song, GBUFA/GBUFB ping-pong, C_ACCUM URAM)
// giữ nguyên bản v5 đã chạy trên board. Bản này bổ sung:
//
// [1] KÍCH THƯỚC BẤT KỲ (M, K, N tuỳ ý, không cần chia hết cho 256)
//     - Phần cứng tự xử lý block/tile biên:
//         * Block biên: số hàng A, số hàng B, số byte mỗi hàng chỉ fetch phần hợp lệ.
//         * Tile 16x16 hoàn toàn nằm ngoài M hoặc N bị BỎ QUA (không tính, không ghi).
//         * K lẻ: A bị MASK về 0 với k >= K hợp lệ, số chunk K của block biên
//           được giảm (ceil(kv / k_dim)) nên K nhỏ cũng không tốn thời gian thừa.
//         * Ghi C chỉ đúng số cột hợp lệ (tkeep + BTT), KHÔNG ghi đè ngoài ma trận.
//     - Yêu cầu DDR (vì AXI DataMover không bật DRE):
//         lda, ldb, ldc, ldc32 và mọi địa chỉ base phải là bội số của 16 byte;
//         lda >= ceil16(K), ldb >= ceil16(N), ldc >= N, ldc32 >= 4*N.
//       Nếu vi phạm: không chạy, err_o = 1 và done_o phát 1 xung.
//     - Ma trận row-major: A[M][K] stride lda, B[K][N] stride ldb (đơn vị byte).
//
// [2] ĐẦU RA INT32 (debug): cfg_out_mode_i[1]=1 ghi accumulator thô (A*B, chưa
//     cộng bias, chưa requant) ra vùng base_c32 / ldc32, little-endian.
//     cfg_out_mode_i[0]=1 ghi INT8 (sau requant) ra base_c / ldc. Có thể bật cả hai.
//
// [3] REQUANT THEO TỪNG KÊNH (cột của C): bảng tham số ở DDR, mỗi kênh 16 byte
//       word0 = bias (int32)   word1 = mult (int32)
//       word2 = shift (0..62)  word3 = zero_point (int32)
//     out = clamp( (((acc + bias) * mult) + 2^(shift-1)) >> shift  + zp , -128, 127)
//     Bảng được nạp bằng chính DMA MM2S (xen kẽ với fetch A/B, có trọng tài trong
//     fetch FSM), cho mỗi block N (tối đa 256 kênh = 4 KB), ngay khi block tính
//     K cuối cùng bắt đầu, nên latency nạp được che bởi compute.
//==============================================================================

module l2_tiling_agu #(
    parameter N      = 16,
    parameter M_BLK  = 256,   // BẮT BUỘC = N_BLK = K_BLK = 256 (kích thước GBUF/C_ACCUM cố định)
    parameter N_BLK  = 256,
    parameter K_BLK  = 256,
    parameter ADDR_W = 32,
    parameter DIM_W  = 20,    // tối đa 1,048,575 (đủ cho vocab 151936 của Qwen2)
    parameter FIFO_DEPTH = 1024,
    parameter BRAM_DEPTH = 1024
)(
    input  wire           CLK_i,
    input  wire           RST_i,

    input  wire [DIM_W-1:0]   cfg_m_total_i,
    input  wire [DIM_W-1:0]   cfg_n_total_i,
    input  wire [DIM_W-1:0]   cfg_k_total_i,
    input  wire [DIM_W-1:0]   cfg_k_dim_i,        // lũy thừa của 2, <= K_BLK (khuyến nghị 32)
    input  wire [ADDR_W-1:0]  cfg_base_a_i,
    input  wire [ADDR_W-1:0]  cfg_base_b_i,
    input  wire [ADDR_W-1:0]  cfg_base_c_i,       // INT8 output
    input  wire [ADDR_W-1:0]  cfg_base_c32_i,     // INT32 output
    input  wire [ADDR_W-1:0]  cfg_base_param_i,   // bảng tham số requant theo kênh
    input  wire [ADDR_W-1:0]  cfg_lda_i,          // byte
    input  wire [ADDR_W-1:0]  cfg_ldb_i,          // byte
    input  wire [ADDR_W-1:0]  cfg_ldc_i,          // byte (INT8)
    input  wire [ADDR_W-1:0]  cfg_ldc32_i,        // byte (INT32)
    input  wire [1:0]         cfg_out_mode_i,     // [0]=INT8  [1]=INT32

    input  wire   start_i,
    output reg    busy_o,
    output reg    done_o,
    output reg    err_o,

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

    // -------------------------------------------------------------------------
    // Hằng số
    // -------------------------------------------------------------------------
    localparam LOG2BLK = $clog2(M_BLK);          // 8
    localparam [ADDR_W-1:0] N_BLK_ADDR = N_BLK;
    localparam [ADDR_W-1:0] K_BLK_ADDR = K_BLK;

    initial begin
        if (M_BLK != 256 || N_BLK != 256 || K_BLK != 256 || N != 16)
            $display("[l2_tiling_agu] ERROR: thiet ke chi ho tro N=16, M_BLK=N_BLK=K_BLK=256");
    end

    localparam [3:0] F_IDLE = 4'd0, F_WAIT_SLOT = 4'd1, F_A_CMD = 4'd2, F_A_DATA = 4'd3,
                     F_B_CMD = 4'd4, F_B_DATA = 4'd5, F_DONE = 4'd6,
                     F_P_CMD = 4'd7, F_P_DATA = 4'd8;

    localparam [4:0] C_IDLE = 5'd0,  C_PREP = 5'd1,  C_WAIT_SLOT = 5'd2, C_FEED_AB = 5'd3,
                     C_RECV = 5'd4,  C_RELEASE = 5'd5, C_PWAIT = 5'd6,
                     C_DRAIN = 5'd7, C_NEXT_BLOCK = 5'd8,
                     C_WAIT_STS = 5'd9, C_DONE_ST = 5'd10;

    // Bộ GHI (writer) trong pha drain
    localparam [2:0] W_IDLE = 3'd0, W_CMD = 3'd1, W_DATA = 3'd2,
                     W_CMD32 = 3'd3, W_DATA32 = 3'd4, W_ADV = 3'd5;

    reg [3:0] fetch_state_r;
    reg [4:0] compute_state_r;

    // -------------------------------------------------------------------------
    // Cấu hình mở rộng + kiểm tra hợp lệ
    // -------------------------------------------------------------------------
    wire [31:0] m32_w = {{(32-DIM_W){1'b0}}, cfg_m_total_i};
    wire [31:0] n32_w = {{(32-DIM_W){1'b0}}, cfg_n_total_i};
    wire [31:0] k32_w = {{(32-DIM_W){1'b0}}, cfg_k_total_i};
    wire [31:0] kd32_w = {{(32-DIM_W){1'b0}}, cfg_k_dim_i};

    wire out_int8_w  = cfg_out_mode_i[0];
    wire out_int32_w = cfg_out_mode_i[1];

    wire [31:0] k_ceil16_w = ((k32_w + 32'd15) >> 4) << 4;
    wire [31:0] n_ceil16_w = ((n32_w + 32'd15) >> 4) << 4;

    wire cfg_ok_w =
        (m32_w != 0) && (n32_w != 0) && (k32_w != 0) &&
        (kd32_w != 0) && ((kd32_w & (kd32_w - 32'd1)) == 0) && (kd32_w <= K_BLK) &&
        (cfg_out_mode_i != 2'b00) &&
        (cfg_base_a_i[3:0] == 0) && (cfg_base_b_i[3:0] == 0) &&
        (cfg_lda_i[3:0] == 0) && (cfg_ldb_i[3:0] == 0) &&
        (cfg_lda_i >= k_ceil16_w) && (cfg_ldb_i >= n_ceil16_w) &&
        (!out_int8_w  || ((cfg_base_c_i[3:0] == 0) && (cfg_ldc_i[3:0] == 0) &&
                          (cfg_ldc_i >= n32_w) && (cfg_base_param_i[3:0] == 0))) &&
        (!out_int32_w || ((cfg_base_c32_i[3:0] == 0) && (cfg_ldc32_i[3:0] == 0) &&
                          (cfg_ldc32_i >= (n32_w << 2))));

    // -------------------------------------------------------------------------
    // Bước nhảy địa chỉ và số block (tính theo kích thước thực)
    // -------------------------------------------------------------------------
    wire [ADDR_W-1:0] r_a_mblk_step_w   = cfg_lda_i   << LOG2BLK;
    wire [ADDR_W-1:0] r_b_kblk_step_w   = cfg_ldb_i   << LOG2BLK;
    wire [ADDR_W-1:0] r_c_mblk_step_w   = cfg_ldc_i   << LOG2BLK;
    wire [ADDR_W-1:0] r_c32_mblk_step_w = cfg_ldc32_i << LOG2BLK;

    // chỉ số block cuối = ceil(total/BLK) - 1 = (total-1) >> LOG2BLK   (total >= 1)
    wire [DIM_W-1:0] m_blk_last_w = (cfg_m_total_i - 1'b1) >> LOG2BLK;
    wire [DIM_W-1:0] n_blk_last_w = (cfg_n_total_i - 1'b1) >> LOG2BLK;
    wire [DIM_W-1:0] k_blk_last_w = (cfg_k_total_i - 1'b1) >> LOG2BLK;

    // ===== COUNTERS & REGISTERS =====
    reg buf_ready_r [0:1];
    reg fetch_sel_r, compute_sel_r;

    reg [DIM_W-1:0] f_m_blk_cnt_r, f_n_blk_cnt_r, f_k_blk_cnt_r;
    reg [ADDR_W-1:0] f_addr_a_mblk_r, f_addr_a_mk_r, f_addr_a_cur_r;
    reg [ADDR_W-1:0] f_addr_b_nblk_r, f_addr_b_kn_r, f_addr_b_cur_r;
    reg [8:0] a_cmd_row_r, a_recv_row_r; reg [3:0] a_beat_cnt_r; reg a_cmd_tx_r;
    reg [8:0] b_cmd_row_r, b_recv_row_r; reg [3:0] b_beat_cnt_r; reg b_cmd_tx_r;

    reg [DIM_W-1:0] c_m_blk_cnt_r, c_n_blk_cnt_r, c_k_blk_cnt_r;
    reg [ADDR_W-1:0] c_addr_c_mblk_r,   c_addr_c_tile_r;
    reg [ADDR_W-1:0] c_addr_c32_mblk_r, c_addr_c32_tile_r;
    reg [3:0] mi_cnt_r, ni_cnt_r;
    reg [7:0] a_col_k_r, b_step_k_r;
    reg a_send_done_r, b_send_done_r;
    reg [3:0] recv_row_r;

    // --- Pha DRAIN = bộ PHÁT (producer) + bộ GHI (writer) chạy song song, nối bằng FIFO nhỏ ---
    //   Producer: mỗi chu kỳ đọc 1 hàng (16 lane) từ C_ACCUM, cho qua requant theo kênh (pipeline 7 tầng),
    //             đẩy accumulator thô vào raw_fifo và kết quả INT8 vào i8_fifo.
    //   Writer  : lấy đầu FIFO, phát lệnh S2MM. Latency requant được che hoàn toàn.
    reg [7:0] iss_row_r;  reg [3:0] iss_ni_r;  reg iss_done_r;   // con trỏ producer
    reg       iss_v_d1_r; reg [3:0] iss_ni_d1_r;                  // pipeline đọc URAM (1 chu kỳ)
    reg [7:0] wr_row_r;   reg [3:0] wr_ni_r;                      // con trỏ writer
    reg [2:0] w_state_r;
    reg [ADDR_W-1:0] r_addr_c_drow_r,   r_addr_c_cur_r;
    reg [ADDR_W-1:0] r_addr_c32_drow_r, r_addr_c32_cur_r;

    // -------------------------------------------------------------------------
    // Kích thước hợp lệ của block hiện tại (fetch side & compute side)
    //   valid = min(BLK, total - blk_idx*BLK)   (1..256)
    // -------------------------------------------------------------------------
    wire [31:0] f_m_rem_w = m32_w - ({{(32-DIM_W){1'b0}}, f_m_blk_cnt_r} << LOG2BLK);
    wire [31:0] f_n_rem_w = n32_w - ({{(32-DIM_W){1'b0}}, f_n_blk_cnt_r} << LOG2BLK);
    wire [31:0] f_k_rem_w = k32_w - ({{(32-DIM_W){1'b0}}, f_k_blk_cnt_r} << LOG2BLK);
    wire [8:0]  f_mv_w = (f_m_rem_w > M_BLK) ? M_BLK[8:0] : f_m_rem_w[8:0];
    wire [8:0]  f_nv_w = (f_n_rem_w > N_BLK) ? N_BLK[8:0] : f_n_rem_w[8:0];
    wire [8:0]  f_kv_w = (f_k_rem_w > K_BLK) ? K_BLK[8:0] : f_k_rem_w[8:0];

    wire [31:0] c_m_rem_w = m32_w - ({{(32-DIM_W){1'b0}}, c_m_blk_cnt_r} << LOG2BLK);
    wire [31:0] c_n_rem_w = n32_w - ({{(32-DIM_W){1'b0}}, c_n_blk_cnt_r} << LOG2BLK);
    wire [31:0] c_k_rem_w = k32_w - ({{(32-DIM_W){1'b0}}, c_k_blk_cnt_r} << LOG2BLK);
    wire [8:0]  c_mv_w = (c_m_rem_w > M_BLK) ? M_BLK[8:0] : c_m_rem_w[8:0];
    wire [8:0]  c_nv_w = (c_n_rem_w > N_BLK) ? N_BLK[8:0] : c_n_rem_w[8:0];
    wire [8:0]  c_kv_w = (c_k_rem_w > K_BLK) ? K_BLK[8:0] : c_k_rem_w[8:0];

    // Số tile 16x16 hợp lệ trong block compute: chỉ số cuối = ceil(v/16)-1 = (v-1)>>4
    wire [3:0] mi_last_w = (c_mv_w - 9'd1) >> 4;
    wire [3:0] ni_last_w = (c_nv_w - 9'd1) >> 4;

    // BTT (byte) của 1 hàng A / B đọc từ DDR, làm tròn lên 16 byte
    wire [9:0] a_btt_w = ((f_kv_w + 10'd15) >> 4) << 4;
    wire [9:0] b_btt_w = ((f_nv_w + 10'd15) >> 4) << 4;

    // -------------------------------------------------------------------------
    // Handshake nạp bảng tham số (compute yêu cầu, fetch phục vụ) - 4 pha
    //   p_req_r: chỉ compute ghi      p_ack_r: chỉ fetch ghi
    // -------------------------------------------------------------------------
    reg        p_req_r, p_ack_r, p_ret_done_r;
    reg [8:0]  p_idx_r;
    wire       pram_we_w = (fetch_state_r == F_P_DATA) && mm2s_tvalid;

    // -------------------------------------------------------------------------
    // S2MM status counter (đếm theo LỆNH, mỗi lệnh S2MM sinh 1 status)
    // -------------------------------------------------------------------------
    reg [31:0] s2mm_sts_expected_r;
    reg [31:0] s2mm_sts_received_r;

    // =========================================================================
    // BẢNG THAM SỐ REQUANT THEO KÊNH: 16 bank x 16 mục x 128 bit (LUTRAM)
    //   kênh e của block: bank = e[3:0], addr = e[7:4] (e = ni*16 + lane)
    //   Đọc bất đồng bộ: 16 lane đọc song song cùng addr = iss_ni_d1_r (chỉ số ni của hàng đang qua requant)
    // =========================================================================
    wire [N*32-1:0] rq_bias_w, rq_mult_w, rq_zp_w;
    wire [N*8-1:0]  rq_shift_w;
    genvar gp;
    generate
        for (gp = 0; gp < N; gp = gp + 1) begin : PRAM_BANKS
            (* ram_style = "distributed" *) reg [127:0] mem_r [0:(N_BLK/N)-1];
            integer ii;
            initial for (ii = 0; ii < (N_BLK/N); ii = ii + 1) mem_r[ii] = 128'd0;
            always @(posedge CLK_i) begin
                if (pram_we_w && (p_idx_r[3:0] == gp))
                    mem_r[p_idx_r[7:4]] <= mm2s_tdata;
            end
            wire [127:0] ent_w = mem_r[iss_ni_d1_r];
            assign rq_bias_w [gp*32 +: 32] = ent_w[31:0];
            assign rq_mult_w [gp*32 +: 32] = ent_w[63:32];
            assign rq_shift_w[gp*8  +: 8 ] = ent_w[71:64];
            assign rq_zp_w   [gp*32 +: 32] = ent_w[127:96];
        end
    endgenerate

    // =========================================================================
    // XPM MEMORY INSTANTIATIONS (BRAM & URAM)
    // =========================================================================

    // -- 1. GBUFA (16 Block RAMs chạy song song) --
    wire [127:0] gbufa_dout_w [0:N-1];
    reg  core_a_tvalid_d1_r, core_a_tlast_d1_r;
    reg  a_mask_d1_r;                 // 1: k < kv (hợp lệ), 0: ép A = 0
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
                .WRITE_MODE_B("read_first")
            ) u_gbufA (
                .clka(CLK_i), .clkb(CLK_i), .ena(1'b1),
                .enb(core_a_tready_w || !core_a_tvalid_d1_r),
                .wea(wea_w), .addra({fetch_sel_r, a_recv_row_r[7:4], a_beat_cnt_r}), .dina(mm2s_tdata),
                .addrb({compute_sel_r, mi_cnt_r, a_col_k_r[7:4]}), .doutb(gbufa_dout_w[gr]),
                .sleep(1'b0), .regceb(1'b1), .injectsbiterra(1'b0), .injectdbiterra(1'b0)
            );
        end
    endgenerate

    // Mask K: A bị ép về 0 khi k >= kv  => tích bằng 0 bất kể B (padding/rác)
    wire [N*8-1:0] core_a_tdata_w;
    generate
        for (gr=0; gr<N; gr=gr+1) begin : GBUFA_MUX
            assign core_a_tdata_w[gr*8 +: 8] =
                a_mask_d1_r ? gbufa_dout_w[gr][ a_rd_byte_d1_r*8 +: 8 ] : 8'd0;
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
        .WRITE_MODE_B("read_first")
    ) u_gbufB (
        .clka(CLK_i), .clkb(CLK_i), .ena(1'b1),
        .enb(core_b_tready_w || !core_b_tvalid_d1_r),
        .wea(we_b_w), .addra({fetch_sel_r, b_beat_cnt_r, b_recv_row_r[7:0]}), .dina(mm2s_tdata),
        .addrb({compute_sel_r, ni_cnt_r, b_step_k_r}), .doutb(core_b_tdata_w),
        .sleep(1'b0), .regceb(1'b1), .injectsbiterra(1'b0), .injectdbiterra(1'b0)
    );

    // -- 3. PIPELINE FEED A/B --
    //   Số bước K của block hiện tại = c_flen = c_nch * k_dim (bội của k_dim)
    reg [7:0] c_flen_m1_r;            // (số bước feed) - 1
    reg [8:0] c_nch_r;                // số chunk k_dim trong block hiện tại (<= K_BLK/k_dim, tối đa 256 khi k_dim=1)
    reg [8:0] c_acc_r;                // bộ tích lũy trong C_PREP

    reg a_req_done_r, b_req_done_r;
    wire req_a_w = (compute_state_r == C_FEED_AB) && !a_req_done_r;
    wire req_b_w = (compute_state_r == C_FEED_AB) && !b_req_done_r;

    always @(posedge CLK_i) begin
        if (!RST_i) begin
            core_a_tvalid_d1_r <= 0; core_b_tvalid_d1_r <= 0;
            a_send_done_r <= 0; b_send_done_r <= 0;
            a_req_done_r <= 0; b_req_done_r <= 0;
            a_col_k_r <= 0; b_step_k_r <= 0;
            a_mask_d1_r <= 0;
        end else begin
            if (compute_state_r == C_WAIT_SLOT || compute_state_r == C_RECV) begin
                a_send_done_r <= 0; b_send_done_r <= 0;
                a_req_done_r <= 0; b_req_done_r <= 0;
                a_col_k_r <= 0; b_step_k_r <= 0;
                core_a_tvalid_d1_r <= 0; core_b_tvalid_d1_r <= 0;
            end else begin
                // Băng chuyền A
                if (core_a_tready_w || !core_a_tvalid_d1_r) begin
                    if (req_a_w) begin
                        core_a_tvalid_d1_r <= 1'b1;
                        core_a_tlast_d1_r  <= (a_col_k_r == c_flen_m1_r);
                        a_rd_byte_d1_r     <= a_col_k_r[3:0];
                        a_mask_d1_r        <= ({1'b0, a_col_k_r} < c_kv_w);
                        if (a_col_k_r == c_flen_m1_r) a_req_done_r <= 1'b1;
                        a_col_k_r <= a_col_k_r + 8'd1;
                    end else begin
                        core_a_tvalid_d1_r <= 1'b0;
                    end
                end
                if (core_a_tvalid_d1_r && core_a_tready_w && core_a_tlast_d1_r) a_send_done_r <= 1'b1;

                // Băng chuyền B
                if (core_b_tready_w || !core_b_tvalid_d1_r) begin
                    if (req_b_w) begin
                        core_b_tvalid_d1_r <= 1'b1;
                        core_b_tlast_d1_r  <= (b_step_k_r == c_flen_m1_r);
                        if (b_step_k_r == c_flen_m1_r) b_req_done_r <= 1'b1;
                        b_step_k_r <= b_step_k_r + 8'd1;
                    end else begin
                        core_b_tvalid_d1_r <= 1'b0;
                    end
                end
                if (core_b_tvalid_d1_r && core_b_tready_w && core_b_tlast_d1_r) b_send_done_r <= 1'b1;
            end
        end
    end

    // -- 4. C_ACCUM (UltraRAM) --
    wire [511:0] c_accum_dout_w;
    reg  c_valid_d1_r, c_last_d1_r, c_k_0_d1_r;
    reg  [11:0] c_addr_d1_r;
    reg  [511:0] c_data_d1_r;
    wire [511:0] core_c32_tdata_w;
    wire core_c32_tvalid_w, core_c32_tlast_w, core_c32_tuser_w;

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
                c_k_0_d1_r   <= (c_k_blk_cnt_r == 0);
            end else begin
                c_valid_d1_r <= 0;
                if (compute_state_r == C_RELEASE || compute_state_r == C_WAIT_SLOT ||
                    compute_state_r == C_FEED_AB || compute_state_r == C_PREP) begin
                    c_k_0_d1_r <= 1'b0;
                end
            end
        end
    end

    wire [511:0] c_new_row_w;
    genvar gc;
    generate
        for (gc = 0; gc < N; gc = gc + 1) begin : CACC_ADD
            assign c_new_row_w[gc*32 +: 32] = c_k_0_d1_r ? c_data_d1_r[gc*32 +: 32] :
                   $signed(c_accum_dout_w[gc*32 +: 32]) + $signed(c_data_d1_r[gc*32 +: 32]);
        end
    endgenerate

    wire [11:0] c_rd_addr_w = (compute_state_r == C_DRAIN)
                            ? {iss_row_r[7:4], iss_ni_r, iss_row_r[3:0]} : {mi_cnt_r, ni_cnt_r, recv_row_r};

    xpm_memory_sdpram #(
        .ADDR_WIDTH_A(12), .ADDR_WIDTH_B(12),
        .WRITE_DATA_WIDTH_A(512), .READ_DATA_WIDTH_B(512),
        .MEMORY_SIZE(512 * 4096), .READ_LATENCY_B(1), .MEMORY_PRIMITIVE("ultra"),
        .WRITE_MODE_B("read_first")
    ) u_c_accum (
        .clka(CLK_i), .clkb(CLK_i), .ena(1'b1), .enb(1'b1),
        .wea(c_valid_d1_r), .addra(c_addr_d1_r), .dina(c_new_row_w),
        .addrb(c_rd_addr_w), .doutb(c_accum_dout_w),
        .sleep(1'b0), .regceb(1'b1), .injectsbiterra(1'b0), .injectdbiterra(1'b0)
    );

    // =========================================================================
    // COMPUTE CORE (num_k_tiles ĐỘNG theo block: c_nch_r)
    // =========================================================================
    gemm_compute_core #(
        .N(N), .DATA_WIDTH(8), .FIFO_DEPTH(FIFO_DEPTH), .BRAM_DEPTH(BRAM_DEPTH)
    ) u_gemm_compute_core (
        .CLK_i(CLK_i), .RST_i(RST_i),
        .k_dim_i({{(32-DIM_W){1'b0}}, cfg_k_dim_i}), .num_k_tiles_i({23'd0, c_nch_r}),
        .s_axis_a_tdata_i(core_a_tdata_w), .s_axis_a_tvalid_i(core_a_tvalid_d1_r), .s_axis_a_tready_o(core_a_tready_w), .s_axis_a_tlast_i(core_a_tlast_d1_r),
        .s_axis_b_tdata_i(core_b_tdata_w), .s_axis_b_tvalid_i(core_b_tvalid_d1_r), .s_axis_b_tready_o(core_b_tready_w), .s_axis_b_tlast_i(core_b_tlast_d1_r),
        .m_axis_c32_tdata_o(core_c32_tdata_w), .m_axis_c32_tvalid_o(core_c32_tvalid_w), .m_axis_c32_tready_i(core_c32_tready_w), .m_axis_c32_tlast_o(core_c32_tlast_w), .m_axis_c32_tuser_o(core_c32_tuser_w)
    );

    // =========================================================================
    // REQUANT THEO KÊNH
    // =========================================================================
    wire            rq_in_valid_w = iss_v_d1_r && out_int8_w;
    wire            rq_ovalid_w;
    wire [N*8-1:0]  rq_odata_w;

    int32_int8_requant_pc #(.N(N)) u_requant_pc (
        .CLK_i(CLK_i), .RST_i(RST_i),
        .in_valid_i(rq_in_valid_w),
        .acc_i(c_accum_dout_w),
        .bias_i(rq_bias_w), .mult_i(rq_mult_w), .shift_i(rq_shift_w), .zp_i(rq_zp_w),
        .out_valid_o(rq_ovalid_w), .out_data_o(rq_odata_w)
    );

    // =========================================================================
    // FIFO giữa producer và writer (16 mục, LUTRAM, đọc bất đồng bộ)
    // =========================================================================
    (* ram_style = "distributed" *) reg [N*32-1:0] raw_mem [0:15];   // accumulator INT32 thô (cho INT32 out)
    (* ram_style = "distributed" *) reg [N*8-1:0]  i8_mem  [0:15];   // kết quả INT8 sau requant
    reg [4:0] raw_wp_r, raw_rp_r, i8_wp_r, i8_rp_r;
    reg [4:0] occ_r;                                   // số hàng đã phát nhưng chưa được writer lấy ra
    wire [4:0] raw_cnt_w = raw_wp_r - raw_rp_r;
    wire [4:0] i8_cnt_w  = i8_wp_r  - i8_rp_r;
    wire       op_avail_w = out_int8_w ? (i8_cnt_w != 5'd0) : (raw_cnt_w != 5'd0);
    wire       credit_ok_w = (occ_r < 5'd16);
    wire [N*32-1:0] raw_head_w = raw_mem[raw_rp_r[3:0]];
    wire [N*8-1:0]  i8_head_w  = i8_mem [i8_rp_r[3:0]];
    wire       iss_fire_w = (compute_state_r == C_DRAIN) && !iss_done_r && credit_ok_w;
    wire       pop_w      = (compute_state_r == C_DRAIN) && (w_state_r == W_ADV);
    integer    fi;
    initial begin
        for (fi = 0; fi < 16; fi = fi + 1) begin raw_mem[fi] = {N*32{1'b0}}; i8_mem[fi] = {N*8{1'b0}}; end
    end

    // =========================================================================
    // S2MM: số cột hợp lệ của tile drain, tkeep, số beat INT32
    // =========================================================================
    wire [8:0] drain_rem_n_w = c_nv_w - {1'b0, wr_ni_r, 4'b0000};     // >= 1 (theo con trỏ writer)
    wire [4:0] nt_w          = (drain_rem_n_w >= 9'd16) ? 5'd16 : drain_rem_n_w[4:0];
    reg  [4:0] nt_r;                                                   // số cột hợp lệ (1..16)
    wire [2:0] nb32_w        = (nt_r + 5'd3) >> 2;                     // số beat INT32 (1..4)
    reg  [1:0] b32_r;                                                  // beat INT32 đang gửi
    reg  [N-1:0] s2mm_tkeep_r;

    wire [N-1:0] keep8_w = (nt_r == 5'd16) ? 16'hFFFF : ((16'h0001 << nt_r) - 16'h0001);

    // tkeep cho beat k của INT32: lane còn lại = nt - 4k, mỗi lane 4 byte
    function [N-1:0] keep32;
        input [4:0] nt;
        input [1:0] k;
        reg   [5:0] lanes_left;
        reg   [4:0] lanes;
        begin
            lanes_left = {1'b0, nt} - {2'b00, k, 2'b00};
            lanes      = (lanes_left >= 6'd4) ? 5'd4 : lanes_left[4:0];
            keep32     = (lanes == 5'd4) ? 16'hFFFF : ((16'h0001 << (lanes << 2)) - 16'h0001);
        end
    endfunction

    assign s2mm_tkeep      = s2mm_tkeep_r;
    assign s2mm_sts_tready = 1'b1;
    assign mm2s_tready     = (fetch_state_r == F_A_DATA) || (fetch_state_r == F_B_DATA) ||
                             (fetch_state_r == F_P_DATA);

    function automatic [71:0] mk_cmd;
        input [ADDR_W-1:0] addr; input [22:0] btt;
        begin mk_cmd = {4'b0, 4'b0, addr, 1'b0, 1'b1, 6'b0, 1'b1, btt}; end
    endfunction

    wire [ADDR_W-1:0] p_addr_w = cfg_base_param_i +
                                 ({{(ADDR_W-DIM_W){1'b0}}, c_n_blk_cnt_r} << (LOG2BLK + 4));

    // =========================================================================
    // MAIN FSM LOGIC
    // =========================================================================
    always @(posedge CLK_i) begin
        if (!RST_i) begin
            fetch_state_r <= F_IDLE; compute_state_r <= C_IDLE;
            busy_o <= 0; done_o <= 0; err_o <= 0;
            mm2s_cmd_tvalid <= 0; s2mm_cmd_tvalid <= 0; s2mm_tvalid <= 0; s2mm_tlast <= 0;
            s2mm_tkeep_r <= {N{1'b1}};
            buf_ready_r[0] <= 0; buf_ready_r[1] <= 0; fetch_sel_r <= 0; compute_sel_r <= 0;
            s2mm_sts_expected_r <= 0; s2mm_sts_received_r <= 0;
            p_req_r <= 0; p_ack_r <= 0; p_ret_done_r <= 0; p_idx_r <= 0;
            c_nch_r <= 0; c_acc_r <= 0; c_flen_m1_r <= 0;
            raw_wp_r <= 0; raw_rp_r <= 0; i8_wp_r <= 0; i8_rp_r <= 0; occ_r <= 0;
            iss_v_d1_r <= 0; iss_done_r <= 1; w_state_r <= W_IDLE;
        end else begin
            done_o <= 1'b0;

            // ---- Quản lý FIFO producer/writer + credit ----
            iss_v_d1_r <= 1'b0;                          // mặc định; C_DRAIN ghi đè khi phát
            if (iss_v_d1_r) begin                        // dữ liệu URAM hợp lệ ở chu kỳ này
                raw_mem[raw_wp_r[3:0]] <= c_accum_dout_w;
                raw_wp_r <= raw_wp_r + 5'd1;
            end
            if (rq_ovalid_w) begin                       // kết quả requant ra (sau 7 chu kỳ)
                i8_mem[i8_wp_r[3:0]] <= rq_odata_w;
                i8_wp_r <= i8_wp_r + 5'd1;
            end
            if (pop_w) begin
                raw_rp_r <= raw_rp_r + 5'd1;
                if (out_int8_w) i8_rp_r <= i8_rp_r + 5'd1;
            end
            occ_r <= occ_r + (iss_fire_w ? 5'd1 : 5'd0) - (pop_w ? 5'd1 : 5'd0);

            // Đếm status S2MM để biết khi nào DMA thực sự ghi xong vào DDR
            if (s2mm_sts_tvalid) begin
                s2mm_sts_received_r <= s2mm_sts_received_r + 32'd1;
            end

            // fetch hạ ack khi compute đã hạ req (handshake 4 pha)
            if (!p_req_r && p_ack_r) p_ack_r <= 1'b0;

            // --- FETCH PROCESS ---
            case (fetch_state_r)
                F_IDLE: begin
                    if (start_i && cfg_ok_w) begin
                        f_m_blk_cnt_r <= 0; f_n_blk_cnt_r <= 0; f_k_blk_cnt_r <= 0;
                        f_addr_a_mblk_r <= cfg_base_a_i; f_addr_a_mk_r <= cfg_base_a_i; f_addr_a_cur_r <= cfg_base_a_i;
                        f_addr_b_nblk_r <= cfg_base_b_i; f_addr_b_kn_r <= cfg_base_b_i; f_addr_b_cur_r <= cfg_base_b_i;
                        fetch_sel_r <= 0; buf_ready_r[0] <= 0; buf_ready_r[1] <= 0;
                        p_ack_r <= 1'b0;
                        fetch_state_r <= F_WAIT_SLOT;
                    end
                end
                F_WAIT_SLOT: begin
                    if (p_req_r && !p_ack_r) begin
                        // Compute cần bảng tham số: ưu tiên nạp trước khi fetch A/B tiếp theo
                        p_idx_r <= 0; p_ret_done_r <= 1'b0; fetch_state_r <= F_P_CMD;
                    end else if (!buf_ready_r[fetch_sel_r]) begin
                        a_cmd_row_r <= 0; a_recv_row_r <= 0; a_beat_cnt_r <= 0; a_cmd_tx_r <= 0; fetch_state_r <= F_A_CMD;
                    end
                end
                F_A_CMD, F_A_DATA: begin
                    if (fetch_state_r == F_A_CMD) fetch_state_r <= F_A_DATA;
                    if (!a_cmd_tx_r && (a_cmd_row_r < f_mv_w)) begin
                        a_cmd_tx_r <= 1; mm2s_cmd_tvalid <= 1; mm2s_cmd_tdata <= mk_cmd(f_addr_a_cur_r, {13'b0, a_btt_w});
                    end
                    if (a_cmd_tx_r && mm2s_cmd_tready) begin
                        mm2s_cmd_tvalid <= 0; a_cmd_tx_r <= 0; a_cmd_row_r <= a_cmd_row_r + 1; f_addr_a_cur_r <= f_addr_a_cur_r + cfg_lda_i;
                    end
                    if (mm2s_tvalid) begin
                        if (mm2s_tlast) begin
                            a_beat_cnt_r <= 0;
                            if (a_recv_row_r == f_mv_w - 9'd1) begin
                                mm2s_cmd_tvalid <= 0; b_cmd_row_r <= 0; b_recv_row_r <= 0; b_beat_cnt_r <= 0; b_cmd_tx_r <= 0;
                                fetch_state_r <= F_B_CMD;
                            end else a_recv_row_r <= a_recv_row_r + 1;
                        end else a_beat_cnt_r <= a_beat_cnt_r + 1;
                    end
                end
                F_B_CMD, F_B_DATA: begin
                    if (fetch_state_r == F_B_CMD) fetch_state_r <= F_B_DATA;
                    if (!b_cmd_tx_r && (b_cmd_row_r < f_kv_w)) begin
                        b_cmd_tx_r <= 1; mm2s_cmd_tvalid <= 1; mm2s_cmd_tdata <= mk_cmd(f_addr_b_cur_r, {13'b0, b_btt_w});
                    end
                    if (b_cmd_tx_r && mm2s_cmd_tready) begin
                        mm2s_cmd_tvalid <= 0; b_cmd_tx_r <= 0; b_cmd_row_r <= b_cmd_row_r + 1; f_addr_b_cur_r <= f_addr_b_cur_r + cfg_ldb_i;
                    end
                    if (mm2s_tvalid) begin
                        if (mm2s_tlast) begin
                            b_beat_cnt_r <= 0;
                            if (b_recv_row_r == f_kv_w - 9'd1) begin
                                mm2s_cmd_tvalid <= 0; buf_ready_r[fetch_sel_r] <= 1;
                                if (f_k_blk_cnt_r < k_blk_last_w) begin
                                    f_k_blk_cnt_r <= f_k_blk_cnt_r + 1;
                                    f_addr_a_mk_r <= f_addr_a_mk_r + K_BLK_ADDR; f_addr_a_cur_r <= f_addr_a_mk_r + K_BLK_ADDR;
                                    f_addr_b_kn_r <= f_addr_b_kn_r + r_b_kblk_step_w; f_addr_b_cur_r <= f_addr_b_kn_r + r_b_kblk_step_w;
                                    fetch_sel_r <= !fetch_sel_r; fetch_state_r <= F_WAIT_SLOT;
                                end else if (f_n_blk_cnt_r < n_blk_last_w) begin
                                    f_k_blk_cnt_r <= 0; f_n_blk_cnt_r <= f_n_blk_cnt_r + 1;
                                    f_addr_b_nblk_r <= f_addr_b_nblk_r + N_BLK_ADDR; f_addr_b_kn_r <= f_addr_b_nblk_r + N_BLK_ADDR; f_addr_b_cur_r <= f_addr_b_nblk_r + N_BLK_ADDR;
                                    f_addr_a_mk_r <= f_addr_a_mblk_r; f_addr_a_cur_r <= f_addr_a_mblk_r;
                                    fetch_sel_r <= !fetch_sel_r; fetch_state_r <= F_WAIT_SLOT;
                                end else if (f_m_blk_cnt_r < m_blk_last_w) begin
                                    f_k_blk_cnt_r <= 0; f_n_blk_cnt_r <= 0; f_m_blk_cnt_r <= f_m_blk_cnt_r + 1;
                                    f_addr_a_mblk_r <= f_addr_a_mblk_r + r_a_mblk_step_w; f_addr_a_mk_r <= f_addr_a_mblk_r + r_a_mblk_step_w; f_addr_a_cur_r <= f_addr_a_mblk_r + r_a_mblk_step_w;
                                    f_addr_b_nblk_r <= cfg_base_b_i; f_addr_b_kn_r <= cfg_base_b_i; f_addr_b_cur_r <= cfg_base_b_i;
                                    fetch_sel_r <= !fetch_sel_r; fetch_state_r <= F_WAIT_SLOT;
                                end else fetch_state_r <= F_DONE;
                            end else b_recv_row_r <= b_recv_row_r + 1;
                        end else b_beat_cnt_r <= b_beat_cnt_r + 1;
                    end
                end
                F_P_CMD: begin
                    // Nạp bảng tham số requant của block N hiện tại: nv kênh x 16 byte
                    if (!mm2s_cmd_tvalid) begin
                        mm2s_cmd_tvalid <= 1'b1;
                        mm2s_cmd_tdata  <= mk_cmd(p_addr_w, {10'b0, c_nv_w, 4'b0000});
                    end else if (mm2s_cmd_tready) begin
                        mm2s_cmd_tvalid <= 1'b0;
                        fetch_state_r   <= F_P_DATA;
                    end
                end
                F_P_DATA: begin
                    if (mm2s_tvalid) begin
                        p_idx_r <= p_idx_r + 9'd1;       // pram_we_w ghi mục p_idx_r (wire ở trên)
                        if (mm2s_tlast) begin
                            p_ack_r <= 1'b1;
                            fetch_state_r <= p_ret_done_r ? F_DONE : F_WAIT_SLOT;
                        end
                    end
                end
                F_DONE: begin
                    if (start_i && cfg_ok_w) begin
                        f_m_blk_cnt_r <= 0; f_n_blk_cnt_r <= 0; f_k_blk_cnt_r <= 0;
                        f_addr_a_mblk_r <= cfg_base_a_i; f_addr_a_mk_r <= cfg_base_a_i; f_addr_a_cur_r <= cfg_base_a_i;
                        f_addr_b_nblk_r <= cfg_base_b_i; f_addr_b_kn_r <= cfg_base_b_i; f_addr_b_cur_r <= cfg_base_b_i;
                        fetch_sel_r <= 0; buf_ready_r[0] <= 0; buf_ready_r[1] <= 0; p_ack_r <= 1'b0;
                        fetch_state_r <= F_WAIT_SLOT;
                    end else if (p_req_r && !p_ack_r) begin
                        p_idx_r <= 0; p_ret_done_r <= 1'b1; fetch_state_r <= F_P_CMD;
                    end
                end
                default: fetch_state_r <= F_IDLE;
            endcase

            // --- COMPUTE PROCESS ---
            case (compute_state_r)
                C_IDLE: begin
                    if (start_i) begin
                        if (cfg_ok_w) begin
                            busy_o <= 1; err_o <= 0;
                            c_m_blk_cnt_r <= 0; c_n_blk_cnt_r <= 0; c_k_blk_cnt_r <= 0;
                            c_addr_c_mblk_r   <= cfg_base_c_i;   c_addr_c_tile_r   <= cfg_base_c_i;
                            c_addr_c32_mblk_r <= cfg_base_c32_i; c_addr_c32_tile_r <= cfg_base_c32_i;
                            compute_sel_r <= 0; mi_cnt_r <= 0; ni_cnt_r <= 0;
                            c_acc_r <= 0; c_nch_r <= 0;
                            s2mm_sts_expected_r <= 0; s2mm_sts_received_r <= 0;
                            p_req_r <= 0;
                            compute_state_r <= C_PREP;
                        end else begin
                            // Cấu hình sai: không chạy, báo lỗi
                            err_o <= 1'b1; done_o <= 1'b1;
                        end
                    end
                end
                // Tính số chunk K của block hiện tại: nch = ceil(kv / k_dim), flen = nch*k_dim
                C_PREP: begin
                    if (c_acc_r < c_kv_w) begin
                        c_acc_r <= c_acc_r + cfg_k_dim_i[8:0];
                        c_nch_r <= c_nch_r + 9'd1;
                    end else begin
                        c_flen_m1_r <= c_acc_r[7:0] - 8'd1;
                        // Block K cuối của block output: yêu cầu nạp bảng tham số (che latency)
                        if (out_int8_w && (c_k_blk_cnt_r == k_blk_last_w)) p_req_r <= 1'b1;
                        compute_state_r <= C_WAIT_SLOT;
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
                            if (ni_cnt_r < ni_last_w) begin
                                ni_cnt_r <= ni_cnt_r + 1; compute_state_r <= C_FEED_AB;
                            end else if (mi_cnt_r < mi_last_w) begin
                                mi_cnt_r <= mi_cnt_r + 1; ni_cnt_r <= 0; compute_state_r <= C_FEED_AB;
                            end else compute_state_r <= C_RELEASE;
                        end else recv_row_r <= recv_row_r + 1;
                    end
                end
                C_RELEASE: begin
                    buf_ready_r[compute_sel_r] <= 0; compute_sel_r <= !compute_sel_r; mi_cnt_r <= 0; ni_cnt_r <= 0;
                    if (c_k_blk_cnt_r < k_blk_last_w) begin
                        c_k_blk_cnt_r <= c_k_blk_cnt_r + 1;
                        c_acc_r <= 0; c_nch_r <= 0;
                        compute_state_r <= C_PREP;
                    end else begin
                        // Khởi tạo pha drain
                        iss_row_r <= 0; iss_ni_r <= 0; iss_done_r <= 1'b0;
                        wr_row_r  <= 0; wr_ni_r  <= 0; w_state_r <= W_IDLE;
                        r_addr_c_drow_r   <= c_addr_c_tile_r;
                        r_addr_c32_drow_r <= c_addr_c32_tile_r;
                        compute_state_r <= out_int8_w ? C_PWAIT : C_DRAIN;
                    end
                end
                C_PWAIT: begin
                    if (p_ack_r) begin
                        p_req_r <= 1'b0;
                        compute_state_r <= C_DRAIN;
                    end
                end
                C_DRAIN: begin
                    // ---------------- PRODUCER ----------------
                    // Chu kỳ t: phát địa chỉ đọc C_ACCUM; t+1: dữ liệu hợp lệ -> requant + raw_fifo
                    if (iss_fire_w) begin
                        iss_v_d1_r  <= 1'b1;
                        iss_ni_d1_r <= iss_ni_r;
                        if (iss_ni_r < ni_last_w) begin
                            iss_ni_r <= iss_ni_r + 1;
                        end else if ({1'b0, iss_row_r} != c_mv_w - 9'd1) begin
                            iss_ni_r <= 0; iss_row_r <= iss_row_r + 1;
                        end else begin
                            iss_done_r <= 1'b1;
                        end
                    end

                    // ---------------- WRITER ----------------
                    case (w_state_r)
                        W_IDLE: begin
                            if (op_avail_w) begin
                                r_addr_c_cur_r   <= r_addr_c_drow_r   + ({{(ADDR_W-4){1'b0}}, wr_ni_r} << 4);
                                r_addr_c32_cur_r <= r_addr_c32_drow_r + ({{(ADDR_W-4){1'b0}}, wr_ni_r} << 6);
                                nt_r <= nt_w;
                                w_state_r <= out_int8_w ? W_CMD : W_CMD32;
                            end
                        end
                        // ---- ghi INT8: 1 lệnh, 1 beat, btt = nt, tkeep theo nt ----
                        W_CMD: begin
                            if (!s2mm_cmd_tvalid) begin
                                s2mm_cmd_tvalid <= 1; s2mm_cmd_tdata <= mk_cmd(r_addr_c_cur_r, {18'b0, nt_r});
                            end else if (s2mm_cmd_tready) begin
                                s2mm_cmd_tvalid <= 0; s2mm_tvalid <= 1; s2mm_tlast <= 1;
                                s2mm_tdata   <= i8_head_w;
                                s2mm_tkeep_r <= keep8_w;
                                w_state_r <= W_DATA;
                            end
                        end
                        W_DATA: begin
                            if (s2mm_tready) begin
                                s2mm_tvalid <= 0; s2mm_tlast <= 0;
                                s2mm_sts_expected_r <= s2mm_sts_expected_r + 32'd1;
                                w_state_r <= out_int32_w ? W_CMD32 : W_ADV;
                            end
                        end
                        // ---- ghi INT32: 1 lệnh, nb32 beat (4 lane/beat), btt = 4*nt ----
                        W_CMD32: begin
                            if (!s2mm_cmd_tvalid) begin
                                s2mm_cmd_tvalid <= 1; s2mm_cmd_tdata <= mk_cmd(r_addr_c32_cur_r, {16'b0, nt_r, 2'b00});
                            end else if (s2mm_cmd_tready) begin
                                s2mm_cmd_tvalid <= 0; s2mm_tvalid <= 1;
                                s2mm_tdata   <= raw_head_w[127:0];
                                s2mm_tlast   <= (nb32_w == 3'd1);
                                s2mm_tkeep_r <= keep32(nt_r, 2'd0);
                                b32_r <= 2'd0;
                                w_state_r <= W_DATA32;
                            end
                        end
                        W_DATA32: begin
                            if (s2mm_tready) begin
                                if ({1'b0, b32_r} == nb32_w - 3'd1) begin
                                    s2mm_tvalid <= 0; s2mm_tlast <= 0;
                                    s2mm_sts_expected_r <= s2mm_sts_expected_r + 32'd1;
                                    w_state_r <= W_ADV;
                                end else begin
                                    b32_r        <= b32_r + 2'd1;
                                    s2mm_tdata   <= raw_head_w[(b32_r + 2'd1) * 128 +: 128];
                                    s2mm_tlast   <= ({1'b0, b32_r} + 3'd1 == nb32_w - 3'd1);
                                    s2mm_tkeep_r <= keep32(nt_r, b32_r + 2'd1);
                                end
                            end
                        end
                        // ---- lấy hàng khỏi FIFO (pop_w) và tiến con trỏ writer ----
                        W_ADV: begin
                            w_state_r <= W_IDLE;
                            if (wr_ni_r < ni_last_w) begin
                                wr_ni_r <= wr_ni_r + 1;
                            end else if ({1'b0, wr_row_r} != c_mv_w - 9'd1) begin
                                wr_ni_r <= 0; wr_row_r <= wr_row_r + 1;
                                r_addr_c_drow_r   <= r_addr_c_drow_r   + cfg_ldc_i;
                                r_addr_c32_drow_r <= r_addr_c32_drow_r + cfg_ldc32_i;
                            end else begin
                                compute_state_r <= C_NEXT_BLOCK;
                            end
                        end
                        default: w_state_r <= W_IDLE;
                    endcase
                end
                C_NEXT_BLOCK: begin
                    c_k_blk_cnt_r <= 0; c_acc_r <= 0; c_nch_r <= 0;
                    if (c_n_blk_cnt_r < n_blk_last_w) begin
                        c_n_blk_cnt_r <= c_n_blk_cnt_r + 1;
                        c_addr_c_tile_r   <= c_addr_c_tile_r   + N_BLK_ADDR;
                        c_addr_c32_tile_r <= c_addr_c32_tile_r + (N_BLK_ADDR << 2);
                        compute_state_r <= C_PREP;
                    end else if (c_m_blk_cnt_r < m_blk_last_w) begin
                        c_m_blk_cnt_r <= c_m_blk_cnt_r + 1; c_n_blk_cnt_r <= 0;
                        c_addr_c_mblk_r   <= c_addr_c_mblk_r   + r_c_mblk_step_w;
                        c_addr_c_tile_r   <= c_addr_c_mblk_r   + r_c_mblk_step_w;
                        c_addr_c32_mblk_r <= c_addr_c32_mblk_r + r_c32_mblk_step_w;
                        c_addr_c32_tile_r <= c_addr_c32_mblk_r + r_c32_mblk_step_w;
                        compute_state_r <= C_PREP;
                    end else begin
                        compute_state_r <= C_WAIT_STS;     // chờ DMA ghi xong hết
                    end
                end
                C_WAIT_STS: begin
                    if (s2mm_sts_received_r == s2mm_sts_expected_r) begin
                        compute_state_r <= C_DONE_ST;
                    end
                end
                C_DONE_ST: begin
                    done_o <= 1; busy_o <= 0; compute_state_r <= C_IDLE;
                end
                default: compute_state_r <= C_IDLE;
            endcase
        end
    end

endmodule

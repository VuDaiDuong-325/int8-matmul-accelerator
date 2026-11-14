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
//
// [v7] FEED-AHEAD: bo cap du lieu (GBUF -> bram_input_buffer, "generator" g_*) tach khoi bo nhan
//     ket qua (recv, c_*/C_RECV). Tile ke bat dau cap ngay sau tile truoc (khong cho C_RECV), GBUF
//     slot duoc nha ngay khi cap xong K-block. Bo nhan chay doc lap va nhan ket qua theo thu tu.
//     Bao ve tran FIFO C: gemm_compute_core dung stall_i theo muc day cua FIFO.
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

    // Bo NHAN (recv) + DRAIN. (v7: C_PREP / C_WAIT_SLOT / C_FEED_AB da chuyen sang generator G_*)
    localparam [4:0] C_IDLE = 5'd0,  C_RECV = 5'd4,  C_BLKEND = 5'd5, C_PWAIT = 5'd6,
                     C_DRAIN = 5'd7, C_NEXT_BLOCK = 5'd8,
                     C_WAIT_STS = 5'd9, C_DONE_ST = 5'd10;
    // Generator cap du lieu A/B vao compute core
    localparam [2:0] G_IDLE = 3'd0, G_WAIT = 3'd1, G_RUN = 3'd2, G_FIN = 3'd3, G_END = 3'd4;

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
    reg [3:0] mi_cnt_r, ni_cnt_r;          // bo NHAN: chi so tile dang nhan ket qua
    reg [7:0] a_col_k_r, b_step_k_r;
    reg a_send_done_r, b_send_done_r;
    reg [3:0] recv_row_r;

    // --- Generator (cap du lieu) ---
    reg [2:0]       g_state_r;
    reg             g_sel_r;                          // GBUF slot dang doc
    reg [DIM_W-1:0] g_m_blk_r, g_n_blk_r, g_k_blk_r;
    reg [3:0]       ga_mi_r, ga_ni_r, gb_mi_r, gb_ni_r;   // moi stream (A, B) co chi so tile rieng
    reg [3:0]       g_mi_last_r, g_ni_last_r;
    reg [7:0]       g_flen_m1_r;                      // so buoc feed cua K-block - 1
    reg [8:0]       g_kv_r;                           // K hop le cua K-block

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

    // ---- Kich thuoc block phia generator (g_*), giong cong thuc c_* nhung theo bo dem generator
    wire [31:0] g_m_rem_w = m32_w - ({{(32-DIM_W){1'b0}}, g_m_blk_r} << LOG2BLK);
    wire [31:0] g_n_rem_w = n32_w - ({{(32-DIM_W){1'b0}}, g_n_blk_r} << LOG2BLK);
    wire [31:0] g_k_rem_w = k32_w - ({{(32-DIM_W){1'b0}}, g_k_blk_r} << LOG2BLK);
    wire [8:0]  g_mv_w = (g_m_rem_w > M_BLK) ? M_BLK[8:0] : g_m_rem_w[8:0];
    wire [8:0]  g_nv_w = (g_n_rem_w > N_BLK) ? N_BLK[8:0] : g_n_rem_w[8:0];
    wire [8:0]  g_kv_w = (g_k_rem_w > K_BLK) ? K_BLK[8:0] : g_k_rem_w[8:0];
    wire [3:0]  g_mi_last_w = (g_mv_w - 9'd1) >> 4;
    wire [3:0]  g_ni_last_w = (g_nv_w - 9'd1) >> 4;

    // ---- k_dim = 2^kd_sh ; so chunk/block ; flen = lam tron len boi cua k_dim
    function [3:0] f_log2;
        input [8:0] v;
        begin
            f_log2 = v[8] ? 4'd8 : v[7] ? 4'd7 : v[6] ? 4'd6 : v[5] ? 4'd5 :
                     v[4] ? 4'd4 : v[3] ? 4'd3 : v[2] ? 4'd2 : v[1] ? 4'd1 : 4'd0;
        end
    endfunction
    wire [3:0] kd_sh_w = f_log2(cfg_k_dim_i[8:0]);
    wire [9:0] g_flen_w = ((({1'b0, g_kv_w} + {1'b0, cfg_k_dim_i[8:0]} - 10'd1) >> kd_sh_w) << kd_sh_w);

    // so chunk moi tile cua K-block: day (256/k_dim) va K-block cuoi (kv_tail)
    wire [31:0] k_tail_rem_w = k32_w - ({{(32-DIM_W){1'b0}}, k_blk_last_w} << LOG2BLK);
    wire [8:0]  kv_tail_w    = (k_tail_rem_w > K_BLK) ? K_BLK[8:0] : k_tail_rem_w[8:0];
    wire [8:0]  nch_full_w   = K_BLK[8:0] >> kd_sh_w;
    wire [9:0]  nch_tail_sum_w = {1'b0, kv_tail_w} + {1'b0, cfg_k_dim_i[8:0]} - 10'd1;
    wire [8:0]  nch_tail_w   = nch_tail_sum_w[9:0] >> kd_sh_w;
    // nch cua K-block KE TIEP trong chuoi (sau K-block c_k_blk_cnt_r; vong ve 0 khi het output block)
    wire [DIM_W-1:0] c_k_next_w = (c_k_blk_cnt_r < k_blk_last_w) ? (c_k_blk_cnt_r + 1'b1) : {DIM_W{1'b0}};
    wire [8:0]  nch_next_w   = (c_k_next_w == k_blk_last_w) ? nch_tail_w : nch_full_w;

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
                .addrb({g_sel_r, ga_mi_r, a_col_k_r[7:4]}), .doutb(gbufa_dout_w[gr]),
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
        .addrb({g_sel_r, gb_ni_r, b_step_k_r}), .doutb(core_b_tdata_w),
        .sleep(1'b0), .regceb(1'b1), .injectsbiterra(1'b0), .injectdbiterra(1'b0)
    );

    // -- 3. PIPELINE FEED A/B (v7: moi stream co chi so tile rieng, tile ke chay khong co bong bóng) --
    //   Moi tile phat flen = nch*k_dim buoc (g_flen_m1_r + 1). Het tile -> tile ke (ni++, roi mi++) NGAY
    //   chu ky sau; stream dung (req_done) khi het tile cuoi cua K-block. tlast chi o beat cuoi cua K-block.
    reg [8:0] c_nch_r;                // so chunk/tile cua K-block dang NHAN, dua cho post_accumulator

    reg a_req_done_r, b_req_done_r;
    wire req_a_w = (g_state_r == G_RUN) && !a_req_done_r;
    wire req_b_w = (g_state_r == G_RUN) && !b_req_done_r;
    wire a_last_in_tile_w = (a_col_k_r  == g_flen_m1_r);
    wire b_last_in_tile_w = (b_step_k_r == g_flen_m1_r);
    wire a_last_tile_w = (ga_ni_r == g_ni_last_r) && (ga_mi_r == g_mi_last_r);
    wire b_last_tile_w = (gb_ni_r == g_ni_last_r) && (gb_mi_r == g_mi_last_r);

    always @(posedge CLK_i) begin
        if (!RST_i) begin
            core_a_tvalid_d1_r <= 0; core_b_tvalid_d1_r <= 0;
            a_send_done_r <= 0; b_send_done_r <= 0;
            a_req_done_r <= 0; b_req_done_r <= 0;
            a_col_k_r <= 0; b_step_k_r <= 0;
            ga_mi_r <= 0; ga_ni_r <= 0; gb_mi_r <= 0; gb_ni_r <= 0;
            a_mask_d1_r <= 0;
        end else begin
            if (g_state_r != G_RUN) begin
                a_send_done_r <= 0; b_send_done_r <= 0;
                a_req_done_r <= 0; b_req_done_r <= 0;
                a_col_k_r <= 0; b_step_k_r <= 0;
                ga_mi_r <= 0; ga_ni_r <= 0; gb_mi_r <= 0; gb_ni_r <= 0;
                core_a_tvalid_d1_r <= 0; core_b_tvalid_d1_r <= 0;
            end else begin
                // Bang chuyen A
                if (core_a_tready_w || !core_a_tvalid_d1_r) begin
                    if (req_a_w) begin
                        core_a_tvalid_d1_r <= 1'b1;
                        core_a_tlast_d1_r  <= a_last_in_tile_w && a_last_tile_w;
                        a_rd_byte_d1_r     <= a_col_k_r[3:0];
                        a_mask_d1_r        <= ({1'b0, a_col_k_r} < g_kv_r);
                        if (a_last_in_tile_w) begin
                            a_col_k_r <= 8'd0;
                            if (ga_ni_r < g_ni_last_r) ga_ni_r <= ga_ni_r + 4'd1;
                            else if (ga_mi_r < g_mi_last_r) begin ga_mi_r <= ga_mi_r + 4'd1; ga_ni_r <= 4'd0; end
                            else a_req_done_r <= 1'b1;
                        end else a_col_k_r <= a_col_k_r + 8'd1;
                    end else begin
                        core_a_tvalid_d1_r <= 1'b0;
                    end
                end
                if (core_a_tvalid_d1_r && core_a_tready_w && core_a_tlast_d1_r) a_send_done_r <= 1'b1;

                // Bang chuyen B
                if (core_b_tready_w || !core_b_tvalid_d1_r) begin
                    if (req_b_w) begin
                        core_b_tvalid_d1_r <= 1'b1;
                        core_b_tlast_d1_r  <= b_last_in_tile_w && b_last_tile_w;
                        if (b_last_in_tile_w) begin
                            b_step_k_r <= 8'd0;
                            if (gb_ni_r < g_ni_last_r) gb_ni_r <= gb_ni_r + 4'd1;
                            else if (gb_mi_r < g_mi_last_r) begin gb_mi_r <= gb_mi_r + 4'd1; gb_ni_r <= 4'd0; end
                            else b_req_done_r <= 1'b1;
                        end else b_step_k_r <= b_step_k_r + 8'd1;
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
    // ---- Writer che do HANG (INT8-only): 1 lenh S2MM / hang C, cac beat 16 byte stream 1 beat/chu ky ----
    wire       row_mode_w = out_int8_w && !out_int32_w;
    reg  [8:0]            wc_row_r;      // hang dang phat lenh
    reg  [ADDR_W-1:0]     wc_addr_r;     // dia chi dau hang dang phat lenh
    reg                   wc_done_r;     // da phat het lenh cac hang
    reg                   wd_done_r;     // da nap beat cuoi (hang cuoi) vao thanh ghi S2MM
    reg  [9:0]            wc_acc_r;      // so lenh da duoc DMA nhan (handshake)
    reg  [9:0]            wr_start_r;    // so hang da bat dau nap du lieu
    wire       out_free_w = !s2mm_tvalid || s2mm_tready;
    // beat dau tien cua hang chi duoc nap khi lenh cua hang do da duoc DMA nhan (lenh luon di truoc du lieu)
    wire       cmd_ok_w   = (wr_ni_r != 4'd0) || (wc_acc_r != wr_start_r);
    wire       ld_w       = row_mode_w && (compute_state_r == C_DRAIN) && !wd_done_r &&
                            out_free_w && (i8_cnt_w != 5'd0) && cmd_ok_w;
    wire       pop_w      = (compute_state_r == C_DRAIN) && ((w_state_r == W_ADV) || ld_w);
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
            buf_ready_r[0] <= 0; buf_ready_r[1] <= 0; fetch_sel_r <= 0; g_sel_r <= 0;
            g_state_r <= G_IDLE;
            g_m_blk_r <= 0; g_n_blk_r <= 0; g_k_blk_r <= 0;
            g_mi_last_r <= 0; g_ni_last_r <= 0; g_flen_m1_r <= 0; g_kv_r <= 0;
            s2mm_sts_expected_r <= 0; s2mm_sts_received_r <= 0;
            p_req_r <= 0; p_ack_r <= 0; p_ret_done_r <= 0; p_idx_r <= 0;
            c_nch_r <= 0;
            raw_wp_r <= 0; raw_rp_r <= 0; i8_wp_r <= 0; i8_rp_r <= 0; occ_r <= 0;
            iss_v_d1_r <= 0; iss_done_r <= 1; w_state_r <= W_IDLE;
            wc_row_r <= 0; wc_addr_r <= 0; wc_done_r <= 1; wd_done_r <= 1; wc_acc_r <= 0; wr_start_r <= 0;
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

            // --- GENERATOR (cap du lieu A/B vao compute core; chay truoc bo nhan) ---
            case (g_state_r)
                G_IDLE, G_END: begin
                    if (start_i && cfg_ok_w) begin
                        g_m_blk_r <= 0; g_n_blk_r <= 0; g_k_blk_r <= 0; g_sel_r <= 0;
                        g_state_r <= G_WAIT;
                    end
                end
                G_WAIT: begin
                    // cho GBUF slot day (fetch da nap xong K-block nay)
                    if (buf_ready_r[g_sel_r]) begin
                        g_mi_last_r <= g_mi_last_w; g_ni_last_r <= g_ni_last_w;
                        g_flen_m1_r <= g_flen_w[7:0] - 8'd1;
                        g_kv_r      <= g_kv_w;
                        g_state_r   <= G_RUN;
                    end
                end
                G_RUN: begin
                    if (a_send_done_r && b_send_done_r) g_state_r <= G_FIN;
                end
                G_FIN: begin
                    // da doc xong GBUF slot nay -> nha ngay cho fetch, doi slot, sang K-block/block ke
                    buf_ready_r[g_sel_r] <= 0; g_sel_r <= !g_sel_r;
                    if (g_k_blk_r < k_blk_last_w) begin
                        g_k_blk_r <= g_k_blk_r + 1; g_state_r <= G_WAIT;
                    end else if (g_n_blk_r < n_blk_last_w) begin
                        g_k_blk_r <= 0; g_n_blk_r <= g_n_blk_r + 1; g_state_r <= G_WAIT;
                    end else if (g_m_blk_r < m_blk_last_w) begin
                        g_k_blk_r <= 0; g_n_blk_r <= 0; g_m_blk_r <= g_m_blk_r + 1; g_state_r <= G_WAIT;
                    end else g_state_r <= G_END;
                end
                default: g_state_r <= G_IDLE;
            endcase

            // --- RECV / DRAIN PROCESS ---
            case (compute_state_r)
                C_IDLE: begin
                    if (start_i) begin
                        if (cfg_ok_w) begin
                            busy_o <= 1; err_o <= 0;
                            c_m_blk_cnt_r <= 0; c_n_blk_cnt_r <= 0; c_k_blk_cnt_r <= 0;
                            c_addr_c_mblk_r   <= cfg_base_c_i;   c_addr_c_tile_r   <= cfg_base_c_i;
                            c_addr_c32_mblk_r <= cfg_base_c32_i; c_addr_c32_tile_r <= cfg_base_c32_i;
                            mi_cnt_r <= 0; ni_cnt_r <= 0; recv_row_r <= 0;
                            // nch cua K-block dau tien (= K-block cuoi neu chi co 1 block)
                            c_nch_r <= (k_blk_last_w == 0) ? nch_tail_w : nch_full_w;
                            s2mm_sts_expected_r <= 0; s2mm_sts_received_r <= 0;
                            // yeu cau nap bang tham so ngay neu K-block dau cung la K-block cuoi
                            p_req_r <= (out_int8_w && (k_blk_last_w == 0));
                            compute_state_r <= C_RECV;
                        end else begin
                            // Cấu hình sai: không chạy, báo lỗi
                            err_o <= 1'b1; done_o <= 1'b1;
                        end
                    end
                end
                C_RECV: begin
                    if (core_c32_tvalid_w) begin
                        if (core_c32_tlast_w) begin
                            recv_row_r <= 0;
                            if (ni_cnt_r < ni_last_w) begin
                                ni_cnt_r <= ni_cnt_r + 1;
                            end else if (mi_cnt_r < mi_last_w) begin
                                mi_cnt_r <= mi_cnt_r + 1; ni_cnt_r <= 0;
                            end else begin
                                // tile cuoi cua K-block: dat truoc nch cho K-block ke (post_accumulator
                                // dang o S_RECV cua tile ke; so sanh nch chi xay ra sau >= 16 hang)
                                c_nch_r <= nch_next_w;
                                compute_state_r <= C_BLKEND;
                            end
                        end else recv_row_r <= recv_row_r + 1;
                    end
                end
                C_BLKEND: begin
                    mi_cnt_r <= 0; ni_cnt_r <= 0; recv_row_r <= 0;
                    if (c_k_blk_cnt_r < k_blk_last_w) begin
                        c_k_blk_cnt_r <= c_k_blk_cnt_r + 1;
                        // vao K-block cuoi cua output block -> yeu cau nap bang tham so (che latency)
                        if (out_int8_w && ((c_k_blk_cnt_r + 1'b1) == k_blk_last_w)) p_req_r <= 1'b1;
                        compute_state_r <= C_RECV;
                    end else begin
                        // Khởi tạo pha drain
                        iss_row_r <= 0; iss_ni_r <= 0; iss_done_r <= 1'b0;
                        wr_row_r  <= 0; wr_ni_r  <= 0; w_state_r <= W_IDLE;
                        r_addr_c_drow_r   <= c_addr_c_tile_r;
                        r_addr_c32_drow_r <= c_addr_c32_tile_r;
                        wc_row_r <= 0; wc_addr_r <= c_addr_c_tile_r; wc_done_r <= 1'b0; wd_done_r <= 1'b0; wc_acc_r <= 0; wr_start_r <= 0;
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

                    // ---------------- WRITER (che do hang, INT8-only) ----------------
                    if (row_mode_w) begin
                        // (a) tien trinh LENH: 1 lenh / hang, btt = so cot hop le cua block (<= 256)
                        if (s2mm_cmd_tvalid && s2mm_cmd_tready) begin
                            s2mm_cmd_tvalid <= 1'b0; wc_acc_r <= wc_acc_r + 10'd1;
                        end else if (!s2mm_cmd_tvalid && !wc_done_r) begin
                            s2mm_cmd_tvalid <= 1'b1;
                            s2mm_cmd_tdata  <= mk_cmd(wc_addr_r, {14'b0, c_nv_w});
                            s2mm_sts_expected_r <= s2mm_sts_expected_r + 32'd1;
                            wc_addr_r <= wc_addr_r + cfg_ldc_i;
                            if ({1'b0, wc_row_r} == {1'b0, c_mv_w} - 10'd1) wc_done_r <= 1'b1;
                            else wc_row_r <= wc_row_r + 9'd1;
                        end
                        // (b) tien trinh DU LIEU: stream cac segment 16 byte, tlast o segment cuoi moi hang
                        if (ld_w) begin
                            s2mm_tvalid  <= 1'b1;
                            s2mm_tdata   <= i8_head_w;
                            s2mm_tkeep_r <= (nt_w == 5'd16) ? 16'hFFFF : ((16'h0001 << nt_w) - 16'h0001);
                            s2mm_tlast   <= (wr_ni_r == ni_last_w);
                            if (wr_ni_r == 4'd0) wr_start_r <= wr_start_r + 10'd1;
                            if (wr_ni_r < ni_last_w) wr_ni_r <= wr_ni_r + 1;
                            else begin
                                wr_ni_r <= 0;
                                if ({1'b0, wr_row_r} == {1'b0, c_mv_w} - 10'd1) wd_done_r <= 1'b1;
                                else wr_row_r <= wr_row_r + 9'd1;
                            end
                        end else if (s2mm_tvalid && s2mm_tready) begin
                            s2mm_tvalid <= 1'b0; s2mm_tlast <= 1'b0;
                        end
                        // (c) xong khi beat cuoi cua hang cuoi duoc DMA nhan
                        if (wd_done_r && s2mm_tvalid && s2mm_tready) compute_state_r <= C_NEXT_BLOCK;
                    end else
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
                    c_k_blk_cnt_r <= 0;
                    mi_cnt_r <= 0; ni_cnt_r <= 0; recv_row_r <= 0;
                    // (c_nch_r da duoc dat = nch cua K-block 0 khi nhan tile cuoi cua K-block cuoi)
                    // chi yeu cau bang tham so khi con output block ke tiep (tranh nap thua o cuoi lenh)
                    if (out_int8_w && (k_blk_last_w == 0) &&
                        ((c_n_blk_cnt_r < n_blk_last_w) || (c_m_blk_cnt_r < m_blk_last_w))) p_req_r <= 1'b1;
                    if (c_n_blk_cnt_r < n_blk_last_w) begin
                        c_n_blk_cnt_r <= c_n_blk_cnt_r + 1;
                        c_addr_c_tile_r   <= c_addr_c_tile_r   + N_BLK_ADDR;
                        c_addr_c32_tile_r <= c_addr_c32_tile_r + (N_BLK_ADDR << 2);
                        compute_state_r <= C_RECV;
                    end else if (c_m_blk_cnt_r < m_blk_last_w) begin
                        c_m_blk_cnt_r <= c_m_blk_cnt_r + 1; c_n_blk_cnt_r <= 0;
                        c_addr_c_mblk_r   <= c_addr_c_mblk_r   + r_c_mblk_step_w;
                        c_addr_c_tile_r   <= c_addr_c_mblk_r   + r_c_mblk_step_w;
                        c_addr_c32_mblk_r <= c_addr_c32_mblk_r + r_c32_mblk_step_w;
                        c_addr_c32_tile_r <= c_addr_c32_mblk_r + r_c32_mblk_step_w;
                        compute_state_r <= C_RECV;
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

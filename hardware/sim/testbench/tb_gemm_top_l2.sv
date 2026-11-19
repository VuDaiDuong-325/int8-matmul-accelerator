`timescale 1ns / 1ps
//==============================================================================
// Testbench : tb_gemm_top_l2
// DUT       : gemm_top_l2 (l2_tiling_agu.v) + gemm_l2_axi_lite_regs.v
// Testplan  : tb_gemm_top_l2_vp.csv (TOP_001 .. TOP_016)
//==============================================================================

module tb_gemm_top_l2;

    localparam int N          = 16;
    localparam int M_BLK      = 256;
    localparam int N_BLK      = 256;
    localparam int K_BLK      = 256;
    localparam int ADDR_W     = 32;
    localparam int DIM_W      = 20;
    localparam int FIFO_DEPTH = 1024;
    localparam int BRAM_DEPTH = 1024;
    localparam int CLK_NS     = 5; // 200 MHz

    // Bản đồ vùng nhớ DDR giả lập (4 MB = 0x0000_0000 .. 0x003F_FFFF)
    localparam int DDR_SIZE         = 4 * 1024 * 1024;
    localparam logic [31:0] BASE_A_DEFAULT   = 32'h0001_0000;
    localparam logic [31:0] BASE_B_DEFAULT   = 32'h0008_0000;
    localparam logic [31:0] BASE_P_DEFAULT   = 32'h0010_0000;
    localparam logic [31:0] BASE_C_DEFAULT   = 32'h0018_0000;
    localparam logic [31:0] BASE_C32_DEFAULT = 32'h0020_0000;

    // Xung nhịp & Reset
    logic CLK_i;
    logic RST_i;

    // Chế độ điều khiển: 0 = điều khiển trực tiếp cổng cfg_*_tb, 1 = điều khiển qua AXI4-Lite Regs (TOP_016)
    bit   use_axil_ctrl = 1'b0;

    // Tín hiệu điều khiển trực tiếp từ TB
    logic [DIM_W-1:0]  tb_cfg_m_total;
    logic [DIM_W-1:0]  tb_cfg_n_total;
    logic [DIM_W-1:0]  tb_cfg_k_total;
    logic [DIM_W-1:0]  tb_cfg_k_dim;
    logic [ADDR_W-1:0] tb_cfg_base_a;
    logic [ADDR_W-1:0] tb_cfg_base_b;
    logic [ADDR_W-1:0] tb_cfg_base_c;
    logic [ADDR_W-1:0] tb_cfg_base_c32;
    logic [ADDR_W-1:0] tb_cfg_base_param;
    logic [ADDR_W-1:0] tb_cfg_lda;
    logic [ADDR_W-1:0] tb_cfg_ldb;
    logic [ADDR_W-1:0] tb_cfg_ldc;
    logic [ADDR_W-1:0] tb_cfg_ldc32;
    logic [1:0]        tb_cfg_out_mode;
    logic              tb_start;

    // Tín hiệu từ khối AXI4-Lite Registers (dùng ở TOP_016)
    logic [7:0]  S_AXI_AWADDR;
    logic [2:0]  S_AXI_AWPROT;
    logic        S_AXI_AWVALID;
    wire         S_AXI_AWREADY;
    logic [31:0] S_AXI_WDATA;
    logic [3:0]  S_AXI_WSTRB;
    logic        S_AXI_WVALID;
    wire         S_AXI_WREADY;
    wire  [1:0]  S_AXI_BRESP;
    wire         S_AXI_BVALID;
    logic        S_AXI_BREADY;
    logic [7:0]  S_AXI_ARADDR;
    logic [2:0]  S_AXI_ARPROT;
    logic        S_AXI_ARVALID;
    wire         S_AXI_ARREADY;
    wire  [31:0] S_AXI_RDATA;
    wire  [1:0]  S_AXI_RRESP;
    wire         S_AXI_RVALID;
    logic        S_AXI_RREADY;

    wire [DIM_W-1:0]  reg_cfg_m_total;
    wire [DIM_W-1:0]  reg_cfg_n_total;
    wire [DIM_W-1:0]  reg_cfg_k_total;
    wire [DIM_W-1:0]  reg_cfg_k_dim;
    wire [ADDR_W-1:0] reg_cfg_base_a;
    wire [ADDR_W-1:0] reg_cfg_base_b;
    wire [ADDR_W-1:0] reg_cfg_base_c;
    wire [ADDR_W-1:0] reg_cfg_base_c32;
    wire [ADDR_W-1:0] reg_cfg_base_param;
    wire [ADDR_W-1:0] reg_cfg_lda;
    wire [ADDR_W-1:0] reg_cfg_ldb;
    wire [ADDR_W-1:0] reg_cfg_ldc;
    wire [ADDR_W-1:0] reg_cfg_ldc32;
    wire [1:0]        reg_cfg_out_mode;
    wire              reg_start;
    wire              irq_o;

    // Dây mux vào gemm_top_l2
    wire [DIM_W-1:0]  dut_m_total    = use_axil_ctrl ? reg_cfg_m_total    : tb_cfg_m_total;
    wire [DIM_W-1:0]  dut_n_total    = use_axil_ctrl ? reg_cfg_n_total    : tb_cfg_n_total;
    wire [DIM_W-1:0]  dut_k_total    = use_axil_ctrl ? reg_cfg_k_total    : tb_cfg_k_total;
    wire [DIM_W-1:0]  dut_k_dim      = use_axil_ctrl ? reg_cfg_k_dim      : tb_cfg_k_dim;
    wire [ADDR_W-1:0] dut_base_a     = use_axil_ctrl ? reg_cfg_base_a     : tb_cfg_base_a;
    wire [ADDR_W-1:0] dut_base_b     = use_axil_ctrl ? reg_cfg_base_b     : tb_cfg_base_b;
    wire [ADDR_W-1:0] dut_base_c     = use_axil_ctrl ? reg_cfg_base_c     : tb_cfg_base_c;
    wire [ADDR_W-1:0] dut_base_c32   = use_axil_ctrl ? reg_cfg_base_c32   : tb_cfg_base_c32;
    wire [ADDR_W-1:0] dut_base_param = use_axil_ctrl ? reg_cfg_base_param : tb_cfg_base_param;
    wire [ADDR_W-1:0] dut_lda        = use_axil_ctrl ? reg_cfg_lda        : tb_cfg_lda;
    wire [ADDR_W-1:0] dut_ldb        = use_axil_ctrl ? reg_cfg_ldb        : tb_cfg_ldb;
    wire [ADDR_W-1:0] dut_ldc        = use_axil_ctrl ? reg_cfg_ldc        : tb_cfg_ldc;
    wire [ADDR_W-1:0] dut_ldc32      = use_axil_ctrl ? reg_cfg_ldc32      : tb_cfg_ldc32;
    wire [1:0]        dut_out_mode   = use_axil_ctrl ? reg_cfg_out_mode   : tb_cfg_out_mode;
    wire              dut_start      = use_axil_ctrl ? reg_start          : tb_start;

    wire              busy_o;
    wire              done_o;
    wire              err_o;

    // Giao diện AXI DataMover MM2S / S2MM
    wire [71:0]       mm2s_cmd_tdata;
    wire              mm2s_cmd_tvalid;
    logic             mm2s_cmd_tready;
    logic [N*8-1:0]   mm2s_tdata;
    logic             mm2s_tvalid;
    wire              mm2s_tready;
    logic             mm2s_tlast;

    wire [71:0]       s2mm_cmd_tdata;
    wire              s2mm_cmd_tvalid;
    logic             s2mm_cmd_tready;
    wire [N*8-1:0]    s2mm_tdata;
    wire              s2mm_tvalid;
    logic             s2mm_tready;
    wire              s2mm_tlast;
    wire [N-1:0]      s2mm_tkeep;
    logic [7:0]       s2mm_sts_tdata;
    logic             s2mm_sts_tvalid;
    wire              s2mm_sts_tready;

    // Khởi tạo gemm_l2_axi_lite_regs
    gemm_l2_axi_lite_regs #(
        .C_S_AXI_ADDR_WIDTH(8),
        .C_S_AXI_DATA_WIDTH(32),
        .ADDR_W            (ADDR_W),
        .DIM_W             (DIM_W)
    ) u_regs (
        .S_AXI_ACLK      (CLK_i),
        .S_AXI_ARESETN   (RST_i),
        .S_AXI_AWADDR    (S_AXI_AWADDR),
        .S_AXI_AWPROT    (S_AXI_AWPROT),
        .S_AXI_AWVALID   (S_AXI_AWVALID),
        .S_AXI_AWREADY   (S_AXI_AWREADY),
        .S_AXI_WDATA     (S_AXI_WDATA),
        .S_AXI_WSTRB     (S_AXI_WSTRB),
        .S_AXI_WVALID    (S_AXI_WVALID),
        .S_AXI_WREADY    (S_AXI_WREADY),
        .S_AXI_BRESP     (S_AXI_BRESP),
        .S_AXI_BVALID    (S_AXI_BVALID),
        .S_AXI_BREADY    (S_AXI_BREADY),
        .S_AXI_ARADDR    (S_AXI_ARADDR),
        .S_AXI_ARPROT    (S_AXI_ARPROT),
        .S_AXI_ARVALID   (S_AXI_ARVALID),
        .S_AXI_ARREADY   (S_AXI_ARREADY),
        .S_AXI_RDATA     (S_AXI_RDATA),
        .S_AXI_RRESP     (S_AXI_RRESP),
        .S_AXI_RVALID    (S_AXI_RVALID),
        .S_AXI_RREADY    (S_AXI_RREADY),
        .cfg_m_total_o   (reg_cfg_m_total),
        .cfg_n_total_o   (reg_cfg_n_total),
        .cfg_k_total_o   (reg_cfg_k_total),
        .cfg_k_dim_o     (reg_cfg_k_dim),
        .cfg_base_a_o    (reg_cfg_base_a),
        .cfg_base_b_o    (reg_cfg_base_b),
        .cfg_base_c_o    (reg_cfg_base_c),
        .cfg_base_c32_o  (reg_cfg_base_c32),
        .cfg_base_param_o(reg_cfg_base_param),
        .cfg_lda_o       (reg_cfg_lda),
        .cfg_ldb_o       (reg_cfg_ldb),
        .cfg_ldc_o       (reg_cfg_ldc),
        .cfg_ldc32_o     (reg_cfg_ldc32),
        .cfg_out_mode_o  (reg_cfg_out_mode),
        .start_o         (reg_start),
        .busy_i          (busy_o),
        .done_i          (done_o),
        .err_i           (err_o),
        .irq_o           (irq_o)
    );

    // Khởi tạo DUT: gemm_top_l2
    gemm_top_l2 #(
        .N         (N),
        .M_BLK     (M_BLK),
        .N_BLK     (N_BLK),
        .K_BLK     (K_BLK),
        .ADDR_W    (ADDR_W),
        .DIM_W     (DIM_W),
        .FIFO_DEPTH(FIFO_DEPTH),
        .BRAM_DEPTH(BRAM_DEPTH)
    ) dut (
        .CLK_i           (CLK_i),
        .RST_i           (RST_i),
        .cfg_m_total_i   (dut_m_total),
        .cfg_n_total_i   (dut_n_total),
        .cfg_k_total_i   (dut_k_total),
        .cfg_k_dim_i     (dut_k_dim),
        .cfg_base_a_i    (dut_base_a),
        .cfg_base_b_i    (dut_base_b),
        .cfg_base_c_i    (dut_base_c),
        .cfg_base_c32_i  (dut_base_c32),
        .cfg_base_param_i(dut_base_param),
        .cfg_lda_i       (dut_lda),
        .cfg_ldb_i       (dut_ldb),
        .cfg_ldc_i       (dut_ldc),
        .cfg_ldc32_i     (dut_ldc32),
        .cfg_out_mode_i  (dut_out_mode),
        .start_i         (dut_start),
        .busy_o          (busy_o),
        .done_o          (done_o),
        .err_o           (err_o),
        .mm2s_cmd_tdata  (mm2s_cmd_tdata),
        .mm2s_cmd_tvalid (mm2s_cmd_tvalid),
        .mm2s_cmd_tready (mm2s_cmd_tready),
        .mm2s_tdata      (mm2s_tdata),
        .mm2s_tvalid     (mm2s_tvalid),
        .mm2s_tready     (mm2s_tready),
        .mm2s_tlast      (mm2s_tlast),
        .s2mm_cmd_tdata  (s2mm_cmd_tdata),
        .s2mm_cmd_tvalid (s2mm_cmd_tvalid),
        .s2mm_cmd_tready (s2mm_cmd_tready),
        .s2mm_tdata      (s2mm_tdata),
        .s2mm_tvalid     (s2mm_tvalid),
        .s2mm_tready     (s2mm_tready),
        .s2mm_tlast      (s2mm_tlast),
        .s2mm_tkeep      (s2mm_tkeep),
        .s2mm_sts_tdata  (s2mm_sts_tdata),
        .s2mm_sts_tvalid (s2mm_sts_tvalid),
        .s2mm_sts_tready (s2mm_sts_tready)
    );

    // Tạo xung nhịp 200 MHz
    initial begin
        CLK_i = 1'b0;
        forever #(CLK_NS / 2.0) CLK_i = ~CLK_i;
    end

    // Thống kê & Functional Coverage
    int unsigned seed                = 32'h2026_1118;
    int          total_errors        = 0;
    int          test_errors         = 0;
    int          total_jobs_verified = 0;
    longint      total_bytes_checked = 0;
    string       cur_test_id         = "INIT";

    int cov_smoke_16x16         = 0;
    int cov_out_modes_3         = 0;
    int cov_cfg_err_14          = 0;
    int cov_small_m_decode      = 0;
    int cov_odd_k_garbage_mask  = 0;
    int cov_odd_n_tkeep_canary  = 0;
    int cov_non_contig_stride   = 0;
    int cov_multi_k_uram_pram   = 0;
    int cov_3d_tiling_2x2x2     = 0;
    int cov_pram_from_wait_slot = 0;
    int cov_pram_from_f_done    = 0;
    int cov_drain_occ16_credit  = 0;
    int cov_wait_sts_gate       = 0;
    int cov_all_5_dma_bp        = 0;
    int cov_qwen2_real_shapes   = 0;
    int cov_b2b_and_mid_rst     = 0;
    int cov_axil_integrated_sys = 0;

    //==========================================================================
    // MÔ HÌNH BỘ NHỚ DDR4 & PHẢN HỒI AXI DATAMOVER NGAY TRONG TESTBENCH
    //==========================================================================
    byte unsigned ddr_mem [0:DDR_SIZE-1];

    typedef struct packed {
        logic [31:0] addr;
        logic [22:0] btt;
    } dma_cmd_t;

    dma_cmd_t mm2s_cmd_q [$];
    dma_cmd_t s2mm_cmd_q [$];
    int       sts_delay_q[$];

    // Tham số điều khiển xác suất back-pressure & độ trễ status
    int cfg_mm2s_cmd_ready_prob = 100;
    int cfg_mm2s_data_valid_prob = 100;
    int cfg_s2mm_cmd_ready_prob = 100;
    int cfg_s2mm_data_ready_prob = 100;
    int cfg_s2mm_sts_delay      = 1;
    bit force_s2mm_cmd_stall    = 1'b0;
    bit force_s2mm_data_stall   = 1'b0;

    // Bộ đếm giao dịch DMA phục vụ kiểm tra
    int mm2s_cmd_cnt      = 0;
    int mm2s_pram_cmd_cnt = 0;
    int s2mm_cmd_cnt      = 0;
    int s2mm_sts_sent_cnt = 0;

    // Trạng thái gói S2MM đang nhận
    bit          s2mm_in_pkt       = 1'b0;
    logic [31:0] s2mm_cur_addr     = 32'h0;
    int          s2mm_cur_btt      = 0;
    int          s2mm_cur_off      = 0;
    int          s2mm_cur_valid_b  = 0;

    // Trạng thái gói MM2S đang phát
    bit          mm2s_in_pkt       = 1'b0;
    logic [31:0] mm2s_cur_addr     = 32'h0;
    int          mm2s_beats_left   = 0;

    task automatic reset_dma_responder();
        mm2s_cmd_q.delete();
        s2mm_cmd_q.delete();
        sts_delay_q.delete();
        mm2s_cmd_cnt      = 0;
        mm2s_pram_cmd_cnt = 0;
        s2mm_cmd_cnt      = 0;
        s2mm_sts_sent_cnt = 0;
        s2mm_in_pkt       = 1'b0;
        mm2s_in_pkt       = 1'b0;
        mm2s_tdata        = '0;
        mm2s_tvalid       = 1'b0;
        mm2s_tlast        = 1'b0;
        s2mm_sts_tdata    = 8'h80;
        s2mm_sts_tvalid   = 1'b0;
    endtask

    // 1. Điều khiển tready ngẫu nhiên cho mm2s_cmd, s2mm_cmd, s2mm_data
    always @(posedge CLK_i) begin
        if (!RST_i) begin
            mm2s_cmd_tready <= 1'b0;
            s2mm_cmd_tready <= 1'b0;
            s2mm_tready     <= 1'b0;
        end else begin
            mm2s_cmd_tready <= ($urandom_range(1, 100) <= cfg_mm2s_cmd_ready_prob);
            s2mm_cmd_tready <= !force_s2mm_cmd_stall  && ($urandom_range(1, 100) <= cfg_s2mm_cmd_ready_prob);
            s2mm_tready     <= !force_s2mm_data_stall && ($urandom_range(1, 100) <= cfg_s2mm_data_ready_prob);
        end
    end

    // 2. Thu nhận lệnh MM2S & S2MM và xử lý dữ liệu S2MM + Status
    always @(posedge CLK_i) begin
        if (!RST_i) begin
            reset_dma_responder();
        end else begin
            // --- Nhận lệnh MM2S ---
            if (mm2s_cmd_tvalid && mm2s_cmd_tready) begin
                automatic dma_cmd_t c;
                c.addr = mm2s_cmd_tdata[63:32];
                c.btt  = mm2s_cmd_tdata[22:0];
                mm2s_cmd_q.push_back(c);
                mm2s_cmd_cnt++;
                if (dut.u_l2_tiling_agu.fetch_state_r == 4'd7) begin // F_P_CMD
                    mm2s_pram_cmd_cnt++;
                    if (dut.u_l2_tiling_agu.p_ret_done_r) cov_pram_from_f_done++;
                    else                                  cov_pram_from_wait_slot++;
                end
            end

            // --- Phát dữ liệu MM2S từ ddr_mem ---
            if (mm2s_tvalid && mm2s_tready) begin
                if (mm2s_tlast) begin
                    mm2s_in_pkt <= 1'b0;
                    mm2s_tvalid <= 1'b0;
                    mm2s_tlast  <= 1'b0;
                end else begin
                    mm2s_cur_addr   <= mm2s_cur_addr + 32'd16;
                    mm2s_beats_left <= mm2s_beats_left - 1;
                    if (($urandom_range(1, 100) <= cfg_mm2s_data_valid_prob)) begin
                        mm2s_tvalid <= 1'b1;
                        mm2s_tlast  <= (mm2s_beats_left - 1 == 1);
                        for (int b = 0; b < 16; b++) begin
                            mm2s_tdata[b*8 +: 8] <= ddr_mem[(mm2s_cur_addr + 16 + b) & (DDR_SIZE - 1)];
                        end
                    end else begin
                        mm2s_tvalid <= 1'b0;
                        mm2s_tlast  <= 1'b0;
                    end
                end
            end else if (!mm2s_tvalid) begin
                if (mm2s_in_pkt) begin
                    // Tiếp tục gói đang tạm nghỉ bubble
                    if ($urandom_range(1, 100) <= cfg_mm2s_data_valid_prob) begin
                        mm2s_tvalid <= 1'b1;
                        mm2s_tlast  <= (mm2s_beats_left == 1);
                        for (int b = 0; b < 16; b++) begin
                            mm2s_tdata[b*8 +: 8] <= ddr_mem[(mm2s_cur_addr + b) & (DDR_SIZE - 1)];
                        end
                    end
                end else if (mm2s_cmd_q.size() > 0 && ($urandom_range(1, 100) <= cfg_mm2s_data_valid_prob)) begin
                    // Bắt đầu lệnh MM2S mới ở đầu hàng đợi
                    automatic dma_cmd_t c = mm2s_cmd_q.pop_front();
                    automatic int nbeats  = (int'(c.btt) + 15) / 16;
                    mm2s_in_pkt     <= 1'b1;
                    mm2s_cur_addr   <= c.addr;
                    mm2s_beats_left <= nbeats;
                    mm2s_tvalid     <= 1'b1;
                    mm2s_tlast      <= (nbeats == 1);
                    for (int b = 0; b < 16; b++) begin
                        mm2s_tdata[b*8 +: 8] <= ddr_mem[(c.addr + b) & (DDR_SIZE - 1)];
                    end
                end
            end

            // --- Nhận lệnh S2MM ---
            if (s2mm_cmd_tvalid && s2mm_cmd_tready) begin
                automatic dma_cmd_t c;
                c.addr = s2mm_cmd_tdata[63:32];
                c.btt  = s2mm_cmd_tdata[22:0];
                s2mm_cmd_q.push_back(c);
                s2mm_cmd_cnt++;
            end

            // --- Kiểm tra quy tắc Command-Before-Data (TOP_011) ---
            if (s2mm_tvalid && !s2mm_in_pkt) begin
                // Lệnh S2MM phải đã được chấp nhận ở chu kỳ trước hoặc ngay trong chu kỳ này
                if ((s2mm_cmd_q.size() == 0) && !(s2mm_cmd_tvalid && s2mm_cmd_tready)) begin
                    $display("[ERROR][%s] Cycle %0t: S2MM data beat arrived BEFORE S2MM command handshake!",
                             cur_test_id, $time);
                    test_errors++; total_errors++;
                end
            end

            // --- Nhận dữ liệu S2MM & ghi vào ddr_mem theo s2mm_tkeep ---
            if (s2mm_tvalid && s2mm_tready) begin
                automatic logic [31:0] base_wr;
                automatic int          exp_btt;
                automatic int          cur_off;
                automatic int          cur_vb;

                if (!s2mm_in_pkt) begin
                    automatic dma_cmd_t c;
                    if (s2mm_cmd_q.size() > 0) begin
                        c = s2mm_cmd_q.pop_front();
                    end else begin
                        // Trường hợp lệnh và beat đầu tiên bắt tay cùng chu kỳ
                        c.addr = s2mm_cmd_tdata[63:32];
                        c.btt  = s2mm_cmd_tdata[22:0];
                        void'(s2mm_cmd_q.pop_front());
                    end
                    base_wr = c.addr;
                    exp_btt = int'(c.btt);
                    cur_off = 0;
                    cur_vb  = 0;
                end else begin
                    base_wr = s2mm_cur_addr;
                    exp_btt = s2mm_cur_btt;
                    cur_off = s2mm_cur_off;
                    cur_vb  = s2mm_cur_valid_b;
                end

                // Kiểm tra s2mm_tkeep liền mạch từ LSB (contiguous LSB mask)
                begin
                    automatic bit seen_zero = 1'b0;
                    for (int b = 0; b < 16; b++) begin
                        if (!s2mm_tkeep[b]) seen_zero = 1'b1;
                        else if (seen_zero) begin
                            $display("[ERROR][%s] Cycle %0t: Non-contiguous s2mm_tkeep=0x%04h!",
                                     cur_test_id, $time, s2mm_tkeep);
                            test_errors++; total_errors++;
                        end
                    end
                end

                for (int b = 0; b < 16; b++) begin
                    if (s2mm_tkeep[b]) begin
                        ddr_mem[(base_wr + cur_off + b) & (DDR_SIZE - 1)] = s2mm_tdata[b*8 +: 8];
                        cur_vb++;
                    end
                end
                cur_off += 16;

                if (s2mm_tlast) begin
                    s2mm_in_pkt <= 1'b0;
                    if (cur_vb != exp_btt) begin
                        $display("[ERROR][%s] Cycle %0t: S2MM packet active byte count (%0d) != command BTT (%0d) at addr 0x%08h!",
                                 cur_test_id, $time, cur_vb, exp_btt, base_wr);
                        test_errors++; total_errors++;
                    end
                    // Đưa gói status vào hàng đợi đếm ngược
                    sts_delay_q.push_back(cfg_s2mm_sts_delay);
                end else begin
                    s2mm_in_pkt      <= 1'b1;
                    s2mm_cur_addr    <= base_wr;
                    s2mm_cur_btt     <= exp_btt;
                    s2mm_cur_off     <= cur_off;
                    s2mm_cur_valid_b <= cur_vb;
                end
            end

            // --- Phát gói phản hồi s2mm_sts sau khi hết thời gian trễ ---
            if (s2mm_sts_tvalid && s2mm_sts_tready) begin
                s2mm_sts_tvalid <= 1'b0;
                s2mm_sts_sent_cnt++;
            end
            for (int i = 0; i < sts_delay_q.size(); i++) begin
                if (sts_delay_q[i] > 0) sts_delay_q[i] = sts_delay_q[i] - 1;
            end
            if ((!s2mm_sts_tvalid || s2mm_sts_tready) && (sts_delay_q.size() > 0) && (sts_delay_q[0] == 0)) begin
                void'(sts_delay_q.pop_front());
                s2mm_sts_tvalid <= 1'b1;
                s2mm_sts_tdata  <= 8'h80; // OKAY
            end
        end
    end

    //==========================================================================
    // KIỂM TRA BẤT BIẾN SVA MỖI CHU KỲ (AXIS Stability, Credit FIFO, Done Pulse)
    //==========================================================================
    logic        prev_done_o;
    logic        prev_mm2s_cmd_stalled;
    logic [71:0] prev_mm2s_cmd_tdata;
    logic        prev_s2mm_cmd_stalled;
    logic [71:0] prev_s2mm_cmd_tdata;
    logic        prev_s2mm_data_stalled;
    logic [127:0] prev_s2mm_tdata;
    logic [15:0] prev_s2mm_tkeep;
    logic        prev_s2mm_tlast;

    always @(posedge CLK_i) begin
        if (!RST_i) begin
            prev_done_o            <= 1'b0;
            prev_mm2s_cmd_stalled  <= 1'b0;
            prev_s2mm_cmd_stalled  <= 1'b0;
            prev_s2mm_data_stalled <= 1'b0;
        end else begin
            // 1. Kiểm tra X/Z trên các cổng điều khiển
            if ($isunknown({busy_o, done_o, err_o, mm2s_cmd_tvalid, s2mm_cmd_tvalid, s2mm_tvalid})) begin
                $display("[ERROR][%s] Cycle %0t: Top-level control signals contain X/Z!", cur_test_id, $time);
                test_errors++; total_errors++;
            end

            // 2. done_o chỉ là xung 1 chu kỳ
            if (done_o && prev_done_o) begin
                $display("[ERROR][%s] Cycle %0t: done_o stayed high for >1 cycle!", cur_test_id, $time);
                test_errors++; total_errors++;
            end
            prev_done_o <= done_o;

            // 3. Bất biến AXIS Master: giữ nguyên dữ liệu khi tvalid && !tready
            if (prev_mm2s_cmd_stalled) begin
                if (!mm2s_cmd_tvalid || (mm2s_cmd_tdata !== prev_mm2s_cmd_tdata)) begin
                    $display("[ERROR][%s] Cycle %0t: mm2s_cmd unstable during tready=0!", cur_test_id, $time);
                    test_errors++; total_errors++;
                end
            end
            prev_mm2s_cmd_stalled <= (mm2s_cmd_tvalid && !mm2s_cmd_tready);
            prev_mm2s_cmd_tdata   <= mm2s_cmd_tdata;

            if (prev_s2mm_cmd_stalled) begin
                if (!s2mm_cmd_tvalid || (s2mm_cmd_tdata !== prev_s2mm_cmd_tdata)) begin
                    $display("[ERROR][%s] Cycle %0t: s2mm_cmd unstable during tready=0!", cur_test_id, $time);
                    test_errors++; total_errors++;
                end
            end
            prev_s2mm_cmd_stalled <= (s2mm_cmd_tvalid && !s2mm_cmd_tready);
            prev_s2mm_cmd_tdata   <= s2mm_cmd_tdata;

            if (prev_s2mm_data_stalled) begin
                if (!s2mm_tvalid || (s2mm_tdata !== prev_s2mm_tdata) ||
                    (s2mm_tkeep !== prev_s2mm_tkeep) || (s2mm_tlast !== prev_s2mm_tlast)) begin
                    $display("[ERROR][%s] Cycle %0t: s2mm_data unstable during tready=0!", cur_test_id, $time);
                    test_errors++; total_errors++;
                end
            end
            prev_s2mm_data_stalled <= (s2mm_tvalid && !s2mm_tready);
            prev_s2mm_tdata        <= s2mm_tdata;
            prev_s2mm_tkeep        <= s2mm_tkeep;
            prev_s2mm_tlast        <= s2mm_tlast;

            // 4. Bất biến Credit FIFO 16 mục trong C_DRAIN (occ_r <= 16)
            if (dut.u_l2_tiling_agu.occ_r > 5'd16) begin
                $display("[ERROR][%s] Cycle %0t: Drain credit counter occ_r=%0d exceeded 16!",
                         cur_test_id, $time, dut.u_l2_tiling_agu.occ_r);
                test_errors++; total_errors++;
            end
            if (dut.u_l2_tiling_agu.occ_r == 5'd16) begin
                cov_drain_occ16_credit++;
            end
        end
    end

    //==========================================================================
    // GOLDEN MODEL TOÀN TRÌNH (Arbitrary M/K/N, Strides, INT32 & Per-Channel INT8)
    //==========================================================================
    function automatic logic signed [7:0] golden_requant_lane(
        input logic signed [31:0] acc,
        input logic signed [31:0] bias,
        input logic signed [31:0] mult,
        input logic        [7:0]  shift_raw,
        input logic signed [31:0] zp
    );
        automatic logic signed [127:0] t, p, rnd, q, y;
        automatic logic        [5:0]   s;
        s   = shift_raw[5:0];
        t   = 128'(signed'(acc)) + 128'(signed'(bias));
        p   = t * 128'(signed'(mult));
        rnd = (s == 6'd0) ? 128'sd0 : (128'sd1 <<< (s - 6'd1));
        q   = (p + rnd) >>> s;
        y   = q + 128'(signed'(zp));
        if (y > 128'sd127)       return 8'sd127;
        else if (y < -128'sd128) return -8'sd128;
        else                     return y[7:0];
    endfunction

    // Đọc/ghi word 32-bit little-endian trong ddr_mem
    function automatic void ddr_write_i32(input logic [31:0] addr, input logic signed [31:0] val);
        ddr_mem[(addr + 0) & (DDR_SIZE - 1)] = val[7:0];
        ddr_mem[(addr + 1) & (DDR_SIZE - 1)] = val[15:8];
        ddr_mem[(addr + 2) & (DDR_SIZE - 1)] = val[23:16];
        ddr_mem[(addr + 3) & (DDR_SIZE - 1)] = val[31:24];
    endfunction

    function automatic logic signed [31:0] ddr_read_i32(input logic [31:0] addr);
        return signed'({
            ddr_mem[(addr + 3) & (DDR_SIZE - 1)],
            ddr_mem[(addr + 2) & (DDR_SIZE - 1)],
            ddr_mem[(addr + 1) & (DDR_SIZE - 1)],
            ddr_mem[(addr + 0) & (DDR_SIZE - 1)]
        });
    endfunction

    // Chuẩn bị dữ liệu A, B, Param và điền Canary Guard quanh vùng nhớ đích C, C32
    task automatic prepare_gemm_memory(
        input int          M,
        input int          K,
        input int          N_cols,
        input logic [31:0] base_a,
        input logic [31:0] base_b,
        input logic [31:0] base_p,
        input logic [31:0] base_c,
        input logic [31:0] base_c32,
        input int          lda,
        input int          ldb,
        input int          ldc,
        input int          ldc32,
        input byte unsigned canary_c   = 8'hAA,
        input byte unsigned canary_c32 = 8'hCC,
        input bit          fill_padding_garbage = 1'b0
    );
        automatic int m_guard_rows = M + 16;
        // 1. Khởi tạo ma trận A[M][lda] (điền rác cực đại vào các cột >= K nếu fill_padding_garbage=1)
        for (int m = 0; m < m_guard_rows; m++) begin
            for (int k = 0; k < lda; k++) begin
                if (m < M && k < K) begin
                    ddr_mem[(base_a + m * lda + k) & (DDR_SIZE - 1)] =
                        byte'(signed'($urandom_range(0, 120) - 60));
                end else begin
                    ddr_mem[(base_a + m * lda + k) & (DDR_SIZE - 1)] =
                        fill_padding_garbage ? ((k[0]) ? 8'h7F : 8'h80) : 8'h00;
                end
            end
        end

        // 2. Khởi tạo ma trận B[K_padded][ldb] (bao gồm các hàng dư tới bội 256)
        begin
            automatic int k_alloc = ((K + 255) / 256) * 256;
            for (int k = 0; k < k_alloc; k++) begin
                for (int n = 0; n < ldb; n++) begin
                    if (k < K && n < N_cols) begin
                        ddr_mem[(base_b + k * ldb + n) & (DDR_SIZE - 1)] =
                            byte'(signed'($urandom_range(0, 120) - 60));
                    end else begin
                        ddr_mem[(base_b + k * ldb + n) & (DDR_SIZE - 1)] =
                            fill_padding_garbage ? ((n[0]) ? 8'h80 : 8'h7F) : 8'h00;
                    end
                end
            end
        end

        // 3. Khởi tạo bảng tham số requant theo từng kênh (16 byte/kênh: bias, mult, shift, zp)
        begin
            automatic int n_alloc = ((N_cols + 255) / 256) * 256;
            for (int n = 0; n < n_alloc; n++) begin
                automatic logic [31:0] ent_addr = base_p + n * 16;
                automatic logic signed [31:0] p_bias = signed'($urandom_range(0, 400) - 200);
                automatic logic signed [31:0] p_mult = signed'($urandom_range(1, 15));
                automatic logic signed [31:0] p_sh   = signed'($urandom_range(6, 11));
                automatic logic signed [31:0] p_zp   = signed'($urandom_range(0, 20) - 10);
                ddr_write_i32(ent_addr + 0,  p_bias);
                ddr_write_i32(ent_addr + 4,  p_mult);
                ddr_write_i32(ent_addr + 8,  p_sh);
                ddr_write_i32(ent_addr + 12, p_zp);
            end
        end

        // 4. Điền Canary Guard vào toàn bộ vùng đích C (bao gồm 16 hàng trước và 16 hàng sau M)
        for (int m = 0; m < m_guard_rows; m++) begin
            for (int c = 0; c < ldc; c++) begin
                ddr_mem[(base_c + m * ldc + c) & (DDR_SIZE - 1)] = canary_c;
            end
            for (int c = 0; c < ldc32; c++) begin
                ddr_mem[(base_c32 + m * ldc32 + c) & (DDR_SIZE - 1)] = canary_c32;
            end
        end
    endtask

    // Kiểm tra kết quả trong DDR so với Golden Matmul + Requant và kiểm tra Canary Guard
    task automatic verify_gemm_memory(
        input int          M,
        input int          K,
        input int          N_cols,
        input logic [31:0] base_a,
        input logic [31:0] base_b,
        input logic [31:0] base_p,
        input logic [31:0] base_c,
        input logic [31:0] base_c32,
        input int          lda,
        input int          ldb,
        input int          ldc,
        input int          ldc32,
        input logic [1:0]  out_mode,
        input byte unsigned canary_c   = 8'hAA,
        input byte unsigned canary_c32 = 8'hCC
    );
        automatic int m_guard_rows = M + 8;

        for (int m = 0; m < M; m++) begin
            for (int n = 0; n < N_cols; n++) begin
                automatic logic signed [31:0] acc = 32'sd0;
                for (int k = 0; k < K; k++) begin
                    automatic logic signed [7:0] a_v = signed'(ddr_mem[(base_a + m * lda + k) & (DDR_SIZE - 1)]);
                    automatic logic signed [7:0] b_v = signed'(ddr_mem[(base_b + k * ldb + n) & (DDR_SIZE - 1)]);
                    acc += 32'(a_v) * 32'(b_v);
                end

                // Kiểm tra INT8 output nếu out_mode[0] == 1
                if (out_mode[0]) begin
                    automatic logic [31:0] p_addr = base_p + n * 16;
                    automatic logic signed [31:0] p_bias = ddr_read_i32(p_addr + 0);
                    automatic logic signed [31:0] p_mult = ddr_read_i32(p_addr + 4);
                    automatic logic        [7:0]  p_sh   = ddr_mem[(p_addr + 8) & (DDR_SIZE - 1)];
                    automatic logic signed [31:0] p_zp   = ddr_read_i32(p_addr + 12);
                    automatic logic signed [7:0]  exp_c8 = golden_requant_lane(acc, p_bias, p_mult, p_sh, p_zp);
                    automatic logic signed [7:0]  act_c8 = signed'(ddr_mem[(base_c + m * ldc + n) & (DDR_SIZE - 1)]);
                    total_bytes_checked++;
                    if (act_c8 !== exp_c8) begin
                        if (test_errors < 20) begin
                            $display("[ERROR][%s] C8[%0d][%0d] mismatch: Expected=%0d (0x%02h), Actual=%0d (0x%02h)",
                                     cur_test_id, m, n, exp_c8, exp_c8[7:0], act_c8, act_c8[7:0]);
                        end
                        test_errors++; total_errors++;
                    end
                end

                // Kiểm tra INT32 output nếu out_mode[1] == 1
                if (out_mode[1]) begin
                    automatic logic signed [31:0] act_c32 = ddr_read_i32(base_c32 + m * ldc32 + n * 4);
                    total_bytes_checked += 4;
                    if (act_c32 !== acc) begin
                        if (test_errors < 20) begin
                            $display("[ERROR][%s] C32[%0d][%0d] mismatch: Expected=%0d, Actual=%0d",
                                     cur_test_id, m, n, acc, act_c32);
                        end
                        test_errors++; total_errors++;
                    end
                end
            end

            // Kiểm tra Canary Guard trên các cột dư (n = N_cols .. ldc-1) của hàng m
            if (out_mode[0]) begin
                for (int c = N_cols; c < ldc; c++) begin
                    automatic byte unsigned b_val = ddr_mem[(base_c + m * ldc + c) & (DDR_SIZE - 1)];
                    if (b_val !== canary_c) begin
                        if (test_errors < 20) begin
                            $display("[ERROR][%s] Canary overwritten in C8 row %0d col_byte %0d (N=%0d): Expected=0x%02h, Actual=0x%02h",
                                     cur_test_id, m, c, N_cols, canary_c, b_val);
                        end
                        test_errors++; total_errors++;
                    end
                end
            end
            if (out_mode[1]) begin
                for (int c = N_cols * 4; c < ldc32; c++) begin
                    automatic byte unsigned b_val = ddr_mem[(base_c32 + m * ldc32 + c) & (DDR_SIZE - 1)];
                    if (b_val !== canary_c32) begin
                        if (test_errors < 20) begin
                            $display("[ERROR][%s] Canary overwritten in C32 row %0d col_byte %0d (4*N=%0d): Expected=0x%02h, Actual=0x%02h",
                                     cur_test_id, m, c, N_cols * 4, canary_c32, b_val);
                        end
                        test_errors++; total_errors++;
                    end
                end
            end
        end

        // Kiểm tra Canary Guard trên các hàng ngoài biên (m = M .. M+7)
        for (int m = M; m < m_guard_rows; m++) begin
            if (out_mode[0]) begin
                for (int c = 0; c < ldc; c++) begin
                    automatic byte unsigned b_val = ddr_mem[(base_c + m * ldc + c) & (DDR_SIZE - 1)];
                    if (b_val !== canary_c) begin
                        if (test_errors < 20) begin
                            $display("[ERROR][%s] Row overrun in C8 past M=%0d at row %0d col %0d: Expected=0x%02h, Actual=0x%02h",
                                     cur_test_id, M, m, c, canary_c, b_val);
                        end
                        test_errors++; total_errors++;
                    end
                end
            end
            if (out_mode[1]) begin
                for (int c = 0; c < ldc32; c++) begin
                    automatic byte unsigned b_val = ddr_mem[(base_c32 + m * ldc32 + c) & (DDR_SIZE - 1)];
                    if (b_val !== canary_c32) begin
                        if (test_errors < 20) begin
                            $display("[ERROR][%s] Row overrun in C32 past M=%0d at row %0d col %0d: Expected=0x%02h, Actual=0x%02h",
                                     cur_test_id, M, m, c, canary_c32, b_val);
                        end
                        test_errors++; total_errors++;
                    end
                end
            end
        end
        total_jobs_verified++;
    endtask

    //==========================================================================
    // CÁC TASK ĐIỀU KHIỂN CHẠY JOB (TRỰC TIẾP & QUA AXI4-LITE)
    //==========================================================================
    function automatic int ceil16(input int x);
        return ((x + 15) / 16) * 16;
    endfunction

    task automatic init_signals();
        use_axil_ctrl       = 1'b0;
        tb_cfg_m_total      = 20'd16;
        tb_cfg_n_total      = 20'd16;
        tb_cfg_k_total      = 20'd32;
        tb_cfg_k_dim        = 20'd32;
        tb_cfg_base_a       = BASE_A_DEFAULT;
        tb_cfg_base_b       = BASE_B_DEFAULT;
        tb_cfg_base_c       = BASE_C_DEFAULT;
        tb_cfg_base_c32     = BASE_C32_DEFAULT;
        tb_cfg_base_param   = BASE_P_DEFAULT;
        tb_cfg_lda          = 32'd32;
        tb_cfg_ldb          = 32'd16;
        tb_cfg_ldc          = 32'd16;
        tb_cfg_ldc32        = 32'd64;
        tb_cfg_out_mode     = 2'b01;
        tb_start            = 1'b0;

        S_AXI_AWADDR        = '0;
        S_AXI_AWPROT        = '0;
        S_AXI_AWVALID       = 1'b0;
        S_AXI_WDATA         = '0;
        S_AXI_WSTRB         = 4'hF;
        S_AXI_WVALID        = 1'b0;
        S_AXI_BREADY        = 1'b0;
        S_AXI_ARADDR        = '0;
        S_AXI_ARPROT        = '0;
        S_AXI_ARVALID       = 1'b0;
        S_AXI_RREADY        = 1'b0;

        cfg_mm2s_cmd_ready_prob  = 100;
        cfg_mm2s_data_valid_prob = 100;
        cfg_s2mm_cmd_ready_prob  = 100;
        cfg_s2mm_data_ready_prob = 100;
        cfg_s2mm_sts_delay       = 1;
        force_s2mm_cmd_stall     = 1'b0;
        force_s2mm_data_stall    = 1'b0;
    endtask

    task automatic apply_reset(input int low_cycles = 10);
        @(negedge CLK_i);
        RST_i = 1'b0;
        init_signals();
        repeat (low_cycles) @(negedge CLK_i);
        RST_i = 1'b1;
        @(posedge CLK_i);
    endtask

    // Kích xung start_i trực tiếp và chờ done_o
    task automatic pulse_start_and_wait_done(input int max_cycles = 500000);
        automatic int cyc = 0;
        mm2s_cmd_cnt      = 0;
        mm2s_pram_cmd_cnt = 0;
        s2mm_cmd_cnt      = 0;
        s2mm_sts_sent_cnt = 0;

        @(negedge CLK_i);
        tb_start = 1'b1;
        @(negedge CLK_i);
        tb_start = 1'b0;

        while (!done_o && cyc < max_cycles) begin
            @(posedge CLK_i);
            cyc++;
        end
        if (!done_o) begin
            $display("[ERROR][%s] Timeout waiting for done_o after %0d cycles!", cur_test_id, max_cycles);
            test_errors++; total_errors++;
        end
        @(posedge CLK_i); #1;
        if (busy_o !== 1'b0) begin
            $display("[ERROR][%s] busy_o remained 1 after done_o!", cur_test_id, $time);
            test_errors++; total_errors++;
        end
    endtask

    // Cấu hình, khởi tạo DDR, chạy job trực tiếp và tự động kiểm tra kết quả + canary guard
    task automatic run_and_verify_job(
        input int         M,
        input int         K,
        input int         N_cols,
        input int         k_dim       = 32,
        input logic [1:0] out_mode    = 2'b01,
        input int         extra_lda   = 0,
        input int         extra_ldb   = 0,
        input int         extra_ldc   = 0,
        input int         extra_ldc32 = 0,
        input bit         fill_garbage = 1'b0
    );
        automatic int lda   = ceil16(K)        + extra_lda;
        automatic int ldb   = ceil16(N_cols)   + extra_ldb;
        automatic int ldc   = ceil16(N_cols)   + extra_ldc;
        automatic int ldc32 = ceil16(N_cols*4) + extra_ldc32;

        tb_cfg_m_total    = M[DIM_W-1:0];
        tb_cfg_n_total    = N_cols[DIM_W-1:0];
        tb_cfg_k_total    = K[DIM_W-1:0];
        tb_cfg_k_dim      = k_dim[DIM_W-1:0];
        tb_cfg_base_a     = BASE_A_DEFAULT;
        tb_cfg_base_b     = BASE_B_DEFAULT;
        tb_cfg_base_param = BASE_P_DEFAULT;
        tb_cfg_base_c     = BASE_C_DEFAULT;
        tb_cfg_base_c32   = BASE_C32_DEFAULT;
        tb_cfg_lda        = lda;
        tb_cfg_ldb        = ldb;
        tb_cfg_ldc        = ldc;
        tb_cfg_ldc32      = ldc32;
        tb_cfg_out_mode   = out_mode;

        prepare_gemm_memory(M, K, N_cols,
                            BASE_A_DEFAULT, BASE_B_DEFAULT, BASE_P_DEFAULT,
                            BASE_C_DEFAULT, BASE_C32_DEFAULT,
                            lda, ldb, ldc, ldc32, 8'hAA, 8'hCC, fill_garbage);

        pulse_start_and_wait_done();

        if (err_o !== 1'b0) begin
            $display("[ERROR][%s] Unexpected err_o=1 on valid job (M=%0d, K=%0d, N=%0d)!",
                     cur_test_id, M, K, N_cols);
            test_errors++; total_errors++;
        end

        verify_gemm_memory(M, K, N_cols,
                           BASE_A_DEFAULT, BASE_B_DEFAULT, BASE_P_DEFAULT,
                           BASE_C_DEFAULT, BASE_C32_DEFAULT,
                           lda, ldb, ldc, ldc32, out_mode, 8'hAA, 8'hCC);
    endtask

    // Các task AXI4-Lite dùng cho bài test tích hợp TOP_016
    task automatic axil_write(input logic [7:0] addr, input logic [31:0] data);
        @(negedge CLK_i);
        S_AXI_AWADDR  = addr;
        S_AXI_WDATA   = data;
        S_AXI_WSTRB   = 4'hF;
        S_AXI_AWVALID = 1'b1;
        S_AXI_WVALID  = 1'b1;
        S_AXI_BREADY  = 1'b1;
        while (!(S_AXI_AWVALID && S_AXI_AWREADY && S_AXI_WVALID && S_AXI_WREADY)) @(posedge CLK_i);
        @(negedge CLK_i);
        S_AXI_AWVALID = 1'b0;
        S_AXI_WVALID  = 1'b0;
        while (!S_AXI_BVALID) @(posedge CLK_i);
        @(negedge CLK_i);
        S_AXI_BREADY  = 1'b0;
    endtask

    task automatic axil_read(input logic [7:0] addr, output logic [31:0] rdata);
        @(negedge CLK_i);
        S_AXI_ARADDR  = addr;
        S_AXI_ARVALID = 1'b1;
        S_AXI_RREADY  = 1'b1;
        while (!(S_AXI_ARVALID && S_AXI_ARREADY)) @(posedge CLK_i);
        @(negedge CLK_i);
        S_AXI_ARVALID = 1'b0;
        while (!S_AXI_RVALID) @(posedge CLK_i);
        rdata = S_AXI_RDATA;
        @(negedge CLK_i);
        S_AXI_RREADY  = 1'b0;
    endtask

    task automatic begin_test(input string id, input string desc);
        cur_test_id = id;
        test_errors = 0;
        $display("--------------------------------------------------------------------------------");
        $display("[RUN ] %s : %s", id, desc);
    endtask

    task automatic end_test(input string id);
        if (test_errors == 0)
            $display("[PASS] %s completed with 0 errors.", id);
        else
            $display("[FAIL] %s failed with %0d errors!", id, test_errors);
    endtask

    // Watchdog timeout
    initial begin
        #800_000_000;
        $display("[FATAL] Watchdog timeout reached in tb_gemm_top_l2!");
        $finish;
    end

    //==========================================================================
    // CHƯƠNG TRÌNH KIỂM THỬ CHÍNH (TOP_001 .. TOP_016)
    //==========================================================================
    initial begin
        automatic int dummy;
        dummy = $value$plusargs("SEED=%d", seed);
        dummy = $urandom(seed);
        $display("================================================================================");
        $display(" STARTING TESTBENCH: tb_gemm_top_l2 (SEED = 0x%08h)", seed);
        $display("================================================================================");

        RST_i = 1'b0;
        init_signals();
        apply_reset(10);

        // ---------------------------------------------------------------------
        // TOP_001: Smoke & Single 16x16x32 Tile (INT8 Row Mode)
        // ---------------------------------------------------------------------
        begin_test("TOP_001", "Smoke test: Single 16x16x32 tile in INT8 row mode (out_mode=01)");
        run_and_verify_job(16, 32, 16, 32, 2'b01);
        cov_smoke_16x16++;
        end_test("TOP_001");

        // ---------------------------------------------------------------------
        // TOP_002: Output Mode Selection (2'b01 INT8, 2'b10 INT32, 2'b11 Dual)
        // ---------------------------------------------------------------------
        begin_test("TOP_002", "Verify all 3 valid output modes: 01 (INT8 row), 10 (INT32-only, 0 PRAM DMA), 11 (Dual)");
        // 1. Mode 2'b01
        run_and_verify_job(32, 64, 32, 32, 2'b01);
        if (mm2s_pram_cmd_cnt != 1) begin
            $display("[ERROR][TOP_002] Mode 01 expected 1 PRAM DMA command, observed=%0d", mm2s_pram_cmd_cnt);
            test_errors++; total_errors++;
        end
        cov_out_modes_3++;

        // 2. Mode 2'b10 (INT32 only -> không được nạp bảng tham số PRAM!)
        run_and_verify_job(32, 64, 32, 32, 2'b10);
        if (mm2s_pram_cmd_cnt != 0) begin
            $display("[ERROR][TOP_002] Mode 10 (INT32-only) unexpectedly issued %0d PRAM DMA commands!", mm2s_pram_cmd_cnt);
            test_errors++; total_errors++;
        end
        cov_out_modes_3++;

        // 3. Mode 2'b11 (Dual INT8 + INT32)
        run_and_verify_job(32, 64, 32, 32, 2'b11);
        if (mm2s_pram_cmd_cnt != 1) begin
            $display("[ERROR][TOP_002] Mode 11 expected 1 PRAM DMA command, observed=%0d", mm2s_pram_cmd_cnt);
            test_errors++; total_errors++;
        end
        cov_out_modes_3++;
        end_test("TOP_002");

        // ---------------------------------------------------------------------
        // TOP_003: Negative Test - Configuration Error Checker (14 Invalid Cases)
        // ---------------------------------------------------------------------
        begin_test("TOP_003", "Hardware configuration error checker (cfg_ok_w) across all 14 violation cases");
        for (int c = 1; c <= 14; c++) begin
            // Thiết lập cấu hình chuẩn trước, sau đó cố ý làm sai đúng 1 trường
            tb_cfg_m_total    = 20'd16;
            tb_cfg_n_total    = 20'd16;
            tb_cfg_k_total    = 20'd32;
            tb_cfg_k_dim      = 20'd32;
            tb_cfg_base_a     = BASE_A_DEFAULT;
            tb_cfg_base_b     = BASE_B_DEFAULT;
            tb_cfg_base_c     = BASE_C_DEFAULT;
            tb_cfg_base_c32   = BASE_C32_DEFAULT;
            tb_cfg_base_param = BASE_P_DEFAULT;
            tb_cfg_lda        = 32'd32;
            tb_cfg_ldb        = 32'd16;
            tb_cfg_ldc        = 32'd16;
            tb_cfg_ldc32      = 32'd64;
            tb_cfg_out_mode   = 2'b11;

            case (c)
                1:  tb_cfg_m_total    = 20'd0;              // M == 0
                2:  tb_cfg_n_total    = 20'd0;              // N == 0
                3:  tb_cfg_k_total    = 20'd0;              // K == 0
                4:  tb_cfg_k_dim      = 20'd0;              // k_dim == 0
                5:  tb_cfg_k_dim      = 20'd48;             // k_dim not power-of-2
                6:  tb_cfg_k_dim      = 20'd512;            // k_dim > 256
                7:  tb_cfg_out_mode   = 2'b00;              // out_mode == 00
                8:  tb_cfg_base_a     = 32'h0001_0004;      // base_a unaligned to 16B
                9:  tb_cfg_base_b     = 32'h0008_0008;      // base_b unaligned to 16B
                10: tb_cfg_lda        = 32'd16;             // lda < ceil16(K=32)
                11: tb_cfg_ldb        = 32'd24;             // ldb not multiple of 16
                12: tb_cfg_ldc        = 32'd0;              // out_int8=1 but ldc < N
                13: tb_cfg_base_param = 32'h0010_0002;      // out_int8=1 but base_param unaligned
                14: tb_cfg_ldc32      = 32'd48;             // out_int32=1 but ldc32 < 4*N (64)
            endcase

            pulse_start_and_wait_done(100);
            if (err_o !== 1'b1 || mm2s_cmd_cnt != 0 || s2mm_cmd_cnt != 0) begin
                $display("[ERROR][TOP_003] Case %0d failed to reject invalid config! err_o=%b, mm2s=%0d, s2mm=%0d",
                         c, err_o, mm2s_cmd_cnt, s2mm_cmd_cnt);
                test_errors++; total_errors++;
            end else begin
                cov_cfg_err_14++;
            end
        end
        // Lượt 15: Chạy cấu hình hợp lệ để xác nhận err_o tự động xóa về 0
        run_and_verify_job(16, 32, 16, 32, 2'b01);
        end_test("TOP_003");

        // ---------------------------------------------------------------------
        // TOP_004: Small M Boundary (Decode M=1, 3-Digit Fallback M=3, M=15)
        // ---------------------------------------------------------------------
        begin_test("TOP_004", "Small M boundary (Decode M=1, Fallback M=3, M=15) with canary row-overrun check");
        begin
            automatic int m_list[3] = '{1, 3, 15};
            foreach (m_list[idx]) begin
                automatic int m_v = m_list[idx];
                run_and_verify_job(m_v, 64, 32, 32, 2'b01);
                // Kiểm tra số lệnh MM2S đọc A đúng bằng M_v (không đọc thừa 16 hàng)
                run_and_verify_job(m_v, 64, 32, 32, 2'b11);
                cov_small_m_decode++;
            end
        end
        end_test("TOP_004");

        // ---------------------------------------------------------------------
        // TOP_005: Odd K Boundary & Padding Garbage Immunity (a_mask_d1_r)
        // ---------------------------------------------------------------------
        begin_test("TOP_005", "Odd K boundary (K=1, 15, 17, 33, 70) with +/-127/-128 garbage in DDR padding");
        begin
            automatic int k_list[5] = '{1, 15, 17, 33, 70};
            foreach (k_list[idx]) begin
                run_and_verify_job(16, k_list[idx], 16, 32, 2'b11, 0, 0, 0, 0, 1'b1);
                cov_odd_k_garbage_mask++;
            end
        end
        end_test("TOP_005");

        // ---------------------------------------------------------------------
        // TOP_006: Odd N Boundary & Partial s2mm_tkeep Canary Guard Check
        // ---------------------------------------------------------------------
        begin_test("TOP_006", "Odd N boundary (N=1, 3, 4, 5, 7, 12, 15, 17, 23) partial tkeep & canary guard check");
        begin
            automatic int n_list[9] = '{1, 3, 4, 5, 7, 12, 15, 17, 23};
            foreach (n_list[idx]) begin
                // Kiểm tra ở cả row_mode (2'b01) và dual tile_mode (2'b11)
                run_and_verify_job(4, 32, n_list[idx], 32, 2'b01);
                run_and_verify_job(4, 32, n_list[idx], 32, 2'b11);
                cov_odd_n_tkeep_canary++;
            end
        end
        end_test("TOP_006");

        // ---------------------------------------------------------------------
        // TOP_007: Non-Contiguous Strides (lda/ldb/ldc/ldc32 > Matrix Width)
        // ---------------------------------------------------------------------
        begin_test("TOP_007", "Non-contiguous strided submatrix layouts with inter-row canary guard verification");
        run_and_verify_job(20, 36, 20, 32, 2'b01, 48, 32, 32, 64, 1'b1);
        run_and_verify_job(20, 36, 20, 32, 2'b11, 48, 32, 32, 64, 1'b1);
        cov_non_contig_stride++;
        end_test("TOP_007");

        // ---------------------------------------------------------------------
        // TOP_008: Multi-K-Block C_ACCUM UltraRAM Accumulation & PRAM Prefetch
        // ---------------------------------------------------------------------
        begin_test("TOP_008", "Multi-K-block C_ACCUM UltraRAM accumulation (K=300 = 256+44, K=512) & PRAM prefetch");
        // K=300 (Block 0: kv=256, nch=8; Block 1: kv=44, nch=2)
        run_and_verify_job(24, 300, 24, 32, 2'b11, 0, 0, 0, 0, 1'b1);
        if (mm2s_pram_cmd_cnt != 1) begin
            $display("[ERROR][TOP_008] Expected PRAM loaded exactly once on last K-block, observed=%0d",
                     mm2s_pram_cmd_cnt);
            test_errors++; total_errors++;
        end
        // K=512 (2 full K-blocks) with k_dim=64
        run_and_verify_job(16, 512, 16, 64, 2'b01);
        cov_multi_k_uram_pram++;
        end_test("TOP_008");

        // ---------------------------------------------------------------------
        // TOP_009: Full 3D Multi-Block Tiling (M > 256, K > 256, N > 256)
        // ---------------------------------------------------------------------
        begin_test("TOP_009", "Full 3D multi-block tiling across M_BLK, K_BLK, N_BLK (>256) & PRAM reload");
        // Phần A: K > 256 và N > 256 (M=16, K=288, N=272 -> 1x2x2 L2 blocks, kiểm tra nạp lại PRAM ở p_addr_w + 4096 cho cột 256..271)
        run_and_verify_job(16, 288, 272, 64, 2'b11);
        if (mm2s_pram_cmd_cnt != 2) begin
            $display("[ERROR][TOP_009] Expected 2 PRAM loads for 2 N-blocks, observed=%0d",
                     mm2s_pram_cmd_cnt);
            test_errors++; total_errors++;
        end
        // Phần B: M > 256 (M=272, K=32, N=16 -> 2 M-blocks = 2 output blocks, kiểm tra bước nhảy r_a_mblk_step_w, r_c_mblk_step_w, r_c32_mblk_step_w)
        run_and_verify_job(272, 32, 16, 32, 2'b11);
        if (mm2s_pram_cmd_cnt != 2) begin
            $display("[ERROR][TOP_009] Expected 2 PRAM loads for 2 M-blocks (1 per output block), observed=%0d",
                     mm2s_pram_cmd_cnt);
            test_errors++; total_errors++;
        end else begin
            cov_3d_tiling_2x2x2++;
        end
        end_test("TOP_009");

        // ---------------------------------------------------------------------
        // TOP_010: v7 Feed-Ahead Generator & Ping-Pong GBUF + F_DONE PRAM Corner
        // ---------------------------------------------------------------------
        begin_test("TOP_010", "v7 Feed-Ahead Generator, ping-pong GBUF slot handoff, and F_DONE PRAM corner");
        // Với 1 K-block nhỏ (M=16, K=32, N=16), Fetch hoàn tất A/B và nhảy vào F_DONE trước khi PRAM xong (p_ret_done_r=1)
        // Với 2 K-block (M=32, K=300, N=32), PRAM cũng được kiểm tra khi Fetch chuyển giữa các slot
        run_and_verify_job(16, 16, 16, 16, 2'b01);
        run_and_verify_job(32, 300, 32, 32, 2'b01);
        if (cov_pram_from_f_done == 0 && cov_pram_from_wait_slot == 0) begin
            $display("[ERROR][TOP_010] Neither PRAM handshake path was hit!");
            test_errors++; total_errors++;
        end
        end_test("TOP_010");

        // ---------------------------------------------------------------------
        // TOP_011: Drain Producer-Writer 16-Entry Credit FIFO & Cmd-Before-Data
        // ---------------------------------------------------------------------
        begin_test("TOP_011", "Drain 16-entry credit FIFO (occ_r==16 saturation) and S2MM Command-Before-Data rule");
        begin
            automatic int lda   = 32;
            automatic int ldb   = 64;
            automatic int ldc   = 64;
            automatic int ldc32 = 256;
            tb_cfg_m_total    = 20'd32;
            tb_cfg_n_total    = 20'd48;
            tb_cfg_k_total    = 20'd32;
            tb_cfg_k_dim      = 20'd32;
            tb_cfg_base_a     = BASE_A_DEFAULT;
            tb_cfg_base_b     = BASE_B_DEFAULT;
            tb_cfg_base_param = BASE_P_DEFAULT;
            tb_cfg_base_c     = BASE_C_DEFAULT;
            tb_cfg_base_c32   = BASE_C32_DEFAULT;
            tb_cfg_lda        = lda;
            tb_cfg_ldb        = ldb;
            tb_cfg_ldc        = ldc;
            tb_cfg_ldc32      = ldc32;
            tb_cfg_out_mode   = 2'b01;

            prepare_gemm_memory(32, 32, 48,
                                BASE_A_DEFAULT, BASE_B_DEFAULT, BASE_P_DEFAULT,
                                BASE_C_DEFAULT, BASE_C32_DEFAULT,
                                lda, ldb, ldc, ldc32);

            fork
                begin
                    pulse_start_and_wait_done();
                end
                begin
                    // Chờ vào pha C_DRAIN (compute_state_r == 5'd7)
                    while (dut.u_l2_tiling_agu.compute_state_r != 5'd7) @(posedge CLK_i);
                    // Kịch bản A: Giữ s2mm_cmd_tready = 0 trong 25 chu kỳ đầu của C_DRAIN
                    force_s2mm_cmd_stall = 1'b1;
                    repeat (25) @(posedge CLK_i);
                    force_s2mm_cmd_stall = 1'b0;
                    // Kịch bản B: Giữ s2mm_tready = 0 trong 30 chu kỳ để occ_r tăng lên chạm trần 16
                    force_s2mm_data_stall = 1'b1;
                    repeat (30) @(posedge CLK_i);
                    force_s2mm_data_stall = 1'b0;
                end
            join

            verify_gemm_memory(32, 32, 48,
                               BASE_A_DEFAULT, BASE_B_DEFAULT, BASE_P_DEFAULT,
                               BASE_C_DEFAULT, BASE_C32_DEFAULT,
                               lda, ldb, ldc, ldc32, 2'b01);
            if (cov_drain_occ16_credit == 0) begin
                $display("[ERROR][TOP_011] Drain credit counter occ_r did not reach 16 during S2MM data stall!");
                test_errors++; total_errors++;
            end
        end
        end_test("TOP_011");

        // ---------------------------------------------------------------------
        // TOP_012: Deferred S2MM Status Completion Gate (C_WAIT_STS)
        // ---------------------------------------------------------------------
        begin_test("TOP_012", "Deferred S2MM status completion gate (C_WAIT_STS holds busy_o=1 until all status arrive)");
        begin
            automatic int wait_sts_cycles = 0;
            cfg_s2mm_sts_delay = 80; // Trì hoãn gói s2mm_sts 80 chu kỳ sau khi gửi xong dữ liệu
            fork
                begin
                    run_and_verify_job(16, 32, 32, 32, 2'b11);
                end
                begin
                    while (dut.u_l2_tiling_agu.compute_state_r != 5'd9) @(posedge CLK_i); // 5'd9 = C_WAIT_STS
                    while (dut.u_l2_tiling_agu.compute_state_r == 5'd9) begin
                        if (busy_o !== 1'b1 || done_o !== 1'b0) begin
                            $display("[ERROR][TOP_012] busy_o/done_o invalid while waiting in C_WAIT_STS!");
                            test_errors++; total_errors++;
                        end
                        wait_sts_cycles++;
                        @(posedge CLK_i);
                    end
                end
            join
            cfg_s2mm_sts_delay = 1;
            if (wait_sts_cycles < 50) begin
                $display("[ERROR][TOP_012] Expected >=50 cycles in C_WAIT_STS, measured=%0d", wait_sts_cycles);
                test_errors++; total_errors++;
            end else begin
                cov_wait_sts_gate++;
            end
        end
        end_test("TOP_012");

        // ---------------------------------------------------------------------
        // TOP_013: Full-Channel AXI-Stream Back-Pressure Torture
        // ---------------------------------------------------------------------
        begin_test("TOP_013", "All 5 DMA stream channels simultaneous random back-pressure on multi-block GEMM");
        cfg_mm2s_cmd_ready_prob  = 40;
        cfg_mm2s_data_valid_prob = 50;
        cfg_s2mm_cmd_ready_prob  = 40;
        cfg_s2mm_data_ready_prob = 40;
        cfg_s2mm_sts_delay       = 10;

        run_and_verify_job(20, 280, 20, 32, 2'b01, 0, 0, 0, 0, 1'b1);
        run_and_verify_job(20, 280, 20, 32, 2'b11, 0, 0, 0, 0, 1'b1);
        cov_all_5_dma_bp++;

        cfg_mm2s_cmd_ready_prob  = 100;
        cfg_mm2s_data_valid_prob = 100;
        cfg_s2mm_cmd_ready_prob  = 100;
        cfg_s2mm_data_ready_prob = 100;
        cfg_s2mm_sts_delay       = 1;
        end_test("TOP_013");

        // ---------------------------------------------------------------------
        // TOP_014: Representative Qwen2-Audio Layer Shapes
        // ---------------------------------------------------------------------
        begin_test("TOP_014", "Representative Qwen2-Audio shapes (Decode M=1, Fallback M=3, Prefill M=49, Encoder M=64, 3D Odd)");
        // 1. Decode GEMV M=1, K=256, N=288 (2 N-blocks)
        run_and_verify_job(1, 256, 288, 32, 2'b01);
        cov_qwen2_real_shapes++;
        // 2. 3-Digit Fallback M=3, K=288, N=256 (2 K-blocks)
        run_and_verify_job(3, 288, 256, 32, 2'b11);
        cov_qwen2_real_shapes++;
        // 3. LLM Prefill M=49 (lẻ > 3 tile), K=128, N=144
        run_and_verify_job(49, 128, 144, 32, 2'b01);
        cov_qwen2_real_shapes++;
        // 4. Audio Encoder chunk M=64, K=160, N=160
        run_and_verify_job(64, 160, 160, 32, 2'b01);
        cov_qwen2_real_shapes++;
        // 5. Odd 3D tail M=19, K=275, N=37
        run_and_verify_job(19, 275, 37, 32, 2'b11, 0, 0, 0, 0, 1'b1);
        cov_qwen2_real_shapes++;
        end_test("TOP_014");

        // ---------------------------------------------------------------------
        // TOP_015: Sequential Multi-Job & Mid-Job Reset Recovery
        // ---------------------------------------------------------------------
        begin_test("TOP_015", "Back-to-back multi-job sequence (Valid -> Invalid -> Valid) & mid-job reset recovery");
        // Phần A: Job 1 hợp lệ -> Job 2 lỗi cấu hình -> Job 3 hợp lệ (không reset ở giữa)
        run_and_verify_job(16, 32, 16, 32, 2'b01);
        tb_cfg_out_mode = 2'b00; // Cấu hình lỗi
        pulse_start_and_wait_done(100);
        if (err_o !== 1'b1) begin
            $display("[ERROR][TOP_015] Expected err_o=1 on mid-sequence invalid job!");
            test_errors++; total_errors++;
        end
        run_and_verify_job(5, 270, 22, 64, 2'b11);
        cov_b2b_and_mid_rst++;

        // Phần B: Kích chạy Job 4 lớn rồi kéo RST_i = 0 giữa chừng, sau đó chạy Job 5 hợp lệ
        begin
            tb_cfg_m_total  = 20'd64;
            tb_cfg_n_total  = 20'd64;
            tb_cfg_k_total  = 20'd256;
            tb_cfg_k_dim    = 20'd32;
            tb_cfg_lda      = 32'd256;
            tb_cfg_ldb      = 32'd64;
            tb_cfg_ldc      = 32'd64;
            tb_cfg_out_mode = 2'b01;
            @(negedge CLK_i); tb_start = 1'b1;
            @(negedge CLK_i); tb_start = 1'b0;
            // Chờ chạy được 200 chu kỳ giữa lúc đang fetch/compute thì kéo reset
            repeat (200) @(posedge CLK_i);
            apply_reset(10);
            run_and_verify_job(16, 64, 32, 32, 2'b01);
            cov_b2b_and_mid_rst++;
        end
        end_test("TOP_015");

        // ---------------------------------------------------------------------
        // TOP_016: Integrated System Test (AXI-Lite Regs + Top L2) & Random Regression
        // ---------------------------------------------------------------------
        begin_test("TOP_016", "Integrated full-PL test (gemm_l2_axi_lite_regs + gemm_top_l2) across 15 random jobs");
        begin
            automatic int kd_choices[3]   = '{16, 32, 64};
            automatic logic [1:0] modes[3] = '{2'b01, 2'b10, 2'b11};
            automatic logic [31:0] rdata;

            apply_reset(10);
            use_axil_ctrl = 1'b1;

            // Kiểm tra đọc thanh ghi HW_VERSION 0x40 qua AXI-Lite
            axil_read(8'h40, rdata);
            if (rdata !== 32'h0006_0001) begin
                $display("[ERROR][TOP_016] HW_VERSION mismatch: 0x%08h", rdata);
                test_errors++; total_errors++;
            end

            for (int job = 0; job < 15; job++) begin
                automatic int M      = $urandom_range(1, 36);
                automatic int K      = $urandom_range(1, 300);
                automatic int N_cols = $urandom_range(1, 40);
                automatic int kd     = kd_choices[$urandom_range(0, 2)];
                automatic logic [1:0] mode = modes[$urandom_range(0, 2)];
                automatic int lda    = ceil16(K)        + ($urandom_range(0, 1) * 16);
                automatic int ldb    = ceil16(N_cols)   + ($urandom_range(0, 1) * 16);
                automatic int ldc    = ceil16(N_cols)   + ($urandom_range(0, 1) * 16);
                automatic int ldc32  = ceil16(N_cols*4) + ($urandom_range(0, 1) * 16);

                prepare_gemm_memory(M, K, N_cols,
                                    BASE_A_DEFAULT, BASE_B_DEFAULT, BASE_P_DEFAULT,
                                    BASE_C_DEFAULT, BASE_C32_DEFAULT,
                                    lda, ldb, ldc, ldc32, 8'hAA, 8'hCC, 1'b1);

                // Lập trình bộ thanh ghi 0x00..0x3C qua giao thức AXI4-Lite
                axil_write(8'h00, M);
                axil_write(8'h04, N_cols);
                axil_write(8'h08, K);
                axil_write(8'h0C, kd);
                axil_write(8'h14, BASE_A_DEFAULT);
                axil_write(8'h18, BASE_B_DEFAULT);
                axil_write(8'h1C, BASE_C_DEFAULT);
                axil_write(8'h20, ldc);
                axil_write(8'h24, {30'b0, mode});
                axil_write(8'h28, BASE_P_DEFAULT);
                axil_write(8'h30, lda);
                axil_write(8'h34, ldb);
                axil_write(8'h38, BASE_C32_DEFAULT);
                axil_write(8'h3C, ldc32);

                // Kích hoạt start bằng cách ghi bit0=1 vào 0x2C
                axil_write(8'h2C, 32'h0000_0001);

                // Chờ tín hiệu ngắt irq_o bật lên 1
                begin
                    automatic int wait_c = 0;
                    while (!irq_o && wait_c < 500000) begin
                        @(posedge CLK_i);
                        wait_c++;
                    end
                    if (!irq_o) begin
                        $display("[ERROR][TOP_016] Job %0d timeout waiting for irq_o!", job);
                        test_errors++; total_errors++;
                    end
                end

                // Đọc 0x2C để kiểm tra {err=0, done_sticky=1, busy=0} và xóa ngắt Clear-on-Read
                axil_read(8'h2C, rdata);
                if (rdata !== 32'h0000_0004 || irq_o !== 1'b0) begin
                    $display("[ERROR][TOP_016] Job %0d status read 0x2C=0x%08h (expected 0x04), irq_o=%b",
                             job, rdata, irq_o);
                    test_errors++; total_errors++;
                end

                // Đối chiếu toàn bộ vùng nhớ DDR + Canary Guard
                verify_gemm_memory(M, K, N_cols,
                                   BASE_A_DEFAULT, BASE_B_DEFAULT, BASE_P_DEFAULT,
                                   BASE_C_DEFAULT, BASE_C32_DEFAULT,
                                   lda, ldb, ldc, ldc32, mode, 8'hAA, 8'hCC);
                cov_axil_integrated_sys++;
            end
        end
        end_test("TOP_016");

        //======================================================================
        // BÁO CÁO TỔNG KẾT & FUNCTIONAL COVERAGE
        //======================================================================
        $display("================================================================================");
        $display(" FUNCTIONAL COVERAGE & VERIFICATION SUMMARY (tb_gemm_top_l2)");
        $display("================================================================================");
        $display(" Total GEMM Jobs Verified : %0d", total_jobs_verified);
        $display(" Total DDR Bytes Verified : %0d", total_bytes_checked);
        $display(" [COV] Smoke 16x16x32     : %0d hits", cov_smoke_16x16);
        $display(" [COV] 3 Output Modes     : %0d hits", cov_out_modes_3);
        $display(" [COV] 14 Config Errors   : %0d/14 hits", cov_cfg_err_14);
        $display(" [COV] Small M (M=1,3,15) : %0d hits", cov_small_m_decode);
        $display(" [COV] Odd K Garbage Mask : %0d hits", cov_odd_k_garbage_mask);
        $display(" [COV] Odd N Canary Guard : %0d hits", cov_odd_n_tkeep_canary);
        $display(" [COV] Non-Contig Strides : %0d hits", cov_non_contig_stride);
        $display(" [COV] Multi-K URAM+PRAM  : %0d hits", cov_multi_k_uram_pram);
        $display(" [COV] 3D Tiling 2x2x2    : %0d hits", cov_3d_tiling_2x2x2);
        $display(" [COV] PRAM Handshakes    : from_wait_slot=%0d, from_f_done=%0d",
                 cov_pram_from_wait_slot, cov_pram_from_f_done);
        $display(" [COV] Drain Credit occ16 : %0d cycles", cov_drain_occ16_credit);
        $display(" [COV] C_WAIT_STS Gate    : %0d hits", cov_wait_sts_gate);
        $display(" [COV] All 5 DMA Backpres : %0d hits", cov_all_5_dma_bp);
        $display(" [COV] Qwen2 Real Shapes  : %0d/5 shapes", cov_qwen2_real_shapes);
        $display(" [COV] B2B & Mid-Job Rst  : %0d hits", cov_b2b_and_mid_rst);
        $display(" [COV] AXIL+Top System    : %0d jobs", cov_axil_integrated_sys);
        $display("--------------------------------------------------------------------------------");
        if (total_errors == 0) begin
            $display(" TEST PASSED (total_errors = 0 across %0d jobs / %0d verified DDR bytes)",
                     total_jobs_verified, total_bytes_checked);
        end else begin
            $display(" TEST FAILED (total_errors = %0d)", total_errors);
        end
        $display("================================================================================");
        $finish;
    end

endmodule

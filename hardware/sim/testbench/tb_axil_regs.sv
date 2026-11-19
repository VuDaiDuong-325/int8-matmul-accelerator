`timescale 1ns / 1ps
//==============================================================================
// Testbench : tb_axil_regs
// DUT       : gemm_l2_axi_lite_regs (gemm_l2_axi_lite_regs.v)
// Testplan  : tb_axil_regs_vp.csv (AXL_001 .. AXL_014)
//==============================================================================

module tb_axil_regs;

    localparam int C_S_AXI_ADDR_WIDTH = 8;
    localparam int C_S_AXI_DATA_WIDTH = 32;
    localparam int ADDR_W             = 32;
    localparam int DIM_W              = 20;
    localparam int CLK_NS             = 5; // 200 MHz
    localparam logic [31:0] EXP_HW_VERSION = 32'h0006_0001;

    // Tín hiệu AXI4-Lite & Control/Status
    logic                              S_AXI_ACLK;
    logic                              S_AXI_ARESETN;
    logic [C_S_AXI_ADDR_WIDTH-1:0]     S_AXI_AWADDR;
    logic [2:0]                        S_AXI_AWPROT;
    logic                              S_AXI_AWVALID;
    wire                               S_AXI_AWREADY;
    logic [C_S_AXI_DATA_WIDTH-1:0]     S_AXI_WDATA;
    logic [(C_S_AXI_DATA_WIDTH/8)-1:0] S_AXI_WSTRB;
    logic                              S_AXI_WVALID;
    wire                               S_AXI_WREADY;
    wire  [1:0]                        S_AXI_BRESP;
    wire                               S_AXI_BVALID;
    logic                              S_AXI_BREADY;
    logic [C_S_AXI_ADDR_WIDTH-1:0]     S_AXI_ARADDR;
    logic [2:0]                        S_AXI_ARPROT;
    logic                              S_AXI_ARVALID;
    wire                               S_AXI_ARREADY;
    wire  [C_S_AXI_DATA_WIDTH-1:0]     S_AXI_RDATA;
    wire  [1:0]                        S_AXI_RRESP;
    wire                               S_AXI_RVALID;
    logic                              S_AXI_RREADY;

    wire  [DIM_W-1:0]                  cfg_m_total_o;
    wire  [DIM_W-1:0]                  cfg_n_total_o;
    wire  [DIM_W-1:0]                  cfg_k_total_o;
    wire  [DIM_W-1:0]                  cfg_k_dim_o;
    wire  [ADDR_W-1:0]                 cfg_base_a_o;
    wire  [ADDR_W-1:0]                 cfg_base_b_o;
    wire  [ADDR_W-1:0]                 cfg_base_c_o;
    wire  [ADDR_W-1:0]                 cfg_base_c32_o;
    wire  [ADDR_W-1:0]                 cfg_base_param_o;
    wire  [ADDR_W-1:0]                 cfg_lda_o;
    wire  [ADDR_W-1:0]                 cfg_ldb_o;
    wire  [ADDR_W-1:0]                 cfg_ldc_o;
    wire  [ADDR_W-1:0]                 cfg_ldc32_o;
    wire  [1:0]                        cfg_out_mode_o;
    wire                               start_o;
    logic                              busy_i;
    logic                              done_i;
    logic                              err_i;
    wire                               irq_o;

    // Khởi tạo DUT
    gemm_l2_axi_lite_regs #(
        .C_S_AXI_ADDR_WIDTH(C_S_AXI_ADDR_WIDTH),
        .C_S_AXI_DATA_WIDTH(C_S_AXI_DATA_WIDTH),
        .ADDR_W            (ADDR_W),
        .DIM_W             (DIM_W)
    ) dut (
        .S_AXI_ACLK      (S_AXI_ACLK),
        .S_AXI_ARESETN   (S_AXI_ARESETN),
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
        .cfg_m_total_o   (cfg_m_total_o),
        .cfg_n_total_o   (cfg_n_total_o),
        .cfg_k_total_o   (cfg_k_total_o),
        .cfg_k_dim_o     (cfg_k_dim_o),
        .cfg_base_a_o    (cfg_base_a_o),
        .cfg_base_b_o    (cfg_base_b_o),
        .cfg_base_c_o    (cfg_base_c_o),
        .cfg_base_c32_o  (cfg_base_c32_o),
        .cfg_base_param_o(cfg_base_param_o),
        .cfg_lda_o       (cfg_lda_o),
        .cfg_ldb_o       (cfg_ldb_o),
        .cfg_ldc_o       (cfg_ldc_o),
        .cfg_ldc32_o     (cfg_ldc32_o),
        .cfg_out_mode_o  (cfg_out_mode_o),
        .start_o         (start_o),
        .busy_i          (busy_i),
        .done_i          (done_i),
        .err_i           (err_i),
        .irq_o           (irq_o)
    );

    // Tạo xung nhịp 200 MHz
    initial begin
        S_AXI_ACLK = 1'b0;
        forever #(CLK_NS / 2.0) S_AXI_ACLK = ~S_AXI_ACLK;
    end

    // Thống kê & Functional Coverage
    int unsigned seed          = 32'h2026_1118;
    int          total_errors  = 0;
    int          test_errors   = 0;
    int          total_txns    = 0;
    string       cur_test_id   = "INIT";

    int cov_rst_defaults       = 0;
    int cov_rw_all_15_regs     = 0;
    int cov_ro_protection      = 0;
    int cov_wstrb0_gated       = 0;
    int cov_start_pulse_1cyc   = 0;
    int cov_done_set_and_cor   = 0;
    int cov_done_clr_on_start  = 0;
    int cov_done_same_cyc_prio = 0;
    int cov_status_8_combos    = 0;
    int cov_aw_before_w        = 0;
    int cov_w_before_aw        = 0;
    int cov_bready_stall       = 0;
    int cov_rready_stall_0x2c  = 0;
    int cov_simul_rw           = 0;
    int cov_unmapped_addr      = 0;
    int cov_random_10k         = 0;

    //==========================================================================
    // GOLDEN REGISTER MIRROR MODEL (Mô hình thanh ghi tham chiếu độc lập)
    //==========================================================================
    logic [31:0] gold_reg [0:16]; // 0x00..0x40 (chỉ số word 0..16)
    logic        gold_done_sticky;

    function automatic void gold_reset();
        for (int i = 0; i <= 16; i++) gold_reg[i] = 32'h0;
        gold_reg[9]      = 32'h0000_0001; // 0x24: out_mode default = 2'b01
        gold_reg[16]     = EXP_HW_VERSION; // 0x40: HW_VERSION
        gold_done_sticky = 1'b0;
    endfunction

    function automatic logic [31:0] gold_mask(input int word_idx, input logic [31:0] val);
        case (word_idx)
            0, 1, 2, 3: return val & 32'h000F_FFFF; // 20-bit DIM_W
            9:          return val & 32'h0000_0003; // 2-bit out_mode
            11:         return 32'h0;               // 0x2C control/status
            16:         return EXP_HW_VERSION;      // 0x40 RO
            default:    return (word_idx <= 15) ? val : 32'h0;
        endcase
    endfunction

    function automatic void gold_write_update(
        input logic [7:0]  addr,
        input logic [31:0] wdata,
        input logic [3:0]  wstrb
    );
        int idx;
        idx = addr[7:2];
        case (idx)
            0, 1, 2, 3, 9: begin
                if (wstrb[0]) gold_reg[idx] = gold_mask(idx, wdata);
            end
            4, 5, 6, 7, 8, 10, 12, 13, 14, 15: begin
                gold_reg[idx] = wdata;
            end
            11: begin
                if (wstrb[0] && wdata[0]) gold_done_sticky = 1'b0;
            end
            default: ; // 0x40 RO hoặc unmapped
        endcase
    endfunction

    function automatic logic [31:0] gold_read_expect(input logic [7:0] addr);
        int idx;
        idx = addr[7:2];
        if (idx == 11) begin
            return {28'b0, err_i, gold_done_sticky, busy_i, 1'b0};
        end else if (idx == 16) begin
            return EXP_HW_VERSION;
        end else if (idx <= 15) begin
            return gold_reg[idx];
        end else begin
            return 32'h0;
        end
    endfunction

    //==========================================================================
    // KIỂM TRA BẤT BIẾN GIAO THỨC AXI4-LITE & ĐỘ RỘNG XUNG START_O MỖI CHU KỲ
    //==========================================================================
    logic prev_start_o;
    logic prev_bvalid_stalled;
    logic [1:0] prev_bresp;
    logic prev_rvalid_stalled;
    logic [31:0] prev_rdata;
    logic [1:0] prev_rresp;

    always @(posedge S_AXI_ACLK) begin
        if (!S_AXI_ARESETN) begin
            prev_start_o        <= 1'b0;
            prev_bvalid_stalled <= 1'b0;
            prev_bresp          <= 2'b00;
            prev_rvalid_stalled <= 1'b0;
            prev_rdata          <= 32'h0;
            prev_rresp          <= 2'b00;
        end else begin
            // 1. Kiểm tra X/Z trên các cổng đầu ra chính
            if ($isunknown({S_AXI_AWREADY, S_AXI_WREADY, S_AXI_BVALID, S_AXI_ARREADY, S_AXI_RVALID, start_o, irq_o})) begin
                $display("[ERROR][%s] Cycle %0t: Control outputs contain X/Z!", cur_test_id, $time);
                test_errors++; total_errors++;
            end

            // 2. Bất biến: start_o không bao giờ giữ mức 1 trong 2 chu kỳ liên tiếp (trừ khi ghi start 2 lần mà AXI-Lite mất >=2 chu kỳ/lần ghi)
            if (start_o && prev_start_o) begin
                $display("[ERROR][%s] Cycle %0t: start_o stayed high for >1 cycle!", cur_test_id, $time);
                test_errors++; total_errors++;
            end
            prev_start_o <= start_o;

            // 3. Bất biến AXI-Lite Write Response: khi BVALID=1 && BREADY=0, BVALID và BRESP phải giữ nguyên
            if (prev_bvalid_stalled) begin
                if (!S_AXI_BVALID || (S_AXI_BRESP !== prev_bresp)) begin
                    $display("[ERROR][%s] Cycle %0t: BVALID/BRESP unstable during BREADY=0 stall!", cur_test_id, $time);
                    test_errors++; total_errors++;
                end
            end
            prev_bvalid_stalled <= (S_AXI_BVALID && !S_AXI_BREADY);
            prev_bresp          <= S_AXI_BRESP;

            // 4. Bất biến AXI-Lite Read Data: khi RVALID=1 && RREADY=0, RVALID, RDATA, RRESP phải giữ nguyên
            if (prev_rvalid_stalled) begin
                if (!S_AXI_RVALID || (S_AXI_RDATA !== prev_rdata) || (S_AXI_RRESP !== prev_rresp)) begin
                    $display("[ERROR][%s] Cycle %0t: RVALID/RDATA/RRESP changed while RREADY=0! Prev=0x%08h, Now=0x%08h",
                             cur_test_id, $time, prev_rdata, S_AXI_RDATA);
                    test_errors++; total_errors++;
                end
            end
            prev_rvalid_stalled <= (S_AXI_RVALID && !S_AXI_RREADY);
            prev_rdata          <= S_AXI_RDATA;
            prev_rresp          <= S_AXI_RRESP;
        end
    end

    //==========================================================================
    // CÁC TASK GIAO TIẾP AXI4-LITE (Hỗ trợ chèn trễ AW, W, BREADY, RREADY)
    //==========================================================================
    task automatic init_signals();
        S_AXI_AWADDR  = '0;
        S_AXI_AWPROT  = 3'b000;
        S_AXI_AWVALID = 1'b0;
        S_AXI_WDATA   = '0;
        S_AXI_WSTRB   = 4'hF;
        S_AXI_WVALID  = 1'b0;
        S_AXI_BREADY  = 1'b0;
        S_AXI_ARADDR  = '0;
        S_AXI_ARPROT  = 3'b000;
        S_AXI_ARVALID = 1'b0;
        S_AXI_RREADY  = 1'b0;
        busy_i        = 1'b0;
        done_i        = 1'b0;
        err_i         = 1'b0;
    endtask

    task automatic apply_reset(input int low_cycles = 10);
        @(negedge S_AXI_ACLK);
        S_AXI_ARESETN = 1'b0;
        init_signals();
        repeat (low_cycles) @(negedge S_AXI_ACLK);
        S_AXI_ARESETN = 1'b1;
        gold_reset();
    endtask

    // Ghi AXI4-Lite với tùy chọn lệch pha AW/W và giữ BREADY
    task automatic axil_write(
        input logic [7:0]  addr,
        input logic [31:0] data,
        input logic [3:0]  strb         = 4'hF,
        input int          aw_delay     = 0,
        input int          w_delay      = 0,
        input int          bready_delay = 0
    );
        automatic bit aw_done = 0;
        automatic bit w_done  = 0;
        automatic int cyc     = 0;

        @(negedge S_AXI_ACLK);
        S_AXI_AWADDR  = addr;
        S_AXI_WDATA   = data;
        S_AXI_WSTRB   = strb;
        S_AXI_AWVALID = (aw_delay == 0);
        S_AXI_WVALID  = (w_delay  == 0);
        S_AXI_BREADY  = (bready_delay == 0);

        while (!(aw_done && w_done)) begin
            @(posedge S_AXI_ACLK);
            if (S_AXI_AWVALID && S_AXI_AWREADY) aw_done = 1;
            if (S_AXI_WVALID  && S_AXI_WREADY)  w_done  = 1;
            cyc++;
            @(negedge S_AXI_ACLK);
            if (!aw_done && (cyc >= aw_delay)) S_AXI_AWVALID = 1'b1;
            if (!w_done  && (cyc >= w_delay))  S_AXI_WVALID  = 1'b1;
            if (aw_done) S_AXI_AWVALID = 1'b0;
            if (w_done)  S_AXI_WVALID  = 1'b0;
        end

        // Chờ BVALID
        while (!S_AXI_BVALID) @(posedge S_AXI_ACLK);
        if (bready_delay > 0) begin
            repeat (bready_delay) @(negedge S_AXI_ACLK);
            S_AXI_BREADY = 1'b1;
            @(posedge S_AXI_ACLK);
        end
        if (S_AXI_BRESP !== 2'b00) begin
            $display("[ERROR][%s] Write 0x%02h returned BRESP=%b (expected 00)", cur_test_id, addr, S_AXI_BRESP);
            test_errors++; total_errors++;
        end
        @(negedge S_AXI_ACLK);
        S_AXI_BREADY = 1'b0;
        gold_write_update(addr, data, strb);
        total_txns++;
    endtask

    // Đọc AXI4-Lite với tùy chọn giữ RREADY
    task automatic axil_read(
        input  logic [7:0]  addr,
        output logic [31:0] rdata,
        input  int          rready_delay = 0
    );
        @(negedge S_AXI_ACLK);
        S_AXI_ARADDR  = addr;
        S_AXI_ARVALID = 1'b1;
        S_AXI_RREADY  = (rready_delay == 0);

        while (!(S_AXI_ARVALID && S_AXI_ARREADY)) @(posedge S_AXI_ACLK);
        @(negedge S_AXI_ACLK);
        S_AXI_ARVALID = 1'b0;

        while (!S_AXI_RVALID) @(posedge S_AXI_ACLK);
        if (rready_delay > 0) begin
            repeat (rready_delay) @(negedge S_AXI_ACLK);
            S_AXI_RREADY = 1'b1;
            @(posedge S_AXI_ACLK);
        end
        rdata = S_AXI_RDATA;
        if (S_AXI_RRESP !== 2'b00) begin
            $display("[ERROR][%s] Read 0x%02h returned RRESP=%b (expected 00)", cur_test_id, addr, S_AXI_RRESP);
            test_errors++; total_errors++;
        end
        @(negedge S_AXI_ACLK);
        S_AXI_RREADY = 1'b0;
        if (addr[7:2] == 6'h0B) gold_done_sticky = 1'b0;
        total_txns++;
    endtask

    // Kiểm tra đọc và so sánh với giá trị kỳ vọng
    task automatic check_read(
        input logic [7:0]  addr,
        input logic [31:0] exp_val,
        input int          rready_delay = 0
    );
        automatic logic [31:0] rd;
        axil_read(addr, rd, rready_delay);
        if (rd !== exp_val) begin
            $display("[ERROR][%s] Read Addr 0x%02h mismatch! Expected=0x%08h, Actual=0x%08h",
                     cur_test_id, addr, exp_val, rd);
            test_errors++; total_errors++;
        end
    endtask

    // Kiểm tra toàn bộ dây cổng cấu hình cfg_*_o khớp với Golden Mirror
    task automatic check_cfg_outputs();
        if (cfg_m_total_o    !== gold_reg[0][DIM_W-1:0] ||
            cfg_n_total_o    !== gold_reg[1][DIM_W-1:0] ||
            cfg_k_total_o    !== gold_reg[2][DIM_W-1:0] ||
            cfg_k_dim_o      !== gold_reg[3][DIM_W-1:0] ||
            cfg_base_a_o     !== gold_reg[5]  ||
            cfg_base_b_o     !== gold_reg[6]  ||
            cfg_base_c_o     !== gold_reg[7]  ||
            cfg_ldc_o        !== gold_reg[8]  ||
            cfg_out_mode_o   !== gold_reg[9][1:0] ||
            cfg_base_param_o !== gold_reg[10] ||
            cfg_lda_o        !== gold_reg[12] ||
            cfg_ldb_o        !== gold_reg[13] ||
            cfg_base_c32_o   !== gold_reg[14] ||
            cfg_ldc32_o      !== gold_reg[15] ||
            irq_o            !== gold_done_sticky) begin
            $display("[ERROR][%s] Direct output ports cfg_*_o or irq_o mismatch against Golden Mirror!", cur_test_id);
            test_errors++; total_errors++;
        end
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
        #50_000_000;
        $display("[FATAL] Watchdog timeout reached in tb_axil_regs!");
        $finish;
    end

    //==========================================================================
    // CHƯƠNG TRÌNH KIỂM THỬ CHÍNH (AXL_001 .. AXL_014)
    //==========================================================================
    initial begin
        automatic int dummy;
        dummy = $value$plusargs("SEED=%d", seed);
        dummy = $urandom(seed);
        $display("================================================================================");
        $display(" STARTING TESTBENCH: tb_axil_regs (SEED = 0x%08h)", seed);
        $display("================================================================================");

        S_AXI_ARESETN = 1'b0;
        init_signals();

        // ---------------------------------------------------------------------
        // AXL_001: Reset & Default Values
        // ---------------------------------------------------------------------
        begin_test("AXL_001", "Verify reset defaults across all 17 registers (0x00..0x40) and output ports");
        apply_reset(10);
        @(posedge S_AXI_ACLK); #1;
        check_cfg_outputs();
        for (int idx = 0; idx <= 16; idx++) begin
            check_read(8'(idx * 4), gold_read_expect(8'(idx * 4)));
        end
        cov_rst_defaults++;
        end_test("AXL_001");

        // ---------------------------------------------------------------------
        // AXL_002: Register RW & Bit-Width Masking
        // ---------------------------------------------------------------------
        begin_test("AXL_002", "Read/Write all 15 configuration registers with bit-width masking checks");
        begin
            automatic logic [31:0] patterns[4] = '{32'hFFFF_FFFF, 32'hAAAA_AAAA, 32'h5555_5555, 32'h1234_5678};
            foreach (patterns[p]) begin
                for (int idx = 0; idx <= 15; idx++) begin
                    if (idx == 11) continue; // Bỏ qua 0x2C (control/status)
                    axil_write(8'(idx * 4), patterns[p] ^ (idx * 32'h0101_0101));
                    check_read(8'(idx * 4), gold_read_expect(8'(idx * 4)));
                    check_cfg_outputs();
                    cov_rw_all_15_regs++;
                end
            end
        end
        end_test("AXL_002");

        // ---------------------------------------------------------------------
        // AXL_003: Read-Only Protection (0x40 HW_VERSION & 0x2C status bits)
        // ---------------------------------------------------------------------
        begin_test("AXL_003", "Read-only protection on 0x40 (HW_VERSION) and 0x2C status bits");
        axil_write(8'h40, 32'hDEAD_BEEF);
        check_read(8'h40, EXP_HW_VERSION);
        axil_write(8'h40, 32'h0000_0000);
        check_read(8'h40, EXP_HW_VERSION);
        // Ghi các bit [31:1] = 1 vào 0x2C với bit0 = 0
        axil_write(8'h2C, 32'hFFFF_FFFE);
        check_read(8'h2C, 32'h0000_0000);
        cov_ro_protection++;
        end_test("AXL_003");

        // ---------------------------------------------------------------------
        // AXL_004: Write Strobe Masking (S_AXI_WSTRB[0] = 0)
        // ---------------------------------------------------------------------
        begin_test("AXL_004", "Write strobe S_AXI_WSTRB[0]=0 gating on dimension regs, out_mode, and start pulse");
        // Đặt giá trị đã biết
        axil_write(8'h00, 32'h0001_2345, 4'hF);
        axil_write(8'h04, 32'h0002_3456, 4'hF);
        axil_write(8'h08, 32'h0003_4567, 4'hF);
        axil_write(8'h0C, 32'h0000_0020, 4'hF);
        axil_write(8'h24, 32'h0000_0002, 4'hF);
        // Kích done_i=1 để done_sticky=1
        @(negedge S_AXI_ACLK); done_i = 1'b1;
        @(negedge S_AXI_ACLK); done_i = 1'b0;
        gold_done_sticky = 1'b1;

        // Ghi với WSTRB = 4'b1110 (WSTRB[0] = 0)
        axil_write(8'h00, 32'h000F_FFFF, 4'b1110);
        axil_write(8'h04, 32'h000F_FFFF, 4'b1110);
        axil_write(8'h08, 32'h000F_FFFF, 4'b1110);
        axil_write(8'h0C, 32'h000F_FFFF, 4'b1110);
        axil_write(8'h24, 32'h0000_0003, 4'b1110);
        axil_write(8'h2C, 32'hFFFF_FFFF, 4'b1110); // WDATA[0]=1 nhưng WSTRB[0]=0 -> không start, không xóa done_sticky!

        check_cfg_outputs();
        if (irq_o !== 1'b1) begin
            $display("[ERROR][AXL_004] done_sticky/irq_o was cleared when WSTRB[0]=0!");
            test_errors++; total_errors++;
        end
        check_read(8'h00, 32'h0001_2345);
        check_read(8'h24, 32'h0000_0002);
        check_read(8'h2C, 32'h0000_0004); // Đọc xóa luôn done_sticky
        cov_wstrb0_gated++;
        end_test("AXL_004");

        // ---------------------------------------------------------------------
        // AXL_005: Single-Cycle start_o Pulse Generation & Readback 0
        // ---------------------------------------------------------------------
        begin_test("AXL_005", "Verify start_o is a single-cycle pulse on writing 0x2C[0]=1 and reads back 0");
        begin
            automatic int pulse_cycles = 0;
            fork
                begin
                    axil_write(8'h2C, 32'h0000_0001);
                end
                begin
                    for (int c = 0; c < 8; c++) begin
                        @(posedge S_AXI_ACLK);
                        #1;
                        if (start_o === 1'b1) pulse_cycles++;
                    end
                end
            join
            if (pulse_cycles != 1) begin
                $display("[ERROR][AXL_005] Expected start_o pulse width = 1 cycle, measured = %0d", pulse_cycles);
                test_errors++; total_errors++;
            end else begin
                cov_start_pulse_1cyc++;
            end
            check_read(8'h2C, 32'h0000_0000);

            // Ghi 0 vào 0x2C không được phát xung start_o
            pulse_cycles = 0;
            fork
                begin
                    axil_write(8'h2C, 32'h0000_0000);
                end
                begin
                    for (int c = 0; c < 6; c++) begin
                        @(posedge S_AXI_ACLK);
                        #1;
                        if (start_o === 1'b1) pulse_cycles++;
                    end
                end
            join
            if (pulse_cycles != 0) begin
                $display("[ERROR][AXL_005] Writing 0 to 0x2C unexpectedly triggered start_o!");
                test_errors++; total_errors++;
            end
        end
        end_test("AXL_005");

        // ---------------------------------------------------------------------
        // AXL_006: done_sticky & irq_o Set on done_i and Clear-on-Read (COR)
        // ---------------------------------------------------------------------
        begin_test("AXL_006", "done_sticky & irq_o set on done_i, preserved on other reads, cleared on 0x2C read");
        @(negedge S_AXI_ACLK); done_i = 1'b1;
        @(negedge S_AXI_ACLK); done_i = 1'b0;
        gold_done_sticky = 1'b1;
        @(posedge S_AXI_ACLK); #1;
        if (irq_o !== 1'b1) begin
            $display("[ERROR][AXL_006] irq_o did not assert after done_i pulse!");
            test_errors++; total_errors++;
        end
        // Đọc các thanh ghi khác (0x00, 0x40) không được làm mất cờ done_sticky
        check_read(8'h00, gold_read_expect(8'h00));
        check_read(8'h40, EXP_HW_VERSION);
        if (irq_o !== 1'b1) begin
            $display("[ERROR][AXL_006] Reading non-status registers cleared irq_o!");
            test_errors++; total_errors++;
        end
        // Đọc 0x2C lần 1: phải thấy bit2 = 1 và xóa luôn done_sticky
        check_read(8'h2C, 32'h0000_0004);
        if (irq_o !== 1'b0) begin
            $display("[ERROR][AXL_006] irq_o did not clear after reading 0x2C!");
            test_errors++; total_errors++;
        end
        // Đọc 0x2C lần 2: bit2 phải về 0
        check_read(8'h2C, 32'h0000_0000);
        cov_done_set_and_cor++;
        end_test("AXL_006");

        // ---------------------------------------------------------------------
        // AXL_007: done_sticky Cleared on New Start Write
        // ---------------------------------------------------------------------
        begin_test("AXL_007", "done_sticky & irq_o cleared when writing new start=1 to 0x2C");
        @(negedge S_AXI_ACLK); done_i = 1'b1;
        @(negedge S_AXI_ACLK); done_i = 1'b0;
        gold_done_sticky = 1'b1;
        @(posedge S_AXI_ACLK); #1;
        // Ghi bit0=0 vào 0x2C KHÔNG được xóa done_sticky
        axil_write(8'h2C, 32'h0000_0000);
        if (irq_o !== 1'b1) begin
            $display("[ERROR][AXL_007] Writing bit0=0 to 0x2C cleared irq_o!");
            test_errors++; total_errors++;
        end
        // Ghi bit0=1 (start mới) vào 0x2C PHẢI xóa done_sticky
        axil_write(8'h2C, 32'h0000_0001);
        if (irq_o !== 1'b0) begin
            $display("[ERROR][AXL_007] Writing start=1 to 0x2C did not clear irq_o!");
            test_errors++; total_errors++;
        end
        check_read(8'h2C, 32'h0000_0000);
        cov_done_clr_on_start++;
        end_test("AXL_007");

        // ---------------------------------------------------------------------
        // AXL_008: Same-Cycle Priority (done_i vs Status Read / Clear)
        // ---------------------------------------------------------------------
        begin_test("AXL_008", "Same-cycle coincidence of done_i=1 and 0x2C status read (done_i must win)");
        // Canh đúng chu kỳ read_status_now_w == 1 (khi ARREADY=1 && ARVALID=1 && !RVALID) để kích done_i = 1
        @(negedge S_AXI_ACLK);
        S_AXI_ARADDR  = 8'h2C;
        S_AXI_ARVALID = 1'b1;
        S_AXI_RREADY  = 1'b1;
        // Ở sườn lên kế tiếp, ARREADY sẽ bật lên 1; ngay tại negedge đó ta kích done_i=1 cho sườn lên bắt tay
        @(posedge S_AXI_ACLK);
        @(negedge S_AXI_ACLK);
        done_i = 1'b1; // Trùng khít chu kỳ (ARREADY && ARVALID && !RVALID)
        @(posedge S_AXI_ACLK);
        @(negedge S_AXI_ACLK);
        done_i        = 1'b0;
        S_AXI_ARVALID = 1'b0;
        while (!S_AXI_RVALID) @(posedge S_AXI_ACLK);
        @(negedge S_AXI_ACLK);
        S_AXI_RREADY  = 1'b0;
        gold_done_sticky = 1'b1;

        // Vì done_i có quyền ưu tiên cao hơn read_status_now_w (dòng 131 vs 133), done_sticky_r phải bằng 1!
        if (irq_o !== 1'b1) begin
            $display("[ERROR][AXL_008] Coincident done_i pulse was swallowed by same-cycle status read!");
            test_errors++; total_errors++;
        end else begin
            cov_done_same_cyc_prio++;
        end
        check_read(8'h2C, 32'h0000_0004);
        end_test("AXL_008");

        // ---------------------------------------------------------------------
        // AXL_009: Live Status Inputs Reflection (All 8 Combinations)
        // ---------------------------------------------------------------------
        begin_test("AXL_009", "Verify all 8 combinations of {err_i, done_sticky, busy_i} in 0x2C[3:1]");
        for (int combo = 0; combo < 8; combo++) begin
            @(negedge S_AXI_ACLK);
            busy_i = combo[0];
            err_i  = combo[2];
            if (combo[1]) begin
                done_i = 1'b1;
                @(negedge S_AXI_ACLK);
                done_i = 1'b0;
                gold_done_sticky = 1'b1;
            end
            check_read(8'h2C, {28'b0, combo[2:0], 1'b0});
            cov_status_8_combos++;
        end
        @(negedge S_AXI_ACLK);
        busy_i = 1'b0; err_i = 1'b0;
        end_test("AXL_009");

        // ---------------------------------------------------------------------
        // AXL_010: AXI4-Lite Write Skew (AW before W, W before AW) & BREADY Stall
        // ---------------------------------------------------------------------
        begin_test("AXL_010", "AXI4-Lite write channel skew (AW before W, W before AW) and BREADY stall");
        // 1. AWVALID đến trước WVALID 4 chu kỳ
        axil_write(8'h14, 32'h1111_2220, 4'hF, 0, 4, 0);
        check_read(8'h14, 32'h1111_2220);
        cov_aw_before_w++;
        // 2. WVALID đến trước AWVALID 5 chu kỳ
        axil_write(8'h18, 32'h3333_4440, 4'hF, 5, 0, 0);
        check_read(8'h18, 32'h3333_4440);
        cov_w_before_aw++;
        // 3. BREADY bị giữ ở 0 trong 8 chu kỳ sau khi BVALID=1
        axil_write(8'h1C, 32'h5555_6660, 4'hF, 1, 2, 8);
        check_read(8'h1C, 32'h5555_6660);
        cov_bready_stall++;
        end_test("AXL_010");

        // ---------------------------------------------------------------------
        // AXL_011: AXI4-Lite Read RREADY Back-Pressure on 0x2C Status
        // ---------------------------------------------------------------------
        begin_test("AXL_011", "RREADY back-pressure on 0x2C preserves captured done_sticky=1 in RDATA");
        @(negedge S_AXI_ACLK);
        done_i = 1'b1; busy_i = 1'b1;
        @(negedge S_AXI_ACLK);
        done_i = 1'b0;
        gold_done_sticky = 1'b1;

        // Đọc 0x2C nhưng trì hoãn RREADY suốt 8 chu kỳ sau khi RVALID=1
        check_read(8'h2C, 32'h0000_0006, 8);
        cov_rready_stall_0x2c++;
        @(negedge S_AXI_ACLK);
        busy_i = 1'b0;
        end_test("AXL_011");

        // ---------------------------------------------------------------------
        // AXL_012: Simultaneous Read and Write Transactions
        // ---------------------------------------------------------------------
        begin_test("AXL_012", "Simultaneous AXI4-Lite read and write transactions in the same cycle");
        for (int k = 0; k < 10; k++) begin
            automatic logic [31:0] rd_val;
            automatic logic [7:0]  w_addr = 8'((k % 4) * 4);
            automatic logic [7:0]  r_addr = 8'(((k + 1) % 4) * 4);
            automatic logic [31:0] exp_r  = gold_read_expect(r_addr);
            automatic logic [31:0] w_val  = 32'h000A_0000 + k * 32'h111;

            @(negedge S_AXI_ACLK);
            S_AXI_AWADDR  = w_addr;
            S_AXI_WDATA   = w_val;
            S_AXI_WSTRB   = 4'hF;
            S_AXI_AWVALID = 1'b1;
            S_AXI_WVALID  = 1'b1;
            S_AXI_BREADY  = 1'b1;

            S_AXI_ARADDR  = r_addr;
            S_AXI_ARVALID = 1'b1;
            S_AXI_RREADY  = 1'b1;

            fork
                begin
                    while (!(S_AXI_AWVALID && S_AXI_AWREADY)) @(posedge S_AXI_ACLK);
                    @(negedge S_AXI_ACLK);
                    S_AXI_AWVALID = 1'b0;
                    S_AXI_WVALID  = 1'b0;
                    while (!S_AXI_BVALID) @(posedge S_AXI_ACLK);
                    @(negedge S_AXI_ACLK);
                    S_AXI_BREADY  = 1'b0;
                end
                begin
                    while (!(S_AXI_ARVALID && S_AXI_ARREADY)) @(posedge S_AXI_ACLK);
                    @(negedge S_AXI_ACLK);
                    S_AXI_ARVALID = 1'b0;
                    while (!S_AXI_RVALID) @(posedge S_AXI_ACLK);
                    rd_val = S_AXI_RDATA;
                    @(negedge S_AXI_ACLK);
                    S_AXI_RREADY  = 1'b0;
                end
            join

            gold_write_update(w_addr, w_val, 4'hF);
            if (rd_val !== exp_r) begin
                $display("[ERROR][AXL_012] Simultaneous read from 0x%02h returned 0x%08h (expected 0x%08h)",
                         r_addr, rd_val, exp_r);
                test_errors++; total_errors++;
            end
            check_read(w_addr, gold_read_expect(w_addr));
            cov_simul_rw++;
        end
        end_test("AXL_012");

        // ---------------------------------------------------------------------
        // AXL_013: Unmapped / Out-of-Range Register Addresses (0x44..0xFC)
        // ---------------------------------------------------------------------
        begin_test("AXL_013", "Unmapped register addresses (0x44..0xFC) return 0 and cause no side effects");
        begin
            automatic logic [7:0] unmapped_addrs[4] = '{8'h44, 8'h48, 8'h80, 8'hFC};
            foreach (unmapped_addrs[u]) begin
                axil_write(unmapped_addrs[u], 32'hFFFF_FFFF);
                check_read(unmapped_addrs[u], 32'h0000_0000);
                cov_unmapped_addr++;
            end
            // Kiểm tra không có thanh ghi hợp lệ nào bị hỏng
            check_cfg_outputs();
            for (int idx = 0; idx <= 16; idx++) begin
                if (idx == 11) continue;
                check_read(8'(idx * 4), gold_read_expect(8'(idx * 4)));
            end
        end
        end_test("AXL_013");

        // ---------------------------------------------------------------------
        // AXL_014: Random 10,000-Transaction Stress against Register Mirror
        // ---------------------------------------------------------------------
        begin_test("AXL_014", "10,000-transaction random AXI4-Lite stress test with Register Mirror Scoreboard");
        for (int t = 0; t < 10000; t++) begin
            automatic int op      = $urandom_range(0, 99);
            automatic int word_id = $urandom_range(0, 18); // Bao gồm cả địa chỉ unmapped 17, 18
            automatic logic [7:0] addr = 8'(word_id * 4);

            // Ngẫu nhiên thay đổi busy_i, err_i hoặc kích xung done_i trước giao dịch
            if ($urandom_range(0, 9) == 0) begin
                @(negedge S_AXI_ACLK);
                busy_i = $urandom_range(0, 1);
                err_i  = $urandom_range(0, 1);
                if ($urandom_range(0, 2) == 0) begin
                    done_i = 1'b1;
                    @(negedge S_AXI_ACLK);
                    done_i = 1'b0;
                    gold_done_sticky = 1'b1;
                end
            end

            if (op < 50) begin
                // Giao dịch Ghi với WSTRB và độ trễ ngẫu nhiên
                automatic logic [31:0] wval = $urandom();
                automatic logic [3:0]  strb = ($urandom_range(0, 4) == 0) ? 4'b1110 : 4'b1111;
                automatic int aw_d = ($urandom_range(0, 4) == 0) ? $urandom_range(1, 2) : 0;
                automatic int w_d  = ($urandom_range(0, 4) == 0) ? $urandom_range(1, 2) : 0;
                automatic int b_d  = ($urandom_range(0, 4) == 0) ? $urandom_range(1, 2) : 0;
                axil_write(addr, wval, strb, aw_d, w_d, b_d);
            end else begin
                // Giao dịch Đọc với độ trễ RREADY ngẫu nhiên
                automatic int r_d = ($urandom_range(0, 4) == 0) ? $urandom_range(1, 3) : 0;
                check_read(addr, gold_read_expect(addr), r_d);
            end

            check_cfg_outputs();
            cov_random_10k++;
        end
        end_test("AXL_014");

        //======================================================================
        // BÁO CÁO TỔNG KẾT & FUNCTIONAL COVERAGE
        //======================================================================
        $display("================================================================================");
        $display(" FUNCTIONAL COVERAGE & VERIFICATION SUMMARY (tb_axil_regs)");
        $display("================================================================================");
        $display(" Total AXI-Lite Txns   : %0d", total_txns);
        $display(" [COV] Reset Defaults  : %0d hits", cov_rst_defaults);
        $display(" [COV] RW All 15 Regs  : %0d hits", cov_rw_all_15_regs);
        $display(" [COV] RO Protection   : %0d hits", cov_ro_protection);
        $display(" [COV] WSTRB[0] Gating : %0d hits", cov_wstrb0_gated);
        $display(" [COV] Start 1-Cyc Pls : %0d hits", cov_start_pulse_1cyc);
        $display(" [COV] Done COR Read   : %0d hits", cov_done_set_and_cor);
        $display(" [COV] Done Clr Start  : %0d hits", cov_done_clr_on_start);
        $display(" [COV] Done Same-Cyc   : %0d hits", cov_done_same_cyc_prio);
        $display(" [COV] Status 8 Combos : %0d hits", cov_status_8_combos);
        $display(" [COV] AW/W/B Stalls   : aw_first=%0d, w_first=%0d, b_stall=%0d",
                 cov_aw_before_w, cov_w_before_aw, cov_bready_stall);
        $display(" [COV] RREADY Stall 2C : %0d hits", cov_rready_stall_0x2c);
        $display(" [COV] Simultaneous RW : %0d hits", cov_simul_rw);
        $display(" [COV] Unmapped Addrs  : %0d hits", cov_unmapped_addr);
        $display(" [COV] Random 10k Txns : %0d txns", cov_random_10k);
        $display("--------------------------------------------------------------------------------");
        if (total_errors == 0) begin
            $display(" TEST PASSED (total_errors = 0 across %0d AXI-Lite transactions)", total_txns);
        end else begin
            $display(" TEST FAILED (total_errors = %0d)", total_errors);
        end
        $display("================================================================================");
        $finish;
    end

endmodule

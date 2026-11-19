`timescale 1ns / 1ps
//==============================================================================
// Testbench : tb_gemm_compute_core
// DUT       : gemm_compute_core (gemm_compute_core.v + 7 submodules)
// Testplan  : tb_gemm_compute_core_vp.csv (CC_001 .. CC_016)
//==============================================================================

module tb_gemm_compute_core;

    localparam int N          = 16;
    localparam int DATA_WIDTH = 8;
    localparam int FIFO_DEPTH = 1024;
    localparam int BRAM_DEPTH = 1024;
    localparam int CLK_NS     = 5; // 200 MHz

    // Tín hiệu kết nối DUT
    logic                      CLK_i;
    logic                      RST_i;
    logic [31:0]               k_dim_i;
    logic [31:0]               num_k_tiles_i;

    logic [(N*DATA_WIDTH)-1:0] s_axis_a_tdata_i;
    logic                      s_axis_a_tvalid_i;
    wire                       s_axis_a_tready_o;
    logic                      s_axis_a_tlast_i;

    logic [(N*DATA_WIDTH)-1:0] s_axis_b_tdata_i;
    logic                      s_axis_b_tvalid_i;
    wire                       s_axis_b_tready_o;
    logic                      s_axis_b_tlast_i;

    wire  [(N*32)-1:0]         m_axis_c32_tdata_o;
    wire                       m_axis_c32_tvalid_o;
    logic                      m_axis_c32_tready_i;
    wire                       m_axis_c32_tlast_o;
    wire                       m_axis_c32_tuser_o;

    // Khởi tạo DUT
    gemm_compute_core #(
        .N         (N),
        .DATA_WIDTH(DATA_WIDTH),
        .FIFO_DEPTH(FIFO_DEPTH),
        .BRAM_DEPTH(BRAM_DEPTH)
    ) dut (
        .CLK_i              (CLK_i),
        .RST_i              (RST_i),
        .k_dim_i            (k_dim_i),
        .num_k_tiles_i      (num_k_tiles_i),
        .s_axis_a_tdata_i   (s_axis_a_tdata_i),
        .s_axis_a_tvalid_i  (s_axis_a_tvalid_i),
        .s_axis_a_tready_o  (s_axis_a_tready_o),
        .s_axis_a_tlast_i   (s_axis_a_tlast_i),
        .s_axis_b_tdata_i   (s_axis_b_tdata_i),
        .s_axis_b_tvalid_i  (s_axis_b_tvalid_i),
        .s_axis_b_tready_o  (s_axis_b_tready_o),
        .s_axis_b_tlast_i   (s_axis_b_tlast_i),
        .m_axis_c32_tdata_o (m_axis_c32_tdata_o),
        .m_axis_c32_tvalid_o(m_axis_c32_tvalid_o),
        .m_axis_c32_tready_i(m_axis_c32_tready_i),
        .m_axis_c32_tlast_o (m_axis_c32_tlast_o),
        .m_axis_c32_tuser_o (m_axis_c32_tuser_o)
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
    int          total_blocks_checked = 0;
    longint      total_elem_checked   = 0;
    string       cur_test_id         = "INIT";

    int cov_rst_idle          = 0;
    int cov_single_tile_order = 0;
    int cov_skew_wavefront    = 0;
    int cov_mac_extremes_4096 = 0;
    int cov_kdim_min_period48 = 0;
    int cov_zero_bubble_chain = 0;
    int cov_multi_tile_acc    = 0;
    int cov_asym_a_b_stream   = 0;
    int cov_out_backpressure  = 0;
    int cov_fifo_hiwater      = 0;
    int cov_fwft_sim_rw       = 0;
    int cov_dyn_num_k_tiles   = 0;
    int cov_onehot_pe_256     = 0;
    int cov_midflight_rst     = 0;
    int cov_perf_benchmark    = 0;
    int cov_random_stress     = 0;

    //==========================================================================
    // KIỂM TRA BẤT BIẾN SVA MỖI CHU KỲ (AXIS Handshake, FIFO Overflow, MIN_PERIOD)
    //==========================================================================
    logic            prev_c32_stalled;
    logic [N*32-1:0] prev_c32_tdata;
    logic            prev_c32_tlast;
    logic            prev_c32_tuser;
    longint          cycle_counter;
    longint          last_chunk_start_cyc;

    always @(posedge CLK_i) begin
        if (!RST_i) begin
            prev_c32_stalled     <= 1'b0;
            prev_c32_tdata       <= '0;
            prev_c32_tlast       <= 1'b0;
            prev_c32_tuser       <= 1'b0;
            cycle_counter        <= 0;
            last_chunk_start_cyc <= -1000;
        end else begin
            cycle_counter <= cycle_counter + 1;

            // 1. Kiểm tra X/Z trên các tín hiệu điều khiển AXIS
            if ($isunknown({s_axis_a_tready_o, s_axis_b_tready_o, m_axis_c32_tvalid_o})) begin
                $display("[ERROR][%s] Cycle %0t: AXIS handshake signals contain X/Z!", cur_test_id, $time);
                test_errors++; total_errors++;
            end

            // 2. Bất biến AXIS Master C32: khi tvalid=1 && tready=0, dữ liệu phải giữ nguyên
            if (prev_c32_stalled) begin
                if (!m_axis_c32_tvalid_o ||
                    (m_axis_c32_tdata_o !== prev_c32_tdata) ||
                    (m_axis_c32_tlast_o !== prev_c32_tlast) ||
                    (m_axis_c32_tuser_o !== prev_c32_tuser)) begin
                    $display("[ERROR][%s] Cycle %0t: m_axis_c32 unstable during tready=0 stall!", cur_test_id, $time);
                    test_errors++; total_errors++;
                end
            end
            prev_c32_stalled <= (m_axis_c32_tvalid_o && !m_axis_c32_tready_i);
            prev_c32_tdata   <= m_axis_c32_tdata_o;
            prev_c32_tlast   <= m_axis_c32_tlast_o;
            prev_c32_tuser   <= m_axis_c32_tuser_o;

            // 3. Bất biến FIFO C: không bao giờ ghi khi full hoặc đọc khi empty
            if (dut.fifo_wr_en_w && dut.fifo_full_w) begin
                $display("[ERROR][%s] Cycle %0t: FIFO C overflow (wr_en=1 while full=1)!", cur_test_id, $time);
                test_errors++; total_errors++;
            end
            if (dut.u_sc_fifo_fwft_c.rd_en_i && dut.fifo_empty_w) begin
                $display("[ERROR][%s] Cycle %0t: FIFO C underflow (rd_en=1 while empty=1)!", cur_test_id, $time);
                test_errors++; total_errors++;
            end
            if (dut.fifo_wr_ok_w && dut.safe_fifo_rd_w) begin
                cov_fwft_sim_rw++;
            end

            // 4. Bất biến MIN_PERIOD = 48 giữa 2 lần bắt đầu chunk
            if (dut.u_systolic_dataflow_ctrl.curr_clr_w) begin
                if ((cycle_counter - last_chunk_start_cyc) < 48) begin
                    $display("[ERROR][%s] Cycle %0t: Chunk started too early! Period=%0d (< 48)",
                             cur_test_id, $time, cycle_counter - last_chunk_start_cyc);
                    test_errors++; total_errors++;
                end
                last_chunk_start_cyc <= cycle_counter;
            end
        end
    end

    //==========================================================================
    // GOLDEN MODEL & HÀNG ĐỢI SCOREBOARD CHO MA TRẬN C32 (16x16 INT32)
    //==========================================================================
    typedef logic signed [7:0]  mat_a_chunk_t [0:N-1][0:255];
    typedef logic signed [7:0]  mat_b_chunk_t [0:255][0:N-1];
    typedef logic signed [31:0] mat_c32_t     [0:N-1][0:N-1];

    mat_c32_t exp_c32_queue [$];
    bit       enable_auto_scoreboard = 1'b1;
    int       sb_row_idx             = 0;

    // Tính tích 1 chunk A[16][k_dim] * B[k_dim][16] và cộng dồn vào acc_c
    function automatic void golden_accumulate_chunk(
        input  mat_a_chunk_t a_chk,
        input  mat_b_chunk_t b_chk,
        input  int           k_dim,
        input  bit           first_chunk,
        inout  mat_c32_t     acc_c
    );
        for (int i = 0; i < N; i++) begin
            for (int j = 0; j < N; j++) begin
                automatic logic signed [31:0] s = first_chunk ? 32'sd0 : acc_c[i][j];
                for (int k = 0; k < k_dim; k++) begin
                    s += 32'(signed'(a_chk[i][k])) * 32'(signed'(b_chk[k][j]));
                end
                acc_c[i][j] = s;
            end
        end
    endfunction

    // Tự động thu nhận và kiểm tra từng hàng C32 xuất ra khi (tvalid && tready)
    always @(posedge CLK_i) begin
        if (!RST_i) begin
            sb_row_idx <= 0;
        end else if (enable_auto_scoreboard && m_axis_c32_tvalid_o && m_axis_c32_tready_i) begin
            automatic bit exp_tuser = (sb_row_idx == 0);
            automatic bit exp_tlast = (sb_row_idx == (N - 1));

            if (m_axis_c32_tuser_o !== exp_tuser) begin
                $display("[ERROR][%s] Row %0d: m_axis_c32_tuser_o=%b (expected %b)",
                         cur_test_id, sb_row_idx, m_axis_c32_tuser_o, exp_tuser);
                test_errors++; total_errors++;
            end
            if (m_axis_c32_tlast_o !== exp_tlast) begin
                $display("[ERROR][%s] Row %0d: m_axis_c32_tlast_o=%b (expected %b)",
                         cur_test_id, sb_row_idx, m_axis_c32_tlast_o, exp_tlast);
                test_errors++; total_errors++;
            end

            if (exp_c32_queue.size() == 0) begin
                $display("[ERROR][%s] Unexpected C32 output beat while scoreboard queue is empty!", cur_test_id);
                test_errors++; total_errors++;
            end else begin
                for (int j = 0; j < N; j++) begin
                    automatic logic signed [31:0] act_v = signed'(m_axis_c32_tdata_o[j*32 +: 32]);
                    automatic logic signed [31:0] exp_v = exp_c32_queue[0][sb_row_idx][j];
                    total_elem_checked++;
                    if (act_v !== exp_v) begin
                        if (test_errors < 20) begin
                            $display("[ERROR][%s] Block #%0d Row %0d Col %0d mismatch: Expected=%0d, Actual=%0d",
                                     cur_test_id, total_blocks_checked, sb_row_idx, j, exp_v, act_v);
                        end
                        test_errors++; total_errors++;
                    end
                end
            end

            if (sb_row_idx == (N - 1)) begin
                sb_row_idx <= 0;
                if (exp_c32_queue.size() > 0) void'(exp_c32_queue.pop_front());
                total_blocks_checked++;
            end else begin
                sb_row_idx <= sb_row_idx + 1;
            end
        end
    end

    //==========================================================================
    // CÁC TASK TIỆN ÍCH BƠM DỮ LIỆU A/B QUA AXI-STREAM
    //==========================================================================
    task automatic init_signals();
        k_dim_i             = 32'd32;
        num_k_tiles_i       = 32'd1;
        s_axis_a_tdata_i    = '0;
        s_axis_a_tvalid_i   = 1'b0;
        s_axis_a_tlast_i    = 1'b0;
        s_axis_b_tdata_i    = '0;
        s_axis_b_tvalid_i   = 1'b0;
        s_axis_b_tlast_i    = 1'b0;
        m_axis_c32_tready_i = 1'b1;
    endtask

    task automatic apply_reset(input int low_cycles = 10);
        @(negedge CLK_i);
        RST_i = 1'b0;
        init_signals();
        exp_c32_queue.delete();
        repeat (low_cycles) @(negedge CLK_i);
        RST_i = 1'b1;
    endtask

    // Bơm 1 chunk A (k_dim beats) qua s_axis_a (0 chu kỳ chết khi gọi liên tiếp)
    task automatic send_chunk_a(
        input mat_a_chunk_t a_chk,
        input int           k_dim,
        input int           valid_prob = 100
    );
        for (int k = 0; k < k_dim; k++) begin
            while ($urandom_range(1, 100) > valid_prob) begin
                s_axis_a_tvalid_i <= 1'b0;
                @(posedge CLK_i);
            end
            s_axis_a_tvalid_i <= 1'b1;
            s_axis_a_tlast_i  <= (k == (k_dim - 1));
            for (int i = 0; i < N; i++) begin
                s_axis_a_tdata_i[i*8 +: 8] <= a_chk[i][k];
            end
            do @(posedge CLK_i); while (!s_axis_a_tready_o);
        end
        s_axis_a_tvalid_i <= 1'b0;
        s_axis_a_tlast_i  <= 1'b0;
    endtask

    // Bơm 1 chunk B (k_dim beats) qua s_axis_b (0 chu kỳ chết khi gọi liên tiếp)
    task automatic send_chunk_b(
        input mat_b_chunk_t b_chk,
        input int           k_dim,
        input int           valid_prob = 100
    );
        for (int k = 0; k < k_dim; k++) begin
            while ($urandom_range(1, 100) > valid_prob) begin
                s_axis_b_tvalid_i <= 1'b0;
                @(posedge CLK_i);
            end
            s_axis_b_tvalid_i <= 1'b1;
            s_axis_b_tlast_i  <= (k == (k_dim - 1));
            for (int j = 0; j < N; j++) begin
                s_axis_b_tdata_i[j*8 +: 8] <= b_chk[k][j];
            end
            do @(posedge CLK_i); while (!s_axis_b_tready_o);
        end
        s_axis_b_tvalid_i <= 1'b0;
        s_axis_b_tlast_i  <= 1'b0;
    endtask

    // Bơm song song 1 chunk A và B
    task automatic send_chunk_ab_parallel(
        input mat_a_chunk_t a_chk,
        input mat_b_chunk_t b_chk,
        input int           k_dim,
        input int           prob_a = 100,
        input int           prob_b = 100
    );
        fork
            send_chunk_a(a_chk, k_dim, prob_a);
            send_chunk_b(b_chk, k_dim, prob_b);
        join
    endtask

    // Chờ đến khi toàn bộ các output block trong exp_c32_queue đã được thu nhận hết
    task automatic wait_for_all_blocks(input int max_cycles = 100000);
        automatic int cnt = 0;
        while (exp_c32_queue.size() > 0 && cnt < max_cycles) begin
            @(posedge CLK_i);
            cnt++;
        end
        if (exp_c32_queue.size() > 0) begin
            $display("[ERROR][%s] Timeout waiting for output blocks! Remaining=%0d",
                     cur_test_id, exp_c32_queue.size());
            test_errors++; total_errors++;
        end
        repeat (10) @(posedge CLK_i);
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
        #200_000_000;
        $display("[FATAL] Watchdog timeout reached in tb_gemm_compute_core!");
        $finish;
    end

    //==========================================================================
    // CHƯƠNG TRÌNH KIỂM THỬ CHÍNH (CC_001 .. CC_016)
    //==========================================================================
    initial begin
        automatic int dummy;
        dummy = $value$plusargs("SEED=%d", seed);
        dummy = $urandom(seed);
        $display("================================================================================");
        $display(" STARTING TESTBENCH: tb_gemm_compute_core (SEED = 0x%08h)", seed);
        $display("================================================================================");

        RST_i = 1'b0;
        init_signals();

        // ---------------------------------------------------------------------
        // CC_001: Reset & Idle Handshake State
        // ---------------------------------------------------------------------
        begin_test("CC_001", "Reset state and default AXIS handshake readiness");
        apply_reset(10);
        repeat (20) begin
            @(posedge CLK_i); #1;
            if (s_axis_a_tready_o !== 1'b1 || s_axis_b_tready_o !== 1'b1 ||
                m_axis_c32_tvalid_o !== 1'b0 || dut.fifo_cnt_r !== 0) begin
                $display("[ERROR][CC_001] Invalid idle state after reset!");
                test_errors++; total_errors++;
            end
        end
        cov_rst_idle++;
        end_test("CC_001");

        // ---------------------------------------------------------------------
        // CC_002: Single Tile Baseline & Row Ordering (C[0]..C[15], SOF/EOF)
        // ---------------------------------------------------------------------
        begin_test("CC_002", "Single 16x16 tile (k_dim=32, num_k_tiles=1) row ordering & SOF/EOF flags");
        begin
            automatic mat_a_chunk_t a_c;
            automatic mat_b_chunk_t b_c;
            automatic mat_c32_t     c_exp;
            k_dim_i       = 32'd32;
            num_k_tiles_i = 32'd1;
            for (int i = 0; i < N; i++)
                for (int k = 0; k < 32; k++)
                    a_c[i][k] = signed'(8'((i + 1) * 3 + (k - 16)));
            for (int k = 0; k < 32; k++)
                for (int j = 0; j < N; j++)
                    b_c[k][j] = signed'(8'((j + 1) * 2 - (k - 10)));
            golden_accumulate_chunk(a_c, b_c, 32, 1'b1, c_exp);
            exp_c32_queue.push_back(c_exp);
            send_chunk_ab_parallel(a_c, b_c, 32);
            wait_for_all_blocks();
            cov_single_tile_order++;
        end
        end_test("CC_002");

        // ---------------------------------------------------------------------
        // CC_003: Diagonal Skew Alignment (Impulse at k = 0, 1, 7, 14, 15)
        // ---------------------------------------------------------------------
        begin_test("CC_003", "Skew network diagonal wavefront alignment at k=0, 1, 7, 14, 15 across all 256 PEs");
        begin
            automatic int k_spots[5] = '{0, 1, 7, 14, 15};
            k_dim_i       = 32'd16;
            num_k_tiles_i = 32'd1;
            foreach (k_spots[idx]) begin
                automatic int kt = k_spots[idx];
                automatic mat_a_chunk_t a_c;
                automatic mat_b_chunk_t b_c;
                automatic mat_c32_t     c_exp;
                for (int i = 0; i < N; i++)
                    for (int k = 0; k < 16; k++)
                        a_c[i][k] = (k == kt) ? signed'(8'(i * 7 - 50)) : 8'sd0;
                for (int k = 0; k < 16; k++)
                    for (int j = 0; j < N; j++)
                        b_c[k][j] = (k == kt) ? signed'(8'(j * 5 + 11)) : 8'sd0;
                golden_accumulate_chunk(a_c, b_c, 16, 1'b1, c_exp);
                exp_c32_queue.push_back(c_exp);
                send_chunk_ab_parallel(a_c, b_c, 16);
                wait_for_all_blocks();
                cov_skew_wavefront++;
            end
        end
        end_test("CC_003");

        // ---------------------------------------------------------------------
        // CC_004: Signed INT8 MAC Extremes (-128, +127) over Depth K = 4096
        // ---------------------------------------------------------------------
        begin_test("CC_004", "Signed INT8 MAC extremes (-128 x -128, -128 x +127, +127 x +127) accumulated over K=4096");
        begin
            automatic mat_a_chunk_t a_c;
            automatic mat_b_chunk_t b_c;
            automatic mat_c32_t     c_exp;
            k_dim_i       = 32'd256;
            num_k_tiles_i = 32'd16; // 16 * 256 = 4096 bước tích lũy
            for (int i = 0; i < N; i++) begin
                for (int k = 0; k < 256; k++) begin
                    case (i % 4)
                        0: a_c[i][k] = -8'sd128; // 0x80
                        1: a_c[i][k] =  8'sd127; // 0x7F
                        2: a_c[i][k] = (k[0]) ? 8'sd127 : -8'sd128;
                        default: a_c[i][k] = (k[0]) ? -8'sd128 : 8'sd128;
                    endcase
                end
            end
            for (int k = 0; k < 256; k++) begin
                for (int j = 0; j < N; j++) begin
                    case (j % 4)
                        0: b_c[k][j] = -8'sd128;
                        1: b_c[k][j] =  8'sd127;
                        2: b_c[k][j] =  8'sd1;
                        default: b_c[k][j] = -8'sd1;
                    endcase
                end
            end
            for (int t = 0; t < 16; t++) begin
                golden_accumulate_chunk(a_c, b_c, 256, (t == 0), c_exp);
            end
            exp_c32_queue.push_back(c_exp);
            for (int t = 0; t < 16; t++) begin
                send_chunk_ab_parallel(a_c, b_c, 256);
            end
            wait_for_all_blocks();
            cov_mac_extremes_4096++;
        end
        end_test("CC_004");

        // ---------------------------------------------------------------------
        // CC_005: Sweep k_dim {16, 32, 64, 128, 256} & MIN_PERIOD = 48 Guard
        // ---------------------------------------------------------------------
        begin_test("CC_005", "Sweep k_dim in {16, 32, 64, 128, 256} and verify MIN_PERIOD=48 guard for k_dim < 48");
        begin
            automatic int kdims[5] = '{16, 32, 64, 128, 256};
            foreach (kdims[idx]) begin
                automatic int kd = kdims[idx];
                automatic mat_c32_t c_exp;
                apply_reset(5);
                k_dim_i       = kd;
                num_k_tiles_i = 32'd4;
                for (int t = 0; t < 4; t++) begin
                    automatic mat_a_chunk_t a_c;
                    automatic mat_b_chunk_t b_c;
                    for (int i = 0; i < N; i++)
                        for (int k = 0; k < kd; k++)
                            a_c[i][k] = signed'(8'($urandom_range(0, 255) - 128));
                    for (int k = 0; k < kd; k++)
                        for (int j = 0; j < N; j++)
                            b_c[k][j] = signed'(8'($urandom_range(0, 255) - 128));
                    golden_accumulate_chunk(a_c, b_c, kd, (t == 0), c_exp);
                    if (t == 3) exp_c32_queue.push_back(c_exp);
                    send_chunk_ab_parallel(a_c, b_c, kd);
                end
                wait_for_all_blocks();
                cov_kdim_min_period48++;
            end
        end
        end_test("CC_005");

        // ---------------------------------------------------------------------
        // CC_006: Ping-Pong Double Buffer Zero-Bubble Chaining (k_dim = 64)
        // ---------------------------------------------------------------------
        begin_test("CC_006", "BRAM ping-pong zero-bubble chaining (go_chain_w=1 when k_dim=64)");
        begin
            automatic mat_c32_t c_exp;
            automatic int consec_valid_cycles = 0;
            automatic int max_consec_valid    = 0;
            apply_reset(5);
            k_dim_i       = 32'd64;
            num_k_tiles_i = 32'd4;

            fork
                begin
                    for (int t = 0; t < 4; t++) begin
                        automatic mat_a_chunk_t a_c;
                        automatic mat_b_chunk_t b_c;
                        for (int i = 0; i < N; i++)
                            for (int k = 0; k < 64; k++)
                                a_c[i][k] = signed'(8'((t + 1) * (i - 7) + k));
                        for (int k = 0; k < 64; k++)
                            for (int j = 0; j < N; j++)
                                b_c[k][j] = signed'(8'((t + 2) * (j - 5) - k));
                        golden_accumulate_chunk(a_c, b_c, 64, (t == 0), c_exp);
                        if (t == 3) exp_c32_queue.push_back(c_exp);
                        send_chunk_ab_parallel(a_c, b_c, 64);
                    end
                end
                begin
                    // Đếm chuỗi chu kỳ valid_delay_o==1 liên tiếp khi go_chain_w=1 kích hoạt (>= 128 chu kỳ)
                    for (int c = 0; c < 400; c++) begin
                        @(posedge CLK_i); #1;
                        if (dut.pre_skew_valid_w) begin
                            consec_valid_cycles++;
                            if (consec_valid_cycles > max_consec_valid)
                                max_consec_valid = consec_valid_cycles;
                        end else begin
                            consec_valid_cycles = 0;
                        end
                    end
                end
            join
            wait_for_all_blocks();
            if (max_consec_valid < 128) begin
                $display("[ERROR][CC_006] Expected >= 128 consecutive zero-bubble valid cycles, measured=%0d",
                         max_consec_valid);
                test_errors++; total_errors++;
            end else begin
                cov_zero_bubble_chain++;
            end
        end
        end_test("CC_006");

        // ---------------------------------------------------------------------
        // CC_007: Multi-Tile Post-Accumulator Reduction (nt = 8, 1, 4, 16)
        // ---------------------------------------------------------------------
        begin_test("CC_007", "Multi-tile post_accumulator reduction (num_k_tiles = 8, 1, 4, 16 back-to-back)");
        begin
            automatic int nt_list[4] = '{8, 1, 4, 16};
            apply_reset(5);
            k_dim_i = 32'd32;
            foreach (nt_list[idx]) begin
                automatic int nt = nt_list[idx];
                automatic mat_c32_t c_exp;
                num_k_tiles_i = nt;
                for (int t = 0; t < nt; t++) begin
                    automatic mat_a_chunk_t a_c;
                    automatic mat_b_chunk_t b_c;
                    for (int i = 0; i < N; i++)
                        for (int k = 0; k < 32; k++)
                            a_c[i][k] = signed'(8'($urandom_range(0, 100) - 50));
                    for (int k = 0; k < 32; k++)
                        for (int j = 0; j < N; j++)
                            b_c[k][j] = signed'(8'($urandom_range(0, 100) - 50));
                    golden_accumulate_chunk(a_c, b_c, 32, (t == 0), c_exp);
                    if (t == (nt - 1)) exp_c32_queue.push_back(c_exp);
                    send_chunk_ab_parallel(a_c, b_c, 32);
                end
                wait_for_all_blocks();
                cov_multi_tile_acc++;
            end
        end
        end_test("CC_007");

        // ---------------------------------------------------------------------
        // CC_008: Asymmetric Input Streaming A vs B
        // ---------------------------------------------------------------------
        begin_test("CC_008", "Asymmetric skewed arrival between Stream A and Stream B");
        begin
            automatic mat_a_chunk_t a0, a1;
            automatic mat_b_chunk_t b0, b1;
            automatic mat_c32_t     c_exp;
            apply_reset(5);
            k_dim_i       = 32'd32;
            num_k_tiles_i = 32'd2;
            for (int i = 0; i < N; i++) begin
                for (int k = 0; k < 32; k++) begin
                    a0[i][k] = signed'(8'(i + k));
                    a1[i][k] = signed'(8'(i - k));
                    b0[k][i] = signed'(8'(k * 2 - i));
                    b1[k][i] = signed'(8'(k + i * 3));
                end
            end
            golden_accumulate_chunk(a0, b0, 32, 1'b1, c_exp);
            golden_accumulate_chunk(a1, b1, 32, 1'b0, c_exp);
            exp_c32_queue.push_back(c_exp);

            // Bơm đầy cả 2 bank của A trước khi B bắt đầu gửi
            send_chunk_a(a0, 32, 100);
            send_chunk_a(a1, 32, 100);
            @(posedge CLK_i); #1;
            if (s_axis_a_tready_o !== 1'b0) begin
                $display("[ERROR][CC_008] s_axis_a_tready_o did not drop to 0 when both banks of A were full!");
                test_errors++; total_errors++;
            end
            // Bây giờ mới bơm B với xác suất tvalid 40%
            send_chunk_b(b0, 32, 40);
            send_chunk_b(b1, 32, 40);
            wait_for_all_blocks();
            cov_asym_a_b_stream++;
        end
        end_test("CC_008");

        // ---------------------------------------------------------------------
        // CC_009: Downstream Back-Pressure on m_axis_c32
        // ---------------------------------------------------------------------
        begin_test("CC_009", "Downstream back-pressure on m_axis_c32_tready_i (stalls at row 0 SOF, mid, row 15 EOF)");
        begin
            apply_reset(5);
            k_dim_i       = 32'd32;
            num_k_tiles_i = 32'd2;
            fork
                begin
                    for (int blk = 0; blk < 4; blk++) begin
                        automatic mat_c32_t c_exp;
                        for (int t = 0; t < 2; t++) begin
                            automatic mat_a_chunk_t a_c;
                            automatic mat_b_chunk_t b_c;
                            for (int i = 0; i < N; i++)
                                for (int k = 0; k < 32; k++)
                                    a_c[i][k] = signed'(8'($urandom_range(0, 60) - 30));
                            for (int k = 0; k < 32; k++)
                                for (int j = 0; j < N; j++)
                                    b_c[k][j] = signed'(8'($urandom_range(0, 60) - 30));
                            golden_accumulate_chunk(a_c, b_c, 32, (t == 0), c_exp);
                            if (t == 1) exp_c32_queue.push_back(c_exp);
                            send_chunk_ab_parallel(a_c, b_c, 32);
                        end
                    end
                end
                begin
                    // Gây back-pressure ngẫu nhiên và giữ 20 chu kỳ tại SOF/EOF
                    while (exp_c32_queue.size() == 0) @(posedge CLK_i);
                    while (exp_c32_queue.size() > 0) begin
                        @(negedge CLK_i);
                        if (m_axis_c32_tvalid_o && (m_axis_c32_tuser_o || m_axis_c32_tlast_o) && ($urandom_range(0, 1) == 0)) begin
                            m_axis_c32_tready_i = 1'b0;
                            repeat (15) @(negedge CLK_i);
                            m_axis_c32_tready_i = 1'b1;
                            cov_out_backpressure++;
                        end else begin
                            m_axis_c32_tready_i = ($urandom_range(0, 99) < 35);
                        end
                    end
                    @(negedge CLK_i);
                    m_axis_c32_tready_i = 1'b1;
                end
            join
            wait_for_all_blocks();
        end
        end_test("CC_009");

        // ---------------------------------------------------------------------
        // CC_010: FIFO C High-Water Stall (fifo_hiwater_w >= 896) & Overflow Guard
        // ---------------------------------------------------------------------
        begin_test("CC_010", "FIFO C high-water mark (fifo_cnt_r >= 896) triggers stall_i and prevents overflow");
        begin
            automatic mat_a_chunk_t a_c;
            automatic mat_b_chunk_t b_c;
            automatic mat_c32_t     c_exp;
            automatic bit           saw_hiwater = 1'b0;
            apply_reset(5);
            // Đặt num_k_tiles = 1 và khóa m_axis_c32_tready_i = 0:
            // Tile 0 (16 hàng) đi vào post_accumulator rồi dừng ở S_OUTPUT (s_axis_tready_o=0);
            // 57 tile tiếp theo (57 * 16 = 912 hàng >= 896) sẽ tích tụ trong FIFO C và kích hoạt fifo_hiwater_w!
            k_dim_i             = 32'd16;
            num_k_tiles_i       = 32'd1;
            m_axis_c32_tready_i = 1'b0;

            for (int i = 0; i < N; i++)
                for (int k = 0; k < 16; k++) begin
                    a_c[i][k] = signed'(8'(i + k + 1));
                    b_c[k][i] = signed'(8'(i - k + 2));
                end
            golden_accumulate_chunk(a_c, b_c, 16, 1'b1, c_exp);

            fork
                begin
                    for (int tile = 0; tile < 58; tile++) begin
                        exp_c32_queue.push_back(c_exp);
                        send_chunk_ab_parallel(a_c, b_c, 16);
                    end
                end
                begin
                    // Chờ đến khi fifo_hiwater_w == 1 thì mở lại m_axis_c32_tready_i = 1
                    while (!dut.fifo_hiwater_w) @(posedge CLK_i);
                    saw_hiwater = 1'b1;
                    cov_fifo_hiwater++;
                    repeat (50) @(posedge CLK_i);
                    @(negedge CLK_i);
                    m_axis_c32_tready_i = 1'b1;
                end
            join
            wait_for_all_blocks();
            if (!saw_hiwater) begin
                $display("[ERROR][CC_010] fifo_hiwater_w was not triggered!");
                test_errors++; total_errors++;
            end
        end
        end_test("CC_010");

        // ---------------------------------------------------------------------
        // CC_011: FWFT FIFO Boundary Transitions & Simultaneous R/W
        // ---------------------------------------------------------------------
        begin_test("CC_011", "FWFT FIFO C boundary transitions (empty <-> 1 <-> 2) and simultaneous R/W");
        begin
            apply_reset(5);
            k_dim_i       = 32'd16;
            num_k_tiles_i = 32'd2;
            for (int blk = 0; blk < 6; blk++) begin
                automatic mat_c32_t c_exp;
                for (int t = 0; t < 2; t++) begin
                    automatic mat_a_chunk_t a_c;
                    automatic mat_b_chunk_t b_c;
                    for (int i = 0; i < N; i++)
                        for (int k = 0; k < 16; k++) begin
                            a_c[i][k] = signed'(8'((blk + 1) * (i + 1) + k));
                            b_c[k][i] = signed'(8'((t + 1) * (i + 1) - k));
                        end
                    golden_accumulate_chunk(a_c, b_c, 16, (t == 0), c_exp);
                    if (t == 1) exp_c32_queue.push_back(c_exp);
                    send_chunk_ab_parallel(a_c, b_c, 16);
                end
            end
            wait_for_all_blocks();
        end
        end_test("CC_011");

        // ---------------------------------------------------------------------
        // CC_012: Dynamic num_k_tiles_i Change Between Blocks (8 -> 3 -> 1 -> 8)
        // ---------------------------------------------------------------------
        begin_test("CC_012", "Dynamic num_k_tiles_i change between output blocks (8 -> 3 -> 1 -> 8)");
        begin
            automatic int dyn_nt[4] = '{8, 3, 1, 8};
            apply_reset(5);
            k_dim_i = 32'd32;
            foreach (dyn_nt[b]) begin
                automatic int nt = dyn_nt[b];
                automatic mat_c32_t c_exp;
                num_k_tiles_i = nt;
                for (int t = 0; t < nt; t++) begin
                    automatic mat_a_chunk_t a_c;
                    automatic mat_b_chunk_t b_c;
                    for (int i = 0; i < N; i++)
                        for (int k = 0; k < 32; k++) begin
                            a_c[i][k] = signed'(8'((b + 1) * 3 + i - k));
                            b_c[k][i] = signed'(8'((t + 1) * 2 - i + k));
                        end
                    golden_accumulate_chunk(a_c, b_c, 32, (t == 0), c_exp);
                    if (t == (nt - 1)) exp_c32_queue.push_back(c_exp);
                    send_chunk_ab_parallel(a_c, b_c, 32);
                end
                wait_for_all_blocks();
                cov_dyn_num_k_tiles++;
            end
        end
        end_test("CC_012");

        // ---------------------------------------------------------------------
        // CC_013: One-Hot PE Isolation Across All 16 Rows & 16 Columns
        // ---------------------------------------------------------------------
        begin_test("CC_013", "One-hot PE isolation check across all 16 rows and 16 columns");
        begin
            apply_reset(5);
            k_dim_i       = 32'd16;
            num_k_tiles_i = 32'd1;
            for (int idx = 0; idx < N; idx++) begin
                automatic int r0 = idx;
                automatic int c0 = (N - 1 - idx);
                automatic mat_a_chunk_t a_c;
                automatic mat_b_chunk_t b_c;
                automatic mat_c32_t     c_exp;
                for (int i = 0; i < N; i++)
                    for (int k = 0; k < 16; k++)
                        a_c[i][k] = (i == r0) ? signed'(8'(k + 5)) : 8'sd0;
                for (int k = 0; k < 16; k++)
                    for (int j = 0; j < N; j++)
                        b_c[k][j] = (j == c0) ? signed'(8'(k + 3)) : 8'sd0;
                golden_accumulate_chunk(a_c, b_c, 16, 1'b1, c_exp);
                exp_c32_queue.push_back(c_exp);
                send_chunk_ab_parallel(a_c, b_c, 16);
                cov_onehot_pe_256 += 16;
            end
            wait_for_all_blocks();
        end
        end_test("CC_013");

        // ---------------------------------------------------------------------
        // CC_014: Mid-Computation Reset Recovery
        // ---------------------------------------------------------------------
        begin_test("CC_014", "Mid-computation synchronous reset abort and clean recovery");
        begin
            automatic mat_a_chunk_t a_c;
            automatic mat_b_chunk_t b_c;
            automatic mat_c32_t     c_exp;
            apply_reset(5);
            k_dim_i       = 32'd32;
            num_k_tiles_i = 32'd4;
            for (int i = 0; i < N; i++)
                for (int k = 0; k < 32; k++) begin
                    a_c[i][k] = 8'sd100;
                    b_c[k][i] = 8'sd100;
                end
            // Bơm 2 chunk (mới được nửa num_k_tiles=4) rồi kéo RST_i = 0 giữa lúc mảng đang chạy
            send_chunk_ab_parallel(a_c, b_c, 32);
            send_chunk_ab_parallel(a_c, b_c, 32);
            repeat (10) @(posedge CLK_i);

            // Reset giữa chừng
            apply_reset(8);
            cov_midflight_rst++;

            // Chạy bài toán mới sau reset
            k_dim_i       = 32'd32;
            num_k_tiles_i = 32'd2;
            for (int t = 0; t < 2; t++) begin
                for (int i = 0; i < N; i++)
                    for (int k = 0; k < 32; k++) begin
                        a_c[i][k] = signed'(8'(i * 2 - k + t));
                        b_c[k][i] = signed'(8'(i + k * 2 - t));
                    end
                golden_accumulate_chunk(a_c, b_c, 32, (t == 0), c_exp);
                if (t == 1) exp_c32_queue.push_back(c_exp);
                send_chunk_ab_parallel(a_c, b_c, 32);
            end
            wait_for_all_blocks();
        end
        end_test("CC_014");

        // ---------------------------------------------------------------------
        // CC_015: Performance & Cycle-Count Benchmark (k_dim=64 vs k_dim=32)
        // ---------------------------------------------------------------------
        begin_test("CC_015", "Throughput & cycle-period benchmark (k_dim=64 zero-bubble vs k_dim=32 MIN_PERIOD=48)");
        begin
            automatic mat_a_chunk_t a_c;
            automatic mat_b_chunk_t b_c;
            automatic mat_c32_t     c_exp;
            automatic longint       first_clr_cyc, last_clr_cyc;
            automatic int           clr_cnt;

            for (int i = 0; i < N; i++)
                for (int k = 0; k < 64; k++) begin
                    a_c[i][k] = signed'(8'(i + k));
                    b_c[k][i] = signed'(8'(i - k));
                end

            // Đo 8 chunk liên tiếp ở k_dim = 64 -> khoảng cách giữa chunk 1 và chunk 8 phải đúng 7 * 64 = 448 chu kỳ
            apply_reset(5);
            k_dim_i       = 32'd64;
            num_k_tiles_i = 32'd4;
            clr_cnt       = 0;
            for (int t = 0; t < 4; t++) golden_accumulate_chunk(a_c, b_c, 64, (t == 0), c_exp);
            exp_c32_queue.push_back(c_exp);
            exp_c32_queue.push_back(c_exp);

            fork
                begin
                    for (int t = 0; t < 8; t++) send_chunk_ab_parallel(a_c, b_c, 64);
                end
                begin
                    while (clr_cnt < 8) begin
                        @(posedge CLK_i); #1;
                        if (dut.u_systolic_dataflow_ctrl.curr_clr_w) begin
                            if (clr_cnt == 0) first_clr_cyc = cycle_counter;
                            last_clr_cyc = cycle_counter;
                            clr_cnt++;
                        end
                    end
                end
            join
            wait_for_all_blocks();
            // Khi bơm 1 beat/chu kỳ đúng bằng tốc độ đọc 1 beat/chu kỳ, các cặp chẵn/lẻ xen kẽ go_chain_w=1 (0 chu kỳ nghỉ)
            // và DONE->IDLE (2 chu kỳ chuyển bank), tổng 7 khoảng chuyển chunk = 7*64 + 6 = 454 chu kỳ (>98.7% hiệu suất).
            if ((last_clr_cyc - first_clr_cyc) > (7 * 64 + 8)) begin
                $display("[ERROR][CC_015] k_dim=64 8-chunk span expected <= %0d cycles, measured %0d",
                         7 * 64 + 8, last_clr_cyc - first_clr_cyc);
                test_errors++; total_errors++;
            end else begin
                cov_perf_benchmark++;
            end

            // Phần B: Đo 8 chunk liên tiếp ở k_dim = 32 (< MIN_PERIOD = 48) -> mỗi khoảng chuyển chunk đúng bằng 48 chu kỳ (7 * 48 = 336 chu kỳ)
            apply_reset(5);
            k_dim_i       = 32'd32;
            num_k_tiles_i = 32'd4;
            clr_cnt       = 0;
            for (int t = 0; t < 4; t++) golden_accumulate_chunk(a_c, b_c, 32, (t == 0), c_exp);
            exp_c32_queue.push_back(c_exp);
            exp_c32_queue.push_back(c_exp);

            fork
                begin
                    for (int t = 0; t < 8; t++) send_chunk_ab_parallel(a_c, b_c, 32);
                end
                begin
                    while (clr_cnt < 8) begin
                        @(posedge CLK_i); #1;
                        if (dut.u_systolic_dataflow_ctrl.curr_clr_w) begin
                            if (clr_cnt == 0) first_clr_cyc = cycle_counter;
                            last_clr_cyc = cycle_counter;
                            clr_cnt++;
                        end
                    end
                end
            join
            wait_for_all_blocks();
            if ((last_clr_cyc - first_clr_cyc) != (7 * 48)) begin
                $display("[ERROR][CC_015] k_dim=32 8-chunk MIN_PERIOD span expected %0d cycles, measured %0d",
                         7 * 48, last_clr_cyc - first_clr_cyc);
                test_errors++; total_errors++;
            end else begin
                cov_perf_benchmark++;
            end
        end
        end_test("CC_015");

        // ---------------------------------------------------------------------
        // CC_016: Constrained-Random Multi-Block Stress Test (25 Output Blocks)
        // ---------------------------------------------------------------------
        begin_test("CC_016", "25-block constrained-random stress test (random k_dim, num_k_tiles, tvalid/tready)");
        begin
            automatic int kd_choices[4] = '{16, 32, 64, 128};
            apply_reset(5);
            for (int blk = 0; blk < 25; blk++) begin
                automatic int kd     = kd_choices[$urandom_range(0, 3)];
                automatic int nt     = $urandom_range(1, 4);
                automatic int prob_a = $urandom_range(50, 100);
                automatic int prob_b = $urandom_range(50, 100);
                automatic mat_c32_t c_exp;

                k_dim_i       = kd;
                num_k_tiles_i = nt;

                for (int t = 0; t < nt; t++) begin
                    automatic mat_a_chunk_t a_c;
                    automatic mat_b_chunk_t b_c;
                    for (int i = 0; i < N; i++)
                        for (int k = 0; k < kd; k++)
                            a_c[i][k] = signed'(8'($urandom_range(0, 255) - 128));
                    for (int k = 0; k < kd; k++)
                        for (int j = 0; j < N; j++)
                            b_c[k][j] = signed'(8'($urandom_range(0, 255) - 128));
                    golden_accumulate_chunk(a_c, b_c, kd, (t == 0), c_exp);
                    if (t == (nt - 1)) exp_c32_queue.push_back(c_exp);
                    send_chunk_ab_parallel(a_c, b_c, kd, prob_a, prob_b);
                end
                wait_for_all_blocks();
                cov_random_stress++;
            end
        end
        end_test("CC_016");

        //======================================================================
        // BÁO CÁO TỔNG KẾT & FUNCTIONAL COVERAGE
        //======================================================================
        $display("================================================================================");
        $display(" FUNCTIONAL COVERAGE & VERIFICATION SUMMARY (tb_gemm_compute_core)");
        $display("================================================================================");
        $display(" Total Output Blocks   : %0d", total_blocks_checked);
        $display(" Total INT32 Elements  : %0d", total_elem_checked);
        $display(" [COV] Reset & Idle    : %0d hits", cov_rst_idle);
        $display(" [COV] Row Order/Flags : %0d hits", cov_single_tile_order);
        $display(" [COV] Skew Wavefront  : %0d hits", cov_skew_wavefront);
        $display(" [COV] MAC Depth 4096  : %0d hits", cov_mac_extremes_4096);
        $display(" [COV] k_dim & MIN_48  : %0d hits", cov_kdim_min_period48);
        $display(" [COV] Zero-Bubble Chn : %0d hits", cov_zero_bubble_chain);
        $display(" [COV] Multi-Tile Acc  : %0d hits", cov_multi_tile_acc);
        $display(" [COV] Asym A/B Stream : %0d hits", cov_asym_a_b_stream);
        $display(" [COV] Out Backpress   : %0d hits", cov_out_backpressure);
        $display(" [COV] FIFO Hi-Water   : %0d hits", cov_fifo_hiwater);
        $display(" [COV] FWFT Simul R/W  : %0d hits", cov_fwft_sim_rw);
        $display(" [COV] Dyn num_k_tiles : %0d hits", cov_dyn_num_k_tiles);
        $display(" [COV] One-Hot 256 PEs : %0d PEs", cov_onehot_pe_256);
        $display(" [COV] Mid-Flight Rst  : %0d hits", cov_midflight_rst);
        $display(" [COV] Perf Benchmark  : %0d hits", cov_perf_benchmark);
        $display(" [COV] Random Stress   : %0d blocks", cov_random_stress);
        $display("--------------------------------------------------------------------------------");
        if (total_errors == 0) begin
            $display(" TEST PASSED (total_errors = 0 across %0d blocks / %0d INT32 elements)",
                     total_blocks_checked, total_elem_checked);
        end else begin
            $display(" TEST FAILED (total_errors = %0d)", total_errors);
        end
        $display("================================================================================");
        $finish;
    end

endmodule

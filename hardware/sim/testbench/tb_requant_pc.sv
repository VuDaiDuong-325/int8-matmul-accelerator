`timescale 1ns / 1ps
//==============================================================================
// Testbench : tb_requant_pc
// DUT       : int32_int8_requant_pc (int32_int8_rescale.v)
// Testplan  : tb_requant_pc_vp.csv (RQ_001 .. RQ_016)
//==============================================================================

module tb_requant_pc;

    localparam int N      = 16;
    localparam int L      = 7;
    localparam int CLK_NS = 5; // 200 MHz

    // Tín hiệu kết nối DUT
    logic             CLK_i;
    logic             RST_i;
    logic             in_valid_i;
    logic [N*32-1:0]  acc_i;
    logic [N*32-1:0]  bias_i;
    logic [N*32-1:0]  mult_i;
    logic [N*8-1:0]   shift_i;
    logic [N*32-1:0]  zp_i;
    wire              out_valid_o;
    wire  [N*8-1:0]   out_data_o;

    // Khởi tạo DUT
    int32_int8_requant_pc #(
        .N(N)
    ) dut (
        .CLK_i       (CLK_i),
        .RST_i       (RST_i),
        .in_valid_i  (in_valid_i),
        .acc_i       (acc_i),
        .bias_i      (bias_i),
        .mult_i      (mult_i),
        .shift_i     (shift_i),
        .zp_i        (zp_i),
        .out_valid_o (out_valid_o),
        .out_data_o  (out_data_o)
    );

    // Tạo xung nhịp 200 MHz
    initial begin
        CLK_i = 1'b0;
        forever #(CLK_NS / 2.0) CLK_i = ~CLK_i;
    end

    // Biến thống kê kiểm thử & Functional Coverage
    int unsigned seed          = 32'h2026_1118;
    int          total_errors  = 0;
    int          test_errors   = 0;
    longint      total_rows_checked  = 0;
    longint      total_lanes_checked = 0;
    string       cur_test_id   = "INIT";

    // Bộ đếm coverage theo testplan
    int cov_rst_idle        = 0;
    int cov_lat7_single     = 0;
    int cov_b2b_stream      = 0;
    int cov_per_tensor      = 0;
    int cov_shift_0         = 0;
    int cov_shift_1_pos     = 0;
    int cov_shift_1_neg     = 0;
    int cov_shift_62        = 0;
    int cov_shift_mask_hi   = 0;
    int cov_s1_max_max      = 0;
    int cov_s1_min_min      = 0;
    int cov_s2_min_mul_min  = 0;
    int cov_s2_max_mul_max  = 0;
    int cov_rnd_half_pos    = 0;
    int cov_rnd_half_neg    = 0;
    int cov_sat_pos_127     = 0;
    int cov_sat_pos_clamp   = 0;
    int cov_sat_neg_m128    = 0;
    int cov_sat_neg_clamp   = 0;
    int cov_zp_pos          = 0;
    int cov_zp_neg          = 0;
    int cov_lane_indep      = 0;
    int cov_bubble_hold     = 0;
    int cov_midflight_rst   = 0;
    int cov_qwen2_dist      = 0;

    //==========================================================================
    // GOLDEN MODEL ĐỘC LẬP (Số học có dấu 128-bit)
    //==========================================================================
    function automatic logic signed [7:0] golden_requant_lane(
        input logic signed [31:0] acc,
        input logic signed [31:0] bias,
        input logic signed [31:0] mult,
        input logic        [7:0]  shift_raw,
        input logic signed [31:0] zp
    );
        logic signed [127:0] t, p, rnd, q, y;
        logic        [5:0]   s;
        begin
            s   = shift_raw[5:0];
            t   = 128'(signed'(acc)) + 128'(signed'(bias));
            p   = t * 128'(signed'(mult));
            rnd = (s == 6'd0) ? 128'sd0 : (128'sd1 <<< (s - 6'd1));
            q   = (p + rnd) >>> s;
            y   = q + 128'(signed'(zp));

            // Cập nhật bin coverage tự động
            if (s == 6'd0)  cov_shift_0++;
            if (s == 6'd62) cov_shift_62++;
            if (shift_raw[7:6] != 2'b00) cov_shift_mask_hi++;
            if (zp > 0) cov_zp_pos++;
            if (zp < 0) cov_zp_neg++;

            if (y > 128'sd127) begin
                cov_sat_pos_clamp++;
                return 8'sd127;
            end else if (y < -128'sd128) begin
                cov_sat_neg_clamp++;
                return -8'sd128;
            end else begin
                if (y == 128'sd127)  cov_sat_pos_127++;
                if (y == -128'sd128) cov_sat_neg_m128++;
                return y[7:0];
            end
        end
    endfunction

    function automatic logic [N*8-1:0] golden_requant_row(
        input logic [N*32-1:0] acc_vec,
        input logic [N*32-1:0] bias_vec,
        input logic [N*32-1:0] mult_vec,
        input logic [N*8-1:0]  shift_vec,
        input logic [N*32-1:0] zp_vec
    );
        logic [N*8-1:0] res;
        for (int i = 0; i < N; i++) begin
            res[i*8 +: 8] = golden_requant_lane(
                acc_vec  [i*32 +: 32],
                bias_vec [i*32 +: 32],
                mult_vec [i*32 +: 32],
                shift_vec[i*8  +: 8],
                zp_vec   [i*32 +: 32]
            );
        end
        return res;
    endfunction

    //==========================================================================
    // SCOREBOARD ĐƯỜNG ỐNG 7 TẦNG & KIỂM TRA TỰ ĐỘNG MỖI CHU KỲ
    //==========================================================================
    logic            exp_v_pipe [0:L-1];
    logic [N*8-1:0]  exp_d_pipe [0:L-1];
    logic            has_seen_valid_out;
    logic [N*8-1:0]  last_valid_out_data;

    always @(posedge CLK_i) begin
        if (!RST_i) begin
            for (int k = 0; k < L; k++) begin
                exp_v_pipe[k] <= 1'b0;
                exp_d_pipe[k] <= '0;
            end
            has_seen_valid_out <= 1'b0;
        end else begin
            // 1. Kiểm tra X/Z trên out_valid_o
            if ($isunknown(out_valid_o)) begin
                $display("[ERROR][%s] Cycle %0t: out_valid_o is X/Z!", cur_test_id, $time);
                test_errors++;
                total_errors++;
            end

            // 2. So sánh out_valid_o với mẫu kỳ vọng trễ 7 chu kỳ
            if (out_valid_o !== exp_v_pipe[L-1]) begin
                $display("[ERROR][%s] Cycle %0t: out_valid_o mismatch! Expected=%0b, Actual=%0b",
                         cur_test_id, $time, exp_v_pipe[L-1], out_valid_o);
                test_errors++;
                total_errors++;
            end

            // 3. Nếu out_valid_o == 1, kiểm tra X/Z và so sánh từng làn 0..15
            if (out_valid_o === 1'b1) begin
                has_seen_valid_out  <= 1'b1;
                last_valid_out_data <= out_data_o;
                total_rows_checked++;
                total_lanes_checked += N;

                if ($isunknown(out_data_o)) begin
                    $display("[ERROR][%s] Cycle %0t: out_data_o contains X/Z when out_valid_o=1! data=%h",
                             cur_test_id, $time, out_data_o);
                    test_errors++;
                    total_errors++;
                end else if (out_data_o !== exp_d_pipe[L-1]) begin
                    for (int i = 0; i < N; i++) begin
                        logic signed [7:0] act_b, exp_b;
                        act_b = signed'(out_data_o[i*8 +: 8]);
                        exp_b = signed'(exp_d_pipe[L-1][i*8 +: 8]);
                        if (act_b !== exp_b) begin
                            if (test_errors < 20) begin
                                $display("[ERROR][%s] Cycle %0t Lane %0d mismatch: Expected=%0d (0x%02h), Actual=%0d (0x%02h)",
                                         cur_test_id, $time, i, exp_b, exp_b[7:0], act_b, act_b[7:0]);
                            end
                            test_errors++;
                            total_errors++;
                        end
                    end
                end
            end else if (has_seen_valid_out) begin
                // Kiểm tra giữ dữ liệu (hold value) khi không có valid ở tầng cuối (RQ_015)
                if (out_data_o !== last_valid_out_data) begin
                    $display("[ERROR][%s] Cycle %0t: out_data_o changed while out_valid_o=0! Prev=%h, Now=%h",
                             cur_test_id, $time, last_valid_out_data, out_data_o);
                    test_errors++;
                    total_errors++;
                end
            end

            // 4. Dịch ống tham chiếu cho chu kỳ tiếp theo
            for (int k = L-1; k > 0; k--) begin
                exp_v_pipe[k] <= exp_v_pipe[k-1];
                exp_d_pipe[k] <= exp_d_pipe[k-1];
            end
            exp_v_pipe[0] <= in_valid_i;
            exp_d_pipe[0] <= in_valid_i ? golden_requant_row(acc_i, bias_i, mult_i, shift_i, zp_i) : '0;
        end
    end

    //==========================================================================
    // CÁC TASK TIỆN ÍCH ĐIỀU KHIỂN ĐẦU VÀO
    //==========================================================================
    task automatic clear_inputs();
        in_valid_i = 1'b0;
        acc_i      = '0;
        bias_i     = '0;
        mult_i     = '0;
        shift_i    = '0;
        zp_i       = '0;
    endtask

    task automatic apply_reset(input int low_cycles = 10);
        @(negedge CLK_i);
        RST_i = 1'b0;
        repeat (low_cycles) @(negedge CLK_i);
        RST_i = 1'b1;
    endtask

    task automatic wait_cycles(input int n = 10);
        repeat (n) @(negedge CLK_i);
    endtask

    // Đặt đồng nhất tất cả 16 làn hoặc từng làn
    task automatic set_lane(
        input int                lane,
        input logic signed [31:0] acc,
        input logic signed [31:0] bias,
        input logic signed [31:0] mult,
        input logic        [7:0]  sh,
        input logic signed [31:0] zp
    );
        acc_i  [lane*32 +: 32] = acc;
        bias_i [lane*32 +: 32] = bias;
        mult_i [lane*32 +: 32] = mult;
        shift_i[lane*8  +: 8]  = sh;
        zp_i   [lane*32 +: 32] = zp;
    endtask

    task automatic set_all_lanes(
        input logic signed [31:0] acc,
        input logic signed [31:0] bias,
        input logic signed [31:0] mult,
        input logic        [7:0]  sh,
        input logic signed [31:0] zp
    );
        for (int i = 0; i < N; i++) begin
            set_lane(i, acc, bias, mult, sh, zp);
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

    // Watchdog chống treo mô phỏng
    initial begin
        #50_000_000; // 50 ms
        $display("[FATAL] Watchdog timeout reached!");
        $finish;
    end

    //==========================================================================
    // CHƯƠNG TRÌNH KIỂM THỬ CHÍNH (RQ_001 .. RQ_016)
    //==========================================================================
    initial begin
        automatic int dummy;
        dummy = $value$plusargs("SEED=%d", seed);
        dummy = $urandom(seed);
        $display("================================================================================");
        $display(" STARTING TESTBENCH: tb_requant_pc (SEED = 0x%08h)", seed);
        $display("================================================================================");

        clear_inputs();
        RST_i = 1'b0;

        // ---------------------------------------------------------------------
        // RQ_001: Reset & Initialization
        // ---------------------------------------------------------------------
        begin_test("RQ_001", "Reset state and pipeline clean initialization");
        @(negedge CLK_i);
        RST_i      = 1'b0;
        in_valid_i = 1'b1; // Bơm dữ liệu khi đang reset để chắc chắn không lọt qua
        set_all_lanes(32'sd1000, 32'sd50, 32'sd2, 8'd1, 32'sd0);
        for (int c = 0; c < 10; c++) begin
            @(posedge CLK_i);
            #1;
            if (out_valid_o !== 1'b0) begin
                $display("[ERROR][RQ_001] out_valid_o=%b during reset!", out_valid_o);
                test_errors++; total_errors++;
            end
        end
        @(negedge CLK_i);
        clear_inputs();
        RST_i = 1'b1;
        wait_cycles(15);
        cov_rst_idle++;
        end_test("RQ_001");

        // ---------------------------------------------------------------------
        // RQ_002: Exact 7-Cycle Pipeline Latency & Single-Pulse out_valid_o
        // ---------------------------------------------------------------------
        begin_test("RQ_002", "Exact 7-cycle pipeline latency and single-cycle valid pulse");
        for (int trial = 0; trial < 10; trial++) begin
            automatic int lat_cnt = 0;
            automatic int pulse_w = 0;
            @(negedge CLK_i);
            in_valid_i = 1'b1;
            for (int i = 0; i < N; i++)
                set_lane(i, 32'sd100 + trial*16 + i, 32'sd10, 32'sd4, 8'd2, -32'sd5);
            @(negedge CLK_i);
            clear_inputs();

            // Đếm số chu kỳ tới khi out_valid_o == 1
            for (int c = 1; c <= 15; c++) begin
                @(posedge CLK_i);
                #1;
                if (out_valid_o === 1'b1) begin
                    if (pulse_w == 0) lat_cnt = c;
                    pulse_w++;
                end
            end
            // Chu kỳ đầu tiên đã qua tại negedge ngay sau khi nạp, nên c=6 tương ứng T0 + 7 sườn lên
            if ((lat_cnt != (L - 1)) || (pulse_w != 1)) begin
                $display("[ERROR][RQ_002] Trial %0d: Expected latency=%0d (measured=%0d), pulse_width=1 (measured=%0d)",
                         trial, L, lat_cnt + 1, pulse_w);
                test_errors++; total_errors++;
            end else begin
                cov_lat7_single++;
            end
            wait_cycles($urandom_range(1, 5));
        end
        end_test("RQ_002");

        // ---------------------------------------------------------------------
        // RQ_003: Back-to-Back Full-Throughput Streaming (256 rows)
        // ---------------------------------------------------------------------
        begin_test("RQ_003", "Back-to-back 256-row continuous streaming (1 row/cycle)");
        for (int r = 0; r < 256; r++) begin
            @(negedge CLK_i);
            in_valid_i = 1'b1;
            for (int i = 0; i < N; i++) begin
                set_lane(i,
                         signed'($urandom_range(0, 200000)) - 32'sd100000,
                         signed'($urandom_range(0, 2000))   - 32'sd1000,
                         signed'($urandom_range(1, 1024)),
                         8'($urandom_range(8, 18)),
                         signed'($urandom_range(0, 20)) - 32'sd10);
            end
        end
        @(negedge CLK_i);
        clear_inputs();
        wait_cycles(15);
        cov_b2b_stream++;
        end_test("RQ_003");

        // ---------------------------------------------------------------------
        // RQ_004: Legacy Per-Tensor Compatibility Mode (mult=1, bias=0)
        // ---------------------------------------------------------------------
        begin_test("RQ_004", "Legacy per-tensor compatibility mode (1,000 vectors, mult=1, bias=0)");
        for (int r = 0; r < 1000; r++) begin
            automatic logic [7:0] sh_common;
            automatic logic signed [31:0] zp_common;
            sh_common = 8'($urandom_range(0, 24));
            zp_common = signed'($urandom_range(0, 255)) - 32'sd128;
            @(negedge CLK_i);
            in_valid_i = 1'b1;
            for (int i = 0; i < N; i++) begin
                set_lane(i,
                         signed'($urandom()),
                         32'sd0,
                         32'sd1,
                         sh_common,
                         zp_common);
            end
        end
        @(negedge CLK_i);
        clear_inputs();
        wait_cycles(12);
        cov_per_tensor++;
        end_test("RQ_004");

        // ---------------------------------------------------------------------
        // RQ_005: Zero Shift Bypass Boundary (shift = 0, rnd_v = 0)
        // ---------------------------------------------------------------------
        begin_test("RQ_005", "Zero shift boundary (shift=0, no rounding offset added)");
        for (int base_v = -160; base_v <= 160; base_v += 16) begin
            @(negedge CLK_i);
            in_valid_i = 1'b1;
            for (int i = 0; i < N; i++) begin
                automatic int val = base_v + i;
                set_lane(i, val, (i % 2 == 0) ? 32'sd3 : -32'sd3,
                         (i % 3 == 0) ? -32'sd1 : 32'sd1, 8'd0, 32'sd0);
            end
        end
        @(negedge CLK_i);
        clear_inputs();
        wait_cycles(12);
        end_test("RQ_005");

        // ---------------------------------------------------------------------
        // RQ_006: Minimum Non-Zero Shift Rounding (shift = 1, tie-break +/-0.5)
        // ---------------------------------------------------------------------
        begin_test("RQ_006", "Shift=1 half-way rounding tie-break across [-256..+255]");
        for (int base_v = -256; base_v < 256; base_v += 16) begin
            @(negedge CLK_i);
            in_valid_i = 1'b1;
            for (int i = 0; i < N; i++) begin
                automatic int acc_v = base_v + i;
                if (acc_v > 0 && (acc_v & 1)) cov_shift_1_pos++;
                if (acc_v < 0 && (acc_v & 1)) cov_shift_1_neg++;
                set_lane(i, acc_v, 32'sd0, 32'sd1, 8'd1, 32'sd0);
            end
        end
        @(negedge CLK_i);
        clear_inputs();
        wait_cycles(12);
        end_test("RQ_006");

        // ---------------------------------------------------------------------
        // RQ_007: Maximum Valid Shift (shift=62) & Upper Bit Masking [7:6]
        // ---------------------------------------------------------------------
        begin_test("RQ_007", "Maximum shift=62 and upper bits shift_i[7:6] masking");
        for (int step = 0; step < 8; step++) begin
            logic [7:0] sh_base;
            case (step % 4)
                0: sh_base = 8'd31;
                1: sh_base = 8'd32;
                2: sh_base = 8'd61;
                default: sh_base = 8'd62;
            endcase
            // Nếu step >= 4 thì bật 2 bit cao [7:6] = 2'b11 để kiểm tra mask 6-bit
            if (step >= 4) sh_base = sh_base | 8'hC0;

            @(negedge CLK_i);
            in_valid_i = 1'b1;
            for (int i = 0; i < N; i++) begin
                logic signed [31:0] a_v, b_v, m_v;
                a_v = (i[0]) ? 32'sh7FFF_FFFF : -32'sh8000_0000;
                b_v = (i[1]) ? 32'sh7FFF_FFFF : -32'sh8000_0000;
                m_v = (i[2]) ? 32'sh7FFF_FFFF : -32'sh8000_0000;
                set_lane(i, a_v, b_v, m_v, sh_base, signed'(i - 8));
            end
        end
        @(negedge CLK_i);
        clear_inputs();
        wait_cycles(12);
        end_test("RQ_007");

        // ---------------------------------------------------------------------
        // RQ_008: Stage 1 33-bit Signed Addition Extremes (MAX+MAX, MIN+MIN)
        // ---------------------------------------------------------------------
        begin_test("RQ_008", "Stage-1 33-bit signed addition overflow prevention (acc + bias)");
        @(negedge CLK_i);
        in_valid_i = 1'b1;
        set_lane(0,  32'sh7FFF_FFFF,  32'sh7FFF_FFFF, 32'sd1, 8'd32, 32'sd0); // +2^32 - 2
        set_lane(1, -32'sh8000_0000, -32'sh8000_0000, 32'sd1, 8'd32, 32'sd0); // -2^32
        set_lane(2,  32'sh7FFF_FFFF, -32'sh8000_0000, 32'sd1, 8'd0,  32'sd0); // -1
        set_lane(3, -32'sh8000_0000,  32'sh7FFF_FFFF, 32'sd1, 8'd0,  32'sd0); // -1
        set_lane(4,  32'sh7FFF_FFFF,  32'sd1,         32'sd1, 8'd31, 32'sd0); // +2^31
        set_lane(5, -32'sh8000_0000, -32'sd1,         32'sd1, 8'd31, 32'sd0); // -2^31 - 1
        set_lane(6,  32'sh7FFF_FFFF,  32'sh7FFF_FFFF, 32'sd1, 8'd26, 32'sd0); // +64
        set_lane(7, -32'sh8000_0000, -32'sh8000_0000, 32'sd1, 8'd26, 32'sd0); // -64
        for (int i = 8; i < N; i++) begin
            set_lane(i, (i[0] ? 32'sh7FFF_FFFF : -32'sh8000_0000),
                        (i[1] ? 32'sh7FFF_FFFF : -32'sh8000_0000),
                        (i[2] ? -32'sd1 : 32'sd1), 8'd28, 32'sd0);
        end
        cov_s1_max_max++;
        cov_s1_min_min++;
        @(negedge CLK_i);
        clear_inputs();
        wait_cycles(12);
        end_test("RQ_008");

        // ---------------------------------------------------------------------
        // RQ_009: Stage 2/3 65-bit Signed Multiplication Extremes
        // ---------------------------------------------------------------------
        begin_test("RQ_009", "Stage-2 65-bit signed multiplication extremes (33b x 32b -> 65b)");
        for (int sh = 56; sh <= 62; sh++) begin
            @(negedge CLK_i);
            in_valid_i = 1'b1;
            // (-2^32) * (-2^31) = +2^63 (cần đúng 65-bit signed!)
            set_lane(0, -32'sh8000_0000, -32'sh8000_0000, -32'sh8000_0000, 8'(sh), 32'sd0);
            // (-2^32) * (2^31 - 1)
            set_lane(1, -32'sh8000_0000, -32'sh8000_0000,  32'sh7FFF_FFFF, 8'(sh), 32'sd0);
            // (2^32 - 2) * (-2^31)
            set_lane(2,  32'sh7FFF_FFFF,  32'sh7FFF_FFFF, -32'sh8000_0000, 8'(sh), 32'sd0);
            // (2^32 - 2) * (2^31 - 1)
            set_lane(3,  32'sh7FFF_FFFF,  32'sh7FFF_FFFF,  32'sh7FFF_FFFF, 8'(sh), 32'sd0);
            // Nhân với 0 và +/-1
            set_lane(4, -32'sh8000_0000, -32'sh8000_0000,  32'sd0,         8'(sh), 32'sd0);
            set_lane(5,  32'sh7FFF_FFFF,  32'sh7FFF_FFFF,  32'sd0,         8'(sh), 32'sd5);
            set_lane(6, -32'sh8000_0000,  32'sd0,         -32'sh8000_0000, 8'(sh), 32'sd0);
            set_lane(7,  32'sh7FFF_FFFF,  32'sd0,          32'sh7FFF_FFFF, 8'(sh), 32'sd0);
            for (int i = 8; i < N; i++) begin
                set_lane(i, (i[0] ? 32'sh7FFF_FFFF : -32'sh8000_0000),
                            (i[1] ? 32'sh7FFF_FFFF : -32'sh8000_0000),
                            (i[2] ? 32'sh7FFF_FFFF : -32'sh8000_0000),
                            8'(sh), signed'(i - 12));
            end
        end
        cov_s2_min_mul_min++;
        cov_s2_max_mul_max++;
        @(negedge CLK_i);
        clear_inputs();
        wait_cycles(12);
        end_test("RQ_009");

        // ---------------------------------------------------------------------
        // RQ_010: Negative & Positive Rounding Boundaries (2^(shift-1) +/- 1)
        // ---------------------------------------------------------------------
        begin_test("RQ_010", "Exact 0.5-LSB rounding boundaries across shift in {2, 7, 15, 24, 31, 48}");
        begin
            automatic int shifts_to_test[6] = '{2, 7, 15, 24, 31, 48};
            foreach (shifts_to_test[idx]) begin
                automatic int s = shifts_to_test[idx];
                automatic longint half_lsb = 64'sd1 <<< (s - 1);
                for (int k = -40; k <= 40; k += 5) begin
                    @(negedge CLK_i);
                    in_valid_i = 1'b1;
                    for (int i = 0; i < N; i++) begin
                        automatic longint delta = (i % 3 == 0) ? (half_lsb - 1) :
                                                  (i % 3 == 1) ? (half_lsb)     : (half_lsb + 1);
                        automatic longint target_p = (longint'(k + (i / 3)) <<< s) + delta;
                        if (s <= 24) begin
                            set_lane(i, 32'(target_p), 32'sd0, 32'sd1, 8'(s), 32'sd0);
                        end else if (s == 31) begin
                            // Dùng bộ cộng 33-bit (acc + bias) với mult = 1 để biểu diễn chính xác tới từng LSB ở shift=31
                            automatic logic signed [31:0] a_part = 32'(target_p >>> 1);
                            automatic logic signed [31:0] b_part = 32'(target_p - longint'(a_part));
                            set_lane(i, a_part, b_part, 32'sd1, 8'd31, 32'sd0);
                        end else begin
                            // s == 48 (half_lsb = 2^47):
                            // 2^47 - 1 = 10,610,063 * 13,264,529 (chính xác tuyệt đối tới 1 LSB!)
                            // 2^47     = 8,388,608  * 16,777,216
                            // 2^47 + 1 = (2^24 + 1) * (2^23 - 1) + ... hoặc kiểm tra quanh +/- 2^47
                            case (i % 4)
                                0: set_lane(i,  32'sd10610063, 32'sd0,  32'sd13264529, 8'd48, 32'sd0); // +2^47 - 1 -> 0
                                1: set_lane(i,  32'sd8388608,  32'sd0,  32'sd16777216, 8'd48, 32'sd0); // +2^47     -> +1
                                2: set_lane(i, -32'sd10610063, 32'sd0,  32'sd13264529, 8'd48, 32'sd0); // -2^47 + 1 -> 0
                                default: set_lane(i, -32'sd8388608, 32'sd0, 32'sd16777216, 8'd48, 32'sd0); // -2^47 -> 0, -2^47-1 -> -1
                            endcase
                        end
                    end
                    if (k >= 0) cov_rnd_half_pos++;
                    else        cov_rnd_half_neg++;
                end
            end
        end
        @(negedge CLK_i);
        clear_inputs();
        wait_cycles(12);
        end_test("RQ_010");

        // ---------------------------------------------------------------------
        // RQ_011: Upper Saturation Clamp (+127 / 8'h7F)
        // ---------------------------------------------------------------------
        begin_test("RQ_011", "Upper saturation clamp boundary (125, 126, 127, 128, 129 .. +MAX)");
        @(negedge CLK_i);
        in_valid_i = 1'b1;
        set_lane(0,  32'sd125, 32'sd0, 32'sd1, 8'd0, 32'sd0);
        set_lane(1,  32'sd126, 32'sd0, 32'sd1, 8'd0, 32'sd0);
        set_lane(2,  32'sd127, 32'sd0, 32'sd1, 8'd0, 32'sd0);
        set_lane(3,  32'sd128, 32'sd0, 32'sd1, 8'd0, 32'sd0);
        set_lane(4,  32'sd129, 32'sd0, 32'sd1, 8'd0, 32'sd0);
        set_lane(5,  32'sd255, 32'sd0, 32'sd1, 8'd0, 32'sd0);
        set_lane(6,  32'sd100, 32'sd0, 32'sd1, 8'd0, 32'sd27);  // 127 via zp
        set_lane(7,  32'sd100, 32'sd0, 32'sd1, 8'd0, 32'sd28);  // 128 via zp -> clamp 127
        set_lane(8,  32'sh7FFF_FFFF, 32'sh7FFF_FFFF, 32'sh7FFF_FFFF, 8'd0, 32'sh7FFF_FFFF); // Extreme 67-bit max
        set_lane(9, -32'sh8000_0000, -32'sh8000_0000, -32'sh8000_0000, 8'd0, 32'sh7FFF_FFFF); // +2^63 + MAX
        for (int i = 10; i < N; i++)
            set_lane(i, 32'sd120 + i, 32'sd0, 32'sd2, 8'd1, 32'sd0);
        @(negedge CLK_i);
        clear_inputs();
        wait_cycles(12);
        end_test("RQ_011");

        // ---------------------------------------------------------------------
        // RQ_012: Lower Saturation Clamp (-128 / 8'h80)
        // ---------------------------------------------------------------------
        begin_test("RQ_012", "Lower saturation clamp boundary (-126, -127, -128, -129, -130 .. -MAX)");
        @(negedge CLK_i);
        in_valid_i = 1'b1;
        set_lane(0, -32'sd126, 32'sd0, 32'sd1, 8'd0, 32'sd0);
        set_lane(1, -32'sd127, 32'sd0, 32'sd1, 8'd0, 32'sd0);
        set_lane(2, -32'sd128, 32'sd0, 32'sd1, 8'd0, 32'sd0);
        set_lane(3, -32'sd129, 32'sd0, 32'sd1, 8'd0, 32'sd0);
        set_lane(4, -32'sd130, 32'sd0, 32'sd1, 8'd0, 32'sd0);
        set_lane(5, -32'sd256, 32'sd0, 32'sd1, 8'd0, 32'sd0);
        set_lane(6, -32'sd100, 32'sd0, 32'sd1, 8'd0, -32'sd28); // -128 via zp
        set_lane(7, -32'sd100, 32'sd0, 32'sd1, 8'd0, -32'sd29); // -129 via zp -> clamp -128
        set_lane(8, -32'sh8000_0000, -32'sh8000_0000, 32'sh7FFF_FFFF, 8'd0, -32'sh8000_0000); // Extreme 67-bit min
        set_lane(9,  32'sh7FFF_FFFF,  32'sh7FFF_FFFF, -32'sh8000_0000, 8'd0, -32'sh8000_0000);
        for (int i = 10; i < N; i++)
            set_lane(i, -32'sd120 - i, 32'sd0, 32'sd2, 8'd1, 32'sd0);
        @(negedge CLK_i);
        clear_inputs();
        wait_cycles(12);
        end_test("RQ_012");

        // ---------------------------------------------------------------------
        // RQ_013: Zero-Point Signed 32-bit Extremes
        // ---------------------------------------------------------------------
        begin_test("RQ_013", "Zero-point signed 32-bit extremes and sign extension");
        begin
            automatic logic signed [31:0] zp_list[16] = '{
                -32'sd128, -32'sd127, -32'sd64, -32'sd1,
                 32'sd0,    32'sd1,    32'sd64,  32'sd127,
                 32'sd128, -32'sd129,  32'sd1000, -32'sd1000,
                 32'sh7FFF_FFFF, -32'sh8000_0000, 32'sd50, -32'sd50
            };
            for (int r = -50; r <= 50; r += 10) begin
                @(negedge CLK_i);
                in_valid_i = 1'b1;
                for (int i = 0; i < N; i++) begin
                    set_lane(i, r * 4, 32'sd0, 32'sd1, 8'd2, zp_list[i]);
                end
            end
        end
        @(negedge CLK_i);
        clear_inputs();
        wait_cycles(12);
        end_test("RQ_013");

        // ---------------------------------------------------------------------
        // RQ_014: Per-Channel 16-Lane Independence (Walking Lane Test)
        // ---------------------------------------------------------------------
        begin_test("RQ_014", "Per-channel 16-lane independence (walking extremes across 16 lanes)");
        for (int target_lane = 0; target_lane < N; target_lane++) begin
            @(negedge CLK_i);
            in_valid_i = 1'b1;
            for (int i = 0; i < N; i++) begin
                if (i == target_lane) begin
                    // Làn mục tiêu chạy phép tính chính xác không bão hòa
                    set_lane(i, 32'sd300 + i*10, -32'sd20, 32'sd3, 8'd4, 32'sd5);
                end else if (i[0]) begin
                    // Các làn lẻ xung quanh bão hòa dương cực đại
                    set_lane(i, 32'sh7FFF_FFFF, 32'sh7FFF_FFFF, 32'sh7FFF_FFFF, 8'd0, 32'sd127);
                end else begin
                    // Các làn chẵn xung quanh bão hòa âm cực tiểu với shift=62
                    set_lane(i, -32'sh8000_0000, -32'sh8000_0000, 32'sh7FFF_FFFF, 8'd62, -32'sd128);
                end
            end
            cov_lane_indep++;
        end
        @(negedge CLK_i);
        clear_inputs();
        wait_cycles(12);
        end_test("RQ_014");

        // ---------------------------------------------------------------------
        // RQ_015: Sparse Valid Bubbles (Hold Output) & Mid-Flight Reset Abort
        // ---------------------------------------------------------------------
        begin_test("RQ_015", "Sparse in_valid_i bubbles (hold output value) and mid-flight reset abort");
        // Phần A: 100 chu kỳ với in_valid_i ngẫu nhiên 30%, khi in_valid_i=0 bơm rác cực đại vào cổng input
        for (int c = 0; c < 100; c++) begin
            @(negedge CLK_i);
            in_valid_i = ($urandom_range(0, 99) < 30);
            if (in_valid_i) begin
                for (int i = 0; i < N; i++)
                    set_lane(i, signed'($urandom_range(0, 1000)) - 500, 32'sd10, 32'sd3, 8'd4, 32'sd0);
            end else begin
                // Bơm dữ liệu rác khi in_valid_i = 0
                set_all_lanes(32'sh7FFF_FFFF, 32'sh7FFF_FFFF, 32'sh7FFF_FFFF, 8'd0, 32'sd127);
                cov_bubble_hold++;
            end
        end
        @(negedge CLK_i);
        clear_inputs();
        wait_cycles(12);

        // Phần B: Mid-flight reset khi 5 hàng đang bay trong đường ống
        for (int c = 0; c < 5; c++) begin
            @(negedge CLK_i);
            in_valid_i = 1'b1;
            set_all_lanes(32'sd500 + c, 32'sd0, 32'sd1, 8'd2, 32'sd0);
        end
        // Ngay tại chu kỳ thứ 5 (chưa hàng nào kịp ra ở tầng 7), kéo RST_i = 0
        @(negedge CLK_i);
        clear_inputs();
        RST_i = 1'b0;
        wait_cycles(3);
        RST_i = 1'b1;
        cov_midflight_rst++;
        // Chờ 10 chu kỳ xác nhận 5 hàng trước reset đã bị hủy sạch, rồi bơm 4 hàng mới
        wait_cycles(10);
        for (int c = 0; c < 4; c++) begin
            @(negedge CLK_i);
            in_valid_i = 1'b1;
            for (int i = 0; i < N; i++)
                set_lane(i, -32'sd40 + c*10 + i, 32'sd4, 32'sd2, 8'd1, 32'sd1);
        end
        @(negedge CLK_i);
        clear_inputs();
        wait_cycles(12);
        end_test("RQ_015");

        // ---------------------------------------------------------------------
        // RQ_016: Constrained-Random Stress & Qwen2-Audio P1.5 Distribution
        //         (100,000 rows = 1,600,000 channel operations)
        // ---------------------------------------------------------------------
        begin_test("RQ_016", "100,000-row (1.6M operations) random stress & Qwen2-Audio P1.5 distribution");
        for (int r = 0; r < 100000; r++) begin
            @(negedge CLK_i);
            in_valid_i = 1'b1;
            if (r[0] == 1'b0) begin
                // Phân phối thực tế của Qwen2-Audio INT8 P1.5:
                // acc in [-2^22, +2^22], bias in [-2^16, +2^16], mult in [2^29, 2^31-1], shift in [28..42], zp in [-2..2]
                for (int i = 0; i < N; i++) begin
                    logic signed [31:0] r_acc, r_bias, r_mult, r_zp;
                    logic [7:0] r_sh;
                    r_acc  = signed'($urandom()) >>> 9;
                    r_bias = signed'($urandom()) >>> 15;
                    r_mult = 32'($urandom_range(32'h2000_0000, 32'h7FFF_FFFF));
                    r_sh   = 8'($urandom_range(28, 42));
                    r_zp   = signed'($urandom_range(0, 4)) - 32'sd2;
                    set_lane(i, r_acc, r_bias, r_mult, r_sh, r_zp);
                end
                cov_qwen2_dist++;
            end else begin
                // Ngẫu nhiên toàn dải 32-bit + corner shift 0..62
                for (int i = 0; i < N; i++) begin
                    set_lane(i,
                             signed'($urandom()),
                             signed'($urandom()),
                             signed'($urandom()),
                             8'($urandom_range(0, 62)),
                             signed'($urandom_range(0, 255)) - 32'sd128);
                end
            end
        end
        @(negedge CLK_i);
        clear_inputs();
        wait_cycles(15);
        end_test("RQ_016");

        //======================================================================
        // BÁO CÁO TỔNG KẾT & FUNCTIONAL COVERAGE
        //======================================================================
        $display("================================================================================");
        $display(" FUNCTIONAL COVERAGE & VERIFICATION SUMMARY (tb_requant_pc)");
        $display("================================================================================");
        $display(" Total Rows Verified   : %0d", total_rows_checked);
        $display(" Total Lanes Verified  : %0d", total_lanes_checked);
        $display(" [COV] Reset & Idle    : %0d hits", cov_rst_idle);
        $display(" [COV] Latency=7 Pulse : %0d hits", cov_lat7_single);
        $display(" [COV] B2B Stream 256  : %0d hits", cov_b2b_stream);
        $display(" [COV] Per-Tensor Mode : %0d hits", cov_per_tensor);
        $display(" [COV] Shift == 0      : %0d hits", cov_shift_0);
        $display(" [COV] Shift == 1 Tie  : pos=%0d, neg=%0d hits", cov_shift_1_pos, cov_shift_1_neg);
        $display(" [COV] Shift == 62 Max : %0d hits (upper bits masked=%0d)", cov_shift_62, cov_shift_mask_hi);
        $display(" [COV] S1 33b Extremes : max+max=%0d, min+min=%0d", cov_s1_max_max, cov_s1_min_min);
        $display(" [COV] S2 65b Extremes : min*min=%0d, max*max=%0d", cov_s2_min_mul_min, cov_s2_max_mul_max);
        $display(" [COV] 0.5-LSB Round   : pos=%0d, neg=%0d", cov_rnd_half_pos, cov_rnd_half_neg);
        $display(" [COV] Upper Clamp 127 : exact_127=%0d, clamped_gt127=%0d", cov_sat_pos_127, cov_sat_pos_clamp);
        $display(" [COV] Lower Clamp-128 : exact_m128=%0d, clamped_lt_m128=%0d", cov_sat_neg_m128, cov_sat_neg_clamp);
        $display(" [COV] Zero-Point      : pos=%0d, neg=%0d", cov_zp_pos, cov_zp_neg);
        $display(" [COV] 16-Lane Indep   : %0d hits", cov_lane_indep);
        $display(" [COV] Bubble & Reset  : bubble_hold=%0d, midflight_rst=%0d", cov_bubble_hold, cov_midflight_rst);
        $display(" [COV] Qwen2 P1.5 Dist : %0d rows", cov_qwen2_dist);
        $display("--------------------------------------------------------------------------------");
        if (total_errors == 0) begin
            $display(" TEST PASSED (total_errors = 0 across %0d lane operations)", total_lanes_checked);
        end else begin
            $display(" TEST FAILED (total_errors = %0d)", total_errors);
        end
        $display("================================================================================");
        $finish;
    end

endmodule

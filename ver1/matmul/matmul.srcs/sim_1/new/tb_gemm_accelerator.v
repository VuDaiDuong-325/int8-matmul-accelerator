`timescale 1ns / 1ps
// ============================================================
// Testbench: tb_gemm_accelerator
// Mục tiêu: Kiểm thử gemm_accelerator với BRAM Ping-Pong Buffer
//
// Các thay đổi so với TB cũ:
//   1. k_dim = N (kích thước 1 tile = 1 BRAM block = N slices)
//   2. Drive AXI-Stream: tlast bật ở flit cuối MỖI TILE (không phải cuối tất cả)
//   3. Auto-checker: index row đúng thứ tự drain bottom→top của systolic array
//   4. Timeout watchdog tránh treo simulation
//   5. disable wait_result khi checker hoàn thành
// ============================================================

module tb_gemm_accelerator;

    // =========================================================
    // 1. PARAMETERS
    // =========================================================
    parameter N          = 16;
    parameter FIFO_DEPTH = 1024;
    parameter BRAM_DEPTH = 1024;
    parameter DATA_WIDTH = 8;

    // K_BLOCKS: số tile theo chiều K (mỗi tile = N slices)
    parameter K_BLOCKS = 1;
    parameter K_TOTAL  = K_BLOCKS * N;   // = 64

    // Timeout watchdog
    parameter TIMEOUT_CYCLES = 200000;

    // =========================================================
    // 2. SIGNALS
    // =========================================================
    reg         aclk;
    reg         aresetn;
    reg  [31:0] k_dim;

    reg  [(N*DATA_WIDTH)-1:0] s_axis_a_tdata;
    reg                       s_axis_a_tvalid;
    wire                      s_axis_a_tready;
    reg                       s_axis_a_tlast;

    reg  [(N*DATA_WIDTH)-1:0] s_axis_b_tdata;
    reg                       s_axis_b_tvalid;
    wire                      s_axis_b_tready;
    reg                       s_axis_b_tlast;

    wire [31:0] m_axis_c_tdata;
    wire        m_axis_c_tvalid;
    reg         m_axis_c_tready;
    wire        m_axis_c_tlast;

    // =========================================================
    // 3. GOLDEN MODEL
    // =========================================================
    reg signed [DATA_WIDTH-1:0] A_mem      [0:N-1][0:K_TOTAL-1];
    reg signed [DATA_WIDTH-1:0] B_mem      [0:K_TOTAL-1][0:N-1];
    reg signed [31:0]           C_expected [0:N-1][0:N-1];

    integer gi, gj, gk;

    initial begin
        // Giá trị nhỏ (-15..15) để tổng K_TOTAL tích không tràn INT32:
        // max = 15*15*64 = 14400 << 2^31
        for (gk = 0; gk < K_TOTAL; gk = gk + 1) begin
            for (gi = 0; gi < N; gi = gi + 1)
                A_mem[gi][gk] = ($random % 16);
            for (gj = 0; gj < N; gj = gj + 1)
                B_mem[gk][gj] = ($random % 16);
        end

        // Tính C = A x B (golden)
        for (gi = 0; gi < N; gi = gi + 1)
            for (gj = 0; gj < N; gj = gj + 1) begin
                C_expected[gi][gj] = 32'sd0;
                for (gk = 0; gk < K_TOTAL; gk = gk + 1)
                    C_expected[gi][gj] = C_expected[gi][gj]
                                       + $signed(A_mem[gi][gk]) * $signed(B_mem[gk][gj]);
            end
    end

    // =========================================================
    // 4. DUT INSTANTIATION
    // =========================================================
    gemm_accelerator #(
        .N         (N),
        .DATA_WIDTH(DATA_WIDTH),
        .FIFO_DEPTH(FIFO_DEPTH),
        .BRAM_DEPTH(BRAM_DEPTH)
    ) dut (
        .aclk            (aclk),
        .aresetn         (aresetn),
        .k_dim           (k_dim),

        .s_axis_a_tdata  (s_axis_a_tdata),
        .s_axis_a_tvalid (s_axis_a_tvalid),
        .s_axis_a_tready (s_axis_a_tready),
        .s_axis_a_tlast  (s_axis_a_tlast),

        .s_axis_b_tdata  (s_axis_b_tdata),
        .s_axis_b_tvalid (s_axis_b_tvalid),
        .s_axis_b_tready (s_axis_b_tready),
        .s_axis_b_tlast  (s_axis_b_tlast),

        .m_axis_c_tdata  (m_axis_c_tdata),
        .m_axis_c_tvalid (m_axis_c_tvalid),
        .m_axis_c_tready (m_axis_c_tready),
        .m_axis_c_tlast  (m_axis_c_tlast)
    );

    // =========================================================
    // 5. CLOCK (100 MHz)
    // =========================================================
    initial aclk = 1'b0;
    always  #5  aclk = ~aclk;

    // =========================================================
    // 6. MAIN STIMULUS
    // =========================================================
    initial begin
        aresetn         = 1'b0;
        s_axis_a_tvalid = 1'b0;
        s_axis_a_tlast  = 1'b0;
        s_axis_a_tdata  = {(N*DATA_WIDTH){1'b0}};
        s_axis_b_tvalid = 1'b0;
        s_axis_b_tlast  = 1'b0;
        s_axis_b_tdata  = {(N*DATA_WIDTH){1'b0}};
        m_axis_c_tready = 1'b1;

        // [FIX TB-1] k_dim = N = 16: mỗi BRAM block = 16 flit (1 tile)
        k_dim = N;

        repeat(10) @(posedge aclk);
        aresetn = 1'b1;
        repeat(5)  @(posedge aclk);

        $display("[%0t ns] [TB] Reset done. N=%0d K_BLOCKS=%0d K_TOTAL=%0d k_dim=%0d",
                 $time, N, K_BLOCKS, K_TOTAL, k_dim);

        fork
            drive_axis_A();
            drive_axis_B();
        join

        $display("[%0t ns] [TB] All data sent. Waiting for result...", $time);

        // Watchdog
        begin : wait_result
            integer wdog;
            for (wdog = 0; wdog < TIMEOUT_CYCLES; wdog = wdog + 1)
                @(posedge aclk);
            $display("[%0t ns] [ERROR] TIMEOUT after %0d cycles!", $time, TIMEOUT_CYCLES);
            $finish;
        end
    end

    // =========================================================
    // 7. AXI-STREAM MASTER TASKS
    // =========================================================

    // Ma trận A: gửi theo CỘT (column-major slice)
    // Mỗi flit = 1 cột đầy đủ N phần tử
    // Mỗi tile = N cột liên tiếp, tlast bật ở cột cuối MỖI tile
    task drive_axis_A;
        integer blk, col, row;
        begin
            for (blk = 0; blk < K_BLOCKS; blk = blk + 1) begin
                for (col = 0; col < N; col = col + 1) begin

                    // Pack: hàng 0 ở bit [7:0], hàng N-1 ở bit cao nhất
                    for (row = 0; row < N; row = row + 1)
                        s_axis_a_tdata[row*DATA_WIDTH +: DATA_WIDTH]
                            = A_mem[row][blk * N + col];

                    s_axis_a_tvalid = 1'b1;
                    // [FIX TB-2] tlast = 1 cuối mỗi tile (col == N-1), KHÔNG phải cuối tất cả
                    s_axis_a_tlast  = (col == N - 1) ? 1'b1 : 1'b0;

                    @(posedge aclk);
                    while (!s_axis_a_tready) @(posedge aclk);
                end
            end
            s_axis_a_tvalid = 1'b0;
            s_axis_a_tlast  = 1'b0;
        end
    endtask

    // Ma trận B: gửi theo HÀNG (row-major slice)
    // Mỗi flit = 1 hàng đầy đủ N phần tử
    task drive_axis_B;
        integer blk, row, col;
        begin
            for (blk = 0; blk < K_BLOCKS; blk = blk + 1) begin
                for (row = 0; row < N; row = row + 1) begin

                    for (col = 0; col < N; col = col + 1)
                        s_axis_b_tdata[col*DATA_WIDTH +: DATA_WIDTH]
                            = B_mem[blk * N + row][col];

                    s_axis_b_tvalid = 1'b1;
                    s_axis_b_tlast  = (row == N - 1) ? 1'b1 : 1'b0;

                    @(posedge aclk);
                    while (!s_axis_b_tready) @(posedge aclk);
                end
            end
            s_axis_b_tvalid = 1'b0;
            s_axis_b_tlast  = 1'b0;
        end
    endtask

    // =========================================================
    // 8. AUTO CHECKER
    // =========================================================
    // Thứ tự xuất của output_serializer:
    //   - Drain bắt đầu từ ROW DƯỚI CÙNG của systolic array (row index N-1)
    //     và tiến dần lên row 0.
    //   - Mỗi row: col 0 → col N-1 (trái sang phải).
    //
    // Ánh xạ recv_count → C[out_row][out_col]:
    //   out_row = (N-1) - (recv_count / N)   [FIX TB-3]
    //   out_col = recv_count % N

    integer match_count;
    integer recv_count;
    integer chk_row, chk_col;

    initial begin
        match_count = 0;
        recv_count  = 0;
    end

    always @(posedge aclk) begin
        if (aresetn && m_axis_c_tvalid && m_axis_c_tready) begin

            chk_row = (N - 1) - (recv_count / N);
            chk_col = recv_count % N;

            if ($signed(m_axis_c_tdata) === C_expected[chk_row][chk_col]) begin
                match_count = match_count + 1;
            end else begin
                $display("[%0t ns] [MISMATCH] C[%0d][%0d]: exp=%0d got=%0d",
                         $time, chk_row, chk_col,
                         C_expected[chk_row][chk_col],
                         $signed(m_axis_c_tdata));
            end

            recv_count = recv_count + 1;

            if (m_axis_c_tlast || recv_count == N * N) begin
                $display("============================================");
                $display("[%0t ns] Nhan du %0d phan tu.", $time, recv_count);
                $display("  DUNG: %0d / %0d", match_count, recv_count);
                if (match_count == N * N)
                    $display("  >>>>> PASSED 100%% <<<<<");
                else
                    $display("  >>>>> FAILED (%0d sai) <<<<<", recv_count - match_count);
                $display("============================================");
                disable wait_result;
                $finish;
            end
        end
    end

    // =========================================================
    // 9. WAVEFORM DUMP (bỏ comment để debug)
    // =========================================================
    // initial begin
    //     $dumpfile("tb_gemm_accelerator.vcd");
    //     $dumpvars(0, tb_gemm_accelerator);
    // end

endmodule
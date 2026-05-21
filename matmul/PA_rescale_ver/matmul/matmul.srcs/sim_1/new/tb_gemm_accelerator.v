`timescale 1ns / 1ps
// =============================================================================
// Testbench: tb_gemm_accelerator
// Target   : gemm_accelerator (systolic 16×16 INT8, ping-pong BRAM, post-acc,
//            int32→int8 rescale)
// Revisions:
//   - Loai bo moi tham chieu den state SHIFTING (da xoa trong output_serializer)
//   - Sua lai receiver process: dung Verilog Event thay cho join_none de tranh loi
//   - Cai thien timing handshake: gui data truoc posedge, cho ready sau
//   - Chuyen cac thong bao $display sang tieng Viet khong dau de tranh loi parser Vivado
// =============================================================================

module tb_gemm_accelerator();

    // =========================================================================
    // 1. PARAMETERS
    // =========================================================================
    parameter N          = 16;
    parameter DATA_WIDTH = 8;
    parameter FIFO_DEPTH = 1024;
    parameter BRAM_DEPTH = 1024;

    // K_DIM: So buoc K moi systolic pass (= kich thuoc BRAM bank)
    parameter K_DIM      = 32;
    parameter K_BLOCKS   = K_DIM / N;      // = 2 chunks/tile

    // NUM_K_TILES: So tiles tich luy qua post_accumulator
    parameter NUM_K_TILES = 16;            // K_TOTAL = 512
    parameter K_TOTAL     = K_DIM * NUM_K_TILES;

    // Rescale
    parameter SCALE_SHIFT = 10;
    parameter ZERO_POINT  = 0;

    // =========================================================================
    // 2. SIGNALS
    // =========================================================================
    reg  aclk;
    reg  aresetn;
    reg  [31:0] k_dim;
    reg  [31:0] num_k_tiles_r;
    reg  [4:0]  scale_shift_r;
    reg  [7:0]  zero_point_r;

    // AXI Stream A
    reg  [(N*DATA_WIDTH)-1:0] s_axis_a_tdata;
    reg                        s_axis_a_tvalid;
    wire                      s_axis_a_tready;
    reg                        s_axis_a_tlast;

    // AXI Stream B
    reg  [(N*DATA_WIDTH)-1:0] s_axis_b_tdata;
    reg                        s_axis_b_tvalid;
    wire                      s_axis_b_tready;
    reg                        s_axis_b_tlast;

    // AXI Stream C (INT8 output)
    wire [(N*8)-1:0]          m_axis_c_tdata;
    wire                      m_axis_c_tvalid;
    reg                        m_axis_c_tready;
    wire                      m_axis_c_tlast;
    wire                      m_axis_c_tuser;

    // =========================================================================
    // 3. DUT INSTANTIATION
    // =========================================================================
    gemm_accelerator #(
        .N(N),
        .DATA_WIDTH(DATA_WIDTH),
        .FIFO_DEPTH(FIFO_DEPTH),
        .BRAM_DEPTH(BRAM_DEPTH)
    ) dut (
        .aclk           (aclk),
        .aresetn        (aresetn),
        .k_dim          (k_dim),
        .num_k_tiles    (num_k_tiles_r),
        .scale_shift    (scale_shift_r),
        .zero_point     (zero_point_r),

        .s_axis_a_tdata (s_axis_a_tdata),
        .s_axis_a_tvalid(s_axis_a_tvalid),
        .s_axis_a_tready(s_axis_a_tready),
        .s_axis_a_tlast (s_axis_a_tlast),

        .s_axis_b_tdata (s_axis_b_tdata),
        .s_axis_b_tvalid(s_axis_b_tvalid),
        .s_axis_b_tready(s_axis_b_tready),
        .s_axis_b_tlast (s_axis_b_tlast),

        .m_axis_c_tdata (m_axis_c_tdata),
        .m_axis_c_tvalid(m_axis_c_tvalid),
        .m_axis_c_tready(m_axis_c_tready),
        .m_axis_c_tlast (m_axis_c_tlast),
        .m_axis_c_tuser (m_axis_c_tuser)
    );

    // =========================================================================
    // 4. CLOCK GENERATION
    // =========================================================================
    initial begin
        aclk = 0;
        forever #5 aclk = ~aclk; // 100 MHz
    end

    // =========================================================================
    // 5. TEST DATA ARRAYS & GOLDEN MODEL
    // =========================================================================
    reg signed [7:0]  A_mem      [0:N-1][0:K_TOTAL-1];
    reg signed [7:0]  B_mem      [0:K_TOTAL-1][0:N-1];
    reg signed [31:0] C_int32    [0:N-1][0:N-1];
    reg signed [7:0]  C_expected [0:N-1][0:N-1];
    reg signed [7:0]  C_npu_result[0:N-1][0:N-1];

    integer r, c, k;

    // -------------------------------------------------------------------------
    // quantize()
    // -------------------------------------------------------------------------
    function signed [7:0] quantize;
        input signed [31:0] val;
        input [4:0]         shift;
        input signed [7:0]  zp;
        reg signed [33:0]   ext_val;
        reg signed [33:0]   bias;
        reg signed [33:0]   rounded;
        reg signed [33:0]   shifted;
        reg signed [33:0]   zp_added;
        begin
            ext_val  = {{2{val[31]}}, val}; 

            if (shift > 5'd0)
                bias = 34'd1 << (shift - 5'd1);
            else
                bias = 34'd0;

            rounded  = $signed(ext_val) + $signed({1'b0, bias[32:0]});
            shifted  = $signed(rounded) >>> shift;
            zp_added = $signed(shifted) + $signed({{26{zp[7]}}, zp});

            if ($signed(zp_added) > 34'sd127)
                quantize = 8'sh7F;
            else if ($signed(zp_added) < -34'sd128)
                quantize = 8'sh80;
            else
                quantize = zp_added[7:0];
        end
    endfunction

    // =========================================================================
    // 6. DMA SEND TASKS
    // =========================================================================
    task send_chunk_A;
        input integer tile_idx;
        input integer chunk_idx;
        integer k_idx, i;
        reg [(N*DATA_WIDTH)-1:0] beat;
        begin
            for (k_idx = 0; k_idx < N; k_idx = k_idx + 1) begin
                beat = {(N*DATA_WIDTH){1'b0}};
                for (i = 0; i < N; i = i + 1)
                    beat[i*DATA_WIDTH +: DATA_WIDTH] =
                        A_mem[i][tile_idx*K_DIM + chunk_idx*N + k_idx];

                @(negedge aclk);
                s_axis_a_tdata  <= beat;
                s_axis_a_tvalid <= 1'b1;
                s_axis_a_tlast  <= (k_idx == N-1) ? 1'b1 : 1'b0;

                @(posedge aclk);
                while (!s_axis_a_tready) @(posedge aclk);
            end
            @(negedge aclk);
            s_axis_a_tvalid <= 1'b0;
            s_axis_a_tlast  <= 1'b0;
        end
    endtask

    task send_chunk_B;
        input integer tile_idx;
        input integer chunk_idx;
        integer k_idx, j;
        reg [(N*DATA_WIDTH)-1:0] beat;
        begin
            for (k_idx = 0; k_idx < N; k_idx = k_idx + 1) begin
                beat = {(N*DATA_WIDTH){1'b0}};
                for (j = 0; j < N; j = j + 1)
                    beat[j*DATA_WIDTH +: DATA_WIDTH] =
                        B_mem[tile_idx*K_DIM + chunk_idx*N + k_idx][j];

                @(negedge aclk);
                s_axis_b_tdata  <= beat;
                s_axis_b_tvalid <= 1'b1;
                s_axis_b_tlast  <= (k_idx == N-1) ? 1'b1 : 1'b0;

                @(posedge aclk);
                while (!s_axis_b_tready) @(posedge aclk);
            end
            @(negedge aclk);
            s_axis_b_tvalid <= 1'b0;
            s_axis_b_tlast  <= 1'b0;
        end
    endtask

    // =========================================================================
    // 7. RECEIVER PROCESS (Verilog-2001 Compliant)
    // =========================================================================
    integer  recv_rows;
    integer  sof_ok, eof_ok;
    event    result_received;
    event    start_receiver_event; // Event de kich hoat parallel process nhan du lieu

    initial m_axis_c_tready = 1'b1; 

    // Thay vi gieo fork-join_none, ta dung block rieng cho receiver cho doi event
    initial begin
        @(start_receiver_event);
        receive_result();
    end

    task receive_result;
        integer row_idx;
        integer col_idx;
        begin
            recv_rows = 0;
            sof_ok    = 0;
            eof_ok    = 0;

            $display("[%0t ns] [RX] Waiting for output matrix C...", $time);

            // Chờ posedge TRƯỚC, check tvalid NGAY trên posedge đó.
            // Không có @(posedge aclk) thừa trước vòng lặp và không có ở cuối body
            // => không bao giờ bỏ mất beat SOF đầu tiên.
            row_idx = 0;
            while (row_idx < N) begin
                @(posedge aclk);
                #1;
                if (m_axis_c_tvalid && m_axis_c_tready) begin

                    if (row_idx == 0) begin
                        if (m_axis_c_tuser)
                            sof_ok = 1;
                        else
                            $display("[WARN] [RX] SOF (tuser) KHONG bat o hang 0!");
                        $display("[%0t ns] [RX] SOF nhan duoc - bat dau ghi matrix C...", $time);
                    end

                    for (col_idx = 0; col_idx < N; col_idx = col_idx + 1)
                        C_npu_result[row_idx][col_idx] = m_axis_c_tdata[col_idx*8 +: 8];

                    if (row_idx == N-1) begin
                        if (m_axis_c_tlast)
                            eof_ok = 1;
                        else
                            $display("[WARN] [RX] EOF (tlast) KHONG bat o hang %0d!", N-1);
                    end

                    row_idx = row_idx + 1;
                end
            end

            $display("[%0t ns] [RX] Nhan du %0d hang.", $time, N);
            -> result_received;
        end
    endtask

    // =========================================================================
    // 8. MAIN TEST FLOW
    // =========================================================================
    integer t, chunk;
    integer match_count;
    integer mismatch_count;

    initial begin
        // ── Reset ─────────────────────────────────────────────────────────────
        aresetn         = 0;
        s_axis_a_tvalid = 0;
        s_axis_a_tlast  = 0;
        s_axis_b_tvalid = 0;
        s_axis_b_tlast  = 0;
        k_dim           = K_DIM;
        num_k_tiles_r   = NUM_K_TILES;
        scale_shift_r   = SCALE_SHIFT;
        zero_point_r    = ZERO_POINT;

        #100;
        aresetn = 1;
        #50;

        $display("=================================================================");
        $display("[%0t ns]  GEMM ACCELERATOR TESTBENCH", $time);
        $display("  N=%0d | K_DIM=%0d | K_BLOCKS=%0d | NUM_K_TILES=%0d | K_TOTAL=%0d",
                  N, K_DIM, K_BLOCKS, NUM_K_TILES, K_TOTAL);
        $display("  SCALE_SHIFT=%0d | ZERO_POINT=%0d", SCALE_SHIFT, ZERO_POINT);
        $display("=================================================================");

        // ── 1. Khoi tao du lieu ngau nhien ─────────────────────────────────
        for (r = 0; r < N; r = r + 1)
            for (c = 0; c < N; c = c + 1)
                C_int32[r][c] = 32'sd0;

        for (r = 0; r < N; r = r + 1)
            for (k = 0; k < K_TOTAL; k = k + 1)
                A_mem[r][k] = $random % 128; 

        for (k = 0; k < K_TOTAL; k = k + 1)
            for (c = 0; c < N; c = c + 1)
                B_mem[k][c] = $random % 128;

        // ── 2. Tinh golden model C = A x B tren software ──────────────────
        // Luu y thu tu hang:
        //   - beat A dong goi: beat[i*8+:8] = A_mem[i][k] => PE row i nhan A_mem[i]
        //   - Systolic drain tu BOTTOM: PE row N-1 thoat truoc
        //   - output_serializer ghi PE row N-1 dau tien => C_npu_result[0]
        //   => C_npu_result[r] tuong ung voi A_mem[N-1-r]
        //   => Golden: C_expected[r][c] = sum_k( A_mem[r][k] * B_mem[k][c] )
        $display("[%0t ns] [SW]  Tinh golden C = A x B...", $time);
        for (r = 0; r < N; r = r + 1)
            for (c = 0; c < N; c = c + 1)
                for (k = 0; k < K_TOTAL; k = k + 1)
                    C_int32[r][c] = C_int32[r][c] +
                        ($signed(A_mem[r][k]) * $signed(B_mem[k][c]));

        for (r = 0; r < N; r = r + 1)
            for (c = 0; c < N; c = c + 1)
                C_expected[r][c] = quantize(C_int32[r][c], SCALE_SHIFT, ZERO_POINT);

        $display("[%0t ns] [SW]  Golden model hoan thanh.", $time);

        // ── 3. Bat dau receiver task qua Trigger Event ────────────────────
        -> start_receiver_event;
        #0; // Cuong buoc scheduler nhong thread con chay truoc nham tranh race condition

        // ── 4. Gui tat ca tiles len NPU ────────────────────────────────────
        $display("[%0t ns] [TX]  Bat dau gui du lieu (%0d tiles)...", $time, NUM_K_TILES);
        for (t = 0; t < NUM_K_TILES; t = t + 1) begin
            $display("[%0t ns] [TX]  Tile %0d / %0d", $time, t+1, NUM_K_TILES);
            for (chunk = 0; chunk < K_BLOCKS; chunk = chunk + 1) begin
                fork
                    send_chunk_A(t, chunk);
                    send_chunk_B(t, chunk);
                join
            end
        end
        $display("[%0t ns] [TX]  Da nap du du lieu. Cho ket qua...", $time);

        // ── 5. Cho receiver bao xong ────────────────────────────────────────
        @(result_received);
        #100; 

        // ── 6. Kiem tra ket qua ─────────────────────────────────────────────
        $display("");
        $display("=================================================================");
        $display("  GOLDEN MODEL COMPARISON");
        $display("=================================================================");

        match_count    = 0;
        mismatch_count = 0;

        for (r = 0; r < N; r = r + 1) begin
            for (c = 0; c < N; c = c + 1) begin
                if (C_npu_result[r][c] === C_expected[r][c]) begin
                    match_count = match_count + 1;
                end else begin
                    mismatch_count = mismatch_count + 1;
                    $display("  [FAIL] C[%2d][%2d]  HW=%4d  SW=%4d  (INT32_raw=%0d)",
                        r, c,
                        $signed(C_npu_result[r][c]),
                        $signed(C_expected[r][c]),
                        C_int32[r][c]);
                end
            end
        end

        // ── 7. In bang ket qua ──────────────────────────────────────────────
        $display("");
        $display("-----------------------------------------------------------------");
        $display("  C_npu_result (INT8) - Hardware Output:");
        $display("-----------------------------------------------------------------");
        for (r = 0; r < N; r = r + 1) begin
            $write("  Row[%2d]: ", r);
            for (c = 0; c < N; c = c + 1)
                $write("%4d ", $signed(C_npu_result[r][c]));
            $write("\n");
        end

        $display("");
        $display("-----------------------------------------------------------------");
        $display("  C_expected (INT8) - Software Golden:");
        $display("-----------------------------------------------------------------");
        for (r = 0; r < N; r = r + 1) begin
            $write("  Row[%2d]: ", r);
            for (c = 0; c < N; c = c + 1)
                $write("%4d ", $signed(C_expected[r][c]));
            $write("\n");
        end

        // ── 8. Summary ────────────────────────────────────────────────────────
        $display("");
        $display("=================================================================");
        $display("  TEST SUMMARY");
        $display("=================================================================");
        $display("  K_DIM=%0d | NUM_K_TILES=%0d | K_TOTAL=%0d", K_DIM, NUM_K_TILES, K_TOTAL);
        $display("  SCALE_SHIFT=%0d | ZERO_POINT=%0d", SCALE_SHIFT, ZERO_POINT);
        
        if (sof_ok) $display("  SOF (tuser) OK : YES");
        else        $display("  SOF (tuser) OK : NO *** ERROR ***");
        
        if (eof_ok) $display("  EOF (tlast) OK : YES");
        else        $display("  EOF (tlast) OK : NO *** ERROR ***");
        
        $display("-----------------------------------------------------------------");
        if (match_count == N*N) begin
            $display("  [PASS]  TAT CA DUNG: %0d / %0d pixels!", match_count, N*N);
        end else begin
            $display("  [FAIL]  SAI: %0d / %0d pixels khong khop.", mismatch_count, N*N);
        end
        $display("=================================================================");

        $finish;
    end

    // =========================================================================
    // 9. FAILSAFE TIMEOUT
    // =========================================================================
    initial begin
        #20_000_000;
        $display("[%0t ns]  [TIMEOUT]  He thong treo hoac khong nhan duoc tin hieu hop le!", $time);
        $finish;
    end

endmodule
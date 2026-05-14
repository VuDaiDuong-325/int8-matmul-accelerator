`timescale 1ns / 1ps

module tb_gemm_accelerator();

    // =========================================================
    // 1. PARAMETERS
    // =========================================================
    parameter N          = 16;
    parameter DATA_WIDTH = 8;
    parameter FIFO_DEPTH = 1024;
    parameter BRAM_DEPTH = 1024;

    // K_DIM: Number of K steps per systolic pass (BRAM bank size)
    parameter K_DIM      = 32;
    parameter K_BLOCKS   = K_DIM / N;      // = 2 chunks per tile

    // NUM_K_TILES: Number of tiles to accumulate via post_accumulator
    parameter NUM_K_TILES = 16;           // Changed to 16 for K_TOTAL = 512
    parameter K_TOTAL     = K_DIM * NUM_K_TILES;  

    // Rescale Configuration
    parameter SCALE_SHIFT = 10;           // Changed to 10 to match C code
    parameter ZERO_POINT  = 0;

    // =========================================================
    // 2. SIGNALS
    // =========================================================
    reg  aclk;
    reg  aresetn;
    reg  [31:0] k_dim;
    reg  [31:0] num_k_tiles_r;
    reg  [4:0]  scale_shift_r;
    reg  [7:0]  zero_point_r;

    // AXI Stream A
    reg  [(N*DATA_WIDTH)-1:0] s_axis_a_tdata;
    reg                       s_axis_a_tvalid;
    wire                      s_axis_a_tready;
    reg                       s_axis_a_tlast;

    // AXI Stream B
    reg  [(N*DATA_WIDTH)-1:0] s_axis_b_tdata;
    reg                       s_axis_b_tvalid;
    wire                      s_axis_b_tready;
    reg                       s_axis_b_tlast;

    // AXI Stream C (Rescaled to INT8)
    wire [(N*8)-1:0]          m_axis_c_tdata;
    wire                      m_axis_c_tvalid;
    reg                       m_axis_c_tready;
    wire                      m_axis_c_tlast;
    wire                      m_axis_c_tuser;

    // =========================================================
    // 3. DUT INSTANTIATION
    // =========================================================
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

    // =========================================================
    // 4. CLOCK GENERATION
    // =========================================================
    initial begin
        aclk = 0;
        forever #5 aclk = ~aclk; // 100MHz
    end

    // =========================================================
    // 5. TEST DATA ARRAYS & FUNCTIONS
    // =========================================================
    reg signed [7:0]  A_mem [0:N-1][0:K_TOTAL-1];
    reg signed [7:0]  B_mem [0:K_TOTAL-1][0:N-1];
    reg signed [31:0] C_int32 [0:N-1][0:N-1];
    reg signed [7:0]  C_expected [0:N-1][0:N-1];
    reg signed [7:0]  C_npu_result [0:N-1][0:N-1];

    integer r, c, k, t;

    // Function to accurately simulate NPU Rescale algorithm
    function signed [7:0] quantize;
        input signed [31:0] val;
        input [4:0]         shift;
        input signed [7:0]  zp;
        reg signed [33:0]   ext_val;
        reg signed [33:0]   rounded;
        reg signed [33:0]   shifted;
        reg signed [33:0]   zp_added;
        begin
            ext_val = val; // Auto sign-extend to 34-bit
            
            if (shift > 5'd0)
                rounded = ext_val + (34'd1 << (shift - 5'd1));
            else
                rounded = ext_val;
                
            shifted = rounded >>> shift;
            zp_added = shifted + zp;
            
            if (zp_added > 34'sd127)
                quantize = 8'sd127;
            else if (zp_added < -34'sd128)
                quantize = -8'sd128;
            else
                quantize = zp_added[7:0];
        end
    endfunction

    // =========================================================
    // 6. DMA SEND TASKS (Simulate AXI MM2S)
    // =========================================================
    task send_chunk_A;
        input integer tile_idx;
        input integer chunk_idx;
        integer k_idx, i;
        reg [(N*DATA_WIDTH)-1:0] temp_data;
        begin
            for (k_idx = 0; k_idx < N; k_idx = k_idx + 1) begin
                temp_data = 0;
                for (i = 0; i < N; i = i + 1) begin
                    temp_data[i*DATA_WIDTH +: DATA_WIDTH] = A_mem[i][tile_idx*K_DIM + chunk_idx*N + k_idx];
                end
                
                s_axis_a_tdata  <= temp_data;
                s_axis_a_tvalid <= 1'b1;
                s_axis_a_tlast  <= (k_idx == N-1);
                
                @(posedge aclk);
                while (!s_axis_a_tready) @(posedge aclk);
            end
            s_axis_a_tvalid <= 1'b0;
        end
    endtask

    task send_chunk_B;
        input integer tile_idx;
        input integer chunk_idx;
        integer k_idx, j;
        reg [(N*DATA_WIDTH)-1:0] temp_data;
        begin
            for (k_idx = 0; k_idx < N; k_idx = k_idx + 1) begin
                temp_data = 0;
                for (j = 0; j < N; j = j + 1) begin
                    temp_data[j*DATA_WIDTH +: DATA_WIDTH] = B_mem[tile_idx*K_DIM + chunk_idx*N + k_idx][j];
                end
                
                s_axis_b_tdata  <= temp_data;
                s_axis_b_tvalid <= 1'b1;
                s_axis_b_tlast  <= (k_idx == N-1);
                
                @(posedge aclk);
                while (!s_axis_b_tready) @(posedge aclk);
            end
            s_axis_b_tvalid <= 1'b0;
        end
    endtask

    // =========================================================
    // 7. DMA RECEIVE TASK (Simulate AXI S2MM)
    // =========================================================
    initial begin
        m_axis_c_tready = 1'b1; // Always ready to receive
        
        while (1) begin
            @(posedge aclk);
            if (m_axis_c_tvalid && m_axis_c_tready) begin
                // Catch SOF (Start of Frame) flag from tuser
                if (m_axis_c_tuser) $display("[%0t ns] NPU Start Exporting Matrix C...", $time);
                
                // C array outputs N rows sequentially
                // Note: post_accumulator has reversed rows, C[0] outputs first!
                for (c = 0; c < N; c = c + 1) begin
                    // Done inside parallel process
                end
            end
        end
    end

    // Parallel process to receive results
    integer recv_rows = 0;
    initial begin
        recv_rows = 0;
        while (recv_rows < N) begin
            @(posedge aclk);
            if (m_axis_c_tvalid && m_axis_c_tready) begin
                for (c = 0; c < N; c = c + 1) begin
                    C_npu_result[recv_rows][c] = m_axis_c_tdata[c*8 +: 8];
                end
                recv_rows = recv_rows + 1;
            end
        end
    end

    // =========================================================
    // 8. MAIN TEST FLOW
    // =========================================================
    integer match_count;
    integer chunk;

    initial begin
        // Reset 
        aresetn = 0;
        s_axis_a_tvalid = 0; s_axis_b_tvalid = 0;
        k_dim = K_DIM;
        num_k_tiles_r = NUM_K_TILES;
        scale_shift_r = SCALE_SHIFT;
        zero_point_r  = ZERO_POINT;
        
        #100;
        aresetn = 1;
        #50;

        $display("============================================");
        $display("[%0t ns] STARTING NPU STRESS TEST", $time);
        $display("============================================");
        
        // 1. GENERATE FULL RANGE DATA FROM -128 TO 127
        for (r = 0; r < N; r = r + 1)
            for (c = 0; c < N; c = c + 1) begin
                C_int32[r][c] = 0;
            end
            
        for (r = 0; r < N; r = r + 1)
            for (k = 0; k < K_TOTAL; k = k + 1) begin
                A_mem[r][k] = $random % 128; // Full positive/negative values
            end
            
        for (k = 0; k < K_TOTAL; k = k + 1)
            for (c = 0; c < N; c = c + 1) begin
                B_mem[k][c] = $random % 128; // Full positive/negative values
            end

        // 2. CALCULATE EXPECTED RESULTS ON SOFTWARE
        for (r = 0; r < N; r = r + 1) begin
            for (c = 0; c < N; c = c + 1) begin
                for (k = 0; k < K_TOTAL; k = k + 1) begin
                    C_int32[r][c] = C_int32[r][c] + (A_mem[r][k] * B_mem[k][c]);
                end
                // Cast INT32 to INT8 like hardware
                C_expected[r][c] = quantize(C_int32[r][c], SCALE_SHIFT, ZERO_POINT);
            end
        end

        // 3. PUSH DATA TO NPU
        for (t = 0; t < NUM_K_TILES; t = t + 1) begin
            $display("[%0t ns] [TB] Sending Tile %0d / %0d...", $time, t+1, NUM_K_TILES);
            for (chunk = 0; chunk < K_BLOCKS; chunk = chunk + 1) begin
                fork
                    send_chunk_A(t, chunk);
                    send_chunk_B(t, chunk);
                join
            end
        end
        $display("[%0t ns] [TB] Data loaded, waiting for NPU...", $time);

        // 4. WAIT FOR RESULTS AND COMPARE
        wait (recv_rows == N);
        #100;

        $display("============================================");
        match_count = 0;
        for (r = 0; r < N; r = r + 1) begin
            for (c = 0; c < N; c = c + 1) begin
                if (C_npu_result[r][c] === C_expected[r][c]) begin
                    match_count = match_count + 1;
                end else begin
                    $display("[FAIL] Mismatch at C[%0d][%0d] | HW: %0d | SW(Expected): %0d | Raw INT32: %0d", 
                        r, c, C_npu_result[r][c], C_expected[r][c], C_int32[r][c]);
                end
            end
        end

        $display("============================================");
        $display("   TEST SUMMARY");
        $display("============================================");
        $display(" - Num K Tiles: %0d", NUM_K_TILES);
        $display(" - Rescale Shift: %0d", SCALE_SHIFT);
        $display(" - Zero Point: %0d", ZERO_POINT);
        $display("--------------------------------------------");
        if (match_count == N*N) begin
            $display(" [PASS] ALL CORRECT: %0d / %0d pixels!", match_count, N*N);
        end else begin
            $display(" [FAIL] MISMATCH: %0d / %0d pixels!", (N*N - match_count), N*N);
        end
        $finish;
    end

    // Failsafe timeout
    initial begin
        #5000000;
        $display("[TIMEOUT ERROR] System hung or no valid signals received!");
        $finish;
    end
endmodule
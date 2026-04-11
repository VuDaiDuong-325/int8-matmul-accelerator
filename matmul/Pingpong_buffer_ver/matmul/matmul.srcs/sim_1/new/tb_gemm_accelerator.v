`timescale 1ns / 1ps

module tb_gemm_accelerator();

    // =========================================================
    // 1. PARAMETERS
    // =========================================================
    parameter N = 16;
    parameter DATA_WIDTH = 8;
    parameter FIFO_DEPTH = 1024;
    parameter BRAM_DEPTH = 1024;
    
    // Cấu hình K_DIM = 32 để BRAM tích lũy đủ 2 Chunk
    parameter K_DIM = 32; 
    parameter K_BLOCKS = K_DIM / N;

    // =========================================================
    // 2. SIGNALS
    // =========================================================
    reg aclk;
    reg aresetn;
    reg [31:0] k_dim;

    // AXI Stream A
    reg [(N*DATA_WIDTH)-1:0] s_axis_a_tdata;
    reg                      s_axis_a_tvalid;
    wire                     s_axis_a_tready;
    reg                      s_axis_a_tlast;

    // AXI Stream B
    reg [(N*DATA_WIDTH)-1:0] s_axis_b_tdata;
    reg                      s_axis_b_tvalid;
    wire                     s_axis_b_tready;
    reg                      s_axis_b_tlast;

    // AXI Stream C (ĐÃ NÂNG CẤP LÊN 512-BIT)
    wire [(N*32)-1:0] m_axis_c_tdata;
    wire              m_axis_c_tvalid;
    reg               m_axis_c_tready;
    wire              m_axis_c_tlast;

    // =========================================================
    // 3. MATRICES FOR VERIFICATION
    // =========================================================
    reg signed [DATA_WIDTH-1:0] A_mem [0:N-1][0:K_DIM-1];
    reg signed [DATA_WIDTH-1:0] B_mem [0:K_DIM-1][0:N-1];
    reg signed [31:0]           C_expected [0:N-1][0:N-1];
    reg signed [31:0]           C_npu_result [0:N-1][0:N-1]; 

    integer r, c, k;

    // =========================================================
    // 4. DUT INSTANTIATION
    // =========================================================
    gemm_accelerator #(
        .N(N),
        .DATA_WIDTH(DATA_WIDTH),
        .FIFO_DEPTH(FIFO_DEPTH),
        .BRAM_DEPTH(BRAM_DEPTH)
    ) dut (
        .aclk(aclk),
        .aresetn(aresetn),
        .k_dim(k_dim),
        
        .s_axis_a_tdata(s_axis_a_tdata),
        .s_axis_a_tvalid(s_axis_a_tvalid),
        .s_axis_a_tready(s_axis_a_tready),
        .s_axis_a_tlast(s_axis_a_tlast),
        
        .s_axis_b_tdata(s_axis_b_tdata),
        .s_axis_b_tvalid(s_axis_b_tvalid),
        .s_axis_b_tready(s_axis_b_tready),
        .s_axis_b_tlast(s_axis_b_tlast),
        
        .m_axis_c_tdata(m_axis_c_tdata),
        .m_axis_c_tvalid(m_axis_c_tvalid),
        .m_axis_c_tready(m_axis_c_tready),
        .m_axis_c_tlast(m_axis_c_tlast)
    );

    // =========================================================
    // 5. CLOCK GENERATION (200MHz)
    // =========================================================
    initial begin
        aclk = 0;
        forever #2.5 aclk = ~aclk; 
    end

    // =========================================================
    // 6. CPU: GENERATE DATA & COMPUTE EXPECTED C
    // =========================================================
    initial begin
        for (r = 0; r < N; r = r + 1) begin
            for (c = 0; c < N; c = c + 1) begin
                C_expected[r][c] = 0;
                C_npu_result[r][c] = 0;
            end
        end

        for (r = 0; r < N; r = r + 1) begin
            for (k = 0; k < K_DIM; k = k + 1) begin
                A_mem[r][k] = $random % 10; 
            end
        end

        for (k = 0; k < K_DIM; k = k + 1) begin
            for (c = 0; c < N; c = c + 1) begin
                B_mem[k][c] = $random % 10; 
            end
        end

        // CPU tính toán ma trận C (Golden Model)
        for (r = 0; r < N; r = r + 1) begin
            for (c = 0; c < N; c = c + 1) begin
                for (k = 0; k < K_DIM; k = k + 1) begin
                    C_expected[r][c] = C_expected[r][c] + (A_mem[r][k] * B_mem[k][c]);
                end
            end
        end
    end

    // =========================================================
    // 7. AXI STREAM DRIVERS (ĐÃ FIX SẠCH RACE CONDITION)
    // =========================================================
    task send_chunk_A(input integer chunk_idx);
        integer k_idx, i;
        reg [(N*DATA_WIDTH)-1:0] temp_data;
        begin
            for (k_idx = 0; k_idx < N; k_idx = k_idx + 1) begin
                temp_data = 0;
                for (i = 0; i < N; i = i + 1) begin
                    temp_data[i*DATA_WIDTH +: DATA_WIDTH] = A_mem[i][chunk_idx*N + k_idx];
                end
                
                // Đồng bộ sườn clock TRƯỚC KHI gán dữ liệu
                s_axis_a_tdata  <= temp_data;
                s_axis_a_tvalid <= 1'b1;
                
                if ((chunk_idx == K_BLOCKS - 1) && (k_idx == N - 1))
                    s_axis_a_tlast <= 1'b1;
                else
                    s_axis_a_tlast <= 1'b0;
                
                @(posedge aclk);
                while (!s_axis_a_tready) @(posedge aclk); // Vòng lặp chờ an toàn
            end
            
            // Hạ cờ an toàn vào chu kỳ tiếp theo (Dùng <=)
            s_axis_a_tvalid <= 1'b0;
            s_axis_a_tlast  <= 1'b0;
        end
    endtask

    task send_chunk_B(input integer chunk_idx);
        integer k_idx, j;
        reg [(N*DATA_WIDTH)-1:0] temp_data;
        begin
            for (k_idx = 0; k_idx < N; k_idx = k_idx + 1) begin
                temp_data = 0;
                for (j = 0; j < N; j = j + 1) begin
                    temp_data[j*DATA_WIDTH +: DATA_WIDTH] = B_mem[chunk_idx*N + k_idx][j];
                end
                
                s_axis_b_tdata  <= temp_data;
                s_axis_b_tvalid <= 1'b1;
                
                if ((chunk_idx == K_BLOCKS - 1) && (k_idx == N - 1))
                    s_axis_b_tlast <= 1'b1;
                else
                    s_axis_b_tlast <= 1'b0;
                
                @(posedge aclk);
                while (!s_axis_b_tready) @(posedge aclk);
            end
            
            s_axis_b_tvalid <= 1'b0;
            s_axis_b_tlast  <= 1'b0;
        end
    endtask

    // Main Stimulus Thread
    initial begin
        aresetn = 0;
        s_axis_a_tvalid = 0; s_axis_a_tlast = 0;
        s_axis_b_tvalid = 0; s_axis_b_tlast = 0;
        m_axis_c_tready = 1; 
        
        k_dim = K_DIM; // Đếm đủ 32 phần tử
        
        #100;
        aresetn = 1;
        #20;
        
        $display("[%0t ns] [TB] Bat dau nap du lieu vao NPU...", $time);
        
        for (k = 0; k < K_BLOCKS; k = k + 1) begin
            fork
                send_chunk_A(k);
                send_chunk_B(k);
            join
            $display("[%0t ns] [TB] Da nap xong Chunk %0d/%0d", $time, k+1, K_BLOCKS);
        end
    end

    // =========================================================
    // 8. SMART MONITOR & CHECKER 
    // =========================================================
    integer match_count = 0;
    integer recv_row  = 0;
    integer out_row;

    always @(posedge aclk) begin
        if (aresetn && m_axis_c_tvalid && m_axis_c_tready) begin
            
            out_row = (N - 1) - recv_row; 
            
            for (c = 0; c < N; c = c + 1) begin
                C_npu_result[out_row][c] = $signed(m_axis_c_tdata[c*32 +: 32]);
            end

            recv_row = recv_row + 1;

            if (recv_row == N) begin 
                $display("[%0t ns] [NPU] Da xu ly va xa hoan tat ma tran C", $time);

                match_count = 0;
                for (r = 0; r < N; r = r + 1) begin
                    for (c = 0; c < N; c = c + 1) begin
                        if (C_npu_result[r][c] === C_expected[r][c]) begin
                            match_count = match_count + 1;
                        end else begin
                            $display("[%0t] [ERROR] Sai lech tai C[%0d][%0d]: Ky vong = %0d, NPU = %0d", 
                                     $time, r, c, C_expected[r][c], C_npu_result[r][c]);
                        end
                    end
                end

                $display("============================================");
                $display("[%0t ns] [TB] HOAN THANH NHAN MA TRAN PING-PONG (512-BIT)!", $time);
                $display("[%0t ns] [TB] So ket qua DUNG: %0d / %0d", $time, match_count, N*N);
                
                if (match_count == N*N) $display("=> [RESULT]: PASSED - CHUAN XAC 100%%");
                else $display("=> [RESULT]: FAILED!");
                
                $display("============================================");
                $finish;
            end
        end
    end

endmodule
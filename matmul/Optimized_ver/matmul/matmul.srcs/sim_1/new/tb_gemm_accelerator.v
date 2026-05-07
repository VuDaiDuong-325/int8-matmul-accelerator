`timescale 1ns / 1ps

module tb_gemm_accelerator;

    // =========================================================
    // 1. PARAMETERS
    // =========================================================
    parameter N = 16;
    parameter FIFO_DEPTH = 1024;
    parameter BRAM_DEPTH = 1024;
    
    // Testbench cấu hình số block (K)
    parameter K_BLOCKS = 4; 
    parameter K_TOTAL = K_BLOCKS * 16; // 64

    // =========================================================
    // 2. SIGNALS DECLARATION
    // =========================================================
    reg aclk;
    reg aresetn;
    reg [31:0] k_dim;

    reg [(N*8)-1:0] s_axis_a_tdata;
    reg             s_axis_a_tvalid;
    wire            s_axis_a_tready;
    reg             s_axis_a_tlast;

    reg [(N*8)-1:0] s_axis_b_tdata;
    reg             s_axis_b_tvalid;
    wire            s_axis_b_tready;
    reg             s_axis_b_tlast;

    wire [31:0]     m_axis_c_tdata;
    wire            m_axis_c_tvalid;
    reg             m_axis_c_tready;
    wire            m_axis_c_tlast;

    // =========================================================
    // 3. GOLDEN MODEL (MÔ HÌNH PHẦN MỀM BÊN TRONG VERILOG)
    // =========================================================
    reg signed [7:0]  A_mem [0:15][0:255]; // Ma trận A
    reg signed [7:0]  B_mem [0:255][0:15]; // Ma trận B
    reg signed [31:0] C_expected [0:15][0:15]; // Ma trận C kỳ vọng

    integer i, j, k;

    initial begin
        // a. Sinh dữ liệu CÓ DẤU (INT8 từ -128 đến 127)
        for (k = 0; k < K_TOTAL; k = k + 1) begin
            for (i = 0; i < 16; i = i + 1) A_mem[i][k] = $random % 128;
            for (j = 0; j < 16; j = j + 1) B_mem[k][j] = $random % 128;
        end

        // b. Tính toán kết quả ma trận C chuẩn
        for (i = 0; i < 16; i = i + 1) begin
            for (j = 0; j < 16; j = j + 1) begin
                C_expected[i][j] = 0;
                for (k = 0; k < K_TOTAL; k = k + 1) begin
                    C_expected[i][j] = C_expected[i][j] + A_mem[i][k] * B_mem[k][j];
                end
            end
        end
    end

    // =========================================================
    // 4. DUT INSTANTIATION
    // =========================================================
    gemm_accelerator #(
        .N(N), 
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
    // 5. CLOCK GENERATION
    // =========================================================
    initial begin
        aclk = 0;
        forever #5 aclk = ~aclk; 
    end

    // =========================================================
    // 6. MAIN STIMULUS PROCESS
    // =========================================================
    initial begin
        aresetn = 0;
        k_dim   = 0;

        s_axis_a_tdata  = 0; s_axis_a_tvalid = 0; s_axis_a_tlast  = 0;
        s_axis_b_tdata  = 0; s_axis_b_tvalid = 0; s_axis_b_tlast  = 0;
        m_axis_c_tready = 1;

        #100;
        @(posedge aclk);
        aresetn <= 1;

        #50;
        @(posedge aclk);
        
        k_dim <= K_TOTAL; 
        
        $display("[%0t] [TB] BAT DAU BOM DU LIEU RANDOM CO DAU (K-dim chunks = %0d)...", $time, K_BLOCKS);

        fork
            drive_matrix_A(K_BLOCKS);
            drive_matrix_B(K_BLOCKS);
        join

        $display("[%0t] [TB] DA BOM XONG! DANG CHO NPU TINH TOAN...", $time);
    end

    // Khối TIMEOUT an toàn
    initial begin
        #500000; 
        $display("============================================");
        $display("[%0t] [TB] TIMEOUT! Phat hien he thong bi treo.", $time);
        $display("============================================");
        $finish;
    end

    // =========================================================
    // 7. AXI-STREAM DRIVER TASKS
    // =========================================================
    task drive_matrix_A(input integer blocks);
        integer beat, row;
        reg [127:0] temp_data;
        begin
            for (beat = 0; beat < blocks * 16; beat = beat + 1) begin
                s_axis_a_tvalid = 1;
                temp_data = 0;
                for (row = 0; row < 16; row = row + 1) begin
                    temp_data[(row*8) +: 8] = A_mem[row][beat];
                end
                s_axis_a_tdata = temp_data;
                s_axis_a_tlast = ((beat % 16) == 15) ? 1 : 0; 
                
                @(posedge aclk);
                while (!s_axis_a_tready) @(posedge aclk);
            end
            s_axis_a_tvalid = 0;
            s_axis_a_tlast  = 0;
        end
    endtask

    task drive_matrix_B(input integer blocks);
        integer beat, col;
        reg [127:0] temp_data;
        begin
            for (beat = 0; beat < blocks * 16; beat = beat + 1) begin
                s_axis_b_tvalid = 1;
                temp_data = 0;
                for (col = 0; col < 16; col = col + 1) begin
                    temp_data[(col*8) +: 8] = B_mem[beat][col];
                end
                s_axis_b_tdata = temp_data;
                s_axis_b_tlast = ((beat % 16) == 15) ? 1 : 0;
                
                @(posedge aclk);
                while (!s_axis_b_tready) @(posedge aclk);
            end
            s_axis_b_tvalid = 0;
            s_axis_b_tlast  = 0;
        end
    endtask

    // =========================================================
    // 8. AUTO CHECKER / SMART MONITOR
    // =========================================================
    integer match_count = 0;
    integer recv_count  = 0;
    integer out_row, out_col;

    always @(posedge aclk) begin
        if (aresetn && m_axis_c_tvalid && m_axis_c_tready) begin
            
            out_row = 15 - (recv_count / 16); 
            out_col = recv_count % 16;
            
            if ($signed(m_axis_c_tdata) === C_expected[out_row][out_col]) begin
                match_count = match_count + 1;
            end else begin
                $display("[%0t] [ERROR] Sai lech tai C[%0d][%0d]: Ky vong = %0d, NPU ra = %0d", 
                         $time, out_row, out_col, C_expected[out_row][out_col], $signed(m_axis_c_tdata));
            end

            recv_count = recv_count + 1;

            if (m_axis_c_tlast) begin
                $display("============================================");
                $display("[%0t] [TB] HOAN THANH NHAN MA TRAN!", $time);
                $display("[%0t] [TB] So ket qua DUNG: %0d / %0d", $time, match_count, recv_count);
                
                if (match_count == 256) begin
                    $display("       >>>>> PASSED 100%% <<<<<");
                end else begin
                    $display("       >>>>> FAILED <<<<<");
                end
                $display("============================================");
                $finish;
            end
        end
    end

endmodule
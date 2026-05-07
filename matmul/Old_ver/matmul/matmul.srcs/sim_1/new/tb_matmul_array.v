`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/28/2026 09:32:42 PM
// Design Name: 
// Module Name: tb_matmul_array
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module tb_matmul_array();

    // Khai báo tín hiệu
    reg clk;
    reg rst_n;
    reg [3:0] valid_in_left;
    reg [3:0] clear_acc_left;
    reg [3:0] last_mac_in_left;
    reg [31:0] act_in_left;
    reg [31:0] weight_in_top;
    
    wire [511:0] psum_out_matrix;
    wire [15:0]  mac_valid_matrix;

    // DUT (Device Under Test)
    matmul_array #(.ARRAY_SIZE(4)) uut (
        .clk(clk),
        .rst_n(rst_n),
        .valid_in_left(valid_in_left),
        .clear_acc_left(clear_acc_left),
        .last_mac_in_left(last_mac_in_left),
        .act_in_left(act_in_left),
        .weight_in_top(weight_in_top),
        .psum_out_matrix(psum_out_matrix),
        .mac_valid_matrix(mac_valid_matrix)
    );

    // Tạo Clock 100MHz
    initial begin
        clk = 0;
        forever #5 clk = ~clk; 
    end

    // Biến lưu trữ Ma trận để bơm vào Testbench
    reg signed [7:0] A_mat [0:3][0:3];
    reg signed [7:0] B_mat [0:3][0:3];

    // =========================================================================
    // TASK: Bơm dữ liệu ma trận A và B vào mảng Systolic với độ trễ chéo (Skew)
    // =========================================================================
    task run_matmul_test(input [8*16*8-1:0] test_name);
        integer t, i, j;
        integer k_idx_a, k_idx_b;
        begin
            $display("===========================================");
            $display(" BAT DAU TEST CASE: %s", test_name);
            $display("===========================================");
            
            // Chạy 15 chu kỳ để nạp hết luồng chéo (wavefront) 4x4
            for (t = 0; t < 15; t = t + 1) begin
                @(negedge clk);
                
                // Bơm Ma trận A (Activation) từ bên trái
                for (i = 0; i < 4; i = i + 1) begin
                    k_idx_a = t - i; // Độ trễ của hàng i
                    if (k_idx_a >= 0 && k_idx_a < 4) begin
                        act_in_left[i*8 +: 8] = A_mat[i][k_idx_a];
                        valid_in_left[i]      = 1'b1;
                        clear_acc_left[i]     = (k_idx_a == 0) ? 1'b1 : 1'b0;
                        last_mac_in_left[i]   = (k_idx_a == 3) ? 1'b1 : 1'b0;
                    end else begin
                        act_in_left[i*8 +: 8] = 8'd0;
                        valid_in_left[i]      = 1'b0;
                        clear_acc_left[i]     = 1'b0;
                        last_mac_in_left[i]   = 1'b0;
                    end
                end

                // Bơm Ma trận B (Weight) từ bên trên
                for (j = 0; j < 4; j = j + 1) begin
                    k_idx_b = t - j; // Độ trễ của cột j
                    if (k_idx_b >= 0 && k_idx_b < 4) begin
                        weight_in_top[j*8 +: 8] = B_mat[k_idx_b][j];
                    end else begin
                        weight_in_top[j*8 +: 8] = 8'd0;
                    end
                end
            end
            
            // Đợi thêm vài chu kỳ để các PE tính toán xong và xả kết quả
            repeat(10) @(posedge clk);
        end
    endtask

    // =========================================================================
    // KỊCH BẢN TEST (Test Scenarios)
    // =========================================================================
    initial begin
        // 1. Reset hệ thống
        rst_n = 0;
        valid_in_left = 0; clear_acc_left = 0; last_mac_in_left = 0;
        act_in_left = 0; weight_in_top = 0;
        #20 rst_n = 1;

        // ---------------------------------------------------------
        // TRƯỜNG HỢP BÌNH THƯỜNG 1: Phép nhân Identity (Ma trận đơn vị)
        // A = [[1,2,3,4], [5,6,7,8], ...], B = Identity. Result phải bằng A.
        // ---------------------------------------------------------
        A_mat[0][0]=1; A_mat[0][1]=2; A_mat[0][2]=3; A_mat[0][3]=4;
        A_mat[1][0]=5; A_mat[1][1]=6; A_mat[1][2]=7; A_mat[1][3]=8;
        A_mat[2][0]=9; A_mat[2][1]=1; A_mat[2][2]=2; A_mat[2][3]=3;
        A_mat[3][0]=4; A_mat[3][1]=5; A_mat[3][2]=6; A_mat[3][3]=7;

        B_mat[0][0]=1; B_mat[0][1]=0; B_mat[0][2]=0; B_mat[0][3]=0;
        B_mat[1][0]=0; B_mat[1][1]=1; B_mat[1][2]=0; B_mat[1][3]=0;
        B_mat[2][0]=0; B_mat[2][1]=0; B_mat[2][2]=1; B_mat[2][3]=0;
        B_mat[3][0]=0; B_mat[3][1]=0; B_mat[3][2]=0; B_mat[3][3]=1;
        run_matmul_test("NORMAL 1: A x Identity Matrix");

        // ---------------------------------------------------------
        // TRƯỜNG HỢP BÌNH THƯỜNG 2: Các số nhỏ ngẫu nhiên
        // A toàn 2, B toàn 3. Result mỗi PE = 2*3 + 2*3 + 2*3 + 2*3 = 24
        // ---------------------------------------------------------
        begin : TEST_RANDOM
            integer r, c;
            for (r=0; r<4; r=r+1)
                for (c=0; c<4; c=c+1) begin
                    A_mat[r][c] = 2; 
                    B_mat[r][c] = 3;
                end
        end
        run_matmul_test("NORMAL 2: All 2s x All 3s (Expected 24)");

        // ---------------------------------------------------------
        // TRƯỜNG HỢP ĐẶC BIỆT 1: Ma trận Zeros
        // Đảm bảo không có rác (garbage data) tồn đọng. Result phải bằng 0.
        // ---------------------------------------------------------
        begin : TEST_ZEROS
            integer r, c;
            for (r=0; r<4; r=r+1)
                for (c=0; c<4; c=c+1) begin
                    A_mat[r][c] = 0; 
                    B_mat[r][c] = 0;
                end
        end
        run_matmul_test("SPECIAL 1: Zero Matrix (Expected 0)");

        // ---------------------------------------------------------
        // TRƯỜNG HỢP ĐẶC BIỆT 2: Số Âm (Xác minh Data Type INT8)
        // A toàn -1, B toàn 2. Result = (-1)*2 * 4 = -8.
        // ---------------------------------------------------------
        begin : TEST_NEGATIVES
            integer r, c;
            for (r=0; r<4; r=r+1)
                for (c=0; c<4; c=c+1) begin
                    A_mat[r][c] = -1; // Mã bù 2 của -1
                    B_mat[r][c] = 2;
                end
        end
        run_matmul_test("SPECIAL 2: Negative Numbers (Expected -8)");

        $display("===========================================");
        $display(" TAT CA TEST CASE HOAN THANH!");
        $display("===========================================");
        $finish;
    end

    // =========================================================================
    // THEO DÕI KẾT QUẢ (In ra TCL Console)
    // Khi cờ valid của một PE nháy lên, lập tức in giá trị của PE đó ra.
    // =========================================================================
    integer pe_i, pe_j;
    always @(posedge clk) begin
        for (pe_i = 0; pe_i < 4; pe_i = pe_i + 1) begin
            for (pe_j = 0; pe_j < 4; pe_j = pe_j + 1) begin
                if (mac_valid_matrix[pe_i*4 + pe_j]) begin
                    $display("Time = %0t | PE[%0d][%0d] Validated! | Result = %0d", 
                        $time, pe_i, pe_j, $signed(psum_out_matrix[(pe_i*4+pe_j)*32 +: 32]));
                end
            end
        end
    end

endmodule

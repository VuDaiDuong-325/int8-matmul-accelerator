`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/21/2026 08:21:35 PM
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

    // Tùy chỉnh kích thước ma trận để test (Khuyên dùng 4x4 để dễ nhìn Log)
    parameter ARRAY_SIZE = 4;

    reg clk;
    reg rst_n;

    // Các vector ngõ vào dạng Bus
    reg [ARRAY_SIZE-1:0]               valid_in_left;
    reg [ARRAY_SIZE-1:0]               clear_acc_left;
    reg [(ARRAY_SIZE*8)-1:0]           act_in_left;
    reg [(ARRAY_SIZE*8)-1:0]           weight_in_top;

    // Các vector ngõ ra
    wire [(ARRAY_SIZE*ARRAY_SIZE*32)-1:0] psum_out_matrix;
    wire [(ARRAY_SIZE*ARRAY_SIZE)-1:0]    mac_valid_matrix;

    // Khởi tạo Ma trận
    matmul_array #(
        .ARRAY_SIZE(ARRAY_SIZE)
    ) u_array (
        .clk(clk),
        .rst_n(rst_n),
        .valid_in_left(valid_in_left),
        .clear_acc_left(clear_acc_left),
        .act_in_left(act_in_left),
        .weight_in_top(weight_in_top),
        .psum_out_matrix(psum_out_matrix),
        .mac_valid_matrix(mac_valid_matrix)
    );

    // Tạo Clock 10ns
    always #5 clk = ~clk;

    // Bộ đếm thời gian (Global Tick)
    integer tick;
    integer i;

    initial begin
        // Reset hệ thống
        clk = 0; rst_n = 0; tick = 0;
        valid_in_left = 0; clear_acc_left = 0;
        act_in_left = 0; weight_in_top = 0;
        
        #25 rst_n = 1;
        $display("=== BAT DAU BOM DU LIEU MA TRAN %0dx%0d ===", ARRAY_SIZE, ARRAY_SIZE);
        
        // Chờ 50 nhịp Clock để toàn bộ dữ liệu chảy qua hết ma trận
        wait (tick == 50);
        $display("=== KET THUC TEST ===");
        $finish;
    end

    // Khối hành vi Thuần Verilog để bơm dữ liệu LỆCH PHA (Skewing)
    always @(posedge clk) begin
        if (rst_n) begin
            for (i = 0; i < ARRAY_SIZE; i = i + 1) begin
                
                // 1. BƠM ACTIVATION (Lệch theo Hàng i)
                // Hàng i sẽ bắt đầu nhận data từ nhịp tick thứ i. Ta bơm 4 giá trị liên tiếp.
                if (tick >= i && tick < i + 4) begin 
                    valid_in_left[i] <= 1'b1;
                    clear_acc_left[i] <= (tick == i) ? 1'b1 : 1'b0; // Clear ở nhịp đầu tiên
                    
                    // Để dễ theo dõi: Data của hàng i sẽ là 1, 2, 3, 4
                    // [i*8 +: 8] là cú pháp thuần Verilog 2001 để trích xuất 8-bit từ một Bus lớn
                    act_in_left[i*8 +: 8] <= (tick - i) + 1; 
                end else begin
                    valid_in_left[i] <= 1'b0;
                    clear_acc_left[i] <= 1'b0;
                    act_in_left[i*8 +: 8] <= 8'd0;
                end

                // 2. BƠM WEIGHT (Lệch theo Cột i)
                // Cột i sẽ bắt đầu nhận Weight từ nhịp tick thứ i.
                if (tick >= i && tick < i + 4) begin
                    // Để dễ theo dõi: Cột 0 nhận W=10, Cột 1 nhận W=20...
                    weight_in_top[i*8 +: 8] <= (i + 1) * 10; 
                end else begin
                    weight_in_top[i*8 +: 8] <= 8'd0;
                end
                
            end
            
            // Tăng bộ đếm thời gian sau mỗi nhịp Clock
            tick <= tick + 1;
        end
    end

    // Khối giám sát kết quả rớt ra (Monitor)
    // Giám sát riêng PE(0,0) và PE(3,3) để thấy độ trễ truyền tải
    always @(posedge clk) begin
        // PE (0,0) - Nằm ở góc trên cùng bên trái (Flat Index = 0)
        if (mac_valid_matrix[0]) begin
            $display("[Time: %0t ns] [PE 0,0] Xong! psum = %d", $time, $signed(psum_out_matrix[31:0]));
        end
        
        // PE (ARRAY_SIZE-1, ARRAY_SIZE-1) - Nằm ở góc dưới cùng bên phải
        if (mac_valid_matrix[(ARRAY_SIZE*ARRAY_SIZE)-1]) begin
            $display("[Time: %0t ns] [PE %0d,%0d] Xong! psum = %d", 
                     $time, ARRAY_SIZE-1, ARRAY_SIZE-1, 
                     $signed(psum_out_matrix[ (ARRAY_SIZE*ARRAY_SIZE*32)-1 -: 32 ]));
        end
        // PE (0,1) - Index = (0*4) + 1 = 1
        if (mac_valid_matrix[1]) begin
            $display("[Time: %0t ns] [PE 0,1] Xong! psum = %d", $time, $signed(psum_out_matrix[63:32]));
        end
        
        // PE (1,0) - Index = (1*4) + 0 = 4
        if (mac_valid_matrix[4]) begin
            $display("[Time: %0t ns] [PE 1,0] Xong! psum = %d", $time, $signed(psum_out_matrix[159:128]));
        end

        // PE (2,3) - Index = (2*4) + 3 = 11
        if (mac_valid_matrix[11]) begin
            $display("[Time: %0t ns] [PE 2,3] Xong! psum = %d", $time, $signed(psum_out_matrix[383:352]));
        end

        // PE (3,2) - Index = (3*4) + 2 = 14
        if (mac_valid_matrix[14]) begin
            $display("[Time: %0t ns] [PE 3,2] Xong! psum = %d", $time, $signed(psum_out_matrix[479:448]));
        end
        
        // PE (1,1) - Index = (1*4) + 1 = 5
        // Dải bit: Từ 5*32 = 160 đến 160+31 = 191
        if (mac_valid_matrix[5]) begin
            $display("[Time: %0t ns] [PE 1,1] Xong! psum = %d", $time, $signed(psum_out_matrix[191:160]));
        end

        // PE (2,2) - Index = (2*4) + 2 = 10
        // Dải bit: Từ 10*32 = 320 đến 320+31 = 351
        if (mac_valid_matrix[10]) begin
            $display("[Time: %0t ns] [PE 2,2] Xong! psum = %d", $time, $signed(psum_out_matrix[351:320]));
        end
    end

endmodule

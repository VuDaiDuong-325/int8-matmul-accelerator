`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/21/2026 07:58:29 PM
// Design Name: 
// Module Name: matmul_array
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


module matmul_array #(
    parameter ARRAY_SIZE = 16  //pe 16x16
)(
    input  wire clk,
    input  wire rst_n,

    input  wire [ARRAY_SIZE-1:0]               valid_in_left,
    input  wire [ARRAY_SIZE-1:0]               clear_acc_left,
    input  wire [(ARRAY_SIZE*8)-1:0]           act_in_left,    
    input  wire [(ARRAY_SIZE*8)-1:0]           weight_in_top,  

    output wire [(ARRAY_SIZE*ARRAY_SIZE*32)-1:0] psum_out_matrix,
    output wire [(ARRAY_SIZE*ARRAY_SIZE)-1:0]    mac_valid_matrix
);

    // =========================================================================
    // 1. KHAI BÁO LƯỚI DÂY ĐIỆN BÊN TRONG (Internal Routing Wires)
    // =========================================================================
    // Cần lưới dây 2 chiều [Hàng][Cột] để nối ngõ ra của PE này vào ngõ vào của PE kia
    wire [7:0] w_wire   [0:ARRAY_SIZE][0:ARRAY_SIZE]; // Dây truyền Trọng số (Trục Dọc)
    wire [7:0] a_wire   [0:ARRAY_SIZE][0:ARRAY_SIZE]; // Dây truyền Activation (Trục Ngang)
    wire       vld_wire [0:ARRAY_SIZE][0:ARRAY_SIZE]; // Dây truyền Valid (Trục Ngang)
    wire       clr_wire [0:ARRAY_SIZE][0:ARRAY_SIZE]; // Dây truyền Clear (Trục Ngang)

    // =========================================================================
    // 2. NỐI DÂY TỪ CỔNG VÀO CHÍNH VÀO RÌA CỦA MA TRẬN
    // =========================================================================
    genvar i, j;
    generate
        for (i = 0; i < ARRAY_SIZE; i = i + 1) begin : BIND_INPUTS
            // Bơm Act, Valid, Clear vào CỘT 0 (Bên trái cùng)
            assign a_wire[i][0]   = act_in_left[(i*8)+7 : i*8];
            assign vld_wire[i][0] = valid_in_left[i];
            assign clr_wire[i][0] = clear_acc_left[i];
            
            // Bơm Weight vào HÀNG 0 (Trên cùng)
            assign w_wire[0][i]   = weight_in_top[(i*8)+7 : i*8];
        end
    endgenerate

    // =========================================================================
    // 3. ĐÚC 256 KHỐI PE VÀ ĐAN LƯỚI THEO TỌA ĐỘ (Row, Col)
    // =========================================================================
    generate
        for (i = 0; i < ARRAY_SIZE; i = i + 1) begin : ROW // Trục Y (Hàng)
            for (j = 0; j < ARRAY_SIZE; j = j + 1) begin : COL // Trục X (Cột)
                
                // Tính index phẳng cho mảng ngõ ra 1 chiều
                localparam FLAT_IDX = (i * ARRAY_SIZE) + j;

                pe_wrapper u_pe (
                    .clk            (clk),
                    .rst_n          (rst_n),
                    
                    // --- NGÕ VÀO ---
                    // Act đi từ Trái sang Phải (Cột j nhận từ Cột j)
                    .act_in         (a_wire[i][j]),
                    .valid_in       (vld_wire[i][j]),
                    .clear_acc      (clr_wire[i][j]),
                    
                    // Weight đi từ Trên xuống Dưới (Hàng i nhận từ Hàng i)
                    .weight_in      (w_wire[i][j]),
                    
                    // --- NGÕ RA CHUYỂN TIẾP (ROUTING) ---
                    // Đẩy Act sang cột tiếp theo (j+1)
                    .act_out        (a_wire[i][j+1]),
                    .valid_out_fwd  (vld_wire[i][j+1]),
                    .clear_acc_fwd  (clr_wire[i][j+1]),
                    
                    // Đẩy Weight xuống hàng tiếp theo (i+1)
                    .weight_out     (w_wire[i+1][j]),
                    
                    // --- KẾT QUẢ TÍNH TOÁN CỦA RIÊNG PE NÀY ---
                    // Cắm thẳng vào đường bus tổng 8192-bit
                    .psum_out       (psum_out_matrix[(FLAT_IDX*32)+31 : FLAT_IDX*32]),
                    .mac_valid_out  (mac_valid_matrix[FLAT_IDX])
                );
            end
        end
    endgenerate

endmodule

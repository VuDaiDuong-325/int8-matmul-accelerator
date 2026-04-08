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
    parameter ARRAY_SIZE = 16
)(
    input  wire clk,
    input  wire rst_n,

    input  wire [ARRAY_SIZE-1:0]               valid_in_left,
    input  wire [ARRAY_SIZE-1:0]               clear_acc_left,
    input  wire [ARRAY_SIZE-1:0]               last_mac_in_left,
    input  wire [(ARRAY_SIZE*8)-1:0]           act_in_left,    
    input  wire [(ARRAY_SIZE*8)-1:0]           weight_in_top,  

    // ----------------------------------------------------
    // [NEW] CHỈ CẦN XUẤT ĐÚNG 1 HÀNG DƯỚI CÙNG (512 bit)
    // ----------------------------------------------------
    input  wire                                drain_en_array,   
    output wire [(ARRAY_SIZE*32)-1:0]          bottom_row_out,   
    output wire                                mac_done_trigger  
);

    wire [7:0]  w_wire   [0:ARRAY_SIZE][0:ARRAY_SIZE-1]; 
    wire [7:0]  a_wire   [0:ARRAY_SIZE-1][0:ARRAY_SIZE]; 
    wire        vld_wire [0:ARRAY_SIZE-1][0:ARRAY_SIZE];
    wire        clr_wire [0:ARRAY_SIZE-1][0:ARRAY_SIZE];
    wire        lst_wire [0:ARRAY_SIZE-1][0:ARRAY_SIZE];
    
    wire [31:0] psum_wire [0:ARRAY_SIZE][0:ARRAY_SIZE-1]; // Dây nối thẳng hàng dọc
    wire        mac_vld_wire [0:ARRAY_SIZE-1][0:ARRAY_SIZE-1];

    genvar i, j;
    generate
        for (i = 0; i < ARRAY_SIZE; i = i + 1) begin : INIT_LEFT
            assign a_wire[i][0]   = act_in_left[i*8 +: 8];
            assign vld_wire[i][0] = valid_in_left[i];
            assign clr_wire[i][0] = clear_acc_left[i];
            assign lst_wire[i][0] = last_mac_in_left[i];
        end
        for (j = 0; j < ARRAY_SIZE; j = j + 1) begin : INIT_TOP
            assign w_wire[0][j]   = weight_in_top[j*8 +: 8];
            assign psum_wire[0][j] = 32'd0; // Hàng trên cùng không có ai đổ xuống, cấp số 0
        end
    endgenerate
    
    generate
        for (i = 0; i < ARRAY_SIZE; i = i + 1) begin : ROW 
            for (j = 0; j < ARRAY_SIZE; j = j + 1) begin : COL 
                pe_wrapper u_pe (
                    .clk                (clk),
                    .rst_n              (rst_n),
                    
                    .act_in             (a_wire[i][j]),
                    .valid_in           (vld_wire[i][j]),
                    .clear_acc          (clr_wire[i][j]),
                    .last_mac_in        (lst_wire[i][j]),
                    .weight_in          (w_wire[i][j]),
                    
                    .act_out            (a_wire[i][j+1]),
                    .valid_out_fwd      (vld_wire[i][j+1]),
                    .clear_acc_fwd      (clr_wire[i][j+1]),
                    .last_mac_out_fwd   (lst_wire[i][j+1]),
                    .weight_out         (w_wire[i+1][j]),
                    
                    // Nối dây băng chuyền dọc
                    .drain_en           (drain_en_array),
                    .psum_in_top        (psum_wire[i][j]),      // Lấy từ PE trên
                    .psum_out_down      (psum_wire[i+1][j]),    // Thả xuống PE dưới
                    .mac_valid_out      (mac_vld_wire[i][j])
                );
            end
        end
    endgenerate

    // Lấy tín hiệu 512-bit của 16 PE ở đáy mảng
    generate
        for (j = 0; j < ARRAY_SIZE; j = j + 1) begin : BOTTOM_ROW
            assign bottom_row_out[j*32 +: 32] = psum_wire[ARRAY_SIZE][j];
        end
    endgenerate
    
    // Tín hiệu "Trigger": Khi PE cuối cùng (Góc phải dưới) báo valid nghĩa là TOÀN BỘ mảng đã tính xong!
    assign mac_done_trigger = mac_vld_wire[ARRAY_SIZE-1][ARRAY_SIZE-1];

endmodule

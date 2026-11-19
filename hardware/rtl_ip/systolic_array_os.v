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

module systolic_array_os #(
    parameter ARRAY_SIZE = 16
)(
    input  wire CLK_i,
    input  wire RST_i,

    input  wire [ARRAY_SIZE-1:0]               valid_left_i,
    input  wire [ARRAY_SIZE-1:0]               clear_acc_left_i,
    input  wire [ARRAY_SIZE-1:0]               last_mac_left_i,
    input  wire [(ARRAY_SIZE*8)-1:0]           act_left_i,    
    input  wire [(ARRAY_SIZE*8)-1:0]           weight_top_i,  

    // ----------------------------------------------------
    // [NEW] CHỈ CẦN XUẤT ĐÚNG 1 HÀNG DƯỚI CÙNG (512 bit)
    // ----------------------------------------------------
    input  wire                                drain_en_array_i,   
    output wire [(ARRAY_SIZE*32)-1:0]          bottom_row_o,   
    output wire                                mac_done_trigger_o  
);

    wire [7:0]  w_w     [0:ARRAY_SIZE][0:ARRAY_SIZE-1]; 
    wire [7:0]  a_w     [0:ARRAY_SIZE-1][0:ARRAY_SIZE]; 
    wire        vld_w   [0:ARRAY_SIZE-1][0:ARRAY_SIZE];
    wire        clr_w   [0:ARRAY_SIZE-1][0:ARRAY_SIZE];
    wire        lst_w   [0:ARRAY_SIZE-1][0:ARRAY_SIZE];
    
    wire [31:0] psum_w  [0:ARRAY_SIZE][0:ARRAY_SIZE-1]; // Dây nối thẳng hàng dọc
    wire        mac_vld_w [0:ARRAY_SIZE-1][0:ARRAY_SIZE-1];

    genvar i, j;
    generate
        for (i = 0; i < ARRAY_SIZE; i = i + 1) begin : INIT_LEFT
            assign a_w[i][0]   = act_left_i[i*8 +: 8];
            assign vld_w[i][0] = valid_left_i[i];
            assign clr_w[i][0] = clear_acc_left_i[i];
            assign lst_w[i][0] = last_mac_left_i[i];
        end
        for (j = 0; j < ARRAY_SIZE; j = j + 1) begin : INIT_TOP
            assign w_w[0][j]   = weight_top_i[j*8 +: 8];
            assign psum_w[0][j] = 32'd0; // Hàng trên cùng không có ai đổ xuống, cấp số 0
        end
    endgenerate
    
    generate
        for (i = 0; i < ARRAY_SIZE; i = i + 1) begin : ROW 
            for (j = 0; j < ARRAY_SIZE; j = j + 1) begin : COL 
                pe_wrapper u_pe_wrapper (
                    .CLK_i              (CLK_i),
                    .RST_i              (RST_i),
                    
                    .act_i              (a_w[i][j]),
                    .valid_i            (vld_w[i][j]),
                    .clear_acc_i        (clr_w[i][j]),
                    .last_mac_i         (lst_w[i][j]),
                    .weight_i           (w_w[i][j]),
                    
                    .act_o              (a_w[i][j+1]),
                    .valid_fwd_o        (vld_w[i][j+1]),
                    .clear_acc_fwd_o    (clr_w[i][j+1]),
                    .last_mac_fwd_o     (lst_w[i][j+1]),
                    .weight_o           (w_w[i+1][j]),
                    
                    // Nối dây băng chuyền dọc
                    .drain_en_i         (drain_en_array_i),
                    .psum_top_i         (psum_w[i][j]),      // Lấy từ PE trên
                    .psum_down_o        (psum_w[i+1][j]),    // Thả xuống PE dưới
                    .mac_valid_o        (mac_vld_w[i][j])
                );
            end
        end
    endgenerate

    // Lấy tín hiệu 512-bit của 16 PE ở đáy mảng
    generate
        for (j = 0; j < ARRAY_SIZE; j = j + 1) begin : BOTTOM_ROW
            assign bottom_row_o[j*32 +: 32] = psum_w[ARRAY_SIZE][j];
        end
    endgenerate
    
    // Tín hiệu "Trigger": Khi PE cuối cùng (Góc phải dưới) báo valid nghĩa là TOÀN BỘ mảng đã tính xong!
    assign mac_done_trigger_o = mac_vld_w[ARRAY_SIZE-1][ARRAY_SIZE-1];

endmodule
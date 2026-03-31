`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/28/2026 11:32:52 PM
// Design Name: 
// Module Name: array_top
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

module array_top #(
    parameter ARRAY_SIZE = 4
)(
    input  wire clk,
    input  wire rst_n,
    input  wire start_btn,
    
    input wire [3:0] rd_addr,
    output wire [31:0] rd_data
);
    
    // Khai báo dây nối nội bộ
    wire test_done;
    wire [ARRAY_SIZE-1:0] vld, clear_acc, last_mac;
    wire [(ARRAY_SIZE*8)-1:0] act, weight;
    
    // GẮN CỜ MARK_DEBUG ĐỂ DÙNG MÁY ĐO ILA (Integrated Logic Analyzer)
    (* mark_debug = "true" *) wire [(ARRAY_SIZE*ARRAY_SIZE*32)-1:0] psum_out_matrix;
    (* mark_debug = "true" *) wire [(ARRAY_SIZE*ARRAY_SIZE)-1:0]    mac_valid_matrix;
    (* mark_debug = "true" *) wire [2:0] state_debug; // Có thể theo dõi thêm state của máy trạng thái
     
    // ==========================================
    // 1. KHỐI TẠO BÀI TEST & ĐIỀU KHIỂN
    // ==========================================
    array_ctrl #(
        .ARRAY_SIZE(ARRAY_SIZE)
    ) u_ctrl (
        .clk              (clk),
        .rst_n            (rst_n),
        .start_btn        (start_btn),
        .valid_in_left    (vld),
        .clear_acc_left   (clear_acc),
        .last_mac_in_left (last_mac),
        .act_in_left      (act),
        .weight_in_top    (weight),
        .test_done        (test_done)
    );
     
    // ==========================================
    // 2. LÕI TÍNH TOÁN (SYSTOLIC ARRAY)
    // ==========================================
    matmul_array #(
        .ARRAY_SIZE(ARRAY_SIZE)
    ) u_matmul (
        .clk              (clk),
        .rst_n            (rst_n),
        .valid_in_left    (vld),
        .clear_acc_left   (clear_acc),
        .last_mac_in_left (last_mac),
        .act_in_left      (act),
        .weight_in_top    (weight),
        .psum_out_matrix  (psum_out_matrix),
        .mac_valid_matrix (mac_valid_matrix)
    );
    
    assign rd_data = psum_out_matrix[rd_addr*32 +: 32];
        
endmodule
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/25/2026 02:44:54 PM
// Design Name: 
// Module Name: acc_reg
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


module acc_reg(
    input [3:0] a, b,
    input start, clk, rst_n,
    output wire [15:0] psum
    );
    wire rst_acc, en, vld_in, clear_acc;
    acc_ctrl u_ctrl (
        clk,
        start,
        rst_n,
        rst_acc,
        en,
        vld_in, 
        clear_acc
     );
     acc_top u_path (
        a,
        b,
        clk,
        rst_acc,
        en,
        vld_in,
        clear_acc,
        psum
     );
endmodule

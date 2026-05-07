`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/25/2026 02:33:22 PM
// Design Name: 
// Module Name: acc_top
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


module acc_top(
    input [3:0] a, b,
    input clk, rst_n, en, vld_in, clear_acc,
    output wire [15:0] psum
    );
    
    wire [7:0] mul_res;
    
    mul_stage u_mul (
        a,
        b,
        clk,
        rst_n,
        en,
        vld_in,
        mul_res
    );
    
    acc_stage u_acc (
        mul_res,
        clk,
        rst_n,
        clear_acc,
        psum
    );
        
endmodule

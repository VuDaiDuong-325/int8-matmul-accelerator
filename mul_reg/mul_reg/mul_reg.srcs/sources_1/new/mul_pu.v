`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/23/2026 08:44:21 PM
// Design Name: 
// Module Name: mul_pu
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


module mul_pu #(
    parameter ARRAY_SIZE = 4
    )(
    input start, clk, rst_n,
    input signed [ARRAY_SIZE-1:0] a, b,
    
    output wire signed [(2*ARRAY_SIZE)-1:0] res
    );
    
    wire en, rst_ctrl;
    
    mul_ctrl u_ctrl (
        start,
        rst_n,
        rst_ctrl,
        en
    );
    
    mul_reg #(.ARRAY_SIZE(ARRAY_SIZE)) u_path (
        clk,
        rst_ctrl,
        en,
        a,
        b,
        res
    );
endmodule

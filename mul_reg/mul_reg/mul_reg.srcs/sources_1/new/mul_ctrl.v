`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/23/2026 08:35:55 PM
// Design Name: 
// Module Name: mul_ctrl
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


module mul_ctrl (
    input start, rst_n,
    output rst_reg, en
    );
    
    assign rst_reg = rst_n;
    assign en = start && rst_n;
endmodule

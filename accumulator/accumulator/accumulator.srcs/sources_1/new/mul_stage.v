`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/25/2026 02:22:30 PM
// Design Name: 
// Module Name: mul_stage
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


module mul_stage(
    input [3:0] a, b,
    input clk, rst_n, en, vld_in,
    output reg [7:0] mul_res
    );
    
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            mul_res <= 8'd0;
        else 
            mul_res <= en ? vld_in ? a * b : mul_res : mul_res;
     end
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/23/2026 08:28:36 PM
// Design Name: 
// Module Name: mul_reg
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

module mul_reg #(
    parameter ARRAY_SIZE = 4
    )(
    input clk, rst_n, en,
    input signed [ARRAY_SIZE-1:0] a,
    input signed [ARRAY_SIZE-1:0] b,
    
    output reg signed [(2*ARRAY_SIZE)-1:0] res
    );
    
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            res <= 0;
        else begin
            if (en) 
                res <= a * b;
            else 
                res <= res;
        end
    end
endmodule

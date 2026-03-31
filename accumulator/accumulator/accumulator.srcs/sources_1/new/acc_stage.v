`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/25/2026 02:27:50 PM
// Design Name: 
// Module Name: acc_stage
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


module acc_stage(
    input [7:0] d_in,
    input clk, rst_n, clear_acc,
    output reg [15:0] psum_out
    );
    
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) 
            psum_out <= 16'd0;
        else 
            psum_out <= clear_acc ? psum_out : psum_out + d_in;
     end
endmodule

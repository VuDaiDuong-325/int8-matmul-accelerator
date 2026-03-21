`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/21/2026 02:18:05 PM
// Design Name: 
// Module Name: mac_core
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
// Multiple w_in x x_in, then add with previous result

module mac_core(
    input                       clk,
    input                       rst_n,
    input                       valid_in,
    input                       clear_acc,
    input signed        [7:0]   w_in,
    input signed        [7:0]   x_in,
    output reg signed   [31:0]  psum_out,
    output reg                  valid_out
    );
    
    // STAGE 1: Input Register 8 bit
    reg signed [7:0] a_reg, b_reg;
    reg valid_s1, clear_s1;
    
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            a_reg <= 8'd0; b_reg <= 8'd0;
            valid_s1 <= 1'd0; clear_s1 <= 1'd0;
        end
        else begin
            a_reg <= w_in; b_reg <= x_in;
            valid_s1 <= valid_in; clear_s1 <= clear_acc;
        end
     end
     
     // STAGE 2: Multiplier
     reg signed [15:0] mul_reg;
     reg valid_s2, clear_s2;
     
     always @(posedge clk or negedge rst_n) begin
         if (!rst_n) begin
            mul_reg <= 16'd0;
            valid_s2 <= 1'd0; clear_s2 <= 1'd0;
         end
         else begin
            mul_reg <= a_reg * b_reg;
            valid_s2 <= valid_s1; clear_s2 <= clear_s1;
         end
      end
      
      // STAGE 3: Accumulator
      always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin 
            psum_out <= 32'd0;
            valid_out <= 1'd0;
        end 
        else begin
            valid_out <= valid_s2;
            if (valid_s2) begin
                if (clear_s2)
                    psum_out <= $signed(mul_reg);
                else
                    psum_out <= psum_out + $signed(mul_reg);
            end
         end
      end
endmodule

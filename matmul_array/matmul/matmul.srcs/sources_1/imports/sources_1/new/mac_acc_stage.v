`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/22/2026 03:07:27 PM
// Design Name: 
// Module Name: mac_acc_stage
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

module mac_acc_stage(
    input                       clk,
    input                       rst_n,
    input signed        [15:0]  mul_in,
    input                       valid_in,
    input                       clear_acc,
    input                       last_mac_in,
    
    output reg signed   [31:0]  psum_out,
    output reg                  valid_out
    
    );
    
    reg signed [31:0] psum_internal;
    wire signed [31:0] next_sum;
    
    assign next_sum = clear_acc ? mul_in : psum_internal + mul_in;
    
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            psum_internal <= 32'd0;
            psum_out <= 32'd0;
            valid_out <= 1'd0;
         end
         else begin
            valid_out <= 1'd0;
            if (valid_in) begin            
                if (last_mac_in) begin
                    psum_out <= next_sum;       // Output
                    valid_out <= 1'd1;
                    psum_internal <= 32'd0;     // Reset temp register
                end
                else
                    psum_internal <= next_sum;  // Continue adding
             end
         end
     end 
            
endmodule

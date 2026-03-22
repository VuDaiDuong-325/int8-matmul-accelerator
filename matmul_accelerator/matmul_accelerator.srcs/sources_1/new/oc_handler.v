`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/22/2026 07:13:22 PM
// Design Name: 
// Module Name: oc_handler
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


module oc_handler #(
    parameter ARRAY_SIZE = 4,
    localparam NUM_PE = ARRAY_SIZE * ARRAY_SIZE
    )(
    input [NUM_PE*32-1:0] psum_matrix,
    input [NUM_PE-1:0] vld_matrix,
    input [$clog2(NUM_PE)-1:0] idx,
    
    output wire signed [31:0] data_out,
    output wire               vld_out
    );
    
    assign data_out = psum_matrix[idx*32+:32];
    assign vld_out = vld_matrix[idx];
endmodule

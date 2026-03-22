`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/22/2026 05:36:00 PM
// Design Name: 
// Module Name: oc_scan_engine
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


module oc_scan_engine #(
        parameter ARRAY_SIZE = 4,
        localparam NUM_PE = ARRAY_SIZE * ARRAY_SIZE,
        localparam IDX_PE = $clog2(NUM_PE)
    )(
        input clk,
        input rst_n,
        input en,
        output reg [IDX_PE-1:0] idx,
        output wire last_pe
    );
    
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            idx <= 0;
        else if (en) begin
            if (idx == NUM_PE - 1)
                idx <= 0;
            else 
                idx <= idx + 1;
        end
    end
    assign last_pe = (idx == (NUM_PE - 1));
endmodule

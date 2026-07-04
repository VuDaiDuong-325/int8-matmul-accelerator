`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/02/2026 02:36:43 PM
// Design Name: 
// Module Name: shift_register_delay
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

module shift_register_delay #(
    parameter DATA_WIDTH   = 8, 
    parameter DELAY_CYCLES = 1  
)(
    input  wire                  CLK_i,
    input  wire                  RST_i,
    input  wire [DATA_WIDTH-1:0] din_i,
    output wire [DATA_WIDTH-1:0] dout_o
);
    generate
        if (DELAY_CYCLES == 0) begin : gen_no_delay
            assign dout_o = din_i; 
        end 
        else begin : gen_delay
            (* shreg_extract = "yes", srl_style = "srl" *) reg [DATA_WIDTH-1:0] shift_reg_r [0:DELAY_CYCLES-1];
            integer i;

            always @(posedge CLK_i) begin
                shift_reg_r[0] <= din_i; 
                for (i = 1; i < DELAY_CYCLES; i = i + 1) begin
                    shift_reg_r[i] <= shift_reg_r[i-1];
                end
            end

            assign dout_o = shift_reg_r[DELAY_CYCLES-1];
        end
    endgenerate
endmodule
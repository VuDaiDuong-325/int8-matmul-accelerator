`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/02/2026 02:37:39 PM
// Design Name: 
// Module Name: skew_network
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

`timescale 1ns / 1ps

module skew_network #(
    parameter N = 4,          
    parameter DATA_WIDTH = 8  
)(
    input  wire                          clk,
    input  wire                          rst_n,
    
    input  wire [(N*DATA_WIDTH)-1:0]     data_A_in,
    input  wire [(N*DATA_WIDTH)-1:0]     data_B_in,
    input  wire                          valid_in,
    input  wire                          clear_in,
    
    output wire [(N*DATA_WIDTH)-1:0]     data_A_out,
    output wire [(N*DATA_WIDTH)-1:0]     data_B_out,
    output wire [N-1:0]                  valid_out,
    output wire [N-1:0]                  clear_out
);

    genvar i;
    generate
        for (i = 0; i < N; i = i + 1) begin : skew_gen
            shift_register_delay #(.DATA_WIDTH(DATA_WIDTH), .DELAY_CYCLES(i)) delay_A (
                .clk(clk), .rst_n(rst_n),
                .din (data_A_in [i*DATA_WIDTH +: DATA_WIDTH]),
                .dout(data_A_out[i*DATA_WIDTH +: DATA_WIDTH])
            );

            shift_register_delay #(.DATA_WIDTH(DATA_WIDTH), .DELAY_CYCLES(i)) delay_B (
                .clk(clk), .rst_n(rst_n),
                .din (data_B_in [i*DATA_WIDTH +: DATA_WIDTH]),
                .dout(data_B_out[i*DATA_WIDTH +: DATA_WIDTH])
            );

            shift_register_delay #(.DATA_WIDTH(1), .DELAY_CYCLES(i)) delay_valid (
                .clk(clk), .rst_n(rst_n),
                .din (valid_in),
                .dout(valid_out[i])
            );

            shift_register_delay #(.DATA_WIDTH(1), .DELAY_CYCLES(i)) delay_clear (
                .clk(clk), .rst_n(rst_n),
                .din (clear_in),
                .dout(clear_out[i])
            );
        end
    endgenerate

endmodule

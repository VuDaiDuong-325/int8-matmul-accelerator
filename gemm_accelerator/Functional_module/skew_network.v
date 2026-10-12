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

module skew_network #(
    parameter N = 16,          
    parameter DATA_WIDTH = 8  
)(
    input  wire                          CLK_i,
    input  wire                          RST_i,
    
    input  wire [(N*DATA_WIDTH)-1:0]     data_A_i,
    input  wire [(N*DATA_WIDTH)-1:0]     data_B_i,
    input  wire                          valid_i,
    input  wire                          clear_i,
    input  wire                          last_mac_i, // [NEW] Thêm ngõ vào này
    
    output wire [(N*DATA_WIDTH)-1:0]     data_A_o,
    output wire [(N*DATA_WIDTH)-1:0]     data_B_o,
    output wire [N-1:0]                  valid_o,
    output wire [N-1:0]                  clear_o,
    output wire [N-1:0]                  last_mac_o // [NEW] Thêm ngõ ra này
);

    genvar i;
    generate
        for (i = 0; i < N; i = i + 1) begin : skew_gen
            shift_register_delay #(.DATA_WIDTH(DATA_WIDTH), .DELAY_CYCLES(i)) u_delay_a (
                .CLK_i(CLK_i), .RST_i(RST_i), .din_i(data_A_i[i*DATA_WIDTH +: DATA_WIDTH]), .dout_o(data_A_o[i*DATA_WIDTH +: DATA_WIDTH])
            );

            shift_register_delay #(.DATA_WIDTH(DATA_WIDTH), .DELAY_CYCLES(i)) u_delay_b (
                .CLK_i(CLK_i), .RST_i(RST_i), .din_i(data_B_i[i*DATA_WIDTH +: DATA_WIDTH]), .dout_o(data_B_o[i*DATA_WIDTH +: DATA_WIDTH])
            );

            shift_register_delay #(.DATA_WIDTH(1), .DELAY_CYCLES(i)) u_delay_vld (
                .CLK_i(CLK_i), .RST_i(RST_i), .din_i(valid_i), .dout_o(valid_o[i])
            );

            shift_register_delay #(.DATA_WIDTH(1), .DELAY_CYCLES(i)) u_delay_clr (
                .CLK_i(CLK_i), .RST_i(RST_i), .din_i(clear_i), .dout_o(clear_o[i])
            );
            
            // [NEW] Khối Delay cho last_mac_in
            shift_register_delay #(.DATA_WIDTH(1), .DELAY_CYCLES(i)) u_delay_last (
                .CLK_i(CLK_i), .RST_i(RST_i), .din_i(last_mac_i), .dout_o(last_mac_o[i])
            );
        end
    endgenerate

endmodule
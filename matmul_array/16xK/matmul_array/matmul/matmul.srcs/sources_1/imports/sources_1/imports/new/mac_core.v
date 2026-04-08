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
// P = P(previous) + (W x X)
module mac_core(
    input                       clk,
    input                       rst_n,
    input                       valid_in,
    input                       clear_acc,
    input                       last_mac_in,
    input signed        [7:0]   w_in,
    input signed        [7:0]   x_in,
    output wire signed  [31:0]  psum_out,
    output wire                 valid_out
    );
    
    wire signed [31:0] mult_to_acc;
    wire valid_mta, clear_mta, last_mac_mta;
    
    mac_mult_stage mult_reg(
        clk,
        rst_n,
        valid_in,
        clear_acc,
        last_mac_in,
        w_in,
        x_in,
        mult_to_acc,
        valid_mta,
        clear_mta,
        last_mac_mta
     );
     
     mac_acc_stage acc_reg (
        clk,
        rst_n,
        mult_to_acc,
        valid_mta,
        clear_mta,
        last_mac_mta,
        psum_out,
        valid_out
     );
    
endmodule

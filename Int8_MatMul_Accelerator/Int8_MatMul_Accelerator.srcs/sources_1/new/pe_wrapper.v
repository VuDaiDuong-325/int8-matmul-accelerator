`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/21/2026 02:18:05 PM
// Design Name: 
// Module Name: pe_wrapper
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


module pe_wrapper(
    input                       clk,
    input                       rst_n,
    input                       valid_in,
    input                       clear_acc,
    input signed        [7:0]   weight_in,
    input signed        [7:0]   act_in,
    output reg signed   [7:0]   weight_out,
    output reg signed   [7:0]   act_out,
    output reg                  valid_out_fwd,
    output reg                  clear_acc_fwd,
    output wire signed  [31:0]  psum_out,
    output wire                 mac_valid_out
    );
    
    // Tinh toan du lieu dau vao
    mac_core u_mac (
        clk,
        rst_n,
        valid_in,
        clear_acc,
        weight_in,
        act_in,
        psum_out,
        mac_valid_out
     );
     
     // Chot va day du lieu qua pe tiep theo
     always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            weight_out <= 8'd0; act_out <= 8'd0;
            valid_out_fwd <= 1'd0; clear_acc_fwd <= 1'd0;
        end
        else begin                      // tre 1 xung clk
            weight_out <= weight_in;
            act_out <= act_in;
            valid_out_fwd <= valid_in;
            clear_acc_fwd <= clear_acc;
        end
     end
endmodule

// => Chay MAC het 3 clk cycle, day du lieu het 1 clk cycle 
// => Can thiet ke bo dieu khien nhat ket qua theo bac thang

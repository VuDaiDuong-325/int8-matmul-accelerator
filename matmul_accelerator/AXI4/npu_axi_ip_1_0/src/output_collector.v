`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/22/2026 07:40:01 PM
// Design Name: 
// Module Name: output_collector
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

module output_collector #(
    parameter ARRAY_SIZE = 4
)(
    input  wire clk,
    input  wire rst_n,
    input  wire [(ARRAY_SIZE*ARRAY_SIZE*32)-1:0] psum_matrix,
    input  wire [(ARRAY_SIZE*ARRAY_SIZE)-1:0]    vld_matrix,
    
    output wire signed [31:0] out_data,
    output wire               out_vld,
    output wire               all_done
);
    wire scan_en, last_pe;
    wire [$clog2(ARRAY_SIZE*ARRAY_SIZE)-1:0] sel_idx;

    // Bộ tạo địa chỉ
    oc_scan_engine #(.ARRAY_SIZE(ARRAY_SIZE)) u_engine (
        .clk(clk), .rst_n(rst_n), .en(scan_en), .scan_idx(sel_idx), .last_pe(last_pe)
    );

    // Bộ điều khiển FSM
    oc_ctrl u_ctrl (
        .clk(clk), .rst_n(rst_n), 
        .start_i(vld_matrix[ARRAY_SIZE*ARRAY_SIZE-1]), // Bắt đầu khi PE cuối xong
        .last_pe_i(last_pe), .scan_en_o(scan_en), .write_en_o(out_vld), .done_o(all_done)
    );

    // Đường truyền dữ liệu
    oc_handler #(.ARRAY_SIZE(ARRAY_SIZE)) u_handler (
        .psum_matrix(psum_matrix), .vld_matrix(vld_matrix), .sel_idx(sel_idx),
        .data_out(out_data), .vld_out() // vld_out có thể dùng để check debug
    );

endmodule
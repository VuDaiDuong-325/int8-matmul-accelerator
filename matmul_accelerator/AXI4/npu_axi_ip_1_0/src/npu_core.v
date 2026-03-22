`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/22/2026 07:51:19 PM
// Design Name: 
// Module Name: npu_core
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


module npu_core #(
    parameter ARRAY_SIZE = 4,
    parameter DATA_WIDTH = 8,
    parameter PSUM_WIDTH = 32
)(
    input  wire clk,
    input  wire rst_n,

    // Giao tiếp nạp dữ liệu (Từ CPU/DMA nạp vào Buffer)
    input  wire [(ARRAY_SIZE*DATA_WIDTH)-1:0] act_in,
    input  wire [(ARRAY_SIZE*DATA_WIDTH)-1:0] weight_in,
    input  wire                               buffer_en, // Cho phép nạp data

    // Điều khiển tính toán
    input  wire                               start_compute,
    input  wire [ARRAY_SIZE-1:0]              clear_acc_all,
    input  wire [ARRAY_SIZE-1:0]              last_mac_all,

    // Đầu ra sau khi gom (Output Collector)
    output wire [PSUM_WIDTH-1:0]              final_data_out,
    output wire                               final_vld_out,
    output wire                               all_process_done
);

    // --- 1. Tín hiệu nội bộ (Internal Wires) ---
    wire [(ARRAY_SIZE*DATA_WIDTH)-1:0] act_skewed;
    wire [(ARRAY_SIZE*DATA_WIDTH)-1:0] weight_skewed;
    
    wire [(ARRAY_SIZE*ARRAY_SIZE*PSUM_WIDTH)-1:0] psum_matrix;
    wire [(ARRAY_SIZE*ARRAY_SIZE)-1:0]            vld_matrix;

    // --- 2. Khối Input Buffer cho Activation (Bên trái) ---
    input_buffer_skew #(
        .ARRAY_SIZE(ARRAY_SIZE),
        .DATA_WIDTH(DATA_WIDTH)
    ) u_act_buf (
        .clk(clk),
        .rst_n(rst_n),
        .en(buffer_en),
        .data_in(act_in),
        .data_skewed_out(act_skewed)
    );

    // --- 3. Khối Input Buffer cho Weight (Bên trên) ---
    input_buffer_skew #(
        .ARRAY_SIZE(ARRAY_SIZE),
        .DATA_WIDTH(DATA_WIDTH)
    ) u_weight_buf (
        .clk(clk),
        .rst_n(rst_n),
        .en(buffer_en),
        .data_in(weight_in),
        .data_skewed_out(weight_skewed)
    );

    // --- 4. Ma trận MatMul Array (PE Matrix) ---
    matmul_array #(
        .ARRAY_SIZE(ARRAY_SIZE)
    ) u_matmul (
        .clk(clk),
        .rst_n(rst_n),
        .valid_in_left({ARRAY_SIZE{buffer_en}}), // Giả định valid đi kèm buffer_en
        .clear_acc_left(clear_acc_all),
        .last_mac_in_left(last_mac_all),
        .act_in_left(act_skewed),
        .weight_in_top(weight_skewed),
        .psum_out_matrix(psum_matrix),
        .mac_valid_matrix(vld_matrix)
    );

    // --- 5. Khối Output Collector (Thu hoạch kết quả) ---
    output_collector #(
        .ARRAY_SIZE(ARRAY_SIZE)
    ) u_collector (
        .clk(clk),
        .rst_n(rst_n),
        .psum_matrix(psum_matrix),
        .vld_matrix(vld_matrix),
        .out_data(final_data_out),
        .out_vld(final_vld_out),
        .all_done(all_process_done)
    );

endmodule

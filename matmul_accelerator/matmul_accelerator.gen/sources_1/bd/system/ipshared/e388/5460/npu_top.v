`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/22/2026 08:54:24 PM
// Design Name: 
// Module Name: npu_top
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

module npu_top #(
    parameter ARRAY_SIZE = 4,
    parameter DATA_WIDTH = 8,
    parameter PSUM_WIDTH = 32,
    parameter MEM_DEPTH  = 1024
)(
    input  wire clk,
    input  wire rst_n,

    // --- 1. Giao tiếp Control (Nhận lệnh trực tiếp từ bus AXI) ---
    input  wire [3:0]  reg_awaddr,
    input  wire        reg_wren,
    input  wire [31:0] reg_wdata,
    
    // --- 2. Giao tiếp nạp BRAM (Tạm dùng thanh ghi để CPU nạp tay) ---
    input  wire [$clog2(MEM_DEPTH)-1:0]      mem_wr_addr,
    input  wire [(ARRAY_SIZE*DATA_WIDTH)-1:0] mem_wr_act,
    input  wire [(ARRAY_SIZE*DATA_WIDTH)-1:0] mem_wr_weight,
    input  wire                              mem_wr_en_act,
    input  wire                              mem_wr_en_weight,

    // --- 3. Test tín hiệu tĩnh ---
    input  wire [ARRAY_SIZE-1:0] clear_acc_all,
    input  wire [ARRAY_SIZE-1:0] last_mac_all,

    // --- 4. Đầu ra ---
    output wire [PSUM_WIDTH-1:0] final_data_out,
    output wire                  final_vld_out,
    output wire                  all_process_done
);

    // Dây tín hiệu kết nối nội bộ
    wire        start_pulse;
    wire        reset_soft;
    wire [15:0] k_size;
    
    wire [$clog2(MEM_DEPTH)-1:0] rd_addr;
    wire                         rd_en;
    wire                         busy;
    
    wire [(ARRAY_SIZE*DATA_WIDTH)-1:0] act_to_core;
    wire [(ARRAY_SIZE*DATA_WIDTH)-1:0] weight_to_core;

    wire sys_rst_n = rst_n & ~reset_soft;

    // --- Khởi tạo các module con ---

    // 1. Control Unit (Tạo xung start khi CPU ghi vào địa chỉ 0x0)
    npu_control_unit #(
        .ADDR_W(4), .DATA_W(32)
    ) u_ctrl (
        .clk(clk), .rst_n(rst_n),
        .reg_addr(reg_awaddr), .reg_write_en(reg_wren), .reg_write_data(reg_wdata),
        .reg_read_data(), // Bỏ trống vì RDATA xử lý ở file vỏ ngoài
        .npu_start(start_pulse), .npu_reset_soft(reset_soft),
        .npu_done(all_process_done), .k_size(k_size)
    );

    // 2. Address Generator (Đếm địa chỉ RAM tự động khi có lệnh start)
    npu_addr_gen #(
        .DEPTH(MEM_DEPTH)
    ) u_addr_gen (
        .clk(clk), .rst_n(sys_rst_n),
        .start_i(start_pulse), .k_size(k_size),
        .rd_addr(rd_addr), .rd_en(rd_en), .busy(busy)
    );

    // 3. Local Memory (Chứa dữ liệu Act và Weight)
    npu_local_mem #(
        .ARRAY_SIZE(ARRAY_SIZE), .DATA_WIDTH(DATA_WIDTH), .DEPTH(MEM_DEPTH)
    ) u_local_mem (
        .clk(clk),
        .wr_addr(mem_wr_addr), 
        .wr_data(mem_wr_act),  // Nối chung với wr_weight nhưng điều khiển bằng en
        .wr_en_act(mem_wr_en_act), .wr_en_weight(mem_wr_en_weight),
        .rd_addr(rd_addr),
        .act_to_npu(act_to_core), .weight_to_npu(weight_to_core)
    );

    // 4. NPU Core (Trái tim tính toán)
    npu_core #(
        .ARRAY_SIZE(ARRAY_SIZE), .DATA_WIDTH(DATA_WIDTH), .PSUM_WIDTH(PSUM_WIDTH)
    ) u_core (
        .clk(clk), .rst_n(sys_rst_n),
        .act_in(act_to_core), .weight_in(weight_to_core),
        .buffer_en(rd_en), // BRAM đọc đến đâu, NPU nuốt dữ liệu đến đó
        .start_compute(start_pulse),
        .clear_acc_all(clear_acc_all), .last_mac_all(last_mac_all),
        .final_data_out(final_data_out), .final_vld_out(final_vld_out), .all_process_done(all_process_done)
    );

endmodule

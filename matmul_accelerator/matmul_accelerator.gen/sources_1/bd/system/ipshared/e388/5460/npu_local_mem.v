`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/22/2026 08:01:16 PM
// Design Name: 
// Module Name: npu_local_mem
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


module npu_local_mem #(
    parameter ARRAY_SIZE = 16,
    parameter DATA_WIDTH = 8,
    parameter DEPTH      = 1024
)(
    input wire clk,
    
    // Interface ghi (Nối với DMA hoặc AXI)
    input wire [$clog2(DEPTH)-1:0] wr_addr,
    input wire [(ARRAY_SIZE*DATA_WIDTH)-1:0] wr_data,
    input wire wr_en_act,
    input wire wr_en_weight,
    
    // Interface đọc (Nối với Input Buffer Skew)
    input wire [$clog2(DEPTH)-1:0] rd_addr,
    output reg [(ARRAY_SIZE*DATA_WIDTH)-1:0] act_to_npu,
    output reg [(ARRAY_SIZE*DATA_WIDTH)-1:0] weight_to_npu
);

    // Khởi tạo BRAM (Sử dụng mảng trong Verilog, Vivado sẽ tự suy luận ra BRAM)
    reg [(ARRAY_SIZE*DATA_WIDTH)-1:0] act_ram [0:DEPTH-1];
    reg [(ARRAY_SIZE*DATA_WIDTH)-1:0] weight_ram [0:DEPTH-1];

    // Logic ghi/đọc Act RAM
    always @(posedge clk) begin
        if (wr_en_act) act_ram[wr_addr] <= wr_data;
        act_to_npu <= act_ram[rd_addr];
    end

    // Logic ghi/đọc Weight RAM
    always @(posedge clk) begin
        if (wr_en_weight) weight_ram[wr_addr] <= wr_data;
        weight_to_npu <= weight_ram[rd_addr];
    end

endmodule

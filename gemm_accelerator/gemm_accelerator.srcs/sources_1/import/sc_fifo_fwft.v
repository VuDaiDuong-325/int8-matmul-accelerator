`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/02/2026 09:00:17 PM
// Design Name: 
// Module Name: sc_fifo_fwft
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

module sc_fifo_fwft #(
    parameter DATA_WIDTH = 32,  
    parameter DEPTH      = 1024  
)(
    input  wire                  CLK_i,
    input  wire                  RST_i,
    input  wire                  wr_en_i,
    input  wire [DATA_WIDTH-1:0] din_i,
    output wire                  full_o,
    input  wire                  rd_en_i,
    output wire [DATA_WIDTH-1:0] dout_o, 
    output wire                  empty_o
);
    wire rst_high_w = ~RST_i;

    // Gọi Hard IP FIFO của Xilinx (0 FF, 100% BRAM)
    xpm_fifo_sync #(
        .FIFO_MEMORY_TYPE    ("block"),    // Ép sử dụng Block RAM
        .READ_MODE           ("fwft"),     // Chế độ First-Word Fall-Through (Độ trễ = 0)
        .FIFO_WRITE_DEPTH    (DEPTH),
        .WRITE_DATA_WIDTH    (DATA_WIDTH),
        .READ_DATA_WIDTH     (DATA_WIDTH),
        .FIFO_READ_LATENCY   (0),
        .USE_ADV_FEATURES    ("0000")      // Tắt các cờ rườm rà để tiết kiệm LUT
    ) xpm_fifo_sync_inst (
        .dout            (dout_o),
        .empty           (empty_o),
        .full            (full_o),
        .din             (din_i),
        .rd_en           (rd_en_i),
        .wr_clk          (CLK_i),
        .wr_en           (wr_en_i),
        .rst             (rst_high_w),
        .injectdbiterr   (1'b0), .injectsbiterr   (1'b0), .sleep           (1'b0)
    );
endmodule
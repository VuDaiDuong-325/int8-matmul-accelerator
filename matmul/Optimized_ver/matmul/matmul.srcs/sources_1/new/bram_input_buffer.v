`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/07/2026 12:02:23 AM
// Design Name: 
// Module Name: bram_input_buffer
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

module bram_input_buffer #(
    parameter DATA_WIDTH = 128,
    parameter DEPTH = 1024
)(
    input  wire                  clk,
    input  wire                  rst_n,
    input  wire [29:0]           chunk_len, 
    input  wire [DATA_WIDTH-1:0] s_axis_tdata,
    input  wire                  s_axis_tvalid,
    output wire                  s_axis_tready,
    input  wire                  s_axis_tlast,
    input  wire [$clog2(DEPTH)-1:0] rd_addr,
    output wire [DATA_WIDTH-1:0]    rd_data,
    output reg                   block_ready,
    input  wire                  clear_ready
);
    localparam ADDR_WIDTH = $clog2(DEPTH);
    reg [ADDR_WIDTH-1:0] wr_ptr;

    assign s_axis_tready = ~block_ready; 

    // ----------------------------------------------------
    // Logic điều khiển ghi AXI Stream
    // ----------------------------------------------------
    always @(posedge clk) begin
        if (!rst_n) begin
            wr_ptr <= 0;
            block_ready <= 1'b0;
        end else begin
            if (clear_ready) begin
                block_ready <= 1'b0;
                wr_ptr <= 0; 
            end
            else if (s_axis_tvalid && s_axis_tready) begin
                if (wr_ptr == chunk_len - 1) block_ready <= 1'b1; 
                else wr_ptr <= wr_ptr + 1;
            end
        end
    end

    // ----------------------------------------------------
    // BRAM INFERENCE (Triệt tiêu lỗi XPM Simulator)
    // ----------------------------------------------------
    // Dùng Attribute này để ép Vivado dịch mảng này thành Block RAM cứng
    (* ram_style = "block" *) reg [DATA_WIDTH-1:0] ram [0:DEPTH-1];
    reg [DATA_WIDTH-1:0] bram_out_reg;
    reg [DATA_WIDTH-1:0] pipeline_reg;

    always @(posedge clk) begin
        // Port A: Ghi dữ liệu
        if (s_axis_tvalid && s_axis_tready) begin
            ram[wr_ptr] <= s_axis_tdata;
        end
        
        // Port B: Đọc dữ liệu với độ trễ 2 nhịp (Đảm bảo Timing cực mượt)
        bram_out_reg <= ram[rd_addr];     // Nhịp 1: Đọc từ RAM ra
        pipeline_reg <= bram_out_reg;     // Nhịp 2: Đệm đầu ra
    end

    assign rd_data = pipeline_reg;

endmodule
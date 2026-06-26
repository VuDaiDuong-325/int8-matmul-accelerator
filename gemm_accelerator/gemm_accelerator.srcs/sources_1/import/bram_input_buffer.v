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
    
    // Giao tiếp với NPU (Read Port)
    input  wire [$clog2(DEPTH)-1:0] rd_addr,
    output wire [DATA_WIDTH-1:0]    rd_data,
    
    output wire                  block_ready,
    input  wire                  clear_ready
);
    localparam ADDR_WIDTH = $clog2(DEPTH);
    
    reg [ADDR_WIDTH-1:0] wr_ptr;
    reg wr_bank;
    reg rd_bank;
    
    reg bank_ready_0;
    reg bank_ready_1;

    assign s_axis_tready = (wr_bank == 1'b0) ? ~bank_ready_0 : ~bank_ready_1; 
    assign block_ready = (rd_bank == 1'b0) ? bank_ready_0 : bank_ready_1;

    // ====================================================
    // LOGIC ĐIỀU KHIỂN CỜ READY VÀ XÓA CỜ 
    // ====================================================
    always @(posedge clk) begin
        if (!rst_n) begin
            bank_ready_0 <= 1'b0;
            bank_ready_1 <= 1'b0;
        end else begin
            if (clear_ready && rd_bank == 1'b0) 
                bank_ready_0 <= 1'b0; 
            else if (s_axis_tvalid && s_axis_tready && wr_bank == 1'b0 && wr_ptr == chunk_len - 1) 
                bank_ready_0 <= 1'b1; 

            if (clear_ready && rd_bank == 1'b1) 
                bank_ready_1 <= 1'b0; 
            else if (s_axis_tvalid && s_axis_tready && wr_bank == 1'b1 && wr_ptr == chunk_len - 1) 
                bank_ready_1 <= 1'b1; 
        end
    end

    // ====================================================
    // LOGIC CON TRỎ GHI DMA
    // ====================================================
    always @(posedge clk) begin
        if (!rst_n) begin
            wr_ptr <= 0;
            wr_bank <= 0;
        end else begin
            if (s_axis_tvalid && s_axis_tready) begin
                if (wr_ptr == chunk_len - 1) begin
                    wr_ptr <= 0;
                    wr_bank <= ~wr_bank;
                end else begin
                    wr_ptr <= wr_ptr + 1;
                end
            end
        end
    end

    // ====================================================
    // LOGIC CON TRỎ ĐỌC NPU 
    // ====================================================
    always @(posedge clk) begin
        if (!rst_n) begin
            rd_bank <= 0;
        end else if (clear_ready) begin
            rd_bank <= ~rd_bank; 
        end
    end

// ====================================================
    // BRAM INFERENCE (2 MEMORY BLOCKS CHO PING-PONG)
    // ====================================================
    (* ram_style = "block" *) reg [DATA_WIDTH-1:0] ram_0 [0:DEPTH-1];
    (* ram_style = "block" *) reg [DATA_WIDTH-1:0] ram_1 [0:DEPTH-1];
    
    // Tách thành 2 thanh ghi đầu ra độc lập cho từng RAM
    reg [DATA_WIDTH-1:0] ram0_out_reg;
    reg [DATA_WIDTH-1:0] ram1_out_reg;
    
    wire [DATA_WIDTH-1:0] mux_out;
    reg  [DATA_WIDTH-1:0] pipeline_reg; 

    // Cấu trúc chuẩn Simple Dual-Port RAM cho RAM 0
    always @(posedge clk) begin
        // Port A: Ghi dữ liệu
        if (s_axis_tvalid && s_axis_tready && (wr_bank == 1'b0)) begin
            ram_0[wr_ptr] <= s_axis_tdata;
        end
        // Port B: Đọc đồng bộ liên tục (Bắt buộc để infer ra BRAM)
        ram0_out_reg <= ram_0[rd_addr];
    end

    // Cấu trúc chuẩn Simple Dual-Port RAM cho RAM 1
    always @(posedge clk) begin
        // Port A: Ghi dữ liệu
        if (s_axis_tvalid && s_axis_tready && (wr_bank == 1'b1)) begin
            ram_1[wr_ptr] <= s_axis_tdata;
        end
        // Port B: Đọc đồng bộ liên tục (Bắt buộc để infer ra BRAM)
        ram1_out_reg <= ram_1[rd_addr];
    end

    // Mux chọn kết quả tổ hợp (Combinational Mux) ĐẰNG SAU thanh ghi đọc RAM
    assign mux_out = (rd_bank == 1'b0) ? ram0_out_reg : ram1_out_reg;

    // Thanh ghi tạo độ trễ nhịp thứ 2 (Giữ nguyên đồng bộ cho FSM của bạn)
    always @(posedge clk) begin
        pipeline_reg <= mux_out;
    end

    assign rd_data = pipeline_reg;

endmodule
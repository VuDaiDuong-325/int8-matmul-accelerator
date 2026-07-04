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
    input  wire                  CLK_i,
    input  wire                  RST_i,
    input  wire [29:0]           chunk_len_i, 
    input  wire [DATA_WIDTH-1:0] s_axis_tdata_i,
    input  wire                  s_axis_tvalid_i,
    output wire                  s_axis_tready_o,
    input  wire                  s_axis_tlast_i,
    
    // Giao tiếp với NPU (Read Port)
    input  wire [$clog2(DEPTH)-1:0] rd_addr_i,
    output wire [DATA_WIDTH-1:0]    rd_data_o,
    
    output wire                  block_ready_o,
    input  wire                  clear_ready_i
);
    localparam ADDR_WIDTH = $clog2(DEPTH);
    
    reg [ADDR_WIDTH-1:0] wr_ptr_r;
    reg wr_bank_r;
    reg rd_bank_r;
    
    reg bank_ready_0_r;
    reg bank_ready_1_r;

    assign s_axis_tready_o = (wr_bank_r == 1'b0) ? ~bank_ready_0_r : ~bank_ready_1_r; 
    assign block_ready_o = (rd_bank_r == 1'b0) ? bank_ready_0_r : bank_ready_1_r;

    // ====================================================
    // LOGIC ĐIỀU KHIỂN CỜ READY VÀ XÓA CỜ 
    // ====================================================
    always @(posedge CLK_i) begin
        if (!RST_i) begin
            bank_ready_0_r <= 1'b0;
            bank_ready_1_r <= 1'b0;
        end else begin
            if (clear_ready_i && rd_bank_r == 1'b0) 
                bank_ready_0_r <= 1'b0; 
            else if (s_axis_tvalid_i && s_axis_tready_o && wr_bank_r == 1'b0 && wr_ptr_r == chunk_len_i - 1) 
                bank_ready_0_r <= 1'b1; 

            if (clear_ready_i && rd_bank_r == 1'b1) 
                bank_ready_1_r <= 1'b0; 
            else if (s_axis_tvalid_i && s_axis_tready_o && wr_bank_r == 1'b1 && wr_ptr_r == chunk_len_i - 1) 
                bank_ready_1_r <= 1'b1; 
        end
    end

    // ====================================================
    // LOGIC CON TRỎ GHI DMA
    // ====================================================
    always @(posedge CLK_i) begin
        if (!RST_i) begin
            wr_ptr_r <= 0;
            wr_bank_r <= 0;
        end else begin
            if (s_axis_tvalid_i && s_axis_tready_o) begin
                if (wr_ptr_r == chunk_len_i - 1) begin
                    wr_ptr_r <= 0;
                    wr_bank_r <= ~wr_bank_r;
                end else begin
                    wr_ptr_r <= wr_ptr_r + 1;
                end
            end
        end
    end

    // ====================================================
    // LOGIC CON TRỎ ĐỌC NPU 
    // ====================================================
    always @(posedge CLK_i) begin
        if (!RST_i) begin
            rd_bank_r <= 0;
        end else if (clear_ready_i) begin
            rd_bank_r <= ~rd_bank_r; 
        end
    end

// ====================================================
    // BRAM INFERENCE (2 MEMORY BLOCKS CHO PING-PONG)
    // ====================================================
    (* ram_style = "block" *) reg [DATA_WIDTH-1:0] ram_0_r [0:DEPTH-1];
    (* ram_style = "block" *) reg [DATA_WIDTH-1:0] ram_1_r [0:DEPTH-1];
    
    // Tách thành 2 thanh ghi đầu ra độc lập cho từng RAM
    reg [DATA_WIDTH-1:0] ram0_out_r;
    reg [DATA_WIDTH-1:0] ram1_out_r;
    
    wire [DATA_WIDTH-1:0] mux_out_w;
    reg  [DATA_WIDTH-1:0] pipeline_r; 

    // Cấu trúc chuẩn Simple Dual-Port RAM cho RAM 0
    always @(posedge CLK_i) begin
        // Port A: Ghi dữ liệu
        if (s_axis_tvalid_i && s_axis_tready_o && (wr_bank_r == 1'b0)) begin
            ram_0_r[wr_ptr_r] <= s_axis_tdata_i;
        end
        // Port B: Đọc đồng bộ liên tục (Bắt buộc để infer ra BRAM)
        ram0_out_r <= ram_0_r[rd_addr_i];
    end

    // Cấu trúc chuẩn Simple Dual-Port RAM cho RAM 1
    always @(posedge CLK_i) begin
        // Port A: Ghi dữ liệu
        if (s_axis_tvalid_i && s_axis_tready_o && (wr_bank_r == 1'b1)) begin
            ram_1_r[wr_ptr_r] <= s_axis_tdata_i;
        end
        // Port B: Đọc đồng bộ liên tục (Bắt buộc để infer ra BRAM)
        ram1_out_r <= ram_1_r[rd_addr_i];
    end

    // Mux chọn kết quả tổ hợp (Combinational Mux) ĐẰNG SAU thanh ghi đọc RAM
    assign mux_out_w = (rd_bank_r == 1'b0) ? ram0_out_r : ram1_out_r;

    // Thanh ghi tạo độ trễ nhịp thứ 2 (Giữ nguyên đồng bộ cho FSM của bạn)
    always @(posedge CLK_i) begin
        pipeline_r <= mux_out_w;
    end

    assign rd_data_o = pipeline_r;

endmodule
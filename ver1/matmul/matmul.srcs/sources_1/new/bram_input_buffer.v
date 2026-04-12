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
    input  wire [$clog2(DEPTH)-1:0] rd_addr,
    output wire [DATA_WIDTH-1:0]    rd_data,
    output wire                  block_ready, // [SỬA]: Chuyển từ reg sang wire
    input  wire                  clear_ready
);
    localparam ADDR_WIDTH = $clog2(DEPTH);
    reg [ADDR_WIDTH-1:0] wr_ptr;

    // ----------------------------------------------------
    // LOGIC ĐIỀU KHIỂN PING-PONG
    // ----------------------------------------------------
    reg wr_side;  // 0: Đang nạp vào Ping | 1: Đang nạp vào Pong
    reg rd_side;  // 0: Đang đọc từ Ping  | 1: Đang đọc từ Pong
    
    reg ping_ready; // Cờ báo Ping đã đầy
    reg pong_ready; // Cờ báo Pong đã đầy

    // DMA được phép nạp nếu buffer hướng tới (wr_side) CHƯA ĐẦY
    assign s_axis_tready = (wr_side == 1'b0) ? ~ping_ready : ~pong_ready;

    // Báo cho Mảng Systolic biết buffer cần đọc (rd_side) ĐÃ SẴN SÀNG chưa
    assign block_ready = (rd_side == 1'b0) ? ping_ready : pong_ready;

    // ----------------------------------------------------
    // MÁY TRẠNG THÁI GHI & QUẢN LÝ CỜ (WRITE SIDE)
    // ----------------------------------------------------
    always @(posedge clk) begin
        if (!rst_n) begin
            wr_ptr <= 0;
            wr_side <= 1'b0;
            ping_ready <= 1'b0;
            pong_ready <= 1'b0;
        end else begin
            // [BƯỚC DỌN DẸP]: Khi IP tính xong 1 khối, dập cờ Ready của khối đó
            if (clear_ready) begin
                if (rd_side == 1'b0) ping_ready <= 1'b0;
                else                 pong_ready <= 1'b0;
            end
            
            // [BƯỚC GHI DATA TỪ DMA]:
            if (s_axis_tvalid && s_axis_tready) begin
                // Nếu nhận đủ 1 Tile hoặc gặp cờ chốt tlast
                if (wr_ptr == chunk_len - 1 || s_axis_tlast) begin 
                    wr_ptr <= 0; // Reset con trỏ ghi cho đợt tiếp theo
                    
                    // Bật cờ báo đầy cho buffer vừa ghi
                    if (wr_side == 1'b0) ping_ready <= 1'b1;
                    else                 pong_ready <= 1'b1;
                    
                    // Lật mặt Ping/Pong cho đợt ghi tiếp theo
                    wr_side <= ~wr_side; 
                end else begin
                    wr_ptr <= wr_ptr + 1;
                end
            end
        end
    end

    // ----------------------------------------------------
    // MÁY TRẠNG THÁI ĐỌC (READ SIDE)
    // ----------------------------------------------------
    always @(posedge clk) begin
        if (!rst_n) begin
            rd_side <= 1'b0;
        end else begin
            // Khi khối tính toán rút xong 1 khối, lật mặt sang buffer kia để đọc
            if (clear_ready) begin
                rd_side <= ~rd_side; 
            end
        end
    end

    // ----------------------------------------------------
    // BRAM INFERENCE (Tách thành 2 RAM độc lập)
    // ----------------------------------------------------
    (* ram_style = "block" *) reg [DATA_WIDTH-1:0] ram_ping [0:DEPTH-1];
    (* ram_style = "block" *) reg [DATA_WIDTH-1:0] ram_pong [0:DEPTH-1];
    
    reg [DATA_WIDTH-1:0] bram_out_reg;
    reg [DATA_WIDTH-1:0] pipeline_reg;

    always @(posedge clk) begin
        // Port A: Ghi dữ liệu (Dựa vào wr_side)
        if (s_axis_tvalid && s_axis_tready) begin
            if (wr_side == 1'b0) ram_ping[wr_ptr] <= s_axis_tdata;
            else                 ram_pong[wr_ptr] <= s_axis_tdata;
        end
        
        // Port B: Đọc dữ liệu (Dựa vào rd_side)
        if (rd_side == 1'b0) bram_out_reg <= ram_ping[rd_addr];
        else                 bram_out_reg <= ram_pong[rd_addr];
        
        // Giữ nguyên Pipeline 2 nhịp trễ
        pipeline_reg <= bram_out_reg;
    end

    assign rd_data = pipeline_reg;

endmodule
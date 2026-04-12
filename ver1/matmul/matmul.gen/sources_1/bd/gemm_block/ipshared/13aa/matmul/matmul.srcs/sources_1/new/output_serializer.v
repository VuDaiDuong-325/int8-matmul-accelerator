`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/02/2026 01:35:32 PM
// Design Name: 
// Module Name: output_serializer
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
module output_serializer #(
    parameter N = 16
)(
    input wire clk, 
    input wire rst_n,
    
    input wire mac_done_trigger,
    input wire [(N*32)-1:0] bottom_row_in,
    input wire fifo_full,
    
    output reg drain_en_array,
    output reg [31:0] fifo_din,
    output reg fifo_wr_en
);
    
    // Đã mở rộng State Machine để xử lý Timing chuẩn xác
    localparam IDLE       = 3'd0;
    localparam LATCH_ROW  = 3'd1;
    localparam WRITE_FIFO = 3'd2;
    localparam SHIFT_ROW  = 3'd3;
    localparam WAIT_DROP  = 3'd4;
    
    reg [2:0] state;
    reg [4:0] row_cnt;
    reg [4:0] col_cnt;

    reg [(N*32)-1:0] shift_reg;

    always @(posedge clk) begin
        if (!rst_n) begin
            state <= IDLE;
            row_cnt <= 0;
            col_cnt <= 0;
            drain_en_array <= 1'b0;
            fifo_wr_en <= 1'b0;
            fifo_din <= 0;
            shift_reg <= 0;
        end else begin
            // Mặc định luôn dập cờ
            drain_en_array <= 1'b0;
            fifo_wr_en <= 1'b0;
            
            case (state)
                IDLE: begin
                    row_cnt <= 0;
                    col_cnt <= 0;
                    if (mac_done_trigger) begin
                        // [FIX 1] Thay vì chụp ngay, nhảy sang state chờ 1 nhịp 
                        // để hold_psum của PE_15_15 kịp chốt dữ liệu
                        state <= LATCH_ROW; 
                    end
                end
                
                LATCH_ROW: begin
                    shift_reg <= bottom_row_in; // Chụp dữ liệu an toàn!
                    state <= WRITE_FIFO;
                end
                
                WRITE_FIFO: begin
                    if (!fifo_full) begin
                        fifo_wr_en <= 1'b1;
                        fifo_din <= shift_reg[31:0];
                        shift_reg <= {{32{1'b0}}, shift_reg[(N*32)-1 : 32]};
                        
                        if (col_cnt == N - 1) begin
                            col_cnt <= 0;
                            if (row_cnt == N - 1) begin
                                state <= IDLE; 
                            end else begin
                                row_cnt <= row_cnt + 1;
                                state <= SHIFT_ROW; 
                            end
                        end else begin
                            col_cnt <= col_cnt + 1;
                        end
                    end
                end
                
                SHIFT_ROW: begin
                    drain_en_array <= 1'b1; // Ra lệnh mảng rớt xuống 1 hàng
                    state <= WAIT_DROP;
                end

                WAIT_DROP: begin
                    // [FIX 2] Cần chờ 1 nhịp ở đây để flip-flop hàng trên rơi lọt xuống hàng đáy
                    // Sang nhịp tiếp theo (LATCH_ROW) chụp là vừa đẹp
                    state <= LATCH_ROW;
                end
            endcase
        end
    end
endmodule
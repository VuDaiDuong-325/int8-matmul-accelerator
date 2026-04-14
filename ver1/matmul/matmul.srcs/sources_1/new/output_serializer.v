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
    output reg [(N*32)-1:0] fifo_din, // Băng thông đã lên 512-bit
    output reg fifo_wr_en
);
    
    localparam IDLE       = 3'd0;
    localparam LATCH_ROW  = 3'd1;
    localparam WRITE_FIFO = 3'd2;
    localparam SHIFT_ROW  = 3'd3;
    localparam WAIT_DROP  = 3'd4;
    
    reg [2:0] state;
    reg [4:0] row_cnt;

    always @(posedge clk) begin
        if (!rst_n) begin
            state <= IDLE;
            row_cnt <= 0;
            drain_en_array <= 1'b0;
            fifo_wr_en <= 1'b0;
            fifo_din <= 0;
        end else begin
            drain_en_array <= 1'b0;
            fifo_wr_en <= 1'b0;
            
            case (state)
                IDLE: begin
                    row_cnt <= 0;
                    if (mac_done_trigger) begin
                        state <= LATCH_ROW; 
                    end
                end
                
                LATCH_ROW: begin
                    // Đợi 1 nhịp cho Flip-flop của PE chốt kết quả an toàn
                    state <= WRITE_FIFO;
                end
                
                WRITE_FIFO: begin
                    if (!fifo_full) begin
                        fifo_wr_en <= 1'b1;
                        fifo_din <= bottom_row_in; // Bắn 1 phát 512-bit vào FIFO
                        
                        if (row_cnt == N - 1) begin
                            state <= IDLE; // Xả xong 16 hàng
                        end else begin
                            row_cnt <= row_cnt + 1;
                            state <= SHIFT_ROW; // Ra lệnh rớt hàng
                        end
                    end
                end
                
                SHIFT_ROW: begin
                    drain_en_array <= 1'b1; 
                    state <= WAIT_DROP;
                end

                WAIT_DROP: begin
                    // Đợi 1 nhịp cho hàng trên rơi lọt xuống hàng đáy
                    state <= LATCH_ROW; 
                end
            endcase
        end
    end
endmodule
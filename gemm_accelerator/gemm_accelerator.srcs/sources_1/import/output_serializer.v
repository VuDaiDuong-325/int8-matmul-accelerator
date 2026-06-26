`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: output_serializer
// Fix: Delay fifo_wr_en by 1 cycle to prevent duplicate Row 15
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
    output reg [(N*32)-1:0] fifo_din,
    output reg fifo_wr_en,
    output wire serializer_busy
);
 
    localparam IDLE    = 1'd0;
    localparam WRITING = 1'd1;
 
    reg        state;
    reg [4:0]  row_cnt;
 
    assign serializer_busy = (state != IDLE) || mac_done_trigger;
 
    always @(posedge clk) begin
        if (!rst_n) begin
            state          <= IDLE;
            drain_en_array <= 1'b0;
            fifo_wr_en     <= 1'b0;
            fifo_din       <= 0;
            row_cnt        <= 5'd0;
        end else begin
            case (state)
                IDLE: begin
                    if (mac_done_trigger) begin
                        drain_en_array <= 1'b1;
                        fifo_wr_en     <= 1'b0;  // FIX: Đợi 1 nhịp, không ghi ngay để tránh lặp Row 15
                        row_cnt        <= 5'd0;
                        state          <= WRITING;
                    end else begin
                        drain_en_array <= 1'b0;
                        fifo_wr_en     <= 1'b0;
                    end
                end
 
                WRITING: begin
                    fifo_din   <= bottom_row_in;
                    fifo_wr_en <= 1'b1;          // FIX: Bắt đầu ghi từ đây
 
                    // Chạy từ 0 đến 15 (đủ 16 hàng)
                    if (row_cnt == N[4:0] - 1) begin
                        drain_en_array <= 1'b0;
                        state          <= IDLE;
                    end else begin
                        row_cnt <= row_cnt + 5'd1;
                    end
                end
                
                default: state <= IDLE;
            endcase
        end
    end
endmodule
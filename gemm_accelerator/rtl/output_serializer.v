`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: output_serializer
// Fix: Delay fifo_wr_en by 1 cycle to prevent duplicate Row 15
//////////////////////////////////////////////////////////////////////////////////

module output_serializer #(
    parameter N = 16
)(
    input wire CLK_i,
    input wire RST_i,
    input wire mac_done_trigger_i,
    input wire [(N*32)-1:0] bottom_row_i,
    input wire fifo_full_i,
 
    output reg drain_en_array_o,
    output reg [(N*32)-1:0] fifo_din_o,
    output reg fifo_wr_en_o,
    output wire serializer_busy_o
);
 
    localparam IDLE    = 1'd0;
    localparam WRITING = 1'd1;
 
    reg        state_r;
    reg [4:0]  row_cnt_r;
 
    assign serializer_busy_o = (state_r != IDLE) || mac_done_trigger_i;
 
    always @(posedge CLK_i) begin
        if (!RST_i) begin
            state_r          <= IDLE;
            drain_en_array_o <= 1'b0;
            fifo_wr_en_o     <= 1'b0;
            fifo_din_o       <= 0;
            row_cnt_r        <= 5'd0;
        end else begin
            case (state_r)
                IDLE: begin
                    if (mac_done_trigger_i) begin
                        drain_en_array_o <= 1'b1;
                        fifo_wr_en_o     <= 1'b0;  // FIX: Đợi 1 nhịp, không ghi ngay để tránh lặp Row 15
                        row_cnt_r        <= 5'd0;
                        state_r          <= WRITING;
                    end else begin
                        drain_en_array_o <= 1'b0;
                        fifo_wr_en_o     <= 1'b0;
                    end
                end
 
                WRITING: begin
                    fifo_din_o   <= bottom_row_i;
                    fifo_wr_en_o <= 1'b1;          // FIX: Bắt đầu ghi từ đây
 
                    // Chạy từ 0 đến 15 (đủ 16 hàng)
                    if (row_cnt_r == N[4:0] - 1) begin
                        drain_en_array_o <= 1'b0;
                        state_r          <= IDLE;
                    end else begin
                        row_cnt_r <= row_cnt_r + 5'd1;
                    end
                end
                
                default: state_r <= IDLE;
            endcase
        end
    end
endmodule
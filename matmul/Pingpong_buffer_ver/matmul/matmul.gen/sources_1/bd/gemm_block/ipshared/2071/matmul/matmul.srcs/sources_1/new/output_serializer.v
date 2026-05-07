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
    output reg [(N*32)-1:0] fifo_din,
    output reg fifo_wr_en,
    output wire serializer_busy
);
    
    localparam IDLE     = 2'd0;
    localparam SHIFTING = 2'd1;
    localparam WRITING  = 2'd2;
    
    reg [2:0] state;
    reg [4:0] row_cnt;
    
    // [FIX] Thanh ghi tạo độ trễ 1 nhịp cho cờ Trigger
    reg mac_done_reg; 

    // Cờ busy phải bao trùm cả nhịp trễ để FSM không bơm data sớm
    assign serializer_busy = (state != IDLE) || mac_done_trigger || mac_done_reg;

    always @(posedge clk) begin
        if (!rst_n) begin
            state <= IDLE;
            drain_en_array <= 0;
            fifo_wr_en <= 0;
            row_cnt <= 0;
            mac_done_reg <= 0;
        end else begin
            // Latch tín hiệu để chờ C[15][15] cập nhật xong hold_psum
            mac_done_reg <= mac_done_trigger; 

            case (state)
                IDLE: begin
                    fifo_wr_en <= 0;
                    drain_en_array <= 0;
                    row_cnt <= 0;
                    
                    // Bắt đầu chụp và xả bằng tín hiệu ĐÃ TRỄ 1 NHỊP
                    if (mac_done_reg) begin 
                        fifo_din <= bottom_row_in; 
                        fifo_wr_en <= 1'b1; 
                        drain_en_array <= 1'b1; 
                        row_cnt <= 1;
                        state <= SHIFTING;
                    end
                end
                
                SHIFTING: begin
                    fifo_wr_en <= 0; 
                    drain_en_array <= 1'b1; 
                    state <= WRITING;
                end
                
                WRITING: begin
                    fifo_din <= bottom_row_in; 
                    fifo_wr_en <= 1'b1; 
                    
                    if (row_cnt == N) begin
                        fifo_wr_en <= 0;
                        drain_en_array <= 0;
                        state <= IDLE; 
                    end else begin
                        row_cnt <= row_cnt + 1;
                    end
                end
            endcase
        end
    end
endmodule
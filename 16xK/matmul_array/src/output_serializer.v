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
    input wire clk, rst_n,
    input wire [(N*N*32)-1:0] psum_matrix,
    input wire [(N*N)-1:0] vld_matrix,
    output reg [31:0] fifo_din,
    output reg fifo_wr_en
    );
    
    localparam TOTAL_PE = N*N;
    reg [31:0] holding_reg [TOTAL_PE-1:0];
    integer i;
    
    always @(posedge clk or negedge rst_n) begin 
        if (!rst_n) begin 
            for (i = 0; i < TOTAL_PE; i = i + 1)
                holding_reg[i] <= 32'd0; 
        end
        else begin 
            for (i = 0; i < TOTAL_PE; i = i + 1) begin 
                if (vld_matrix[i])
                    holding_reg[i] <= psum_matrix[i*32 +: 32];
            end
        end
    end
    
    localparam GATHER = 1'b0;
    localparam SHIFT = 1'b1;
    reg  state;
    reg [$clog2(TOTAL_PE):0] count;
    
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin 
            state <= GATHER;
            count <= 0;
            fifo_din <= 32'd0;
            fifo_wr_en <= 1'd0;
        end
        else begin 
            case (state)
                GATHER: begin
                    fifo_wr_en <= 1'd0;
                    
                    if (vld_matrix[TOTAL_PE-1] == 1'd1) begin 
                        state <= SHIFT;
                        count <= 0;
                    end
                end
                SHIFT: begin 
                    fifo_wr_en <= 1'd1;
                    fifo_din <= holding_reg[count];
                    
                    if (count == TOTAL_PE-1) begin
                        state <= GATHER;
                        count <= 0;
                    end
                    else 
                        count <= count + 1;
                end
            endcase
        end
    end
endmodule

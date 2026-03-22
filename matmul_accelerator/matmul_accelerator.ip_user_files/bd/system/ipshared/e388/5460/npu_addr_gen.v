`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/22/2026 08:05:55 PM
// Design Name: 
// Module Name: npu_addr_gen
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


module npu_addr_gen #(
    parameter DEPTH = 1024
)(
    input  wire clk,
    input  wire rst_n,
    input  wire start_i,       // Nối với npu_start từ Control Unit
    input  wire [15:0] k_size, // Độ dài ma trận cần tính
    
    output reg [$clog2(DEPTH)-1:0] rd_addr,
    output reg                     rd_en,
    output reg                     busy        // Báo hiệu đang trong quá trình đọc
);

    localparam [1:0] IDLE = 2'b00;
    localparam [1:0] READ = 2'b01;
    localparam [1:0] DONE = 2'b11;
    reg [1:0] state, next_state;
    
    
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) state <= IDLE;
        else state <= next_state;
    end

    always @(*) begin
        next_state = state;
        case (state)
            IDLE: if (start_i) next_state = READ;
            READ: if (rd_addr == k_size - 1) next_state = DONE;
            DONE: next_state = IDLE;
        endcase
    end

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            rd_addr <= 0;
            rd_en   <= 0;
            busy    <= 0;
        end else begin
            case (state)
                IDLE: begin
                    rd_addr <= 0;
                    rd_en   <= 0;
                    busy    <= 0;
                end
                READ: begin
                    rd_en   <= 1;
                    busy    <= 1;
                    if (rd_addr < k_size - 1)
                        rd_addr <= rd_addr + 1;
                end
                DONE: begin
                    rd_en   <= 0;
                    busy    <= 0;
                end
            endcase
        end
    end
endmodule

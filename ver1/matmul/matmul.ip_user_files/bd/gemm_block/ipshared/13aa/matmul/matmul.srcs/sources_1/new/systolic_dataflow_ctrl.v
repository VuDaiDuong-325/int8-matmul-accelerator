`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/02/2026 02:27:18 PM
// Design Name: 
// Module Name: systolic_dataflow_ctrl
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

module systolic_dataflow_ctrl #(
    parameter N = 16,
    parameter DATA_WIDTH = 8,
    parameter BRAM_DEPTH = 1024
)(
    input  wire        clk,
    input  wire        rst_n,
    input  wire [31:0] k_dim_config, 
    input  wire        bram_ready_A,
    input  wire        bram_ready_B,
    output reg         clear_bram_ready,
    output reg  [$clog2(BRAM_DEPTH)-1:0] bram_rd_addr,
    input  wire [(N*DATA_WIDTH)-1:0] bram_data_A, 
    input  wire [(N*DATA_WIDTH)-1:0] bram_data_B, 
    
    output wire [(N*DATA_WIDTH)-1:0] skewed_data_A,
    output wire [(N*DATA_WIDTH)-1:0] skewed_data_B,
    output reg         valid_delay,
    output reg         clear_delay,
    output reg         last_mac_delay
);

    localparam IDLE = 2'd0;
    localparam RUN  = 2'd1;
    localparam DONE = 2'd2;

    reg [1:0] state;
    reg [31:0] k_cnt;
    
    // [FIX TIMING]: Đã xóa bỏ các thanh ghi d2 để khớp với độ trễ 2 nhịp của BRAM
    reg vld_d1;
    reg clr_d1;
    reg lst_d1;

    wire curr_vld = (state == RUN);
    wire curr_clr = (state == RUN) && (k_cnt == 0);
    wire curr_lst = (state == RUN) && (k_cnt == k_dim_config - 1);

    always @(posedge clk) begin
        if (!rst_n) begin
            state <= IDLE;
            k_cnt <= 0;
            bram_rd_addr <= 0;
            clear_bram_ready <= 0;
            
            vld_d1 <= 0; valid_delay <= 0;
            clr_d1 <= 0; clear_delay <= 0;
            lst_d1 <= 0; last_mac_delay <= 0;
        end else begin
            // [FIX TIMING]: Trễ chính xác 2 nhịp Clock
            vld_d1 <= curr_vld; valid_delay <= vld_d1;
            clr_d1 <= curr_clr; clear_delay <= clr_d1;
            lst_d1 <= curr_lst; last_mac_delay <= lst_d1;
            
            clear_bram_ready <= 0;

            case (state)
                IDLE: begin
                    k_cnt <= 0;
                    bram_rd_addr <= 0;
                    if (bram_ready_A && bram_ready_B) begin
                        state <= RUN;
                    end
                end
                
                RUN: begin
                    if (k_cnt == k_dim_config - 1) begin
                        state <= DONE;
                        clear_bram_ready <= 1'b1;
                    end else begin
                        k_cnt <= k_cnt + 1;
                        bram_rd_addr <= bram_rd_addr + 1;
                    end
                end
                
                DONE: begin
                    state <= IDLE;
                end
            endcase
        end
    end

    assign skewed_data_A = bram_data_A;
    assign skewed_data_B = bram_data_B;

endmodule
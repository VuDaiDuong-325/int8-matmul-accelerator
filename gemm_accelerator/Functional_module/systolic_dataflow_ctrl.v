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
    input  wire        CLK_i,
    input  wire        RST_i,
    input  wire [31:0] k_dim_config_i, 
    input  wire        bram_ready_A_i,
    input  wire        bram_ready_B_i,
    input  wire        serializer_busy_i,
    output reg         clear_bram_ready_o,
    output reg  [$clog2(BRAM_DEPTH)-1:0] bram_rd_addr_o,
    input  wire [(N*DATA_WIDTH)-1:0] bram_data_A_i, 
    input  wire [(N*DATA_WIDTH)-1:0] bram_data_B_i, 
    
    output wire [(N*DATA_WIDTH)-1:0] skewed_data_A_o,
    output wire [(N*DATA_WIDTH)-1:0] skewed_data_B_o,
    output reg         valid_delay_o,
    output reg         clear_delay_o,
    output reg         last_mac_delay_o
);

    // Bổ sung 2 trạng thái Chờ (Stall) cực kỳ quan trọng
    localparam IDLE = 3'd0;
    localparam RUN  = 3'd1;
    localparam DONE = 3'd2;
    localparam WAIT_SER_HIGH = 3'd3; 
    localparam WAIT_SER_LOW  = 3'd4; 

    reg [2:0] state_r;
    reg [31:0] k_cnt_r;

    // Logic tạo cờ chỉ kích hoạt khi State == RUN
    wire curr_vld_w = (state_r == RUN);
    wire curr_clr_w = (state_r == RUN && k_cnt_r == 0);
    wire curr_lst_w = (state_r == RUN && k_cnt_r == k_dim_config_i - 1);

    reg vld_d1_r, clr_d1_r, lst_d1_r;

    assign skewed_data_A_o = bram_data_A_i;
    assign skewed_data_B_o = bram_data_B_i;

    always @(posedge CLK_i) begin
        if (!RST_i) begin
            state_r <= IDLE;
            k_cnt_r <= 0;
            bram_rd_addr_o <= 0;
            clear_bram_ready_o <= 0;
            
            vld_d1_r <= 0; valid_delay_o <= 0;
            clr_d1_r <= 0; clear_delay_o <= 0;
            lst_d1_r <= 0; last_mac_delay_o <= 0;
        end else begin
            vld_d1_r <= curr_vld_w; valid_delay_o <= vld_d1_r;
            clr_d1_r <= curr_clr_w; clear_delay_o <= clr_d1_r;
            lst_d1_r <= curr_lst_w; last_mac_delay_o <= lst_d1_r;
            
            clear_bram_ready_o <= 0;

            case (state_r)
                IDLE: begin
                    k_cnt_r <= 0;
                    bram_rd_addr_o <= 0;
                    if (bram_ready_A_i && bram_ready_B_i) begin
                        state_r <= RUN;
                    end
                end
                
                RUN: begin
                    if (k_cnt_r == k_dim_config_i - 1) begin
                        state_r <= DONE;
                        clear_bram_ready_o <= 1'b1; 
                    end else begin
                        k_cnt_r <= k_cnt_r + 1;
                        bram_rd_addr_o <= bram_rd_addr_o + 1;
                    end
                end
                
                DONE: begin
                    state_r <= WAIT_SER_HIGH;
                end
                
                WAIT_SER_HIGH: begin
                    if (serializer_busy_i) begin
                        state_r <= WAIT_SER_LOW;
                    end
                end
                
                WAIT_SER_LOW: begin
                    if (!serializer_busy_i) begin
                        state_r <= IDLE;
                    end
                end
                
                default: state_r <= IDLE;
            endcase
        end
    end
endmodule
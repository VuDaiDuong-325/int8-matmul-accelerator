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
    parameter DATA_WIDTH = 8
)(
    input  wire        clk,
    input  wire        rst_n,
    input  wire [31:0] k_dim,

    input  wire        fifo_empty_A,
    input  wire        fifo_empty_B,
    output wire        fifo_rd_en_A,
    output wire        fifo_rd_en_B,
    input  wire [(N*DATA_WIDTH)-1:0] fifo_data_A, 
    input  wire [(N*DATA_WIDTH)-1:0] fifo_data_B, 

    output wire [(N*DATA_WIDTH)-1:0] skewed_data_A,
    output wire [(N*DATA_WIDTH)-1:0] skewed_data_B,
    output wire [N-1:0]  skewed_valid_in,
    output wire [N-1:0]  skewed_clear_acc
);

    wire run_en;
    reg [31:0] k_cnt;
    reg base_valid;
    reg base_clear;

    assign run_en = (~fifo_empty_A) & (~fifo_empty_B);
    assign fifo_rd_en_A = run_en;
    assign fifo_rd_en_B = run_en;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            k_cnt      <= 32'd0;
            base_valid <= 1'b0;
            base_clear <= 1'b0;
        end else begin
            if (run_en) begin
                base_valid <= 1'b1;
                if (k_cnt == k_dim - 1) begin
                    k_cnt      <= 16'd0;
                    base_clear <= 1'b1;
                end else begin
                    k_cnt      <= k_cnt + 1'b1;
                    base_clear <= 1'b0;
                end
            end else begin
                base_valid <= 1'b0;
                base_clear <= 1'b0;
            end
        end
    end

    skew_network #(
        .N(N),
        .DATA_WIDTH(DATA_WIDTH)
    ) u_skew_network (
        .clk        (clk),
        .rst_n      (rst_n),
        
        .data_A_in  (fifo_data_A),
        .data_B_in  (fifo_data_B),
        .valid_in   (base_valid),
        .clear_in   (base_clear),
        
        .data_A_out (skewed_data_A),
        .data_B_out (skewed_data_B),
        .valid_out  (skewed_valid_in),
        .clear_out  (skewed_clear_acc)
    );

endmodule
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/22/2026 11:46:24 AM
// Design Name: 
// Module Name: gemm_compute_core
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


module gemm_compute_core #(
    parameter N          = 16,
    parameter DATA_WIDTH = 8,
    parameter FIFO_DEPTH = 1024,
    parameter BRAM_DEPTH = 1024
)(
    input  wire        aclk,
    input  wire        aresetn,
 
    // ── Config ────────────────────────────────────────────────────────────
    input  wire [31:0] k_dim,          // Số bước K mỗi systolic pass
    input  wire [31:0] num_k_tiles,    // Số tiles tích lũy TRONG MỘT K-BLOCK
                                        // (= K_BLK / k_dim, KHÔNG phải K_total/k_dim)
 
    // ── AXI-Stream Slave A ───────────────────────────────────────────────
    input  wire [(N*DATA_WIDTH)-1:0] s_axis_a_tdata,
    input  wire                      s_axis_a_tvalid,
    output wire                      s_axis_a_tready,
    input  wire                      s_axis_a_tlast,
 
    // ── AXI-Stream Slave B ───────────────────────────────────────────────
    input  wire [(N*DATA_WIDTH)-1:0] s_axis_b_tdata,
    input  wire                      s_axis_b_tvalid,
    output wire                      s_axis_b_tready,
    input  wire                      s_axis_b_tlast,
 
    // ── AXI-Stream Master C32 (INT32, TRƯỚC rescale) ────────────────────
    output wire [(N*32)-1:0]         m_axis_c32_tdata,
    output wire                      m_axis_c32_tvalid,
    input  wire                      m_axis_c32_tready,
    output wire                      m_axis_c32_tlast,   // 1 ở hàng cuối (hàng 15 trong thứ tự xuất)
    output wire                      m_axis_c32_tuser    // 1 ở hàng đầu (SOF)
);
 
    // =========================================================================
    // INTERNAL WIRES (giống hệt gemm_accelerator.v stage 1-7)
    // =========================================================================
    wire bram_ready_A, bram_ready_B, clear_bram_ready;
    wire [$clog2(BRAM_DEPTH)-1:0] bram_rd_addr;
    wire [(N*DATA_WIDTH)-1:0] bram_data_A, bram_data_B;
 
    wire [(N*DATA_WIDTH)-1:0] pre_skew_A, pre_skew_B;
    wire  pre_skew_valid, pre_skew_clear, pre_skew_last;
 
    wire [(N*DATA_WIDTH)-1:0] array_data_A, array_data_B;
    wire [N-1:0] array_valid, array_clear, array_last_mac;
 
    wire drain_en_array;
    wire [(N*32)-1:0] bottom_row_out;
    wire mac_done_trigger;
 
    wire [(N*32)-1:0] fifo_din, fifo_dout;
    wire fifo_wr_en, fifo_full, fifo_empty;
    wire serializer_busy;
 
    wire post_acc_s_tready;
    wire safe_fifo_rd = post_acc_s_tready & ~fifo_empty;
 
    // =========================================================================
    // 1. BRAM INPUT BUFFER A & B (Ping-Pong Double Buffer)
    // =========================================================================
    bram_input_buffer #(
        .DATA_WIDTH(N*DATA_WIDTH), .DEPTH(BRAM_DEPTH)
    ) bram_A (
        .clk(aclk), .rst_n(aresetn), .chunk_len(k_dim[29:0]),
        .s_axis_tdata(s_axis_a_tdata), .s_axis_tvalid(s_axis_a_tvalid),
        .s_axis_tready(s_axis_a_tready), .s_axis_tlast(s_axis_a_tlast),
        .rd_addr(bram_rd_addr), .rd_data(bram_data_A),
        .block_ready(bram_ready_A), .clear_ready(clear_bram_ready));
 
    bram_input_buffer #(
        .DATA_WIDTH(N*DATA_WIDTH), .DEPTH(BRAM_DEPTH)
    ) bram_B (
        .clk(aclk), .rst_n(aresetn), .chunk_len(k_dim[29:0]),
        .s_axis_tdata(s_axis_b_tdata), .s_axis_tvalid(s_axis_b_tvalid),
        .s_axis_tready(s_axis_b_tready), .s_axis_tlast(s_axis_b_tlast),
        .rd_addr(bram_rd_addr), .rd_data(bram_data_B),
        .block_ready(bram_ready_B), .clear_ready(clear_bram_ready));
 
    // =========================================================================
    // 2. SYSTOLIC DATAFLOW CONTROLLER
    // =========================================================================
    systolic_dataflow_ctrl #(
        .N(N), .DATA_WIDTH(DATA_WIDTH), .BRAM_DEPTH(BRAM_DEPTH)
    ) ctrl_inst (
        .clk(aclk), .rst_n(aresetn), .k_dim_config(k_dim),
        .bram_ready_A(bram_ready_A), .bram_ready_B(bram_ready_B),
        .serializer_busy(serializer_busy),
        .clear_bram_ready(clear_bram_ready),
        .bram_rd_addr(bram_rd_addr),
        .bram_data_A(bram_data_A), .bram_data_B(bram_data_B),
        .skewed_data_A(pre_skew_A), .skewed_data_B(pre_skew_B),
        .valid_delay(pre_skew_valid),
        .clear_delay(pre_skew_clear),
        .last_mac_delay(pre_skew_last));
 
    // =========================================================================
    // 3. SKEW NETWORK
    // =========================================================================
    skew_network #(
        .N(N), .DATA_WIDTH(DATA_WIDTH)
    ) skew_inst (
        .clk(aclk), .rst_n(aresetn),
        .data_A_in(pre_skew_A), .data_B_in(pre_skew_B),
        .valid_in(pre_skew_valid),
        .clear_in(pre_skew_clear),
        .last_mac_in(pre_skew_last),
        .data_A_out(array_data_A), .data_B_out(array_data_B),
        .valid_out(array_valid), .clear_out(array_clear),
        .last_mac_out(array_last_mac));
 
    // =========================================================================
    // 4. SYSTOLIC ARRAY 16×16
    // =========================================================================
    systolic_array_os #(
        .ARRAY_SIZE(N)
    ) systolic_array_inst (
        .clk(aclk), .rst_n(aresetn),
        .valid_in_left(array_valid),
        .clear_acc_left(array_clear),
        .last_mac_in_left(array_last_mac),
        .act_in_left(array_data_A),
        .weight_in_top(array_data_B),
        .drain_en_array(drain_en_array),
        .bottom_row_out(bottom_row_out),
        .mac_done_trigger(mac_done_trigger));
 
    // =========================================================================
    // 5. OUTPUT SERIALIZER (drain systolic → FIFO C)
    // =========================================================================
    output_serializer #(
        .N(N)
    ) serializer_inst (
        .clk(aclk), .rst_n(aresetn),
        .mac_done_trigger(mac_done_trigger),
        .bottom_row_in(bottom_row_out),
        .fifo_full(fifo_full),
        .drain_en_array(drain_en_array),
        .fifo_din(fifo_din),
        .fifo_wr_en(fifo_wr_en),
        .serializer_busy(serializer_busy));
 
    // =========================================================================
    // 6. FIFO C
    // =========================================================================
    sc_fifo_fwft #(
        .DATA_WIDTH(N*32), .DEPTH(FIFO_DEPTH)
    ) fifo_C_inst (
        .clk(aclk), .rst_n(aresetn),
        .wr_en(fifo_wr_en), .din(fifo_din), .full(fifo_full),
        .rd_en(safe_fifo_rd), .dout(fifo_dout), .empty(fifo_empty));
 
    // =========================================================================
    // 7. POST ACCUMULATOR - tích lũy num_k_tiles tiles INT32
    //    (num_k_tiles ở đây = K_BLK / k_dim, MỘT K-block, không phải K_total)
    //    Output INT32 XUẤT THẲNG ra ngoài - KHÔNG qua rescale (khác gemm_accelerator)
    // =========================================================================
    post_accumulator #(
        .N(N), .DATA_W(32)
    ) post_acc_inst (
        .clk(aclk), .rst_n(aresetn),
        .num_k_tiles(num_k_tiles),
 
        .s_axis_tdata (fifo_dout),
        .s_axis_tvalid(~fifo_empty),
        .s_axis_tready(post_acc_s_tready),
        .s_axis_tlast (1'b0),
 
        // Master - XUẤT THẲNG ra ngoài module (không có stage 8 rescale)
        .m_axis_tdata (m_axis_c32_tdata),
        .m_axis_tvalid(m_axis_c32_tvalid),
        .m_axis_tready(m_axis_c32_tready),
        .m_axis_tlast (m_axis_c32_tlast),
        .m_axis_tuser (m_axis_c32_tuser));
 
endmodule

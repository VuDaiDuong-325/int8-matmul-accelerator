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
    input  wire        CLK_i,
    input  wire        RST_i,
 
    // ── Config ────────────────────────────────────────────────────────────
    input  wire [31:0] k_dim_i,          // Số bước K mỗi systolic pass
    input  wire [31:0] num_k_tiles_i,    // Số tiles tích lũy TRONG MỘT K-BLOCK
                                        // (= K_BLK / k_dim, KHÔNG phải K_total/k_dim)
 
    // ── AXI-Stream Slave A ───────────────────────────────────────────────
    input  wire [(N*DATA_WIDTH)-1:0] s_axis_a_tdata_i,
    input  wire                      s_axis_a_tvalid_i,
    output wire                      s_axis_a_tready_o,
    input  wire                      s_axis_a_tlast_i,
 
    // ── AXI-Stream Slave B ───────────────────────────────────────────────
    input  wire [(N*DATA_WIDTH)-1:0] s_axis_b_tdata_i,
    input  wire                      s_axis_b_tvalid_i,
    output wire                      s_axis_b_tready_o,
    input  wire                      s_axis_b_tlast_i,
 
    // ── AXI-Stream Master C32 (INT32, TRƯỚC rescale) ────────────────────
    output wire [(N*32)-1:0]         m_axis_c32_tdata_o,
    output wire                      m_axis_c32_tvalid_o,
    input  wire                      m_axis_c32_tready_i,
    output wire                      m_axis_c32_tlast_o,   // 1 ở hàng cuối (hàng 15 trong thứ tự xuất)
    output wire                      m_axis_c32_tuser_o    // 1 ở hàng đầu (SOF)
);
 
    // =========================================================================
    // INTERNAL WIRES (giống hệt gemm_accelerator.v stage 1-7)
    // =========================================================================
    wire bram_ready_A_w, bram_ready_B_w, clear_bram_ready_w;
    wire [$clog2(BRAM_DEPTH)-1:0] bram_rd_addr_w;
    wire [(N*DATA_WIDTH)-1:0] bram_data_A_w, bram_data_B_w;
 
    wire [(N*DATA_WIDTH)-1:0] pre_skew_A_w, pre_skew_B_w;
    wire  pre_skew_valid_w, pre_skew_clear_w, pre_skew_last_w;
 
    wire [(N*DATA_WIDTH)-1:0] array_data_A_w, array_data_B_w;
    wire [N-1:0] array_valid_w, array_clear_w, array_last_mac_w;
 
    wire drain_en_array_w;
    wire [(N*32)-1:0] bottom_row_w;
    wire mac_done_trigger_w;
 
    wire [(N*32)-1:0] fifo_din_w, fifo_dout_w;
    wire fifo_wr_en_w, fifo_full_w, fifo_empty_w;
    wire serializer_busy_w;
 
    wire post_acc_s_tready_w;
    wire safe_fifo_rd_w = post_acc_s_tready_w & ~fifo_empty_w;
 
    // =========================================================================
    // 1. BRAM INPUT BUFFER A & B (Ping-Pong Double Buffer)
    // =========================================================================
    bram_input_buffer #(
        .DATA_WIDTH(N*DATA_WIDTH), .DEPTH(BRAM_DEPTH)
    ) u_bram_input_buffer_a (
        .CLK_i(CLK_i), .RST_i(RST_i), .chunk_len_i(k_dim_i[29:0]),
        .s_axis_tdata_i(s_axis_a_tdata_i), .s_axis_tvalid_i(s_axis_a_tvalid_i),
        .s_axis_tready_o(s_axis_a_tready_o), .s_axis_tlast_i(s_axis_a_tlast_i),
        .rd_addr_i(bram_rd_addr_w), .rd_data_o(bram_data_A_w),
        .block_ready_o(bram_ready_A_w), .clear_ready_i(clear_bram_ready_w));
 
    bram_input_buffer #(
        .DATA_WIDTH(N*DATA_WIDTH), .DEPTH(BRAM_DEPTH)
    ) u_bram_input_buffer_b (
        .CLK_i(CLK_i), .RST_i(RST_i), .chunk_len_i(k_dim_i[29:0]),
        .s_axis_tdata_i(s_axis_b_tdata_i), .s_axis_tvalid_i(s_axis_b_tvalid_i),
        .s_axis_tready_o(s_axis_b_tready_o), .s_axis_tlast_i(s_axis_b_tlast_i),
        .rd_addr_i(bram_rd_addr_w), .rd_data_o(bram_data_B_w),
        .block_ready_o(bram_ready_B_w), .clear_ready_i(clear_bram_ready_w));
 
    // =========================================================================
    // 2. SYSTOLIC DATAFLOW CONTROLLER
    // =========================================================================
    systolic_dataflow_ctrl #(
        .N(N), .DATA_WIDTH(DATA_WIDTH), .BRAM_DEPTH(BRAM_DEPTH)
    ) u_systolic_dataflow_ctrl (
        .CLK_i(CLK_i), .RST_i(RST_i), .k_dim_config_i(k_dim_i),
        .bram_ready_A_i(bram_ready_A_w), .bram_ready_B_i(bram_ready_B_w),
        .serializer_busy_i(serializer_busy_w),
        .clear_bram_ready_o(clear_bram_ready_w),
        .bram_rd_addr_o(bram_rd_addr_w),
        .bram_data_A_i(bram_data_A_w), .bram_data_B_i(bram_data_B_w),
        .skewed_data_A_o(pre_skew_A_w), .skewed_data_B_o(pre_skew_B_w),
        .valid_delay_o(pre_skew_valid_w),
        .clear_delay_o(pre_skew_clear_w),
        .last_mac_delay_o(pre_skew_last_w));
 
    // =========================================================================
    // 3. SKEW NETWORK
    // =========================================================================
    skew_network #(
        .N(N), .DATA_WIDTH(DATA_WIDTH)
    ) u_skew_network (
        .CLK_i(CLK_i), .RST_i(RST_i),
        .data_A_i(pre_skew_A_w), .data_B_i(pre_skew_B_w),
        .valid_i(pre_skew_valid_w),
        .clear_i(pre_skew_clear_w),
        .last_mac_i(pre_skew_last_w),
        .data_A_o(array_data_A_w), .data_B_o(array_data_B_w),
        .valid_o(array_valid_w), .clear_o(array_clear_w),
        .last_mac_o(array_last_mac_w));
 
    // =========================================================================
    // 4. SYSTOLIC ARRAY 16×16
    // =========================================================================
    systolic_array_os #(
        .ARRAY_SIZE(N)
    ) u_systolic_array_os (
        .CLK_i(CLK_i), .RST_i(RST_i),
        .valid_left_i(array_valid_w),
        .clear_acc_left_i(array_clear_w),
        .last_mac_left_i(array_last_mac_w),
        .act_left_i(array_data_A_w),
        .weight_top_i(array_data_B_w),
        .drain_en_array_i(drain_en_array_w),
        .bottom_row_o(bottom_row_w),
        .mac_done_trigger_o(mac_done_trigger_w));
 
    // =========================================================================
    // 5. OUTPUT SERIALIZER (drain systolic → FIFO C)
    // =========================================================================
    output_serializer #(
        .N(N)
    ) u_output_serializer (
        .CLK_i(CLK_i), .RST_i(RST_i),
        .mac_done_trigger_i(mac_done_trigger_w),
        .bottom_row_i(bottom_row_w),
        .fifo_full_i(fifo_full_w),
        .drain_en_array_o(drain_en_array_w),
        .fifo_din_o(fifo_din_w),
        .fifo_wr_en_o(fifo_wr_en_w),
        .serializer_busy_o(serializer_busy_w));
 
    // =========================================================================
    // 6. FIFO C
    // =========================================================================
    sc_fifo_fwft #(
        .DATA_WIDTH(N*32), .DEPTH(FIFO_DEPTH)
    ) u_sc_fifo_fwft_c (
        .CLK_i(CLK_i), .RST_i(RST_i),
        .wr_en_i(fifo_wr_en_w), .din_i(fifo_din_w), .full_o(fifo_full_w),
        .rd_en_i(safe_fifo_rd_w), .dout_o(fifo_dout_w), .empty_o(fifo_empty_w));
 
    // =========================================================================
    // 7. POST ACCUMULATOR - tích lũy num_k_tiles tiles INT32
    //    (num_k_tiles ở đây = K_BLK / k_dim, MỘT K-block, không phải K_total)
    //    Output INT32 XUẤT THẲNG ra ngoài - KHÔNG qua rescale (khác gemm_accelerator)
    // =========================================================================
    post_accumulator #(
        .N(N), .DATA_W(32)
    ) u_post_accumulator (
        .CLK_i(CLK_i), .RST_i(RST_i),
        .num_k_tiles_i(num_k_tiles_i),
 
        .s_axis_tdata_i (fifo_dout_w),
        .s_axis_tvalid_i(~fifo_empty_w),
        .s_axis_tready_o(post_acc_s_tready_w),
        .s_axis_tlast_i (1'b0),
 
        // Master - XUẤT THẲNG ra ngoài module (không có stage 8 rescale)
        .m_axis_tdata_o (m_axis_c32_tdata_o),
        .m_axis_tvalid_o(m_axis_c32_tvalid_o),
        .m_axis_tready_i(m_axis_c32_tready_i),
        .m_axis_tlast_o (m_axis_c32_tlast_o),
        .m_axis_tuser_o (m_axis_c32_tuser_o));
 
endmodule
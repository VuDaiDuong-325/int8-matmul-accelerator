`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/02/2026 02:47:40 PM
// Design Name: 
// Module Name: gemm_accelerator
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

module gemm_accelerator #(
    parameter N          = 16,
    parameter DATA_WIDTH = 8,
    parameter FIFO_DEPTH = 1024,
    parameter BRAM_DEPTH = 1024
)(
    input  wire        aclk,
    input  wire        aresetn,
 
    // ── Config ────────────────────────────────────────────────────────────────
    input  wire [31:0] k_dim,          // Số bước K mỗi systolic pass (= BRAM bank size)
    input  wire [31:0] num_k_tiles,    // Số tiles cần tích lũy (= K_total / k_dim)
    input  wire [4:0]  scale_shift,    // Số bit dịch phải cho requantise
    input  wire [7:0]  zero_point,     // Zero point INT8 (0 = symmetric)
 
    // ── AXI-Stream Slave A ────────────────────────────────────────────────────
    input  wire [(N*DATA_WIDTH)-1:0] s_axis_a_tdata,
    input  wire                      s_axis_a_tvalid,
    output wire                      s_axis_a_tready,
    input  wire                      s_axis_a_tlast,
 
    // ── AXI-Stream Slave B ────────────────────────────────────────────────────
    input  wire [(N*DATA_WIDTH)-1:0] s_axis_b_tdata,
    input  wire                      s_axis_b_tvalid,
    output wire                      s_axis_b_tready,
    input  wire                      s_axis_b_tlast,
 
    // ── AXI-Stream Master C (INT8) ────────────────────────────────────────────
    output wire [(N*8)-1:0]          m_axis_c_tdata,
    output wire                      m_axis_c_tvalid,
    input  wire                      m_axis_c_tready,
    output wire                      m_axis_c_tlast,
    output wire                      m_axis_c_tuser    // Start-of-Frame cho VDMA
);
 
    // =========================================================================
    // INTERNAL WIRES
    // =========================================================================
    wire bram_ready_A, bram_ready_B, clear_bram_ready;
    wire [$clog2(BRAM_DEPTH)-1:0] bram_rd_addr;
    wire [(N*DATA_WIDTH)-1:0] bram_data_A, bram_data_B;
 
    wire [(N*DATA_WIDTH)-1:0] pre_skew_A, pre_skew_B;
    wire [N-1:0] pre_skew_valid, pre_skew_clear, pre_skew_last;
 
    wire [(N*DATA_WIDTH)-1:0] array_data_A, array_data_B;
    wire [N-1:0] array_valid, array_clear, array_last_mac;
 
    wire drain_en_array;
    wire [(N*32)-1:0] bottom_row_out;
    wire mac_done_trigger;
 
    wire [(N*32)-1:0] fifo_din, fifo_dout;
    wire fifo_wr_en, fifo_full, fifo_empty;
    wire serializer_busy;
 
    // post_accumulator → int32_to_int8_rescale
    wire [(N*32)-1:0] acc_m_tdata;
    wire              acc_m_tvalid;
    wire              acc_m_tready;
    wire              acc_m_tlast;
    wire              acc_m_tuser;
 
    // FIFO rd_en: chỉ đọc khi post_acc muốn nhận VÀ FIFO không trống
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
        .valid_in(pre_skew_valid[0]),
        .clear_in(pre_skew_clear[0]),
        .last_mac_in(pre_skew_last[0]),
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
    // 6. FIFO C - đệm INT32 giữa serializer và post_accumulator
    // =========================================================================
    sc_fifo_fwft #(
        .DATA_WIDTH(N*32), .DEPTH(FIFO_DEPTH)
    ) fifo_C_inst (
        .clk(aclk), .rst_n(aresetn),
        .wr_en(fifo_wr_en), .din(fifo_din), .full(fifo_full),
        .rd_en(safe_fifo_rd), .dout(fifo_dout), .empty(fifo_empty));
 
    // =========================================================================
    // 7. POST ACCUMULATOR - tích lũy num_k_tiles tiles INT32
    //    Slave: đọc từ FIFO C (FWFT: valid = ~empty, ready → rd_en)
    //    Master: xuất INT32 rows sang int32_to_int8_rescale
    // =========================================================================
    post_accumulator #(
        .N(N), .DATA_W(32)
    ) post_acc_inst (
        .clk(aclk), .rst_n(aresetn),
        .num_k_tiles(num_k_tiles),
 
        // Slave - từ FIFO C
        .s_axis_tdata (fifo_dout),
        .s_axis_tvalid(~fifo_empty),
        .s_axis_tready(post_acc_s_tready),
        .s_axis_tlast (1'b0),              // FIFO không sinh tlast, không dùng trong FSM
 
        // Master - sang rescale
        .m_axis_tdata (acc_m_tdata),
        .m_axis_tvalid(acc_m_tvalid),
        .m_axis_tready(acc_m_tready),
        .m_axis_tlast (acc_m_tlast),
        .m_axis_tuser (acc_m_tuser));
 
    // =========================================================================
    // 8. INT32 → INT8 RESCALE
    //    Slave: từ post_accumulator
    //    Master: m_axis_c (INT8 output cuối cùng)
    // =========================================================================
    int32_int8_rescale #(
        .N(N)
    ) rescale_inst (
        .clk(aclk), .rst_n(aresetn),
        .scale_shift(scale_shift),
        .zero_point (zero_point),
 
        // Slave - từ post_accumulator
        .s_axis_tdata (acc_m_tdata),
        .s_axis_tvalid(acc_m_tvalid),
        .s_axis_tready(acc_m_tready),
        .s_axis_tlast (acc_m_tlast),
        .s_axis_tuser (acc_m_tuser),
 
        // Master - ra ngoài
        .m_axis_tdata (m_axis_c_tdata),
        .m_axis_tvalid(m_axis_c_tvalid),
        .m_axis_tready(m_axis_c_tready),
        .m_axis_tlast (m_axis_c_tlast),
        .m_axis_tuser (m_axis_c_tuser));
 
endmodule
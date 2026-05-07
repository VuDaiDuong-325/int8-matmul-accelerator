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
    parameter N = 16,
    parameter DATA_WIDTH = 8,
    parameter FIFO_DEPTH = 1024,
    parameter BRAM_DEPTH = 1024
)(
    input  wire        aclk,
    input  wire        aresetn,
    
    // Config từ CPU (Số chu kỳ cộng dồn - K dimension chunks)
    input  wire [31:0] k_dim,

    // AXI-Stream Slave Ma trận A
    input  wire [(N*DATA_WIDTH)-1:0] s_axis_a_tdata,
    input  wire             s_axis_a_tvalid,
    output wire             s_axis_a_tready,
    input  wire             s_axis_a_tlast,

    // AXI-Stream Slave Ma trận B
    input  wire [(N*DATA_WIDTH)-1:0] s_axis_b_tdata,
    input  wire             s_axis_b_tvalid,
    output wire             s_axis_b_tready,
    input  wire             s_axis_b_tlast,

    // AXI-Stream Master Ma trận C (Kết quả)
    output wire [(N*32)-1:0]      m_axis_c_tdata,
    output wire             m_axis_c_tvalid,
    input  wire             m_axis_c_tready,
    output wire             m_axis_c_tlast
);

    // =========================================================
    // 1. DÂY KẾT NỐI NỘI BỘ (INTERNAL WIRES)
    // =========================================================
    wire bram_ready_A, bram_ready_B;
    wire clear_bram_ready;
    wire [$clog2(BRAM_DEPTH)-1:0] bram_rd_addr;
    
    wire [(N*DATA_WIDTH)-1:0] bram_data_A, bram_data_B;
    
    // Dây nối từ Control FSM sang Skew Network
    wire [(N*DATA_WIDTH)-1:0] pre_skew_A, pre_skew_B;
    wire [N-1:0] pre_skew_valid, pre_skew_clear, pre_skew_last;
    
    // Dây nối từ Skew Network sang Mảng Systolic
    wire [(N*DATA_WIDTH)-1:0] array_data_A, array_data_B;
    wire [N-1:0] array_valid, array_clear, array_last_mac;
    
    // Tín hiệu điều khiển Drain (Rút kết quả)
    wire drain_en_array;
    wire [(N*32)-1:0] bottom_row_out;
    wire mac_done_trigger;
    
    // Tín hiệu cho Output FIFO
    wire [(N*32)-1:0] fifo_din;
    wire fifo_wr_en, fifo_full, fifo_empty;
    
    wire serializer_busy;

    // =========================================================
    // 2. KHỐI BRAM INPUT BUFFER (A & B)
    // =========================================================
    bram_input_buffer #(.DATA_WIDTH(N*DATA_WIDTH), .DEPTH(BRAM_DEPTH)) bram_A (
        .clk(aclk), .rst_n(aresetn), .chunk_len(k_dim[29:0]),
        .s_axis_tdata(s_axis_a_tdata), .s_axis_tvalid(s_axis_a_tvalid), 
        .s_axis_tready(s_axis_a_tready), .s_axis_tlast(s_axis_a_tlast),
        .rd_addr(bram_rd_addr), .rd_data(bram_data_A),
        .block_ready(bram_ready_A), .clear_ready(clear_bram_ready)
    );

    bram_input_buffer #(.DATA_WIDTH(N*DATA_WIDTH), .DEPTH(BRAM_DEPTH)) bram_B (
        .clk(aclk), .rst_n(aresetn), .chunk_len(k_dim[29:0]),
        .s_axis_tdata(s_axis_b_tdata), .s_axis_tvalid(s_axis_b_tvalid), 
        .s_axis_tready(s_axis_b_tready), .s_axis_tlast(s_axis_b_tlast),
        .rd_addr(bram_rd_addr), .rd_data(bram_data_B),
        .block_ready(bram_ready_B), .clear_ready(clear_bram_ready)
    );

    // =========================================================
    // 3. KHỐI ĐIỀU KHIỂN LUỒNG DỮ LIỆU (DATAFLOW CTRL)
    // =========================================================
    systolic_dataflow_ctrl #(.N(N), .DATA_WIDTH(DATA_WIDTH), .BRAM_DEPTH(BRAM_DEPTH)) ctrl_inst (
        .clk(aclk), .rst_n(aresetn),
        .k_dim_config(k_dim),
        .bram_ready_A(bram_ready_A), .bram_ready_B(bram_ready_B),
        .serializer_busy(serializer_busy),
        .clear_bram_ready(clear_bram_ready),
        .bram_rd_addr(bram_rd_addr),
        .bram_data_A(bram_data_A), .bram_data_B(bram_data_B),
        
        .skewed_data_A(pre_skew_A), 
        .skewed_data_B(pre_skew_B),
        .valid_delay(pre_skew_valid), 
        .clear_delay(pre_skew_clear), 
        .last_mac_delay(pre_skew_last)
    );

    // =========================================================
    // 4. MẠNG SKEW (SKEW NETWORK) - TẠO HÌNH BÌNH HÀNH
    // =========================================================
    skew_network #(.N(N), .DATA_WIDTH(DATA_WIDTH)) skew_inst (
        .clk(aclk), .rst_n(aresetn),
        .data_A_in(pre_skew_A), .data_B_in(pre_skew_B),
        // Lấy bit 0 của tín hiệu valid/clear do FSM sinh ra để đẩy vào Skew
        .valid_in(pre_skew_valid[0]), 
        .clear_in(pre_skew_clear[0]), 
        .last_mac_in(pre_skew_last[0]),
        
        .data_A_out(array_data_A), .data_B_out(array_data_B),
        .valid_out(array_valid), .clear_out(array_clear), .last_mac_out(array_last_mac)
    );

    // =========================================================
    // 5. MẢNG TÂM THU (SYSTOLIC ARRAY 16x16)
    // =========================================================
    matmul_array #(.ARRAY_SIZE(N)) systolic_array_inst (
        .clk(aclk), .rst_n(aresetn),
        .valid_in_left(array_valid),
        .clear_acc_left(array_clear),
        .last_mac_in_left(array_last_mac),
        .act_in_left(array_data_A),
        .weight_in_top(array_data_B),
        
        .drain_en_array(drain_en_array),
        .bottom_row_out(bottom_row_out),
        .mac_done_trigger(mac_done_trigger)
    );
    // =========================================================
    // 6. KHỐI NỐI TIẾP KẾT QUẢ (OUTPUT SERIALIZER)
    // =========================================================
    output_serializer #(.N(N)) serializer_inst (
        .clk(aclk), .rst_n(aresetn),
        .mac_done_trigger(mac_done_trigger),
        .bottom_row_in(bottom_row_out),
        .fifo_full(fifo_full),
        
        .drain_en_array(drain_en_array),
        .fifo_din(fifo_din),
        .fifo_wr_en(fifo_wr_en),
        .serializer_busy(serializer_busy)
    );

    // =========================================================
    // 7. KHỐI FIFO C (SC FIFO FWFT)
    // =========================================================
    wire safe_fifo_rd = m_axis_c_tready & ~fifo_empty;

    sc_fifo_fwft #(.DATA_WIDTH(N*32), .DEPTH(FIFO_DEPTH)) fifo_C_inst (
        .clk(aclk), .rst_n(aresetn),
        .wr_en(fifo_wr_en), .din(fifo_din), .full(fifo_full),
        .rd_en(safe_fifo_rd), .dout(m_axis_c_tdata), .empty(fifo_empty)
    );

    // =========================================================
    // 8. LOGIC TẠO CỜ TLAST (DÀNH CHO BĂNG THÔNG 512-BIT)
    // =========================================================
    assign m_axis_c_tvalid = ~fifo_empty;
    
    reg [4:0] out_cnt; 
    always @(posedge aclk) begin
        if (!aresetn) begin
            out_cnt <= 0;
        end else if (m_axis_c_tvalid && m_axis_c_tready) begin
            // Đếm từ 0 đến 15 (16 hàng cho 1 Chunk)
            if (out_cnt == N - 1) begin
                out_cnt <= 0;
            end else begin
                out_cnt <= out_cnt + 1;
            end
        end
    end

    // TLAST bật lên 1 cách đồng bộ ở hàng cuối cùng của Chunk
    assign m_axis_c_tlast = (out_cnt == N - 1);

endmodule
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
    parameter FIFO_DEPTH = 1024
)(
    // --------------------------------------------------------
    // 1. System Signals (Clock & Reset)
    // --------------------------------------------------------
    input  wire        aclk,
    input  wire        aresetn, // AXI dùng reset tích cực mức thấp (active-low)
    input  wire [31:0] k_dim,

    // --------------------------------------------------------
    // 2. AXI-Stream Slave Interface cho Ma trận A
    // --------------------------------------------------------
    input  wire [(N*8)-1:0] s_axis_a_tdata,
    input  wire        s_axis_a_tvalid,
    output wire        s_axis_a_tready,

    // --------------------------------------------------------
    // 3. AXI-Stream Slave Interface cho Ma trận B
    // --------------------------------------------------------
    input  wire [(N*8)-1:0] s_axis_b_tdata,
    input  wire        s_axis_b_tvalid,
    output wire        s_axis_b_tready,

    // --------------------------------------------------------
    // 4. AXI-Stream Master Interface cho Kết quả C
    // --------------------------------------------------------
    output wire [31:0] m_axis_c_tdata,
    output wire        m_axis_c_tvalid,
    input  wire        m_axis_c_tready,
    output wire        m_axis_c_tlast
);

    // =========================================================
    // KHAI BÁO DÂY NỐI NỘI BỘ (INTERNAL WIRES)
    // =========================================================
    
    // Dây cho FIFO A & B
    wire        fifo_A_empty, fifo_A_full;
    wire        fifo_B_empty, fifo_B_full;
    wire [(N*8)-1:0] fifo_A_dout, fifo_B_dout;
    wire        fifo_rd_en_A, fifo_rd_en_B;

    // Dây cho Controller ra NPU
    wire [(N*8)-1:0] skewed_data_A, skewed_data_B;
    wire [N-1:0]  skewed_valid_in;
    wire [N-1:0]  skewed_clear_acc;

    // Dây cho NPU ra Serializer
    wire [(N*N*32)-1:0] psum_matrix;
    wire [(N*N)-1:0]  mac_valid_out;

    // Dây cho Serializer ra Output FIFO (C)
    wire [31:0]  serializer_dout;
    wire         serializer_valid;
    wire         fifo_C_full, fifo_C_empty;

    // =========================================================
    // MAP TÍN HIỆU AXI-STREAM VÀO CỜ CỦA FIFO
    // =========================================================
    // AXI Slave: Báo 'ready' khi FIFO chưa đầy. Ghi khi valid và ready cùng bằng 1.
    assign s_axis_a_tready = ~fifo_A_full;
    assign s_axis_b_tready = ~fifo_B_full;
    wire   fifo_A_wr_en    = s_axis_a_tvalid & s_axis_a_tready;
    wire   fifo_B_wr_en    = s_axis_b_tvalid & s_axis_b_tready;

    // AXI Master: Báo 'valid' khi FIFO C có data. Đọc khi valid và ready cùng bằng 1.
    assign m_axis_c_tvalid = ~fifo_C_empty;
    wire   fifo_C_rd_en    = m_axis_c_tvalid & m_axis_c_tready;

    // =========================================================
    // KHỞI TẠO CÁC MODULE (INSTANTIATIONS)
    // =========================================================

    // 1. SC FIFO A
    sc_fifo #(
        .DATA_WIDTH(N*8), 
        .DEPTH(FIFO_DEPTH)
    ) fifo_A_inst (
        .clk(aclk), .rst_n(aresetn),
        .din(s_axis_a_tdata), .wr_en(s_axis_a_tvalid & s_axis_a_tready), .full(fifo_A_full),
        .dout(fifo_A_dout),   .rd_en(fifo_rd_en_A), .empty(fifo_A_empty)
    );

    // 2. SC FIFO B
    sc_fifo #(
        .DATA_WIDTH(N*8), 
        .DEPTH(FIFO_DEPTH)
    ) fifo_B_inst (
        .clk(aclk), .rst_n(aresetn),
        .din(s_axis_b_tdata), .wr_en(s_axis_b_tvalid & s_axis_b_tready), .full(fifo_B_full),
        .dout(fifo_B_dout),   .rd_en(fifo_rd_en_B), .empty(fifo_B_empty)
    );

    // 3. Khối điều khiển Dataflow (Đã bao gồm Skew Network)
    systolic_dataflow_ctrl #(
        .N(N),
        .DATA_WIDTH(8)
    ) ctrl_inst (
        .clk(aclk), .rst_n(aresetn), .k_dim(k_dim),
        .fifo_empty_A(fifo_A_empty), .fifo_empty_B(fifo_B_empty),
        .fifo_rd_en_A(fifo_rd_en_A), .fifo_rd_en_B(fifo_rd_en_B),
        .fifo_data_A(fifo_A_dout),   .fifo_data_B(fifo_B_dout),
        .skewed_data_A(skewed_data_A), .skewed_data_B(skewed_data_B),
        .skewed_valid_in(skewed_valid_in), .skewed_clear_acc(skewed_clear_acc)
    );

    // 4. Mảng NPU (Systolic Array)
    matmul_array #(
        .ARRAY_SIZE(N)
    ) npu_inst (
        .clk(aclk), .rst_n(aresetn),
        .act_in_left(skewed_data_A), 
        .weight_in_top(skewed_data_B),
        .valid_in_left(skewed_valid_in), 
        
        .clear_acc_left({N{1'b0}}), 

        .last_mac_in_left(skewed_clear_acc), 
        
        .psum_out_matrix(psum_matrix), 
        .mac_valid_matrix(mac_valid_out)
    );

    // 5. Khối bóc dữ liệu (Output Serializer)
    output_serializer #(
        .N(N)
    ) serializer_inst (
        .clk(aclk), .rst_n(aresetn),
        .vld_matrix(mac_valid_out), .psum_matrix(psum_matrix),
        .fifo_full(fifo_C_full),
        .fifo_din(serializer_dout), .fifo_wr_en(serializer_valid)
    );

    // 6. SC FIFO C 
    wire safe_serializer_wr = serializer_valid & ~fifo_C_full;

    sc_fifo_fwft #(
        .DATA_WIDTH(32), 
        .DEPTH(FIFO_DEPTH)
    ) fifo_C_inst (
        .clk(aclk), .rst_n(aresetn),
        .din(serializer_dout), .wr_en(safe_serializer_wr), .full(fifo_C_full),
        .dout(m_axis_c_tdata), .rd_en(m_axis_c_tready),    .empty(fifo_C_empty) 
    );

    // =========================================================
    // LOGIC TẠO CỜ TLAST (Báo hiệu kết thúc 1 Block)
    // =========================================================
    // DMA cần cờ tlast để biết khi nào ngừng hút data.
    reg [N-1:0] out_cnt; 

    always @(posedge aclk or negedge aresetn) begin
        if (!aresetn) begin
            out_cnt <= 0;
        end else if (m_axis_c_tvalid && m_axis_c_tready) begin
            if (out_cnt == (N*N-1))
                out_cnt <= 0; 
            else
                out_cnt <= out_cnt + 1'b1;
        end
    end

    // Kéo tlast lên mức 1 ở phần tử cuối cùng
    assign m_axis_c_tlast = (out_cnt == (N*N - 1));

endmodule

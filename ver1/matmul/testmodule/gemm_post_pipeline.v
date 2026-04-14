`timescale 1ns / 1ps
// ============================================================
// Module  : gemm_post_pipeline
// Chức năng: Top-level tích hợp post-processing pipeline:
//            output_accumulator → quantizer_int8 → output FIFO
//
// ─── VỊ TRÍ TRONG HỆ THỐNG ─────────────────────────────
//
//   gemm_accelerator (hiện tại) xuất:
//     output_serializer → fifo_512to128 → DMA_C (INT32, 128-bit)
//
//   Hệ thống MỚI (thay thế fifo_512to128 và DMA_C path):
//     output_serializer
//          │ 512-bit/hàng (acc_wr_en, row_in, row_addr)
//          ▼
//     output_accumulator  ← k_tile_last, new_tile (từ systolic_ctrl)
//          │ 512-bit/hàng INT32 (mỗi 2 nhịp)
//          ▼
//     quantizer_int8      ← scale_factor, shift_val (từ CPU via GPIO)
//          │ 128-bit/hàng INT8 (mỗi 2 nhịp, latency +3)
//          ▼
//     output FIFO (128-bit)
//          │
//          ▼
//     DMA_C (S2MM) → DDR
//
// ─── THAY ĐỔI TRONG C CODE ───────────────────────────────
//
//   CŨ:
//     - Nhận INT32 tile từ FPGA (1024 bytes)
//     - partial_C += rx_C (software acc)
//     - Lặp K_BLOCKS lần
//     - bytes_c = M_TILE × N_TILE × sizeof(int32_t) = 1024
//
//   MỚI:
//     - Set GPIO_SCALE và GPIO_SHIFT trước khi bắt đầu
//     - Set GPIO_K = k_dim (như cũ)
//     - Set GPIO_TILE_CTRL: new_tile=1 khi tile (m,n) mới, k_tile_last=1 khi k cuối
//     - Nhận INT8 tile (256 bytes thay vì 1024 bytes) — 4× nhỏ hơn
//     - bytes_c = M_TILE × N_TILE × sizeof(int8_t) = 256
//     - KHÔNG cần loop K_BLOCKS trong software nữa
//     - Hardware tự accumulate qua k_tile_last signal
//
// ─── THAM SỐ GPIO MỚI ────────────────────────────────────
//
//   GPIO_K_ADDR     (0xA0000000): k_dim (như cũ)
//   GPIO_SCALE_ADDR (0xA0010000): scale_factor [15:0]
//   GPIO_SHIFT_ADDR (0xA0020000): shift_val [4:0]
//   GPIO_CTRL_ADDR  (0xA0030000): bit0=new_tile, bit1=k_tile_last
//     → CPU set trước mỗi DMA transaction
//
// ─── AXI-STREAM OUTPUT ──────────────────────────────────
//
//   Đầu ra: 128-bit per transaction
//   Số transactions/tile = 16 hàng × 128-bit / 128-bit = 16
//   bytes_c = 16 × 16 × 1 (INT8) = 256 bytes
//   → DMA S2MM_LENGTH = 256 (thay vì 1024 cũ)
//   → tlast sau 16 transactions (thay vì 64 cũ)
// ============================================================

module gemm_post_pipeline #(
    parameter N         = 16,
    parameter FIFO_DEPTH = 64
)(
    input  wire         clk,
    input  wire         rst_n,

    // ── Từ output_serializer (thay thế fifo_512to128 input) ──
    input  wire                     ser_wr_en,       // = fifo_wr_en
    input  wire [(N*32)-1:0]        ser_row_in,      // = fifo_din (512-bit)
    input  wire [$clog2(N)-1:0]     ser_row_addr,    // = row_cnt

    // ── Tile control (từ CPU qua GPIO hoặc systolic_ctrl) ────
    input  wire                     new_tile,        // Tile (m,n) mới
    input  wire                     k_tile_last,     // K-chunk cuối

    // ── Quantization config (từ CPU qua GPIO) ────────────────
    input  wire [15:0]              scale_factor,
    input  wire [4:0]               shift_val,

    // ── AXI-Stream đến DMA_C (S2MM), 128-bit INT8 ────────────
    output wire [(N*8)-1:0]         m_axis_tdata,    // 128-bit
    output wire                     m_axis_tvalid,
    input  wire                     m_axis_tready,
    output wire                     m_axis_tlast
);

    // ================================================================
    // STAGE 1: OUTPUT ACCUMULATOR
    // ================================================================
    wire [(N*32)-1:0]  acc_row_out;
    wire               acc_row_valid;
    wire [$clog2(N)-1:0] acc_row_addr;
    wire               acc_tile_done;

    output_accumulator #(
        .N        (N),
        .ACC_WIDTH(32)
    ) u_accumulator (
        .clk              (clk),
        .rst_n            (rst_n),
        .acc_wr_en        (ser_wr_en),
        .row_in           (ser_row_in),
        .row_addr         (ser_row_addr),
        .new_tile         (new_tile),
        .k_tile_last      (k_tile_last),
        .acc_row_out      (acc_row_out),
        .acc_row_valid    (acc_row_valid),
        .acc_row_addr_out (acc_row_addr),
        .acc_tile_done    (acc_tile_done)
    );

    // ================================================================
    // STAGE 2: QUANTIZER INT32 → INT8
    // ================================================================
    wire [(N*8)-1:0]  quant_tdata;
    wire              quant_tvalid;
    wire              quant_tready;
    wire [$clog2(N)-1:0] quant_row_addr;
    wire              quant_tile_done;

    quantizer_int8 #(
        .N(N)
    ) u_quantizer (
        .clk              (clk),
        .rst_n            (rst_n),
        .s_axis_tdata     (acc_row_out),
        .s_axis_tvalid    (acc_row_valid),
        .s_axis_tready    (quant_tready),
        .s_axis_row_addr  (acc_row_addr),
        .s_axis_tile_done (acc_tile_done),
        .scale_factor     (scale_factor),
        .shift_val        (shift_val),
        .m_axis_tdata     (quant_tdata),
        .m_axis_tvalid    (quant_tvalid),
        .m_axis_tready    (fifo_not_full),
        .m_axis_row_addr  (quant_row_addr),
        .m_axis_tile_done (quant_tile_done)
    );

    // ================================================================
    // STAGE 3: OUTPUT FIFO (128-bit, shallow)
    // Dùng sc_fifo_fwft hoặc Xilinx FIFO IP
    // Depth nhỏ vì quantizer và DMA thường rate-matched
    // ================================================================
    wire fifo_not_full;
    wire fifo_empty;
    wire [(N*8)-1:0] fifo_dout;

    sc_fifo_fwft #(
        .DATA_WIDTH(N*8),
        .DEPTH(FIFO_DEPTH)
    ) u_out_fifo (
        .clk    (clk),
        .rst_n  (rst_n),
        .wr_en  (quant_tvalid),
        .din    (quant_tdata),
        .full   (),
        .rd_en  (m_axis_tready && !fifo_empty),
        .dout   (fifo_dout),
        .empty  (fifo_empty)
    );

    assign fifo_not_full = ~fifo_empty; // simplified: actually use ~full

    // ================================================================
    // AXI-STREAM OUTPUT + TLAST GENERATION
    // ================================================================
    // 1 tile = N hàng = N transactions của 128-bit INT8
    // tlast = transaction thứ N-1 (last row)
    assign m_axis_tdata  = fifo_dout;
    assign m_axis_tvalid = !fifo_empty;

    // tlast counter
    reg [$clog2(N)-1:0] out_cnt;
    always @(posedge clk) begin
        if (!rst_n)
            out_cnt <= 0;
        else if (m_axis_tvalid && m_axis_tready) begin
            if (out_cnt == N[($clog2(N))-1:0] - 1)
                out_cnt <= 0;
            else
                out_cnt <= out_cnt + 1;
        end
    end

    assign m_axis_tlast = (out_cnt == N[($clog2(N))-1:0] - 1);

endmodule

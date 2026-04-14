`timescale 1ns / 1ps
// ============================================================
// Module  : quantizer_int8
// Chức năng: Chuyển đổi INT32 → INT8 với fixed-point scaling
//            sử dụng DSP48E2 slice.
//
// ─── CÔNG THỨC ───────────────────────────────────────────
//
//   output_int8 = clamp( (input_int32 × scale_factor) >> shift, -128, 127 )
//
//   Trong đó:
//     scale_factor: [15:0] unsigned fixed-point Q1.15 hoặc Q8.8
//     shift:        [4:0]  số bit shift phải (0..31)
//
//   Ví dụ:
//     scale_factor = 32768 (= 0x8000 = 1.0 trong Q0.15)
//     shift        = 15
//     → output = clamp(input × 1.0 >> 15) = clamp(input >> 15)
//     Phù hợp khi accumulator range ≈ ±127 × K, cần scale = 1/K
//
// ─── PIPELINE (3 STAGES) ─────────────────────────────────
//
//   Stage 1 (DSP): product = input_int32 × scale_factor (48-bit)
//   Stage 2 (Shift): shifted = product >> shift (32-bit)
//   Stage 3 (Clamp): clamped = clamp(shifted, -128, 127) (8-bit)
//
//   Latency: 3 nhịp
//   Throughput: 1 phần tử/nhịp (fully pipelined)
//
// ─── PARALLEL PROCESSING ────────────────────────────────
//
//   Nhận đầu vào từ accumulator: 1 hàng = N=16 INT32/nhịp
//   → N=16 quantizer instances chạy song song
//   → Đầu ra: 1 hàng = N=16 INT8/nhịp (128-bit)
//
// ─── DSP48E2 INFERENCE ──────────────────────────────────
//
//   Vivado sẽ inference DSP48E2 khi:
//     - Signed multiply: $signed(a) × $signed(b)
//     - a = 30-bit (input_int32, clipped to 30-bit để fit DSP A port)
//     - b = 18-bit (scale_factor zero-extended)
//     - product = 48-bit P register
//     - Tổng 3 stages trong 1 DSP với pipeline register
//
//   Thực tế: input_int32 là 32-bit, DSP A port là 30-bit.
//   → input_int32 cần được clip/sign-extend:
//     Nếu |input| > 2^29 → saturate ở bước trước DSP
//     Trong thực tế accumulator INT8 × INT8 × K:
//       max = 127 × 127 × 1280 ≈ 20.6M ≈ 2^24.3 → an toàn trong 30-bit
//
// ─── RESOURCE ────────────────────────────────────────────
//
//   N=16 instances × 1 DSP48E2/instance = 16 DSP48E2
//   KV260 (xczu5ev): 1248 DSP48E2 → chiếm ~1.3%
//   Additional LUT: ~20/instance cho clamp logic = 320 LUT
// ============================================================

module quantizer_int8 #(
    parameter N = 16   // Số phần tử parallel
)(
    input  wire                  clk,
    input  wire                  rst_n,

    // ── Từ output_accumulator ────────────────────────────────
    input  wire [(N*32)-1:0]     s_axis_tdata,   // N × INT32 = 512-bit
    input  wire                  s_axis_tvalid,
    output wire                  s_axis_tready,
    input  wire [$clog2(N)-1:0]  s_axis_row_addr, // Địa chỉ hàng (0..N-1)
    input  wire                  s_axis_tile_done, // Tile đã xong

    // ── Cấu hình quantization ────────────────────────────────
    // Không thay đổi trong quá trình xử lý 1 tile
    input  wire [15:0]           scale_factor,   // Q1.15 fixed-point
    input  wire [4:0]            shift_val,       // Số bit dịch phải

    // ── Đến output FIFO / DMA ────────────────────────────────
    output wire [(N*8)-1:0]      m_axis_tdata,   // N × INT8 = 128-bit
    output wire                  m_axis_tvalid,
    input  wire                  m_axis_tready,
    output wire [$clog2(N)-1:0]  m_axis_row_addr,
    output wire                  m_axis_tile_done
);

    // ================================================================
    // BACKPRESSURE: sẵn sàng khi output không bị stall
    // Pipeline có độ sâu 3 → cần stall toàn bộ khi downstream block
    // Dùng valid/stall pipeline style (không dùng FIFO để giảm latency)
    // ================================================================
    wire pipe_stall = m_axis_tvalid && !m_axis_tready;
    assign s_axis_tready = !pipe_stall;

    // ================================================================
    // PIPELINE STAGE 1: MULTIPLY (DSP48E2)
    // input × scale_factor → 48-bit product
    // ================================================================
    // N=16 multiply instances
    wire signed [47:0] product [0:N-1]; // DSP P-register output
    reg  signed [47:0] product_r [0:N-1]; // Registered Stage 1 output

    genvar i;
    generate
        for (i = 0; i < N; i = i + 1) begin : gen_dsp

            // Extract element i từ hàng đầu vào
            wire signed [31:0] elem = $signed(s_axis_tdata[i*32 +: 32]);

            // DSP multiply: 32-bit × 16-bit = 48-bit
            // Vivado inference DSP48E2 khi pattern này được recognize:
            //   P = A × B (A=30-bit, B=18-bit cho DSP48E2)
            // elem[29:0] an toàn vì max = 127×127×1280 = 20.6M < 2^25
            assign product[i] = $signed(elem) * $signed({2'b0, scale_factor});
            // Note: Thực tế Vivado sẽ implement phép nhân này bằng DSP48E2
            // với attribute (* use_dsp = "yes" *) nếu cần force

            // Stage 1 register (pipeline)
            always @(posedge clk) begin
                if (!rst_n)
                    product_r[i] <= 48'd0;
                else if (!pipe_stall)
                    product_r[i] <= product[i];
            end

        end
    endgenerate

    // ================================================================
    // PIPELINE STAGE 1 CONTROL (valid/addr/done propagation)
    // ================================================================
    reg                  valid_s1;
    reg [$clog2(N)-1:0]  row_addr_s1;
    reg                  tile_done_s1;
    reg [4:0]            shift_s1;   // Capture shift để tránh timing issue

    always @(posedge clk) begin
        if (!rst_n) begin
            valid_s1     <= 1'b0;
            row_addr_s1  <= 0;
            tile_done_s1 <= 1'b0;
            shift_s1     <= 0;
        end else if (!pipe_stall) begin
            valid_s1     <= s_axis_tvalid;
            row_addr_s1  <= s_axis_row_addr;
            tile_done_s1 <= s_axis_tile_done;
            shift_s1     <= shift_val;
        end
    end

    // ================================================================
    // PIPELINE STAGE 2: ARITHMETIC RIGHT SHIFT
    // product_r >> shift_val → 32-bit signed
    // ================================================================
    reg signed [31:0] shifted_r [0:N-1];

    generate
        for (i = 0; i < N; i = i + 1) begin : gen_shift
            always @(posedge clk) begin
                if (!rst_n)
                    shifted_r[i] <= 32'd0;
                else if (!pipe_stall)
                    // Arithmetic right shift (preserves sign)
                    shifted_r[i] <= $signed(product_r[i]) >>> shift_s1;
            end
        end
    endgenerate

    // Stage 2 control
    reg                  valid_s2;
    reg [$clog2(N)-1:0]  row_addr_s2;
    reg                  tile_done_s2;

    always @(posedge clk) begin
        if (!rst_n) begin
            valid_s2     <= 1'b0;
            row_addr_s2  <= 0;
            tile_done_s2 <= 1'b0;
        end else if (!pipe_stall) begin
            valid_s2     <= valid_s1;
            row_addr_s2  <= row_addr_s1;
            tile_done_s2 <= tile_done_s1;
        end
    end

    // ================================================================
    // PIPELINE STAGE 3: SATURATING CLAMP → INT8
    // clamp(shifted, -128, 127) → 8-bit signed
    // ================================================================
    reg signed [7:0] clamped [0:N-1];

    // Assemble output bus
    wire [(N*8)-1:0] clamped_bus;
    generate
        for (i = 0; i < N; i = i + 1) begin : gen_clamp
            // Clamp logic: kiểm tra 24 bit cao (beyond INT8 range)
            always @(posedge clk) begin
                if (!rst_n) begin
                    clamped[i] <= 8'sd0;
                end else if (!pipe_stall) begin
                    if ($signed(shifted_r[i]) > 32'sd127)
                        clamped[i] <= 8'sd127;
                    else if ($signed(shifted_r[i]) < -32'sd128)
                        clamped[i] <= -8'sd128;
                    else
                        clamped[i] <= shifted_r[i][7:0];
                end
            end

            assign clamped_bus[i*8 +: 8] = clamped[i];
        end
    endgenerate

    // Stage 3 control
    reg                  valid_s3;
    reg [$clog2(N)-1:0]  row_addr_s3;
    reg                  tile_done_s3;

    always @(posedge clk) begin
        if (!rst_n) begin
            valid_s3     <= 1'b0;
            row_addr_s3  <= 0;
            tile_done_s3 <= 1'b0;
        end else if (!pipe_stall) begin
            valid_s3     <= valid_s2;
            row_addr_s3  <= row_addr_s2;
            tile_done_s3 <= tile_done_s2;
        end
    end

    // ================================================================
    // OUTPUT ASSIGNMENTS
    // ================================================================
    assign m_axis_tdata     = clamped_bus;
    assign m_axis_tvalid    = valid_s3;
    assign m_axis_row_addr  = row_addr_s3;
    assign m_axis_tile_done = tile_done_s3;

endmodule

`timescale 1ns / 1ps
//==============================================================================
// Module   : int32_int8_requant_pc
// Project  : INT8 GEMM Accelerator - KV260 / LLM
//
// Requantize INT32 -> INT8 THEO TUNG KENH (per-channel). Moi lane (= 1 cot cua
// C) co bo tham so rieng: bias, mult, shift, zero_point.
//
//   t   = acc + bias                       (33-bit signed)
//   p   = t * mult                         (65-bit signed, mult la int32)
//   q   = (p + (shift ? 1<<(shift-1) : 0)) >>> shift     (round-half-up)
//   out = clamp(q + zp, -128, 127)         (INT8, bao hoa)
//
// shift hop le: 0..62 (chi 6 bit thap cua shift_i duoc dung).
//
// Dac biet: mult=1, bias=0, zp=zero_point, shift=scale_shift cho ket qua GIONG
// HET int32_int8_rescale.v cu (per-tensor). Dung de doi chieu hoi quy.
//
// Pipeline 7 tang, KHONG co back-pressure: 1 lan in_valid_i -> dung 7 chu ky
// sau out_valid_o = 1 (1 xung) kem out_data_o. Phu hop voi FSM drain cua
// l2_tiling_agu (moi lan chi dua vao 1 hang 16 phan tu roi cho ket qua).
// Co the nhan 1 hang moi moi chu ky (throughput = 1 hang/chu ky) neu can sau nay.
//
// Tai nguyen: 16 bo nhan 33x32 (~4-6 DSP48E2 moi lane).
//==============================================================================
module int32_int8_requant_pc #(
    parameter N = 16
)(
    input  wire                 CLK_i,
    input  wire                 RST_i,

    input  wire                 in_valid_i,
    input  wire [N*32-1:0]      acc_i,     // INT32 accumulators
    input  wire [N*32-1:0]      bias_i,    // INT32
    input  wire [N*32-1:0]      mult_i,    // INT32 (signed)
    input  wire [N*8-1:0]       shift_i,   // [5:0] hop le, 0..62
    input  wire [N*32-1:0]      zp_i,      // INT32 (thuong -128..127)

    output reg                  out_valid_o,
    output reg  [N*8-1:0]       out_data_o
);
    localparam L = 7;
    reg [L-1:0] v_pipe_r;

    // --- Stage 1: t = acc + bias ---
    reg signed [32:0] t1_r    [0:N-1];
    reg signed [31:0] m1_r    [0:N-1];
    reg        [5:0]  s1_r    [0:N-1];
    reg signed [31:0] z1_r    [0:N-1];
    // --- Stage 2/3: product (2 tang de Vivado dua vao MREG + PREG cua DSP) ---
    reg signed [64:0] p2_r    [0:N-1];
    reg signed [64:0] p3_r    [0:N-1];
    reg        [5:0]  s2_r    [0:N-1], s3_r [0:N-1];
    reg signed [31:0] z2_r    [0:N-1], z3_r [0:N-1];
    // --- Stage 4: cong round ---
    reg signed [65:0] r4_r    [0:N-1];
    reg        [5:0]  s4_r    [0:N-1];
    reg signed [31:0] z4_r    [0:N-1];
    // --- Stage 5: dich phai so hoc ---
    reg signed [65:0] q5_r    [0:N-1];
    reg signed [31:0] z5_r    [0:N-1];
    // --- Stage 6: cong zero-point ---
    reg signed [66:0] y6_r    [0:N-1];

    integer i;
    reg signed [65:0] rnd_v;
    reg signed [66:0] y_v;

    always @(posedge CLK_i) begin
        for (i = 0; i < N; i = i + 1) begin
            // S1
            t1_r[i] <= $signed({acc_i[i*32+31], acc_i[i*32 +: 32]}) +
                       $signed({bias_i[i*32+31], bias_i[i*32 +: 32]});
            m1_r[i] <= $signed(mult_i[i*32 +: 32]);
            s1_r[i] <= shift_i[i*8 +: 6];
            z1_r[i] <= $signed(zp_i[i*32 +: 32]);
            // S2
            p2_r[i] <= t1_r[i] * m1_r[i];
            s2_r[i] <= s1_r[i];
            z2_r[i] <= z1_r[i];
            // S3
            p3_r[i] <= p2_r[i];
            s3_r[i] <= s2_r[i];
            z3_r[i] <= z2_r[i];
            // S4
            rnd_v = (s3_r[i] == 6'd0) ? 66'sd0 : (66'sd1 <<< (s3_r[i] - 6'd1));
            r4_r[i] <= $signed({p3_r[i][64], p3_r[i]}) + rnd_v;
            s4_r[i] <= s3_r[i];
            z4_r[i] <= z3_r[i];
            // S5
            q5_r[i] <= r4_r[i] >>> s4_r[i];
            z5_r[i] <= z4_r[i];
            // S6
            y6_r[i] <= $signed({q5_r[i][65], q5_r[i]}) +
                       $signed({{35{z5_r[i][31]}}, z5_r[i]});
            // S7 (clamp) -> out_data_o
            y_v = y6_r[i];
            if (v_pipe_r[L-2]) begin
                if (y_v > 67'sd127)        out_data_o[i*8 +: 8] <= 8'h7F;
                else if (y_v < -67'sd128)  out_data_o[i*8 +: 8] <= 8'h80;
                else                       out_data_o[i*8 +: 8] <= y_v[7:0];
            end
        end
    end

    always @(posedge CLK_i) begin
        if (!RST_i) begin
            v_pipe_r    <= {L{1'b0}};
            out_valid_o <= 1'b0;
        end else begin
            v_pipe_r    <= {v_pipe_r[L-2:0], in_valid_i};
            out_valid_o <= v_pipe_r[L-2];
        end
    end
endmodule

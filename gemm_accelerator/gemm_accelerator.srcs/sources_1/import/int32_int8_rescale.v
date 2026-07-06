`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/11/2026 02:46:27 PM
// Design Name: 
// Module Name: int32_int8_rescale
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

module int32_int8_rescale #(
    parameter N = 16    // Số phần tử mỗi hàng (= kích thước systolic array)
)(
    input  wire        CLK_i,
    input  wire        RST_i,
 
    // ── Config ────────────────────────────────────────────────────────────────
    input  wire [4:0]  scale_shift_i,   // Số bit dịch phải (0..31)
    input  wire [7:0]  zero_point_i,    // Zero point INT8 (0 = symmetric quantisation)
 
    // ── AXI-Stream Slave: INT32 rows từ post_accumulator ─────────────────────
    input  wire [(N*32)-1:0] s_axis_tdata_i,
    input  wire              s_axis_tvalid_i,
    output wire              s_axis_tready_o,   // combinatorial: accept when not stalling
    input  wire              s_axis_tlast_i,
    input  wire              s_axis_tuser_i,    // SOF từ post_accumulator
 
    // ── AXI-Stream Master: INT8 rows ra ngoài ────────────────────────────────
    output reg  [(N*8)-1:0]  m_axis_tdata_o,
    output reg               m_axis_tvalid_o,
    input  wire              m_axis_tready_i,
    output reg               m_axis_tlast_o,
    output reg               m_axis_tuser_o     // Truyền SOF cho downstream (VDMA, v.v.)
);
 
    // ── Back-pressure: chấp nhận khi output trống HOẶC downstream đang nhận ──
    assign s_axis_tready_o = (!m_axis_tvalid_o) || m_axis_tready_i;
 
    // ── Round bias: 1 << (scale_shift - 1) cho round-half-up ─────────────────
    // Dùng 34-bit để tránh overflow khi giá trị INT32 gần biên
    reg [33:0] round_bias_r;
    always @(*) begin
        if (scale_shift_i == 5'd0)
            round_bias_r = 34'd0;
        else
            round_bias_r = 34'd1 << (scale_shift_i - 5'd1);
    end
 
    // ── Combinatorial rescale pipeline cho mỗi trong N phần tử ───────────────
    wire signed [33:0] ext_w   [0:N-1];  // sign-extended 32→34 bit
    wire signed [33:0] rnd_w   [0:N-1];  // sau khi cộng round_bias
    wire signed [33:0] shr_w   [0:N-1];  // sau khi arithmetic right shift
    wire signed [33:0] zp_w    [0:N-1];  // sau khi cộng zero_point
    wire signed [7:0]  clamp_w [0:N-1];  // sau clamp [-128, 127]
 
    genvar gi;
    generate
        for (gi = 0; gi < N; gi = gi + 1) begin : gen_rescale
            // 1. Sign extend đúng cách: nhân bản bit dấu 2 lần (32 bit -> 34 bit)
            assign ext_w[gi] = {{2{s_axis_tdata_i[(gi*32)+31]}}, s_axis_tdata_i[gi*32 +: 32]};
 
            // 2. Cộng bias (chú ý ép kiểu)
            assign rnd_w[gi] = $signed(ext_w[gi]) + $signed({1'b0, round_bias_r[32:0]});
 
            // 3. Arithmetic right shift (phép chia có dấu)
            assign shr_w[gi] = $signed(rnd_w[gi]) >>> scale_shift_i;
 
            // 4. Cộng zero_point (sign-extended 8→34 bit)
            assign zp_w[gi]  = $signed(shr_w[gi]) + $signed({{26{zero_point_i[7]}}, zero_point_i});
 
            // 5. Saturate clamp → INT8
            assign clamp_w[gi] =
                ($signed(zp_w[gi]) >  34'sd127) ? 8'sh7F :
                ($signed(zp_w[gi]) < -34'sd128) ? 8'sh80 :
                                                   zp_w[gi][7:0];
        end
    endgenerate
 
    // ── Registered output (1-cycle pipeline) ─────────────────────────────────
    integer i;
    always @(posedge CLK_i) begin
        if (!RST_i) begin
            m_axis_tvalid_o <= 1'b0;
            m_axis_tlast_o  <= 1'b0;
            m_axis_tuser_o  <= 1'b0;
            m_axis_tdata_o  <= {(N*8){1'b0}};
        end else if (s_axis_tready_o) begin
            // Khi không stall: cập nhật output register
            m_axis_tvalid_o <= s_axis_tvalid_i;
            m_axis_tlast_o  <= s_axis_tlast_i;
            m_axis_tuser_o  <= s_axis_tuser_i;
            if (s_axis_tvalid_i) begin
                for (i = 0; i < N; i = i + 1)
                    m_axis_tdata_o[i*8 +: 8] <= clamp_w[i];
            end
        end
        // Khi stall (s_axis_tready_o=0): giữ nguyên m_axis_tdata_o/tvalid/tlast/tuser
    end
 
endmodule
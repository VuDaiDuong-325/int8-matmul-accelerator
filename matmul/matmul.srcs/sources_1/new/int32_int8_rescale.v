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
    input  wire        clk,
    input  wire        rst_n,
 
    // ── Config ────────────────────────────────────────────────────────────────
    input  wire [4:0]  scale_shift,   // Số bit dịch phải (0..31)
    input  wire [7:0]  zero_point,    // Zero point INT8 (0 = symmetric quantisation)
 
    // ── AXI-Stream Slave: INT32 rows từ post_accumulator ─────────────────────
    input  wire [(N*32)-1:0] s_axis_tdata,
    input  wire              s_axis_tvalid,
    output wire              s_axis_tready,   // combinatorial: accept when not stalling
    input  wire              s_axis_tlast,
    input  wire              s_axis_tuser,    // SOF từ post_accumulator
 
    // ── AXI-Stream Master: INT8 rows ra ngoài ────────────────────────────────
    output reg  [(N*8)-1:0]  m_axis_tdata,
    output reg               m_axis_tvalid,
    input  wire              m_axis_tready,
    output reg               m_axis_tlast,
    output reg               m_axis_tuser     // Truyền SOF cho downstream (VDMA, v.v.)
);
 
    // ── Back-pressure: chấp nhận khi output trống HOẶC downstream đang nhận ──
    assign s_axis_tready = (!m_axis_tvalid) || m_axis_tready;
 
    // ── Round bias: 1 << (scale_shift - 1) cho round-half-up ─────────────────
    // Dùng 34-bit để tránh overflow khi giá trị INT32 gần biên
    reg [33:0] round_bias;
    always @(*) begin
        if (scale_shift == 5'd0)
            round_bias = 34'd0;
        else
            round_bias = 34'd1 << (scale_shift - 5'd1);
    end
 
    // ── Combinatorial rescale pipeline cho mỗi trong N phần tử ───────────────
    wire signed [33:0] w_ext   [0:N-1];  // sign-extended 32→34 bit
    wire signed [33:0] w_rnd   [0:N-1];  // sau khi cộng round_bias
    wire signed [33:0] w_shr   [0:N-1];  // sau khi arithmetic right shift
    wire signed [33:0] w_zp    [0:N-1];  // sau khi cộng zero_point
    wire signed [7:0]  w_clamp [0:N-1];  // sau clamp [-128, 127]
 
    genvar gi;
    generate
        for (gi = 0; gi < N; gi = gi + 1) begin : gen_rescale
            // 1. Sign extend đúng cách: nhân bản bit dấu 2 lần (32 bit -> 34 bit)
            assign w_ext[gi] = {{2{s_axis_tdata[(gi*32)+31]}}, s_axis_tdata[gi*32 +: 32]};
 
            // 2. Cộng bias (chú ý ép kiểu)
            assign w_rnd[gi] = $signed(w_ext[gi]) + $signed({1'b0, round_bias[32:0]});
 
            // 3. Arithmetic right shift (phép chia có dấu)
            assign w_shr[gi] = $signed(w_rnd[gi]) >>> scale_shift;
 
            // 4. Cộng zero_point (sign-extended 8→34 bit)
            assign w_zp[gi]  = $signed(w_shr[gi]) + $signed({{26{zero_point[7]}}, zero_point});
 
            // 5. Saturate clamp → INT8
            assign w_clamp[gi] =
                ($signed(w_zp[gi]) >  34'sd127) ? 8'sh7F :
                ($signed(w_zp[gi]) < -34'sd128) ? 8'sh80 :
                                                   w_zp[gi][7:0];
        end
    endgenerate
 
    // ── Registered output (1-cycle pipeline) ─────────────────────────────────
    integer i;
    always @(posedge clk) begin
        if (!rst_n) begin
            m_axis_tvalid <= 1'b0;
            m_axis_tlast  <= 1'b0;
            m_axis_tuser  <= 1'b0;
            m_axis_tdata  <= {(N*8){1'b0}};
        end else if (s_axis_tready) begin
            // Khi không stall: cập nhật output register
            m_axis_tvalid <= s_axis_tvalid;
            m_axis_tlast  <= s_axis_tlast;
            m_axis_tuser  <= s_axis_tuser;
            if (s_axis_tvalid) begin
                for (i = 0; i < N; i = i + 1)
                    m_axis_tdata[i*8 +: 8] <= w_clamp[i];
            end
        end
        // Khi stall (s_axis_tready=0): giữ nguyên m_axis_tdata/tvalid/tlast/tuser
    end
 
endmodule
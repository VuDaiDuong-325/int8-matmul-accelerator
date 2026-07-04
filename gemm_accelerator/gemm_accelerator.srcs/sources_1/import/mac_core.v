`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/21/2026 02:18:05 PM
// Design Name: 
// Module Name: mac_core
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: MAC Core Optimized for DSP48E2 Inference
//////////////////////////////////////////////////////////////////////////////////

(* use_dsp = "yes" *)
module mac_core(
    input                       CLK_i,
    input                       RST_i,
    input                       valid_i,
    input                       clear_acc_i,
    input                       last_mac_i,
    input signed        [7:0]   w_i,
    input signed        [7:0]   x_i,
    output reg signed   [31:0]  psum_o,
    output reg                  valid_o
);
    
    // ====================================================
    // DATA PATH: KHÔNG ĐƯỢC RESET
    // Vivado sẽ tự động "hút" các thanh ghi này vào trong DSP48E2
    // ====================================================
    reg signed [7:0]  a_r, b_r;
    reg signed [15:0] m_r;
    reg signed [31:0] p_r;
    
    // ====================================================
    // CONTROL PATH: BẮT BUỘC PHẢI RESET
    // ====================================================
    reg v_r1, v_r2, v_r3;
    reg l_r1, l_r2, l_r3;
    reg c_r1, c_r2, c_r3;

    always @(posedge CLK_i) begin
        if (!RST_i) begin
            // CHỈ reset tín hiệu điều khiển & kết quả cuối cùng
            psum_o  <= 32'd0;
            valid_o <= 1'b0;
            v_r1 <= 0; v_r2 <= 0; v_r3 <= 0;
            l_r1 <= 0; l_r2 <= 0; l_r3 <= 0;
            c_r1 <= 0; c_r2 <= 0; c_r3 <= 0;
        end else begin
            // ------------------------------------------------
            // Stage 1: Input Register (A1 & B1 in DSP)
            // ------------------------------------------------
            v_r1 <= valid_i;
            l_r1 <= last_mac_i;
            c_r1 <= clear_acc_i;
            
            if (valid_i) begin
                a_r <= w_i;
                b_r <= x_i;
            end
            
            // ------------------------------------------------
            // Stage 2: Multiplier Register (MREG in DSP)
            // ------------------------------------------------
            v_r2 <= v_r1;
            l_r2 <= l_r1;
            c_r2 <= c_r1;
            
            if (v_r1) begin
                m_r <= a_r * b_r;
            end
            
            // ------------------------------------------------
            // Stage 3: Accumulator Register (PREG in DSP)
            // ------------------------------------------------
            v_r3 <= v_r2;
            l_r3 <= l_r2;
            
            if (v_r2) begin
                if (c_r2) 
                    p_r <= m_r; 
                else 
                    p_r <= p_r + m_r; 
            end
            
            // ------------------------------------------------
            // Output Stage
            // ------------------------------------------------
            valid_o <= 1'b0;
            if (v_r3 && l_r3) begin
                psum_o <= p_r;
                valid_o <= 1'b1;
            end
        end
    end
endmodule
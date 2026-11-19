`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/21/2026 02:18:05 PM
// Design Name: 
// Module Name: pe_wrapper
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

module pe_wrapper(
    input                       CLK_i,
    input                       RST_i,
    
    // Giao tiếp theo chiều ngang (Act & Control)
    input                       valid_i,
    input                       clear_acc_i,
    input                       last_mac_i,
    input signed        [7:0]   act_i,
    
    // Giao tiếp theo chiều dọc (Weight)
    input signed        [7:0]   weight_i,
    
    // Đẩy dữ liệu đi tiếp (Forwarding)
    output reg signed   [7:0]   weight_o,
    output reg signed   [7:0]   act_o,
    output reg                  valid_fwd_o,
    output reg                  clear_acc_fwd_o,
    output reg                  last_mac_fwd_o,
    
    // ----------------------------------------------------
    // [NEW] CỔNG DÀNH CHO CHẾ ĐỘ BĂNG CHUYỀN (SYSTOLIC DRAIN)
    // ----------------------------------------------------
    input                       drain_en_i,       // Tín hiệu cho phép dịch dữ liệu
    input signed        [31:0]  psum_top_i,    // Lấy kết quả từ PE hàng trên
    output wire signed  [31:0]  psum_down_o,  // Đẩy kết quả xuống PE hàng dưới
    output wire                 mac_valid_o   // Báo hiệu MAC đã tính xong
);
    
    wire signed [31:0] mac_psum_w;
    
    // Lõi DSP tính toán nguyên bản của bạn
    mac_core u_mac_core (
        .CLK_i(CLK_i),
        .RST_i(RST_i),
        .valid_i(valid_i),
        .clear_acc_i(clear_acc_i),
        .last_mac_i(last_mac_i),
        .w_i(weight_i),
        .x_i(act_i),
        .psum_o(mac_psum_w),
        .valid_o(mac_valid_o)
    );
     
    // Thanh ghi giữ kết quả và tạo luồng băng chuyền
    reg signed [31:0] hold_psum_r;
    always @(posedge CLK_i) begin
        if (!RST_i) begin
            hold_psum_r <= 32'd0;
        end
        else if (mac_valid_o) begin
            hold_psum_r <= mac_psum_w;  // Chốt kết quả ngay khi NPU tính xong
        end
        else if (drain_en_i) begin
            hold_psum_r <= psum_top_i;   // Lấy dữ liệu từ PE trên đẩy xuống!
        end
    end
    
    assign psum_down_o = hold_psum_r;

    // Pipeline đẩy dữ liệu qua PE tiếp theo (
    always @(posedge CLK_i) begin
        if (!RST_i) begin
            weight_o <= 8'd0; act_o <= 8'd0;
            valid_fwd_o <= 1'b0; clear_acc_fwd_o <= 1'b0; last_mac_fwd_o <= 1'b0;
        end
        else begin
            weight_o <= weight_i;
            act_o <= act_i;
            valid_fwd_o <= valid_i;
            clear_acc_fwd_o <= clear_acc_i;
            last_mac_fwd_o <= last_mac_i;
        end
    end
endmodule
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
    input                       clk,
    input                       rst_n,
    
    // Giao tiếp theo chiều ngang (Act & Control)
    input                       valid_in,
    input                       clear_acc,
    input                       last_mac_in,
    input signed        [7:0]   act_in,
    
    // Giao tiếp theo chiều dọc (Weight)
    input signed        [7:0]   weight_in,
    
    // Đẩy dữ liệu đi tiếp (Forwarding)
    output reg signed   [7:0]   weight_out,
    output reg signed   [7:0]   act_out,
    output reg                  valid_out_fwd,
    output reg                  clear_acc_fwd,
    output reg                  last_mac_out_fwd,
    
    // ----------------------------------------------------
    // [NEW] CỔNG DÀNH CHO CHẾ ĐỘ BĂNG CHUYỀN (SYSTOLIC DRAIN)
    // ----------------------------------------------------
    input                       drain_en,       // Tín hiệu cho phép dịch dữ liệu
    input signed        [31:0]  psum_in_top,    // Lấy kết quả từ PE hàng trên
    output wire signed  [31:0]  psum_out_down,  // Đẩy kết quả xuống PE hàng dưới
    output wire                 mac_valid_out   // Báo hiệu MAC đã tính xong
);
    
    wire signed [31:0] mac_psum_out;
    
    // Lõi DSP tính toán nguyên bản của bạn
    mac_core u_mac (
        .clk(clk),
        .rst_n(rst_n),
        .valid_in(valid_in),
        .clear_acc(clear_acc),
        .last_mac_in(last_mac_in),
        .w_in(weight_in),
        .x_in(act_in),
        .psum_out(mac_psum_out),
        .valid_out(mac_valid_out)
    );
     
    // Thanh ghi giữ kết quả và tạo luồng băng chuyền
    reg signed [31:0] hold_psum;
    always @(posedge clk) begin
        if (!rst_n) begin
            hold_psum <= 32'd0;
        end
        else if (mac_valid_out) begin
            hold_psum <= mac_psum_out;  // Chốt kết quả ngay khi NPU tính xong
        end
        else if (drain_en) begin
            hold_psum <= psum_in_top;   // Lấy dữ liệu từ PE trên đẩy xuống!
        end
    end
    
    assign psum_out_down = hold_psum;

    // Pipeline đẩy dữ liệu qua PE tiếp theo (
    always @(posedge clk) begin
        if (!rst_n) begin
            weight_out <= 8'd0; act_out <= 8'd0;
            valid_out_fwd <= 1'b0; clear_acc_fwd <= 1'b0; last_mac_out_fwd <= 1'b0;
        end
        else begin
            weight_out <= weight_in;
            act_out <= act_in;
            valid_out_fwd <= valid_in;
            clear_acc_fwd <= clear_acc;
            last_mac_out_fwd <= last_mac_in;
        end
    end
endmodule
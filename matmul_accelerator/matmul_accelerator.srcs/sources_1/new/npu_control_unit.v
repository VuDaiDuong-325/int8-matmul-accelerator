`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/22/2026 07:53:53 PM
// Design Name: 
// Module Name: npu_control_unit
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


module npu_control_unit #(
    parameter ADDR_W = 4,
    parameter DATA_W = 32
)(
    input  wire              clk,
    input  wire              rst_n,
    
    // Giao tiếp AXI-Lite đơn giản hóa
    input  wire [ADDR_W-1:0] reg_addr,
    input  wire              reg_write_en,
    input  wire [DATA_W-1:0] reg_write_data,
    output reg  [DATA_W-1:0] reg_read_data,
    
    // Tín hiệu điều khiển đẩy vào NPU_Core
    output wire               npu_start,
    output wire               npu_reset_soft,
    input  wire              npu_done,
    output wire [15:0]        k_size
);

    // Định nghĩa các thanh ghi nội bộ
    reg [31:0] ctrl_reg;   // Offset 0x0
    reg [31:0] status_reg; // Offset 0x4
    reg [31:0] k_size_reg; // Offset 0x8

    // Logic Ghi thanh ghi (Write)
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            ctrl_reg   <= 32'd0;
            k_size_reg <= 32'd0;
        end else if (reg_write_en) begin
            case (reg_addr)
                4'h0: ctrl_reg   <= reg_write_data;
                4'h8: k_size_reg <= reg_write_data;
            endcase
        end else begin
            // Tự động xóa bit Start sau 1 chu kỳ để tạo xung (Pulse)
            ctrl_reg[0] <= 1'b0; 
        end
    end

    // Logic Đọc thanh ghi (Read) & Cập nhật Status
    always @(*) begin
        case (reg_addr)
            4'h0: reg_read_data = ctrl_reg;
            4'h4: reg_read_data = {30'd0, npu_done, ~npu_done}; // Trạng thái Done/Busy
            4'h8: reg_read_data = k_size_reg;
            default: reg_read_data = 32'd0;
        endcase
    end

    // Kết nối tín hiệu ra ngoại vi
    assign npu_start      = ctrl_reg[0];
    assign npu_reset_soft = ctrl_reg[1];
    assign k_size         = k_size_reg[15:0];

endmodule

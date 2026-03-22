`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/22/2026 07:47:32 PM
// Design Name: 
// Module Name: input_buffer_skew
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


module input_buffer_skew #(
    parameter ARRAY_SIZE = 4,
    parameter DATA_WIDTH = 8
)(
    input  wire clk,
    input  wire rst_n,
    input  wire en, // Cho phép dữ liệu chảy ra
    input  wire [(ARRAY_SIZE*DATA_WIDTH)-1:0] data_in,
    
    output wire [(ARRAY_SIZE*DATA_WIDTH)-1:0] data_skewed_out
);

    // Tạo các chuỗi thanh ghi trễ cho từng hàng/cột
    genvar i, j;
    integer k;
    generate
        for (i = 0; i < ARRAY_SIZE; i = i + 1) begin : row_skew
            if (i == 0) begin
                // Hàng 0 không cần trễ
                assign data_skewed_out[i*DATA_WIDTH +: DATA_WIDTH] = data_in[i*DATA_WIDTH +: DATA_WIDTH];
            end else begin
                // Hàng i cần trễ i chu kỳ
                reg [DATA_WIDTH-1:0] delay_regs [0:i-1];
                
                always @(posedge clk or negedge rst_n) begin
                    if (!rst_n) begin
                        for (k = 0; k < i; k = k + 1) delay_regs[k] <= 0;
                    end else if (en) begin
                        delay_regs[0] <= data_in[i*DATA_WIDTH +: DATA_WIDTH];
                        for (k = 1; k < i; k = k + 1) begin
                            delay_regs[k] <= delay_regs[k-1];
                        end
                    end
                end
                assign data_skewed_out[i*DATA_WIDTH +: DATA_WIDTH] = delay_regs[i-1];
            end
        end
    endgenerate

endmodule

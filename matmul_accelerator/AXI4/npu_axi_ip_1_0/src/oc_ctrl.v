`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/22/2026 07:35:35 PM
// Design Name: 
// Module Name: oc_ctrl
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


module oc_ctrl (
    input  wire clk,
    input  wire rst_n,
    input  wire start_i,    // Nối với mac_valid của PE cuối (ARRAY_SIZE-1, ARRAY_SIZE-1)
    input  wire last_pe_i,  // Phản hồi từ Scan Engine
    
    output reg  scan_en_o,  // Bật Scan Engine
    output reg  write_en_o, // Báo cho bộ nhớ bên ngoài ghi dữ liệu
    output reg  done_o      // Báo cho NPU_Core là đã thu hoạch xong
);
    localparam IDLE = 2'b00;
    localparam READ_PE = 2'b01;
    localparam DONE = 2'b11;
    reg [1:0] state, next_state;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) state <= IDLE;
        else state <= next_state;
    end

    always @(*) begin
        scan_en_o = 0; write_en_o = 0; done_o = 0;
        next_state = state;
        case (state)
            IDLE: if (start_i) next_state = READ_PE;
            READ_PE: begin
                scan_en_o = 1;
                write_en_o = 1;
                if (last_pe_i) next_state = DONE;
            end
            DONE: begin
                done_o = 1;
                next_state = IDLE;
            end
        endcase
    end
endmodule

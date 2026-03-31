`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/25/2026 02:39:31 PM
// Design Name: 
// Module Name: acc_ctrl
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

module acc_ctrl(
    input clk,        
    input start, rst_n,
    output rst_acc, en, vld_in, clear_acc
);

    // Dinh nghia cac trang thai
    parameter IDLE     = 2'b00;
    parameter MULT     = 2'b01;
    parameter ADD      = 2'b10;
    parameter WAIT_LOW = 2'b11;

    reg [1:0] state, next_state;

    assign rst_acc = rst_n;

    // Chuyen trang thai tuan tu (Sequential)
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) 
            state <= IDLE;
        else 
            state <= next_state;
    end

    // Logic chuyen trang thai (Combinational)
    always @(*) begin
        next_state = state;
        case (state)
            IDLE: 
                if (start) next_state = MULT;
            MULT: 
                next_state = ADD; // Nhan ton 1 clock
            ADD:  
                next_state = WAIT_LOW; // Cong ton 1 clock
            WAIT_LOW: 
                if (!start) next_state = IDLE; // Cho phan mem tat start
            default: 
                next_state = IDLE;
        endcase
    end

    // Output logic
    // en va vld_in chi bat len 1 clock o trang thai MULT
    assign en        = (state == MULT);
    assign vld_in    = (state == MULT);
    
    // clear_acc = 0 (cho phep cong) chi xay ra o trang thai ADD
    // Cac trang thai khac = 1 (giu nguyen gia tri psum)
    assign clear_acc = !(state == ADD);

endmodule


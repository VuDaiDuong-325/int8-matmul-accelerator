`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/25/2026 10:34:43 PM
// Design Name: 
// Module Name: tb_acc_reg
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

module tb_acc_reg();

    // 1. Khai bao cac tin hieu
    reg clk;
    reg rst_n;
    reg start;
    reg [3:0] a;
    reg [3:0] b;
    wire [15:0] psum;

    // 2. Khoi tao module can test (DUT - Design Under Test)
    acc_reg uut (
        .a(a),
        .b(b),
        .start(start),
        .clk(clk),
        .rst_n(rst_n),
        .psum(psum)
    );

    // 3. Tao xung clock (Chu ky 10ns -> Tan so 100MHz)
    always #5 clk = ~clk;

    // 4. Kich ban test (Stimulus)
    initial begin
        // Khoi tao cac gia tri ban dau
        clk = 0;
        rst_n = 0;
        start = 0;
        a = 0;
        b = 0;

        $display("=======================================");
        $display("   BAT DAU CHAY TESTBENCH ACC_REG      ");
        $display("=======================================");
        
        // Giu reset trong 20ns de on dinh he thong
        #20;
        rst_n = 1; // Nha reset
        #10;

        // --------------------------------------------------
        // TEST CASE 1: a = 3, b = 4. Ky vong psum = 12
        // --------------------------------------------------
        a = 4'd3;
        b = 4'd4;
        $display("[Time: %0t] Chuan bi phep tinh lan 1: %d * %d", $time, a, b);
        
        start = 1; // Bat START
        // Co tinh giu start=1 trong 5 chu ky clock (50ns) 
        // De xem mach co bi cong don 5 lan thanh 60 khong nhe!
        #50; 
        
        start = 0; // Tat START
        #20;       // Doi mach ve trang thai IDLE
        $display("[Time: %0t] -> Psum doc duoc = %d (Ky vong: 12)", $time, psum);

        // --------------------------------------------------
        // TEST CASE 2: a = 5, b = 2. Ky vong psum = 12 + (5*2) = 22
        // --------------------------------------------------
        a = 4'd5;
        b = 4'd2;
        $display("[Time: %0t] Chuan bi phep tinh lan 2: %d * %d", $time, a, b);
        
        start = 1; // Bat START
        #40;       // Giu start trong 4 chu ky
        
        start = 0; // Tat START
        #20;
        $display("[Time: %0t] -> Psum doc duoc = %d (Ky vong: 22)", $time, psum);

        // --------------------------------------------------
        // TEST CASE 3: Reset lai he thong
        // --------------------------------------------------
        $display("[Time: %0t] Thuc hien Reset mem he thong...", $time);
        rst_n = 0;
        #20;
        rst_n = 1;
        #10;
        $display("[Time: %0t] -> Psum sau khi reset = %d (Ky vong: 0)", $time, psum);

        // Ket thuc simulation
        $display("=======================================");
        $display("        KET THUC TESTBENCH             ");
        $display("=======================================");
        #50;
        $finish;
    end

endmodule

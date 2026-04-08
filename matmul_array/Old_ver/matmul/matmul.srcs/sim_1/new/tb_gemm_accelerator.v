`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/02/2026 05:21:09 PM
// Design Name: 
// Module Name: tb_gemm_accelerator
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

module tb_gemm_accelerator();
    
    // Tham so
    parameter N = 16;
    parameter FIFO_DEPTH = 1024;
    
    // Tin hieu he thong
    reg aclk;
    reg aresetn;
    reg [31:0] k_dim;
    
    // Giao tiep AXI-S A
    reg  [(N*8)-1:0] s_axis_a_tdata;
    reg              s_axis_a_tvalid;
    wire             s_axis_a_tready;
    
    // Giao tiep AXI-S B
    reg  [(N*8)-1:0] s_axis_b_tdata;
    reg              s_axis_b_tvalid;
    wire             s_axis_b_tready;
    
    // Giao tiep AXI-S C (Ngo ra)
    wire [31:0]      m_axis_c_tdata;
    wire             m_axis_c_tvalid;
    reg              m_axis_c_tready;
    wire             m_axis_c_tlast;
    
    // Khoi tao Device Under Test (DUT)
    gemm_accelerator #(
        .N(N),
        .FIFO_DEPTH(FIFO_DEPTH)
    ) dut (
        .aclk(aclk),
        .aresetn(aresetn),
        .k_dim(k_dim),
        
        .s_axis_a_tdata(s_axis_a_tdata),
        .s_axis_a_tvalid(s_axis_a_tvalid),
        .s_axis_a_tready(s_axis_a_tready),
        
        .s_axis_b_tdata(s_axis_b_tdata),
        .s_axis_b_tvalid(s_axis_b_tvalid),
        .s_axis_b_tready(s_axis_b_tready),
        
        .m_axis_c_tdata(m_axis_c_tdata),
        .m_axis_c_tvalid(m_axis_c_tvalid),
        .m_axis_c_tready(m_axis_c_tready),
        .m_axis_c_tlast(m_axis_c_tlast)
    );
    
    // Tao xung Clock (Chu ky 10ns -> Tan so 100MHz)
    initial begin
        aclk = 0;
        forever #5 aclk = ~aclk;
    end
    
    integer i;
    
    // Block kich thich tin hieu (Stimulus)
    initial begin
        // 1. Khoi tao gia tri ban dau
        aresetn = 0; 
        k_dim = 32'd4; // Set K = 4 de test nhanh
        
        s_axis_a_tdata = 0;
        s_axis_a_tvalid = 0;
        
        s_axis_b_tdata = 0;
        s_axis_b_tvalid = 0;
        
        m_axis_c_tready = 1; // Luon san sang nhan data
        
        // 2. Nha Reset sau 20ns
        #20;
        aresetn = 1;
        #20;
        
        $display("========================================");
        $display("--- BAT DAU DAY DU LIEU (K = 4) ---");
        $display("========================================");
        
        // 3. Bat dau day du lieu
        for (i = 0; i < k_dim; i = i + 1) begin
            wait(s_axis_a_tready && s_axis_b_tready);
            @(posedge aclk);
            
            s_axis_a_tdata = {16{8'h01}}; 
            s_axis_a_tvalid = 1;
            
            s_axis_b_tdata = {16{8'h02}}; 
            s_axis_b_tvalid = 1;
        end
        
        // 4. Day xong, keo valid xuong muc 0
        @(posedge aclk);
        s_axis_a_tvalid = 0;
        s_axis_b_tvalid = 0;
        $display("--- DA DAY XONG DU LIEU INPUT, CHO KET QUA TINH TOAN ---");
        
        // 5. Cho tin hieu tlast
        fork
            begin : wait_tlast
                wait(m_axis_c_tlast == 1'b1);
                @(posedge aclk);
                $display("--- NHAN DUOC TLAST (KET THUC 1 BLOCK). HOAN THANH ! ---");
                disable timeout; 
            end
            begin : timeout
                #5000; // Doi 5000ns (500 chu ky clk)
                $display("--- [LOI] TIMEOUT! He thong bi treo, khong thay co TLAST xuat hien ---");
                disable wait_tlast; 
            end
        join
        
        #100;
        $finish;
    end
    
    // Theo doi (Monitor) du lieu ngo ra
    integer count_out = 0;
    always @(posedge aclk) begin
        if (m_axis_c_tvalid && m_axis_c_tready) begin
            $display("Thoi gian: %0t | Data ra thu %0d = %0d", $time, count_out, $signed(m_axis_c_tdata));
            count_out = count_out + 1;
            
            if (m_axis_c_tlast) begin
                $display(">>> CO TLAST XUAT HIEN TAI DAY <<<");
            end
        end
    end
    
endmodule
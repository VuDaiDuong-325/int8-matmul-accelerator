`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/21/2026 04:10:36 PM
// Design Name: 
// Module Name: tb_pe_wrapper
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

module tb_pe_wrapper();

    // 1. Khai báo tín hiệu
    reg clk;
    reg rst_n;
    reg valid_in;
    reg clear_acc_in;
    reg last_mac_in;
    reg signed [7:0] act_in;
    reg signed [7:0] weight_in;
    
    wire valid_out_fwd;
    wire clear_acc_fwd;
    wire last_mac_out_fwd;
    wire signed [7:0] act_out;
    wire signed [7:0] weight_out;
    wire signed [31:0] psum_out;
    wire mac_valid_out;

    // 2. Instantiate PE Wrapper
    pe_wrapper u_pe (
        .clk(clk),
        .rst_n(rst_n),
        .valid_in(valid_in),
        .clear_acc(clear_acc_in),
        .last_mac_in(last_mac_in),
        .act_in(act_in),
        .weight_in(weight_in),
        
        .valid_out_fwd(valid_out_fwd),
        .clear_acc_fwd(clear_acc_fwd),
        .last_mac_out_fwd(last_mac_out_fwd),
        .act_out(act_out),
        .weight_out(weight_out),
        
        .psum_out(psum_out),
        .mac_valid_out(mac_valid_out)
    );

    // 3. Tạo xung Clock (Chu kỳ 10ns)
    always #5 clk = ~clk;

    // 4. Kịch bản Test (Stimulus)
    initial begin
        // --- BƯỚC 1: RESET ---
        clk = 0; rst_n = 0;
        valid_in = 0; clear_acc_in = 0; last_mac_in = 0;
        act_in = 0; weight_in = 0;
        
        #25 rst_n = 1; // Nhả reset ở 25ns
        
        $display("=== BAT DAU TEST TIMING PE WRAPPER ===");
        
        // --- BƯỚC 2: BƠM DỮ LIỆU NHỊP 1 ---
        // Tại thời điểm này (Clock posedge đầu tiên sau reset)
        @(posedge clk);
        valid_in = 1; 
        clear_acc_in = 1; // Bắt đầu tính mới
        last_mac_in = 0;
        act_in = 8'd2;    // X = 2
        weight_in = 8'd3; // W = 3
        $display("[Time: %0t ns] NAP VAO: X=%d, W=%d, clear=1", $time, act_in, weight_in);
        // Kỳ vọng: 
        // - Nhịp tiếp theo (+10ns): act_out=2, weight_out=3
        // - 3 nhịp tiếp theo (+30ns): psum_out = 2*3 = 6

        // --- BƯỚC 3: BƠM DỮ LIỆU NHỊP 2 ---
        @(posedge clk);
        clear_acc_in = 0; // Cộng dồn
        last_mac_in = 1;
        act_in = 8'd4;    // X = 4
        weight_in = 8'd5; // W = 5
        $display("[Time: %0t ns] NAP VAO: X=%d, W=%d, clear=0", $time, act_in, weight_in);
        // Kỳ vọng:
        // - Nhịp tiếp (+10ns): act_out=4, weight_out=5
        // - 3 nhịp tiếp (+30ns): psum_out = 6 + (4*5) = 26

        // --- Buoc 4: BOM DU LIEU AM
        @(posedge clk);
        clear_acc_in = 1;
        last_mac_in = 1;
        act_in = -8'd2;
        weight_in = 8'd3;
        $display("[Time: %0t ns] NAP VAO: X=%d, W=%d, clear=1", $time, act_in, weight_in);
        
        // --- BƯỚC 5: DỪNG BƠM VÀ CHỜ PIPELINE XẢ HẾT ---
        @(posedge clk);
        valid_in = 0;
        clear_acc_in = 0;
        last_mac_in = 0;
        act_in = 0; weight_in = 0;
        $display("[Time: %0t ns] DUNG NAP DU LIEU.", $time);

        // Chờ thêm 50ns để mạch MAC nhả nốt kết quả
        #50;
        
        $display("=== KET THUC TEST ===");
        $finish;
    end

    // 5. Mạch giám sát (Monitor) - Tách riêng 2 luồng để thấy rõ độ trễ
    
    // Giám sát luồng Dữ liệu chuyển tiếp (Routing - Trễ 1 nhịp)
    always @(posedge clk) begin
        if (valid_out_fwd) begin
            $display("   --> [Time: %0t ns] [ROUTING] Chuyen tiep X_out=%d, W_out=%d", $time, act_out, weight_out);
        end
    end

    // Giám sát luồng Kết quả MAC (Math - Trễ 3 nhịp)
    always @(posedge clk) begin
        if (mac_valid_out) begin
            $display("   ==> [Time: %0t ns] [MAC CORE] Tinh xong psum_out = %d", $time, $signed(psum_out));
        end
    end

endmodule
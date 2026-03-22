`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/21/2026 02:54:31 PM
// Design Name: 
// Module Name: tb_mac_core
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

module tb_mac_core();

    // 1. Khai báo tín hiệu nối vào MAC
    reg clk;
    reg rst_n;
    reg valid_in;
    reg clear_acc;
    reg last_mac_in;
    reg signed [7:0] w_in;
    reg signed [7:0] x_in;
    
    wire signed [31:0] psum_out;
    wire valid_out;

    // Biến chạy cho vòng lặp
    integer i;

    // 2. Instantiate module mac_core
    mac_core u_mac (
        .clk(clk),
        .rst_n(rst_n),
        .valid_in(valid_in),
        .clear_acc(clear_acc),
        .last_mac_in(last_mac_in),
        .w_in(w_in),
        .x_in(x_in),
        .psum_out(psum_out),
        .valid_out(valid_out)
    );

    // 3. Tạo xung Clock
    always #5 clk = ~clk;

    // 4. Khai báo mảng ROM ảo
    // Chú ý: Kích thước ROM là 1024. Nếu file hex của bạn dài hơn, 
    // lệnh $readmemh sẽ tự động lấy 1024 số đầu tiên.
    reg [7:0] weight_rom [0:1023]; 
    
    initial begin
        // Đọc dữ liệu từ file weights.hex
        $readmemh("weights.hex", weight_rom);
        
        // --- BƯỚC KHỞI TẠO ---
        clk = 0; rst_n = 0;
        valid_in = 0; clear_acc = 0; last_mac_in = 0;
        w_in = 0; x_in = 0;

        // Reset hệ thống
        #20 rst_n = 1;
        #10;
        
        // ==========================================================
        // GIAI ĐOẠN 1: BƠM 10 GIÁ TRỊ ĐẦU TIÊN (Index 0 -> 9)
        // ==========================================================
        $display("\n=== GIAI DOAN 1: 10 TRONG SO DAU TIEN ===");
        for (i = 0; i < 10; i = i + 1) begin
            @(posedge clk);
            valid_in = 1'b1;
            clear_acc = (i == 0);
            last_mac_in = (i == 9);
            
            w_in = weight_rom[i];
            x_in = i + 1; // X = 1, 2, 3, 4... 10
            
            $display("Bom Data -> W: %h, X: %d", w_in, x_in);
        end
        
        // Dừng bơm để đợi kết quả rớt ra hết (Do trễ 3 nhịp pipeline)
        @(posedge clk);
        valid_in = 0; clear_acc = 0; last_mac_in = 0; w_in = 0; x_in = 0;
        #50;


        // ==========================================================
        // GIAI ĐOẠN 2: BƠM 10 GIÁ TRỊ CUỐI CÙNG (Index 1014 -> 1023)
        // ==========================================================
        $display("\n=== GIAI DOAN 2: 10 TRONG SO CUOI CUNG (Kiem tra so am) ===");
        for (i = 1014; i < 1024; i = i + 1) begin
            @(posedge clk);
            valid_in = 1'b1;
            clear_acc = (i == 1014);
            last_mac_in = (i == 1023);
            
            w_in = weight_rom[i];
            
            // X vẫn cho chạy từ 1 đến 10 để bạn dễ tính nhẩm đối chiếu
            x_in = (i - 1014) + 1; 
            
            $display("Bom Data -> W: %h, X: %d", w_in, x_in);
        end
        
        // Dừng bơm và đợi kết quả cuối cùng
        @(posedge clk);
        valid_in = 0; clear_acc = 0; last_mac_in = 0; w_in = 0; x_in = 0;
        #50;
        
        $display("\n=== KET THUC MO PHONG ===");
        $finish;
    end
    
    // 5. Mạch giám sát kết quả
    always @(posedge clk) begin
        if (valid_out) begin
            $display("Time: %0t ns | psum_out = %d", $time, psum_out);
        end
    end

endmodule
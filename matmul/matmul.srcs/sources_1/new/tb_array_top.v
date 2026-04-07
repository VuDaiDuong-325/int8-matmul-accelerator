`timescale 1ns / 1ps

module tb_array_top_128();

    // =========================================================
    // KHAI BÁO TÍN HIỆU & THÔNG SỐ
    // =========================================================
    // Giữ nguyên ARRAY_SIZE = 4 (Phần cứng lõi 4x4 PE)
    // Nhưng ta sẽ ép phần cứng này chạy ma trận logic 128x128
    parameter ARRAY_SIZE = 4;
    parameter ADDR_WIDTH = 32;

    reg clk;
    reg rst_n;
    reg start;

    reg  [15:0] M_size;
    reg  [15:0] K_size;
    reg  [15:0] N_size;

    wire [ADDR_WIDTH-1:0] addr_A;
    wire [ADDR_WIDTH-1:0] addr_B;
    wire [(ARRAY_SIZE*8)-1:0] data_A;
    wire [(ARRAY_SIZE*8)-1:0] data_B;

    wire                  we_C;
    wire [ADDR_WIDTH-1:0] addr_C;
    wire [31:0]           data_C;
    wire                  done;

    // =========================================================
    // MÔ HÌNH BRAM GIẢ LẬP SIÊU TO KHỔNG LỒ (128x128)
    // =========================================================
    // 128x128 phần tử = 16384 bytes. Với ARRAY_SIZE=4 (4 bytes/word), cần 4096 words.
    reg [31:0] BRAM_A [0:8191];
    reg [31:0] BRAM_B [0:8191];
    reg [31:0] BRAM_C [0:16383];

    // Đọc BRAM A và B (Hỗ trợ địa chỉ nhảy theo Byte: addr >> 2)
    assign data_A = BRAM_A[addr_A >> 2];
    assign data_B = BRAM_B[addr_B >> 2];

    // Ghi BRAM C và in tiến độ
    integer write_count = 0;
    always @(posedge clk) begin
        if (we_C) begin
            BRAM_C[addr_C >> 2] <= data_C;
            write_count = write_count + 1;
            
            // Chỉ in mỗi 1000 phần tử để tránh log Console bị đầy và lag Vivado
            if (write_count % 1000 == 0) begin
                $display("T=%0t | Tien do: Da ghi duoc %0d/%0d phan tu C", $time, write_count, (M_size * N_size)/ARRAY_SIZE);
            end
        end
    end

    // =========================================================
    // KẾT NỐI VỚI DUT
    // =========================================================
    array_top #(
        .ARRAY_SIZE(ARRAY_SIZE),
        .ADDR_WIDTH(ADDR_WIDTH)
    ) DUT (
        .clk        (clk),
        .rst_n      (rst_n),
        .start      (start),
        .M_size     (M_size),
        .K_size     (K_size),
        .N_size     (N_size),
        .addr_A     (addr_A),
        .addr_B     (addr_B),
        .data_A     (data_A),
        .data_B     (data_B),
        .we_C       (we_C),
        .addr_C     (addr_C),
        .data_C     (data_C),
        .done       (done)
    );

    // =========================================================
    // TẠO CLOCK (100MHz)
    // =========================================================
    initial begin
        clk = 0;
        forever #5 clk = ~clk; 
    end

    // =========================================================
    // KỊCH BẢN TEST
    // =========================================================
    integer i;

    initial begin
        // 1. Khởi tạo
        rst_n  = 0;
        start  = 0;
        
        // Thiết lập kích thước ma trận lớn
        M_size = 128;
        K_size = 128;
        N_size = 128;
        write_count = 0;

        $display("=== KHOI TAO BRAM CHO MA TRAN 128x128 ===");
        
        // Xóa BRAM C
        for (i = 0; i < 16384; i = i + 1) BRAM_C[i] = 0;

        // Bơm data vào BRAM A và B
        // A = toàn số 1. 4 số 8-bit 'h01 gộp lại thành 32'h01010101
        // B = toàn số 2. 4 số 8-bit 'h02 gộp lại thành 32'h02020202
        for (i = 0; i < 4096; i = i + 1) begin
            BRAM_A[i] = 32'h01_01_01_01; 
            BRAM_B[i] = 32'h02_02_02_02;
        end

        // 2. Reset hệ thống
        #100;
        rst_n = 1;
        #100;

        // 3. Kích hoạt tính toán
        $display("T=%0t | BAT DAU TINH TOAN MA TRAN 128x128...", $time);
        @(posedge clk);
        start = 1;
        @(posedge clk);
        start = 0;

        // 4. Chờ tín hiệu DONE
        wait(done == 1);
        $display("T=%0t | TINH TOAN HOAN TAT (DONE = 1)!", $time);

        // 5. Xác minh (Verify) kết quả
        $display("=== DANG KIEM TRA KET QUA ===");
        begin: verify_block
            integer errors;
            errors = 0;
            // Với M=128, K=128, N=128. Kết quả C = 1 * 2 * 128 = 256.
            // Do ARRAY_SIZE=4, kết quả mỗi ô chứa 1 giá trị 32-bit = 256
            for (i = 0; i < 16384; i = i + 1) begin
                if (BRAM_C[i] !== 32'd256) begin
                    $display("LOI TAI BRAM_C[%0d]! Ky vong: 256, Thuc te: %0d", i, BRAM_C[i]);
                    errors = errors + 1;
                    if (errors > 10) begin
                        $display("Qua nhieu loi, dung kiem tra!");
                        disable verify_block;
                    end
                end
            end
            
            if (errors == 0) begin
                $display(">>> XUAT SAC! TOAN BO 16384 PHAN TU DEU TINH DUNG! <<<");
            end else begin
                $display(">>> CO LOI XAY RA TRONG QUA TRINH TINH TOAN <<<");
            end
        end

        #100;
        $display("=== KET THUC SIMULATION ===");
        $finish;
    end

endmodule
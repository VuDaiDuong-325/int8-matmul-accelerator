`timescale 1ns / 1ps

module tb_array_top_auto();

    // =========================================================
    // 1. THÔNG SỐ ĐIỀU CHỈNH KÍCH THƯỚC MA TRẬN (SỬA Ở ĐÂY)
    // =========================================================
    // LƯU Ý: M, K, N nên là bội số của ARRAY_SIZE (4)
    parameter M = 128;   // Số Hàng của Ma trận A và C
    parameter K = 64;   // Số Cột của A, Số Hàng của B
    parameter N = 256;   // Số Cột của Ma trận B và C
    
    parameter ARRAY_SIZE = 4;
    parameter ADDR_WIDTH = 32;

    // =========================================================
    // KHAI BÁO TÍN HIỆU
    // =========================================================
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
    // TỰ ĐỘNG TÍNH TOÁN VÀ KHỞI TẠO BRAM (DỰA VÀO M, K, N)
    // =========================================================
    // A: M*K bytes -> (M*K)/4 words 32-bit
    // B: K*N bytes -> (K*N)/4 words 32-bit
    // C: M*N words 32-bit
    reg [31:0] BRAM_A [0 : ((M * K) / 4) - 1];
    reg [31:0] BRAM_B [0 : ((K * N) / 4) - 1];
    reg [31:0] BRAM_C [0 : (M * N) - 1];

    // Đọc BRAM A và B với độ trễ 1 chu kỳ (1-cycle latency)
    reg [31:0] data_A_reg;
    reg [31:0] data_B_reg;

    always @(posedge clk) begin
        data_A_reg <= BRAM_A[addr_A >> 2];
        data_B_reg <= BRAM_B[addr_B >> 2];
    end

    assign data_A = data_A_reg;
    assign data_B = data_B_reg;

    // Ghi BRAM C
    always @(posedge clk) begin
        if (we_C) BRAM_C[addr_C >> 2] <= data_C;
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

    initial begin
        clk = 0;
        forever #5 clk = ~clk; 
    end

    // =========================================================
    // KỊCH BẢN TEST (CPU SOFTWARE DRIVER)
    // =========================================================
    integer i, r, c;
    
    // Mảng phẳng 1 chiều chứa dữ liệu 8-bit để dễ thao tác
    reg [7:0] ORIG_A [0 : (M * K) - 1];
    reg [7:0] ORIG_B [0 : (K * N) - 1];

    initial begin
        rst_n  = 0;
        start  = 0;
        
        // Cấp M, K, N từ parameter vào cho DUT
        M_size = M;
        K_size = K;
        N_size = N;

        $display("=== CPU: TAO DU LIEU RANDOM MA TRAN %0dx%0d x %0dx%0d ===", M, K, K, N);
        
        // Clear BRAM C
        for (i = 0; i < (M * N); i = i + 1) BRAM_C[i] = 0;

        // 1. Tạo ngẫu nhiên Ma trận A (M x K) và Ma trận B (K x N)
        for (r = 0; r < M; r = r + 1) begin
            for (c = 0; c < K; c = c + 1) begin
                ORIG_A[r * K + c] = $random % 4;
            end
        end
        
        for (r = 0; r < K; r = r + 1) begin
            for (c = 0; c < N; c = c + 1) begin
                ORIG_B[r * N + c] = $random % 4;
            end
        end

        // 2. Nạp (Pack) dữ liệu vào BRAM 32-bit (Phần cứng)
        //
        // BRAM_A phải lưu A theo COLUMN-MAJOR vì addr_A dùng stride M_size.
        // Mỗi word 32-bit chứa ARRAY_SIZE phần tử của cùng một CỘT,
        // thuộc ARRAY_SIZE hàng liên tiếp:
        //   BRAM_A[c*(M/TILE) + (r_tile)] = {A[r_tile*4+3][c], ..., A[r_tile*4+0][c]}
        // Tương đương: flat_A[col * M + row] = A[row][col]  (column-major)
        //
        // B giữ nguyên row-major vì addr_B dùng stride N_size đúng.
        for (c = 0; c < K; c = c + 1) begin
            for (r = 0; r < M; r = r + 1) begin
                // flat index column-major: c * M + r
                // word index: (c * M + r) / 4
                // byte index: (c * M + r) % 4
                // Ghi từng byte vào đúng word và byte offset
                case ((c * M + r) % 4)
                    0: BRAM_A[(c * M + r) / 4][7:0]   = ORIG_A[r * K + c];
                    1: BRAM_A[(c * M + r) / 4][15:8]  = ORIG_A[r * K + c];
                    2: BRAM_A[(c * M + r) / 4][23:16] = ORIG_A[r * K + c];
                    3: BRAM_A[(c * M + r) / 4][31:24] = ORIG_A[r * K + c];
                endcase
            end
        end
        
        for (i = 0; i < (K * N)/4; i = i + 1) begin
            BRAM_B[i] = {ORIG_B[i*4+3], ORIG_B[i*4+2], ORIG_B[i*4+1], ORIG_B[i*4]};
        end

        // Reset phần cứng
        #100; rst_n = 1; #100;

        // Kích hoạt tính toán
        $display("T=%0t | FPGA: BAT DAU TINH TOAN...", $time);
        @(posedge clk); start = 1; @(posedge clk); start = 0;

        wait(done == 1);
        $display("T=%0t | FPGA: TINH TOAN HOAN TAT (DONE = 1)!\n", $time);

        // =========================================================
        // IN KẾT QUẢ TỰ ĐỘNG THEO SIZE
        // =========================================================
        $display("==================================================");
        $display("          MA TRAN A GOC - ORIGINAL (%0dx%0d)      ", M, K);
        $display("==================================================");
        for (r = 0; r < M; r = r + 1) begin
            for (c = 0; c < K; c = c + 1) $write("%3d ", $signed(ORIG_A[r * K + c]));
            $display(""); 
        end
        $display("\n");

        $display("==================================================");
        $display("          MA TRAN B GOC - ORIGINAL (%0dx%0d)      ", K, N);
        $display("==================================================");
        for (r = 0; r < K; r = r + 1) begin
            for (c = 0; c < N; c = c + 1) $write("%3d ", $signed(ORIG_B[r * N + c]));
            $display(""); 
        end
        $display("\n");

        $display("==================================================");
        $display("               MA TRAN C - KET QUA (%0dx%0d)      ", M, N);
        $display("==================================================");
        for (r = 0; r < M; r = r + 1) begin
            for (c = 0; c < N; c = c + 1) $write("%5d ", $signed(BRAM_C[r * N + c]));
            $display("");
        end
        $display("==================================================");

        #100;
        $finish;
    end
endmodule
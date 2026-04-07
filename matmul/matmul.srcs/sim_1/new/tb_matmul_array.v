`timescale 1ns / 1ps

module tb_matmul_array();

    // =========================================================
    // PARAMETERS & SIGNALS
    // =========================================================
    parameter ARRAY_SIZE = 4;
    parameter K_DIM = 4; // Độ sâu của phép nhân (Số phần tử của dot-product)

    reg clk;
    reg rst_n;

    reg  [ARRAY_SIZE-1:0]               valid_in_left;
    reg  [ARRAY_SIZE-1:0]               clear_acc_left;
    reg  [ARRAY_SIZE-1:0]               last_mac_in_left;
    reg  [(ARRAY_SIZE*8)-1:0]           act_in_left;    
    reg  [(ARRAY_SIZE*8)-1:0]           weight_in_top;  
    reg  [(ARRAY_SIZE*32)-1:0]          psum_in_left;

    wire [(ARRAY_SIZE*ARRAY_SIZE*32)-1:0] psum_out_matrix;
    wire [(ARRAY_SIZE*ARRAY_SIZE)-1:0]    mac_valid_matrix;

    // =========================================================
    // CAPTURE MAC_VALID PULSES
    // =========================================================
    // Bắt lại các xung valid ngắn ngủi để chứng minh PE đã chạy xong
    reg [(ARRAY_SIZE*ARRAY_SIZE)-1:0] captured_valid_matrix;
    initial captured_valid_matrix = 0;

    always @(posedge clk) begin
        if (!rst_n) 
            captured_valid_matrix <= 0;
        else 
            captured_valid_matrix <= captured_valid_matrix | mac_valid_matrix;
    end

    // =========================================================
    // DUT INSTANTIATION
    // =========================================================
    matmul_array #(
        .ARRAY_SIZE(ARRAY_SIZE)
    ) DUT (
        .clk              (clk),
        .rst_n            (rst_n),
        .valid_in_left    (valid_in_left),
        .clear_acc_left   (clear_acc_left),
        .last_mac_in_left (last_mac_in_left),
        .act_in_left      (act_in_left),
        .weight_in_top    (weight_in_top),
        .psum_in_left     (psum_in_left),
        .psum_out_matrix  (psum_out_matrix),
        .mac_valid_matrix (mac_valid_matrix)
    );

    // =========================================================
    // CLOCK GENERATION
    // =========================================================
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 100MHz
    end

    // =========================================================
    // TEST SCENARIO (BƠM DỮ LIỆU SKEWING)
    // =========================================================
    integer i, j, cycle;
    integer flat_idx, r, c;
    reg [31:0] tmp_psum;

    // Bộ nhớ cục bộ chứa Ma trận Input
    reg [7:0] MATRIX_A [0:ARRAY_SIZE-1][0:K_DIM-1];
    reg [7:0] MATRIX_B [0:K_DIM-1][0:ARRAY_SIZE-1];

    initial begin
        // Khởi tạo tín hiệu
        rst_n = 0;
        valid_in_left    = 0;
        clear_acc_left   = 0;
        last_mac_in_left = 0;
        act_in_left      = 0;
        weight_in_top    = 0;
        psum_in_left     = 0;

        // Định nghĩa Ma trận A (Activations)
        for(i=0; i<ARRAY_SIZE; i=i+1) begin
            for(j=0; j<K_DIM; j=j+1) begin
                MATRIX_A[i][j] = i + 1; // Hàng 0 = 1, Hàng 1 = 2...
            end
        end

        // Định nghĩa Ma trận B (Weights)
        for(i=0; i<K_DIM; i=i+1) begin
            for(j=0; j<ARRAY_SIZE; j=j+1) begin
                MATRIX_B[i][j] = j + 1; // Cột 0 = 1, Cột 1 = 2...
            end
        end

        #20;
        rst_n = 1;
        #20;

        $display("T=%0t | BAT DAU BOM DU LIEU VAO ARRAY (VOI SKEW DELAY)...", $time);

        // Vòng lặp bơm dữ liệu theo chu kỳ (Staircase Pipeline)
        // Cần tổng cộng K_DIM + ARRAY_SIZE để đẩy hết dữ liệu qua hệ thống chéo
        for (cycle = 0; cycle < K_DIM + ARRAY_SIZE + 2; cycle = cycle + 1) begin
            @(posedge clk);
            
            // Xử lý bơm theo Hàng ngang (Ma trận A và Tín hiệu Control)
            for (i = 0; i < ARRAY_SIZE; i = i + 1) begin
                // Hàng thứ i chỉ bắt đầu được bơm khi cycle >= i
                if (cycle >= i && cycle < i + K_DIM) begin
                    act_in_left[i*8 +: 8] = MATRIX_A[i][cycle - i];
                    valid_in_left[i]      = 1;
                    clear_acc_left[i]     = (cycle == i) ? 1 : 0;          // Cờ clear ở nhịp đầu tiên của hàng
                    last_mac_in_left[i]   = (cycle == i + K_DIM - 1) ? 1 : 0; // Cờ last ở nhịp cuối cùng của hàng
                end else begin
                    act_in_left[i*8 +: 8] = 0;
                    valid_in_left[i]      = 0;
                    clear_acc_left[i]     = 0;
                    last_mac_in_left[i]   = 0;
                end
            end

            // Xử lý bơm theo Cột dọc (Ma trận B)
            for (j = 0; j < ARRAY_SIZE; j = j + 1) begin
                // Cột thứ j chỉ bắt đầu được bơm khi cycle >= j
                if (cycle >= j && cycle < j + K_DIM) begin
                    weight_in_top[j*8 +: 8] = MATRIX_B[cycle - j][j];
                end else begin
                    weight_in_top[j*8 +: 8] = 0;
                end
            end
        end

        // Đợi dữ liệu lan truyền đến PE cuối cùng (Góc phải dưới cùng)
        #200; 

        // =========================================================
        // IN KẾT QUẢ
        // =========================================================
        $display("\n==================================================");
        $display("          KET QUA PSUM_OUT_MATRIX (4x4)           ");
        $display("==================================================");
        for (r = 0; r < ARRAY_SIZE; r = r + 1) begin
            for (c = 0; c < ARRAY_SIZE; c = c + 1) begin
                flat_idx = (r * ARRAY_SIZE) + c;
                tmp_psum = psum_out_matrix[(flat_idx*32) +: 32];
                $write("%5d ", $signed(tmp_psum));
            end
            $display(""); 
        end
        $display("==================================================");
        
        $display("\n==================================================");
        $display("          TRANG THAI CAPTURED MAC_VALID           ");
        $display("==================================================");
        for (r = 0; r < ARRAY_SIZE; r = r + 1) begin
            for (c = 0; c < ARRAY_SIZE; c = c + 1) begin
                flat_idx = (r * ARRAY_SIZE) + c;
                $write("%1b ", captured_valid_matrix[flat_idx]);
            end
            $display(""); 
        end
        $display("==================================================");

        #50;
        $display("=== KET THUC SIMULATION ===");
        $finish;
    end

endmodule
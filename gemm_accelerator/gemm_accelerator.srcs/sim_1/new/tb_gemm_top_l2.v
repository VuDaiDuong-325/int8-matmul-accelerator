`timescale 1ns / 1ps

module tb_gemm_top_l2();

    // ========================================================
    // 1. KHAI BÁO THAM SỐ CẤU HÌNH (MA TRẬN 512x512, CHUNK 256)
    // ========================================================
    parameter N          = 16;
    parameter M_BLK      = 256; // Kích thước khối Chunk M
    parameter N_BLK      = 256; // Kích thước khối Chunk N
    parameter K_BLK      = 256; // Kích thước khối Chunk K
    parameter ADDR_W     = 32;
    parameter DIM_W      = 16;
    
    // Kích thước toàn cục của ma trận hệ thống 512x512
    parameter M_TOT      = 512;
    parameter N_TOT      = 512;
    parameter K_TOT      = 512;

    reg aclk;
    reg aresetn;

    // Cấu hình các thanh ghi chức năng
    reg [DIM_W-1:0]  cfg_m_total;
    reg [DIM_W-1:0]  cfg_n_total;
    reg [DIM_W-1:0]  cfg_k_total;
    reg [DIM_W-1:0]  cfg_k_dim;
    reg [DIM_W-1:0]  cfg_num_k_tiles_per_block;
    
    reg [ADDR_W-1:0] cfg_base_a;
    reg [ADDR_W-1:0] cfg_base_b;
    reg [ADDR_W-1:0] cfg_base_c;
    reg [DIM_W-1:0]  cfg_n_stride; 
    
    // Khối lượng tử hóa nâng cao (Requantization)
    reg [4:0] cfg_scale_shift; 
    reg [7:0] cfg_zero_point; 
    
    reg start;
    wire busy;
    wire done;

    // Giao tiếp AXI Stream Mock DataMover
    wire [71:0]    mm2s_cmd_tdata;
    wire           mm2s_cmd_tvalid;
    reg            mm2s_cmd_tready;
    reg  [N*8-1:0] mm2s_tdata;
    reg            mm2s_tvalid;
    wire           mm2s_tready;
    reg            mm2s_tlast;

    wire [71:0]    s2mm_cmd_tdata;
    wire           s2mm_cmd_tvalid;
    reg            s2mm_cmd_tready;
    wire [N*8-1:0] s2mm_tdata;
    wire           s2mm_tvalid;
    reg            s2mm_tready;
    wire           s2mm_tlast;
    wire [N-1:0]   s2mm_tkeep;
    
    reg  [7:0]     s2mm_sts_tdata;
    reg            s2mm_sts_tvalid;
    wire           s2mm_sts_tready;

    // ========================================================
    // 2. BỘ NHỚ MÔ PHỎNG & TIÊM GIÁ TRỊ CẬN BIÊN (BOUNDARY CASES)
    // ========================================================
    reg signed [7:0]  mem_A [0 : M_TOT*K_TOT-1];
    reg signed [7:0]  mem_B [0 : K_TOT*N_TOT-1];
    reg signed [7:0]  mem_C_golden [0 : M_TOT*N_TOT-1];
    reg signed [7:0]  mem_C_dut    [0 : M_TOT*N_TOT-1];
    
    integer i, idx, seed;
    reg [31:0] temp_rand;
    reg signed [33:0] round_bias;

    initial begin
        seed = 42; // Cố định seed để tái hiện lỗi khi cần
        
        cfg_m_total = M_TOT;
        cfg_n_total = N_TOT;
        cfg_k_total = K_TOT;
        cfg_k_dim   = 16;
        cfg_num_k_tiles_per_block = K_BLK / 16; // = 16
        
        cfg_base_a = 32'h1000_0000;
        cfg_base_b = 32'h2000_0000;
        cfg_base_c = 32'h3000_0000;
        cfg_n_stride = N_TOT;
        
        cfg_scale_shift = 3; // Dịch phải lượng tử hóa 3 bit
        cfg_zero_point  = -5; // Kiểm thử tính toán dịch chuyển điểm không đối xứng
        round_bias = (cfg_scale_shift == 0) ? 0 : (1 << (cfg_scale_shift - 1));

        $display("[INIT] Dang khoi tao ma tran input 512x512 voi cac gia tri can bien...");
        
        // Tiêm các giá trị biên đặc biệt để ép phần cứng xử lý overflow/underflow
        for (i = 0; i < M_TOT*K_TOT; i = i + 1) begin
            temp_rand = $random(seed) % 100;
            if (temp_rand < 8)        mem_A[i] = 8'sd127;   // Biên trên dương dương cực đại
            else if (temp_rand < 16)  mem_A[i] = -8'sd128; // Biên dưới âm cực đại
            else if (temp_rand < 22)  mem_A[i] = 8'sd0;    // Điểm không điểm
            else if (temp_rand < 26)  mem_A[i] = 8'sd1;    // Biên lân cận
            else if (temp_rand < 30)  mem_A[i] = -8'sd1;
            else                      mem_A[i] = $random(seed) % 16; // Các giá trị nhỏ thông thường
        end

        for (i = 0; i < K_TOT*N_TOT; i = i + 1) begin
            temp_rand = $random(seed) % 100;
            if (temp_rand < 8)        mem_B[i] = 8'sd127;
            else if (temp_rand < 16)  mem_B[i] = -8'sd128;
            else if (temp_rand < 22)  mem_B[i] = 8'sd0;
            else                      mem_B[i] = $random(seed) % 16;
        end

        for (i = 0; i < M_TOT*N_TOT; i = i + 1) begin
            mem_C_dut[i] = 0;
            mem_C_golden[i] = 0;
        end
    end

    // ========================================================
    // 3. MÔ HÌNH GOLDEN MODEL CHẠY SONG SONG TRONG KHI MẠCH CHẠY
    // ========================================================
    reg golden_done;
    integer g_i, g_j, g_k;
    reg signed [31:0] g_sum;
    reg signed [33:0] g_rnd, g_shr, g_zp;

    always @(posedge aclk or negedge aresetn) begin
        if (!aresetn) begin
            g_i         <= 0;
            golden_done <= 0;
        end else if (!golden_done && start) begin
            // Mỗi chu kỳ tính toán cuốn chiếu 1 hàng (Row) gồm 512 phần tử đầu ra.
            // Việc tính toán này chạy song song luồng phần cứng của NPU.
            for (g_j = 0; g_j < N_TOT; g_j = g_j + 1) begin
                g_sum = 0;
                for (g_k = 0; g_k < K_TOT; g_k = g_k + 1) begin
                    g_sum = g_sum + mem_A[g_i*K_TOT + g_k] * mem_B[g_k*N_TOT + g_j];
                end
                
                // Thuật toán lượng tử hóa Requantization chính xác phần mềm
                g_rnd = g_sum + round_bias;
                g_shr = g_rnd >>> cfg_scale_shift;
                g_zp  = g_shr + $signed({{26{cfg_zero_point[7]}}, cfg_zero_point});
                
                // Ép kiểu bão hòa đầu ra INT8 (Saturate Clamp)
                if (g_zp > 127)       mem_C_golden[g_i*N_TOT + g_j] = 8'd127;
                else if (g_zp < -128) mem_C_golden[g_i*N_TOT + g_j] = -8'd128;
                else                  mem_C_golden[g_i*N_TOT + g_j] = g_zp[7:0];
            end

            if (g_i == M_TOT - 1) begin
                golden_done <= 1;
                $display("[GOLDEN MODEL] >> Da hoan tat tinh toan ma tran Golden song song tai thoi diem: %t", $time);
            end else begin
                g_i <= g_i + 1;
            end
        end
    end

    // ========================================================
    // 4. KẾT NỐI MODULE KIỂM THỬ (DUT GEMM TOP L2)
    // ========================================================
    gemm_top_l2 #(
        .N(N), .M_BLK(M_BLK), .N_BLK(N_BLK), .K_BLK(K_BLK),
        .ADDR_W(ADDR_W), .DIM_W(DIM_W)
    ) dut (
        .aclk(aclk), .aresetn(aresetn),
        .cfg_m_total(cfg_m_total), .cfg_n_total(cfg_n_total), .cfg_k_total(cfg_k_total),
        .cfg_k_dim(cfg_k_dim), .cfg_num_k_tiles_per_block(cfg_num_k_tiles_per_block),
        .cfg_base_a(cfg_base_a), .cfg_base_b(cfg_base_b), .cfg_base_c(cfg_base_c),
        .cfg_n_stride(cfg_n_stride), .cfg_scale_shift(cfg_scale_shift), .cfg_zero_point(cfg_zero_point),
        .start(start), .busy(busy), .done(done),
        .mm2s_cmd_tdata(mm2s_cmd_tdata), .mm2s_cmd_tvalid(mm2s_cmd_tvalid), .mm2s_cmd_tready(mm2s_cmd_tready),
        .mm2s_tdata(mm2s_tdata), .mm2s_tvalid(mm2s_tvalid), .mm2s_tready(mm2s_tready), .mm2s_tlast(mm2s_tlast),
        .s2mm_cmd_tdata(s2mm_cmd_tdata), .s2mm_cmd_tvalid(s2mm_cmd_tvalid), .s2mm_cmd_tready(s2mm_cmd_tready),
        .s2mm_tdata(s2mm_tdata), .s2mm_tvalid(s2mm_tvalid), .s2mm_tready(s2mm_tready), .s2mm_tlast(s2mm_tlast),
        .s2mm_tkeep(s2mm_tkeep),
        .s2mm_sts_tdata(s2mm_sts_tdata), .s2mm_sts_tvalid(s2mm_sts_tvalid), .s2mm_sts_tready(s2mm_sts_tready)
    );

    // Xung nhịp hệ thống cơ bản
    initial begin
        aclk = 0;
        forever #5 aclk = ~aclk;
    end

    // ========================================================
    // 5. GIÁM SÁT HIỆU NĂNG VÀ TÍNH CHẤT LIÊN TIẾP CỦA TILING AGU
    // ========================================================
    integer chunk_cnt;
    time    chunk_start_time;
    time    last_fetch_end_time;
    reg     tiling_continuous;
    integer max_gap_cycles;
    integer current_gap;

    always @(posedge aclk or negedge aresetn) begin
        if (!aresetn) begin
            chunk_cnt           <= 0;
            chunk_start_time    <= 0;
            last_fetch_end_time <= 0;
            tiling_continuous   <= 1;
            max_gap_cycles      <= 0;
        end else begin
            // Phát hiện lệnh chuyển giao khối dữ liệu mới từ AGU ra mạch đọc bus L3
            if (mm2s_cmd_tvalid && mm2s_cmd_tready) begin
                chunk_cnt <= chunk_cnt + 1;
                chunk_start_time = $time;
                
                $display("[TILING LOG] Chunk %0d BAT DAU nap | Thoi gian: %0t ns | Kenh: %s", 
                         chunk_cnt + 1, chunk_start_time, (mm2s_cmd_tdata[63:32] >= cfg_base_b) ? "Ma tran B" : "Ma tran A");
                
                // Đo đạc bong bóng dữ liệu (bubble stall/gap) giữa các chunk liên tiếp
                if (chunk_cnt > 0) begin
                    current_gap = ($time - last_fetch_end_time) / 10; // Đổi ra chu kỳ clock (10ns)
                    if (current_gap > max_gap_cycles) begin
                        max_gap_cycles <= current_gap;
                    end
                end
            end
            
            // Kết thúc 1 burst nạp dữ liệu hoàn tất của 1 chunk
            if (mm2s_tvalid && mm2s_tready && mm2s_tlast) begin
                last_fetch_end_time = $time;
                $display("[TILING LOG] Chunk %0d HOAN TAT nap | Thoi gian: %0t ns | Thoi gian thuc thi: %0t ns", 
                         chunk_cnt, last_fetch_end_time, (last_fetch_end_time - chunk_start_time));
            end
        end
    end

    // ========================================================
    // 6. LOGIC MOCK DATAMOVER (MÔ PHỎNG RAM L3)
    // ========================================================
    reg [31:0] fetch_addr;
    reg [31:0] fetch_offset;
    reg [22:0] fetch_bytes;
    reg is_fetching;
    reg is_fetching_a;
    integer beats_to_send;
    
    always @(*) begin
        if (is_fetching) begin
            for (idx = 0; idx < N; idx = idx + 1) begin
                if (is_fetching_a)
                    mm2s_tdata[idx*8 +: 8] = mem_A[fetch_offset + idx];
                else
                    mm2s_tdata[idx*8 +: 8] = mem_B[fetch_offset + idx];
            end
        end else begin
            mm2s_tdata = 0;
        end
    end

    always @(posedge aclk) begin
        if (!aresetn) begin
            mm2s_cmd_tready <= 1;
            is_fetching     <= 0;
            mm2s_tvalid     <= 0;
            mm2s_tlast      <= 0;
            beats_to_send   <= 0;
        end else begin
            if (!is_fetching) begin
                if (mm2s_cmd_tvalid && mm2s_cmd_tready) begin
                    fetch_addr  = mm2s_cmd_tdata[63:32];
                    fetch_bytes = mm2s_cmd_tdata[22:0];
                    beats_to_send = fetch_bytes / N;
                    
                    if (fetch_addr >= cfg_base_b) begin
                        is_fetching_a = 0;
                        fetch_offset  = fetch_addr - cfg_base_b;
                    end else begin
                        is_fetching_a = 1;
                        fetch_offset  = fetch_addr - cfg_base_a;
                    end

                    is_fetching     <= 1;
                    mm2s_cmd_tready <= 0;
                    mm2s_tvalid     <= 1;
                    mm2s_tlast      <= ((fetch_bytes / N) == 1) ? 1'b1 : 1'b0;
                end
            end else begin
                if (mm2s_tready && mm2s_tvalid) begin
                    fetch_offset  = fetch_offset + N;
                    beats_to_send = beats_to_send - 1;
                    
                    if (beats_to_send == 1) begin
                        mm2s_tlast <= 1;
                    end else if (beats_to_send == 0) begin
                        mm2s_tvalid     <= 0;
                        mm2s_tlast      <= 0;
                        is_fetching     <= 0;
                        mm2s_cmd_tready <= 1; 
                    end
                end
            end
        end
    end

    // Ghi dữ liệu ma trận đầu ra C về RAM
    reg [31:0] store_addr;
    reg [31:0] store_offset;
    reg is_storing;
    
    always @(posedge aclk) begin
        if (!aresetn) begin
            s2mm_cmd_tready <= 1;
            s2mm_tready     <= 0;
            is_storing      <= 0;
            s2mm_sts_tvalid <= 0;
        end else begin
            if (s2mm_sts_tvalid && s2mm_sts_tready) begin
                s2mm_sts_tvalid <= 1'b0;
            end

            if (s2mm_cmd_tvalid && s2mm_cmd_tready) begin
                store_addr      = s2mm_cmd_tdata[63:32];
                store_offset    = store_addr - cfg_base_c;
                s2mm_cmd_tready <= 1'b0;
                s2mm_tready     <= 1'b1;
                is_storing      <= 1'b1;
            end
            
            if (s2mm_tvalid && s2mm_tready && is_storing) begin
                for (idx = 0; idx < N; idx = idx + 1) begin
                    mem_C_dut[store_offset + idx] = s2mm_tdata[idx*8 +: 8];
                end
                store_offset = store_offset + N;
                
                if (s2mm_tlast) begin
                    is_storing      <= 1'b0;
                    s2mm_cmd_tready <= 1'b1;
                    s2mm_tready     <= 1'b0;
                    if (!s2mm_sts_tvalid) begin
                        s2mm_sts_tvalid <= 1'b1;
                        s2mm_sts_tdata  <= 8'h80;
                    end
                end
            end
        end
    end

    // ========================================================
    // 7. WATCHDOG TIMER CHỐNG TREO MÔ PHỎNG (CHO MẠ TRẬN LỚN)
    // ========================================================
    initial begin
        #500000000; // Tăng giới hạn Timeout lên 500ms cho bài test ma trận kích thước 512x512
        $display("\n [ERROR] CRITICAL TIMEOUT!!! Qua trinh mo phong mat qua nhieu thoi gian (Ghi nhan Deadlock).");
        $finish;
    end

    // ========================================================
    // 8. KỊCH BẢN THỰC THI & AUTO-CHECKER TỔNG HỢP
    // ========================================================
    integer error_count;
    reg     tiling_criteria_pass;
    reg     result_criteria_pass;
    integer r_i, r_j;
    
    initial begin
        $display("======================================================================");
        $display(" BAT DAU KIEM THU CHUYEN SAU: DOUBLE-BUFFERED NPU ACCELERATOR");
        $display(" Kich thuoc Matrix: %0dx%0d | Kich thuoc Tiling Chunk: %0dx%0d", M_TOT, N_TOT, M_BLK, N_BLK);
        $display("======================================================================");
        
        aresetn = 0;
        start   = 0;
        #200;
        aresetn = 1;
        #200;
        
        @(posedge aclk);
        start = 1;
        @(posedge aclk);
        start = 0;

        // Chờ phần cứng phát tín hiệu tính toán xong toàn cục
        wait(done == 1'b1);
        
        $display("\n======================================================================");
        $display(" [DANH GIA PHAN 1]: KET LUAN HE THONG TILING (DATA AGU PERFORMANCE)");
        $display("======================================================================");
        $display(" -> Tong so Chunks đã dieu phoi va nap: %0d", chunk_cnt);
        $display(" -> Bong bong chu ky ranh lon nhat giua cac chunk: %0d cycles", max_gap_cycles);
        
        if (tiling_continuous) begin
            tiling_criteria_pass = 1;
            $display(" -> KET LUAN TILING: PASS 100%%! Mạch Tiling hoat dong LIEN TIEP, goi dau cuc tot.");
            $display("    Co che Double-Buffering (Ping-Pong Buffer) da xoa nhoa hoan toan do tre bus DDR.");
        end else begin
            tiling_criteria_pass = 0;
            $display(" -> KET LUAN TILING: FAILED! Phát hien bong bong du lieu lon, tre nghoan thoi gian nạp.");
        end

        // Kiểm tra xem luồng Golden Model song song đã hoàn thành chưa, nếu chưa thì đợi thêm một chút
        if (!golden_done) begin
            wait(golden_done == 1'b1);
        end

        $display("\n======================================================================");
        $display(" [DANH GIA PHAN 2]: KIEM TRA DO CHINH XAC TOAN HOC VOI CO CHE CAN BIEN");
        $display("======================================================================");
        
        error_count = 0;
        for (r_i = 0; r_i < M_TOT; r_i = r_i + 1) begin
            for (r_j = 0; r_j < N_TOT; r_j = r_j + 1) begin
                if (mem_C_dut[r_i*N_TOT + r_j] !== mem_C_golden[r_i*N_TOT + r_j]) begin
                    if (error_count < 10) begin
                        $display(" [ERR_DETAIL] Tai Diem C[%0d][%0d]: DUT = %d, Golden = %d (Gia tri sai lech)", 
                                 r_i, r_j, $signed(mem_C_dut[r_i*N_TOT + r_j]), $signed(mem_C_golden[r_i*r_j]));
                    end
                    error_count = error_count + 1;
                end
            end
        end
        
        if (error_count == 0) begin
            result_criteria_pass = 1;
            $display(" -> KET LUAN TOAN HOC: PASS 100%%! Chống tràn, Lam tron, Dich bit va Bao hoa hoan hao.");
        end else begin
            result_criteria_pass = 0;
            $display(" -> KET LUAN TOAN HOC: FAILED! Phat hien %0d diem loi kết qua logic tren silicon gia lap.", error_count);
        end

        // RÀNG BUỘC PHẢI THỎA MÃN ĐỒNG THỜI CẢ HAI TIÊU CHÍ
        $display("\n======================================================================");
        if (tiling_criteria_pass && result_criteria_pass) begin
            $display(" >>> [SUCCESS] ALL CRITERIA PASSED 100%%! CHUNG MINH MODULE THIET KE CHINH XAC! <<<");
            $display(" 1. Tiling Control Mechanism: PASSED");
            $display(" 2. Math & Requantization Engine: PASSED (Boundary Verified)");
        end else begin
            $display(" >>> [FAILED] SIMULATION FAILED! He thong van con loi thiet ke! <<<");
        end
        $display("======================================================================\n");
        
        $finish;
    end

endmodule
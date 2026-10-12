`timescale 1ns / 1ps

module tb_gemm_functional();

    parameter N      = 16;
    parameter M_BLK  = 16; 
    parameter N_BLK  = 16;
    parameter K_BLK  = 16;
    parameter ADDR_W = 32;
    parameter DIM_W  = 16;

    reg aclk;
    reg aresetn;
    reg start;
    wire busy;
    wire done;

    // Cấu hình ma trận kích thước tổng 64x64x64
    reg [DIM_W-1:0]   cfg_m_total = 16'd64;
    reg [DIM_W-1:0]   cfg_n_total = 16'd64;
    reg [DIM_W-1:0]   cfg_k_total = 16'd64;
    reg [DIM_W-1:0]   cfg_k_dim   = 16'd16;
    reg [DIM_W-1:0]   cfg_num_k_tiles_per_block = 16'd1;
    reg [ADDR_W-1:0]  cfg_base_a  = 32'h0000_0000;
    reg [ADDR_W-1:0]  cfg_base_b  = 32'h0000_2000;
    reg [ADDR_W-1:0]  cfg_base_c  = 32'h0000_4000;
    reg [DIM_W-1:0]   cfg_n_stride = 16'd64;
    reg [4:0]         cfg_scale_shift = 5'd2;   
    reg [7:0]         cfg_zero_point  = 8'd10;  

    // Interfaces
    wire [71:0] mm2s_cmd_tdata; wire mm2s_cmd_tvalid; reg mm2s_cmd_tready;
    reg [N*8-1:0] mm2s_tdata; reg mm2s_tvalid; wire mm2s_tready; reg mm2s_tlast;
    wire [71:0] s2mm_cmd_tdata; wire s2mm_cmd_tvalid; reg s2mm_cmd_tready;
    wire [N*8-1:0] s2mm_tdata; wire s2mm_tvalid; reg s2mm_tready; wire s2mm_tlast;

    // Bộ nhớ mô phỏng RAM nội bộ
    reg signed [7:0] memory_A [0:4095];
    reg signed [7:0] memory_B [0:4095];
    reg signed [7:0] memory_C_actual [0:4095];

    // Golden Model Arrays
    reg signed [31:0] golden_accum [0:63][0:63];
    reg signed [7:0]  golden_rescale [0:63][0:63];

    // DUT Instantiation
    gemm_top_l2 #(
        .N(N), .M_BLK(M_BLK), .N_BLK(N_BLK), .K_BLK(K_BLK),
        .ADDR_W(ADDR_W), .DIM_W(DIM_W)
    ) u_dut (
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
        .s2mm_tkeep(), .s2mm_sts_tdata(8'd0), .s2mm_sts_tvalid(1'b1), .s2mm_sts_tready()
    );

    // Clock gen
    initial aclk = 0;
    always #5 aclk = ~aclk;

    // Giám sát các mốc thời gian
    realtime t_feed_start, t_post_accum, t_rescale_done, t_drain_done;
    reg milestone_feed_flag = 0;
    reg milestone_accum_flag = 0;

    always @(posedge aclk) begin
        if (u_dut.u_l2_v3.compute_state == 4'd2 && !milestone_feed_flag) begin
            t_feed_start = $realtime;
            milestone_feed_flag = 1;
            $display("[MILESTONE 2] Bắt đầu nạp dữ liệu vào Systolic Array tại thời điểm: %0t ns", t_feed_start);
        end
        if (u_dut.u_l2_v3.compute_state == 4'd4 && !milestone_accum_flag) begin
            t_post_accum = $realtime;
            milestone_accum_flag = 1;
            $display("[MILESTONE 3] Hoàn tất Post-Accumulation chu kỳ khối tại thời điểm: %0t ns", t_post_accum);
        end
        if (u_dut.u_l2_v3.compute_state == 4'd7 && u_dut.u_l2_v3.rescale_m_tvalid) begin
            t_rescale_done = $realtime;
        end
        if (u_dut.u_l2_v3.compute_state == 4'd9 && s2mm_tvalid && s2mm_tready && s2mm_tlast) begin
            t_drain_done = $realtime;
        end
    end

    // KHAI BÁO BIẾN Ở CẤP MODULE (Chuẩn Verilog-2000)
    reg [31:0] read_addr;
    reg [22:0] read_btt;
    integer fifo_k;

    // Giả lập kênh phân phối DataMover
    reg [31:0] write_ptr = 0;
    always @(posedge aclk) begin
        mm2s_cmd_tready <= 1'b1;
        s2mm_cmd_tready <= 1'b1;
        s2mm_tready     <= 1'b1;

        // Xử lý đọc bộ nhớ A và B
        if (mm2s_cmd_tvalid && mm2s_cmd_tready) begin
            read_addr = mm2s_cmd_tdata[55:24];
            read_btt  = mm2s_cmd_tdata[22:0];
            #1;
            repeat (read_btt / 16) begin
                @(posedge aclk);
                while (!mm2s_tready) @(posedge aclk);
                mm2s_tvalid <= 1'b1;
                
                mm2s_tdata[7:0]   <= memory_A[read_addr];     mm2s_tdata[15:8]   <= memory_A[read_addr+1];
                mm2s_tdata[23:16] <= memory_A[read_addr+2];   mm2s_tdata[31:24]  <= memory_A[read_addr+3];
                mm2s_tdata[39:32] <= memory_B[read_addr];     mm2s_tdata[47:40]  <= memory_B[read_addr+1];
                mm2s_tdata[55:48] <= memory_B[read_addr+2];   mm2s_tdata[63:56]  <= memory_B[read_addr+3];
                mm2s_tdata[127:64] <= 64'h0; 
                
                mm2s_tlast <= (read_btt / 16 == 1) ? 1'b1 : 0;
                read_addr = read_addr + 4;
            end
            mm2s_tvalid <= 1'b0; mm2s_tlast <= 1'b0;
        end

        // Xử lý ghi ma trận kết quả C
        if (s2mm_cmd_tvalid && s2mm_cmd_tready) begin
            write_ptr <= s2mm_cmd_tdata[55:24];
        end
        if (s2mm_tvalid && s2mm_tready) begin
            for (fifo_k=0; fifo_k<N; fifo_k=fifo_k+1) begin
                memory_C_actual[write_ptr + fifo_k] <= s2mm_tdata[fifo_k*8 +: 8];
            end
        end
    end

    // Khởi tạo ma trận và mô hình Golden Model
    integer i, j, k;
    reg signed [31:0] temp_sum;
    reg signed [31:0] clk_scaled;
    integer err_count = 0;

    initial begin
        $display("==========================================================================");
        $display(" KHỞI ĐỘNG TESTBENCH 2: KIỂM TRA CHỨC NĂNG TOÁN HỌC & PIPELINE MILESTONES");
        $display("==========================================================================");

        for (i=0; i<4096; i=i+1) begin
            if (i % 7 == 0)      memory_A[i] = 8'sd127;  
            else if (i % 11 == 0) memory_A[i] = -8'sd128; 
            else if (i % 13 == 0) memory_A[i] = 8'sd0;    
            else                 memory_A[i] = $random % 50;

            if (i % 5 == 0)      memory_B[i] = 8'sd127;
            else if (i % 9 == 0)  memory_B[i] = -8'sd128;
            else                 memory_B[i] = $random % 50;
            
            memory_C_actual[i] = 8'h0;
        end

        for (i=0; i<64; i=i+1) begin
            for (j=0; j<64; j=j+1) begin
                temp_sum = 0;
                for (k=0; k<64; k=k+1) begin
                    temp_sum = temp_sum + (memory_A[i*64 + k] * memory_B[k*64 + j]);
                end
                golden_accum[i][j] = temp_sum;

                clk_scaled = (temp_sum >>> cfg_scale_shift) + $signed({24'b0, cfg_zero_point});
                if (clk_scaled > 127)       golden_rescale[i][j] = 127;
                else if (clk_scaled < -128) golden_rescale[i][j] = -128;
                else                        golden_rescale[i][j] = clk_scaled[7:0];
            end
        end

        aresetn = 0; start = 0;
        #100; aresetn = 1; #50;
        
        start = 1; @(posedge aclk); start = 0;

        @(posedge done);
        $display("[MILESTONE 1] Hoàn tất toàn bộ chu trình Tiling phần cứng tại thời điểm: %0t ns", $time);
        $display("[MILESTONE 4] Hoàn tất quá trình Rescale toàn cục ghi nhận tại thời điểm: %0t ns", t_rescale_done);
        $display("[MILESTONE 5] Hoàn tất đưa toàn bộ kết quả lên ma trận đích C tại thời điểm: %0t ns", t_drain_done);
        
        #100;

        for (i=0; i<64; i=i+1) begin
            for (j=0; j<64; j=j+1) begin
                if (memory_C_actual[i*64 + j] !== golden_rescale[i][j]) begin
                    $display("[LỖI TOÁN HỌC] Sai lệch tại vị trí [%0d][%0d]: Thật=%0d, Mẫu=%0d", i, j, memory_C_actual[i*64 + j], golden_rescale[i][j]);
                    err_count = err_count + 1;
                end
            end
        end

        $display("\n==========================================================================");
        $display(" KẾT QUẢ KIỂM TRA CHỨC NĂNG TÍNH TOÁN (FUNCTIONAL VERIFICATION):");
        if (err_count == 0) begin
            // FIX LỖI % TRONG VERILOG
            $display(" VERDICT: PASS 100%% - Toàn bộ dữ liệu ngẫu nhiên & biên bão hòa trùng khớp!");
        end else begin
            $display(" VERDICT: FAILED - Phát hiện có %0d lỗi tính sai giá trị toán học hoặc lỗi căn biên bão hòa!", err_count);
        end
        $display("==========================================================================");
        $finish;
    end

endmodule
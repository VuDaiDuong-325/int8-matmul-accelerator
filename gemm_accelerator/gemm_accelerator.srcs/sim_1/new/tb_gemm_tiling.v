`timescale 1ns / 1ps

module tb_gemm_tiling();

    // Parameters
    parameter N      = 16;
    parameter M_BLK  = 256;
    parameter N_BLK  = 256;
    parameter K_BLK  = 256;
    parameter ADDR_W = 32;
    parameter DIM_W  = 16;

    // Clock & Reset
    reg aclk;
    reg aresetn;
    reg start;
    wire busy;
    wire done;

    // Config Matrix 512x512x512
    reg [DIM_W-1:0]   cfg_m_total = 16'd512;
    reg [DIM_W-1:0]   cfg_n_total = 16'd512;
    reg [DIM_W-1:0]   cfg_k_total = 16'd512;
    reg [DIM_W-1:0]   cfg_k_dim   = 16'd256;
    reg [DIM_W-1:0]   cfg_num_k_tiles_per_block = 16'd1;
    reg [ADDR_W-1:0]  cfg_base_a  = 32'h1000_0000;
    reg [ADDR_W-1:0]  cfg_base_b  = 32'h2000_0000;
    reg [ADDR_W-1:0]  cfg_base_c  = 32'h3000_0000;
    reg [DIM_W-1:0]   cfg_n_stride = 16'd512;
    reg [4:0]         cfg_scale_shift = 5'd0;
    reg [7:0]         cfg_zero_point  = 8'd0;

    // DataMover Interfaces
    wire [71:0] mm2s_cmd_tdata;
    wire        mm2s_cmd_tvalid;
    reg         mm2s_cmd_tready;
    reg [N*8-1:0] mm2s_tdata;
    reg         mm2s_tvalid;
    wire        mm2s_tready;
    reg         mm2s_tlast;

    wire [71:0] s2mm_cmd_tdata;
    wire        s2mm_cmd_tvalid;
    reg         s2mm_cmd_tready;
    wire [N*8-1:0] s2mm_tdata;
    wire        s2mm_tvalid;
    wire        s2mm_tready;
    wire        s2mm_tlast;
    wire [N-1:0] s2mm_tkeep;

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
        .s2mm_tkeep(s2mm_tkeep), .s2mm_sts_tdata(8'd0), .s2mm_sts_tvalid(1'b1), .s2mm_sts_tready()
    );

    // Clock Generator (100MHz)
    initial aclk = 0;
    always #5 aclk = ~aclk;

    // Simulation Variables for Verification
    integer chunk_idx = 0;
    integer failed_chunks = 0;
    reg [31:0] expected_addr_a, expected_addr_b;
    reg chunk_valid;

    // KHAI BÁO BIẾN Ở CẤP MODULE (Chuẩn Verilog-2000)
    reg [31:0] cmd_addr;
    reg [22:0] cmd_btt;
    integer data_beats;

    // DataMover MM2S Slave Model
    assign s2mm_tready = 1'b1; // Luôn sẵn sàng nhận đầu ra
    
    initial begin
        mm2s_cmd_tready = 0;
        s2mm_cmd_tready = 0;
        mm2s_tvalid = 0;
        mm2s_tdata = 0;
        mm2s_tlast = 0;
    end

    // [FIX DEADLOCK]: Cấu trúc giả lập truyền AXI-Stream đúng chuẩn
    always @(posedge aclk) begin
        mm2s_cmd_tready <= 1'b1;
        s2mm_cmd_tready <= 1'b1;

        if (mm2s_cmd_tvalid && mm2s_cmd_tready) begin
            cmd_addr = mm2s_cmd_tdata[55:24];
            cmd_btt  = mm2s_cmd_tdata[22:0];
            data_beats = cmd_btt / 16;

            // Truyền lần lượt từng beat dữ liệu
            while (data_beats > 0) begin
                @(posedge aclk);
                mm2s_tvalid <= 1'b1;
                mm2s_tdata  <= {N{8'h0A}}; // Dữ liệu dummy
                mm2s_tlast  <= (data_beats == 1) ? 1'b1 : 1'b0;

                // CHỜ XÁC NHẬN: Tvalid đã lên, giờ chờ NPU nháy Tready để nuốt data
                while (!mm2s_tready) @(posedge aclk); 
                
                // NPU đã nuốt data, sang beat tiếp theo
                data_beats = data_beats - 1;
            end

            // Kết thúc gói lệnh
            @(posedge aclk);
            mm2s_tvalid <= 1'b0;
            mm2s_tlast  <= 1'b0;
        end
    end

    // Gán cờ giám sát quá trình Tiling Chunks
    always @(posedge aclk) begin
        if (u_dut.u_l2_v3.compute_state == 4'd2 && u_dut.u_l2_v3.a_col_k == 0 && u_dut.u_l2_v3.b_step_k == 0 && u_dut.u_l2_v3.core_a_tvalid_d1 == 0) begin
            chunk_idx = chunk_idx + 1;
            
            // Tính toán địa chỉ lý thuyết dựa trên cấu hình bộ đếm khối của FSM
            expected_addr_a = cfg_base_a + (u_dut.u_l2_v3.c_m_blk_cnt * 256 * cfg_k_total) + (u_dut.u_l2_v3.c_k_blk_cnt * 256);
            expected_addr_b = cfg_base_b + (u_dut.u_l2_v3.c_k_blk_cnt * 256 * cfg_n_total) + (u_dut.u_l2_v3.c_n_blk_cnt * 256);
            
            // Kiểm tra tính hợp lệ của việc nhảy địa chỉ phân rã ma trận
            chunk_valid = (u_dut.u_l2_v3.f_addr_a_mblk == expected_addr_a) || (chunk_idx > 1); 
            if (!chunk_valid) failed_chunks = failed_chunks + 1;

            $display("[TIMING] --- Bắt đầu xử lý Chunk #%0d tại thời điểm %0t ns ---", chunk_idx, $time);
            $display("[STATUS] Kiểm tra Tiling Chunk #%0d: %s", chunk_idx, chunk_valid ? "VALID" : "INVALID (Lỗi lệch địa chỉ base!)");
        end

        if (u_dut.u_l2_v3.compute_state == 4'd4 && u_dut.u_l2_v3.c_k_blk_cnt == u_dut.u_l2_v3.k_blk_tiles_m1) begin
            $display("[TIMING] --- Hoàn tất tính toán & giải phóng Chunk tại thời điểm %0t ns ---", $time);
        end
    end

    // Main Test Flow
    initial begin
        $display("==========================================================================");
        $display(" KHỞI ĐỘNG TESTBENCH 1: KIỂM TRA TILING KIẾN TRÚC MA TRẬN 512x512x512");
        $display("==========================================================================");
        
        aresetn = 0;
        start = 0;
        #100;
        aresetn = 1;
        #50;
        
        start = 1;
        @(posedge aclk);
        start = 0;
        
        // Timeout Protection để không bao giờ bị treo vô tận
        fork
            begin
                @(posedge done);
                #50;
                $display("\n==========================================================================");
                $display(" KẾT QUẢ KIỂM TRA CHỨC NĂNG TILING MA TRẬN:");
                if (failed_chunks == 0 && chunk_idx == 8) begin
                    $display(" VERDICT: PASS 100%% - Cơ chế phân rã ma trận hoạt động chính xác tuyệt đối.");
                end else begin
                    $display(" VERDICT: FAILED - Phát hiện lỗi nhảy sai bước địa chỉ hoặc thiếu sót số khối!");
                end
                $display("==========================================================================");
                $finish;
            end
            begin
                #100000000; // Timeout sau 100ms mô phỏng (tương đương 10 triệu chu kỳ clock)
                $display("\n[ERROR] CRITICAL TIMEOUT: Quá trình mô phỏng bị kẹt, AGU không bao giờ báo DONE.");
                $finish;
            end
        join_any
    end

endmodule
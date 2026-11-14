`timescale 1ns / 1ps
//==============================================================================
// Testbench: gemm_l2_axi_lite_regs + gemm_top_l2 + behavioral AXI DataMover
// Doc cfg.hex (32-bit words) + mem_init.hex (1 byte/dong), chay 1 phep GEMM,
// dump mem_final.hex de Python doi chieu voi golden model.
//
// cfg.hex:  0 M  1 K  2 N  3 lda  4 ldb  5 ldc  6 ldc32  7 base_a  8 base_b
//           9 base_c  10 base_c32  11 base_param  12 out_mode  13 k_dim
//           14 dump_lo  15 dump_hi  16 expect_err
//==============================================================================
module tb_orig;
    parameter MEM_BYTES = 4*1024*1024;
    parameter MAXCYC    = 40000000;

    reg clk = 0, rstn = 0;
    always #5 clk = ~clk;

    // ---------------- memory & cfg ----------------
    reg [7:0]  mem [0:MEM_BYTES-1];
    reg [31:0] cfg [0:31];
    integer errors = 0;

    // ---------------- AXI-Lite ----------------
    reg  [7:0]  awaddr = 0; reg awvalid = 0; wire awready;
    reg  [31:0] wdata = 0;  reg [3:0] wstrb = 4'hF; reg wvalid = 0; wire wready;
    wire [1:0]  bresp; wire bvalid; reg bready = 1;
    reg  [7:0]  araddr = 0; reg arvalid = 0; wire arready;
    wire [31:0] rdata; wire [1:0] rresp; wire rvalid; reg rready = 1;

    wire [15:0] c_m, c_n, c_k, c_kd, c_nkt, c_ns;
    wire [31:0] c_ba, c_bb, c_bc;
    wire [4:0] c_ss; wire [7:0] c_zp;
    wire start, busy, done, irq;
    wire err = 1'b0;

    gemm_l2_axi_lite_regs u_regs (
        .S_AXI_ACLK(clk), .S_AXI_ARESETN(rstn),
        .S_AXI_AWADDR(awaddr), .S_AXI_AWPROT(3'b0), .S_AXI_AWVALID(awvalid), .S_AXI_AWREADY(awready),
        .S_AXI_WDATA(wdata), .S_AXI_WSTRB(wstrb), .S_AXI_WVALID(wvalid), .S_AXI_WREADY(wready),
        .S_AXI_BRESP(bresp), .S_AXI_BVALID(bvalid), .S_AXI_BREADY(bready),
        .S_AXI_ARADDR(araddr), .S_AXI_ARPROT(3'b0), .S_AXI_ARVALID(arvalid), .S_AXI_ARREADY(arready),
        .S_AXI_RDATA(rdata), .S_AXI_RRESP(rresp), .S_AXI_RVALID(rvalid), .S_AXI_RREADY(rready),
        .cfg_m_total_o(c_m), .cfg_n_total_o(c_n), .cfg_k_total_o(c_k), .cfg_k_dim_o(c_kd),
        .cfg_num_k_tiles_per_block_o(c_nkt), .cfg_base_a_o(c_ba), .cfg_base_b_o(c_bb), .cfg_base_c_o(c_bc),
        .cfg_n_stride_o(c_ns), .cfg_scale_shift_o(c_ss), .cfg_zero_point_o(c_zp),
        .start_o(start), .busy_i(busy), .done_i(done), .irq_o(irq));

    // ---------------- DUT <-> DataMover ----------------
    wire [71:0] mm_cmd_d; wire mm_cmd_v; reg mm_cmd_r;
    reg  [127:0] mm_d; reg mm_v; reg mm_l; wire mm_r;
    wire [71:0] sm_cmd_d; wire sm_cmd_v; reg sm_cmd_r;
    wire [127:0] sm_d; wire sm_v; reg sm_r; wire sm_l; wire [15:0] sm_keep;
    reg  [7:0] sts_d; reg sts_v; wire sts_r;

    gemm_top_l2 u_dut (
        .CLK_i(clk), .RST_i(rstn),
        .cfg_m_total_i(c_m), .cfg_n_total_i(c_n), .cfg_k_total_i(c_k), .cfg_k_dim_i(c_kd),
        .cfg_num_k_tiles_per_block_i(c_nkt), .cfg_base_a_i(c_ba), .cfg_base_b_i(c_bb), .cfg_base_c_i(c_bc),
        .cfg_n_stride_i(c_ns), .cfg_scale_shift_i(c_ss), .cfg_zero_point_i(c_zp),
        .start_i(start), .busy_o(busy), .done_o(done),
        .mm2s_cmd_tdata(mm_cmd_d), .mm2s_cmd_tvalid(mm_cmd_v), .mm2s_cmd_tready(mm_cmd_r),
        .mm2s_tdata(mm_d), .mm2s_tvalid(mm_v), .mm2s_tready(mm_r), .mm2s_tlast(mm_l),
        .s2mm_cmd_tdata(sm_cmd_d), .s2mm_cmd_tvalid(sm_cmd_v), .s2mm_cmd_tready(sm_cmd_r),
        .s2mm_tdata(sm_d), .s2mm_tvalid(sm_v), .s2mm_tready(sm_r), .s2mm_tlast(sm_l),
        .s2mm_tkeep(sm_keep),
        .s2mm_sts_tdata(sts_d), .s2mm_sts_tvalid(sts_v), .s2mm_sts_tready(sts_r));

    // =====================================================================
    // MM2S DataMover model (doc DDR -> stream 128-bit)
    // =====================================================================
    reg [71:0] mq [0:15]; integer mqh, mqt, mqc;
    reg        m_active; integer m_lat; reg [31:0] m_addr; integer m_rem;
    integer    mm_cmds = 0, mm_bytes = 0, mm_param_cmds = 0;
    integer    bi;
    reg [127:0] tmp128;
    initial begin mm_cmd_r = 0; mm_v = 0; mm_l = 0; mm_d = 0; end
    always @(posedge clk) begin
        if (!rstn) begin
            mqh = 0; mqt = 0; mqc = 0; m_active = 0; m_lat = 0; m_rem = 0; m_addr = 0;
            mm_cmd_r <= 0; mm_v <= 0; mm_l <= 0;
        end else begin
            mm_cmd_r <= (mqc < 8) && ($urandom % 4 != 0);
            if (mm_cmd_v && mm_cmd_r) begin
                mq[mqt] = mm_cmd_d; mqt = (mqt + 1) % 16; mqc = mqc + 1;
                mm_cmds = mm_cmds + 1;
                if (mm_cmd_d[22:0] % 16 != 0 || mm_cmd_d[35:32] != 0) begin
                    $display("[TB][ERR] MM2S cmd khong can le: addr=%h btt=%0d", mm_cmd_d[63:32], mm_cmd_d[22:0]);
                    errors = errors + 1;
                end
                if (mm_cmd_d[63:32] + mm_cmd_d[22:0] > MEM_BYTES) begin
                    $display("[TB][ERR] MM2S cmd vuot bo nho: addr=%h btt=%0d", mm_cmd_d[63:32], mm_cmd_d[22:0]);
                    errors = errors + 1;
                end
            end
            if (mm_v && mm_r) begin
                mm_v <= 0;
                if (mm_l) m_active = 0;
            end
            if (!m_active) begin
                if (mqc > 0) begin
                    m_addr = mq[mqh][63:32]; m_rem = mq[mqh][22:0];
                    mqh = (mqh + 1) % 16; mqc = mqc - 1;
                    m_active = 1; m_lat = ($urandom % 6) + 2;
                    mm_bytes = mm_bytes + m_rem;
                end
            end else if (m_lat > 0) begin
                m_lat = m_lat - 1;
            end else if ((!mm_v || mm_r) && m_rem > 0 && ($urandom % 8 != 0)) begin
                for (bi = 0; bi < 16; bi = bi + 1) tmp128[bi*8 +: 8] = mem[m_addr + bi];
                mm_d <= tmp128; mm_v <= 1; mm_l <= (m_rem <= 16);
                m_rem = m_rem - 16; m_addr = m_addr + 16;
            end
        end
    end

    // =====================================================================
    // S2MM DataMover model (stream -> DDR), kiem tra tkeep/tlast/can le
    // =====================================================================
    reg [71:0] sq [0:15]; integer sqh, sqt, sqc;
    reg        s_active; integer s_lat; reg [31:0] s_addr; integer s_rem; integer s_beat;
    integer    sts_pend, sts_dly;
    integer    sm_cmds = 0, sm_bytes = 0;
    integer    nb, k2, exp_bytes;
    reg [15:0] exp_keep;
    initial begin sm_cmd_r = 0; sm_r = 0; sts_v = 0; sts_d = 0; end
    always @(posedge clk) begin
        if (!rstn) begin
            sqh = 0; sqt = 0; sqc = 0; s_active = 0; s_lat = 0; s_rem = 0; s_addr = 0; s_beat = 0;
            sts_pend = 0; sts_dly = 0;
            sm_cmd_r <= 0; sm_r <= 0; sts_v <= 0;
        end else begin
            sm_cmd_r <= (sqc < 8) && ($urandom % 4 != 0);
            sts_v <= 0;
            if (sm_cmd_v && sm_cmd_r) begin
                sq[sqt] = sm_cmd_d; sqt = (sqt + 1) % 16; sqc = sqc + 1;
                sm_cmds = sm_cmds + 1;
                if (sm_cmd_d[35:32] != 0 || sm_cmd_d[22:0] == 0 || sm_cmd_d[22:0] > 256) begin
                    $display("[TB][ERR] S2MM cmd khong hop le: addr=%h btt=%0d", sm_cmd_d[63:32], sm_cmd_d[22:0]);
                    errors = errors + 1;
                end
                if (sm_cmd_d[63:32] + sm_cmd_d[22:0] > MEM_BYTES) begin
                    $display("[TB][ERR] S2MM cmd vuot bo nho: addr=%h btt=%0d", sm_cmd_d[63:32], sm_cmd_d[22:0]);
                    errors = errors + 1;
                end
            end
            // nhan beat
            if (sm_v && sm_r) begin
                exp_bytes = (s_rem > 16) ? 16 : s_rem;
                exp_keep  = (exp_bytes == 16) ? 16'hFFFF : ((16'h1 << exp_bytes) - 1);
                if (sm_keep !== exp_keep) begin
                    $display("[TB][ERR] tkeep=%h mong doi %h (addr=%h rem=%0d)", sm_keep, exp_keep, s_addr, s_rem);
                    errors = errors + 1;
                end
                if (sm_l !== (s_rem <= 16)) begin
                    $display("[TB][ERR] tlast=%b sai (rem=%0d)", sm_l, s_rem);
                    errors = errors + 1;
                end
                for (k2 = 0; k2 < 16; k2 = k2 + 1)
                    if (sm_keep[k2] && k2 < exp_bytes) mem[s_addr + k2] = sm_d[k2*8 +: 8];
                sm_bytes = sm_bytes + exp_bytes;
                s_addr = s_addr + 16; s_rem = s_rem - 16;
                if (s_rem <= 0) begin
                    s_active = 0; sts_pend = sts_pend + 1;
                end
            end
            if (!s_active && !(sm_v && sm_r)) begin
                // co the bat dau lenh moi
            end
            if (!s_active) begin
                if (sqc > 0) begin
                    s_addr = sq[sqh][63:32]; s_rem = sq[sqh][22:0];
                    sqh = (sqh + 1) % 16; sqc = sqc - 1;
                    s_active = 1; s_lat = ($urandom % 3);
                end
            end
            sm_r <= s_active && (s_lat == 0) && ($urandom % 5 != 0);
            if (s_active && s_lat > 0) s_lat = s_lat - 1;
            // status
            if (sts_pend > 0) begin
                if (sts_dly > 0) sts_dly = sts_dly - 1;
                else begin
                    sts_v <= 1; sts_d <= 8'h80; sts_pend = sts_pend - 1; sts_dly = ($urandom % 4) + 1;
                end
            end
        end
    end

    // =====================================================================
    // AXI-Lite master tasks
    // =====================================================================
    task axil_write(input [7:0] a, input [31:0] d);
        begin
            @(posedge clk); #1;
            awaddr = a; awvalid = 1; wdata = d; wstrb = 4'hF; wvalid = 1;
            @(posedge clk);
            while (!(awready && wready)) @(posedge clk);
            #1; awvalid = 0; wvalid = 0;
            @(posedge clk);
            while (!bvalid) @(posedge clk);
        end
    endtask

    task axil_read(input [7:0] a, output [31:0] d);
        begin
            @(posedge clk); #1;
            araddr = a; arvalid = 1;
            @(posedge clk);
            while (!(arready && arvalid)) @(posedge clk);
            #1; arvalid = 0;
            @(posedge clk);
            while (!rvalid) @(posedge clk);
            d = rdata;
        end
    endtask

    // =====================================================================
    // Main
    // =====================================================================
    integer cyc = 0, start_cyc = 0, end_cyc = 0, fd, ii, polls;
    reg [31:0] rd, stat;
    reg expect_err;
    always @(posedge clk) cyc <= cyc + 1;

    integer seed_v, dummy_v;
    initial begin
        if ($value$plusargs("SEED=%d", seed_v)) dummy_v = $urandom(seed_v);
        $readmemh("cfg.hex", cfg);
        $readmemh("mem_init.hex", mem);
        expect_err = (cfg[16] != 0);
        repeat (10) @(posedge clk);
        rstn = 1;
        repeat (5) @(posedge clk);

        axil_write(8'h00, cfg[0]);   // M
        axil_write(8'h04, cfg[2]);   // N
        axil_write(8'h08, cfg[1]);   // K
        axil_write(8'h0C, cfg[13]);  // k_dim
        axil_write(8'h10, 256 / cfg[13]);  // num_k_tiles_per_block
        axil_write(8'h14, cfg[7]);   // base_a
        axil_write(8'h18, cfg[8]);   // base_b
        axil_write(8'h1C, cfg[9]);   // base_c
        axil_write(8'h20, cfg[5]);   // n_stride (= ldc)
        axil_write(8'h24, 8);        // scale_shift
        axil_write(8'h28, 0);        // zero_point

        start_cyc = cyc;
        axil_write(8'h2C, 32'h1);

        stat = 0; polls = 0;
        while (!(stat & 32'h4) && polls < 200000) begin
            axil_read(8'h2C, stat);
            polls = polls + 1;
            if (!(stat & 32'h4)) repeat (50) @(posedge clk);
            if (cyc > MAXCYC) begin $display("[TB][ERR] TIMEOUT"); errors = errors + 1; stat = 32'h4; end
        end
        end_cyc = cyc;
        $display("[TB] status=%h cycles=%0d mm2s_cmds=%0d s2mm_cmds=%0d", stat, end_cyc - start_cyc, mm_cmds, sm_cmds);
        if (expect_err && !(stat & 32'h8)) begin $display("[TB][ERR] mong doi err=1"); errors = errors + 1; end
        if (!expect_err && (stat & 32'h8))  begin $display("[TB][ERR] err=1 bat ngo"); errors = errors + 1; end

        repeat (40) @(posedge clk);
        if (busy) begin $display("[TB][ERR] busy van =1 sau done"); errors = errors + 1; end

        fd = $fopen("mem_final.hex", "w");
        for (ii = cfg[14]; ii < cfg[15]; ii = ii + 1) $fwrite(fd, "%02x\n", mem[ii]);
        $fclose(fd);
        $display("[TB] BYTES mm2s=%0d s2mm=%0d  TB_ERRORS=%0d", mm_bytes, sm_bytes, errors);
        $finish;
    end
endmodule

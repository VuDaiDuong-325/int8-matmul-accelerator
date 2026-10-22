`timescale 1ns / 1ps
//==============================================================================
// Module   : gemm_l2_axi_lite_regs   (v6)
// Project  : INT8 GEMM Accelerator - KV260 / LLM
//
// AXI4-Lite Control/Status cho gemm_top_l2 v6.
//
// REGISTER MAP (byte offset từ base). Offset 0x00..0x2C giữ vị trí như v5.
//   0x00  RW  m_total              [19:0]
//   0x04  RW  n_total              [19:0]
//   0x08  RW  k_total              [19:0]
//   0x0C  RW  k_dim                [19:0]   lũy thừa 2, <= 256 (khuyến nghị 32)
//   0x10  RW  (reserved, v5: num_k_tiles_per_block - nay phần cứng tự tính, bỏ qua)
//   0x14  RW  base_a               [31:0]   A[M][K] int8 row-major, bội 16 byte
//   0x18  RW  base_b               [31:0]   B[K][N] int8 row-major, bội 16 byte
//   0x1C  RW  base_c               [31:0]   C INT8 output
//   0x20  RW  ldc                  [31:0]   stride dòng C INT8 (byte), bội 16, >= N
//   0x24  RW  out_mode             [1:0]    bit0 = ghi INT8 ; bit1 = ghi INT32
//   0x28  RW  base_param           [31:0]   bảng requant theo kênh (16 byte/kênh)
//   0x2C  RW/RO control/status:
//           write: bit0 = start (xung 1 chu kỳ)
//           read : bit0 = 0
//                  bit1 = busy        (RO, mức)
//                  bit2 = done_sticky (RO, giữ đến khi đọc hoặc start mới)
//                  bit3 = err         (RO, cấu hình sai -> không chạy; xóa khi start hợp lệ)
//   0x30  RW  lda                  [31:0]   stride dòng A (byte), bội 16, >= ceil16(K)
//   0x34  RW  ldb                  [31:0]   stride dòng B (byte), bội 16, >= ceil16(N)
//   0x38  RW  base_c32             [31:0]   C INT32 output (little-endian)
//   0x3C  RW  ldc32                [31:0]   stride dòng C INT32 (byte), bội 16, >= 4*N
//   0x40  RO  hw_version           = 0x0006_0001
//
// irq: mức cao khi done_sticky = 1.
//==============================================================================

module gemm_l2_axi_lite_regs #(
    parameter integer C_S_AXI_ADDR_WIDTH = 8,
    parameter integer C_S_AXI_DATA_WIDTH = 32,
    parameter ADDR_W = 32,
    parameter DIM_W  = 20
)(
    input  wire                              S_AXI_ACLK,
    input  wire                              S_AXI_ARESETN,
    input  wire [C_S_AXI_ADDR_WIDTH-1:0]     S_AXI_AWADDR,
    input  wire [2:0]                        S_AXI_AWPROT,
    input  wire                              S_AXI_AWVALID,
    output reg                               S_AXI_AWREADY,
    input  wire [C_S_AXI_DATA_WIDTH-1:0]     S_AXI_WDATA,
    input  wire [(C_S_AXI_DATA_WIDTH/8)-1:0] S_AXI_WSTRB,
    input  wire                              S_AXI_WVALID,
    output reg                               S_AXI_WREADY,
    output reg  [1:0]                        S_AXI_BRESP,
    output reg                               S_AXI_BVALID,
    input  wire                              S_AXI_BREADY,
    input  wire [C_S_AXI_ADDR_WIDTH-1:0]     S_AXI_ARADDR,
    input  wire [2:0]                        S_AXI_ARPROT,
    input  wire                              S_AXI_ARVALID,
    output reg                               S_AXI_ARREADY,
    output reg  [C_S_AXI_DATA_WIDTH-1:0]     S_AXI_RDATA,
    output reg  [1:0]                        S_AXI_RRESP,
    output reg                               S_AXI_RVALID,
    input  wire                              S_AXI_RREADY,

    // ===== Kết nối sang gemm_top_l2 =====
    output wire [DIM_W-1:0]  cfg_m_total_o,
    output wire [DIM_W-1:0]  cfg_n_total_o,
    output wire [DIM_W-1:0]  cfg_k_total_o,
    output wire [DIM_W-1:0]  cfg_k_dim_o,
    output wire [ADDR_W-1:0] cfg_base_a_o,
    output wire [ADDR_W-1:0] cfg_base_b_o,
    output wire [ADDR_W-1:0] cfg_base_c_o,
    output wire [ADDR_W-1:0] cfg_base_c32_o,
    output wire [ADDR_W-1:0] cfg_base_param_o,
    output wire [ADDR_W-1:0] cfg_lda_o,
    output wire [ADDR_W-1:0] cfg_ldb_o,
    output wire [ADDR_W-1:0] cfg_ldc_o,
    output wire [ADDR_W-1:0] cfg_ldc32_o,
    output wire [1:0]        cfg_out_mode_o,

    output wire   start_o,
    input  wire   busy_i,
    input  wire   done_i,
    input  wire   err_i,
    output wire   irq_o
);

    localparam [31:0] HW_VERSION = 32'h0006_0001;

    // ===== Thanh ghi cfg =====
    reg [DIM_W-1:0]  r_m_total_r, r_n_total_r, r_k_total_r, r_k_dim_r;
    reg [31:0]       r_reserved10_r;
    reg [ADDR_W-1:0] r_base_a_r, r_base_b_r, r_base_c_r, r_base_c32_r, r_base_param_r;
    reg [ADDR_W-1:0] r_lda_r, r_ldb_r, r_ldc_r, r_ldc32_r;
    reg [1:0]        r_out_mode_r;

    assign cfg_m_total_o    = r_m_total_r;
    assign cfg_n_total_o    = r_n_total_r;
    assign cfg_k_total_o    = r_k_total_r;
    assign cfg_k_dim_o      = r_k_dim_r;
    assign cfg_base_a_o     = r_base_a_r;
    assign cfg_base_b_o     = r_base_b_r;
    assign cfg_base_c_o     = r_base_c_r;
    assign cfg_base_c32_o   = r_base_c32_r;
    assign cfg_base_param_o = r_base_param_r;
    assign cfg_lda_o        = r_lda_r;
    assign cfg_ldb_o        = r_ldb_r;
    assign cfg_ldc_o        = r_ldc_r;
    assign cfg_ldc32_o      = r_ldc32_r;
    assign cfg_out_mode_o   = r_out_mode_r;

    // ===== start pulse + done sticky =====
    reg start_pulse_r;
    reg done_sticky_r;
    assign start_o = start_pulse_r;
    assign irq_o   = done_sticky_r;

    // Khai báo địa chỉ TRƯỚC khi dùng (một số tool yêu cầu)
    reg [C_S_AXI_ADDR_WIDTH-1:0] axi_awaddr_r;
    reg [C_S_AXI_ADDR_WIDTH-1:0] axi_araddr_r;

    wire write_en_w = S_AXI_WREADY && S_AXI_WVALID && S_AXI_AWREADY && S_AXI_AWVALID;
    wire write_start_pulse_now_w = write_en_w &&
        (axi_awaddr_r[7:2] == 6'h0B) && S_AXI_WSTRB[0] && S_AXI_WDATA[0];
    wire read_status_now_w =
        S_AXI_ARREADY && S_AXI_ARVALID && !S_AXI_RVALID &&
        (axi_araddr_r[7:2] == 6'h0B);

    // MỘT always block duy nhất sở hữu done_sticky
    always @(posedge S_AXI_ACLK) begin
        if (!S_AXI_ARESETN) begin
            done_sticky_r <= 1'b0;
        end else if (done_i) begin
            done_sticky_r <= 1'b1;
        end else if (write_start_pulse_now_w || read_status_now_w) begin
            done_sticky_r <= 1'b0;
        end
    end

    // ===== AXI4-Lite WRITE FSM =====
    always @(posedge S_AXI_ACLK) begin
        if (!S_AXI_ARESETN) begin
            S_AXI_AWREADY <= 1'b0;
            S_AXI_WREADY  <= 1'b0;
            S_AXI_BVALID  <= 1'b0;
            S_AXI_BRESP   <= 2'b00;
            axi_awaddr_r  <= {C_S_AXI_ADDR_WIDTH{1'b0}};
            r_m_total_r <= {DIM_W{1'b0}};
            r_n_total_r <= {DIM_W{1'b0}};
            r_k_total_r <= {DIM_W{1'b0}};
            r_k_dim_r   <= {DIM_W{1'b0}};
            r_reserved10_r <= 32'd0;
            r_base_a_r  <= {ADDR_W{1'b0}};
            r_base_b_r  <= {ADDR_W{1'b0}};
            r_base_c_r  <= {ADDR_W{1'b0}};
            r_base_c32_r   <= {ADDR_W{1'b0}};
            r_base_param_r <= {ADDR_W{1'b0}};
            r_lda_r   <= {ADDR_W{1'b0}};
            r_ldb_r   <= {ADDR_W{1'b0}};
            r_ldc_r   <= {ADDR_W{1'b0}};
            r_ldc32_r <= {ADDR_W{1'b0}};
            r_out_mode_r <= 2'b01;          // mặc định: chỉ INT8
            start_pulse_r <= 1'b0;
        end else begin
            start_pulse_r <= 1'b0;

            if (!S_AXI_AWREADY && S_AXI_AWVALID && S_AXI_WVALID) begin
                S_AXI_AWREADY <= 1'b1;
                S_AXI_WREADY  <= 1'b1;
                axi_awaddr_r  <= S_AXI_AWADDR;
            end else begin
                S_AXI_AWREADY <= 1'b0;
                S_AXI_WREADY  <= 1'b0;
            end

            if (write_en_w) begin
                case (axi_awaddr_r[7:2])
                    6'h00: if (S_AXI_WSTRB[0]) r_m_total_r <= S_AXI_WDATA[DIM_W-1:0];
                    6'h01: if (S_AXI_WSTRB[0]) r_n_total_r <= S_AXI_WDATA[DIM_W-1:0];
                    6'h02: if (S_AXI_WSTRB[0]) r_k_total_r <= S_AXI_WDATA[DIM_W-1:0];
                    6'h03: if (S_AXI_WSTRB[0]) r_k_dim_r   <= S_AXI_WDATA[DIM_W-1:0];
                    6'h04: r_reserved10_r <= S_AXI_WDATA;
                    6'h05: r_base_a_r     <= S_AXI_WDATA;
                    6'h06: r_base_b_r     <= S_AXI_WDATA;
                    6'h07: r_base_c_r     <= S_AXI_WDATA;
                    6'h08: r_ldc_r        <= S_AXI_WDATA;
                    6'h09: if (S_AXI_WSTRB[0]) r_out_mode_r <= S_AXI_WDATA[1:0];
                    6'h0A: r_base_param_r <= S_AXI_WDATA;
                    6'h0B: begin
                        if (S_AXI_WSTRB[0] && S_AXI_WDATA[0]) start_pulse_r <= 1'b1;
                    end
                    6'h0C: r_lda_r        <= S_AXI_WDATA;
                    6'h0D: r_ldb_r        <= S_AXI_WDATA;
                    6'h0E: r_base_c32_r   <= S_AXI_WDATA;
                    6'h0F: r_ldc32_r      <= S_AXI_WDATA;
                    default: ;
                endcase
            end

            if (S_AXI_AWREADY && S_AXI_AWVALID && S_AXI_WREADY && S_AXI_WVALID &&
                !S_AXI_BVALID) begin
                S_AXI_BVALID <= 1'b1;
                S_AXI_BRESP  <= 2'b00;
            end else if (S_AXI_BREADY && S_AXI_BVALID) begin
                S_AXI_BVALID <= 1'b0;
            end
        end
    end

    // ===== AXI4-Lite READ FSM =====
    always @(posedge S_AXI_ACLK) begin
        if (!S_AXI_ARESETN) begin
            S_AXI_ARREADY <= 1'b0;
            S_AXI_RVALID  <= 1'b0;
            S_AXI_RRESP   <= 2'b00;
            S_AXI_RDATA   <= 32'd0;
            axi_araddr_r  <= {C_S_AXI_ADDR_WIDTH{1'b0}};
        end else begin
            if (!S_AXI_ARREADY && S_AXI_ARVALID) begin
                S_AXI_ARREADY <= 1'b1;
                axi_araddr_r  <= S_AXI_ARADDR;
            end else begin
                S_AXI_ARREADY <= 1'b0;
            end

            if (S_AXI_ARREADY && S_AXI_ARVALID && !S_AXI_RVALID) begin
                S_AXI_RVALID <= 1'b1;
                S_AXI_RRESP  <= 2'b00;
                case (axi_araddr_r[7:2])
                    6'h00: S_AXI_RDATA <= {{(32-DIM_W){1'b0}}, r_m_total_r};
                    6'h01: S_AXI_RDATA <= {{(32-DIM_W){1'b0}}, r_n_total_r};
                    6'h02: S_AXI_RDATA <= {{(32-DIM_W){1'b0}}, r_k_total_r};
                    6'h03: S_AXI_RDATA <= {{(32-DIM_W){1'b0}}, r_k_dim_r};
                    6'h04: S_AXI_RDATA <= r_reserved10_r;
                    6'h05: S_AXI_RDATA <= r_base_a_r;
                    6'h06: S_AXI_RDATA <= r_base_b_r;
                    6'h07: S_AXI_RDATA <= r_base_c_r;
                    6'h08: S_AXI_RDATA <= r_ldc_r;
                    6'h09: S_AXI_RDATA <= {30'b0, r_out_mode_r};
                    6'h0A: S_AXI_RDATA <= r_base_param_r;
                    6'h0B: S_AXI_RDATA <= {28'b0, err_i, done_sticky_r, busy_i, 1'b0};
                    6'h0C: S_AXI_RDATA <= r_lda_r;
                    6'h0D: S_AXI_RDATA <= r_ldb_r;
                    6'h0E: S_AXI_RDATA <= r_base_c32_r;
                    6'h0F: S_AXI_RDATA <= r_ldc32_r;
                    6'h10: S_AXI_RDATA <= HW_VERSION;
                    default: S_AXI_RDATA <= 32'h0;
                endcase
            end else if (S_AXI_RVALID && S_AXI_RREADY) begin
                S_AXI_RVALID <= 1'b0;
            end
        end
    end

endmodule

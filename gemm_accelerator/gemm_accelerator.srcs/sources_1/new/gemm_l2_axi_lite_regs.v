`timescale 1ns / 1ps
//==============================================================================
// Module   : gemm_l2_axi_lite_regs
// Project  : INT8 GEMM Accelerator - KV260 / Qwen2 MLP Block
// Date     : June 2026
//
// AXI4-Lite Control/Status Register Block cho gemm_top_l2_v3.
// Thay the cho axi_gpio_0/axi_gpio_1 trong thiet ke cu (chi co 4 truong
// cfg) - thiet ke moi can ~11 truong cfg + start/busy/done, dung 1 IP
// AXI4-Lite tuy chinh thay vi nhieu GPIO IP roi rac.
//
// REGISTER MAP (32-bit aligned, byte address tu base):
//   0x00  RW  m_total            [15:0]
//   0x04  RW  n_total            [15:0]
//   0x08  RW  k_total            [15:0]
//   0x0C  RW  k_dim              [15:0]
//   0x10  RW  num_k_tiles_per_block [15:0]
//   0x14  RW  base_a             [31:0]
//   0x18  RW  base_b             [31:0]
//   0x1C  RW  base_c             [31:0]
//   0x20  RW  n_stride           [15:0]
//   0x24  RW  scale_shift        [4:0]
//   0x28  RW  zero_point         [7:0]
//   0x2C  RW/RO  control/status:
//           write: bit0 = start (tu pulse 1 chu ky, KHONG luu tru lau dai)
//           read : bit0 = 0 (luon doc ve 0)
//                  bit1 = busy (RO, muc, phan anh truc tiep busy_in)
//                  bit2 = done (RO, sticky - giu 1 cho den khi doc thanh
//                         cong HOAC khi ghi start moi - tranh phan mem bo
//                         lo xung done 1-chu-ky neu polling khong dung luc)
//   0x30  RO  reserved (doc ve 0)
//
// irq: muc cao khi done_sticky=1, ha xuong khi status duoc doc HOAC start
//      moi duoc ghi. Noi vao PS qua AXI INTC hoac truc tiep pl_ps_irq0 neu
//      dung Concat IP - xem tai lieu tich hop di kem.
//==============================================================================

module gemm_l2_axi_lite_regs #(
    parameter integer C_S_AXI_ADDR_WIDTH = 8,   // 0x00-0xFF du cho 13 thanh ghi
    parameter integer C_S_AXI_DATA_WIDTH = 32,
    parameter ADDR_W = 32,
    parameter DIM_W  = 16
)(
    // AXI4-Lite Slave Interface
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

    // ===== Ket noi sang gemm_top_l2_v3 =====
    output wire [DIM_W-1:0]  cfg_m_total,
    output wire [DIM_W-1:0]  cfg_n_total,
    output wire [DIM_W-1:0]  cfg_k_total,
    output wire [DIM_W-1:0]  cfg_k_dim,
    output wire [DIM_W-1:0]  cfg_num_k_tiles_per_block,
    output wire [ADDR_W-1:0] cfg_base_a,
    output wire [ADDR_W-1:0] cfg_base_b,
    output wire [ADDR_W-1:0] cfg_base_c,
    output wire [DIM_W-1:0]  cfg_n_stride,
    output wire [4:0]         cfg_scale_shift,
    output wire [7:0]         cfg_zero_point,

    output wire   start,
    input  wire   busy,
    input  wire   done,
    output wire   irq
);

    // ===== Thanh ghi luu tru cfg (RW, phan mem ghi 1 lan truoc moi GEMM) =====
    reg [DIM_W-1:0]  r_m_total, r_n_total, r_k_total, r_k_dim, r_numkt;
    reg [ADDR_W-1:0] r_base_a, r_base_b, r_base_c;
    reg [DIM_W-1:0]  r_n_stride;
    reg [4:0]         r_scale_shift;
    reg [7:0]         r_zero_point;

    assign cfg_m_total = r_m_total;
    assign cfg_n_total = r_n_total;
    assign cfg_k_total = r_k_total;
    assign cfg_k_dim   = r_k_dim;
    assign cfg_num_k_tiles_per_block = r_numkt;
    assign cfg_base_a  = r_base_a;
    assign cfg_base_b  = r_base_b;
    assign cfg_base_c  = r_base_c;
    assign cfg_n_stride = r_n_stride;
    assign cfg_scale_shift = r_scale_shift;
    assign cfg_zero_point  = r_zero_point;

    // ===== start pulse + done sticky =====
    reg start_pulse_reg;
    reg done_sticky;
    assign start = start_pulse_reg;
    assign irq   = done_sticky;

    // Co bao "vua ghi start" / "vua doc status" - tinh to hop, dung chung
    // cho ca logic ghi thanh ghi (always block khac) VA always block rieng
    // duoi day quan ly done_sticky - tranh multi-driver tren done_sticky.
    wire write_start_pulse_now =
        S_AXI_WREADY && S_AXI_WVALID && S_AXI_AWREADY && S_AXI_AWVALID &&
        (axi_awaddr[7:2] == 6'h0B) && S_AXI_WSTRB[0] && S_AXI_WDATA[0];
    wire read_status_now =
        S_AXI_ARREADY && S_AXI_ARVALID && !S_AXI_RVALID &&
        (axi_araddr[7:2] == 6'h0B);

    // MOT always block DUY NHAT so huu done_sticky - tranh "multiple drivers"
    always @(posedge S_AXI_ACLK) begin
        if (!S_AXI_ARESETN) begin
            done_sticky <= 1'b0;
        end else if (done) begin
            done_sticky <= 1'b1;          // uu tien cao nhat: xung done moi toi
        end else if (write_start_pulse_now || read_status_now) begin
            done_sticky <= 1'b0;          // ghi start moi HOAC vua doc status
        end
    end

    // ===== AXI4-Lite WRITE FSM (kieu chap nhan dong thoi AW+W) =====
    reg [C_S_AXI_ADDR_WIDTH-1:0] axi_awaddr;
    wire write_en = S_AXI_WREADY && S_AXI_WVALID && S_AXI_AWREADY && S_AXI_AWVALID;

    always @(posedge S_AXI_ACLK) begin
        if (!S_AXI_ARESETN) begin
            S_AXI_AWREADY <= 1'b0;
            S_AXI_WREADY  <= 1'b0;
            S_AXI_BVALID  <= 1'b0;
            S_AXI_BRESP   <= 2'b00;
            axi_awaddr    <= {C_S_AXI_ADDR_WIDTH{1'b0}};
            r_m_total <= {DIM_W{1'b0}};
            r_n_total <= {DIM_W{1'b0}};
            r_k_total <= {DIM_W{1'b0}};
            r_k_dim   <= {DIM_W{1'b0}};
            r_numkt   <= {DIM_W{1'b0}};
            r_base_a  <= {ADDR_W{1'b0}};
            r_base_b  <= {ADDR_W{1'b0}};
            r_base_c  <= {ADDR_W{1'b0}};
            r_n_stride <= {DIM_W{1'b0}};
            r_scale_shift <= 5'd0;
            r_zero_point  <= 8'd0;
            start_pulse_reg <= 1'b0;
            // done_sticky: reset rieng o always block so huu (tranh multi-driver)
        end else begin
            start_pulse_reg <= 1'b0;   // mac dinh - chi = 1 dung 1 chu ky khi ghi

            // Chap nhan dia chi/du lieu ghi DONG THOI (don gian, hop le AXI4-Lite)
            if (!S_AXI_AWREADY && S_AXI_AWVALID && S_AXI_WVALID) begin
                S_AXI_AWREADY <= 1'b1;
                S_AXI_WREADY  <= 1'b1;
                axi_awaddr    <= S_AXI_AWADDR;
            end else begin
                S_AXI_AWREADY <= 1'b0;
                S_AXI_WREADY  <= 1'b0;
            end

            if (write_en) begin
                case (axi_awaddr[7:2])  // word-aligned, bo qua 2 bit thap
                    6'h00: if (S_AXI_WSTRB[0]) r_m_total <= S_AXI_WDATA[DIM_W-1:0];
                    6'h01: if (S_AXI_WSTRB[0]) r_n_total <= S_AXI_WDATA[DIM_W-1:0];
                    6'h02: if (S_AXI_WSTRB[0]) r_k_total <= S_AXI_WDATA[DIM_W-1:0];
                    6'h03: if (S_AXI_WSTRB[0]) r_k_dim   <= S_AXI_WDATA[DIM_W-1:0];
                    6'h04: if (S_AXI_WSTRB[0]) r_numkt   <= S_AXI_WDATA[DIM_W-1:0];
                    6'h05: r_base_a <= S_AXI_WDATA;
                    6'h06: r_base_b <= S_AXI_WDATA;
                    6'h07: r_base_c <= S_AXI_WDATA;
                    6'h08: if (S_AXI_WSTRB[0]) r_n_stride <= S_AXI_WDATA[DIM_W-1:0];
                    6'h09: if (S_AXI_WSTRB[0]) r_scale_shift <= S_AXI_WDATA[4:0];
                    6'h0A: if (S_AXI_WSTRB[0]) r_zero_point  <= S_AXI_WDATA[7:0];
                    6'h0B: begin // 0x2C control/status
                        if (S_AXI_WSTRB[0] && S_AXI_WDATA[0]) begin
                            start_pulse_reg <= 1'b1;
                            // done_sticky clear: xu ly tap trung o always block rieng (tranh multi-driver)
                        end
                    end
                    default: ;
                endcase
            end

            // Write response
            if (S_AXI_AWREADY && S_AXI_AWVALID && S_AXI_WREADY && S_AXI_WVALID &&
                !S_AXI_BVALID) begin
                S_AXI_BVALID <= 1'b1;
                S_AXI_BRESP  <= 2'b00; // OKAY
            end else if (S_AXI_BREADY && S_AXI_BVALID) begin
                S_AXI_BVALID <= 1'b0;
            end
        end
    end

    // ===== AXI4-Lite READ FSM =====
    reg [C_S_AXI_ADDR_WIDTH-1:0] axi_araddr;

    always @(posedge S_AXI_ACLK) begin
        if (!S_AXI_ARESETN) begin
            S_AXI_ARREADY <= 1'b0;
            S_AXI_RVALID  <= 1'b0;
            S_AXI_RRESP   <= 2'b00;
            axi_araddr    <= {C_S_AXI_ADDR_WIDTH{1'b0}};
        end else begin
            if (!S_AXI_ARREADY && S_AXI_ARVALID) begin
                S_AXI_ARREADY <= 1'b1;
                axi_araddr    <= S_AXI_ARADDR;
            end else begin
                S_AXI_ARREADY <= 1'b0;
            end

            if (S_AXI_ARREADY && S_AXI_ARVALID && !S_AXI_RVALID) begin
                S_AXI_RVALID <= 1'b1;
                S_AXI_RRESP  <= 2'b00;
                case (axi_araddr[7:2])
                    6'h00: S_AXI_RDATA <= {{(32-DIM_W){1'b0}}, r_m_total};
                    6'h01: S_AXI_RDATA <= {{(32-DIM_W){1'b0}}, r_n_total};
                    6'h02: S_AXI_RDATA <= {{(32-DIM_W){1'b0}}, r_k_total};
                    6'h03: S_AXI_RDATA <= {{(32-DIM_W){1'b0}}, r_k_dim};
                    6'h04: S_AXI_RDATA <= {{(32-DIM_W){1'b0}}, r_numkt};
                    6'h05: S_AXI_RDATA <= r_base_a;
                    6'h06: S_AXI_RDATA <= r_base_b;
                    6'h07: S_AXI_RDATA <= r_base_c;
                    6'h08: S_AXI_RDATA <= {{(32-DIM_W){1'b0}}, r_n_stride};
                    6'h09: S_AXI_RDATA <= {27'b0, r_scale_shift};
                    6'h0A: S_AXI_RDATA <= {24'b0, r_zero_point};
                    6'h0B: begin
                        S_AXI_RDATA <= {29'b0, done_sticky, busy, 1'b0};
                        // done_sticky clear: xu ly tap trung o always block rieng (tranh multi-driver)
                    end
                    default: S_AXI_RDATA <= 32'h0;
                endcase
            end else if (S_AXI_RVALID && S_AXI_RREADY) begin
                S_AXI_RVALID <= 1'b0;
            end
        end
    end

endmodule
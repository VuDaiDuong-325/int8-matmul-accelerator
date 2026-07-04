// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
// Date        : Sat Jul  4 13:27:15 2026
// Host        : ZUYYYY running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               d:/E/1subject/HK6/doan1/int8-matmul-accelerator/gemm_accelerator/gemm_accelerator.gen/sources_1/bd/gemm_system/ip/gemm_system_gemm_l2_axi_lite_regs_0_0/gemm_system_gemm_l2_axi_lite_regs_0_0_sim_netlist.v
// Design      : gemm_system_gemm_l2_axi_lite_regs_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xck26-sfvc784-2LV-c
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "gemm_system_gemm_l2_axi_lite_regs_0_0,gemm_l2_axi_lite_regs,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "module_ref" *) 
(* X_CORE_INFO = "gemm_l2_axi_lite_regs,Vivado 2025.2" *) 
(* NotValidForBitStream *)
module gemm_system_gemm_l2_axi_lite_regs_0_0
   (S_AXI_ACLK,
    S_AXI_ARESETN,
    S_AXI_AWADDR,
    S_AXI_AWPROT,
    S_AXI_AWVALID,
    S_AXI_AWREADY,
    S_AXI_WDATA,
    S_AXI_WSTRB,
    S_AXI_WVALID,
    S_AXI_WREADY,
    S_AXI_BRESP,
    S_AXI_BVALID,
    S_AXI_BREADY,
    S_AXI_ARADDR,
    S_AXI_ARPROT,
    S_AXI_ARVALID,
    S_AXI_ARREADY,
    S_AXI_RDATA,
    S_AXI_RRESP,
    S_AXI_RVALID,
    S_AXI_RREADY,
    cfg_m_total_o,
    cfg_n_total_o,
    cfg_k_total_o,
    cfg_k_dim_o,
    cfg_num_k_tiles_per_block_o,
    cfg_base_a_o,
    cfg_base_b_o,
    cfg_base_c_o,
    cfg_n_stride_o,
    cfg_scale_shift_o,
    cfg_zero_point_o,
    start_o,
    busy_i,
    done_i,
    irq_o);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 S_AXI_ACLK CLK" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S_AXI_ACLK, ASSOCIATED_BUSIF S_AXI, ASSOCIATED_RESET S_AXI_ARESETN, FREQ_HZ 199998001, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN gemm_system_zynq_ultra_ps_e_0_0_pl_clk0, INSERT_VIP 0" *) input S_AXI_ACLK;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 S_AXI_ARESETN RST" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S_AXI_ARESETN, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input S_AXI_ARESETN;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWADDR" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S_AXI, DATA_WIDTH 32, PROTOCOL AXI4LITE, FREQ_HZ 199998001, ID_WIDTH 0, ADDR_WIDTH 8, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 1, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 1, NUM_WRITE_OUTSTANDING 1, MAX_BURST_LENGTH 1, PHASE 0.0, CLK_DOMAIN gemm_system_zynq_ultra_ps_e_0_0_pl_clk0, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *) input [7:0]S_AXI_AWADDR;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWPROT" *) input [2:0]S_AXI_AWPROT;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWVALID" *) input S_AXI_AWVALID;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWREADY" *) output S_AXI_AWREADY;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI WDATA" *) input [31:0]S_AXI_WDATA;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI WSTRB" *) input [3:0]S_AXI_WSTRB;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI WVALID" *) input S_AXI_WVALID;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI WREADY" *) output S_AXI_WREADY;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI BRESP" *) output [1:0]S_AXI_BRESP;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI BVALID" *) output S_AXI_BVALID;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI BREADY" *) input S_AXI_BREADY;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARADDR" *) input [7:0]S_AXI_ARADDR;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARPROT" *) input [2:0]S_AXI_ARPROT;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARVALID" *) input S_AXI_ARVALID;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARREADY" *) output S_AXI_ARREADY;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RDATA" *) output [31:0]S_AXI_RDATA;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RRESP" *) output [1:0]S_AXI_RRESP;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RVALID" *) output S_AXI_RVALID;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RREADY" *) input S_AXI_RREADY;
  output [15:0]cfg_m_total_o;
  output [15:0]cfg_n_total_o;
  output [15:0]cfg_k_total_o;
  output [15:0]cfg_k_dim_o;
  output [15:0]cfg_num_k_tiles_per_block_o;
  output [31:0]cfg_base_a_o;
  output [31:0]cfg_base_b_o;
  output [31:0]cfg_base_c_o;
  output [15:0]cfg_n_stride_o;
  output [4:0]cfg_scale_shift_o;
  output [7:0]cfg_zero_point_o;
  output start_o;
  input busy_i;
  input done_i;
  output irq_o;

  wire \<const0> ;
  wire S_AXI_ACLK;
  wire [7:0]S_AXI_ARADDR;
  wire S_AXI_ARESETN;
  wire S_AXI_ARREADY;
  wire S_AXI_ARVALID;
  wire [7:0]S_AXI_AWADDR;
  wire S_AXI_AWREADY;
  wire S_AXI_AWVALID;
  wire S_AXI_BREADY;
  wire S_AXI_BVALID;
  wire [31:0]S_AXI_RDATA;
  wire S_AXI_RREADY;
  wire S_AXI_RVALID;
  wire [31:0]S_AXI_WDATA;
  wire [3:0]S_AXI_WSTRB;
  wire S_AXI_WVALID;
  wire busy_i;
  wire [31:0]cfg_base_a_o;
  wire [31:0]cfg_base_b_o;
  wire [31:0]cfg_base_c_o;
  wire [15:0]cfg_k_dim_o;
  wire [15:0]cfg_k_total_o;
  wire [15:0]cfg_m_total_o;
  wire [15:0]cfg_n_stride_o;
  wire [15:0]cfg_n_total_o;
  wire [15:0]cfg_num_k_tiles_per_block_o;
  wire [4:0]cfg_scale_shift_o;
  wire [7:0]cfg_zero_point_o;
  wire done_i;
  wire irq_o;
  wire start_o;

  assign S_AXI_BRESP[1] = \<const0> ;
  assign S_AXI_BRESP[0] = \<const0> ;
  assign S_AXI_RRESP[1] = \<const0> ;
  assign S_AXI_RRESP[0] = \<const0> ;
  assign S_AXI_WREADY = S_AXI_AWREADY;
  GND GND
       (.G(\<const0> ));
  gemm_system_gemm_l2_axi_lite_regs_0_0_gemm_l2_axi_lite_regs inst
       (.S_AXI_ACLK(S_AXI_ACLK),
        .S_AXI_ARADDR(S_AXI_ARADDR[7:2]),
        .S_AXI_ARESETN(S_AXI_ARESETN),
        .S_AXI_ARREADY(S_AXI_ARREADY),
        .S_AXI_ARVALID(S_AXI_ARVALID),
        .S_AXI_AWADDR(S_AXI_AWADDR[7:2]),
        .S_AXI_AWVALID(S_AXI_AWVALID),
        .S_AXI_BREADY(S_AXI_BREADY),
        .S_AXI_BVALID(S_AXI_BVALID),
        .S_AXI_RDATA(S_AXI_RDATA),
        .S_AXI_RREADY(S_AXI_RREADY),
        .S_AXI_RVALID_reg_0(S_AXI_RVALID),
        .S_AXI_WDATA(S_AXI_WDATA),
        .S_AXI_WREADY(S_AXI_AWREADY),
        .S_AXI_WSTRB(S_AXI_WSTRB[0]),
        .S_AXI_WVALID(S_AXI_WVALID),
        .busy_i(busy_i),
        .cfg_base_a_o(cfg_base_a_o),
        .cfg_base_b_o(cfg_base_b_o),
        .cfg_base_c_o(cfg_base_c_o),
        .cfg_k_dim_o(cfg_k_dim_o),
        .cfg_k_total_o(cfg_k_total_o),
        .cfg_m_total_o(cfg_m_total_o),
        .cfg_n_stride_o(cfg_n_stride_o),
        .cfg_n_total_o(cfg_n_total_o),
        .cfg_num_k_tiles_per_block_o(cfg_num_k_tiles_per_block_o),
        .cfg_scale_shift_o(cfg_scale_shift_o),
        .cfg_zero_point_o(cfg_zero_point_o),
        .done_i(done_i),
        .irq_o(irq_o),
        .start_o(start_o));
endmodule

(* ORIG_REF_NAME = "gemm_l2_axi_lite_regs" *) 
module gemm_system_gemm_l2_axi_lite_regs_0_0_gemm_l2_axi_lite_regs
   (S_AXI_WREADY,
    S_AXI_ARREADY,
    cfg_m_total_o,
    cfg_n_total_o,
    cfg_k_total_o,
    cfg_k_dim_o,
    cfg_num_k_tiles_per_block_o,
    cfg_base_a_o,
    cfg_base_b_o,
    cfg_base_c_o,
    cfg_n_stride_o,
    cfg_scale_shift_o,
    cfg_zero_point_o,
    S_AXI_RDATA,
    S_AXI_RVALID_reg_0,
    irq_o,
    S_AXI_BVALID,
    start_o,
    S_AXI_ACLK,
    S_AXI_ARADDR,
    S_AXI_AWADDR,
    S_AXI_WDATA,
    S_AXI_ARVALID,
    S_AXI_ARESETN,
    S_AXI_WSTRB,
    S_AXI_WVALID,
    S_AXI_AWVALID,
    busy_i,
    S_AXI_BREADY,
    S_AXI_RREADY,
    done_i);
  output S_AXI_WREADY;
  output S_AXI_ARREADY;
  output [15:0]cfg_m_total_o;
  output [15:0]cfg_n_total_o;
  output [15:0]cfg_k_total_o;
  output [15:0]cfg_k_dim_o;
  output [15:0]cfg_num_k_tiles_per_block_o;
  output [31:0]cfg_base_a_o;
  output [31:0]cfg_base_b_o;
  output [31:0]cfg_base_c_o;
  output [15:0]cfg_n_stride_o;
  output [4:0]cfg_scale_shift_o;
  output [7:0]cfg_zero_point_o;
  output [31:0]S_AXI_RDATA;
  output S_AXI_RVALID_reg_0;
  output irq_o;
  output S_AXI_BVALID;
  output start_o;
  input S_AXI_ACLK;
  input [5:0]S_AXI_ARADDR;
  input [5:0]S_AXI_AWADDR;
  input [31:0]S_AXI_WDATA;
  input S_AXI_ARVALID;
  input S_AXI_ARESETN;
  input [0:0]S_AXI_WSTRB;
  input S_AXI_WVALID;
  input S_AXI_AWVALID;
  input busy_i;
  input S_AXI_BREADY;
  input S_AXI_RREADY;
  input done_i;

  wire S_AXI_ACLK;
  wire [5:0]S_AXI_ARADDR;
  wire S_AXI_ARESETN;
  wire S_AXI_ARREADY;
  wire S_AXI_ARREADY0;
  wire S_AXI_ARVALID;
  wire [5:0]S_AXI_AWADDR;
  wire S_AXI_AWREADY0;
  wire S_AXI_AWVALID;
  wire S_AXI_BREADY;
  wire S_AXI_BVALID;
  wire S_AXI_BVALID_i_1_n_0;
  wire [31:0]S_AXI_RDATA;
  wire \S_AXI_RDATA[0]_i_1_n_0 ;
  wire \S_AXI_RDATA[0]_i_2_n_0 ;
  wire \S_AXI_RDATA[0]_i_3_n_0 ;
  wire \S_AXI_RDATA[0]_i_4_n_0 ;
  wire \S_AXI_RDATA[10]_i_1_n_0 ;
  wire \S_AXI_RDATA[10]_i_2_n_0 ;
  wire \S_AXI_RDATA[10]_i_3_n_0 ;
  wire \S_AXI_RDATA[11]_i_1_n_0 ;
  wire \S_AXI_RDATA[11]_i_2_n_0 ;
  wire \S_AXI_RDATA[11]_i_3_n_0 ;
  wire \S_AXI_RDATA[12]_i_1_n_0 ;
  wire \S_AXI_RDATA[12]_i_2_n_0 ;
  wire \S_AXI_RDATA[12]_i_3_n_0 ;
  wire \S_AXI_RDATA[13]_i_1_n_0 ;
  wire \S_AXI_RDATA[13]_i_2_n_0 ;
  wire \S_AXI_RDATA[13]_i_3_n_0 ;
  wire \S_AXI_RDATA[14]_i_1_n_0 ;
  wire \S_AXI_RDATA[14]_i_2_n_0 ;
  wire \S_AXI_RDATA[14]_i_3_n_0 ;
  wire \S_AXI_RDATA[15]_i_1_n_0 ;
  wire \S_AXI_RDATA[15]_i_2_n_0 ;
  wire \S_AXI_RDATA[15]_i_3_n_0 ;
  wire \S_AXI_RDATA[15]_i_4_n_0 ;
  wire \S_AXI_RDATA[15]_i_5_n_0 ;
  wire \S_AXI_RDATA[16]_i_1_n_0 ;
  wire \S_AXI_RDATA[17]_i_1_n_0 ;
  wire \S_AXI_RDATA[18]_i_1_n_0 ;
  wire \S_AXI_RDATA[19]_i_1_n_0 ;
  wire \S_AXI_RDATA[1]_i_1_n_0 ;
  wire \S_AXI_RDATA[1]_i_2_n_0 ;
  wire \S_AXI_RDATA[1]_i_3_n_0 ;
  wire \S_AXI_RDATA[1]_i_4_n_0 ;
  wire \S_AXI_RDATA[20]_i_1_n_0 ;
  wire \S_AXI_RDATA[21]_i_1_n_0 ;
  wire \S_AXI_RDATA[22]_i_1_n_0 ;
  wire \S_AXI_RDATA[23]_i_1_n_0 ;
  wire \S_AXI_RDATA[24]_i_1_n_0 ;
  wire \S_AXI_RDATA[25]_i_1_n_0 ;
  wire \S_AXI_RDATA[26]_i_1_n_0 ;
  wire \S_AXI_RDATA[27]_i_1_n_0 ;
  wire \S_AXI_RDATA[28]_i_1_n_0 ;
  wire \S_AXI_RDATA[29]_i_1_n_0 ;
  wire \S_AXI_RDATA[2]_i_1_n_0 ;
  wire \S_AXI_RDATA[2]_i_2_n_0 ;
  wire \S_AXI_RDATA[2]_i_3_n_0 ;
  wire \S_AXI_RDATA[2]_i_4_n_0 ;
  wire \S_AXI_RDATA[30]_i_1_n_0 ;
  wire \S_AXI_RDATA[31]_i_1_n_0 ;
  wire \S_AXI_RDATA[31]_i_2_n_0 ;
  wire \S_AXI_RDATA[31]_i_3_n_0 ;
  wire \S_AXI_RDATA[3]_i_1_n_0 ;
  wire \S_AXI_RDATA[3]_i_2_n_0 ;
  wire \S_AXI_RDATA[3]_i_3_n_0 ;
  wire \S_AXI_RDATA[3]_i_4_n_0 ;
  wire \S_AXI_RDATA[4]_i_1_n_0 ;
  wire \S_AXI_RDATA[4]_i_2_n_0 ;
  wire \S_AXI_RDATA[4]_i_3_n_0 ;
  wire \S_AXI_RDATA[4]_i_4_n_0 ;
  wire \S_AXI_RDATA[5]_i_1_n_0 ;
  wire \S_AXI_RDATA[5]_i_2_n_0 ;
  wire \S_AXI_RDATA[5]_i_3_n_0 ;
  wire \S_AXI_RDATA[5]_i_4_n_0 ;
  wire \S_AXI_RDATA[6]_i_1_n_0 ;
  wire \S_AXI_RDATA[6]_i_2_n_0 ;
  wire \S_AXI_RDATA[6]_i_3_n_0 ;
  wire \S_AXI_RDATA[6]_i_4_n_0 ;
  wire \S_AXI_RDATA[7]_i_1_n_0 ;
  wire \S_AXI_RDATA[7]_i_2_n_0 ;
  wire \S_AXI_RDATA[7]_i_3_n_0 ;
  wire \S_AXI_RDATA[7]_i_4_n_0 ;
  wire \S_AXI_RDATA[8]_i_1_n_0 ;
  wire \S_AXI_RDATA[8]_i_2_n_0 ;
  wire \S_AXI_RDATA[8]_i_3_n_0 ;
  wire \S_AXI_RDATA[9]_i_1_n_0 ;
  wire \S_AXI_RDATA[9]_i_2_n_0 ;
  wire \S_AXI_RDATA[9]_i_3_n_0 ;
  wire S_AXI_RREADY;
  wire S_AXI_RVALID_i_1_n_0;
  wire S_AXI_RVALID_reg_0;
  wire [31:0]S_AXI_WDATA;
  wire S_AXI_WREADY;
  wire [0:0]S_AXI_WSTRB;
  wire S_AXI_WVALID;
  wire busy_i;
  wire [31:0]cfg_base_a_o;
  wire [31:0]cfg_base_b_o;
  wire [31:0]cfg_base_c_o;
  wire [15:0]cfg_k_dim_o;
  wire [15:0]cfg_k_total_o;
  wire [15:0]cfg_m_total_o;
  wire [15:0]cfg_n_stride_o;
  wire [15:0]cfg_n_total_o;
  wire [15:0]cfg_num_k_tiles_per_block_o;
  wire [4:0]cfg_scale_shift_o;
  wire [7:0]cfg_zero_point_o;
  wire done_i;
  wire done_sticky_r_i_1_n_0;
  wire done_sticky_r_i_2_n_0;
  wire done_sticky_r_i_4_n_0;
  wire done_sticky_r_i_5_n_0;
  wire irq_o;
  wire p_0_in;
  wire [5:0]p_0_in_0;
  wire [5:0]p_1_in;
  wire p_2_in;
  wire [0:0]r_base_a_r;
  wire [0:0]r_base_b_r;
  wire [0:0]r_base_c_r;
  wire [0:0]r_k_dim_r;
  wire [0:0]r_k_total_r;
  wire [0:0]r_m_total_r;
  wire \r_m_total_r[15]_i_2_n_0 ;
  wire [0:0]r_n_stride_r;
  wire \r_n_stride_r[15]_i_2_n_0 ;
  wire [0:0]r_n_total_r;
  wire [0:0]r_numkt_r;
  wire [0:0]r_scale_shift_r;
  wire [0:0]r_zero_point_r;
  wire start_o;
  wire start_pulse_r_i_1_n_0;
  wire start_pulse_r_i_2_n_0;
  wire start_pulse_r_i_3_n_0;

  LUT2 #(
    .INIT(4'h2)) 
    S_AXI_ARREADY_i_1
       (.I0(S_AXI_ARVALID),
        .I1(S_AXI_ARREADY),
        .O(S_AXI_ARREADY0));
  FDRE S_AXI_ARREADY_reg
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(S_AXI_ARREADY0),
        .Q(S_AXI_ARREADY),
        .R(p_0_in));
  LUT1 #(
    .INIT(2'h1)) 
    S_AXI_AWREADY_i_1
       (.I0(S_AXI_ARESETN),
        .O(p_0_in));
  LUT3 #(
    .INIT(8'h08)) 
    S_AXI_AWREADY_i_2
       (.I0(S_AXI_AWVALID),
        .I1(S_AXI_WVALID),
        .I2(S_AXI_WREADY),
        .O(S_AXI_AWREADY0));
  FDRE S_AXI_AWREADY_reg
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(S_AXI_AWREADY0),
        .Q(S_AXI_WREADY),
        .R(p_0_in));
  LUT5 #(
    .INIT(32'h5555C000)) 
    S_AXI_BVALID_i_1
       (.I0(S_AXI_BREADY),
        .I1(S_AXI_WVALID),
        .I2(S_AXI_AWVALID),
        .I3(S_AXI_WREADY),
        .I4(S_AXI_BVALID),
        .O(S_AXI_BVALID_i_1_n_0));
  FDRE S_AXI_BVALID_reg
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(S_AXI_BVALID_i_1_n_0),
        .Q(S_AXI_BVALID),
        .R(p_0_in));
  LUT5 #(
    .INIT(32'h00CCF0AA)) 
    \S_AXI_RDATA[0]_i_1 
       (.I0(\S_AXI_RDATA[0]_i_2_n_0 ),
        .I1(\S_AXI_RDATA[0]_i_3_n_0 ),
        .I2(\S_AXI_RDATA[0]_i_4_n_0 ),
        .I3(p_0_in_0[2]),
        .I4(p_0_in_0[3]),
        .O(\S_AXI_RDATA[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    \S_AXI_RDATA[0]_i_2 
       (.I0(cfg_n_total_o[0]),
        .I1(cfg_k_dim_o[0]),
        .I2(p_0_in_0[0]),
        .I3(p_0_in_0[1]),
        .I4(cfg_m_total_o[0]),
        .I5(cfg_k_total_o[0]),
        .O(\S_AXI_RDATA[0]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h00CCF0AA)) 
    \S_AXI_RDATA[0]_i_3 
       (.I0(cfg_n_stride_o[0]),
        .I1(cfg_zero_point_o[0]),
        .I2(cfg_scale_shift_o[0]),
        .I3(p_0_in_0[0]),
        .I4(p_0_in_0[1]),
        .O(\S_AXI_RDATA[0]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    \S_AXI_RDATA[0]_i_4 
       (.I0(cfg_base_a_o[0]),
        .I1(cfg_base_c_o[0]),
        .I2(p_0_in_0[0]),
        .I3(p_0_in_0[1]),
        .I4(cfg_num_k_tiles_per_block_o[0]),
        .I5(cfg_base_b_o[0]),
        .O(\S_AXI_RDATA[0]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h0000C0C0FF00AAAA)) 
    \S_AXI_RDATA[10]_i_1 
       (.I0(\S_AXI_RDATA[10]_i_2_n_0 ),
        .I1(\S_AXI_RDATA[15]_i_4_n_0 ),
        .I2(cfg_n_stride_o[10]),
        .I3(\S_AXI_RDATA[10]_i_3_n_0 ),
        .I4(p_0_in_0[2]),
        .I5(p_0_in_0[3]),
        .O(\S_AXI_RDATA[10]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    \S_AXI_RDATA[10]_i_2 
       (.I0(cfg_n_total_o[10]),
        .I1(cfg_k_dim_o[10]),
        .I2(p_0_in_0[0]),
        .I3(p_0_in_0[1]),
        .I4(cfg_m_total_o[10]),
        .I5(cfg_k_total_o[10]),
        .O(\S_AXI_RDATA[10]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    \S_AXI_RDATA[10]_i_3 
       (.I0(cfg_base_a_o[10]),
        .I1(cfg_base_c_o[10]),
        .I2(p_0_in_0[0]),
        .I3(p_0_in_0[1]),
        .I4(cfg_num_k_tiles_per_block_o[10]),
        .I5(cfg_base_b_o[10]),
        .O(\S_AXI_RDATA[10]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0000C0C0FF00AAAA)) 
    \S_AXI_RDATA[11]_i_1 
       (.I0(\S_AXI_RDATA[11]_i_2_n_0 ),
        .I1(\S_AXI_RDATA[15]_i_4_n_0 ),
        .I2(cfg_n_stride_o[11]),
        .I3(\S_AXI_RDATA[11]_i_3_n_0 ),
        .I4(p_0_in_0[2]),
        .I5(p_0_in_0[3]),
        .O(\S_AXI_RDATA[11]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    \S_AXI_RDATA[11]_i_2 
       (.I0(cfg_n_total_o[11]),
        .I1(cfg_k_dim_o[11]),
        .I2(p_0_in_0[0]),
        .I3(p_0_in_0[1]),
        .I4(cfg_m_total_o[11]),
        .I5(cfg_k_total_o[11]),
        .O(\S_AXI_RDATA[11]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    \S_AXI_RDATA[11]_i_3 
       (.I0(cfg_base_a_o[11]),
        .I1(cfg_base_c_o[11]),
        .I2(p_0_in_0[0]),
        .I3(p_0_in_0[1]),
        .I4(cfg_num_k_tiles_per_block_o[11]),
        .I5(cfg_base_b_o[11]),
        .O(\S_AXI_RDATA[11]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0000C0C0FF00AAAA)) 
    \S_AXI_RDATA[12]_i_1 
       (.I0(\S_AXI_RDATA[12]_i_2_n_0 ),
        .I1(\S_AXI_RDATA[15]_i_4_n_0 ),
        .I2(cfg_n_stride_o[12]),
        .I3(\S_AXI_RDATA[12]_i_3_n_0 ),
        .I4(p_0_in_0[2]),
        .I5(p_0_in_0[3]),
        .O(\S_AXI_RDATA[12]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    \S_AXI_RDATA[12]_i_2 
       (.I0(cfg_n_total_o[12]),
        .I1(cfg_k_dim_o[12]),
        .I2(p_0_in_0[0]),
        .I3(p_0_in_0[1]),
        .I4(cfg_m_total_o[12]),
        .I5(cfg_k_total_o[12]),
        .O(\S_AXI_RDATA[12]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    \S_AXI_RDATA[12]_i_3 
       (.I0(cfg_base_a_o[12]),
        .I1(cfg_base_c_o[12]),
        .I2(p_0_in_0[0]),
        .I3(p_0_in_0[1]),
        .I4(cfg_num_k_tiles_per_block_o[12]),
        .I5(cfg_base_b_o[12]),
        .O(\S_AXI_RDATA[12]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0000C0C0FF00AAAA)) 
    \S_AXI_RDATA[13]_i_1 
       (.I0(\S_AXI_RDATA[13]_i_2_n_0 ),
        .I1(\S_AXI_RDATA[15]_i_4_n_0 ),
        .I2(cfg_n_stride_o[13]),
        .I3(\S_AXI_RDATA[13]_i_3_n_0 ),
        .I4(p_0_in_0[2]),
        .I5(p_0_in_0[3]),
        .O(\S_AXI_RDATA[13]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    \S_AXI_RDATA[13]_i_2 
       (.I0(cfg_n_total_o[13]),
        .I1(cfg_k_dim_o[13]),
        .I2(p_0_in_0[0]),
        .I3(p_0_in_0[1]),
        .I4(cfg_m_total_o[13]),
        .I5(cfg_k_total_o[13]),
        .O(\S_AXI_RDATA[13]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    \S_AXI_RDATA[13]_i_3 
       (.I0(cfg_base_a_o[13]),
        .I1(cfg_base_c_o[13]),
        .I2(p_0_in_0[0]),
        .I3(p_0_in_0[1]),
        .I4(cfg_num_k_tiles_per_block_o[13]),
        .I5(cfg_base_b_o[13]),
        .O(\S_AXI_RDATA[13]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0000C0C0FF00AAAA)) 
    \S_AXI_RDATA[14]_i_1 
       (.I0(\S_AXI_RDATA[14]_i_2_n_0 ),
        .I1(\S_AXI_RDATA[15]_i_4_n_0 ),
        .I2(cfg_n_stride_o[14]),
        .I3(\S_AXI_RDATA[14]_i_3_n_0 ),
        .I4(p_0_in_0[2]),
        .I5(p_0_in_0[3]),
        .O(\S_AXI_RDATA[14]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    \S_AXI_RDATA[14]_i_2 
       (.I0(cfg_n_total_o[14]),
        .I1(cfg_k_dim_o[14]),
        .I2(p_0_in_0[0]),
        .I3(p_0_in_0[1]),
        .I4(cfg_m_total_o[14]),
        .I5(cfg_k_total_o[14]),
        .O(\S_AXI_RDATA[14]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    \S_AXI_RDATA[14]_i_3 
       (.I0(cfg_base_a_o[14]),
        .I1(cfg_base_c_o[14]),
        .I2(p_0_in_0[0]),
        .I3(p_0_in_0[1]),
        .I4(cfg_num_k_tiles_per_block_o[14]),
        .I5(cfg_base_b_o[14]),
        .O(\S_AXI_RDATA[14]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0000E00000000000)) 
    \S_AXI_RDATA[15]_i_1 
       (.I0(p_0_in_0[4]),
        .I1(p_0_in_0[5]),
        .I2(S_AXI_ARREADY),
        .I3(S_AXI_ARVALID),
        .I4(S_AXI_RVALID_reg_0),
        .I5(S_AXI_ARESETN),
        .O(\S_AXI_RDATA[15]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000C0C0FF00AAAA)) 
    \S_AXI_RDATA[15]_i_2 
       (.I0(\S_AXI_RDATA[15]_i_3_n_0 ),
        .I1(\S_AXI_RDATA[15]_i_4_n_0 ),
        .I2(cfg_n_stride_o[15]),
        .I3(\S_AXI_RDATA[15]_i_5_n_0 ),
        .I4(p_0_in_0[2]),
        .I5(p_0_in_0[3]),
        .O(\S_AXI_RDATA[15]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    \S_AXI_RDATA[15]_i_3 
       (.I0(cfg_n_total_o[15]),
        .I1(cfg_k_dim_o[15]),
        .I2(p_0_in_0[0]),
        .I3(p_0_in_0[1]),
        .I4(cfg_m_total_o[15]),
        .I5(cfg_k_total_o[15]),
        .O(\S_AXI_RDATA[15]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'h1)) 
    \S_AXI_RDATA[15]_i_4 
       (.I0(p_0_in_0[1]),
        .I1(p_0_in_0[0]),
        .O(\S_AXI_RDATA[15]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    \S_AXI_RDATA[15]_i_5 
       (.I0(cfg_base_a_o[15]),
        .I1(cfg_base_c_o[15]),
        .I2(p_0_in_0[0]),
        .I3(p_0_in_0[1]),
        .I4(cfg_num_k_tiles_per_block_o[15]),
        .I5(cfg_base_b_o[15]),
        .O(\S_AXI_RDATA[15]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'hF0CCAA00)) 
    \S_AXI_RDATA[16]_i_1 
       (.I0(cfg_base_b_o[16]),
        .I1(cfg_base_a_o[16]),
        .I2(cfg_base_c_o[16]),
        .I3(p_0_in_0[1]),
        .I4(p_0_in_0[0]),
        .O(\S_AXI_RDATA[16]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hF0CCAA00)) 
    \S_AXI_RDATA[17]_i_1 
       (.I0(cfg_base_b_o[17]),
        .I1(cfg_base_a_o[17]),
        .I2(cfg_base_c_o[17]),
        .I3(p_0_in_0[1]),
        .I4(p_0_in_0[0]),
        .O(\S_AXI_RDATA[17]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hF0CCAA00)) 
    \S_AXI_RDATA[18]_i_1 
       (.I0(cfg_base_b_o[18]),
        .I1(cfg_base_a_o[18]),
        .I2(cfg_base_c_o[18]),
        .I3(p_0_in_0[1]),
        .I4(p_0_in_0[0]),
        .O(\S_AXI_RDATA[18]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hF0CCAA00)) 
    \S_AXI_RDATA[19]_i_1 
       (.I0(cfg_base_b_o[19]),
        .I1(cfg_base_a_o[19]),
        .I2(cfg_base_c_o[19]),
        .I3(p_0_in_0[1]),
        .I4(p_0_in_0[0]),
        .O(\S_AXI_RDATA[19]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00CCF0AA)) 
    \S_AXI_RDATA[1]_i_1 
       (.I0(\S_AXI_RDATA[1]_i_2_n_0 ),
        .I1(\S_AXI_RDATA[1]_i_3_n_0 ),
        .I2(\S_AXI_RDATA[1]_i_4_n_0 ),
        .I3(p_0_in_0[2]),
        .I4(p_0_in_0[3]),
        .O(\S_AXI_RDATA[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    \S_AXI_RDATA[1]_i_2 
       (.I0(cfg_n_total_o[1]),
        .I1(cfg_k_dim_o[1]),
        .I2(p_0_in_0[0]),
        .I3(p_0_in_0[1]),
        .I4(cfg_m_total_o[1]),
        .I5(cfg_k_total_o[1]),
        .O(\S_AXI_RDATA[1]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    \S_AXI_RDATA[1]_i_3 
       (.I0(cfg_scale_shift_o[1]),
        .I1(busy_i),
        .I2(p_0_in_0[0]),
        .I3(p_0_in_0[1]),
        .I4(cfg_n_stride_o[1]),
        .I5(cfg_zero_point_o[1]),
        .O(\S_AXI_RDATA[1]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    \S_AXI_RDATA[1]_i_4 
       (.I0(cfg_base_a_o[1]),
        .I1(cfg_base_c_o[1]),
        .I2(p_0_in_0[0]),
        .I3(p_0_in_0[1]),
        .I4(cfg_num_k_tiles_per_block_o[1]),
        .I5(cfg_base_b_o[1]),
        .O(\S_AXI_RDATA[1]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'hF0CCAA00)) 
    \S_AXI_RDATA[20]_i_1 
       (.I0(cfg_base_b_o[20]),
        .I1(cfg_base_a_o[20]),
        .I2(cfg_base_c_o[20]),
        .I3(p_0_in_0[1]),
        .I4(p_0_in_0[0]),
        .O(\S_AXI_RDATA[20]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hF0CCAA00)) 
    \S_AXI_RDATA[21]_i_1 
       (.I0(cfg_base_b_o[21]),
        .I1(cfg_base_a_o[21]),
        .I2(cfg_base_c_o[21]),
        .I3(p_0_in_0[1]),
        .I4(p_0_in_0[0]),
        .O(\S_AXI_RDATA[21]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hF0CCAA00)) 
    \S_AXI_RDATA[22]_i_1 
       (.I0(cfg_base_b_o[22]),
        .I1(cfg_base_a_o[22]),
        .I2(cfg_base_c_o[22]),
        .I3(p_0_in_0[1]),
        .I4(p_0_in_0[0]),
        .O(\S_AXI_RDATA[22]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hF0CCAA00)) 
    \S_AXI_RDATA[23]_i_1 
       (.I0(cfg_base_b_o[23]),
        .I1(cfg_base_a_o[23]),
        .I2(cfg_base_c_o[23]),
        .I3(p_0_in_0[1]),
        .I4(p_0_in_0[0]),
        .O(\S_AXI_RDATA[23]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hF0CCAA00)) 
    \S_AXI_RDATA[24]_i_1 
       (.I0(cfg_base_b_o[24]),
        .I1(cfg_base_a_o[24]),
        .I2(cfg_base_c_o[24]),
        .I3(p_0_in_0[1]),
        .I4(p_0_in_0[0]),
        .O(\S_AXI_RDATA[24]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hF0CCAA00)) 
    \S_AXI_RDATA[25]_i_1 
       (.I0(cfg_base_b_o[25]),
        .I1(cfg_base_a_o[25]),
        .I2(cfg_base_c_o[25]),
        .I3(p_0_in_0[1]),
        .I4(p_0_in_0[0]),
        .O(\S_AXI_RDATA[25]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hF0CCAA00)) 
    \S_AXI_RDATA[26]_i_1 
       (.I0(cfg_base_b_o[26]),
        .I1(cfg_base_a_o[26]),
        .I2(cfg_base_c_o[26]),
        .I3(p_0_in_0[1]),
        .I4(p_0_in_0[0]),
        .O(\S_AXI_RDATA[26]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hF0CCAA00)) 
    \S_AXI_RDATA[27]_i_1 
       (.I0(cfg_base_b_o[27]),
        .I1(cfg_base_a_o[27]),
        .I2(cfg_base_c_o[27]),
        .I3(p_0_in_0[1]),
        .I4(p_0_in_0[0]),
        .O(\S_AXI_RDATA[27]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hF0CCAA00)) 
    \S_AXI_RDATA[28]_i_1 
       (.I0(cfg_base_b_o[28]),
        .I1(cfg_base_a_o[28]),
        .I2(cfg_base_c_o[28]),
        .I3(p_0_in_0[1]),
        .I4(p_0_in_0[0]),
        .O(\S_AXI_RDATA[28]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hF0CCAA00)) 
    \S_AXI_RDATA[29]_i_1 
       (.I0(cfg_base_b_o[29]),
        .I1(cfg_base_a_o[29]),
        .I2(cfg_base_c_o[29]),
        .I3(p_0_in_0[1]),
        .I4(p_0_in_0[0]),
        .O(\S_AXI_RDATA[29]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00CCF0AA)) 
    \S_AXI_RDATA[2]_i_1 
       (.I0(\S_AXI_RDATA[2]_i_2_n_0 ),
        .I1(\S_AXI_RDATA[2]_i_3_n_0 ),
        .I2(\S_AXI_RDATA[2]_i_4_n_0 ),
        .I3(p_0_in_0[2]),
        .I4(p_0_in_0[3]),
        .O(\S_AXI_RDATA[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    \S_AXI_RDATA[2]_i_2 
       (.I0(cfg_n_total_o[2]),
        .I1(cfg_k_dim_o[2]),
        .I2(p_0_in_0[0]),
        .I3(p_0_in_0[1]),
        .I4(cfg_m_total_o[2]),
        .I5(cfg_k_total_o[2]),
        .O(\S_AXI_RDATA[2]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    \S_AXI_RDATA[2]_i_3 
       (.I0(cfg_scale_shift_o[2]),
        .I1(irq_o),
        .I2(p_0_in_0[0]),
        .I3(p_0_in_0[1]),
        .I4(cfg_n_stride_o[2]),
        .I5(cfg_zero_point_o[2]),
        .O(\S_AXI_RDATA[2]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    \S_AXI_RDATA[2]_i_4 
       (.I0(cfg_base_a_o[2]),
        .I1(cfg_base_c_o[2]),
        .I2(p_0_in_0[0]),
        .I3(p_0_in_0[1]),
        .I4(cfg_num_k_tiles_per_block_o[2]),
        .I5(cfg_base_b_o[2]),
        .O(\S_AXI_RDATA[2]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'hF0CCAA00)) 
    \S_AXI_RDATA[30]_i_1 
       (.I0(cfg_base_b_o[30]),
        .I1(cfg_base_a_o[30]),
        .I2(cfg_base_c_o[30]),
        .I3(p_0_in_0[1]),
        .I4(p_0_in_0[0]),
        .O(\S_AXI_RDATA[30]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hAAAAA8AA)) 
    \S_AXI_RDATA[31]_i_1 
       (.I0(\S_AXI_RDATA[31]_i_2_n_0 ),
        .I1(p_0_in_0[5]),
        .I2(p_0_in_0[4]),
        .I3(p_0_in_0[2]),
        .I4(p_0_in_0[3]),
        .O(\S_AXI_RDATA[31]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h2000)) 
    \S_AXI_RDATA[31]_i_2 
       (.I0(S_AXI_ARESETN),
        .I1(S_AXI_RVALID_reg_0),
        .I2(S_AXI_ARVALID),
        .I3(S_AXI_ARREADY),
        .O(\S_AXI_RDATA[31]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hF0CCAA00)) 
    \S_AXI_RDATA[31]_i_3 
       (.I0(cfg_base_b_o[31]),
        .I1(cfg_base_a_o[31]),
        .I2(cfg_base_c_o[31]),
        .I3(p_0_in_0[1]),
        .I4(p_0_in_0[0]),
        .O(\S_AXI_RDATA[31]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'h00CCF0AA)) 
    \S_AXI_RDATA[3]_i_1 
       (.I0(\S_AXI_RDATA[3]_i_2_n_0 ),
        .I1(\S_AXI_RDATA[3]_i_3_n_0 ),
        .I2(\S_AXI_RDATA[3]_i_4_n_0 ),
        .I3(p_0_in_0[2]),
        .I4(p_0_in_0[3]),
        .O(\S_AXI_RDATA[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    \S_AXI_RDATA[3]_i_2 
       (.I0(cfg_n_total_o[3]),
        .I1(cfg_k_dim_o[3]),
        .I2(p_0_in_0[0]),
        .I3(p_0_in_0[1]),
        .I4(cfg_m_total_o[3]),
        .I5(cfg_k_total_o[3]),
        .O(\S_AXI_RDATA[3]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h00CCF0AA)) 
    \S_AXI_RDATA[3]_i_3 
       (.I0(cfg_n_stride_o[3]),
        .I1(cfg_zero_point_o[3]),
        .I2(cfg_scale_shift_o[3]),
        .I3(p_0_in_0[0]),
        .I4(p_0_in_0[1]),
        .O(\S_AXI_RDATA[3]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    \S_AXI_RDATA[3]_i_4 
       (.I0(cfg_base_a_o[3]),
        .I1(cfg_base_c_o[3]),
        .I2(p_0_in_0[0]),
        .I3(p_0_in_0[1]),
        .I4(cfg_num_k_tiles_per_block_o[3]),
        .I5(cfg_base_b_o[3]),
        .O(\S_AXI_RDATA[3]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'h00CCF0AA)) 
    \S_AXI_RDATA[4]_i_1 
       (.I0(\S_AXI_RDATA[4]_i_2_n_0 ),
        .I1(\S_AXI_RDATA[4]_i_3_n_0 ),
        .I2(\S_AXI_RDATA[4]_i_4_n_0 ),
        .I3(p_0_in_0[2]),
        .I4(p_0_in_0[3]),
        .O(\S_AXI_RDATA[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    \S_AXI_RDATA[4]_i_2 
       (.I0(cfg_n_total_o[4]),
        .I1(cfg_k_dim_o[4]),
        .I2(p_0_in_0[0]),
        .I3(p_0_in_0[1]),
        .I4(cfg_m_total_o[4]),
        .I5(cfg_k_total_o[4]),
        .O(\S_AXI_RDATA[4]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h00CCF0AA)) 
    \S_AXI_RDATA[4]_i_3 
       (.I0(cfg_n_stride_o[4]),
        .I1(cfg_zero_point_o[4]),
        .I2(cfg_scale_shift_o[4]),
        .I3(p_0_in_0[0]),
        .I4(p_0_in_0[1]),
        .O(\S_AXI_RDATA[4]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    \S_AXI_RDATA[4]_i_4 
       (.I0(cfg_base_a_o[4]),
        .I1(cfg_base_c_o[4]),
        .I2(p_0_in_0[0]),
        .I3(p_0_in_0[1]),
        .I4(cfg_num_k_tiles_per_block_o[4]),
        .I5(cfg_base_b_o[4]),
        .O(\S_AXI_RDATA[4]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'hBBBAABAA)) 
    \S_AXI_RDATA[5]_i_1 
       (.I0(\S_AXI_RDATA[5]_i_2_n_0 ),
        .I1(p_0_in_0[3]),
        .I2(p_0_in_0[2]),
        .I3(\S_AXI_RDATA[5]_i_3_n_0 ),
        .I4(\S_AXI_RDATA[5]_i_4_n_0 ),
        .O(\S_AXI_RDATA[5]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00000A0000000C00)) 
    \S_AXI_RDATA[5]_i_2 
       (.I0(cfg_zero_point_o[5]),
        .I1(cfg_n_stride_o[5]),
        .I2(p_0_in_0[2]),
        .I3(p_0_in_0[3]),
        .I4(p_0_in_0[0]),
        .I5(p_0_in_0[1]),
        .O(\S_AXI_RDATA[5]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    \S_AXI_RDATA[5]_i_3 
       (.I0(cfg_n_total_o[5]),
        .I1(cfg_k_dim_o[5]),
        .I2(p_0_in_0[0]),
        .I3(p_0_in_0[1]),
        .I4(cfg_m_total_o[5]),
        .I5(cfg_k_total_o[5]),
        .O(\S_AXI_RDATA[5]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    \S_AXI_RDATA[5]_i_4 
       (.I0(cfg_base_a_o[5]),
        .I1(cfg_base_c_o[5]),
        .I2(p_0_in_0[0]),
        .I3(p_0_in_0[1]),
        .I4(cfg_num_k_tiles_per_block_o[5]),
        .I5(cfg_base_b_o[5]),
        .O(\S_AXI_RDATA[5]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'hBBBAABAA)) 
    \S_AXI_RDATA[6]_i_1 
       (.I0(\S_AXI_RDATA[6]_i_2_n_0 ),
        .I1(p_0_in_0[3]),
        .I2(p_0_in_0[2]),
        .I3(\S_AXI_RDATA[6]_i_3_n_0 ),
        .I4(\S_AXI_RDATA[6]_i_4_n_0 ),
        .O(\S_AXI_RDATA[6]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00000A0000000C00)) 
    \S_AXI_RDATA[6]_i_2 
       (.I0(cfg_zero_point_o[6]),
        .I1(cfg_n_stride_o[6]),
        .I2(p_0_in_0[2]),
        .I3(p_0_in_0[3]),
        .I4(p_0_in_0[0]),
        .I5(p_0_in_0[1]),
        .O(\S_AXI_RDATA[6]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    \S_AXI_RDATA[6]_i_3 
       (.I0(cfg_n_total_o[6]),
        .I1(cfg_k_dim_o[6]),
        .I2(p_0_in_0[0]),
        .I3(p_0_in_0[1]),
        .I4(cfg_m_total_o[6]),
        .I5(cfg_k_total_o[6]),
        .O(\S_AXI_RDATA[6]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    \S_AXI_RDATA[6]_i_4 
       (.I0(cfg_base_a_o[6]),
        .I1(cfg_base_c_o[6]),
        .I2(p_0_in_0[0]),
        .I3(p_0_in_0[1]),
        .I4(cfg_num_k_tiles_per_block_o[6]),
        .I5(cfg_base_b_o[6]),
        .O(\S_AXI_RDATA[6]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'hBBBAABAA)) 
    \S_AXI_RDATA[7]_i_1 
       (.I0(\S_AXI_RDATA[7]_i_2_n_0 ),
        .I1(p_0_in_0[3]),
        .I2(p_0_in_0[2]),
        .I3(\S_AXI_RDATA[7]_i_3_n_0 ),
        .I4(\S_AXI_RDATA[7]_i_4_n_0 ),
        .O(\S_AXI_RDATA[7]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00000A0000000C00)) 
    \S_AXI_RDATA[7]_i_2 
       (.I0(cfg_zero_point_o[7]),
        .I1(cfg_n_stride_o[7]),
        .I2(p_0_in_0[2]),
        .I3(p_0_in_0[3]),
        .I4(p_0_in_0[0]),
        .I5(p_0_in_0[1]),
        .O(\S_AXI_RDATA[7]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    \S_AXI_RDATA[7]_i_3 
       (.I0(cfg_n_total_o[7]),
        .I1(cfg_k_dim_o[7]),
        .I2(p_0_in_0[0]),
        .I3(p_0_in_0[1]),
        .I4(cfg_m_total_o[7]),
        .I5(cfg_k_total_o[7]),
        .O(\S_AXI_RDATA[7]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    \S_AXI_RDATA[7]_i_4 
       (.I0(cfg_base_a_o[7]),
        .I1(cfg_base_c_o[7]),
        .I2(p_0_in_0[0]),
        .I3(p_0_in_0[1]),
        .I4(cfg_num_k_tiles_per_block_o[7]),
        .I5(cfg_base_b_o[7]),
        .O(\S_AXI_RDATA[7]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h0000C0C0FF00AAAA)) 
    \S_AXI_RDATA[8]_i_1 
       (.I0(\S_AXI_RDATA[8]_i_2_n_0 ),
        .I1(\S_AXI_RDATA[15]_i_4_n_0 ),
        .I2(cfg_n_stride_o[8]),
        .I3(\S_AXI_RDATA[8]_i_3_n_0 ),
        .I4(p_0_in_0[2]),
        .I5(p_0_in_0[3]),
        .O(\S_AXI_RDATA[8]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    \S_AXI_RDATA[8]_i_2 
       (.I0(cfg_n_total_o[8]),
        .I1(cfg_k_dim_o[8]),
        .I2(p_0_in_0[0]),
        .I3(p_0_in_0[1]),
        .I4(cfg_m_total_o[8]),
        .I5(cfg_k_total_o[8]),
        .O(\S_AXI_RDATA[8]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    \S_AXI_RDATA[8]_i_3 
       (.I0(cfg_base_a_o[8]),
        .I1(cfg_base_c_o[8]),
        .I2(p_0_in_0[0]),
        .I3(p_0_in_0[1]),
        .I4(cfg_num_k_tiles_per_block_o[8]),
        .I5(cfg_base_b_o[8]),
        .O(\S_AXI_RDATA[8]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0000C0C0FF00AAAA)) 
    \S_AXI_RDATA[9]_i_1 
       (.I0(\S_AXI_RDATA[9]_i_2_n_0 ),
        .I1(\S_AXI_RDATA[15]_i_4_n_0 ),
        .I2(cfg_n_stride_o[9]),
        .I3(\S_AXI_RDATA[9]_i_3_n_0 ),
        .I4(p_0_in_0[2]),
        .I5(p_0_in_0[3]),
        .O(\S_AXI_RDATA[9]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    \S_AXI_RDATA[9]_i_2 
       (.I0(cfg_n_total_o[9]),
        .I1(cfg_k_dim_o[9]),
        .I2(p_0_in_0[0]),
        .I3(p_0_in_0[1]),
        .I4(cfg_m_total_o[9]),
        .I5(cfg_k_total_o[9]),
        .O(\S_AXI_RDATA[9]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    \S_AXI_RDATA[9]_i_3 
       (.I0(cfg_base_a_o[9]),
        .I1(cfg_base_c_o[9]),
        .I2(p_0_in_0[0]),
        .I3(p_0_in_0[1]),
        .I4(cfg_num_k_tiles_per_block_o[9]),
        .I5(cfg_base_b_o[9]),
        .O(\S_AXI_RDATA[9]_i_3_n_0 ));
  FDRE \S_AXI_RDATA_reg[0] 
       (.C(S_AXI_ACLK),
        .CE(\S_AXI_RDATA[31]_i_2_n_0 ),
        .D(\S_AXI_RDATA[0]_i_1_n_0 ),
        .Q(S_AXI_RDATA[0]),
        .R(\S_AXI_RDATA[15]_i_1_n_0 ));
  FDRE \S_AXI_RDATA_reg[10] 
       (.C(S_AXI_ACLK),
        .CE(\S_AXI_RDATA[31]_i_2_n_0 ),
        .D(\S_AXI_RDATA[10]_i_1_n_0 ),
        .Q(S_AXI_RDATA[10]),
        .R(\S_AXI_RDATA[15]_i_1_n_0 ));
  FDRE \S_AXI_RDATA_reg[11] 
       (.C(S_AXI_ACLK),
        .CE(\S_AXI_RDATA[31]_i_2_n_0 ),
        .D(\S_AXI_RDATA[11]_i_1_n_0 ),
        .Q(S_AXI_RDATA[11]),
        .R(\S_AXI_RDATA[15]_i_1_n_0 ));
  FDRE \S_AXI_RDATA_reg[12] 
       (.C(S_AXI_ACLK),
        .CE(\S_AXI_RDATA[31]_i_2_n_0 ),
        .D(\S_AXI_RDATA[12]_i_1_n_0 ),
        .Q(S_AXI_RDATA[12]),
        .R(\S_AXI_RDATA[15]_i_1_n_0 ));
  FDRE \S_AXI_RDATA_reg[13] 
       (.C(S_AXI_ACLK),
        .CE(\S_AXI_RDATA[31]_i_2_n_0 ),
        .D(\S_AXI_RDATA[13]_i_1_n_0 ),
        .Q(S_AXI_RDATA[13]),
        .R(\S_AXI_RDATA[15]_i_1_n_0 ));
  FDRE \S_AXI_RDATA_reg[14] 
       (.C(S_AXI_ACLK),
        .CE(\S_AXI_RDATA[31]_i_2_n_0 ),
        .D(\S_AXI_RDATA[14]_i_1_n_0 ),
        .Q(S_AXI_RDATA[14]),
        .R(\S_AXI_RDATA[15]_i_1_n_0 ));
  FDRE \S_AXI_RDATA_reg[15] 
       (.C(S_AXI_ACLK),
        .CE(\S_AXI_RDATA[31]_i_2_n_0 ),
        .D(\S_AXI_RDATA[15]_i_2_n_0 ),
        .Q(S_AXI_RDATA[15]),
        .R(\S_AXI_RDATA[15]_i_1_n_0 ));
  FDRE \S_AXI_RDATA_reg[16] 
       (.C(S_AXI_ACLK),
        .CE(\S_AXI_RDATA[31]_i_2_n_0 ),
        .D(\S_AXI_RDATA[16]_i_1_n_0 ),
        .Q(S_AXI_RDATA[16]),
        .R(\S_AXI_RDATA[31]_i_1_n_0 ));
  FDRE \S_AXI_RDATA_reg[17] 
       (.C(S_AXI_ACLK),
        .CE(\S_AXI_RDATA[31]_i_2_n_0 ),
        .D(\S_AXI_RDATA[17]_i_1_n_0 ),
        .Q(S_AXI_RDATA[17]),
        .R(\S_AXI_RDATA[31]_i_1_n_0 ));
  FDRE \S_AXI_RDATA_reg[18] 
       (.C(S_AXI_ACLK),
        .CE(\S_AXI_RDATA[31]_i_2_n_0 ),
        .D(\S_AXI_RDATA[18]_i_1_n_0 ),
        .Q(S_AXI_RDATA[18]),
        .R(\S_AXI_RDATA[31]_i_1_n_0 ));
  FDRE \S_AXI_RDATA_reg[19] 
       (.C(S_AXI_ACLK),
        .CE(\S_AXI_RDATA[31]_i_2_n_0 ),
        .D(\S_AXI_RDATA[19]_i_1_n_0 ),
        .Q(S_AXI_RDATA[19]),
        .R(\S_AXI_RDATA[31]_i_1_n_0 ));
  FDRE \S_AXI_RDATA_reg[1] 
       (.C(S_AXI_ACLK),
        .CE(\S_AXI_RDATA[31]_i_2_n_0 ),
        .D(\S_AXI_RDATA[1]_i_1_n_0 ),
        .Q(S_AXI_RDATA[1]),
        .R(\S_AXI_RDATA[15]_i_1_n_0 ));
  FDRE \S_AXI_RDATA_reg[20] 
       (.C(S_AXI_ACLK),
        .CE(\S_AXI_RDATA[31]_i_2_n_0 ),
        .D(\S_AXI_RDATA[20]_i_1_n_0 ),
        .Q(S_AXI_RDATA[20]),
        .R(\S_AXI_RDATA[31]_i_1_n_0 ));
  FDRE \S_AXI_RDATA_reg[21] 
       (.C(S_AXI_ACLK),
        .CE(\S_AXI_RDATA[31]_i_2_n_0 ),
        .D(\S_AXI_RDATA[21]_i_1_n_0 ),
        .Q(S_AXI_RDATA[21]),
        .R(\S_AXI_RDATA[31]_i_1_n_0 ));
  FDRE \S_AXI_RDATA_reg[22] 
       (.C(S_AXI_ACLK),
        .CE(\S_AXI_RDATA[31]_i_2_n_0 ),
        .D(\S_AXI_RDATA[22]_i_1_n_0 ),
        .Q(S_AXI_RDATA[22]),
        .R(\S_AXI_RDATA[31]_i_1_n_0 ));
  FDRE \S_AXI_RDATA_reg[23] 
       (.C(S_AXI_ACLK),
        .CE(\S_AXI_RDATA[31]_i_2_n_0 ),
        .D(\S_AXI_RDATA[23]_i_1_n_0 ),
        .Q(S_AXI_RDATA[23]),
        .R(\S_AXI_RDATA[31]_i_1_n_0 ));
  FDRE \S_AXI_RDATA_reg[24] 
       (.C(S_AXI_ACLK),
        .CE(\S_AXI_RDATA[31]_i_2_n_0 ),
        .D(\S_AXI_RDATA[24]_i_1_n_0 ),
        .Q(S_AXI_RDATA[24]),
        .R(\S_AXI_RDATA[31]_i_1_n_0 ));
  FDRE \S_AXI_RDATA_reg[25] 
       (.C(S_AXI_ACLK),
        .CE(\S_AXI_RDATA[31]_i_2_n_0 ),
        .D(\S_AXI_RDATA[25]_i_1_n_0 ),
        .Q(S_AXI_RDATA[25]),
        .R(\S_AXI_RDATA[31]_i_1_n_0 ));
  FDRE \S_AXI_RDATA_reg[26] 
       (.C(S_AXI_ACLK),
        .CE(\S_AXI_RDATA[31]_i_2_n_0 ),
        .D(\S_AXI_RDATA[26]_i_1_n_0 ),
        .Q(S_AXI_RDATA[26]),
        .R(\S_AXI_RDATA[31]_i_1_n_0 ));
  FDRE \S_AXI_RDATA_reg[27] 
       (.C(S_AXI_ACLK),
        .CE(\S_AXI_RDATA[31]_i_2_n_0 ),
        .D(\S_AXI_RDATA[27]_i_1_n_0 ),
        .Q(S_AXI_RDATA[27]),
        .R(\S_AXI_RDATA[31]_i_1_n_0 ));
  FDRE \S_AXI_RDATA_reg[28] 
       (.C(S_AXI_ACLK),
        .CE(\S_AXI_RDATA[31]_i_2_n_0 ),
        .D(\S_AXI_RDATA[28]_i_1_n_0 ),
        .Q(S_AXI_RDATA[28]),
        .R(\S_AXI_RDATA[31]_i_1_n_0 ));
  FDRE \S_AXI_RDATA_reg[29] 
       (.C(S_AXI_ACLK),
        .CE(\S_AXI_RDATA[31]_i_2_n_0 ),
        .D(\S_AXI_RDATA[29]_i_1_n_0 ),
        .Q(S_AXI_RDATA[29]),
        .R(\S_AXI_RDATA[31]_i_1_n_0 ));
  FDRE \S_AXI_RDATA_reg[2] 
       (.C(S_AXI_ACLK),
        .CE(\S_AXI_RDATA[31]_i_2_n_0 ),
        .D(\S_AXI_RDATA[2]_i_1_n_0 ),
        .Q(S_AXI_RDATA[2]),
        .R(\S_AXI_RDATA[15]_i_1_n_0 ));
  FDRE \S_AXI_RDATA_reg[30] 
       (.C(S_AXI_ACLK),
        .CE(\S_AXI_RDATA[31]_i_2_n_0 ),
        .D(\S_AXI_RDATA[30]_i_1_n_0 ),
        .Q(S_AXI_RDATA[30]),
        .R(\S_AXI_RDATA[31]_i_1_n_0 ));
  FDRE \S_AXI_RDATA_reg[31] 
       (.C(S_AXI_ACLK),
        .CE(\S_AXI_RDATA[31]_i_2_n_0 ),
        .D(\S_AXI_RDATA[31]_i_3_n_0 ),
        .Q(S_AXI_RDATA[31]),
        .R(\S_AXI_RDATA[31]_i_1_n_0 ));
  FDRE \S_AXI_RDATA_reg[3] 
       (.C(S_AXI_ACLK),
        .CE(\S_AXI_RDATA[31]_i_2_n_0 ),
        .D(\S_AXI_RDATA[3]_i_1_n_0 ),
        .Q(S_AXI_RDATA[3]),
        .R(\S_AXI_RDATA[15]_i_1_n_0 ));
  FDRE \S_AXI_RDATA_reg[4] 
       (.C(S_AXI_ACLK),
        .CE(\S_AXI_RDATA[31]_i_2_n_0 ),
        .D(\S_AXI_RDATA[4]_i_1_n_0 ),
        .Q(S_AXI_RDATA[4]),
        .R(\S_AXI_RDATA[15]_i_1_n_0 ));
  FDRE \S_AXI_RDATA_reg[5] 
       (.C(S_AXI_ACLK),
        .CE(\S_AXI_RDATA[31]_i_2_n_0 ),
        .D(\S_AXI_RDATA[5]_i_1_n_0 ),
        .Q(S_AXI_RDATA[5]),
        .R(\S_AXI_RDATA[15]_i_1_n_0 ));
  FDRE \S_AXI_RDATA_reg[6] 
       (.C(S_AXI_ACLK),
        .CE(\S_AXI_RDATA[31]_i_2_n_0 ),
        .D(\S_AXI_RDATA[6]_i_1_n_0 ),
        .Q(S_AXI_RDATA[6]),
        .R(\S_AXI_RDATA[15]_i_1_n_0 ));
  FDRE \S_AXI_RDATA_reg[7] 
       (.C(S_AXI_ACLK),
        .CE(\S_AXI_RDATA[31]_i_2_n_0 ),
        .D(\S_AXI_RDATA[7]_i_1_n_0 ),
        .Q(S_AXI_RDATA[7]),
        .R(\S_AXI_RDATA[15]_i_1_n_0 ));
  FDRE \S_AXI_RDATA_reg[8] 
       (.C(S_AXI_ACLK),
        .CE(\S_AXI_RDATA[31]_i_2_n_0 ),
        .D(\S_AXI_RDATA[8]_i_1_n_0 ),
        .Q(S_AXI_RDATA[8]),
        .R(\S_AXI_RDATA[15]_i_1_n_0 ));
  FDRE \S_AXI_RDATA_reg[9] 
       (.C(S_AXI_ACLK),
        .CE(\S_AXI_RDATA[31]_i_2_n_0 ),
        .D(\S_AXI_RDATA[9]_i_1_n_0 ),
        .Q(S_AXI_RDATA[9]),
        .R(\S_AXI_RDATA[15]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'h7444)) 
    S_AXI_RVALID_i_1
       (.I0(S_AXI_RREADY),
        .I1(S_AXI_RVALID_reg_0),
        .I2(S_AXI_ARVALID),
        .I3(S_AXI_ARREADY),
        .O(S_AXI_RVALID_i_1_n_0));
  FDRE S_AXI_RVALID_reg
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(S_AXI_RVALID_i_1_n_0),
        .Q(S_AXI_RVALID_reg_0),
        .R(p_0_in));
  FDRE \axi_araddr_r_reg[2] 
       (.C(S_AXI_ACLK),
        .CE(S_AXI_ARREADY0),
        .D(S_AXI_ARADDR[0]),
        .Q(p_0_in_0[0]),
        .R(p_0_in));
  FDRE \axi_araddr_r_reg[3] 
       (.C(S_AXI_ACLK),
        .CE(S_AXI_ARREADY0),
        .D(S_AXI_ARADDR[1]),
        .Q(p_0_in_0[1]),
        .R(p_0_in));
  FDRE \axi_araddr_r_reg[4] 
       (.C(S_AXI_ACLK),
        .CE(S_AXI_ARREADY0),
        .D(S_AXI_ARADDR[2]),
        .Q(p_0_in_0[2]),
        .R(p_0_in));
  FDRE \axi_araddr_r_reg[5] 
       (.C(S_AXI_ACLK),
        .CE(S_AXI_ARREADY0),
        .D(S_AXI_ARADDR[3]),
        .Q(p_0_in_0[3]),
        .R(p_0_in));
  FDRE \axi_araddr_r_reg[6] 
       (.C(S_AXI_ACLK),
        .CE(S_AXI_ARREADY0),
        .D(S_AXI_ARADDR[4]),
        .Q(p_0_in_0[4]),
        .R(p_0_in));
  FDRE \axi_araddr_r_reg[7] 
       (.C(S_AXI_ACLK),
        .CE(S_AXI_ARREADY0),
        .D(S_AXI_ARADDR[5]),
        .Q(p_0_in_0[5]),
        .R(p_0_in));
  FDRE \axi_awaddr_r_reg[2] 
       (.C(S_AXI_ACLK),
        .CE(S_AXI_AWREADY0),
        .D(S_AXI_AWADDR[0]),
        .Q(p_1_in[0]),
        .R(p_0_in));
  FDRE \axi_awaddr_r_reg[3] 
       (.C(S_AXI_ACLK),
        .CE(S_AXI_AWREADY0),
        .D(S_AXI_AWADDR[1]),
        .Q(p_1_in[1]),
        .R(p_0_in));
  FDRE \axi_awaddr_r_reg[4] 
       (.C(S_AXI_ACLK),
        .CE(S_AXI_AWREADY0),
        .D(S_AXI_AWADDR[2]),
        .Q(p_1_in[2]),
        .R(p_0_in));
  FDRE \axi_awaddr_r_reg[5] 
       (.C(S_AXI_ACLK),
        .CE(S_AXI_AWREADY0),
        .D(S_AXI_AWADDR[3]),
        .Q(p_1_in[3]),
        .R(p_0_in));
  FDRE \axi_awaddr_r_reg[6] 
       (.C(S_AXI_ACLK),
        .CE(S_AXI_AWREADY0),
        .D(S_AXI_AWADDR[4]),
        .Q(p_1_in[4]),
        .R(p_0_in));
  FDRE \axi_awaddr_r_reg[7] 
       (.C(S_AXI_ACLK),
        .CE(S_AXI_AWREADY0),
        .D(S_AXI_AWADDR[5]),
        .Q(p_1_in[5]),
        .R(p_0_in));
  LUT6 #(
    .INIT(64'hAABFBFBFAAAAAAAA)) 
    done_sticky_r_i_1
       (.I0(done_i),
        .I1(done_sticky_r_i_2_n_0),
        .I2(p_2_in),
        .I3(done_sticky_r_i_4_n_0),
        .I4(done_sticky_r_i_5_n_0),
        .I5(irq_o),
        .O(done_sticky_r_i_1_n_0));
  LUT6 #(
    .INIT(64'h0000100000000000)) 
    done_sticky_r_i_2
       (.I0(p_0_in_0[5]),
        .I1(p_0_in_0[4]),
        .I2(p_0_in_0[1]),
        .I3(p_0_in_0[0]),
        .I4(p_0_in_0[2]),
        .I5(p_0_in_0[3]),
        .O(done_sticky_r_i_2_n_0));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'h08)) 
    done_sticky_r_i_3
       (.I0(S_AXI_ARREADY),
        .I1(S_AXI_ARVALID),
        .I2(S_AXI_RVALID_reg_0),
        .O(p_2_in));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h04000000)) 
    done_sticky_r_i_4
       (.I0(p_1_in[4]),
        .I1(S_AXI_WDATA[0]),
        .I2(p_1_in[5]),
        .I3(p_1_in[0]),
        .I4(p_1_in[1]),
        .O(done_sticky_r_i_4_n_0));
  LUT6 #(
    .INIT(64'h4000000000000000)) 
    done_sticky_r_i_5
       (.I0(p_1_in[2]),
        .I1(S_AXI_WSTRB),
        .I2(p_1_in[3]),
        .I3(S_AXI_WVALID),
        .I4(S_AXI_AWVALID),
        .I5(S_AXI_WREADY),
        .O(done_sticky_r_i_5_n_0));
  FDRE done_sticky_r_reg
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(done_sticky_r_i_1_n_0),
        .Q(irq_o),
        .R(p_0_in));
  LUT4 #(
    .INIT(16'h4000)) 
    \r_base_a_r[31]_i_1 
       (.I0(p_1_in[1]),
        .I1(p_1_in[0]),
        .I2(p_1_in[2]),
        .I3(\r_m_total_r[15]_i_2_n_0 ),
        .O(r_base_a_r));
  FDRE \r_base_a_r_reg[0] 
       (.C(S_AXI_ACLK),
        .CE(r_base_a_r),
        .D(S_AXI_WDATA[0]),
        .Q(cfg_base_a_o[0]),
        .R(p_0_in));
  FDRE \r_base_a_r_reg[10] 
       (.C(S_AXI_ACLK),
        .CE(r_base_a_r),
        .D(S_AXI_WDATA[10]),
        .Q(cfg_base_a_o[10]),
        .R(p_0_in));
  FDRE \r_base_a_r_reg[11] 
       (.C(S_AXI_ACLK),
        .CE(r_base_a_r),
        .D(S_AXI_WDATA[11]),
        .Q(cfg_base_a_o[11]),
        .R(p_0_in));
  FDRE \r_base_a_r_reg[12] 
       (.C(S_AXI_ACLK),
        .CE(r_base_a_r),
        .D(S_AXI_WDATA[12]),
        .Q(cfg_base_a_o[12]),
        .R(p_0_in));
  FDRE \r_base_a_r_reg[13] 
       (.C(S_AXI_ACLK),
        .CE(r_base_a_r),
        .D(S_AXI_WDATA[13]),
        .Q(cfg_base_a_o[13]),
        .R(p_0_in));
  FDRE \r_base_a_r_reg[14] 
       (.C(S_AXI_ACLK),
        .CE(r_base_a_r),
        .D(S_AXI_WDATA[14]),
        .Q(cfg_base_a_o[14]),
        .R(p_0_in));
  FDRE \r_base_a_r_reg[15] 
       (.C(S_AXI_ACLK),
        .CE(r_base_a_r),
        .D(S_AXI_WDATA[15]),
        .Q(cfg_base_a_o[15]),
        .R(p_0_in));
  FDRE \r_base_a_r_reg[16] 
       (.C(S_AXI_ACLK),
        .CE(r_base_a_r),
        .D(S_AXI_WDATA[16]),
        .Q(cfg_base_a_o[16]),
        .R(p_0_in));
  FDRE \r_base_a_r_reg[17] 
       (.C(S_AXI_ACLK),
        .CE(r_base_a_r),
        .D(S_AXI_WDATA[17]),
        .Q(cfg_base_a_o[17]),
        .R(p_0_in));
  FDRE \r_base_a_r_reg[18] 
       (.C(S_AXI_ACLK),
        .CE(r_base_a_r),
        .D(S_AXI_WDATA[18]),
        .Q(cfg_base_a_o[18]),
        .R(p_0_in));
  FDRE \r_base_a_r_reg[19] 
       (.C(S_AXI_ACLK),
        .CE(r_base_a_r),
        .D(S_AXI_WDATA[19]),
        .Q(cfg_base_a_o[19]),
        .R(p_0_in));
  FDRE \r_base_a_r_reg[1] 
       (.C(S_AXI_ACLK),
        .CE(r_base_a_r),
        .D(S_AXI_WDATA[1]),
        .Q(cfg_base_a_o[1]),
        .R(p_0_in));
  FDRE \r_base_a_r_reg[20] 
       (.C(S_AXI_ACLK),
        .CE(r_base_a_r),
        .D(S_AXI_WDATA[20]),
        .Q(cfg_base_a_o[20]),
        .R(p_0_in));
  FDRE \r_base_a_r_reg[21] 
       (.C(S_AXI_ACLK),
        .CE(r_base_a_r),
        .D(S_AXI_WDATA[21]),
        .Q(cfg_base_a_o[21]),
        .R(p_0_in));
  FDRE \r_base_a_r_reg[22] 
       (.C(S_AXI_ACLK),
        .CE(r_base_a_r),
        .D(S_AXI_WDATA[22]),
        .Q(cfg_base_a_o[22]),
        .R(p_0_in));
  FDRE \r_base_a_r_reg[23] 
       (.C(S_AXI_ACLK),
        .CE(r_base_a_r),
        .D(S_AXI_WDATA[23]),
        .Q(cfg_base_a_o[23]),
        .R(p_0_in));
  FDRE \r_base_a_r_reg[24] 
       (.C(S_AXI_ACLK),
        .CE(r_base_a_r),
        .D(S_AXI_WDATA[24]),
        .Q(cfg_base_a_o[24]),
        .R(p_0_in));
  FDRE \r_base_a_r_reg[25] 
       (.C(S_AXI_ACLK),
        .CE(r_base_a_r),
        .D(S_AXI_WDATA[25]),
        .Q(cfg_base_a_o[25]),
        .R(p_0_in));
  FDRE \r_base_a_r_reg[26] 
       (.C(S_AXI_ACLK),
        .CE(r_base_a_r),
        .D(S_AXI_WDATA[26]),
        .Q(cfg_base_a_o[26]),
        .R(p_0_in));
  FDRE \r_base_a_r_reg[27] 
       (.C(S_AXI_ACLK),
        .CE(r_base_a_r),
        .D(S_AXI_WDATA[27]),
        .Q(cfg_base_a_o[27]),
        .R(p_0_in));
  FDRE \r_base_a_r_reg[28] 
       (.C(S_AXI_ACLK),
        .CE(r_base_a_r),
        .D(S_AXI_WDATA[28]),
        .Q(cfg_base_a_o[28]),
        .R(p_0_in));
  FDRE \r_base_a_r_reg[29] 
       (.C(S_AXI_ACLK),
        .CE(r_base_a_r),
        .D(S_AXI_WDATA[29]),
        .Q(cfg_base_a_o[29]),
        .R(p_0_in));
  FDRE \r_base_a_r_reg[2] 
       (.C(S_AXI_ACLK),
        .CE(r_base_a_r),
        .D(S_AXI_WDATA[2]),
        .Q(cfg_base_a_o[2]),
        .R(p_0_in));
  FDRE \r_base_a_r_reg[30] 
       (.C(S_AXI_ACLK),
        .CE(r_base_a_r),
        .D(S_AXI_WDATA[30]),
        .Q(cfg_base_a_o[30]),
        .R(p_0_in));
  FDRE \r_base_a_r_reg[31] 
       (.C(S_AXI_ACLK),
        .CE(r_base_a_r),
        .D(S_AXI_WDATA[31]),
        .Q(cfg_base_a_o[31]),
        .R(p_0_in));
  FDRE \r_base_a_r_reg[3] 
       (.C(S_AXI_ACLK),
        .CE(r_base_a_r),
        .D(S_AXI_WDATA[3]),
        .Q(cfg_base_a_o[3]),
        .R(p_0_in));
  FDRE \r_base_a_r_reg[4] 
       (.C(S_AXI_ACLK),
        .CE(r_base_a_r),
        .D(S_AXI_WDATA[4]),
        .Q(cfg_base_a_o[4]),
        .R(p_0_in));
  FDRE \r_base_a_r_reg[5] 
       (.C(S_AXI_ACLK),
        .CE(r_base_a_r),
        .D(S_AXI_WDATA[5]),
        .Q(cfg_base_a_o[5]),
        .R(p_0_in));
  FDRE \r_base_a_r_reg[6] 
       (.C(S_AXI_ACLK),
        .CE(r_base_a_r),
        .D(S_AXI_WDATA[6]),
        .Q(cfg_base_a_o[6]),
        .R(p_0_in));
  FDRE \r_base_a_r_reg[7] 
       (.C(S_AXI_ACLK),
        .CE(r_base_a_r),
        .D(S_AXI_WDATA[7]),
        .Q(cfg_base_a_o[7]),
        .R(p_0_in));
  FDRE \r_base_a_r_reg[8] 
       (.C(S_AXI_ACLK),
        .CE(r_base_a_r),
        .D(S_AXI_WDATA[8]),
        .Q(cfg_base_a_o[8]),
        .R(p_0_in));
  FDRE \r_base_a_r_reg[9] 
       (.C(S_AXI_ACLK),
        .CE(r_base_a_r),
        .D(S_AXI_WDATA[9]),
        .Q(cfg_base_a_o[9]),
        .R(p_0_in));
  LUT4 #(
    .INIT(16'h4000)) 
    \r_base_b_r[31]_i_1 
       (.I0(p_1_in[0]),
        .I1(p_1_in[1]),
        .I2(p_1_in[2]),
        .I3(\r_m_total_r[15]_i_2_n_0 ),
        .O(r_base_b_r));
  FDRE \r_base_b_r_reg[0] 
       (.C(S_AXI_ACLK),
        .CE(r_base_b_r),
        .D(S_AXI_WDATA[0]),
        .Q(cfg_base_b_o[0]),
        .R(p_0_in));
  FDRE \r_base_b_r_reg[10] 
       (.C(S_AXI_ACLK),
        .CE(r_base_b_r),
        .D(S_AXI_WDATA[10]),
        .Q(cfg_base_b_o[10]),
        .R(p_0_in));
  FDRE \r_base_b_r_reg[11] 
       (.C(S_AXI_ACLK),
        .CE(r_base_b_r),
        .D(S_AXI_WDATA[11]),
        .Q(cfg_base_b_o[11]),
        .R(p_0_in));
  FDRE \r_base_b_r_reg[12] 
       (.C(S_AXI_ACLK),
        .CE(r_base_b_r),
        .D(S_AXI_WDATA[12]),
        .Q(cfg_base_b_o[12]),
        .R(p_0_in));
  FDRE \r_base_b_r_reg[13] 
       (.C(S_AXI_ACLK),
        .CE(r_base_b_r),
        .D(S_AXI_WDATA[13]),
        .Q(cfg_base_b_o[13]),
        .R(p_0_in));
  FDRE \r_base_b_r_reg[14] 
       (.C(S_AXI_ACLK),
        .CE(r_base_b_r),
        .D(S_AXI_WDATA[14]),
        .Q(cfg_base_b_o[14]),
        .R(p_0_in));
  FDRE \r_base_b_r_reg[15] 
       (.C(S_AXI_ACLK),
        .CE(r_base_b_r),
        .D(S_AXI_WDATA[15]),
        .Q(cfg_base_b_o[15]),
        .R(p_0_in));
  FDRE \r_base_b_r_reg[16] 
       (.C(S_AXI_ACLK),
        .CE(r_base_b_r),
        .D(S_AXI_WDATA[16]),
        .Q(cfg_base_b_o[16]),
        .R(p_0_in));
  FDRE \r_base_b_r_reg[17] 
       (.C(S_AXI_ACLK),
        .CE(r_base_b_r),
        .D(S_AXI_WDATA[17]),
        .Q(cfg_base_b_o[17]),
        .R(p_0_in));
  FDRE \r_base_b_r_reg[18] 
       (.C(S_AXI_ACLK),
        .CE(r_base_b_r),
        .D(S_AXI_WDATA[18]),
        .Q(cfg_base_b_o[18]),
        .R(p_0_in));
  FDRE \r_base_b_r_reg[19] 
       (.C(S_AXI_ACLK),
        .CE(r_base_b_r),
        .D(S_AXI_WDATA[19]),
        .Q(cfg_base_b_o[19]),
        .R(p_0_in));
  FDRE \r_base_b_r_reg[1] 
       (.C(S_AXI_ACLK),
        .CE(r_base_b_r),
        .D(S_AXI_WDATA[1]),
        .Q(cfg_base_b_o[1]),
        .R(p_0_in));
  FDRE \r_base_b_r_reg[20] 
       (.C(S_AXI_ACLK),
        .CE(r_base_b_r),
        .D(S_AXI_WDATA[20]),
        .Q(cfg_base_b_o[20]),
        .R(p_0_in));
  FDRE \r_base_b_r_reg[21] 
       (.C(S_AXI_ACLK),
        .CE(r_base_b_r),
        .D(S_AXI_WDATA[21]),
        .Q(cfg_base_b_o[21]),
        .R(p_0_in));
  FDRE \r_base_b_r_reg[22] 
       (.C(S_AXI_ACLK),
        .CE(r_base_b_r),
        .D(S_AXI_WDATA[22]),
        .Q(cfg_base_b_o[22]),
        .R(p_0_in));
  FDRE \r_base_b_r_reg[23] 
       (.C(S_AXI_ACLK),
        .CE(r_base_b_r),
        .D(S_AXI_WDATA[23]),
        .Q(cfg_base_b_o[23]),
        .R(p_0_in));
  FDRE \r_base_b_r_reg[24] 
       (.C(S_AXI_ACLK),
        .CE(r_base_b_r),
        .D(S_AXI_WDATA[24]),
        .Q(cfg_base_b_o[24]),
        .R(p_0_in));
  FDRE \r_base_b_r_reg[25] 
       (.C(S_AXI_ACLK),
        .CE(r_base_b_r),
        .D(S_AXI_WDATA[25]),
        .Q(cfg_base_b_o[25]),
        .R(p_0_in));
  FDRE \r_base_b_r_reg[26] 
       (.C(S_AXI_ACLK),
        .CE(r_base_b_r),
        .D(S_AXI_WDATA[26]),
        .Q(cfg_base_b_o[26]),
        .R(p_0_in));
  FDRE \r_base_b_r_reg[27] 
       (.C(S_AXI_ACLK),
        .CE(r_base_b_r),
        .D(S_AXI_WDATA[27]),
        .Q(cfg_base_b_o[27]),
        .R(p_0_in));
  FDRE \r_base_b_r_reg[28] 
       (.C(S_AXI_ACLK),
        .CE(r_base_b_r),
        .D(S_AXI_WDATA[28]),
        .Q(cfg_base_b_o[28]),
        .R(p_0_in));
  FDRE \r_base_b_r_reg[29] 
       (.C(S_AXI_ACLK),
        .CE(r_base_b_r),
        .D(S_AXI_WDATA[29]),
        .Q(cfg_base_b_o[29]),
        .R(p_0_in));
  FDRE \r_base_b_r_reg[2] 
       (.C(S_AXI_ACLK),
        .CE(r_base_b_r),
        .D(S_AXI_WDATA[2]),
        .Q(cfg_base_b_o[2]),
        .R(p_0_in));
  FDRE \r_base_b_r_reg[30] 
       (.C(S_AXI_ACLK),
        .CE(r_base_b_r),
        .D(S_AXI_WDATA[30]),
        .Q(cfg_base_b_o[30]),
        .R(p_0_in));
  FDRE \r_base_b_r_reg[31] 
       (.C(S_AXI_ACLK),
        .CE(r_base_b_r),
        .D(S_AXI_WDATA[31]),
        .Q(cfg_base_b_o[31]),
        .R(p_0_in));
  FDRE \r_base_b_r_reg[3] 
       (.C(S_AXI_ACLK),
        .CE(r_base_b_r),
        .D(S_AXI_WDATA[3]),
        .Q(cfg_base_b_o[3]),
        .R(p_0_in));
  FDRE \r_base_b_r_reg[4] 
       (.C(S_AXI_ACLK),
        .CE(r_base_b_r),
        .D(S_AXI_WDATA[4]),
        .Q(cfg_base_b_o[4]),
        .R(p_0_in));
  FDRE \r_base_b_r_reg[5] 
       (.C(S_AXI_ACLK),
        .CE(r_base_b_r),
        .D(S_AXI_WDATA[5]),
        .Q(cfg_base_b_o[5]),
        .R(p_0_in));
  FDRE \r_base_b_r_reg[6] 
       (.C(S_AXI_ACLK),
        .CE(r_base_b_r),
        .D(S_AXI_WDATA[6]),
        .Q(cfg_base_b_o[6]),
        .R(p_0_in));
  FDRE \r_base_b_r_reg[7] 
       (.C(S_AXI_ACLK),
        .CE(r_base_b_r),
        .D(S_AXI_WDATA[7]),
        .Q(cfg_base_b_o[7]),
        .R(p_0_in));
  FDRE \r_base_b_r_reg[8] 
       (.C(S_AXI_ACLK),
        .CE(r_base_b_r),
        .D(S_AXI_WDATA[8]),
        .Q(cfg_base_b_o[8]),
        .R(p_0_in));
  FDRE \r_base_b_r_reg[9] 
       (.C(S_AXI_ACLK),
        .CE(r_base_b_r),
        .D(S_AXI_WDATA[9]),
        .Q(cfg_base_b_o[9]),
        .R(p_0_in));
  LUT4 #(
    .INIT(16'h8000)) 
    \r_base_c_r[31]_i_1 
       (.I0(p_1_in[2]),
        .I1(\r_m_total_r[15]_i_2_n_0 ),
        .I2(p_1_in[0]),
        .I3(p_1_in[1]),
        .O(r_base_c_r));
  FDRE \r_base_c_r_reg[0] 
       (.C(S_AXI_ACLK),
        .CE(r_base_c_r),
        .D(S_AXI_WDATA[0]),
        .Q(cfg_base_c_o[0]),
        .R(p_0_in));
  FDRE \r_base_c_r_reg[10] 
       (.C(S_AXI_ACLK),
        .CE(r_base_c_r),
        .D(S_AXI_WDATA[10]),
        .Q(cfg_base_c_o[10]),
        .R(p_0_in));
  FDRE \r_base_c_r_reg[11] 
       (.C(S_AXI_ACLK),
        .CE(r_base_c_r),
        .D(S_AXI_WDATA[11]),
        .Q(cfg_base_c_o[11]),
        .R(p_0_in));
  FDRE \r_base_c_r_reg[12] 
       (.C(S_AXI_ACLK),
        .CE(r_base_c_r),
        .D(S_AXI_WDATA[12]),
        .Q(cfg_base_c_o[12]),
        .R(p_0_in));
  FDRE \r_base_c_r_reg[13] 
       (.C(S_AXI_ACLK),
        .CE(r_base_c_r),
        .D(S_AXI_WDATA[13]),
        .Q(cfg_base_c_o[13]),
        .R(p_0_in));
  FDRE \r_base_c_r_reg[14] 
       (.C(S_AXI_ACLK),
        .CE(r_base_c_r),
        .D(S_AXI_WDATA[14]),
        .Q(cfg_base_c_o[14]),
        .R(p_0_in));
  FDRE \r_base_c_r_reg[15] 
       (.C(S_AXI_ACLK),
        .CE(r_base_c_r),
        .D(S_AXI_WDATA[15]),
        .Q(cfg_base_c_o[15]),
        .R(p_0_in));
  FDRE \r_base_c_r_reg[16] 
       (.C(S_AXI_ACLK),
        .CE(r_base_c_r),
        .D(S_AXI_WDATA[16]),
        .Q(cfg_base_c_o[16]),
        .R(p_0_in));
  FDRE \r_base_c_r_reg[17] 
       (.C(S_AXI_ACLK),
        .CE(r_base_c_r),
        .D(S_AXI_WDATA[17]),
        .Q(cfg_base_c_o[17]),
        .R(p_0_in));
  FDRE \r_base_c_r_reg[18] 
       (.C(S_AXI_ACLK),
        .CE(r_base_c_r),
        .D(S_AXI_WDATA[18]),
        .Q(cfg_base_c_o[18]),
        .R(p_0_in));
  FDRE \r_base_c_r_reg[19] 
       (.C(S_AXI_ACLK),
        .CE(r_base_c_r),
        .D(S_AXI_WDATA[19]),
        .Q(cfg_base_c_o[19]),
        .R(p_0_in));
  FDRE \r_base_c_r_reg[1] 
       (.C(S_AXI_ACLK),
        .CE(r_base_c_r),
        .D(S_AXI_WDATA[1]),
        .Q(cfg_base_c_o[1]),
        .R(p_0_in));
  FDRE \r_base_c_r_reg[20] 
       (.C(S_AXI_ACLK),
        .CE(r_base_c_r),
        .D(S_AXI_WDATA[20]),
        .Q(cfg_base_c_o[20]),
        .R(p_0_in));
  FDRE \r_base_c_r_reg[21] 
       (.C(S_AXI_ACLK),
        .CE(r_base_c_r),
        .D(S_AXI_WDATA[21]),
        .Q(cfg_base_c_o[21]),
        .R(p_0_in));
  FDRE \r_base_c_r_reg[22] 
       (.C(S_AXI_ACLK),
        .CE(r_base_c_r),
        .D(S_AXI_WDATA[22]),
        .Q(cfg_base_c_o[22]),
        .R(p_0_in));
  FDRE \r_base_c_r_reg[23] 
       (.C(S_AXI_ACLK),
        .CE(r_base_c_r),
        .D(S_AXI_WDATA[23]),
        .Q(cfg_base_c_o[23]),
        .R(p_0_in));
  FDRE \r_base_c_r_reg[24] 
       (.C(S_AXI_ACLK),
        .CE(r_base_c_r),
        .D(S_AXI_WDATA[24]),
        .Q(cfg_base_c_o[24]),
        .R(p_0_in));
  FDRE \r_base_c_r_reg[25] 
       (.C(S_AXI_ACLK),
        .CE(r_base_c_r),
        .D(S_AXI_WDATA[25]),
        .Q(cfg_base_c_o[25]),
        .R(p_0_in));
  FDRE \r_base_c_r_reg[26] 
       (.C(S_AXI_ACLK),
        .CE(r_base_c_r),
        .D(S_AXI_WDATA[26]),
        .Q(cfg_base_c_o[26]),
        .R(p_0_in));
  FDRE \r_base_c_r_reg[27] 
       (.C(S_AXI_ACLK),
        .CE(r_base_c_r),
        .D(S_AXI_WDATA[27]),
        .Q(cfg_base_c_o[27]),
        .R(p_0_in));
  FDRE \r_base_c_r_reg[28] 
       (.C(S_AXI_ACLK),
        .CE(r_base_c_r),
        .D(S_AXI_WDATA[28]),
        .Q(cfg_base_c_o[28]),
        .R(p_0_in));
  FDRE \r_base_c_r_reg[29] 
       (.C(S_AXI_ACLK),
        .CE(r_base_c_r),
        .D(S_AXI_WDATA[29]),
        .Q(cfg_base_c_o[29]),
        .R(p_0_in));
  FDRE \r_base_c_r_reg[2] 
       (.C(S_AXI_ACLK),
        .CE(r_base_c_r),
        .D(S_AXI_WDATA[2]),
        .Q(cfg_base_c_o[2]),
        .R(p_0_in));
  FDRE \r_base_c_r_reg[30] 
       (.C(S_AXI_ACLK),
        .CE(r_base_c_r),
        .D(S_AXI_WDATA[30]),
        .Q(cfg_base_c_o[30]),
        .R(p_0_in));
  FDRE \r_base_c_r_reg[31] 
       (.C(S_AXI_ACLK),
        .CE(r_base_c_r),
        .D(S_AXI_WDATA[31]),
        .Q(cfg_base_c_o[31]),
        .R(p_0_in));
  FDRE \r_base_c_r_reg[3] 
       (.C(S_AXI_ACLK),
        .CE(r_base_c_r),
        .D(S_AXI_WDATA[3]),
        .Q(cfg_base_c_o[3]),
        .R(p_0_in));
  FDRE \r_base_c_r_reg[4] 
       (.C(S_AXI_ACLK),
        .CE(r_base_c_r),
        .D(S_AXI_WDATA[4]),
        .Q(cfg_base_c_o[4]),
        .R(p_0_in));
  FDRE \r_base_c_r_reg[5] 
       (.C(S_AXI_ACLK),
        .CE(r_base_c_r),
        .D(S_AXI_WDATA[5]),
        .Q(cfg_base_c_o[5]),
        .R(p_0_in));
  FDRE \r_base_c_r_reg[6] 
       (.C(S_AXI_ACLK),
        .CE(r_base_c_r),
        .D(S_AXI_WDATA[6]),
        .Q(cfg_base_c_o[6]),
        .R(p_0_in));
  FDRE \r_base_c_r_reg[7] 
       (.C(S_AXI_ACLK),
        .CE(r_base_c_r),
        .D(S_AXI_WDATA[7]),
        .Q(cfg_base_c_o[7]),
        .R(p_0_in));
  FDRE \r_base_c_r_reg[8] 
       (.C(S_AXI_ACLK),
        .CE(r_base_c_r),
        .D(S_AXI_WDATA[8]),
        .Q(cfg_base_c_o[8]),
        .R(p_0_in));
  FDRE \r_base_c_r_reg[9] 
       (.C(S_AXI_ACLK),
        .CE(r_base_c_r),
        .D(S_AXI_WDATA[9]),
        .Q(cfg_base_c_o[9]),
        .R(p_0_in));
  LUT5 #(
    .INIT(32'h08000000)) 
    \r_k_dim_r[15]_i_1 
       (.I0(p_1_in[1]),
        .I1(p_1_in[0]),
        .I2(p_1_in[2]),
        .I3(S_AXI_WSTRB),
        .I4(\r_m_total_r[15]_i_2_n_0 ),
        .O(r_k_dim_r));
  FDRE \r_k_dim_r_reg[0] 
       (.C(S_AXI_ACLK),
        .CE(r_k_dim_r),
        .D(S_AXI_WDATA[0]),
        .Q(cfg_k_dim_o[0]),
        .R(p_0_in));
  FDRE \r_k_dim_r_reg[10] 
       (.C(S_AXI_ACLK),
        .CE(r_k_dim_r),
        .D(S_AXI_WDATA[10]),
        .Q(cfg_k_dim_o[10]),
        .R(p_0_in));
  FDRE \r_k_dim_r_reg[11] 
       (.C(S_AXI_ACLK),
        .CE(r_k_dim_r),
        .D(S_AXI_WDATA[11]),
        .Q(cfg_k_dim_o[11]),
        .R(p_0_in));
  FDRE \r_k_dim_r_reg[12] 
       (.C(S_AXI_ACLK),
        .CE(r_k_dim_r),
        .D(S_AXI_WDATA[12]),
        .Q(cfg_k_dim_o[12]),
        .R(p_0_in));
  FDRE \r_k_dim_r_reg[13] 
       (.C(S_AXI_ACLK),
        .CE(r_k_dim_r),
        .D(S_AXI_WDATA[13]),
        .Q(cfg_k_dim_o[13]),
        .R(p_0_in));
  FDRE \r_k_dim_r_reg[14] 
       (.C(S_AXI_ACLK),
        .CE(r_k_dim_r),
        .D(S_AXI_WDATA[14]),
        .Q(cfg_k_dim_o[14]),
        .R(p_0_in));
  FDRE \r_k_dim_r_reg[15] 
       (.C(S_AXI_ACLK),
        .CE(r_k_dim_r),
        .D(S_AXI_WDATA[15]),
        .Q(cfg_k_dim_o[15]),
        .R(p_0_in));
  FDRE \r_k_dim_r_reg[1] 
       (.C(S_AXI_ACLK),
        .CE(r_k_dim_r),
        .D(S_AXI_WDATA[1]),
        .Q(cfg_k_dim_o[1]),
        .R(p_0_in));
  FDRE \r_k_dim_r_reg[2] 
       (.C(S_AXI_ACLK),
        .CE(r_k_dim_r),
        .D(S_AXI_WDATA[2]),
        .Q(cfg_k_dim_o[2]),
        .R(p_0_in));
  FDRE \r_k_dim_r_reg[3] 
       (.C(S_AXI_ACLK),
        .CE(r_k_dim_r),
        .D(S_AXI_WDATA[3]),
        .Q(cfg_k_dim_o[3]),
        .R(p_0_in));
  FDRE \r_k_dim_r_reg[4] 
       (.C(S_AXI_ACLK),
        .CE(r_k_dim_r),
        .D(S_AXI_WDATA[4]),
        .Q(cfg_k_dim_o[4]),
        .R(p_0_in));
  FDRE \r_k_dim_r_reg[5] 
       (.C(S_AXI_ACLK),
        .CE(r_k_dim_r),
        .D(S_AXI_WDATA[5]),
        .Q(cfg_k_dim_o[5]),
        .R(p_0_in));
  FDRE \r_k_dim_r_reg[6] 
       (.C(S_AXI_ACLK),
        .CE(r_k_dim_r),
        .D(S_AXI_WDATA[6]),
        .Q(cfg_k_dim_o[6]),
        .R(p_0_in));
  FDRE \r_k_dim_r_reg[7] 
       (.C(S_AXI_ACLK),
        .CE(r_k_dim_r),
        .D(S_AXI_WDATA[7]),
        .Q(cfg_k_dim_o[7]),
        .R(p_0_in));
  FDRE \r_k_dim_r_reg[8] 
       (.C(S_AXI_ACLK),
        .CE(r_k_dim_r),
        .D(S_AXI_WDATA[8]),
        .Q(cfg_k_dim_o[8]),
        .R(p_0_in));
  FDRE \r_k_dim_r_reg[9] 
       (.C(S_AXI_ACLK),
        .CE(r_k_dim_r),
        .D(S_AXI_WDATA[9]),
        .Q(cfg_k_dim_o[9]),
        .R(p_0_in));
  LUT5 #(
    .INIT(32'h00400000)) 
    \r_k_total_r[15]_i_1 
       (.I0(p_1_in[2]),
        .I1(S_AXI_WSTRB),
        .I2(p_1_in[1]),
        .I3(p_1_in[0]),
        .I4(\r_m_total_r[15]_i_2_n_0 ),
        .O(r_k_total_r));
  FDRE \r_k_total_r_reg[0] 
       (.C(S_AXI_ACLK),
        .CE(r_k_total_r),
        .D(S_AXI_WDATA[0]),
        .Q(cfg_k_total_o[0]),
        .R(p_0_in));
  FDRE \r_k_total_r_reg[10] 
       (.C(S_AXI_ACLK),
        .CE(r_k_total_r),
        .D(S_AXI_WDATA[10]),
        .Q(cfg_k_total_o[10]),
        .R(p_0_in));
  FDRE \r_k_total_r_reg[11] 
       (.C(S_AXI_ACLK),
        .CE(r_k_total_r),
        .D(S_AXI_WDATA[11]),
        .Q(cfg_k_total_o[11]),
        .R(p_0_in));
  FDRE \r_k_total_r_reg[12] 
       (.C(S_AXI_ACLK),
        .CE(r_k_total_r),
        .D(S_AXI_WDATA[12]),
        .Q(cfg_k_total_o[12]),
        .R(p_0_in));
  FDRE \r_k_total_r_reg[13] 
       (.C(S_AXI_ACLK),
        .CE(r_k_total_r),
        .D(S_AXI_WDATA[13]),
        .Q(cfg_k_total_o[13]),
        .R(p_0_in));
  FDRE \r_k_total_r_reg[14] 
       (.C(S_AXI_ACLK),
        .CE(r_k_total_r),
        .D(S_AXI_WDATA[14]),
        .Q(cfg_k_total_o[14]),
        .R(p_0_in));
  FDRE \r_k_total_r_reg[15] 
       (.C(S_AXI_ACLK),
        .CE(r_k_total_r),
        .D(S_AXI_WDATA[15]),
        .Q(cfg_k_total_o[15]),
        .R(p_0_in));
  FDRE \r_k_total_r_reg[1] 
       (.C(S_AXI_ACLK),
        .CE(r_k_total_r),
        .D(S_AXI_WDATA[1]),
        .Q(cfg_k_total_o[1]),
        .R(p_0_in));
  FDRE \r_k_total_r_reg[2] 
       (.C(S_AXI_ACLK),
        .CE(r_k_total_r),
        .D(S_AXI_WDATA[2]),
        .Q(cfg_k_total_o[2]),
        .R(p_0_in));
  FDRE \r_k_total_r_reg[3] 
       (.C(S_AXI_ACLK),
        .CE(r_k_total_r),
        .D(S_AXI_WDATA[3]),
        .Q(cfg_k_total_o[3]),
        .R(p_0_in));
  FDRE \r_k_total_r_reg[4] 
       (.C(S_AXI_ACLK),
        .CE(r_k_total_r),
        .D(S_AXI_WDATA[4]),
        .Q(cfg_k_total_o[4]),
        .R(p_0_in));
  FDRE \r_k_total_r_reg[5] 
       (.C(S_AXI_ACLK),
        .CE(r_k_total_r),
        .D(S_AXI_WDATA[5]),
        .Q(cfg_k_total_o[5]),
        .R(p_0_in));
  FDRE \r_k_total_r_reg[6] 
       (.C(S_AXI_ACLK),
        .CE(r_k_total_r),
        .D(S_AXI_WDATA[6]),
        .Q(cfg_k_total_o[6]),
        .R(p_0_in));
  FDRE \r_k_total_r_reg[7] 
       (.C(S_AXI_ACLK),
        .CE(r_k_total_r),
        .D(S_AXI_WDATA[7]),
        .Q(cfg_k_total_o[7]),
        .R(p_0_in));
  FDRE \r_k_total_r_reg[8] 
       (.C(S_AXI_ACLK),
        .CE(r_k_total_r),
        .D(S_AXI_WDATA[8]),
        .Q(cfg_k_total_o[8]),
        .R(p_0_in));
  FDRE \r_k_total_r_reg[9] 
       (.C(S_AXI_ACLK),
        .CE(r_k_total_r),
        .D(S_AXI_WDATA[9]),
        .Q(cfg_k_total_o[9]),
        .R(p_0_in));
  LUT5 #(
    .INIT(32'h00040000)) 
    \r_m_total_r[15]_i_1 
       (.I0(p_1_in[2]),
        .I1(S_AXI_WSTRB),
        .I2(p_1_in[0]),
        .I3(p_1_in[1]),
        .I4(\r_m_total_r[15]_i_2_n_0 ),
        .O(r_m_total_r));
  LUT6 #(
    .INIT(64'h0000000010000000)) 
    \r_m_total_r[15]_i_2 
       (.I0(p_1_in[5]),
        .I1(p_1_in[4]),
        .I2(S_AXI_WREADY),
        .I3(S_AXI_AWVALID),
        .I4(S_AXI_WVALID),
        .I5(p_1_in[3]),
        .O(\r_m_total_r[15]_i_2_n_0 ));
  FDRE \r_m_total_r_reg[0] 
       (.C(S_AXI_ACLK),
        .CE(r_m_total_r),
        .D(S_AXI_WDATA[0]),
        .Q(cfg_m_total_o[0]),
        .R(p_0_in));
  FDRE \r_m_total_r_reg[10] 
       (.C(S_AXI_ACLK),
        .CE(r_m_total_r),
        .D(S_AXI_WDATA[10]),
        .Q(cfg_m_total_o[10]),
        .R(p_0_in));
  FDRE \r_m_total_r_reg[11] 
       (.C(S_AXI_ACLK),
        .CE(r_m_total_r),
        .D(S_AXI_WDATA[11]),
        .Q(cfg_m_total_o[11]),
        .R(p_0_in));
  FDRE \r_m_total_r_reg[12] 
       (.C(S_AXI_ACLK),
        .CE(r_m_total_r),
        .D(S_AXI_WDATA[12]),
        .Q(cfg_m_total_o[12]),
        .R(p_0_in));
  FDRE \r_m_total_r_reg[13] 
       (.C(S_AXI_ACLK),
        .CE(r_m_total_r),
        .D(S_AXI_WDATA[13]),
        .Q(cfg_m_total_o[13]),
        .R(p_0_in));
  FDRE \r_m_total_r_reg[14] 
       (.C(S_AXI_ACLK),
        .CE(r_m_total_r),
        .D(S_AXI_WDATA[14]),
        .Q(cfg_m_total_o[14]),
        .R(p_0_in));
  FDRE \r_m_total_r_reg[15] 
       (.C(S_AXI_ACLK),
        .CE(r_m_total_r),
        .D(S_AXI_WDATA[15]),
        .Q(cfg_m_total_o[15]),
        .R(p_0_in));
  FDRE \r_m_total_r_reg[1] 
       (.C(S_AXI_ACLK),
        .CE(r_m_total_r),
        .D(S_AXI_WDATA[1]),
        .Q(cfg_m_total_o[1]),
        .R(p_0_in));
  FDRE \r_m_total_r_reg[2] 
       (.C(S_AXI_ACLK),
        .CE(r_m_total_r),
        .D(S_AXI_WDATA[2]),
        .Q(cfg_m_total_o[2]),
        .R(p_0_in));
  FDRE \r_m_total_r_reg[3] 
       (.C(S_AXI_ACLK),
        .CE(r_m_total_r),
        .D(S_AXI_WDATA[3]),
        .Q(cfg_m_total_o[3]),
        .R(p_0_in));
  FDRE \r_m_total_r_reg[4] 
       (.C(S_AXI_ACLK),
        .CE(r_m_total_r),
        .D(S_AXI_WDATA[4]),
        .Q(cfg_m_total_o[4]),
        .R(p_0_in));
  FDRE \r_m_total_r_reg[5] 
       (.C(S_AXI_ACLK),
        .CE(r_m_total_r),
        .D(S_AXI_WDATA[5]),
        .Q(cfg_m_total_o[5]),
        .R(p_0_in));
  FDRE \r_m_total_r_reg[6] 
       (.C(S_AXI_ACLK),
        .CE(r_m_total_r),
        .D(S_AXI_WDATA[6]),
        .Q(cfg_m_total_o[6]),
        .R(p_0_in));
  FDRE \r_m_total_r_reg[7] 
       (.C(S_AXI_ACLK),
        .CE(r_m_total_r),
        .D(S_AXI_WDATA[7]),
        .Q(cfg_m_total_o[7]),
        .R(p_0_in));
  FDRE \r_m_total_r_reg[8] 
       (.C(S_AXI_ACLK),
        .CE(r_m_total_r),
        .D(S_AXI_WDATA[8]),
        .Q(cfg_m_total_o[8]),
        .R(p_0_in));
  FDRE \r_m_total_r_reg[9] 
       (.C(S_AXI_ACLK),
        .CE(r_m_total_r),
        .D(S_AXI_WDATA[9]),
        .Q(cfg_m_total_o[9]),
        .R(p_0_in));
  LUT6 #(
    .INIT(64'h0000000010000000)) 
    \r_n_stride_r[15]_i_1 
       (.I0(p_1_in[1]),
        .I1(p_1_in[0]),
        .I2(\r_n_stride_r[15]_i_2_n_0 ),
        .I3(p_1_in[3]),
        .I4(S_AXI_WSTRB),
        .I5(p_1_in[2]),
        .O(r_n_stride_r));
  LUT5 #(
    .INIT(32'h00000080)) 
    \r_n_stride_r[15]_i_2 
       (.I0(S_AXI_WVALID),
        .I1(S_AXI_AWVALID),
        .I2(S_AXI_WREADY),
        .I3(p_1_in[4]),
        .I4(p_1_in[5]),
        .O(\r_n_stride_r[15]_i_2_n_0 ));
  FDRE \r_n_stride_r_reg[0] 
       (.C(S_AXI_ACLK),
        .CE(r_n_stride_r),
        .D(S_AXI_WDATA[0]),
        .Q(cfg_n_stride_o[0]),
        .R(p_0_in));
  FDRE \r_n_stride_r_reg[10] 
       (.C(S_AXI_ACLK),
        .CE(r_n_stride_r),
        .D(S_AXI_WDATA[10]),
        .Q(cfg_n_stride_o[10]),
        .R(p_0_in));
  FDRE \r_n_stride_r_reg[11] 
       (.C(S_AXI_ACLK),
        .CE(r_n_stride_r),
        .D(S_AXI_WDATA[11]),
        .Q(cfg_n_stride_o[11]),
        .R(p_0_in));
  FDRE \r_n_stride_r_reg[12] 
       (.C(S_AXI_ACLK),
        .CE(r_n_stride_r),
        .D(S_AXI_WDATA[12]),
        .Q(cfg_n_stride_o[12]),
        .R(p_0_in));
  FDRE \r_n_stride_r_reg[13] 
       (.C(S_AXI_ACLK),
        .CE(r_n_stride_r),
        .D(S_AXI_WDATA[13]),
        .Q(cfg_n_stride_o[13]),
        .R(p_0_in));
  FDRE \r_n_stride_r_reg[14] 
       (.C(S_AXI_ACLK),
        .CE(r_n_stride_r),
        .D(S_AXI_WDATA[14]),
        .Q(cfg_n_stride_o[14]),
        .R(p_0_in));
  FDRE \r_n_stride_r_reg[15] 
       (.C(S_AXI_ACLK),
        .CE(r_n_stride_r),
        .D(S_AXI_WDATA[15]),
        .Q(cfg_n_stride_o[15]),
        .R(p_0_in));
  FDRE \r_n_stride_r_reg[1] 
       (.C(S_AXI_ACLK),
        .CE(r_n_stride_r),
        .D(S_AXI_WDATA[1]),
        .Q(cfg_n_stride_o[1]),
        .R(p_0_in));
  FDRE \r_n_stride_r_reg[2] 
       (.C(S_AXI_ACLK),
        .CE(r_n_stride_r),
        .D(S_AXI_WDATA[2]),
        .Q(cfg_n_stride_o[2]),
        .R(p_0_in));
  FDRE \r_n_stride_r_reg[3] 
       (.C(S_AXI_ACLK),
        .CE(r_n_stride_r),
        .D(S_AXI_WDATA[3]),
        .Q(cfg_n_stride_o[3]),
        .R(p_0_in));
  FDRE \r_n_stride_r_reg[4] 
       (.C(S_AXI_ACLK),
        .CE(r_n_stride_r),
        .D(S_AXI_WDATA[4]),
        .Q(cfg_n_stride_o[4]),
        .R(p_0_in));
  FDRE \r_n_stride_r_reg[5] 
       (.C(S_AXI_ACLK),
        .CE(r_n_stride_r),
        .D(S_AXI_WDATA[5]),
        .Q(cfg_n_stride_o[5]),
        .R(p_0_in));
  FDRE \r_n_stride_r_reg[6] 
       (.C(S_AXI_ACLK),
        .CE(r_n_stride_r),
        .D(S_AXI_WDATA[6]),
        .Q(cfg_n_stride_o[6]),
        .R(p_0_in));
  FDRE \r_n_stride_r_reg[7] 
       (.C(S_AXI_ACLK),
        .CE(r_n_stride_r),
        .D(S_AXI_WDATA[7]),
        .Q(cfg_n_stride_o[7]),
        .R(p_0_in));
  FDRE \r_n_stride_r_reg[8] 
       (.C(S_AXI_ACLK),
        .CE(r_n_stride_r),
        .D(S_AXI_WDATA[8]),
        .Q(cfg_n_stride_o[8]),
        .R(p_0_in));
  FDRE \r_n_stride_r_reg[9] 
       (.C(S_AXI_ACLK),
        .CE(r_n_stride_r),
        .D(S_AXI_WDATA[9]),
        .Q(cfg_n_stride_o[9]),
        .R(p_0_in));
  LUT5 #(
    .INIT(32'h00400000)) 
    \r_n_total_r[15]_i_1 
       (.I0(p_1_in[2]),
        .I1(S_AXI_WSTRB),
        .I2(p_1_in[0]),
        .I3(p_1_in[1]),
        .I4(\r_m_total_r[15]_i_2_n_0 ),
        .O(r_n_total_r));
  FDRE \r_n_total_r_reg[0] 
       (.C(S_AXI_ACLK),
        .CE(r_n_total_r),
        .D(S_AXI_WDATA[0]),
        .Q(cfg_n_total_o[0]),
        .R(p_0_in));
  FDRE \r_n_total_r_reg[10] 
       (.C(S_AXI_ACLK),
        .CE(r_n_total_r),
        .D(S_AXI_WDATA[10]),
        .Q(cfg_n_total_o[10]),
        .R(p_0_in));
  FDRE \r_n_total_r_reg[11] 
       (.C(S_AXI_ACLK),
        .CE(r_n_total_r),
        .D(S_AXI_WDATA[11]),
        .Q(cfg_n_total_o[11]),
        .R(p_0_in));
  FDRE \r_n_total_r_reg[12] 
       (.C(S_AXI_ACLK),
        .CE(r_n_total_r),
        .D(S_AXI_WDATA[12]),
        .Q(cfg_n_total_o[12]),
        .R(p_0_in));
  FDRE \r_n_total_r_reg[13] 
       (.C(S_AXI_ACLK),
        .CE(r_n_total_r),
        .D(S_AXI_WDATA[13]),
        .Q(cfg_n_total_o[13]),
        .R(p_0_in));
  FDRE \r_n_total_r_reg[14] 
       (.C(S_AXI_ACLK),
        .CE(r_n_total_r),
        .D(S_AXI_WDATA[14]),
        .Q(cfg_n_total_o[14]),
        .R(p_0_in));
  FDRE \r_n_total_r_reg[15] 
       (.C(S_AXI_ACLK),
        .CE(r_n_total_r),
        .D(S_AXI_WDATA[15]),
        .Q(cfg_n_total_o[15]),
        .R(p_0_in));
  FDRE \r_n_total_r_reg[1] 
       (.C(S_AXI_ACLK),
        .CE(r_n_total_r),
        .D(S_AXI_WDATA[1]),
        .Q(cfg_n_total_o[1]),
        .R(p_0_in));
  FDRE \r_n_total_r_reg[2] 
       (.C(S_AXI_ACLK),
        .CE(r_n_total_r),
        .D(S_AXI_WDATA[2]),
        .Q(cfg_n_total_o[2]),
        .R(p_0_in));
  FDRE \r_n_total_r_reg[3] 
       (.C(S_AXI_ACLK),
        .CE(r_n_total_r),
        .D(S_AXI_WDATA[3]),
        .Q(cfg_n_total_o[3]),
        .R(p_0_in));
  FDRE \r_n_total_r_reg[4] 
       (.C(S_AXI_ACLK),
        .CE(r_n_total_r),
        .D(S_AXI_WDATA[4]),
        .Q(cfg_n_total_o[4]),
        .R(p_0_in));
  FDRE \r_n_total_r_reg[5] 
       (.C(S_AXI_ACLK),
        .CE(r_n_total_r),
        .D(S_AXI_WDATA[5]),
        .Q(cfg_n_total_o[5]),
        .R(p_0_in));
  FDRE \r_n_total_r_reg[6] 
       (.C(S_AXI_ACLK),
        .CE(r_n_total_r),
        .D(S_AXI_WDATA[6]),
        .Q(cfg_n_total_o[6]),
        .R(p_0_in));
  FDRE \r_n_total_r_reg[7] 
       (.C(S_AXI_ACLK),
        .CE(r_n_total_r),
        .D(S_AXI_WDATA[7]),
        .Q(cfg_n_total_o[7]),
        .R(p_0_in));
  FDRE \r_n_total_r_reg[8] 
       (.C(S_AXI_ACLK),
        .CE(r_n_total_r),
        .D(S_AXI_WDATA[8]),
        .Q(cfg_n_total_o[8]),
        .R(p_0_in));
  FDRE \r_n_total_r_reg[9] 
       (.C(S_AXI_ACLK),
        .CE(r_n_total_r),
        .D(S_AXI_WDATA[9]),
        .Q(cfg_n_total_o[9]),
        .R(p_0_in));
  LUT5 #(
    .INIT(32'h04000000)) 
    \r_numkt_r[15]_i_1 
       (.I0(p_1_in[0]),
        .I1(S_AXI_WSTRB),
        .I2(p_1_in[1]),
        .I3(p_1_in[2]),
        .I4(\r_m_total_r[15]_i_2_n_0 ),
        .O(r_numkt_r));
  FDRE \r_numkt_r_reg[0] 
       (.C(S_AXI_ACLK),
        .CE(r_numkt_r),
        .D(S_AXI_WDATA[0]),
        .Q(cfg_num_k_tiles_per_block_o[0]),
        .R(p_0_in));
  FDRE \r_numkt_r_reg[10] 
       (.C(S_AXI_ACLK),
        .CE(r_numkt_r),
        .D(S_AXI_WDATA[10]),
        .Q(cfg_num_k_tiles_per_block_o[10]),
        .R(p_0_in));
  FDRE \r_numkt_r_reg[11] 
       (.C(S_AXI_ACLK),
        .CE(r_numkt_r),
        .D(S_AXI_WDATA[11]),
        .Q(cfg_num_k_tiles_per_block_o[11]),
        .R(p_0_in));
  FDRE \r_numkt_r_reg[12] 
       (.C(S_AXI_ACLK),
        .CE(r_numkt_r),
        .D(S_AXI_WDATA[12]),
        .Q(cfg_num_k_tiles_per_block_o[12]),
        .R(p_0_in));
  FDRE \r_numkt_r_reg[13] 
       (.C(S_AXI_ACLK),
        .CE(r_numkt_r),
        .D(S_AXI_WDATA[13]),
        .Q(cfg_num_k_tiles_per_block_o[13]),
        .R(p_0_in));
  FDRE \r_numkt_r_reg[14] 
       (.C(S_AXI_ACLK),
        .CE(r_numkt_r),
        .D(S_AXI_WDATA[14]),
        .Q(cfg_num_k_tiles_per_block_o[14]),
        .R(p_0_in));
  FDRE \r_numkt_r_reg[15] 
       (.C(S_AXI_ACLK),
        .CE(r_numkt_r),
        .D(S_AXI_WDATA[15]),
        .Q(cfg_num_k_tiles_per_block_o[15]),
        .R(p_0_in));
  FDRE \r_numkt_r_reg[1] 
       (.C(S_AXI_ACLK),
        .CE(r_numkt_r),
        .D(S_AXI_WDATA[1]),
        .Q(cfg_num_k_tiles_per_block_o[1]),
        .R(p_0_in));
  FDRE \r_numkt_r_reg[2] 
       (.C(S_AXI_ACLK),
        .CE(r_numkt_r),
        .D(S_AXI_WDATA[2]),
        .Q(cfg_num_k_tiles_per_block_o[2]),
        .R(p_0_in));
  FDRE \r_numkt_r_reg[3] 
       (.C(S_AXI_ACLK),
        .CE(r_numkt_r),
        .D(S_AXI_WDATA[3]),
        .Q(cfg_num_k_tiles_per_block_o[3]),
        .R(p_0_in));
  FDRE \r_numkt_r_reg[4] 
       (.C(S_AXI_ACLK),
        .CE(r_numkt_r),
        .D(S_AXI_WDATA[4]),
        .Q(cfg_num_k_tiles_per_block_o[4]),
        .R(p_0_in));
  FDRE \r_numkt_r_reg[5] 
       (.C(S_AXI_ACLK),
        .CE(r_numkt_r),
        .D(S_AXI_WDATA[5]),
        .Q(cfg_num_k_tiles_per_block_o[5]),
        .R(p_0_in));
  FDRE \r_numkt_r_reg[6] 
       (.C(S_AXI_ACLK),
        .CE(r_numkt_r),
        .D(S_AXI_WDATA[6]),
        .Q(cfg_num_k_tiles_per_block_o[6]),
        .R(p_0_in));
  FDRE \r_numkt_r_reg[7] 
       (.C(S_AXI_ACLK),
        .CE(r_numkt_r),
        .D(S_AXI_WDATA[7]),
        .Q(cfg_num_k_tiles_per_block_o[7]),
        .R(p_0_in));
  FDRE \r_numkt_r_reg[8] 
       (.C(S_AXI_ACLK),
        .CE(r_numkt_r),
        .D(S_AXI_WDATA[8]),
        .Q(cfg_num_k_tiles_per_block_o[8]),
        .R(p_0_in));
  FDRE \r_numkt_r_reg[9] 
       (.C(S_AXI_ACLK),
        .CE(r_numkt_r),
        .D(S_AXI_WDATA[9]),
        .Q(cfg_num_k_tiles_per_block_o[9]),
        .R(p_0_in));
  LUT6 #(
    .INIT(64'h0000000040000000)) 
    \r_scale_shift_r[4]_i_1 
       (.I0(p_1_in[1]),
        .I1(p_1_in[0]),
        .I2(\r_n_stride_r[15]_i_2_n_0 ),
        .I3(p_1_in[3]),
        .I4(S_AXI_WSTRB),
        .I5(p_1_in[2]),
        .O(r_scale_shift_r));
  FDRE \r_scale_shift_r_reg[0] 
       (.C(S_AXI_ACLK),
        .CE(r_scale_shift_r),
        .D(S_AXI_WDATA[0]),
        .Q(cfg_scale_shift_o[0]),
        .R(p_0_in));
  FDRE \r_scale_shift_r_reg[1] 
       (.C(S_AXI_ACLK),
        .CE(r_scale_shift_r),
        .D(S_AXI_WDATA[1]),
        .Q(cfg_scale_shift_o[1]),
        .R(p_0_in));
  FDRE \r_scale_shift_r_reg[2] 
       (.C(S_AXI_ACLK),
        .CE(r_scale_shift_r),
        .D(S_AXI_WDATA[2]),
        .Q(cfg_scale_shift_o[2]),
        .R(p_0_in));
  FDRE \r_scale_shift_r_reg[3] 
       (.C(S_AXI_ACLK),
        .CE(r_scale_shift_r),
        .D(S_AXI_WDATA[3]),
        .Q(cfg_scale_shift_o[3]),
        .R(p_0_in));
  FDRE \r_scale_shift_r_reg[4] 
       (.C(S_AXI_ACLK),
        .CE(r_scale_shift_r),
        .D(S_AXI_WDATA[4]),
        .Q(cfg_scale_shift_o[4]),
        .R(p_0_in));
  LUT6 #(
    .INIT(64'h0000000040000000)) 
    \r_zero_point_r[7]_i_1 
       (.I0(p_1_in[0]),
        .I1(p_1_in[1]),
        .I2(\r_n_stride_r[15]_i_2_n_0 ),
        .I3(p_1_in[3]),
        .I4(S_AXI_WSTRB),
        .I5(p_1_in[2]),
        .O(r_zero_point_r));
  FDRE \r_zero_point_r_reg[0] 
       (.C(S_AXI_ACLK),
        .CE(r_zero_point_r),
        .D(S_AXI_WDATA[0]),
        .Q(cfg_zero_point_o[0]),
        .R(p_0_in));
  FDRE \r_zero_point_r_reg[1] 
       (.C(S_AXI_ACLK),
        .CE(r_zero_point_r),
        .D(S_AXI_WDATA[1]),
        .Q(cfg_zero_point_o[1]),
        .R(p_0_in));
  FDRE \r_zero_point_r_reg[2] 
       (.C(S_AXI_ACLK),
        .CE(r_zero_point_r),
        .D(S_AXI_WDATA[2]),
        .Q(cfg_zero_point_o[2]),
        .R(p_0_in));
  FDRE \r_zero_point_r_reg[3] 
       (.C(S_AXI_ACLK),
        .CE(r_zero_point_r),
        .D(S_AXI_WDATA[3]),
        .Q(cfg_zero_point_o[3]),
        .R(p_0_in));
  FDRE \r_zero_point_r_reg[4] 
       (.C(S_AXI_ACLK),
        .CE(r_zero_point_r),
        .D(S_AXI_WDATA[4]),
        .Q(cfg_zero_point_o[4]),
        .R(p_0_in));
  FDRE \r_zero_point_r_reg[5] 
       (.C(S_AXI_ACLK),
        .CE(r_zero_point_r),
        .D(S_AXI_WDATA[5]),
        .Q(cfg_zero_point_o[5]),
        .R(p_0_in));
  FDRE \r_zero_point_r_reg[6] 
       (.C(S_AXI_ACLK),
        .CE(r_zero_point_r),
        .D(S_AXI_WDATA[6]),
        .Q(cfg_zero_point_o[6]),
        .R(p_0_in));
  FDRE \r_zero_point_r_reg[7] 
       (.C(S_AXI_ACLK),
        .CE(r_zero_point_r),
        .D(S_AXI_WDATA[7]),
        .Q(cfg_zero_point_o[7]),
        .R(p_0_in));
  LUT6 #(
    .INIT(64'h0000000040000000)) 
    start_pulse_r_i_1
       (.I0(start_pulse_r_i_2_n_0),
        .I1(S_AXI_WDATA[0]),
        .I2(S_AXI_ARESETN),
        .I3(\r_n_stride_r[15]_i_2_n_0 ),
        .I4(p_1_in[3]),
        .I5(start_pulse_r_i_3_n_0),
        .O(start_pulse_r_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT2 #(
    .INIT(4'h7)) 
    start_pulse_r_i_2
       (.I0(p_1_in[1]),
        .I1(p_1_in[0]),
        .O(start_pulse_r_i_2_n_0));
  LUT2 #(
    .INIT(4'hB)) 
    start_pulse_r_i_3
       (.I0(p_1_in[2]),
        .I1(S_AXI_WSTRB),
        .O(start_pulse_r_i_3_n_0));
  FDRE start_pulse_r_reg
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(start_pulse_r_i_1_n_0),
        .Q(start_o),
        .R(1'b0));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif

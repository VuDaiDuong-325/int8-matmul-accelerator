// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
// Date        : Sat Apr 11 20:03:25 2026
// Host        : ZUYYYY running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               d:/E/1subject/HK6/doan1/ver1/matmul/matmul.gen/sources_1/bd/gemm_block_v1/ip/gemm_block_v1_gemm_accelerator_0_0/gemm_block_v1_gemm_accelerator_0_0_stub.v
// Design      : gemm_block_v1_gemm_accelerator_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xck26-sfvc784-2LV-c
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* CHECK_LICENSE_TYPE = "gemm_block_v1_gemm_accelerator_0_0,gemm_accelerator,{}" *) (* CORE_GENERATION_INFO = "gemm_block_v1_gemm_accelerator_0_0,gemm_accelerator,{x_ipProduct=Vivado 2025.2,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=gemm_accelerator,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED,N=16,DATA_WIDTH=8,FIFO_DEPTH=1024,BRAM_DEPTH=1024}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) 
(* IP_DEFINITION_SOURCE = "module_ref" *) (* X_CORE_INFO = "gemm_accelerator,Vivado 2025.2" *) 
module gemm_block_v1_gemm_accelerator_0_0(aclk, aresetn, k_dim, s_axis_a_tdata, 
  s_axis_a_tvalid, s_axis_a_tready, s_axis_a_tlast, s_axis_b_tdata, s_axis_b_tvalid, 
  s_axis_b_tready, s_axis_b_tlast, m_axis_c_tdata, m_axis_c_tvalid, m_axis_c_tready, 
  m_axis_c_tlast)
/* synthesis syn_black_box black_box_pad_pin="aresetn,k_dim[31:0],s_axis_a_tdata[127:0],s_axis_a_tvalid,s_axis_a_tready,s_axis_a_tlast,s_axis_b_tdata[127:0],s_axis_b_tvalid,s_axis_b_tready,s_axis_b_tlast,m_axis_c_tdata[31:0],m_axis_c_tvalid,m_axis_c_tready,m_axis_c_tlast" */
/* synthesis syn_force_seq_prim="aclk" */;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 aclk CLK" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME aclk, ASSOCIATED_BUSIF m_axis_c:s_axis_a:s_axis_b, ASSOCIATED_RESET aresetn, FREQ_HZ 99999001, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN gemm_block_v1_zynq_ultra_ps_e_0_0_pl_clk0, INSERT_VIP 0" *) input aclk /* synthesis syn_isclock = 1 */;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 aresetn RST" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME aresetn, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input aresetn;
  input [31:0]k_dim;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis_a TDATA" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s_axis_a, TDATA_NUM_BYTES 16, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 99999001, PHASE 0.0, CLK_DOMAIN gemm_block_v1_zynq_ultra_ps_e_0_0_pl_clk0, LAYERED_METADATA undef, INSERT_VIP 0" *) input [127:0]s_axis_a_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis_a TVALID" *) input s_axis_a_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis_a TREADY" *) output s_axis_a_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis_a TLAST" *) input s_axis_a_tlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis_b TDATA" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s_axis_b, TDATA_NUM_BYTES 16, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 99999001, PHASE 0.0, CLK_DOMAIN gemm_block_v1_zynq_ultra_ps_e_0_0_pl_clk0, LAYERED_METADATA undef, INSERT_VIP 0" *) input [127:0]s_axis_b_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis_b TVALID" *) input s_axis_b_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis_b TREADY" *) output s_axis_b_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis_b TLAST" *) input s_axis_b_tlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_c TDATA" *) (* X_INTERFACE_MODE = "master" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME m_axis_c, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 99999001, PHASE 0.0, CLK_DOMAIN gemm_block_v1_zynq_ultra_ps_e_0_0_pl_clk0, LAYERED_METADATA undef, INSERT_VIP 0" *) output [31:0]m_axis_c_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_c TVALID" *) output m_axis_c_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_c TREADY" *) input m_axis_c_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_c TLAST" *) output m_axis_c_tlast;
endmodule

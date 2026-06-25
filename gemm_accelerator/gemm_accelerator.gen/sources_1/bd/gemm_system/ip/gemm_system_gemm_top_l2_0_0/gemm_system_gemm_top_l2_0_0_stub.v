// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
// Date        : Thu Jun 25 13:46:44 2026
// Host        : VuDuong-32 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               d:/gemm_accelerator/gemm_accelerator.gen/sources_1/bd/gemm_system/ip/gemm_system_gemm_top_l2_0_0/gemm_system_gemm_top_l2_0_0_stub.v
// Design      : gemm_system_gemm_top_l2_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xck26-sfvc784-2LV-c
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* CHECK_LICENSE_TYPE = "gemm_system_gemm_top_l2_0_0,gemm_top_l2,{}" *) (* CORE_GENERATION_INFO = "gemm_system_gemm_top_l2_0_0,gemm_top_l2,{x_ipProduct=Vivado 2025.2,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=gemm_top_l2,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED,N=16,M_BLK=256,N_BLK=256,K_BLK=256,ADDR_W=32,DIM_W=16,FIFO_DEPTH=1024,BRAM_DEPTH=1024}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) 
(* IP_DEFINITION_SOURCE = "module_ref" *) (* X_CORE_INFO = "gemm_top_l2,Vivado 2025.2" *) 
module gemm_system_gemm_top_l2_0_0(aclk, aresetn, cfg_m_total, cfg_n_total, 
  cfg_k_total, cfg_k_dim, cfg_num_k_tiles_per_block, cfg_base_a, cfg_base_b, cfg_base_c, 
  cfg_n_stride, cfg_scale_shift, cfg_zero_point, start, busy, done, mm2s_cmd_tdata, 
  mm2s_cmd_tvalid, mm2s_cmd_tready, mm2s_tdata, mm2s_tvalid, mm2s_tready, mm2s_tlast, 
  s2mm_cmd_tdata, s2mm_cmd_tvalid, s2mm_cmd_tready, s2mm_tdata, s2mm_tvalid, s2mm_tready, 
  s2mm_tlast, s2mm_tkeep, s2mm_sts_tdata, s2mm_sts_tvalid, s2mm_sts_tready)
/* synthesis syn_black_box black_box_pad_pin="aresetn,cfg_m_total[15:0],cfg_n_total[15:0],cfg_k_total[15:0],cfg_k_dim[15:0],cfg_num_k_tiles_per_block[15:0],cfg_base_a[31:0],cfg_base_b[31:0],cfg_base_c[31:0],cfg_n_stride[15:0],cfg_scale_shift[4:0],cfg_zero_point[7:0],start,busy,done,mm2s_cmd_tdata[71:0],mm2s_cmd_tvalid,mm2s_cmd_tready,mm2s_tdata[127:0],mm2s_tvalid,mm2s_tready,mm2s_tlast,s2mm_cmd_tdata[71:0],s2mm_cmd_tvalid,s2mm_cmd_tready,s2mm_tdata[127:0],s2mm_tvalid,s2mm_tready,s2mm_tlast,s2mm_tkeep[15:0],s2mm_sts_tdata[7:0],s2mm_sts_tvalid,s2mm_sts_tready" */
/* synthesis syn_force_seq_prim="aclk" */;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 aclk CLK" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME aclk, ASSOCIATED_BUSIF mm2s:mm2s_cmd:s2mm:s2mm_cmd:s2mm_sts, ASSOCIATED_RESET aresetn, FREQ_HZ 99999001, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN gemm_system_zynq_ultra_ps_e_0_0_pl_clk0, INSERT_VIP 0" *) input aclk /* synthesis syn_isclock = 1 */;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 aresetn RST" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME aresetn, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input aresetn;
  input [15:0]cfg_m_total;
  input [15:0]cfg_n_total;
  input [15:0]cfg_k_total;
  input [15:0]cfg_k_dim;
  input [15:0]cfg_num_k_tiles_per_block;
  input [31:0]cfg_base_a;
  input [31:0]cfg_base_b;
  input [31:0]cfg_base_c;
  input [15:0]cfg_n_stride;
  input [4:0]cfg_scale_shift;
  input [7:0]cfg_zero_point;
  input start;
  output busy;
  output done;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 mm2s_cmd TDATA" *) (* X_INTERFACE_MODE = "master" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME mm2s_cmd, TDATA_NUM_BYTES 9, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 99999001, PHASE 0.0, CLK_DOMAIN gemm_system_zynq_ultra_ps_e_0_0_pl_clk0, LAYERED_METADATA undef, INSERT_VIP 0" *) output [71:0]mm2s_cmd_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 mm2s_cmd TVALID" *) output mm2s_cmd_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 mm2s_cmd TREADY" *) input mm2s_cmd_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 mm2s TDATA" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME mm2s, TDATA_NUM_BYTES 16, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 99999001, PHASE 0.0, CLK_DOMAIN gemm_system_zynq_ultra_ps_e_0_0_pl_clk0, LAYERED_METADATA undef, INSERT_VIP 0" *) input [127:0]mm2s_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 mm2s TVALID" *) input mm2s_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 mm2s TREADY" *) output mm2s_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 mm2s TLAST" *) input mm2s_tlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s2mm_cmd TDATA" *) (* X_INTERFACE_MODE = "master" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s2mm_cmd, TDATA_NUM_BYTES 9, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 99999001, PHASE 0.0, CLK_DOMAIN gemm_system_zynq_ultra_ps_e_0_0_pl_clk0, LAYERED_METADATA undef, INSERT_VIP 0" *) output [71:0]s2mm_cmd_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s2mm_cmd TVALID" *) output s2mm_cmd_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s2mm_cmd TREADY" *) input s2mm_cmd_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s2mm TDATA" *) (* X_INTERFACE_MODE = "master" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s2mm, TDATA_NUM_BYTES 16, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 1, HAS_TLAST 1, FREQ_HZ 99999001, PHASE 0.0, CLK_DOMAIN gemm_system_zynq_ultra_ps_e_0_0_pl_clk0, LAYERED_METADATA undef, INSERT_VIP 0" *) output [127:0]s2mm_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s2mm TVALID" *) output s2mm_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s2mm TREADY" *) input s2mm_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s2mm TLAST" *) output s2mm_tlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s2mm TKEEP" *) output [15:0]s2mm_tkeep;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s2mm_sts TDATA" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s2mm_sts, TDATA_NUM_BYTES 1, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 99999001, PHASE 0.0, CLK_DOMAIN gemm_system_zynq_ultra_ps_e_0_0_pl_clk0, LAYERED_METADATA undef, INSERT_VIP 0" *) input [7:0]s2mm_sts_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s2mm_sts TVALID" *) input s2mm_sts_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s2mm_sts TREADY" *) output s2mm_sts_tready;
endmodule

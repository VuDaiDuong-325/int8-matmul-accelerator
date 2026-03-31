// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
// Date        : Mon Mar 30 08:37:29 2026
// Host        : VuDuong-32 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               d:/HK6/Project1/testing/matmul_array/matmul/matmul.gen/sources_1/bd/array_block/ip/array_block_array_top_0_0/array_block_array_top_0_0_stub.v
// Design      : array_block_array_top_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xck26-sfvc784-2LV-c
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* CHECK_LICENSE_TYPE = "array_block_array_top_0_0,array_top,{}" *) (* CORE_GENERATION_INFO = "array_block_array_top_0_0,array_top,{x_ipProduct=Vivado 2025.2,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=array_top,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED,ARRAY_SIZE=4}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) 
(* IP_DEFINITION_SOURCE = "module_ref" *) (* X_CORE_INFO = "array_top,Vivado 2025.2" *) 
module array_block_array_top_0_0(clk, rst_n, start_btn, rd_addr, rd_data)
/* synthesis syn_black_box black_box_pad_pin="rst_n,start_btn,rd_addr[3:0],rd_data[31:0]" */
/* synthesis syn_force_seq_prim="clk" */;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clk CLK" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME clk, FREQ_HZ 99999001, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN array_block_zynq_ultra_ps_e_0_0_pl_clk0, INSERT_VIP 0" *) input clk /* synthesis syn_isclock = 1 */;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 rst_n RST" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME rst_n, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input rst_n;
  input start_btn;
  input [3:0]rd_addr;
  output [31:0]rd_data;
endmodule

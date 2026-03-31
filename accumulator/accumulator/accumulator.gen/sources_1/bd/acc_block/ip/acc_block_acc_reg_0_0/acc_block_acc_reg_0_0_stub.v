// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
// Date        : Wed Mar 25 22:44:12 2026
// Host        : VuDuong-32 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               d:/HK6/Project1/testing/accumulator/accumulator/accumulator.gen/sources_1/bd/acc_block/ip/acc_block_acc_reg_0_0/acc_block_acc_reg_0_0_stub.v
// Design      : acc_block_acc_reg_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xck26-sfvc784-2LV-c
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* CHECK_LICENSE_TYPE = "acc_block_acc_reg_0_0,acc_reg,{}" *) (* CORE_GENERATION_INFO = "acc_block_acc_reg_0_0,acc_reg,{x_ipProduct=Vivado 2025.2,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=acc_reg,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) 
(* IP_DEFINITION_SOURCE = "module_ref" *) (* X_CORE_INFO = "acc_reg,Vivado 2025.2" *) 
module acc_block_acc_reg_0_0(a, b, start, clk, rst_n, psum)
/* synthesis syn_black_box black_box_pad_pin="a[3:0],b[3:0],start,rst_n,psum[15:0]" */
/* synthesis syn_force_seq_prim="clk" */;
  input [3:0]a;
  input [3:0]b;
  input start;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clk CLK" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME clk, FREQ_HZ 99999001, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN acc_block_zynq_ultra_ps_e_0_0_pl_clk0, INSERT_VIP 0" *) input clk /* synthesis syn_isclock = 1 */;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 rst_n RST" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME rst_n, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input rst_n;
  output [15:0]psum;
endmodule

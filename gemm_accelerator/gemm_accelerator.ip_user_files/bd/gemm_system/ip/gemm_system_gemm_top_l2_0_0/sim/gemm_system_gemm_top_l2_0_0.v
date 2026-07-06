// (c) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// (c) Copyright 2022-2026 Advanced Micro Devices, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of AMD and is protected under U.S. and international copyright
// and other intellectual property laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// AMD, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND AMD HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) AMD shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or AMD had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// AMD products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of AMD products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.


// IP VLNV: xilinx.com:module_ref:gemm_top_l2:1.0
// IP Revision: 1

`timescale 1ns/1ps

(* IP_DEFINITION_SOURCE = "module_ref" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module gemm_system_gemm_top_l2_0_0 (
  CLK_i,
  RST_i,
  cfg_m_total_i,
  cfg_n_total_i,
  cfg_k_total_i,
  cfg_k_dim_i,
  cfg_num_k_tiles_per_block_i,
  cfg_base_a_i,
  cfg_base_b_i,
  cfg_base_c_i,
  cfg_n_stride_i,
  cfg_scale_shift_i,
  cfg_zero_point_i,
  start_i,
  busy_o,
  done_o,
  mm2s_cmd_tdata,
  mm2s_cmd_tvalid,
  mm2s_cmd_tready,
  mm2s_tdata,
  mm2s_tvalid,
  mm2s_tready,
  mm2s_tlast,
  s2mm_cmd_tdata,
  s2mm_cmd_tvalid,
  s2mm_cmd_tready,
  s2mm_tdata,
  s2mm_tvalid,
  s2mm_tready,
  s2mm_tlast,
  s2mm_tkeep,
  s2mm_sts_tdata,
  s2mm_sts_tvalid,
  s2mm_sts_tready
);

(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK_i CLK" *)
(* X_INTERFACE_MODE = "slave" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK_i, ASSOCIATED_RESET RST_i, ASSOCIATED_BUSIF mm2s_cmd:mm2s:s2mm_cmd:s2mm:s2mm_sts, FREQ_HZ 142855713, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN gemm_system_zynq_ultra_ps_e_0_0_pl_clk0, INSERT_VIP 0" *)
input wire CLK_i;
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST_i RST" *)
(* X_INTERFACE_MODE = "slave" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST_i, POLARITY ACTIVE_LOW, INSERT_VIP 0" *)
input wire RST_i;
input wire [15 : 0] cfg_m_total_i;
input wire [15 : 0] cfg_n_total_i;
input wire [15 : 0] cfg_k_total_i;
input wire [15 : 0] cfg_k_dim_i;
input wire [15 : 0] cfg_num_k_tiles_per_block_i;
input wire [31 : 0] cfg_base_a_i;
input wire [31 : 0] cfg_base_b_i;
input wire [31 : 0] cfg_base_c_i;
input wire [15 : 0] cfg_n_stride_i;
input wire [4 : 0] cfg_scale_shift_i;
input wire [7 : 0] cfg_zero_point_i;
input wire start_i;
output wire busy_o;
output wire done_o;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 mm2s_cmd TDATA" *)
(* X_INTERFACE_MODE = "master" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME mm2s_cmd, TDATA_NUM_BYTES 9, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 142855713, PHASE 0.0, CLK_DOMAIN gemm_system_zynq_ultra_ps_e_0_0_pl_clk0, LAYERED_METADATA undef, INSERT_VIP 0" *)
output wire [71 : 0] mm2s_cmd_tdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 mm2s_cmd TVALID" *)
output wire mm2s_cmd_tvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 mm2s_cmd TREADY" *)
input wire mm2s_cmd_tready;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 mm2s TDATA" *)
(* X_INTERFACE_MODE = "slave" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME mm2s, TDATA_NUM_BYTES 16, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 142855713, PHASE 0.0, CLK_DOMAIN gemm_system_zynq_ultra_ps_e_0_0_pl_clk0, LAYERED_METADATA undef, INSERT_VIP 0" *)
input wire [127 : 0] mm2s_tdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 mm2s TVALID" *)
input wire mm2s_tvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 mm2s TREADY" *)
output wire mm2s_tready;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 mm2s TLAST" *)
input wire mm2s_tlast;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s2mm_cmd TDATA" *)
(* X_INTERFACE_MODE = "master" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s2mm_cmd, TDATA_NUM_BYTES 9, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 142855713, PHASE 0.0, CLK_DOMAIN gemm_system_zynq_ultra_ps_e_0_0_pl_clk0, LAYERED_METADATA undef, INSERT_VIP 0" *)
output wire [71 : 0] s2mm_cmd_tdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s2mm_cmd TVALID" *)
output wire s2mm_cmd_tvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s2mm_cmd TREADY" *)
input wire s2mm_cmd_tready;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s2mm TDATA" *)
(* X_INTERFACE_MODE = "master" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s2mm, TDATA_NUM_BYTES 16, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 1, HAS_TLAST 1, FREQ_HZ 142855713, PHASE 0.0, CLK_DOMAIN gemm_system_zynq_ultra_ps_e_0_0_pl_clk0, LAYERED_METADATA undef, INSERT_VIP 0" *)
output wire [127 : 0] s2mm_tdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s2mm TVALID" *)
output wire s2mm_tvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s2mm TREADY" *)
input wire s2mm_tready;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s2mm TLAST" *)
output wire s2mm_tlast;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s2mm TKEEP" *)
output wire [15 : 0] s2mm_tkeep;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s2mm_sts TDATA" *)
(* X_INTERFACE_MODE = "slave" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s2mm_sts, TDATA_NUM_BYTES 1, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 142855713, PHASE 0.0, CLK_DOMAIN gemm_system_zynq_ultra_ps_e_0_0_pl_clk0, LAYERED_METADATA undef, INSERT_VIP 0" *)
input wire [7 : 0] s2mm_sts_tdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s2mm_sts TVALID" *)
input wire s2mm_sts_tvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s2mm_sts TREADY" *)
output wire s2mm_sts_tready;

  gemm_top_l2 #(
    .N(16),
    .M_BLK(256),
    .N_BLK(256),
    .K_BLK(256),
    .ADDR_W(32),
    .DIM_W(16),
    .FIFO_DEPTH(1024),
    .BRAM_DEPTH(1024)
  ) inst (
    .CLK_i(CLK_i),
    .RST_i(RST_i),
    .cfg_m_total_i(cfg_m_total_i),
    .cfg_n_total_i(cfg_n_total_i),
    .cfg_k_total_i(cfg_k_total_i),
    .cfg_k_dim_i(cfg_k_dim_i),
    .cfg_num_k_tiles_per_block_i(cfg_num_k_tiles_per_block_i),
    .cfg_base_a_i(cfg_base_a_i),
    .cfg_base_b_i(cfg_base_b_i),
    .cfg_base_c_i(cfg_base_c_i),
    .cfg_n_stride_i(cfg_n_stride_i),
    .cfg_scale_shift_i(cfg_scale_shift_i),
    .cfg_zero_point_i(cfg_zero_point_i),
    .start_i(start_i),
    .busy_o(busy_o),
    .done_o(done_o),
    .mm2s_cmd_tdata(mm2s_cmd_tdata),
    .mm2s_cmd_tvalid(mm2s_cmd_tvalid),
    .mm2s_cmd_tready(mm2s_cmd_tready),
    .mm2s_tdata(mm2s_tdata),
    .mm2s_tvalid(mm2s_tvalid),
    .mm2s_tready(mm2s_tready),
    .mm2s_tlast(mm2s_tlast),
    .s2mm_cmd_tdata(s2mm_cmd_tdata),
    .s2mm_cmd_tvalid(s2mm_cmd_tvalid),
    .s2mm_cmd_tready(s2mm_cmd_tready),
    .s2mm_tdata(s2mm_tdata),
    .s2mm_tvalid(s2mm_tvalid),
    .s2mm_tready(s2mm_tready),
    .s2mm_tlast(s2mm_tlast),
    .s2mm_tkeep(s2mm_tkeep),
    .s2mm_sts_tdata(s2mm_sts_tdata),
    .s2mm_sts_tvalid(s2mm_sts_tvalid),
    .s2mm_sts_tready(s2mm_sts_tready)
  );
endmodule

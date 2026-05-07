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


// IP VLNV: xilinx.com:user:gemm_accelerator:1.0
// IP Revision: 29

`timescale 1ns/1ps

(* IP_DEFINITION_SOURCE = "package_project" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module gemm_block_gemm_accelerator_0_0 (
  aclk,
  aresetn,
  k_dim,
  s_axis_a_tdata,
  s_axis_a_tvalid,
  s_axis_a_tready,
  s_axis_a_tlast,
  s_axis_b_tdata,
  s_axis_b_tvalid,
  s_axis_b_tready,
  s_axis_b_tlast,
  m_axis_c_tdata,
  m_axis_c_tvalid,
  m_axis_c_tready,
  m_axis_c_tlast
);

(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 aclk CLK" *)
(* X_INTERFACE_MODE = "slave" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME aclk, ASSOCIATED_BUSIF m_axis_c:s_axis_a:s_axis_b, ASSOCIATED_RESET aresetn, FREQ_HZ 199998001, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN gemm_block_zynq_ultra_ps_e_0_0_pl_clk0, INSERT_VIP 0" *)
input wire aclk;
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 aresetn RST" *)
(* X_INTERFACE_MODE = "slave" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME aresetn, POLARITY ACTIVE_LOW, INSERT_VIP 0" *)
input wire aresetn;
input wire [31 : 0] k_dim;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis_a TDATA" *)
(* X_INTERFACE_MODE = "slave" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s_axis_a, TDATA_NUM_BYTES 16, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 199998001, PHASE 0.0, CLK_DOMAIN gemm_block_zynq_ultra_ps_e_0_0_pl_clk0, LAYERED_METADATA undef, INSERT_VIP 0" *)
input wire [127 : 0] s_axis_a_tdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis_a TVALID" *)
input wire s_axis_a_tvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis_a TREADY" *)
output wire s_axis_a_tready;
input wire s_axis_a_tlast;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis_b TDATA" *)
(* X_INTERFACE_MODE = "slave" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s_axis_b, TDATA_NUM_BYTES 16, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 199998001, PHASE 0.0, CLK_DOMAIN gemm_block_zynq_ultra_ps_e_0_0_pl_clk0, LAYERED_METADATA undef, INSERT_VIP 0" *)
input wire [127 : 0] s_axis_b_tdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis_b TVALID" *)
input wire s_axis_b_tvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis_b TREADY" *)
output wire s_axis_b_tready;
input wire s_axis_b_tlast;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_c TDATA" *)
(* X_INTERFACE_MODE = "master" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME m_axis_c, TDATA_NUM_BYTES 64, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 199998001, PHASE 0.0, CLK_DOMAIN gemm_block_zynq_ultra_ps_e_0_0_pl_clk0, LAYERED_METADATA undef, INSERT_VIP 0" *)
output wire [511 : 0] m_axis_c_tdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_c TVALID" *)
output wire m_axis_c_tvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_c TREADY" *)
input wire m_axis_c_tready;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_c TLAST" *)
output wire m_axis_c_tlast;

  gemm_accelerator #(
    .N(16),
    .DATA_WIDTH(8),
    .FIFO_DEPTH(1024),
    .BRAM_DEPTH(1024)
  ) inst (
    .aclk(aclk),
    .aresetn(aresetn),
    .k_dim(k_dim),
    .s_axis_a_tdata(s_axis_a_tdata),
    .s_axis_a_tvalid(s_axis_a_tvalid),
    .s_axis_a_tready(s_axis_a_tready),
    .s_axis_a_tlast(s_axis_a_tlast),
    .s_axis_b_tdata(s_axis_b_tdata),
    .s_axis_b_tvalid(s_axis_b_tvalid),
    .s_axis_b_tready(s_axis_b_tready),
    .s_axis_b_tlast(s_axis_b_tlast),
    .m_axis_c_tdata(m_axis_c_tdata),
    .m_axis_c_tvalid(m_axis_c_tvalid),
    .m_axis_c_tready(m_axis_c_tready),
    .m_axis_c_tlast(m_axis_c_tlast)
  );
endmodule

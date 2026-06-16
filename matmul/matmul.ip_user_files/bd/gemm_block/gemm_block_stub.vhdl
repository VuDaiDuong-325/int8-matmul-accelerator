-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
-- Date        : Tue Jun 16 21:40:42 2026
-- Host        : VuDuong-32 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               d:/int8-matmul-accelerator/matmul/matmul.gen/sources_1/bd/gemm_block/gemm_block_stub.vhdl
-- Design      : gemm_block
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xck26-sfvc784-2LV-c
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity gemm_block is
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of gemm_block : entity is "gemm_block,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=gemm_block,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=9,numReposBlks=9,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=1,numPkgbdBlks=0,bdsource=USER,da_axi4_cnt=10,da_clkrst_cnt=2,da_zynq_ultra_ps_e_cnt=1,synth_mode=Singular}";
  attribute HW_HANDOFF : string;
  attribute HW_HANDOFF of gemm_block : entity is "gemm_block.hwdef";
end gemm_block;

architecture stub of gemm_block is
  attribute syn_black_box : boolean;
  attribute black_box_pad_pin : string;
  attribute syn_black_box of stub : architecture is true;
  attribute black_box_pad_pin of stub : architecture is "";
begin
end;

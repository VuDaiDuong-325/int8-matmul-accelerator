-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
-- Date        : Sat Apr 11 20:03:25 2026
-- Host        : ZUYYYY running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               d:/E/1subject/HK6/doan1/ver1/matmul/matmul.gen/sources_1/bd/gemm_block_v1/ip/gemm_block_v1_gemm_accelerator_0_0/gemm_block_v1_gemm_accelerator_0_0_stub.vhdl
-- Design      : gemm_block_v1_gemm_accelerator_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xck26-sfvc784-2LV-c
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity gemm_block_v1_gemm_accelerator_0_0 is
  Port ( 
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    k_dim : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axis_a_tdata : in STD_LOGIC_VECTOR ( 127 downto 0 );
    s_axis_a_tvalid : in STD_LOGIC;
    s_axis_a_tready : out STD_LOGIC;
    s_axis_a_tlast : in STD_LOGIC;
    s_axis_b_tdata : in STD_LOGIC_VECTOR ( 127 downto 0 );
    s_axis_b_tvalid : in STD_LOGIC;
    s_axis_b_tready : out STD_LOGIC;
    s_axis_b_tlast : in STD_LOGIC;
    m_axis_c_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axis_c_tvalid : out STD_LOGIC;
    m_axis_c_tready : in STD_LOGIC;
    m_axis_c_tlast : out STD_LOGIC
  );

  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of gemm_block_v1_gemm_accelerator_0_0 : entity is "gemm_block_v1_gemm_accelerator_0_0,gemm_accelerator,{}";
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of gemm_block_v1_gemm_accelerator_0_0 : entity is "gemm_block_v1_gemm_accelerator_0_0,gemm_accelerator,{x_ipProduct=Vivado 2025.2,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=gemm_accelerator,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED,N=16,DATA_WIDTH=8,FIFO_DEPTH=1024,BRAM_DEPTH=1024}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of gemm_block_v1_gemm_accelerator_0_0 : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of gemm_block_v1_gemm_accelerator_0_0 : entity is "module_ref";
end gemm_block_v1_gemm_accelerator_0_0;

architecture stub of gemm_block_v1_gemm_accelerator_0_0 is
  attribute syn_black_box : boolean;
  attribute black_box_pad_pin : string;
  attribute syn_black_box of stub : architecture is true;
  attribute black_box_pad_pin of stub : architecture is "aclk,aresetn,k_dim[31:0],s_axis_a_tdata[127:0],s_axis_a_tvalid,s_axis_a_tready,s_axis_a_tlast,s_axis_b_tdata[127:0],s_axis_b_tvalid,s_axis_b_tready,s_axis_b_tlast,m_axis_c_tdata[31:0],m_axis_c_tvalid,m_axis_c_tready,m_axis_c_tlast";
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of aclk : signal is "xilinx.com:signal:clock:1.0 aclk CLK";
  attribute X_INTERFACE_MODE : string;
  attribute X_INTERFACE_MODE of aclk : signal is "slave";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of aclk : signal is "XIL_INTERFACENAME aclk, ASSOCIATED_BUSIF m_axis_c:s_axis_a:s_axis_b, ASSOCIATED_RESET aresetn, FREQ_HZ 99999001, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN gemm_block_v1_zynq_ultra_ps_e_0_0_pl_clk0, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of aresetn : signal is "xilinx.com:signal:reset:1.0 aresetn RST";
  attribute X_INTERFACE_MODE of aresetn : signal is "slave";
  attribute X_INTERFACE_PARAMETER of aresetn : signal is "XIL_INTERFACENAME aresetn, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of s_axis_a_tdata : signal is "xilinx.com:interface:axis:1.0 s_axis_a TDATA";
  attribute X_INTERFACE_MODE of s_axis_a_tdata : signal is "slave";
  attribute X_INTERFACE_PARAMETER of s_axis_a_tdata : signal is "XIL_INTERFACENAME s_axis_a, TDATA_NUM_BYTES 16, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 99999001, PHASE 0.0, CLK_DOMAIN gemm_block_v1_zynq_ultra_ps_e_0_0_pl_clk0, LAYERED_METADATA undef, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of s_axis_a_tvalid : signal is "xilinx.com:interface:axis:1.0 s_axis_a TVALID";
  attribute X_INTERFACE_INFO of s_axis_a_tready : signal is "xilinx.com:interface:axis:1.0 s_axis_a TREADY";
  attribute X_INTERFACE_INFO of s_axis_a_tlast : signal is "xilinx.com:interface:axis:1.0 s_axis_a TLAST";
  attribute X_INTERFACE_INFO of s_axis_b_tdata : signal is "xilinx.com:interface:axis:1.0 s_axis_b TDATA";
  attribute X_INTERFACE_MODE of s_axis_b_tdata : signal is "slave";
  attribute X_INTERFACE_PARAMETER of s_axis_b_tdata : signal is "XIL_INTERFACENAME s_axis_b, TDATA_NUM_BYTES 16, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 99999001, PHASE 0.0, CLK_DOMAIN gemm_block_v1_zynq_ultra_ps_e_0_0_pl_clk0, LAYERED_METADATA undef, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of s_axis_b_tvalid : signal is "xilinx.com:interface:axis:1.0 s_axis_b TVALID";
  attribute X_INTERFACE_INFO of s_axis_b_tready : signal is "xilinx.com:interface:axis:1.0 s_axis_b TREADY";
  attribute X_INTERFACE_INFO of s_axis_b_tlast : signal is "xilinx.com:interface:axis:1.0 s_axis_b TLAST";
  attribute X_INTERFACE_INFO of m_axis_c_tdata : signal is "xilinx.com:interface:axis:1.0 m_axis_c TDATA";
  attribute X_INTERFACE_MODE of m_axis_c_tdata : signal is "master";
  attribute X_INTERFACE_PARAMETER of m_axis_c_tdata : signal is "XIL_INTERFACENAME m_axis_c, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 99999001, PHASE 0.0, CLK_DOMAIN gemm_block_v1_zynq_ultra_ps_e_0_0_pl_clk0, LAYERED_METADATA undef, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of m_axis_c_tvalid : signal is "xilinx.com:interface:axis:1.0 m_axis_c TVALID";
  attribute X_INTERFACE_INFO of m_axis_c_tready : signal is "xilinx.com:interface:axis:1.0 m_axis_c TREADY";
  attribute X_INTERFACE_INFO of m_axis_c_tlast : signal is "xilinx.com:interface:axis:1.0 m_axis_c TLAST";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of stub : architecture is "gemm_accelerator,Vivado 2025.2";
begin
end;

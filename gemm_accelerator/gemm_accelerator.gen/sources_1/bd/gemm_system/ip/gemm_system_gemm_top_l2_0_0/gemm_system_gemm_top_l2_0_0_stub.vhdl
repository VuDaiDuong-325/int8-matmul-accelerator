-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
-- Date        : Thu Jun 25 13:46:44 2026
-- Host        : VuDuong-32 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               d:/gemm_accelerator/gemm_accelerator.gen/sources_1/bd/gemm_system/ip/gemm_system_gemm_top_l2_0_0/gemm_system_gemm_top_l2_0_0_stub.vhdl
-- Design      : gemm_system_gemm_top_l2_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xck26-sfvc784-2LV-c
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity gemm_system_gemm_top_l2_0_0 is
  Port ( 
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    cfg_m_total : in STD_LOGIC_VECTOR ( 15 downto 0 );
    cfg_n_total : in STD_LOGIC_VECTOR ( 15 downto 0 );
    cfg_k_total : in STD_LOGIC_VECTOR ( 15 downto 0 );
    cfg_k_dim : in STD_LOGIC_VECTOR ( 15 downto 0 );
    cfg_num_k_tiles_per_block : in STD_LOGIC_VECTOR ( 15 downto 0 );
    cfg_base_a : in STD_LOGIC_VECTOR ( 31 downto 0 );
    cfg_base_b : in STD_LOGIC_VECTOR ( 31 downto 0 );
    cfg_base_c : in STD_LOGIC_VECTOR ( 31 downto 0 );
    cfg_n_stride : in STD_LOGIC_VECTOR ( 15 downto 0 );
    cfg_scale_shift : in STD_LOGIC_VECTOR ( 4 downto 0 );
    cfg_zero_point : in STD_LOGIC_VECTOR ( 7 downto 0 );
    start : in STD_LOGIC;
    busy : out STD_LOGIC;
    done : out STD_LOGIC;
    mm2s_cmd_tdata : out STD_LOGIC_VECTOR ( 71 downto 0 );
    mm2s_cmd_tvalid : out STD_LOGIC;
    mm2s_cmd_tready : in STD_LOGIC;
    mm2s_tdata : in STD_LOGIC_VECTOR ( 127 downto 0 );
    mm2s_tvalid : in STD_LOGIC;
    mm2s_tready : out STD_LOGIC;
    mm2s_tlast : in STD_LOGIC;
    s2mm_cmd_tdata : out STD_LOGIC_VECTOR ( 71 downto 0 );
    s2mm_cmd_tvalid : out STD_LOGIC;
    s2mm_cmd_tready : in STD_LOGIC;
    s2mm_tdata : out STD_LOGIC_VECTOR ( 127 downto 0 );
    s2mm_tvalid : out STD_LOGIC;
    s2mm_tready : in STD_LOGIC;
    s2mm_tlast : out STD_LOGIC;
    s2mm_tkeep : out STD_LOGIC_VECTOR ( 15 downto 0 );
    s2mm_sts_tdata : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s2mm_sts_tvalid : in STD_LOGIC;
    s2mm_sts_tready : out STD_LOGIC
  );

  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of gemm_system_gemm_top_l2_0_0 : entity is "gemm_system_gemm_top_l2_0_0,gemm_top_l2,{}";
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of gemm_system_gemm_top_l2_0_0 : entity is "gemm_system_gemm_top_l2_0_0,gemm_top_l2,{x_ipProduct=Vivado 2025.2,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=gemm_top_l2,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED,N=16,M_BLK=256,N_BLK=256,K_BLK=256,ADDR_W=32,DIM_W=16,FIFO_DEPTH=1024,BRAM_DEPTH=1024}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of gemm_system_gemm_top_l2_0_0 : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of gemm_system_gemm_top_l2_0_0 : entity is "module_ref";
end gemm_system_gemm_top_l2_0_0;

architecture stub of gemm_system_gemm_top_l2_0_0 is
  attribute syn_black_box : boolean;
  attribute black_box_pad_pin : string;
  attribute syn_black_box of stub : architecture is true;
  attribute black_box_pad_pin of stub : architecture is "aclk,aresetn,cfg_m_total[15:0],cfg_n_total[15:0],cfg_k_total[15:0],cfg_k_dim[15:0],cfg_num_k_tiles_per_block[15:0],cfg_base_a[31:0],cfg_base_b[31:0],cfg_base_c[31:0],cfg_n_stride[15:0],cfg_scale_shift[4:0],cfg_zero_point[7:0],start,busy,done,mm2s_cmd_tdata[71:0],mm2s_cmd_tvalid,mm2s_cmd_tready,mm2s_tdata[127:0],mm2s_tvalid,mm2s_tready,mm2s_tlast,s2mm_cmd_tdata[71:0],s2mm_cmd_tvalid,s2mm_cmd_tready,s2mm_tdata[127:0],s2mm_tvalid,s2mm_tready,s2mm_tlast,s2mm_tkeep[15:0],s2mm_sts_tdata[7:0],s2mm_sts_tvalid,s2mm_sts_tready";
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of aclk : signal is "xilinx.com:signal:clock:1.0 aclk CLK";
  attribute X_INTERFACE_MODE : string;
  attribute X_INTERFACE_MODE of aclk : signal is "slave";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of aclk : signal is "XIL_INTERFACENAME aclk, ASSOCIATED_BUSIF mm2s:mm2s_cmd:s2mm:s2mm_cmd:s2mm_sts, ASSOCIATED_RESET aresetn, FREQ_HZ 99999001, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN gemm_system_zynq_ultra_ps_e_0_0_pl_clk0, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of aresetn : signal is "xilinx.com:signal:reset:1.0 aresetn RST";
  attribute X_INTERFACE_MODE of aresetn : signal is "slave";
  attribute X_INTERFACE_PARAMETER of aresetn : signal is "XIL_INTERFACENAME aresetn, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of mm2s_cmd_tdata : signal is "xilinx.com:interface:axis:1.0 mm2s_cmd TDATA";
  attribute X_INTERFACE_MODE of mm2s_cmd_tdata : signal is "master";
  attribute X_INTERFACE_PARAMETER of mm2s_cmd_tdata : signal is "XIL_INTERFACENAME mm2s_cmd, TDATA_NUM_BYTES 9, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 99999001, PHASE 0.0, CLK_DOMAIN gemm_system_zynq_ultra_ps_e_0_0_pl_clk0, LAYERED_METADATA undef, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of mm2s_cmd_tvalid : signal is "xilinx.com:interface:axis:1.0 mm2s_cmd TVALID";
  attribute X_INTERFACE_INFO of mm2s_cmd_tready : signal is "xilinx.com:interface:axis:1.0 mm2s_cmd TREADY";
  attribute X_INTERFACE_INFO of mm2s_tdata : signal is "xilinx.com:interface:axis:1.0 mm2s TDATA";
  attribute X_INTERFACE_MODE of mm2s_tdata : signal is "slave";
  attribute X_INTERFACE_PARAMETER of mm2s_tdata : signal is "XIL_INTERFACENAME mm2s, TDATA_NUM_BYTES 16, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 99999001, PHASE 0.0, CLK_DOMAIN gemm_system_zynq_ultra_ps_e_0_0_pl_clk0, LAYERED_METADATA undef, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of mm2s_tvalid : signal is "xilinx.com:interface:axis:1.0 mm2s TVALID";
  attribute X_INTERFACE_INFO of mm2s_tready : signal is "xilinx.com:interface:axis:1.0 mm2s TREADY";
  attribute X_INTERFACE_INFO of mm2s_tlast : signal is "xilinx.com:interface:axis:1.0 mm2s TLAST";
  attribute X_INTERFACE_INFO of s2mm_cmd_tdata : signal is "xilinx.com:interface:axis:1.0 s2mm_cmd TDATA";
  attribute X_INTERFACE_MODE of s2mm_cmd_tdata : signal is "master";
  attribute X_INTERFACE_PARAMETER of s2mm_cmd_tdata : signal is "XIL_INTERFACENAME s2mm_cmd, TDATA_NUM_BYTES 9, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 99999001, PHASE 0.0, CLK_DOMAIN gemm_system_zynq_ultra_ps_e_0_0_pl_clk0, LAYERED_METADATA undef, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of s2mm_cmd_tvalid : signal is "xilinx.com:interface:axis:1.0 s2mm_cmd TVALID";
  attribute X_INTERFACE_INFO of s2mm_cmd_tready : signal is "xilinx.com:interface:axis:1.0 s2mm_cmd TREADY";
  attribute X_INTERFACE_INFO of s2mm_tdata : signal is "xilinx.com:interface:axis:1.0 s2mm TDATA";
  attribute X_INTERFACE_MODE of s2mm_tdata : signal is "master";
  attribute X_INTERFACE_PARAMETER of s2mm_tdata : signal is "XIL_INTERFACENAME s2mm, TDATA_NUM_BYTES 16, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 1, HAS_TLAST 1, FREQ_HZ 99999001, PHASE 0.0, CLK_DOMAIN gemm_system_zynq_ultra_ps_e_0_0_pl_clk0, LAYERED_METADATA undef, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of s2mm_tvalid : signal is "xilinx.com:interface:axis:1.0 s2mm TVALID";
  attribute X_INTERFACE_INFO of s2mm_tready : signal is "xilinx.com:interface:axis:1.0 s2mm TREADY";
  attribute X_INTERFACE_INFO of s2mm_tlast : signal is "xilinx.com:interface:axis:1.0 s2mm TLAST";
  attribute X_INTERFACE_INFO of s2mm_tkeep : signal is "xilinx.com:interface:axis:1.0 s2mm TKEEP";
  attribute X_INTERFACE_INFO of s2mm_sts_tdata : signal is "xilinx.com:interface:axis:1.0 s2mm_sts TDATA";
  attribute X_INTERFACE_MODE of s2mm_sts_tdata : signal is "slave";
  attribute X_INTERFACE_PARAMETER of s2mm_sts_tdata : signal is "XIL_INTERFACENAME s2mm_sts, TDATA_NUM_BYTES 1, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 99999001, PHASE 0.0, CLK_DOMAIN gemm_system_zynq_ultra_ps_e_0_0_pl_clk0, LAYERED_METADATA undef, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of s2mm_sts_tvalid : signal is "xilinx.com:interface:axis:1.0 s2mm_sts TVALID";
  attribute X_INTERFACE_INFO of s2mm_sts_tready : signal is "xilinx.com:interface:axis:1.0 s2mm_sts TREADY";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of stub : architecture is "gemm_top_l2,Vivado 2025.2";
begin
end;

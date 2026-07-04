-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
-- Date        : Sat Jul  4 14:48:45 2026
-- Host        : ZUYYYY running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               d:/E/1subject/HK6/doan1/int8-matmul-accelerator/gemm_accelerator/gemm_accelerator.gen/sources_1/bd/gemm_system/ip/gemm_system_gemm_top_l2_0_0/gemm_system_gemm_top_l2_0_0_stub.vhdl
-- Design      : gemm_system_gemm_top_l2_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xck26-sfvc784-2LV-c
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity gemm_system_gemm_top_l2_0_0 is
  Port ( 
    CLK_i : in STD_LOGIC;
    RST_i : in STD_LOGIC;
    cfg_m_total_i : in STD_LOGIC_VECTOR ( 15 downto 0 );
    cfg_n_total_i : in STD_LOGIC_VECTOR ( 15 downto 0 );
    cfg_k_total_i : in STD_LOGIC_VECTOR ( 15 downto 0 );
    cfg_k_dim_i : in STD_LOGIC_VECTOR ( 15 downto 0 );
    cfg_num_k_tiles_per_block_i : in STD_LOGIC_VECTOR ( 15 downto 0 );
    cfg_base_a_i : in STD_LOGIC_VECTOR ( 31 downto 0 );
    cfg_base_b_i : in STD_LOGIC_VECTOR ( 31 downto 0 );
    cfg_base_c_i : in STD_LOGIC_VECTOR ( 31 downto 0 );
    cfg_n_stride_i : in STD_LOGIC_VECTOR ( 15 downto 0 );
    cfg_scale_shift_i : in STD_LOGIC_VECTOR ( 4 downto 0 );
    cfg_zero_point_i : in STD_LOGIC_VECTOR ( 7 downto 0 );
    start_i : in STD_LOGIC;
    busy_o : out STD_LOGIC;
    done_o : out STD_LOGIC;
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
  attribute black_box_pad_pin of stub : architecture is "CLK_i,RST_i,cfg_m_total_i[15:0],cfg_n_total_i[15:0],cfg_k_total_i[15:0],cfg_k_dim_i[15:0],cfg_num_k_tiles_per_block_i[15:0],cfg_base_a_i[31:0],cfg_base_b_i[31:0],cfg_base_c_i[31:0],cfg_n_stride_i[15:0],cfg_scale_shift_i[4:0],cfg_zero_point_i[7:0],start_i,busy_o,done_o,mm2s_cmd_tdata[71:0],mm2s_cmd_tvalid,mm2s_cmd_tready,mm2s_tdata[127:0],mm2s_tvalid,mm2s_tready,mm2s_tlast,s2mm_cmd_tdata[71:0],s2mm_cmd_tvalid,s2mm_cmd_tready,s2mm_tdata[127:0],s2mm_tvalid,s2mm_tready,s2mm_tlast,s2mm_tkeep[15:0],s2mm_sts_tdata[7:0],s2mm_sts_tvalid,s2mm_sts_tready";
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of CLK_i : signal is "xilinx.com:signal:clock:1.0 CLK_i CLK";
  attribute X_INTERFACE_MODE : string;
  attribute X_INTERFACE_MODE of CLK_i : signal is "slave";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of CLK_i : signal is "XIL_INTERFACENAME CLK_i, ASSOCIATED_RESET RST_i, ASSOCIATED_BUSIF mm2s_cmd:mm2s:s2mm_cmd:s2mm:s2mm_sts, FREQ_HZ 142855713, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN gemm_system_zynq_ultra_ps_e_0_0_pl_clk0, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of RST_i : signal is "xilinx.com:signal:reset:1.0 RST_i RST";
  attribute X_INTERFACE_MODE of RST_i : signal is "slave";
  attribute X_INTERFACE_PARAMETER of RST_i : signal is "XIL_INTERFACENAME RST_i, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of mm2s_cmd_tdata : signal is "xilinx.com:interface:axis:1.0 mm2s_cmd TDATA";
  attribute X_INTERFACE_MODE of mm2s_cmd_tdata : signal is "master";
  attribute X_INTERFACE_PARAMETER of mm2s_cmd_tdata : signal is "XIL_INTERFACENAME mm2s_cmd, TDATA_NUM_BYTES 9, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 142855713, PHASE 0.0, CLK_DOMAIN gemm_system_zynq_ultra_ps_e_0_0_pl_clk0, LAYERED_METADATA undef, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of mm2s_cmd_tvalid : signal is "xilinx.com:interface:axis:1.0 mm2s_cmd TVALID";
  attribute X_INTERFACE_INFO of mm2s_cmd_tready : signal is "xilinx.com:interface:axis:1.0 mm2s_cmd TREADY";
  attribute X_INTERFACE_INFO of mm2s_tdata : signal is "xilinx.com:interface:axis:1.0 mm2s TDATA";
  attribute X_INTERFACE_MODE of mm2s_tdata : signal is "slave";
  attribute X_INTERFACE_PARAMETER of mm2s_tdata : signal is "XIL_INTERFACENAME mm2s, TDATA_NUM_BYTES 16, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 142855713, PHASE 0.0, CLK_DOMAIN gemm_system_zynq_ultra_ps_e_0_0_pl_clk0, LAYERED_METADATA undef, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of mm2s_tvalid : signal is "xilinx.com:interface:axis:1.0 mm2s TVALID";
  attribute X_INTERFACE_INFO of mm2s_tready : signal is "xilinx.com:interface:axis:1.0 mm2s TREADY";
  attribute X_INTERFACE_INFO of mm2s_tlast : signal is "xilinx.com:interface:axis:1.0 mm2s TLAST";
  attribute X_INTERFACE_INFO of s2mm_cmd_tdata : signal is "xilinx.com:interface:axis:1.0 s2mm_cmd TDATA";
  attribute X_INTERFACE_MODE of s2mm_cmd_tdata : signal is "master";
  attribute X_INTERFACE_PARAMETER of s2mm_cmd_tdata : signal is "XIL_INTERFACENAME s2mm_cmd, TDATA_NUM_BYTES 9, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 142855713, PHASE 0.0, CLK_DOMAIN gemm_system_zynq_ultra_ps_e_0_0_pl_clk0, LAYERED_METADATA undef, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of s2mm_cmd_tvalid : signal is "xilinx.com:interface:axis:1.0 s2mm_cmd TVALID";
  attribute X_INTERFACE_INFO of s2mm_cmd_tready : signal is "xilinx.com:interface:axis:1.0 s2mm_cmd TREADY";
  attribute X_INTERFACE_INFO of s2mm_tdata : signal is "xilinx.com:interface:axis:1.0 s2mm TDATA";
  attribute X_INTERFACE_MODE of s2mm_tdata : signal is "master";
  attribute X_INTERFACE_PARAMETER of s2mm_tdata : signal is "XIL_INTERFACENAME s2mm, TDATA_NUM_BYTES 16, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 1, HAS_TLAST 1, FREQ_HZ 142855713, PHASE 0.0, CLK_DOMAIN gemm_system_zynq_ultra_ps_e_0_0_pl_clk0, LAYERED_METADATA undef, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of s2mm_tvalid : signal is "xilinx.com:interface:axis:1.0 s2mm TVALID";
  attribute X_INTERFACE_INFO of s2mm_tready : signal is "xilinx.com:interface:axis:1.0 s2mm TREADY";
  attribute X_INTERFACE_INFO of s2mm_tlast : signal is "xilinx.com:interface:axis:1.0 s2mm TLAST";
  attribute X_INTERFACE_INFO of s2mm_tkeep : signal is "xilinx.com:interface:axis:1.0 s2mm TKEEP";
  attribute X_INTERFACE_INFO of s2mm_sts_tdata : signal is "xilinx.com:interface:axis:1.0 s2mm_sts TDATA";
  attribute X_INTERFACE_MODE of s2mm_sts_tdata : signal is "slave";
  attribute X_INTERFACE_PARAMETER of s2mm_sts_tdata : signal is "XIL_INTERFACENAME s2mm_sts, TDATA_NUM_BYTES 1, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 142855713, PHASE 0.0, CLK_DOMAIN gemm_system_zynq_ultra_ps_e_0_0_pl_clk0, LAYERED_METADATA undef, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of s2mm_sts_tvalid : signal is "xilinx.com:interface:axis:1.0 s2mm_sts TVALID";
  attribute X_INTERFACE_INFO of s2mm_sts_tready : signal is "xilinx.com:interface:axis:1.0 s2mm_sts TREADY";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of stub : architecture is "gemm_top_l2,Vivado 2025.2";
begin
end;

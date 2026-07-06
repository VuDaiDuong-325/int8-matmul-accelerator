-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
-- Date        : Sat Jul  4 13:27:15 2026
-- Host        : ZUYYYY running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               d:/E/1subject/HK6/doan1/int8-matmul-accelerator/gemm_accelerator/gemm_accelerator.gen/sources_1/bd/gemm_system/ip/gemm_system_gemm_l2_axi_lite_regs_0_0/gemm_system_gemm_l2_axi_lite_regs_0_0_sim_netlist.vhdl
-- Design      : gemm_system_gemm_l2_axi_lite_regs_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xck26-sfvc784-2LV-c
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity gemm_system_gemm_l2_axi_lite_regs_0_0_gemm_l2_axi_lite_regs is
  port (
    S_AXI_WREADY : out STD_LOGIC;
    S_AXI_ARREADY : out STD_LOGIC;
    cfg_m_total_o : out STD_LOGIC_VECTOR ( 15 downto 0 );
    cfg_n_total_o : out STD_LOGIC_VECTOR ( 15 downto 0 );
    cfg_k_total_o : out STD_LOGIC_VECTOR ( 15 downto 0 );
    cfg_k_dim_o : out STD_LOGIC_VECTOR ( 15 downto 0 );
    cfg_num_k_tiles_per_block_o : out STD_LOGIC_VECTOR ( 15 downto 0 );
    cfg_base_a_o : out STD_LOGIC_VECTOR ( 31 downto 0 );
    cfg_base_b_o : out STD_LOGIC_VECTOR ( 31 downto 0 );
    cfg_base_c_o : out STD_LOGIC_VECTOR ( 31 downto 0 );
    cfg_n_stride_o : out STD_LOGIC_VECTOR ( 15 downto 0 );
    cfg_scale_shift_o : out STD_LOGIC_VECTOR ( 4 downto 0 );
    cfg_zero_point_o : out STD_LOGIC_VECTOR ( 7 downto 0 );
    S_AXI_RDATA : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_RVALID_reg_0 : out STD_LOGIC;
    irq_o : out STD_LOGIC;
    S_AXI_BVALID : out STD_LOGIC;
    start_o : out STD_LOGIC;
    S_AXI_ACLK : in STD_LOGIC;
    S_AXI_ARADDR : in STD_LOGIC_VECTOR ( 5 downto 0 );
    S_AXI_AWADDR : in STD_LOGIC_VECTOR ( 5 downto 0 );
    S_AXI_WDATA : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_ARVALID : in STD_LOGIC;
    S_AXI_ARESETN : in STD_LOGIC;
    S_AXI_WSTRB : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_WVALID : in STD_LOGIC;
    S_AXI_AWVALID : in STD_LOGIC;
    busy_i : in STD_LOGIC;
    S_AXI_BREADY : in STD_LOGIC;
    S_AXI_RREADY : in STD_LOGIC;
    done_i : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of gemm_system_gemm_l2_axi_lite_regs_0_0_gemm_l2_axi_lite_regs : entity is "gemm_l2_axi_lite_regs";
end gemm_system_gemm_l2_axi_lite_regs_0_0_gemm_l2_axi_lite_regs;

architecture STRUCTURE of gemm_system_gemm_l2_axi_lite_regs_0_0_gemm_l2_axi_lite_regs is
  signal \^s_axi_arready\ : STD_LOGIC;
  signal S_AXI_ARREADY0 : STD_LOGIC;
  signal S_AXI_AWREADY0 : STD_LOGIC;
  signal \^s_axi_bvalid\ : STD_LOGIC;
  signal S_AXI_BVALID_i_1_n_0 : STD_LOGIC;
  signal \S_AXI_RDATA[0]_i_1_n_0\ : STD_LOGIC;
  signal \S_AXI_RDATA[0]_i_2_n_0\ : STD_LOGIC;
  signal \S_AXI_RDATA[0]_i_3_n_0\ : STD_LOGIC;
  signal \S_AXI_RDATA[0]_i_4_n_0\ : STD_LOGIC;
  signal \S_AXI_RDATA[10]_i_1_n_0\ : STD_LOGIC;
  signal \S_AXI_RDATA[10]_i_2_n_0\ : STD_LOGIC;
  signal \S_AXI_RDATA[10]_i_3_n_0\ : STD_LOGIC;
  signal \S_AXI_RDATA[11]_i_1_n_0\ : STD_LOGIC;
  signal \S_AXI_RDATA[11]_i_2_n_0\ : STD_LOGIC;
  signal \S_AXI_RDATA[11]_i_3_n_0\ : STD_LOGIC;
  signal \S_AXI_RDATA[12]_i_1_n_0\ : STD_LOGIC;
  signal \S_AXI_RDATA[12]_i_2_n_0\ : STD_LOGIC;
  signal \S_AXI_RDATA[12]_i_3_n_0\ : STD_LOGIC;
  signal \S_AXI_RDATA[13]_i_1_n_0\ : STD_LOGIC;
  signal \S_AXI_RDATA[13]_i_2_n_0\ : STD_LOGIC;
  signal \S_AXI_RDATA[13]_i_3_n_0\ : STD_LOGIC;
  signal \S_AXI_RDATA[14]_i_1_n_0\ : STD_LOGIC;
  signal \S_AXI_RDATA[14]_i_2_n_0\ : STD_LOGIC;
  signal \S_AXI_RDATA[14]_i_3_n_0\ : STD_LOGIC;
  signal \S_AXI_RDATA[15]_i_1_n_0\ : STD_LOGIC;
  signal \S_AXI_RDATA[15]_i_2_n_0\ : STD_LOGIC;
  signal \S_AXI_RDATA[15]_i_3_n_0\ : STD_LOGIC;
  signal \S_AXI_RDATA[15]_i_4_n_0\ : STD_LOGIC;
  signal \S_AXI_RDATA[15]_i_5_n_0\ : STD_LOGIC;
  signal \S_AXI_RDATA[16]_i_1_n_0\ : STD_LOGIC;
  signal \S_AXI_RDATA[17]_i_1_n_0\ : STD_LOGIC;
  signal \S_AXI_RDATA[18]_i_1_n_0\ : STD_LOGIC;
  signal \S_AXI_RDATA[19]_i_1_n_0\ : STD_LOGIC;
  signal \S_AXI_RDATA[1]_i_1_n_0\ : STD_LOGIC;
  signal \S_AXI_RDATA[1]_i_2_n_0\ : STD_LOGIC;
  signal \S_AXI_RDATA[1]_i_3_n_0\ : STD_LOGIC;
  signal \S_AXI_RDATA[1]_i_4_n_0\ : STD_LOGIC;
  signal \S_AXI_RDATA[20]_i_1_n_0\ : STD_LOGIC;
  signal \S_AXI_RDATA[21]_i_1_n_0\ : STD_LOGIC;
  signal \S_AXI_RDATA[22]_i_1_n_0\ : STD_LOGIC;
  signal \S_AXI_RDATA[23]_i_1_n_0\ : STD_LOGIC;
  signal \S_AXI_RDATA[24]_i_1_n_0\ : STD_LOGIC;
  signal \S_AXI_RDATA[25]_i_1_n_0\ : STD_LOGIC;
  signal \S_AXI_RDATA[26]_i_1_n_0\ : STD_LOGIC;
  signal \S_AXI_RDATA[27]_i_1_n_0\ : STD_LOGIC;
  signal \S_AXI_RDATA[28]_i_1_n_0\ : STD_LOGIC;
  signal \S_AXI_RDATA[29]_i_1_n_0\ : STD_LOGIC;
  signal \S_AXI_RDATA[2]_i_1_n_0\ : STD_LOGIC;
  signal \S_AXI_RDATA[2]_i_2_n_0\ : STD_LOGIC;
  signal \S_AXI_RDATA[2]_i_3_n_0\ : STD_LOGIC;
  signal \S_AXI_RDATA[2]_i_4_n_0\ : STD_LOGIC;
  signal \S_AXI_RDATA[30]_i_1_n_0\ : STD_LOGIC;
  signal \S_AXI_RDATA[31]_i_1_n_0\ : STD_LOGIC;
  signal \S_AXI_RDATA[31]_i_2_n_0\ : STD_LOGIC;
  signal \S_AXI_RDATA[31]_i_3_n_0\ : STD_LOGIC;
  signal \S_AXI_RDATA[3]_i_1_n_0\ : STD_LOGIC;
  signal \S_AXI_RDATA[3]_i_2_n_0\ : STD_LOGIC;
  signal \S_AXI_RDATA[3]_i_3_n_0\ : STD_LOGIC;
  signal \S_AXI_RDATA[3]_i_4_n_0\ : STD_LOGIC;
  signal \S_AXI_RDATA[4]_i_1_n_0\ : STD_LOGIC;
  signal \S_AXI_RDATA[4]_i_2_n_0\ : STD_LOGIC;
  signal \S_AXI_RDATA[4]_i_3_n_0\ : STD_LOGIC;
  signal \S_AXI_RDATA[4]_i_4_n_0\ : STD_LOGIC;
  signal \S_AXI_RDATA[5]_i_1_n_0\ : STD_LOGIC;
  signal \S_AXI_RDATA[5]_i_2_n_0\ : STD_LOGIC;
  signal \S_AXI_RDATA[5]_i_3_n_0\ : STD_LOGIC;
  signal \S_AXI_RDATA[5]_i_4_n_0\ : STD_LOGIC;
  signal \S_AXI_RDATA[6]_i_1_n_0\ : STD_LOGIC;
  signal \S_AXI_RDATA[6]_i_2_n_0\ : STD_LOGIC;
  signal \S_AXI_RDATA[6]_i_3_n_0\ : STD_LOGIC;
  signal \S_AXI_RDATA[6]_i_4_n_0\ : STD_LOGIC;
  signal \S_AXI_RDATA[7]_i_1_n_0\ : STD_LOGIC;
  signal \S_AXI_RDATA[7]_i_2_n_0\ : STD_LOGIC;
  signal \S_AXI_RDATA[7]_i_3_n_0\ : STD_LOGIC;
  signal \S_AXI_RDATA[7]_i_4_n_0\ : STD_LOGIC;
  signal \S_AXI_RDATA[8]_i_1_n_0\ : STD_LOGIC;
  signal \S_AXI_RDATA[8]_i_2_n_0\ : STD_LOGIC;
  signal \S_AXI_RDATA[8]_i_3_n_0\ : STD_LOGIC;
  signal \S_AXI_RDATA[9]_i_1_n_0\ : STD_LOGIC;
  signal \S_AXI_RDATA[9]_i_2_n_0\ : STD_LOGIC;
  signal \S_AXI_RDATA[9]_i_3_n_0\ : STD_LOGIC;
  signal S_AXI_RVALID_i_1_n_0 : STD_LOGIC;
  signal \^s_axi_rvalid_reg_0\ : STD_LOGIC;
  signal \^s_axi_wready\ : STD_LOGIC;
  signal \^cfg_base_a_o\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \^cfg_base_b_o\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \^cfg_base_c_o\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \^cfg_k_dim_o\ : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \^cfg_k_total_o\ : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \^cfg_m_total_o\ : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \^cfg_n_stride_o\ : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \^cfg_n_total_o\ : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \^cfg_num_k_tiles_per_block_o\ : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \^cfg_scale_shift_o\ : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal \^cfg_zero_point_o\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal done_sticky_r_i_1_n_0 : STD_LOGIC;
  signal done_sticky_r_i_2_n_0 : STD_LOGIC;
  signal done_sticky_r_i_4_n_0 : STD_LOGIC;
  signal done_sticky_r_i_5_n_0 : STD_LOGIC;
  signal \^irq_o\ : STD_LOGIC;
  signal p_0_in : STD_LOGIC;
  signal p_0_in_0 : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal p_1_in : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal p_2_in : STD_LOGIC;
  signal r_base_a_r : STD_LOGIC_VECTOR ( 0 to 0 );
  signal r_base_b_r : STD_LOGIC_VECTOR ( 0 to 0 );
  signal r_base_c_r : STD_LOGIC_VECTOR ( 0 to 0 );
  signal r_k_dim_r : STD_LOGIC_VECTOR ( 0 to 0 );
  signal r_k_total_r : STD_LOGIC_VECTOR ( 0 to 0 );
  signal r_m_total_r : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \r_m_total_r[15]_i_2_n_0\ : STD_LOGIC;
  signal r_n_stride_r : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \r_n_stride_r[15]_i_2_n_0\ : STD_LOGIC;
  signal r_n_total_r : STD_LOGIC_VECTOR ( 0 to 0 );
  signal r_numkt_r : STD_LOGIC_VECTOR ( 0 to 0 );
  signal r_scale_shift_r : STD_LOGIC_VECTOR ( 0 to 0 );
  signal r_zero_point_r : STD_LOGIC_VECTOR ( 0 to 0 );
  signal start_pulse_r_i_1_n_0 : STD_LOGIC;
  signal start_pulse_r_i_2_n_0 : STD_LOGIC;
  signal start_pulse_r_i_3_n_0 : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \S_AXI_RDATA[15]_i_4\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \S_AXI_RDATA[16]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of S_AXI_RVALID_i_1 : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of done_sticky_r_i_3 : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of done_sticky_r_i_4 : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of start_pulse_r_i_2 : label is "soft_lutpair0";
begin
  S_AXI_ARREADY <= \^s_axi_arready\;
  S_AXI_BVALID <= \^s_axi_bvalid\;
  S_AXI_RVALID_reg_0 <= \^s_axi_rvalid_reg_0\;
  S_AXI_WREADY <= \^s_axi_wready\;
  cfg_base_a_o(31 downto 0) <= \^cfg_base_a_o\(31 downto 0);
  cfg_base_b_o(31 downto 0) <= \^cfg_base_b_o\(31 downto 0);
  cfg_base_c_o(31 downto 0) <= \^cfg_base_c_o\(31 downto 0);
  cfg_k_dim_o(15 downto 0) <= \^cfg_k_dim_o\(15 downto 0);
  cfg_k_total_o(15 downto 0) <= \^cfg_k_total_o\(15 downto 0);
  cfg_m_total_o(15 downto 0) <= \^cfg_m_total_o\(15 downto 0);
  cfg_n_stride_o(15 downto 0) <= \^cfg_n_stride_o\(15 downto 0);
  cfg_n_total_o(15 downto 0) <= \^cfg_n_total_o\(15 downto 0);
  cfg_num_k_tiles_per_block_o(15 downto 0) <= \^cfg_num_k_tiles_per_block_o\(15 downto 0);
  cfg_scale_shift_o(4 downto 0) <= \^cfg_scale_shift_o\(4 downto 0);
  cfg_zero_point_o(7 downto 0) <= \^cfg_zero_point_o\(7 downto 0);
  irq_o <= \^irq_o\;
S_AXI_ARREADY_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => S_AXI_ARVALID,
      I1 => \^s_axi_arready\,
      O => S_AXI_ARREADY0
    );
S_AXI_ARREADY_reg: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => S_AXI_ARREADY0,
      Q => \^s_axi_arready\,
      R => p_0_in
    );
S_AXI_AWREADY_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => S_AXI_ARESETN,
      O => p_0_in
    );
S_AXI_AWREADY_i_2: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => S_AXI_AWVALID,
      I1 => S_AXI_WVALID,
      I2 => \^s_axi_wready\,
      O => S_AXI_AWREADY0
    );
S_AXI_AWREADY_reg: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => S_AXI_AWREADY0,
      Q => \^s_axi_wready\,
      R => p_0_in
    );
S_AXI_BVALID_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"5555C000"
    )
        port map (
      I0 => S_AXI_BREADY,
      I1 => S_AXI_WVALID,
      I2 => S_AXI_AWVALID,
      I3 => \^s_axi_wready\,
      I4 => \^s_axi_bvalid\,
      O => S_AXI_BVALID_i_1_n_0
    );
S_AXI_BVALID_reg: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => S_AXI_BVALID_i_1_n_0,
      Q => \^s_axi_bvalid\,
      R => p_0_in
    );
\S_AXI_RDATA[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00CCF0AA"
    )
        port map (
      I0 => \S_AXI_RDATA[0]_i_2_n_0\,
      I1 => \S_AXI_RDATA[0]_i_3_n_0\,
      I2 => \S_AXI_RDATA[0]_i_4_n_0\,
      I3 => p_0_in_0(2),
      I4 => p_0_in_0(3),
      O => \S_AXI_RDATA[0]_i_1_n_0\
    );
\S_AXI_RDATA[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => \^cfg_n_total_o\(0),
      I1 => \^cfg_k_dim_o\(0),
      I2 => p_0_in_0(0),
      I3 => p_0_in_0(1),
      I4 => \^cfg_m_total_o\(0),
      I5 => \^cfg_k_total_o\(0),
      O => \S_AXI_RDATA[0]_i_2_n_0\
    );
\S_AXI_RDATA[0]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00CCF0AA"
    )
        port map (
      I0 => \^cfg_n_stride_o\(0),
      I1 => \^cfg_zero_point_o\(0),
      I2 => \^cfg_scale_shift_o\(0),
      I3 => p_0_in_0(0),
      I4 => p_0_in_0(1),
      O => \S_AXI_RDATA[0]_i_3_n_0\
    );
\S_AXI_RDATA[0]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => \^cfg_base_a_o\(0),
      I1 => \^cfg_base_c_o\(0),
      I2 => p_0_in_0(0),
      I3 => p_0_in_0(1),
      I4 => \^cfg_num_k_tiles_per_block_o\(0),
      I5 => \^cfg_base_b_o\(0),
      O => \S_AXI_RDATA[0]_i_4_n_0\
    );
\S_AXI_RDATA[10]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000C0C0FF00AAAA"
    )
        port map (
      I0 => \S_AXI_RDATA[10]_i_2_n_0\,
      I1 => \S_AXI_RDATA[15]_i_4_n_0\,
      I2 => \^cfg_n_stride_o\(10),
      I3 => \S_AXI_RDATA[10]_i_3_n_0\,
      I4 => p_0_in_0(2),
      I5 => p_0_in_0(3),
      O => \S_AXI_RDATA[10]_i_1_n_0\
    );
\S_AXI_RDATA[10]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => \^cfg_n_total_o\(10),
      I1 => \^cfg_k_dim_o\(10),
      I2 => p_0_in_0(0),
      I3 => p_0_in_0(1),
      I4 => \^cfg_m_total_o\(10),
      I5 => \^cfg_k_total_o\(10),
      O => \S_AXI_RDATA[10]_i_2_n_0\
    );
\S_AXI_RDATA[10]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => \^cfg_base_a_o\(10),
      I1 => \^cfg_base_c_o\(10),
      I2 => p_0_in_0(0),
      I3 => p_0_in_0(1),
      I4 => \^cfg_num_k_tiles_per_block_o\(10),
      I5 => \^cfg_base_b_o\(10),
      O => \S_AXI_RDATA[10]_i_3_n_0\
    );
\S_AXI_RDATA[11]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000C0C0FF00AAAA"
    )
        port map (
      I0 => \S_AXI_RDATA[11]_i_2_n_0\,
      I1 => \S_AXI_RDATA[15]_i_4_n_0\,
      I2 => \^cfg_n_stride_o\(11),
      I3 => \S_AXI_RDATA[11]_i_3_n_0\,
      I4 => p_0_in_0(2),
      I5 => p_0_in_0(3),
      O => \S_AXI_RDATA[11]_i_1_n_0\
    );
\S_AXI_RDATA[11]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => \^cfg_n_total_o\(11),
      I1 => \^cfg_k_dim_o\(11),
      I2 => p_0_in_0(0),
      I3 => p_0_in_0(1),
      I4 => \^cfg_m_total_o\(11),
      I5 => \^cfg_k_total_o\(11),
      O => \S_AXI_RDATA[11]_i_2_n_0\
    );
\S_AXI_RDATA[11]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => \^cfg_base_a_o\(11),
      I1 => \^cfg_base_c_o\(11),
      I2 => p_0_in_0(0),
      I3 => p_0_in_0(1),
      I4 => \^cfg_num_k_tiles_per_block_o\(11),
      I5 => \^cfg_base_b_o\(11),
      O => \S_AXI_RDATA[11]_i_3_n_0\
    );
\S_AXI_RDATA[12]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000C0C0FF00AAAA"
    )
        port map (
      I0 => \S_AXI_RDATA[12]_i_2_n_0\,
      I1 => \S_AXI_RDATA[15]_i_4_n_0\,
      I2 => \^cfg_n_stride_o\(12),
      I3 => \S_AXI_RDATA[12]_i_3_n_0\,
      I4 => p_0_in_0(2),
      I5 => p_0_in_0(3),
      O => \S_AXI_RDATA[12]_i_1_n_0\
    );
\S_AXI_RDATA[12]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => \^cfg_n_total_o\(12),
      I1 => \^cfg_k_dim_o\(12),
      I2 => p_0_in_0(0),
      I3 => p_0_in_0(1),
      I4 => \^cfg_m_total_o\(12),
      I5 => \^cfg_k_total_o\(12),
      O => \S_AXI_RDATA[12]_i_2_n_0\
    );
\S_AXI_RDATA[12]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => \^cfg_base_a_o\(12),
      I1 => \^cfg_base_c_o\(12),
      I2 => p_0_in_0(0),
      I3 => p_0_in_0(1),
      I4 => \^cfg_num_k_tiles_per_block_o\(12),
      I5 => \^cfg_base_b_o\(12),
      O => \S_AXI_RDATA[12]_i_3_n_0\
    );
\S_AXI_RDATA[13]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000C0C0FF00AAAA"
    )
        port map (
      I0 => \S_AXI_RDATA[13]_i_2_n_0\,
      I1 => \S_AXI_RDATA[15]_i_4_n_0\,
      I2 => \^cfg_n_stride_o\(13),
      I3 => \S_AXI_RDATA[13]_i_3_n_0\,
      I4 => p_0_in_0(2),
      I5 => p_0_in_0(3),
      O => \S_AXI_RDATA[13]_i_1_n_0\
    );
\S_AXI_RDATA[13]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => \^cfg_n_total_o\(13),
      I1 => \^cfg_k_dim_o\(13),
      I2 => p_0_in_0(0),
      I3 => p_0_in_0(1),
      I4 => \^cfg_m_total_o\(13),
      I5 => \^cfg_k_total_o\(13),
      O => \S_AXI_RDATA[13]_i_2_n_0\
    );
\S_AXI_RDATA[13]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => \^cfg_base_a_o\(13),
      I1 => \^cfg_base_c_o\(13),
      I2 => p_0_in_0(0),
      I3 => p_0_in_0(1),
      I4 => \^cfg_num_k_tiles_per_block_o\(13),
      I5 => \^cfg_base_b_o\(13),
      O => \S_AXI_RDATA[13]_i_3_n_0\
    );
\S_AXI_RDATA[14]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000C0C0FF00AAAA"
    )
        port map (
      I0 => \S_AXI_RDATA[14]_i_2_n_0\,
      I1 => \S_AXI_RDATA[15]_i_4_n_0\,
      I2 => \^cfg_n_stride_o\(14),
      I3 => \S_AXI_RDATA[14]_i_3_n_0\,
      I4 => p_0_in_0(2),
      I5 => p_0_in_0(3),
      O => \S_AXI_RDATA[14]_i_1_n_0\
    );
\S_AXI_RDATA[14]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => \^cfg_n_total_o\(14),
      I1 => \^cfg_k_dim_o\(14),
      I2 => p_0_in_0(0),
      I3 => p_0_in_0(1),
      I4 => \^cfg_m_total_o\(14),
      I5 => \^cfg_k_total_o\(14),
      O => \S_AXI_RDATA[14]_i_2_n_0\
    );
\S_AXI_RDATA[14]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => \^cfg_base_a_o\(14),
      I1 => \^cfg_base_c_o\(14),
      I2 => p_0_in_0(0),
      I3 => p_0_in_0(1),
      I4 => \^cfg_num_k_tiles_per_block_o\(14),
      I5 => \^cfg_base_b_o\(14),
      O => \S_AXI_RDATA[14]_i_3_n_0\
    );
\S_AXI_RDATA[15]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000E00000000000"
    )
        port map (
      I0 => p_0_in_0(4),
      I1 => p_0_in_0(5),
      I2 => \^s_axi_arready\,
      I3 => S_AXI_ARVALID,
      I4 => \^s_axi_rvalid_reg_0\,
      I5 => S_AXI_ARESETN,
      O => \S_AXI_RDATA[15]_i_1_n_0\
    );
\S_AXI_RDATA[15]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000C0C0FF00AAAA"
    )
        port map (
      I0 => \S_AXI_RDATA[15]_i_3_n_0\,
      I1 => \S_AXI_RDATA[15]_i_4_n_0\,
      I2 => \^cfg_n_stride_o\(15),
      I3 => \S_AXI_RDATA[15]_i_5_n_0\,
      I4 => p_0_in_0(2),
      I5 => p_0_in_0(3),
      O => \S_AXI_RDATA[15]_i_2_n_0\
    );
\S_AXI_RDATA[15]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => \^cfg_n_total_o\(15),
      I1 => \^cfg_k_dim_o\(15),
      I2 => p_0_in_0(0),
      I3 => p_0_in_0(1),
      I4 => \^cfg_m_total_o\(15),
      I5 => \^cfg_k_total_o\(15),
      O => \S_AXI_RDATA[15]_i_3_n_0\
    );
\S_AXI_RDATA[15]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => p_0_in_0(1),
      I1 => p_0_in_0(0),
      O => \S_AXI_RDATA[15]_i_4_n_0\
    );
\S_AXI_RDATA[15]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => \^cfg_base_a_o\(15),
      I1 => \^cfg_base_c_o\(15),
      I2 => p_0_in_0(0),
      I3 => p_0_in_0(1),
      I4 => \^cfg_num_k_tiles_per_block_o\(15),
      I5 => \^cfg_base_b_o\(15),
      O => \S_AXI_RDATA[15]_i_5_n_0\
    );
\S_AXI_RDATA[16]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F0CCAA00"
    )
        port map (
      I0 => \^cfg_base_b_o\(16),
      I1 => \^cfg_base_a_o\(16),
      I2 => \^cfg_base_c_o\(16),
      I3 => p_0_in_0(1),
      I4 => p_0_in_0(0),
      O => \S_AXI_RDATA[16]_i_1_n_0\
    );
\S_AXI_RDATA[17]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F0CCAA00"
    )
        port map (
      I0 => \^cfg_base_b_o\(17),
      I1 => \^cfg_base_a_o\(17),
      I2 => \^cfg_base_c_o\(17),
      I3 => p_0_in_0(1),
      I4 => p_0_in_0(0),
      O => \S_AXI_RDATA[17]_i_1_n_0\
    );
\S_AXI_RDATA[18]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F0CCAA00"
    )
        port map (
      I0 => \^cfg_base_b_o\(18),
      I1 => \^cfg_base_a_o\(18),
      I2 => \^cfg_base_c_o\(18),
      I3 => p_0_in_0(1),
      I4 => p_0_in_0(0),
      O => \S_AXI_RDATA[18]_i_1_n_0\
    );
\S_AXI_RDATA[19]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F0CCAA00"
    )
        port map (
      I0 => \^cfg_base_b_o\(19),
      I1 => \^cfg_base_a_o\(19),
      I2 => \^cfg_base_c_o\(19),
      I3 => p_0_in_0(1),
      I4 => p_0_in_0(0),
      O => \S_AXI_RDATA[19]_i_1_n_0\
    );
\S_AXI_RDATA[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00CCF0AA"
    )
        port map (
      I0 => \S_AXI_RDATA[1]_i_2_n_0\,
      I1 => \S_AXI_RDATA[1]_i_3_n_0\,
      I2 => \S_AXI_RDATA[1]_i_4_n_0\,
      I3 => p_0_in_0(2),
      I4 => p_0_in_0(3),
      O => \S_AXI_RDATA[1]_i_1_n_0\
    );
\S_AXI_RDATA[1]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => \^cfg_n_total_o\(1),
      I1 => \^cfg_k_dim_o\(1),
      I2 => p_0_in_0(0),
      I3 => p_0_in_0(1),
      I4 => \^cfg_m_total_o\(1),
      I5 => \^cfg_k_total_o\(1),
      O => \S_AXI_RDATA[1]_i_2_n_0\
    );
\S_AXI_RDATA[1]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => \^cfg_scale_shift_o\(1),
      I1 => busy_i,
      I2 => p_0_in_0(0),
      I3 => p_0_in_0(1),
      I4 => \^cfg_n_stride_o\(1),
      I5 => \^cfg_zero_point_o\(1),
      O => \S_AXI_RDATA[1]_i_3_n_0\
    );
\S_AXI_RDATA[1]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => \^cfg_base_a_o\(1),
      I1 => \^cfg_base_c_o\(1),
      I2 => p_0_in_0(0),
      I3 => p_0_in_0(1),
      I4 => \^cfg_num_k_tiles_per_block_o\(1),
      I5 => \^cfg_base_b_o\(1),
      O => \S_AXI_RDATA[1]_i_4_n_0\
    );
\S_AXI_RDATA[20]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F0CCAA00"
    )
        port map (
      I0 => \^cfg_base_b_o\(20),
      I1 => \^cfg_base_a_o\(20),
      I2 => \^cfg_base_c_o\(20),
      I3 => p_0_in_0(1),
      I4 => p_0_in_0(0),
      O => \S_AXI_RDATA[20]_i_1_n_0\
    );
\S_AXI_RDATA[21]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F0CCAA00"
    )
        port map (
      I0 => \^cfg_base_b_o\(21),
      I1 => \^cfg_base_a_o\(21),
      I2 => \^cfg_base_c_o\(21),
      I3 => p_0_in_0(1),
      I4 => p_0_in_0(0),
      O => \S_AXI_RDATA[21]_i_1_n_0\
    );
\S_AXI_RDATA[22]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F0CCAA00"
    )
        port map (
      I0 => \^cfg_base_b_o\(22),
      I1 => \^cfg_base_a_o\(22),
      I2 => \^cfg_base_c_o\(22),
      I3 => p_0_in_0(1),
      I4 => p_0_in_0(0),
      O => \S_AXI_RDATA[22]_i_1_n_0\
    );
\S_AXI_RDATA[23]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F0CCAA00"
    )
        port map (
      I0 => \^cfg_base_b_o\(23),
      I1 => \^cfg_base_a_o\(23),
      I2 => \^cfg_base_c_o\(23),
      I3 => p_0_in_0(1),
      I4 => p_0_in_0(0),
      O => \S_AXI_RDATA[23]_i_1_n_0\
    );
\S_AXI_RDATA[24]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F0CCAA00"
    )
        port map (
      I0 => \^cfg_base_b_o\(24),
      I1 => \^cfg_base_a_o\(24),
      I2 => \^cfg_base_c_o\(24),
      I3 => p_0_in_0(1),
      I4 => p_0_in_0(0),
      O => \S_AXI_RDATA[24]_i_1_n_0\
    );
\S_AXI_RDATA[25]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F0CCAA00"
    )
        port map (
      I0 => \^cfg_base_b_o\(25),
      I1 => \^cfg_base_a_o\(25),
      I2 => \^cfg_base_c_o\(25),
      I3 => p_0_in_0(1),
      I4 => p_0_in_0(0),
      O => \S_AXI_RDATA[25]_i_1_n_0\
    );
\S_AXI_RDATA[26]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F0CCAA00"
    )
        port map (
      I0 => \^cfg_base_b_o\(26),
      I1 => \^cfg_base_a_o\(26),
      I2 => \^cfg_base_c_o\(26),
      I3 => p_0_in_0(1),
      I4 => p_0_in_0(0),
      O => \S_AXI_RDATA[26]_i_1_n_0\
    );
\S_AXI_RDATA[27]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F0CCAA00"
    )
        port map (
      I0 => \^cfg_base_b_o\(27),
      I1 => \^cfg_base_a_o\(27),
      I2 => \^cfg_base_c_o\(27),
      I3 => p_0_in_0(1),
      I4 => p_0_in_0(0),
      O => \S_AXI_RDATA[27]_i_1_n_0\
    );
\S_AXI_RDATA[28]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F0CCAA00"
    )
        port map (
      I0 => \^cfg_base_b_o\(28),
      I1 => \^cfg_base_a_o\(28),
      I2 => \^cfg_base_c_o\(28),
      I3 => p_0_in_0(1),
      I4 => p_0_in_0(0),
      O => \S_AXI_RDATA[28]_i_1_n_0\
    );
\S_AXI_RDATA[29]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F0CCAA00"
    )
        port map (
      I0 => \^cfg_base_b_o\(29),
      I1 => \^cfg_base_a_o\(29),
      I2 => \^cfg_base_c_o\(29),
      I3 => p_0_in_0(1),
      I4 => p_0_in_0(0),
      O => \S_AXI_RDATA[29]_i_1_n_0\
    );
\S_AXI_RDATA[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00CCF0AA"
    )
        port map (
      I0 => \S_AXI_RDATA[2]_i_2_n_0\,
      I1 => \S_AXI_RDATA[2]_i_3_n_0\,
      I2 => \S_AXI_RDATA[2]_i_4_n_0\,
      I3 => p_0_in_0(2),
      I4 => p_0_in_0(3),
      O => \S_AXI_RDATA[2]_i_1_n_0\
    );
\S_AXI_RDATA[2]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => \^cfg_n_total_o\(2),
      I1 => \^cfg_k_dim_o\(2),
      I2 => p_0_in_0(0),
      I3 => p_0_in_0(1),
      I4 => \^cfg_m_total_o\(2),
      I5 => \^cfg_k_total_o\(2),
      O => \S_AXI_RDATA[2]_i_2_n_0\
    );
\S_AXI_RDATA[2]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => \^cfg_scale_shift_o\(2),
      I1 => \^irq_o\,
      I2 => p_0_in_0(0),
      I3 => p_0_in_0(1),
      I4 => \^cfg_n_stride_o\(2),
      I5 => \^cfg_zero_point_o\(2),
      O => \S_AXI_RDATA[2]_i_3_n_0\
    );
\S_AXI_RDATA[2]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => \^cfg_base_a_o\(2),
      I1 => \^cfg_base_c_o\(2),
      I2 => p_0_in_0(0),
      I3 => p_0_in_0(1),
      I4 => \^cfg_num_k_tiles_per_block_o\(2),
      I5 => \^cfg_base_b_o\(2),
      O => \S_AXI_RDATA[2]_i_4_n_0\
    );
\S_AXI_RDATA[30]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F0CCAA00"
    )
        port map (
      I0 => \^cfg_base_b_o\(30),
      I1 => \^cfg_base_a_o\(30),
      I2 => \^cfg_base_c_o\(30),
      I3 => p_0_in_0(1),
      I4 => p_0_in_0(0),
      O => \S_AXI_RDATA[30]_i_1_n_0\
    );
\S_AXI_RDATA[31]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAA8AA"
    )
        port map (
      I0 => \S_AXI_RDATA[31]_i_2_n_0\,
      I1 => p_0_in_0(5),
      I2 => p_0_in_0(4),
      I3 => p_0_in_0(2),
      I4 => p_0_in_0(3),
      O => \S_AXI_RDATA[31]_i_1_n_0\
    );
\S_AXI_RDATA[31]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2000"
    )
        port map (
      I0 => S_AXI_ARESETN,
      I1 => \^s_axi_rvalid_reg_0\,
      I2 => S_AXI_ARVALID,
      I3 => \^s_axi_arready\,
      O => \S_AXI_RDATA[31]_i_2_n_0\
    );
\S_AXI_RDATA[31]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F0CCAA00"
    )
        port map (
      I0 => \^cfg_base_b_o\(31),
      I1 => \^cfg_base_a_o\(31),
      I2 => \^cfg_base_c_o\(31),
      I3 => p_0_in_0(1),
      I4 => p_0_in_0(0),
      O => \S_AXI_RDATA[31]_i_3_n_0\
    );
\S_AXI_RDATA[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00CCF0AA"
    )
        port map (
      I0 => \S_AXI_RDATA[3]_i_2_n_0\,
      I1 => \S_AXI_RDATA[3]_i_3_n_0\,
      I2 => \S_AXI_RDATA[3]_i_4_n_0\,
      I3 => p_0_in_0(2),
      I4 => p_0_in_0(3),
      O => \S_AXI_RDATA[3]_i_1_n_0\
    );
\S_AXI_RDATA[3]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => \^cfg_n_total_o\(3),
      I1 => \^cfg_k_dim_o\(3),
      I2 => p_0_in_0(0),
      I3 => p_0_in_0(1),
      I4 => \^cfg_m_total_o\(3),
      I5 => \^cfg_k_total_o\(3),
      O => \S_AXI_RDATA[3]_i_2_n_0\
    );
\S_AXI_RDATA[3]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00CCF0AA"
    )
        port map (
      I0 => \^cfg_n_stride_o\(3),
      I1 => \^cfg_zero_point_o\(3),
      I2 => \^cfg_scale_shift_o\(3),
      I3 => p_0_in_0(0),
      I4 => p_0_in_0(1),
      O => \S_AXI_RDATA[3]_i_3_n_0\
    );
\S_AXI_RDATA[3]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => \^cfg_base_a_o\(3),
      I1 => \^cfg_base_c_o\(3),
      I2 => p_0_in_0(0),
      I3 => p_0_in_0(1),
      I4 => \^cfg_num_k_tiles_per_block_o\(3),
      I5 => \^cfg_base_b_o\(3),
      O => \S_AXI_RDATA[3]_i_4_n_0\
    );
\S_AXI_RDATA[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00CCF0AA"
    )
        port map (
      I0 => \S_AXI_RDATA[4]_i_2_n_0\,
      I1 => \S_AXI_RDATA[4]_i_3_n_0\,
      I2 => \S_AXI_RDATA[4]_i_4_n_0\,
      I3 => p_0_in_0(2),
      I4 => p_0_in_0(3),
      O => \S_AXI_RDATA[4]_i_1_n_0\
    );
\S_AXI_RDATA[4]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => \^cfg_n_total_o\(4),
      I1 => \^cfg_k_dim_o\(4),
      I2 => p_0_in_0(0),
      I3 => p_0_in_0(1),
      I4 => \^cfg_m_total_o\(4),
      I5 => \^cfg_k_total_o\(4),
      O => \S_AXI_RDATA[4]_i_2_n_0\
    );
\S_AXI_RDATA[4]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00CCF0AA"
    )
        port map (
      I0 => \^cfg_n_stride_o\(4),
      I1 => \^cfg_zero_point_o\(4),
      I2 => \^cfg_scale_shift_o\(4),
      I3 => p_0_in_0(0),
      I4 => p_0_in_0(1),
      O => \S_AXI_RDATA[4]_i_3_n_0\
    );
\S_AXI_RDATA[4]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => \^cfg_base_a_o\(4),
      I1 => \^cfg_base_c_o\(4),
      I2 => p_0_in_0(0),
      I3 => p_0_in_0(1),
      I4 => \^cfg_num_k_tiles_per_block_o\(4),
      I5 => \^cfg_base_b_o\(4),
      O => \S_AXI_RDATA[4]_i_4_n_0\
    );
\S_AXI_RDATA[5]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BBBAABAA"
    )
        port map (
      I0 => \S_AXI_RDATA[5]_i_2_n_0\,
      I1 => p_0_in_0(3),
      I2 => p_0_in_0(2),
      I3 => \S_AXI_RDATA[5]_i_3_n_0\,
      I4 => \S_AXI_RDATA[5]_i_4_n_0\,
      O => \S_AXI_RDATA[5]_i_1_n_0\
    );
\S_AXI_RDATA[5]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000A0000000C00"
    )
        port map (
      I0 => \^cfg_zero_point_o\(5),
      I1 => \^cfg_n_stride_o\(5),
      I2 => p_0_in_0(2),
      I3 => p_0_in_0(3),
      I4 => p_0_in_0(0),
      I5 => p_0_in_0(1),
      O => \S_AXI_RDATA[5]_i_2_n_0\
    );
\S_AXI_RDATA[5]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => \^cfg_n_total_o\(5),
      I1 => \^cfg_k_dim_o\(5),
      I2 => p_0_in_0(0),
      I3 => p_0_in_0(1),
      I4 => \^cfg_m_total_o\(5),
      I5 => \^cfg_k_total_o\(5),
      O => \S_AXI_RDATA[5]_i_3_n_0\
    );
\S_AXI_RDATA[5]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => \^cfg_base_a_o\(5),
      I1 => \^cfg_base_c_o\(5),
      I2 => p_0_in_0(0),
      I3 => p_0_in_0(1),
      I4 => \^cfg_num_k_tiles_per_block_o\(5),
      I5 => \^cfg_base_b_o\(5),
      O => \S_AXI_RDATA[5]_i_4_n_0\
    );
\S_AXI_RDATA[6]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BBBAABAA"
    )
        port map (
      I0 => \S_AXI_RDATA[6]_i_2_n_0\,
      I1 => p_0_in_0(3),
      I2 => p_0_in_0(2),
      I3 => \S_AXI_RDATA[6]_i_3_n_0\,
      I4 => \S_AXI_RDATA[6]_i_4_n_0\,
      O => \S_AXI_RDATA[6]_i_1_n_0\
    );
\S_AXI_RDATA[6]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000A0000000C00"
    )
        port map (
      I0 => \^cfg_zero_point_o\(6),
      I1 => \^cfg_n_stride_o\(6),
      I2 => p_0_in_0(2),
      I3 => p_0_in_0(3),
      I4 => p_0_in_0(0),
      I5 => p_0_in_0(1),
      O => \S_AXI_RDATA[6]_i_2_n_0\
    );
\S_AXI_RDATA[6]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => \^cfg_n_total_o\(6),
      I1 => \^cfg_k_dim_o\(6),
      I2 => p_0_in_0(0),
      I3 => p_0_in_0(1),
      I4 => \^cfg_m_total_o\(6),
      I5 => \^cfg_k_total_o\(6),
      O => \S_AXI_RDATA[6]_i_3_n_0\
    );
\S_AXI_RDATA[6]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => \^cfg_base_a_o\(6),
      I1 => \^cfg_base_c_o\(6),
      I2 => p_0_in_0(0),
      I3 => p_0_in_0(1),
      I4 => \^cfg_num_k_tiles_per_block_o\(6),
      I5 => \^cfg_base_b_o\(6),
      O => \S_AXI_RDATA[6]_i_4_n_0\
    );
\S_AXI_RDATA[7]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BBBAABAA"
    )
        port map (
      I0 => \S_AXI_RDATA[7]_i_2_n_0\,
      I1 => p_0_in_0(3),
      I2 => p_0_in_0(2),
      I3 => \S_AXI_RDATA[7]_i_3_n_0\,
      I4 => \S_AXI_RDATA[7]_i_4_n_0\,
      O => \S_AXI_RDATA[7]_i_1_n_0\
    );
\S_AXI_RDATA[7]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000A0000000C00"
    )
        port map (
      I0 => \^cfg_zero_point_o\(7),
      I1 => \^cfg_n_stride_o\(7),
      I2 => p_0_in_0(2),
      I3 => p_0_in_0(3),
      I4 => p_0_in_0(0),
      I5 => p_0_in_0(1),
      O => \S_AXI_RDATA[7]_i_2_n_0\
    );
\S_AXI_RDATA[7]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => \^cfg_n_total_o\(7),
      I1 => \^cfg_k_dim_o\(7),
      I2 => p_0_in_0(0),
      I3 => p_0_in_0(1),
      I4 => \^cfg_m_total_o\(7),
      I5 => \^cfg_k_total_o\(7),
      O => \S_AXI_RDATA[7]_i_3_n_0\
    );
\S_AXI_RDATA[7]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => \^cfg_base_a_o\(7),
      I1 => \^cfg_base_c_o\(7),
      I2 => p_0_in_0(0),
      I3 => p_0_in_0(1),
      I4 => \^cfg_num_k_tiles_per_block_o\(7),
      I5 => \^cfg_base_b_o\(7),
      O => \S_AXI_RDATA[7]_i_4_n_0\
    );
\S_AXI_RDATA[8]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000C0C0FF00AAAA"
    )
        port map (
      I0 => \S_AXI_RDATA[8]_i_2_n_0\,
      I1 => \S_AXI_RDATA[15]_i_4_n_0\,
      I2 => \^cfg_n_stride_o\(8),
      I3 => \S_AXI_RDATA[8]_i_3_n_0\,
      I4 => p_0_in_0(2),
      I5 => p_0_in_0(3),
      O => \S_AXI_RDATA[8]_i_1_n_0\
    );
\S_AXI_RDATA[8]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => \^cfg_n_total_o\(8),
      I1 => \^cfg_k_dim_o\(8),
      I2 => p_0_in_0(0),
      I3 => p_0_in_0(1),
      I4 => \^cfg_m_total_o\(8),
      I5 => \^cfg_k_total_o\(8),
      O => \S_AXI_RDATA[8]_i_2_n_0\
    );
\S_AXI_RDATA[8]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => \^cfg_base_a_o\(8),
      I1 => \^cfg_base_c_o\(8),
      I2 => p_0_in_0(0),
      I3 => p_0_in_0(1),
      I4 => \^cfg_num_k_tiles_per_block_o\(8),
      I5 => \^cfg_base_b_o\(8),
      O => \S_AXI_RDATA[8]_i_3_n_0\
    );
\S_AXI_RDATA[9]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000C0C0FF00AAAA"
    )
        port map (
      I0 => \S_AXI_RDATA[9]_i_2_n_0\,
      I1 => \S_AXI_RDATA[15]_i_4_n_0\,
      I2 => \^cfg_n_stride_o\(9),
      I3 => \S_AXI_RDATA[9]_i_3_n_0\,
      I4 => p_0_in_0(2),
      I5 => p_0_in_0(3),
      O => \S_AXI_RDATA[9]_i_1_n_0\
    );
\S_AXI_RDATA[9]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => \^cfg_n_total_o\(9),
      I1 => \^cfg_k_dim_o\(9),
      I2 => p_0_in_0(0),
      I3 => p_0_in_0(1),
      I4 => \^cfg_m_total_o\(9),
      I5 => \^cfg_k_total_o\(9),
      O => \S_AXI_RDATA[9]_i_2_n_0\
    );
\S_AXI_RDATA[9]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => \^cfg_base_a_o\(9),
      I1 => \^cfg_base_c_o\(9),
      I2 => p_0_in_0(0),
      I3 => p_0_in_0(1),
      I4 => \^cfg_num_k_tiles_per_block_o\(9),
      I5 => \^cfg_base_b_o\(9),
      O => \S_AXI_RDATA[9]_i_3_n_0\
    );
\S_AXI_RDATA_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => \S_AXI_RDATA[31]_i_2_n_0\,
      D => \S_AXI_RDATA[0]_i_1_n_0\,
      Q => S_AXI_RDATA(0),
      R => \S_AXI_RDATA[15]_i_1_n_0\
    );
\S_AXI_RDATA_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => \S_AXI_RDATA[31]_i_2_n_0\,
      D => \S_AXI_RDATA[10]_i_1_n_0\,
      Q => S_AXI_RDATA(10),
      R => \S_AXI_RDATA[15]_i_1_n_0\
    );
\S_AXI_RDATA_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => \S_AXI_RDATA[31]_i_2_n_0\,
      D => \S_AXI_RDATA[11]_i_1_n_0\,
      Q => S_AXI_RDATA(11),
      R => \S_AXI_RDATA[15]_i_1_n_0\
    );
\S_AXI_RDATA_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => \S_AXI_RDATA[31]_i_2_n_0\,
      D => \S_AXI_RDATA[12]_i_1_n_0\,
      Q => S_AXI_RDATA(12),
      R => \S_AXI_RDATA[15]_i_1_n_0\
    );
\S_AXI_RDATA_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => \S_AXI_RDATA[31]_i_2_n_0\,
      D => \S_AXI_RDATA[13]_i_1_n_0\,
      Q => S_AXI_RDATA(13),
      R => \S_AXI_RDATA[15]_i_1_n_0\
    );
\S_AXI_RDATA_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => \S_AXI_RDATA[31]_i_2_n_0\,
      D => \S_AXI_RDATA[14]_i_1_n_0\,
      Q => S_AXI_RDATA(14),
      R => \S_AXI_RDATA[15]_i_1_n_0\
    );
\S_AXI_RDATA_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => \S_AXI_RDATA[31]_i_2_n_0\,
      D => \S_AXI_RDATA[15]_i_2_n_0\,
      Q => S_AXI_RDATA(15),
      R => \S_AXI_RDATA[15]_i_1_n_0\
    );
\S_AXI_RDATA_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => \S_AXI_RDATA[31]_i_2_n_0\,
      D => \S_AXI_RDATA[16]_i_1_n_0\,
      Q => S_AXI_RDATA(16),
      R => \S_AXI_RDATA[31]_i_1_n_0\
    );
\S_AXI_RDATA_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => \S_AXI_RDATA[31]_i_2_n_0\,
      D => \S_AXI_RDATA[17]_i_1_n_0\,
      Q => S_AXI_RDATA(17),
      R => \S_AXI_RDATA[31]_i_1_n_0\
    );
\S_AXI_RDATA_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => \S_AXI_RDATA[31]_i_2_n_0\,
      D => \S_AXI_RDATA[18]_i_1_n_0\,
      Q => S_AXI_RDATA(18),
      R => \S_AXI_RDATA[31]_i_1_n_0\
    );
\S_AXI_RDATA_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => \S_AXI_RDATA[31]_i_2_n_0\,
      D => \S_AXI_RDATA[19]_i_1_n_0\,
      Q => S_AXI_RDATA(19),
      R => \S_AXI_RDATA[31]_i_1_n_0\
    );
\S_AXI_RDATA_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => \S_AXI_RDATA[31]_i_2_n_0\,
      D => \S_AXI_RDATA[1]_i_1_n_0\,
      Q => S_AXI_RDATA(1),
      R => \S_AXI_RDATA[15]_i_1_n_0\
    );
\S_AXI_RDATA_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => \S_AXI_RDATA[31]_i_2_n_0\,
      D => \S_AXI_RDATA[20]_i_1_n_0\,
      Q => S_AXI_RDATA(20),
      R => \S_AXI_RDATA[31]_i_1_n_0\
    );
\S_AXI_RDATA_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => \S_AXI_RDATA[31]_i_2_n_0\,
      D => \S_AXI_RDATA[21]_i_1_n_0\,
      Q => S_AXI_RDATA(21),
      R => \S_AXI_RDATA[31]_i_1_n_0\
    );
\S_AXI_RDATA_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => \S_AXI_RDATA[31]_i_2_n_0\,
      D => \S_AXI_RDATA[22]_i_1_n_0\,
      Q => S_AXI_RDATA(22),
      R => \S_AXI_RDATA[31]_i_1_n_0\
    );
\S_AXI_RDATA_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => \S_AXI_RDATA[31]_i_2_n_0\,
      D => \S_AXI_RDATA[23]_i_1_n_0\,
      Q => S_AXI_RDATA(23),
      R => \S_AXI_RDATA[31]_i_1_n_0\
    );
\S_AXI_RDATA_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => \S_AXI_RDATA[31]_i_2_n_0\,
      D => \S_AXI_RDATA[24]_i_1_n_0\,
      Q => S_AXI_RDATA(24),
      R => \S_AXI_RDATA[31]_i_1_n_0\
    );
\S_AXI_RDATA_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => \S_AXI_RDATA[31]_i_2_n_0\,
      D => \S_AXI_RDATA[25]_i_1_n_0\,
      Q => S_AXI_RDATA(25),
      R => \S_AXI_RDATA[31]_i_1_n_0\
    );
\S_AXI_RDATA_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => \S_AXI_RDATA[31]_i_2_n_0\,
      D => \S_AXI_RDATA[26]_i_1_n_0\,
      Q => S_AXI_RDATA(26),
      R => \S_AXI_RDATA[31]_i_1_n_0\
    );
\S_AXI_RDATA_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => \S_AXI_RDATA[31]_i_2_n_0\,
      D => \S_AXI_RDATA[27]_i_1_n_0\,
      Q => S_AXI_RDATA(27),
      R => \S_AXI_RDATA[31]_i_1_n_0\
    );
\S_AXI_RDATA_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => \S_AXI_RDATA[31]_i_2_n_0\,
      D => \S_AXI_RDATA[28]_i_1_n_0\,
      Q => S_AXI_RDATA(28),
      R => \S_AXI_RDATA[31]_i_1_n_0\
    );
\S_AXI_RDATA_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => \S_AXI_RDATA[31]_i_2_n_0\,
      D => \S_AXI_RDATA[29]_i_1_n_0\,
      Q => S_AXI_RDATA(29),
      R => \S_AXI_RDATA[31]_i_1_n_0\
    );
\S_AXI_RDATA_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => \S_AXI_RDATA[31]_i_2_n_0\,
      D => \S_AXI_RDATA[2]_i_1_n_0\,
      Q => S_AXI_RDATA(2),
      R => \S_AXI_RDATA[15]_i_1_n_0\
    );
\S_AXI_RDATA_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => \S_AXI_RDATA[31]_i_2_n_0\,
      D => \S_AXI_RDATA[30]_i_1_n_0\,
      Q => S_AXI_RDATA(30),
      R => \S_AXI_RDATA[31]_i_1_n_0\
    );
\S_AXI_RDATA_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => \S_AXI_RDATA[31]_i_2_n_0\,
      D => \S_AXI_RDATA[31]_i_3_n_0\,
      Q => S_AXI_RDATA(31),
      R => \S_AXI_RDATA[31]_i_1_n_0\
    );
\S_AXI_RDATA_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => \S_AXI_RDATA[31]_i_2_n_0\,
      D => \S_AXI_RDATA[3]_i_1_n_0\,
      Q => S_AXI_RDATA(3),
      R => \S_AXI_RDATA[15]_i_1_n_0\
    );
\S_AXI_RDATA_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => \S_AXI_RDATA[31]_i_2_n_0\,
      D => \S_AXI_RDATA[4]_i_1_n_0\,
      Q => S_AXI_RDATA(4),
      R => \S_AXI_RDATA[15]_i_1_n_0\
    );
\S_AXI_RDATA_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => \S_AXI_RDATA[31]_i_2_n_0\,
      D => \S_AXI_RDATA[5]_i_1_n_0\,
      Q => S_AXI_RDATA(5),
      R => \S_AXI_RDATA[15]_i_1_n_0\
    );
\S_AXI_RDATA_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => \S_AXI_RDATA[31]_i_2_n_0\,
      D => \S_AXI_RDATA[6]_i_1_n_0\,
      Q => S_AXI_RDATA(6),
      R => \S_AXI_RDATA[15]_i_1_n_0\
    );
\S_AXI_RDATA_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => \S_AXI_RDATA[31]_i_2_n_0\,
      D => \S_AXI_RDATA[7]_i_1_n_0\,
      Q => S_AXI_RDATA(7),
      R => \S_AXI_RDATA[15]_i_1_n_0\
    );
\S_AXI_RDATA_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => \S_AXI_RDATA[31]_i_2_n_0\,
      D => \S_AXI_RDATA[8]_i_1_n_0\,
      Q => S_AXI_RDATA(8),
      R => \S_AXI_RDATA[15]_i_1_n_0\
    );
\S_AXI_RDATA_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => \S_AXI_RDATA[31]_i_2_n_0\,
      D => \S_AXI_RDATA[9]_i_1_n_0\,
      Q => S_AXI_RDATA(9),
      R => \S_AXI_RDATA[15]_i_1_n_0\
    );
S_AXI_RVALID_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7444"
    )
        port map (
      I0 => S_AXI_RREADY,
      I1 => \^s_axi_rvalid_reg_0\,
      I2 => S_AXI_ARVALID,
      I3 => \^s_axi_arready\,
      O => S_AXI_RVALID_i_1_n_0
    );
S_AXI_RVALID_reg: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => S_AXI_RVALID_i_1_n_0,
      Q => \^s_axi_rvalid_reg_0\,
      R => p_0_in
    );
\axi_araddr_r_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => S_AXI_ARREADY0,
      D => S_AXI_ARADDR(0),
      Q => p_0_in_0(0),
      R => p_0_in
    );
\axi_araddr_r_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => S_AXI_ARREADY0,
      D => S_AXI_ARADDR(1),
      Q => p_0_in_0(1),
      R => p_0_in
    );
\axi_araddr_r_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => S_AXI_ARREADY0,
      D => S_AXI_ARADDR(2),
      Q => p_0_in_0(2),
      R => p_0_in
    );
\axi_araddr_r_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => S_AXI_ARREADY0,
      D => S_AXI_ARADDR(3),
      Q => p_0_in_0(3),
      R => p_0_in
    );
\axi_araddr_r_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => S_AXI_ARREADY0,
      D => S_AXI_ARADDR(4),
      Q => p_0_in_0(4),
      R => p_0_in
    );
\axi_araddr_r_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => S_AXI_ARREADY0,
      D => S_AXI_ARADDR(5),
      Q => p_0_in_0(5),
      R => p_0_in
    );
\axi_awaddr_r_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => S_AXI_AWREADY0,
      D => S_AXI_AWADDR(0),
      Q => p_1_in(0),
      R => p_0_in
    );
\axi_awaddr_r_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => S_AXI_AWREADY0,
      D => S_AXI_AWADDR(1),
      Q => p_1_in(1),
      R => p_0_in
    );
\axi_awaddr_r_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => S_AXI_AWREADY0,
      D => S_AXI_AWADDR(2),
      Q => p_1_in(2),
      R => p_0_in
    );
\axi_awaddr_r_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => S_AXI_AWREADY0,
      D => S_AXI_AWADDR(3),
      Q => p_1_in(3),
      R => p_0_in
    );
\axi_awaddr_r_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => S_AXI_AWREADY0,
      D => S_AXI_AWADDR(4),
      Q => p_1_in(4),
      R => p_0_in
    );
\axi_awaddr_r_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => S_AXI_AWREADY0,
      D => S_AXI_AWADDR(5),
      Q => p_1_in(5),
      R => p_0_in
    );
done_sticky_r_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AABFBFBFAAAAAAAA"
    )
        port map (
      I0 => done_i,
      I1 => done_sticky_r_i_2_n_0,
      I2 => p_2_in,
      I3 => done_sticky_r_i_4_n_0,
      I4 => done_sticky_r_i_5_n_0,
      I5 => \^irq_o\,
      O => done_sticky_r_i_1_n_0
    );
done_sticky_r_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000100000000000"
    )
        port map (
      I0 => p_0_in_0(5),
      I1 => p_0_in_0(4),
      I2 => p_0_in_0(1),
      I3 => p_0_in_0(0),
      I4 => p_0_in_0(2),
      I5 => p_0_in_0(3),
      O => done_sticky_r_i_2_n_0
    );
done_sticky_r_i_3: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => \^s_axi_arready\,
      I1 => S_AXI_ARVALID,
      I2 => \^s_axi_rvalid_reg_0\,
      O => p_2_in
    );
done_sticky_r_i_4: unisim.vcomponents.LUT5
    generic map(
      INIT => X"04000000"
    )
        port map (
      I0 => p_1_in(4),
      I1 => S_AXI_WDATA(0),
      I2 => p_1_in(5),
      I3 => p_1_in(0),
      I4 => p_1_in(1),
      O => done_sticky_r_i_4_n_0
    );
done_sticky_r_i_5: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4000000000000000"
    )
        port map (
      I0 => p_1_in(2),
      I1 => S_AXI_WSTRB(0),
      I2 => p_1_in(3),
      I3 => S_AXI_WVALID,
      I4 => S_AXI_AWVALID,
      I5 => \^s_axi_wready\,
      O => done_sticky_r_i_5_n_0
    );
done_sticky_r_reg: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => done_sticky_r_i_1_n_0,
      Q => \^irq_o\,
      R => p_0_in
    );
\r_base_a_r[31]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4000"
    )
        port map (
      I0 => p_1_in(1),
      I1 => p_1_in(0),
      I2 => p_1_in(2),
      I3 => \r_m_total_r[15]_i_2_n_0\,
      O => r_base_a_r(0)
    );
\r_base_a_r_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_base_a_r(0),
      D => S_AXI_WDATA(0),
      Q => \^cfg_base_a_o\(0),
      R => p_0_in
    );
\r_base_a_r_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_base_a_r(0),
      D => S_AXI_WDATA(10),
      Q => \^cfg_base_a_o\(10),
      R => p_0_in
    );
\r_base_a_r_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_base_a_r(0),
      D => S_AXI_WDATA(11),
      Q => \^cfg_base_a_o\(11),
      R => p_0_in
    );
\r_base_a_r_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_base_a_r(0),
      D => S_AXI_WDATA(12),
      Q => \^cfg_base_a_o\(12),
      R => p_0_in
    );
\r_base_a_r_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_base_a_r(0),
      D => S_AXI_WDATA(13),
      Q => \^cfg_base_a_o\(13),
      R => p_0_in
    );
\r_base_a_r_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_base_a_r(0),
      D => S_AXI_WDATA(14),
      Q => \^cfg_base_a_o\(14),
      R => p_0_in
    );
\r_base_a_r_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_base_a_r(0),
      D => S_AXI_WDATA(15),
      Q => \^cfg_base_a_o\(15),
      R => p_0_in
    );
\r_base_a_r_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_base_a_r(0),
      D => S_AXI_WDATA(16),
      Q => \^cfg_base_a_o\(16),
      R => p_0_in
    );
\r_base_a_r_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_base_a_r(0),
      D => S_AXI_WDATA(17),
      Q => \^cfg_base_a_o\(17),
      R => p_0_in
    );
\r_base_a_r_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_base_a_r(0),
      D => S_AXI_WDATA(18),
      Q => \^cfg_base_a_o\(18),
      R => p_0_in
    );
\r_base_a_r_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_base_a_r(0),
      D => S_AXI_WDATA(19),
      Q => \^cfg_base_a_o\(19),
      R => p_0_in
    );
\r_base_a_r_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_base_a_r(0),
      D => S_AXI_WDATA(1),
      Q => \^cfg_base_a_o\(1),
      R => p_0_in
    );
\r_base_a_r_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_base_a_r(0),
      D => S_AXI_WDATA(20),
      Q => \^cfg_base_a_o\(20),
      R => p_0_in
    );
\r_base_a_r_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_base_a_r(0),
      D => S_AXI_WDATA(21),
      Q => \^cfg_base_a_o\(21),
      R => p_0_in
    );
\r_base_a_r_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_base_a_r(0),
      D => S_AXI_WDATA(22),
      Q => \^cfg_base_a_o\(22),
      R => p_0_in
    );
\r_base_a_r_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_base_a_r(0),
      D => S_AXI_WDATA(23),
      Q => \^cfg_base_a_o\(23),
      R => p_0_in
    );
\r_base_a_r_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_base_a_r(0),
      D => S_AXI_WDATA(24),
      Q => \^cfg_base_a_o\(24),
      R => p_0_in
    );
\r_base_a_r_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_base_a_r(0),
      D => S_AXI_WDATA(25),
      Q => \^cfg_base_a_o\(25),
      R => p_0_in
    );
\r_base_a_r_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_base_a_r(0),
      D => S_AXI_WDATA(26),
      Q => \^cfg_base_a_o\(26),
      R => p_0_in
    );
\r_base_a_r_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_base_a_r(0),
      D => S_AXI_WDATA(27),
      Q => \^cfg_base_a_o\(27),
      R => p_0_in
    );
\r_base_a_r_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_base_a_r(0),
      D => S_AXI_WDATA(28),
      Q => \^cfg_base_a_o\(28),
      R => p_0_in
    );
\r_base_a_r_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_base_a_r(0),
      D => S_AXI_WDATA(29),
      Q => \^cfg_base_a_o\(29),
      R => p_0_in
    );
\r_base_a_r_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_base_a_r(0),
      D => S_AXI_WDATA(2),
      Q => \^cfg_base_a_o\(2),
      R => p_0_in
    );
\r_base_a_r_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_base_a_r(0),
      D => S_AXI_WDATA(30),
      Q => \^cfg_base_a_o\(30),
      R => p_0_in
    );
\r_base_a_r_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_base_a_r(0),
      D => S_AXI_WDATA(31),
      Q => \^cfg_base_a_o\(31),
      R => p_0_in
    );
\r_base_a_r_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_base_a_r(0),
      D => S_AXI_WDATA(3),
      Q => \^cfg_base_a_o\(3),
      R => p_0_in
    );
\r_base_a_r_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_base_a_r(0),
      D => S_AXI_WDATA(4),
      Q => \^cfg_base_a_o\(4),
      R => p_0_in
    );
\r_base_a_r_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_base_a_r(0),
      D => S_AXI_WDATA(5),
      Q => \^cfg_base_a_o\(5),
      R => p_0_in
    );
\r_base_a_r_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_base_a_r(0),
      D => S_AXI_WDATA(6),
      Q => \^cfg_base_a_o\(6),
      R => p_0_in
    );
\r_base_a_r_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_base_a_r(0),
      D => S_AXI_WDATA(7),
      Q => \^cfg_base_a_o\(7),
      R => p_0_in
    );
\r_base_a_r_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_base_a_r(0),
      D => S_AXI_WDATA(8),
      Q => \^cfg_base_a_o\(8),
      R => p_0_in
    );
\r_base_a_r_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_base_a_r(0),
      D => S_AXI_WDATA(9),
      Q => \^cfg_base_a_o\(9),
      R => p_0_in
    );
\r_base_b_r[31]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4000"
    )
        port map (
      I0 => p_1_in(0),
      I1 => p_1_in(1),
      I2 => p_1_in(2),
      I3 => \r_m_total_r[15]_i_2_n_0\,
      O => r_base_b_r(0)
    );
\r_base_b_r_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_base_b_r(0),
      D => S_AXI_WDATA(0),
      Q => \^cfg_base_b_o\(0),
      R => p_0_in
    );
\r_base_b_r_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_base_b_r(0),
      D => S_AXI_WDATA(10),
      Q => \^cfg_base_b_o\(10),
      R => p_0_in
    );
\r_base_b_r_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_base_b_r(0),
      D => S_AXI_WDATA(11),
      Q => \^cfg_base_b_o\(11),
      R => p_0_in
    );
\r_base_b_r_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_base_b_r(0),
      D => S_AXI_WDATA(12),
      Q => \^cfg_base_b_o\(12),
      R => p_0_in
    );
\r_base_b_r_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_base_b_r(0),
      D => S_AXI_WDATA(13),
      Q => \^cfg_base_b_o\(13),
      R => p_0_in
    );
\r_base_b_r_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_base_b_r(0),
      D => S_AXI_WDATA(14),
      Q => \^cfg_base_b_o\(14),
      R => p_0_in
    );
\r_base_b_r_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_base_b_r(0),
      D => S_AXI_WDATA(15),
      Q => \^cfg_base_b_o\(15),
      R => p_0_in
    );
\r_base_b_r_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_base_b_r(0),
      D => S_AXI_WDATA(16),
      Q => \^cfg_base_b_o\(16),
      R => p_0_in
    );
\r_base_b_r_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_base_b_r(0),
      D => S_AXI_WDATA(17),
      Q => \^cfg_base_b_o\(17),
      R => p_0_in
    );
\r_base_b_r_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_base_b_r(0),
      D => S_AXI_WDATA(18),
      Q => \^cfg_base_b_o\(18),
      R => p_0_in
    );
\r_base_b_r_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_base_b_r(0),
      D => S_AXI_WDATA(19),
      Q => \^cfg_base_b_o\(19),
      R => p_0_in
    );
\r_base_b_r_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_base_b_r(0),
      D => S_AXI_WDATA(1),
      Q => \^cfg_base_b_o\(1),
      R => p_0_in
    );
\r_base_b_r_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_base_b_r(0),
      D => S_AXI_WDATA(20),
      Q => \^cfg_base_b_o\(20),
      R => p_0_in
    );
\r_base_b_r_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_base_b_r(0),
      D => S_AXI_WDATA(21),
      Q => \^cfg_base_b_o\(21),
      R => p_0_in
    );
\r_base_b_r_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_base_b_r(0),
      D => S_AXI_WDATA(22),
      Q => \^cfg_base_b_o\(22),
      R => p_0_in
    );
\r_base_b_r_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_base_b_r(0),
      D => S_AXI_WDATA(23),
      Q => \^cfg_base_b_o\(23),
      R => p_0_in
    );
\r_base_b_r_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_base_b_r(0),
      D => S_AXI_WDATA(24),
      Q => \^cfg_base_b_o\(24),
      R => p_0_in
    );
\r_base_b_r_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_base_b_r(0),
      D => S_AXI_WDATA(25),
      Q => \^cfg_base_b_o\(25),
      R => p_0_in
    );
\r_base_b_r_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_base_b_r(0),
      D => S_AXI_WDATA(26),
      Q => \^cfg_base_b_o\(26),
      R => p_0_in
    );
\r_base_b_r_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_base_b_r(0),
      D => S_AXI_WDATA(27),
      Q => \^cfg_base_b_o\(27),
      R => p_0_in
    );
\r_base_b_r_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_base_b_r(0),
      D => S_AXI_WDATA(28),
      Q => \^cfg_base_b_o\(28),
      R => p_0_in
    );
\r_base_b_r_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_base_b_r(0),
      D => S_AXI_WDATA(29),
      Q => \^cfg_base_b_o\(29),
      R => p_0_in
    );
\r_base_b_r_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_base_b_r(0),
      D => S_AXI_WDATA(2),
      Q => \^cfg_base_b_o\(2),
      R => p_0_in
    );
\r_base_b_r_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_base_b_r(0),
      D => S_AXI_WDATA(30),
      Q => \^cfg_base_b_o\(30),
      R => p_0_in
    );
\r_base_b_r_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_base_b_r(0),
      D => S_AXI_WDATA(31),
      Q => \^cfg_base_b_o\(31),
      R => p_0_in
    );
\r_base_b_r_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_base_b_r(0),
      D => S_AXI_WDATA(3),
      Q => \^cfg_base_b_o\(3),
      R => p_0_in
    );
\r_base_b_r_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_base_b_r(0),
      D => S_AXI_WDATA(4),
      Q => \^cfg_base_b_o\(4),
      R => p_0_in
    );
\r_base_b_r_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_base_b_r(0),
      D => S_AXI_WDATA(5),
      Q => \^cfg_base_b_o\(5),
      R => p_0_in
    );
\r_base_b_r_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_base_b_r(0),
      D => S_AXI_WDATA(6),
      Q => \^cfg_base_b_o\(6),
      R => p_0_in
    );
\r_base_b_r_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_base_b_r(0),
      D => S_AXI_WDATA(7),
      Q => \^cfg_base_b_o\(7),
      R => p_0_in
    );
\r_base_b_r_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_base_b_r(0),
      D => S_AXI_WDATA(8),
      Q => \^cfg_base_b_o\(8),
      R => p_0_in
    );
\r_base_b_r_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_base_b_r(0),
      D => S_AXI_WDATA(9),
      Q => \^cfg_base_b_o\(9),
      R => p_0_in
    );
\r_base_c_r[31]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => p_1_in(2),
      I1 => \r_m_total_r[15]_i_2_n_0\,
      I2 => p_1_in(0),
      I3 => p_1_in(1),
      O => r_base_c_r(0)
    );
\r_base_c_r_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_base_c_r(0),
      D => S_AXI_WDATA(0),
      Q => \^cfg_base_c_o\(0),
      R => p_0_in
    );
\r_base_c_r_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_base_c_r(0),
      D => S_AXI_WDATA(10),
      Q => \^cfg_base_c_o\(10),
      R => p_0_in
    );
\r_base_c_r_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_base_c_r(0),
      D => S_AXI_WDATA(11),
      Q => \^cfg_base_c_o\(11),
      R => p_0_in
    );
\r_base_c_r_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_base_c_r(0),
      D => S_AXI_WDATA(12),
      Q => \^cfg_base_c_o\(12),
      R => p_0_in
    );
\r_base_c_r_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_base_c_r(0),
      D => S_AXI_WDATA(13),
      Q => \^cfg_base_c_o\(13),
      R => p_0_in
    );
\r_base_c_r_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_base_c_r(0),
      D => S_AXI_WDATA(14),
      Q => \^cfg_base_c_o\(14),
      R => p_0_in
    );
\r_base_c_r_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_base_c_r(0),
      D => S_AXI_WDATA(15),
      Q => \^cfg_base_c_o\(15),
      R => p_0_in
    );
\r_base_c_r_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_base_c_r(0),
      D => S_AXI_WDATA(16),
      Q => \^cfg_base_c_o\(16),
      R => p_0_in
    );
\r_base_c_r_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_base_c_r(0),
      D => S_AXI_WDATA(17),
      Q => \^cfg_base_c_o\(17),
      R => p_0_in
    );
\r_base_c_r_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_base_c_r(0),
      D => S_AXI_WDATA(18),
      Q => \^cfg_base_c_o\(18),
      R => p_0_in
    );
\r_base_c_r_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_base_c_r(0),
      D => S_AXI_WDATA(19),
      Q => \^cfg_base_c_o\(19),
      R => p_0_in
    );
\r_base_c_r_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_base_c_r(0),
      D => S_AXI_WDATA(1),
      Q => \^cfg_base_c_o\(1),
      R => p_0_in
    );
\r_base_c_r_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_base_c_r(0),
      D => S_AXI_WDATA(20),
      Q => \^cfg_base_c_o\(20),
      R => p_0_in
    );
\r_base_c_r_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_base_c_r(0),
      D => S_AXI_WDATA(21),
      Q => \^cfg_base_c_o\(21),
      R => p_0_in
    );
\r_base_c_r_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_base_c_r(0),
      D => S_AXI_WDATA(22),
      Q => \^cfg_base_c_o\(22),
      R => p_0_in
    );
\r_base_c_r_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_base_c_r(0),
      D => S_AXI_WDATA(23),
      Q => \^cfg_base_c_o\(23),
      R => p_0_in
    );
\r_base_c_r_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_base_c_r(0),
      D => S_AXI_WDATA(24),
      Q => \^cfg_base_c_o\(24),
      R => p_0_in
    );
\r_base_c_r_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_base_c_r(0),
      D => S_AXI_WDATA(25),
      Q => \^cfg_base_c_o\(25),
      R => p_0_in
    );
\r_base_c_r_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_base_c_r(0),
      D => S_AXI_WDATA(26),
      Q => \^cfg_base_c_o\(26),
      R => p_0_in
    );
\r_base_c_r_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_base_c_r(0),
      D => S_AXI_WDATA(27),
      Q => \^cfg_base_c_o\(27),
      R => p_0_in
    );
\r_base_c_r_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_base_c_r(0),
      D => S_AXI_WDATA(28),
      Q => \^cfg_base_c_o\(28),
      R => p_0_in
    );
\r_base_c_r_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_base_c_r(0),
      D => S_AXI_WDATA(29),
      Q => \^cfg_base_c_o\(29),
      R => p_0_in
    );
\r_base_c_r_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_base_c_r(0),
      D => S_AXI_WDATA(2),
      Q => \^cfg_base_c_o\(2),
      R => p_0_in
    );
\r_base_c_r_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_base_c_r(0),
      D => S_AXI_WDATA(30),
      Q => \^cfg_base_c_o\(30),
      R => p_0_in
    );
\r_base_c_r_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_base_c_r(0),
      D => S_AXI_WDATA(31),
      Q => \^cfg_base_c_o\(31),
      R => p_0_in
    );
\r_base_c_r_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_base_c_r(0),
      D => S_AXI_WDATA(3),
      Q => \^cfg_base_c_o\(3),
      R => p_0_in
    );
\r_base_c_r_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_base_c_r(0),
      D => S_AXI_WDATA(4),
      Q => \^cfg_base_c_o\(4),
      R => p_0_in
    );
\r_base_c_r_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_base_c_r(0),
      D => S_AXI_WDATA(5),
      Q => \^cfg_base_c_o\(5),
      R => p_0_in
    );
\r_base_c_r_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_base_c_r(0),
      D => S_AXI_WDATA(6),
      Q => \^cfg_base_c_o\(6),
      R => p_0_in
    );
\r_base_c_r_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_base_c_r(0),
      D => S_AXI_WDATA(7),
      Q => \^cfg_base_c_o\(7),
      R => p_0_in
    );
\r_base_c_r_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_base_c_r(0),
      D => S_AXI_WDATA(8),
      Q => \^cfg_base_c_o\(8),
      R => p_0_in
    );
\r_base_c_r_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_base_c_r(0),
      D => S_AXI_WDATA(9),
      Q => \^cfg_base_c_o\(9),
      R => p_0_in
    );
\r_k_dim_r[15]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"08000000"
    )
        port map (
      I0 => p_1_in(1),
      I1 => p_1_in(0),
      I2 => p_1_in(2),
      I3 => S_AXI_WSTRB(0),
      I4 => \r_m_total_r[15]_i_2_n_0\,
      O => r_k_dim_r(0)
    );
\r_k_dim_r_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_k_dim_r(0),
      D => S_AXI_WDATA(0),
      Q => \^cfg_k_dim_o\(0),
      R => p_0_in
    );
\r_k_dim_r_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_k_dim_r(0),
      D => S_AXI_WDATA(10),
      Q => \^cfg_k_dim_o\(10),
      R => p_0_in
    );
\r_k_dim_r_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_k_dim_r(0),
      D => S_AXI_WDATA(11),
      Q => \^cfg_k_dim_o\(11),
      R => p_0_in
    );
\r_k_dim_r_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_k_dim_r(0),
      D => S_AXI_WDATA(12),
      Q => \^cfg_k_dim_o\(12),
      R => p_0_in
    );
\r_k_dim_r_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_k_dim_r(0),
      D => S_AXI_WDATA(13),
      Q => \^cfg_k_dim_o\(13),
      R => p_0_in
    );
\r_k_dim_r_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_k_dim_r(0),
      D => S_AXI_WDATA(14),
      Q => \^cfg_k_dim_o\(14),
      R => p_0_in
    );
\r_k_dim_r_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_k_dim_r(0),
      D => S_AXI_WDATA(15),
      Q => \^cfg_k_dim_o\(15),
      R => p_0_in
    );
\r_k_dim_r_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_k_dim_r(0),
      D => S_AXI_WDATA(1),
      Q => \^cfg_k_dim_o\(1),
      R => p_0_in
    );
\r_k_dim_r_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_k_dim_r(0),
      D => S_AXI_WDATA(2),
      Q => \^cfg_k_dim_o\(2),
      R => p_0_in
    );
\r_k_dim_r_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_k_dim_r(0),
      D => S_AXI_WDATA(3),
      Q => \^cfg_k_dim_o\(3),
      R => p_0_in
    );
\r_k_dim_r_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_k_dim_r(0),
      D => S_AXI_WDATA(4),
      Q => \^cfg_k_dim_o\(4),
      R => p_0_in
    );
\r_k_dim_r_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_k_dim_r(0),
      D => S_AXI_WDATA(5),
      Q => \^cfg_k_dim_o\(5),
      R => p_0_in
    );
\r_k_dim_r_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_k_dim_r(0),
      D => S_AXI_WDATA(6),
      Q => \^cfg_k_dim_o\(6),
      R => p_0_in
    );
\r_k_dim_r_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_k_dim_r(0),
      D => S_AXI_WDATA(7),
      Q => \^cfg_k_dim_o\(7),
      R => p_0_in
    );
\r_k_dim_r_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_k_dim_r(0),
      D => S_AXI_WDATA(8),
      Q => \^cfg_k_dim_o\(8),
      R => p_0_in
    );
\r_k_dim_r_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_k_dim_r(0),
      D => S_AXI_WDATA(9),
      Q => \^cfg_k_dim_o\(9),
      R => p_0_in
    );
\r_k_total_r[15]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00400000"
    )
        port map (
      I0 => p_1_in(2),
      I1 => S_AXI_WSTRB(0),
      I2 => p_1_in(1),
      I3 => p_1_in(0),
      I4 => \r_m_total_r[15]_i_2_n_0\,
      O => r_k_total_r(0)
    );
\r_k_total_r_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_k_total_r(0),
      D => S_AXI_WDATA(0),
      Q => \^cfg_k_total_o\(0),
      R => p_0_in
    );
\r_k_total_r_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_k_total_r(0),
      D => S_AXI_WDATA(10),
      Q => \^cfg_k_total_o\(10),
      R => p_0_in
    );
\r_k_total_r_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_k_total_r(0),
      D => S_AXI_WDATA(11),
      Q => \^cfg_k_total_o\(11),
      R => p_0_in
    );
\r_k_total_r_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_k_total_r(0),
      D => S_AXI_WDATA(12),
      Q => \^cfg_k_total_o\(12),
      R => p_0_in
    );
\r_k_total_r_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_k_total_r(0),
      D => S_AXI_WDATA(13),
      Q => \^cfg_k_total_o\(13),
      R => p_0_in
    );
\r_k_total_r_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_k_total_r(0),
      D => S_AXI_WDATA(14),
      Q => \^cfg_k_total_o\(14),
      R => p_0_in
    );
\r_k_total_r_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_k_total_r(0),
      D => S_AXI_WDATA(15),
      Q => \^cfg_k_total_o\(15),
      R => p_0_in
    );
\r_k_total_r_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_k_total_r(0),
      D => S_AXI_WDATA(1),
      Q => \^cfg_k_total_o\(1),
      R => p_0_in
    );
\r_k_total_r_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_k_total_r(0),
      D => S_AXI_WDATA(2),
      Q => \^cfg_k_total_o\(2),
      R => p_0_in
    );
\r_k_total_r_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_k_total_r(0),
      D => S_AXI_WDATA(3),
      Q => \^cfg_k_total_o\(3),
      R => p_0_in
    );
\r_k_total_r_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_k_total_r(0),
      D => S_AXI_WDATA(4),
      Q => \^cfg_k_total_o\(4),
      R => p_0_in
    );
\r_k_total_r_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_k_total_r(0),
      D => S_AXI_WDATA(5),
      Q => \^cfg_k_total_o\(5),
      R => p_0_in
    );
\r_k_total_r_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_k_total_r(0),
      D => S_AXI_WDATA(6),
      Q => \^cfg_k_total_o\(6),
      R => p_0_in
    );
\r_k_total_r_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_k_total_r(0),
      D => S_AXI_WDATA(7),
      Q => \^cfg_k_total_o\(7),
      R => p_0_in
    );
\r_k_total_r_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_k_total_r(0),
      D => S_AXI_WDATA(8),
      Q => \^cfg_k_total_o\(8),
      R => p_0_in
    );
\r_k_total_r_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_k_total_r(0),
      D => S_AXI_WDATA(9),
      Q => \^cfg_k_total_o\(9),
      R => p_0_in
    );
\r_m_total_r[15]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00040000"
    )
        port map (
      I0 => p_1_in(2),
      I1 => S_AXI_WSTRB(0),
      I2 => p_1_in(0),
      I3 => p_1_in(1),
      I4 => \r_m_total_r[15]_i_2_n_0\,
      O => r_m_total_r(0)
    );
\r_m_total_r[15]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000010000000"
    )
        port map (
      I0 => p_1_in(5),
      I1 => p_1_in(4),
      I2 => \^s_axi_wready\,
      I3 => S_AXI_AWVALID,
      I4 => S_AXI_WVALID,
      I5 => p_1_in(3),
      O => \r_m_total_r[15]_i_2_n_0\
    );
\r_m_total_r_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_m_total_r(0),
      D => S_AXI_WDATA(0),
      Q => \^cfg_m_total_o\(0),
      R => p_0_in
    );
\r_m_total_r_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_m_total_r(0),
      D => S_AXI_WDATA(10),
      Q => \^cfg_m_total_o\(10),
      R => p_0_in
    );
\r_m_total_r_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_m_total_r(0),
      D => S_AXI_WDATA(11),
      Q => \^cfg_m_total_o\(11),
      R => p_0_in
    );
\r_m_total_r_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_m_total_r(0),
      D => S_AXI_WDATA(12),
      Q => \^cfg_m_total_o\(12),
      R => p_0_in
    );
\r_m_total_r_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_m_total_r(0),
      D => S_AXI_WDATA(13),
      Q => \^cfg_m_total_o\(13),
      R => p_0_in
    );
\r_m_total_r_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_m_total_r(0),
      D => S_AXI_WDATA(14),
      Q => \^cfg_m_total_o\(14),
      R => p_0_in
    );
\r_m_total_r_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_m_total_r(0),
      D => S_AXI_WDATA(15),
      Q => \^cfg_m_total_o\(15),
      R => p_0_in
    );
\r_m_total_r_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_m_total_r(0),
      D => S_AXI_WDATA(1),
      Q => \^cfg_m_total_o\(1),
      R => p_0_in
    );
\r_m_total_r_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_m_total_r(0),
      D => S_AXI_WDATA(2),
      Q => \^cfg_m_total_o\(2),
      R => p_0_in
    );
\r_m_total_r_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_m_total_r(0),
      D => S_AXI_WDATA(3),
      Q => \^cfg_m_total_o\(3),
      R => p_0_in
    );
\r_m_total_r_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_m_total_r(0),
      D => S_AXI_WDATA(4),
      Q => \^cfg_m_total_o\(4),
      R => p_0_in
    );
\r_m_total_r_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_m_total_r(0),
      D => S_AXI_WDATA(5),
      Q => \^cfg_m_total_o\(5),
      R => p_0_in
    );
\r_m_total_r_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_m_total_r(0),
      D => S_AXI_WDATA(6),
      Q => \^cfg_m_total_o\(6),
      R => p_0_in
    );
\r_m_total_r_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_m_total_r(0),
      D => S_AXI_WDATA(7),
      Q => \^cfg_m_total_o\(7),
      R => p_0_in
    );
\r_m_total_r_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_m_total_r(0),
      D => S_AXI_WDATA(8),
      Q => \^cfg_m_total_o\(8),
      R => p_0_in
    );
\r_m_total_r_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_m_total_r(0),
      D => S_AXI_WDATA(9),
      Q => \^cfg_m_total_o\(9),
      R => p_0_in
    );
\r_n_stride_r[15]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000010000000"
    )
        port map (
      I0 => p_1_in(1),
      I1 => p_1_in(0),
      I2 => \r_n_stride_r[15]_i_2_n_0\,
      I3 => p_1_in(3),
      I4 => S_AXI_WSTRB(0),
      I5 => p_1_in(2),
      O => r_n_stride_r(0)
    );
\r_n_stride_r[15]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000080"
    )
        port map (
      I0 => S_AXI_WVALID,
      I1 => S_AXI_AWVALID,
      I2 => \^s_axi_wready\,
      I3 => p_1_in(4),
      I4 => p_1_in(5),
      O => \r_n_stride_r[15]_i_2_n_0\
    );
\r_n_stride_r_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_n_stride_r(0),
      D => S_AXI_WDATA(0),
      Q => \^cfg_n_stride_o\(0),
      R => p_0_in
    );
\r_n_stride_r_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_n_stride_r(0),
      D => S_AXI_WDATA(10),
      Q => \^cfg_n_stride_o\(10),
      R => p_0_in
    );
\r_n_stride_r_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_n_stride_r(0),
      D => S_AXI_WDATA(11),
      Q => \^cfg_n_stride_o\(11),
      R => p_0_in
    );
\r_n_stride_r_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_n_stride_r(0),
      D => S_AXI_WDATA(12),
      Q => \^cfg_n_stride_o\(12),
      R => p_0_in
    );
\r_n_stride_r_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_n_stride_r(0),
      D => S_AXI_WDATA(13),
      Q => \^cfg_n_stride_o\(13),
      R => p_0_in
    );
\r_n_stride_r_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_n_stride_r(0),
      D => S_AXI_WDATA(14),
      Q => \^cfg_n_stride_o\(14),
      R => p_0_in
    );
\r_n_stride_r_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_n_stride_r(0),
      D => S_AXI_WDATA(15),
      Q => \^cfg_n_stride_o\(15),
      R => p_0_in
    );
\r_n_stride_r_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_n_stride_r(0),
      D => S_AXI_WDATA(1),
      Q => \^cfg_n_stride_o\(1),
      R => p_0_in
    );
\r_n_stride_r_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_n_stride_r(0),
      D => S_AXI_WDATA(2),
      Q => \^cfg_n_stride_o\(2),
      R => p_0_in
    );
\r_n_stride_r_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_n_stride_r(0),
      D => S_AXI_WDATA(3),
      Q => \^cfg_n_stride_o\(3),
      R => p_0_in
    );
\r_n_stride_r_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_n_stride_r(0),
      D => S_AXI_WDATA(4),
      Q => \^cfg_n_stride_o\(4),
      R => p_0_in
    );
\r_n_stride_r_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_n_stride_r(0),
      D => S_AXI_WDATA(5),
      Q => \^cfg_n_stride_o\(5),
      R => p_0_in
    );
\r_n_stride_r_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_n_stride_r(0),
      D => S_AXI_WDATA(6),
      Q => \^cfg_n_stride_o\(6),
      R => p_0_in
    );
\r_n_stride_r_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_n_stride_r(0),
      D => S_AXI_WDATA(7),
      Q => \^cfg_n_stride_o\(7),
      R => p_0_in
    );
\r_n_stride_r_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_n_stride_r(0),
      D => S_AXI_WDATA(8),
      Q => \^cfg_n_stride_o\(8),
      R => p_0_in
    );
\r_n_stride_r_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_n_stride_r(0),
      D => S_AXI_WDATA(9),
      Q => \^cfg_n_stride_o\(9),
      R => p_0_in
    );
\r_n_total_r[15]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00400000"
    )
        port map (
      I0 => p_1_in(2),
      I1 => S_AXI_WSTRB(0),
      I2 => p_1_in(0),
      I3 => p_1_in(1),
      I4 => \r_m_total_r[15]_i_2_n_0\,
      O => r_n_total_r(0)
    );
\r_n_total_r_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_n_total_r(0),
      D => S_AXI_WDATA(0),
      Q => \^cfg_n_total_o\(0),
      R => p_0_in
    );
\r_n_total_r_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_n_total_r(0),
      D => S_AXI_WDATA(10),
      Q => \^cfg_n_total_o\(10),
      R => p_0_in
    );
\r_n_total_r_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_n_total_r(0),
      D => S_AXI_WDATA(11),
      Q => \^cfg_n_total_o\(11),
      R => p_0_in
    );
\r_n_total_r_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_n_total_r(0),
      D => S_AXI_WDATA(12),
      Q => \^cfg_n_total_o\(12),
      R => p_0_in
    );
\r_n_total_r_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_n_total_r(0),
      D => S_AXI_WDATA(13),
      Q => \^cfg_n_total_o\(13),
      R => p_0_in
    );
\r_n_total_r_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_n_total_r(0),
      D => S_AXI_WDATA(14),
      Q => \^cfg_n_total_o\(14),
      R => p_0_in
    );
\r_n_total_r_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_n_total_r(0),
      D => S_AXI_WDATA(15),
      Q => \^cfg_n_total_o\(15),
      R => p_0_in
    );
\r_n_total_r_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_n_total_r(0),
      D => S_AXI_WDATA(1),
      Q => \^cfg_n_total_o\(1),
      R => p_0_in
    );
\r_n_total_r_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_n_total_r(0),
      D => S_AXI_WDATA(2),
      Q => \^cfg_n_total_o\(2),
      R => p_0_in
    );
\r_n_total_r_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_n_total_r(0),
      D => S_AXI_WDATA(3),
      Q => \^cfg_n_total_o\(3),
      R => p_0_in
    );
\r_n_total_r_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_n_total_r(0),
      D => S_AXI_WDATA(4),
      Q => \^cfg_n_total_o\(4),
      R => p_0_in
    );
\r_n_total_r_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_n_total_r(0),
      D => S_AXI_WDATA(5),
      Q => \^cfg_n_total_o\(5),
      R => p_0_in
    );
\r_n_total_r_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_n_total_r(0),
      D => S_AXI_WDATA(6),
      Q => \^cfg_n_total_o\(6),
      R => p_0_in
    );
\r_n_total_r_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_n_total_r(0),
      D => S_AXI_WDATA(7),
      Q => \^cfg_n_total_o\(7),
      R => p_0_in
    );
\r_n_total_r_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_n_total_r(0),
      D => S_AXI_WDATA(8),
      Q => \^cfg_n_total_o\(8),
      R => p_0_in
    );
\r_n_total_r_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_n_total_r(0),
      D => S_AXI_WDATA(9),
      Q => \^cfg_n_total_o\(9),
      R => p_0_in
    );
\r_numkt_r[15]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"04000000"
    )
        port map (
      I0 => p_1_in(0),
      I1 => S_AXI_WSTRB(0),
      I2 => p_1_in(1),
      I3 => p_1_in(2),
      I4 => \r_m_total_r[15]_i_2_n_0\,
      O => r_numkt_r(0)
    );
\r_numkt_r_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_numkt_r(0),
      D => S_AXI_WDATA(0),
      Q => \^cfg_num_k_tiles_per_block_o\(0),
      R => p_0_in
    );
\r_numkt_r_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_numkt_r(0),
      D => S_AXI_WDATA(10),
      Q => \^cfg_num_k_tiles_per_block_o\(10),
      R => p_0_in
    );
\r_numkt_r_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_numkt_r(0),
      D => S_AXI_WDATA(11),
      Q => \^cfg_num_k_tiles_per_block_o\(11),
      R => p_0_in
    );
\r_numkt_r_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_numkt_r(0),
      D => S_AXI_WDATA(12),
      Q => \^cfg_num_k_tiles_per_block_o\(12),
      R => p_0_in
    );
\r_numkt_r_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_numkt_r(0),
      D => S_AXI_WDATA(13),
      Q => \^cfg_num_k_tiles_per_block_o\(13),
      R => p_0_in
    );
\r_numkt_r_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_numkt_r(0),
      D => S_AXI_WDATA(14),
      Q => \^cfg_num_k_tiles_per_block_o\(14),
      R => p_0_in
    );
\r_numkt_r_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_numkt_r(0),
      D => S_AXI_WDATA(15),
      Q => \^cfg_num_k_tiles_per_block_o\(15),
      R => p_0_in
    );
\r_numkt_r_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_numkt_r(0),
      D => S_AXI_WDATA(1),
      Q => \^cfg_num_k_tiles_per_block_o\(1),
      R => p_0_in
    );
\r_numkt_r_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_numkt_r(0),
      D => S_AXI_WDATA(2),
      Q => \^cfg_num_k_tiles_per_block_o\(2),
      R => p_0_in
    );
\r_numkt_r_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_numkt_r(0),
      D => S_AXI_WDATA(3),
      Q => \^cfg_num_k_tiles_per_block_o\(3),
      R => p_0_in
    );
\r_numkt_r_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_numkt_r(0),
      D => S_AXI_WDATA(4),
      Q => \^cfg_num_k_tiles_per_block_o\(4),
      R => p_0_in
    );
\r_numkt_r_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_numkt_r(0),
      D => S_AXI_WDATA(5),
      Q => \^cfg_num_k_tiles_per_block_o\(5),
      R => p_0_in
    );
\r_numkt_r_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_numkt_r(0),
      D => S_AXI_WDATA(6),
      Q => \^cfg_num_k_tiles_per_block_o\(6),
      R => p_0_in
    );
\r_numkt_r_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_numkt_r(0),
      D => S_AXI_WDATA(7),
      Q => \^cfg_num_k_tiles_per_block_o\(7),
      R => p_0_in
    );
\r_numkt_r_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_numkt_r(0),
      D => S_AXI_WDATA(8),
      Q => \^cfg_num_k_tiles_per_block_o\(8),
      R => p_0_in
    );
\r_numkt_r_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_numkt_r(0),
      D => S_AXI_WDATA(9),
      Q => \^cfg_num_k_tiles_per_block_o\(9),
      R => p_0_in
    );
\r_scale_shift_r[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000040000000"
    )
        port map (
      I0 => p_1_in(1),
      I1 => p_1_in(0),
      I2 => \r_n_stride_r[15]_i_2_n_0\,
      I3 => p_1_in(3),
      I4 => S_AXI_WSTRB(0),
      I5 => p_1_in(2),
      O => r_scale_shift_r(0)
    );
\r_scale_shift_r_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_scale_shift_r(0),
      D => S_AXI_WDATA(0),
      Q => \^cfg_scale_shift_o\(0),
      R => p_0_in
    );
\r_scale_shift_r_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_scale_shift_r(0),
      D => S_AXI_WDATA(1),
      Q => \^cfg_scale_shift_o\(1),
      R => p_0_in
    );
\r_scale_shift_r_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_scale_shift_r(0),
      D => S_AXI_WDATA(2),
      Q => \^cfg_scale_shift_o\(2),
      R => p_0_in
    );
\r_scale_shift_r_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_scale_shift_r(0),
      D => S_AXI_WDATA(3),
      Q => \^cfg_scale_shift_o\(3),
      R => p_0_in
    );
\r_scale_shift_r_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_scale_shift_r(0),
      D => S_AXI_WDATA(4),
      Q => \^cfg_scale_shift_o\(4),
      R => p_0_in
    );
\r_zero_point_r[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000040000000"
    )
        port map (
      I0 => p_1_in(0),
      I1 => p_1_in(1),
      I2 => \r_n_stride_r[15]_i_2_n_0\,
      I3 => p_1_in(3),
      I4 => S_AXI_WSTRB(0),
      I5 => p_1_in(2),
      O => r_zero_point_r(0)
    );
\r_zero_point_r_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_zero_point_r(0),
      D => S_AXI_WDATA(0),
      Q => \^cfg_zero_point_o\(0),
      R => p_0_in
    );
\r_zero_point_r_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_zero_point_r(0),
      D => S_AXI_WDATA(1),
      Q => \^cfg_zero_point_o\(1),
      R => p_0_in
    );
\r_zero_point_r_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_zero_point_r(0),
      D => S_AXI_WDATA(2),
      Q => \^cfg_zero_point_o\(2),
      R => p_0_in
    );
\r_zero_point_r_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_zero_point_r(0),
      D => S_AXI_WDATA(3),
      Q => \^cfg_zero_point_o\(3),
      R => p_0_in
    );
\r_zero_point_r_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_zero_point_r(0),
      D => S_AXI_WDATA(4),
      Q => \^cfg_zero_point_o\(4),
      R => p_0_in
    );
\r_zero_point_r_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_zero_point_r(0),
      D => S_AXI_WDATA(5),
      Q => \^cfg_zero_point_o\(5),
      R => p_0_in
    );
\r_zero_point_r_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_zero_point_r(0),
      D => S_AXI_WDATA(6),
      Q => \^cfg_zero_point_o\(6),
      R => p_0_in
    );
\r_zero_point_r_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => r_zero_point_r(0),
      D => S_AXI_WDATA(7),
      Q => \^cfg_zero_point_o\(7),
      R => p_0_in
    );
start_pulse_r_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000040000000"
    )
        port map (
      I0 => start_pulse_r_i_2_n_0,
      I1 => S_AXI_WDATA(0),
      I2 => S_AXI_ARESETN,
      I3 => \r_n_stride_r[15]_i_2_n_0\,
      I4 => p_1_in(3),
      I5 => start_pulse_r_i_3_n_0,
      O => start_pulse_r_i_1_n_0
    );
start_pulse_r_i_2: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => p_1_in(1),
      I1 => p_1_in(0),
      O => start_pulse_r_i_2_n_0
    );
start_pulse_r_i_3: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => p_1_in(2),
      I1 => S_AXI_WSTRB(0),
      O => start_pulse_r_i_3_n_0
    );
start_pulse_r_reg: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => start_pulse_r_i_1_n_0,
      Q => start_o,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity gemm_system_gemm_l2_axi_lite_regs_0_0 is
  port (
    S_AXI_ACLK : in STD_LOGIC;
    S_AXI_ARESETN : in STD_LOGIC;
    S_AXI_AWADDR : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S_AXI_AWPROT : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_AWVALID : in STD_LOGIC;
    S_AXI_AWREADY : out STD_LOGIC;
    S_AXI_WDATA : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_WSTRB : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_WVALID : in STD_LOGIC;
    S_AXI_WREADY : out STD_LOGIC;
    S_AXI_BRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_BVALID : out STD_LOGIC;
    S_AXI_BREADY : in STD_LOGIC;
    S_AXI_ARADDR : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S_AXI_ARPROT : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_ARVALID : in STD_LOGIC;
    S_AXI_ARREADY : out STD_LOGIC;
    S_AXI_RDATA : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_RRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_RVALID : out STD_LOGIC;
    S_AXI_RREADY : in STD_LOGIC;
    cfg_m_total_o : out STD_LOGIC_VECTOR ( 15 downto 0 );
    cfg_n_total_o : out STD_LOGIC_VECTOR ( 15 downto 0 );
    cfg_k_total_o : out STD_LOGIC_VECTOR ( 15 downto 0 );
    cfg_k_dim_o : out STD_LOGIC_VECTOR ( 15 downto 0 );
    cfg_num_k_tiles_per_block_o : out STD_LOGIC_VECTOR ( 15 downto 0 );
    cfg_base_a_o : out STD_LOGIC_VECTOR ( 31 downto 0 );
    cfg_base_b_o : out STD_LOGIC_VECTOR ( 31 downto 0 );
    cfg_base_c_o : out STD_LOGIC_VECTOR ( 31 downto 0 );
    cfg_n_stride_o : out STD_LOGIC_VECTOR ( 15 downto 0 );
    cfg_scale_shift_o : out STD_LOGIC_VECTOR ( 4 downto 0 );
    cfg_zero_point_o : out STD_LOGIC_VECTOR ( 7 downto 0 );
    start_o : out STD_LOGIC;
    busy_i : in STD_LOGIC;
    done_i : in STD_LOGIC;
    irq_o : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of gemm_system_gemm_l2_axi_lite_regs_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of gemm_system_gemm_l2_axi_lite_regs_0_0 : entity is "gemm_system_gemm_l2_axi_lite_regs_0_0,gemm_l2_axi_lite_regs,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of gemm_system_gemm_l2_axi_lite_regs_0_0 : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of gemm_system_gemm_l2_axi_lite_regs_0_0 : entity is "module_ref";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of gemm_system_gemm_l2_axi_lite_regs_0_0 : entity is "gemm_l2_axi_lite_regs,Vivado 2025.2";
end gemm_system_gemm_l2_axi_lite_regs_0_0;

architecture STRUCTURE of gemm_system_gemm_l2_axi_lite_regs_0_0 is
  signal \<const0>\ : STD_LOGIC;
  signal \^s_axi_awready\ : STD_LOGIC;
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of S_AXI_ACLK : signal is "xilinx.com:signal:clock:1.0 S_AXI_ACLK CLK";
  attribute X_INTERFACE_MODE : string;
  attribute X_INTERFACE_MODE of S_AXI_ACLK : signal is "slave";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of S_AXI_ACLK : signal is "XIL_INTERFACENAME S_AXI_ACLK, ASSOCIATED_BUSIF S_AXI, ASSOCIATED_RESET S_AXI_ARESETN, FREQ_HZ 199998001, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN gemm_system_zynq_ultra_ps_e_0_0_pl_clk0, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of S_AXI_ARESETN : signal is "xilinx.com:signal:reset:1.0 S_AXI_ARESETN RST";
  attribute X_INTERFACE_MODE of S_AXI_ARESETN : signal is "slave";
  attribute X_INTERFACE_PARAMETER of S_AXI_ARESETN : signal is "XIL_INTERFACENAME S_AXI_ARESETN, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of S_AXI_ARREADY : signal is "xilinx.com:interface:aximm:1.0 S_AXI ARREADY";
  attribute X_INTERFACE_INFO of S_AXI_ARVALID : signal is "xilinx.com:interface:aximm:1.0 S_AXI ARVALID";
  attribute X_INTERFACE_INFO of S_AXI_AWREADY : signal is "xilinx.com:interface:aximm:1.0 S_AXI AWREADY";
  attribute X_INTERFACE_INFO of S_AXI_AWVALID : signal is "xilinx.com:interface:aximm:1.0 S_AXI AWVALID";
  attribute X_INTERFACE_INFO of S_AXI_BREADY : signal is "xilinx.com:interface:aximm:1.0 S_AXI BREADY";
  attribute X_INTERFACE_INFO of S_AXI_BVALID : signal is "xilinx.com:interface:aximm:1.0 S_AXI BVALID";
  attribute X_INTERFACE_INFO of S_AXI_RREADY : signal is "xilinx.com:interface:aximm:1.0 S_AXI RREADY";
  attribute X_INTERFACE_INFO of S_AXI_RVALID : signal is "xilinx.com:interface:aximm:1.0 S_AXI RVALID";
  attribute X_INTERFACE_INFO of S_AXI_WREADY : signal is "xilinx.com:interface:aximm:1.0 S_AXI WREADY";
  attribute X_INTERFACE_INFO of S_AXI_WVALID : signal is "xilinx.com:interface:aximm:1.0 S_AXI WVALID";
  attribute X_INTERFACE_INFO of S_AXI_ARADDR : signal is "xilinx.com:interface:aximm:1.0 S_AXI ARADDR";
  attribute X_INTERFACE_INFO of S_AXI_ARPROT : signal is "xilinx.com:interface:aximm:1.0 S_AXI ARPROT";
  attribute X_INTERFACE_INFO of S_AXI_AWADDR : signal is "xilinx.com:interface:aximm:1.0 S_AXI AWADDR";
  attribute X_INTERFACE_MODE of S_AXI_AWADDR : signal is "slave";
  attribute X_INTERFACE_PARAMETER of S_AXI_AWADDR : signal is "XIL_INTERFACENAME S_AXI, DATA_WIDTH 32, PROTOCOL AXI4LITE, FREQ_HZ 199998001, ID_WIDTH 0, ADDR_WIDTH 8, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 1, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 1, NUM_WRITE_OUTSTANDING 1, MAX_BURST_LENGTH 1, PHASE 0.0, CLK_DOMAIN gemm_system_zynq_ultra_ps_e_0_0_pl_clk0, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of S_AXI_AWPROT : signal is "xilinx.com:interface:aximm:1.0 S_AXI AWPROT";
  attribute X_INTERFACE_INFO of S_AXI_BRESP : signal is "xilinx.com:interface:aximm:1.0 S_AXI BRESP";
  attribute X_INTERFACE_INFO of S_AXI_RDATA : signal is "xilinx.com:interface:aximm:1.0 S_AXI RDATA";
  attribute X_INTERFACE_INFO of S_AXI_RRESP : signal is "xilinx.com:interface:aximm:1.0 S_AXI RRESP";
  attribute X_INTERFACE_INFO of S_AXI_WDATA : signal is "xilinx.com:interface:aximm:1.0 S_AXI WDATA";
  attribute X_INTERFACE_INFO of S_AXI_WSTRB : signal is "xilinx.com:interface:aximm:1.0 S_AXI WSTRB";
begin
  S_AXI_AWREADY <= \^s_axi_awready\;
  S_AXI_BRESP(1) <= \<const0>\;
  S_AXI_BRESP(0) <= \<const0>\;
  S_AXI_RRESP(1) <= \<const0>\;
  S_AXI_RRESP(0) <= \<const0>\;
  S_AXI_WREADY <= \^s_axi_awready\;
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
inst: entity work.gemm_system_gemm_l2_axi_lite_regs_0_0_gemm_l2_axi_lite_regs
     port map (
      S_AXI_ACLK => S_AXI_ACLK,
      S_AXI_ARADDR(5 downto 0) => S_AXI_ARADDR(7 downto 2),
      S_AXI_ARESETN => S_AXI_ARESETN,
      S_AXI_ARREADY => S_AXI_ARREADY,
      S_AXI_ARVALID => S_AXI_ARVALID,
      S_AXI_AWADDR(5 downto 0) => S_AXI_AWADDR(7 downto 2),
      S_AXI_AWVALID => S_AXI_AWVALID,
      S_AXI_BREADY => S_AXI_BREADY,
      S_AXI_BVALID => S_AXI_BVALID,
      S_AXI_RDATA(31 downto 0) => S_AXI_RDATA(31 downto 0),
      S_AXI_RREADY => S_AXI_RREADY,
      S_AXI_RVALID_reg_0 => S_AXI_RVALID,
      S_AXI_WDATA(31 downto 0) => S_AXI_WDATA(31 downto 0),
      S_AXI_WREADY => \^s_axi_awready\,
      S_AXI_WSTRB(0) => S_AXI_WSTRB(0),
      S_AXI_WVALID => S_AXI_WVALID,
      busy_i => busy_i,
      cfg_base_a_o(31 downto 0) => cfg_base_a_o(31 downto 0),
      cfg_base_b_o(31 downto 0) => cfg_base_b_o(31 downto 0),
      cfg_base_c_o(31 downto 0) => cfg_base_c_o(31 downto 0),
      cfg_k_dim_o(15 downto 0) => cfg_k_dim_o(15 downto 0),
      cfg_k_total_o(15 downto 0) => cfg_k_total_o(15 downto 0),
      cfg_m_total_o(15 downto 0) => cfg_m_total_o(15 downto 0),
      cfg_n_stride_o(15 downto 0) => cfg_n_stride_o(15 downto 0),
      cfg_n_total_o(15 downto 0) => cfg_n_total_o(15 downto 0),
      cfg_num_k_tiles_per_block_o(15 downto 0) => cfg_num_k_tiles_per_block_o(15 downto 0),
      cfg_scale_shift_o(4 downto 0) => cfg_scale_shift_o(4 downto 0),
      cfg_zero_point_o(7 downto 0) => cfg_zero_point_o(7 downto 0),
      done_i => done_i,
      irq_o => irq_o,
      start_o => start_o
    );
end STRUCTURE;

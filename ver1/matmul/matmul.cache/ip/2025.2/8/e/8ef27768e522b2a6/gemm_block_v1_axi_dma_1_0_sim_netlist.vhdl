-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
-- Date        : Sat Apr 11 21:17:33 2026
-- Host        : ZUYYYY running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
--               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ gemm_block_v1_axi_dma_1_0_sim_netlist.vhdl
-- Design      : gemm_block_v1_axi_dma_1_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xck26-sfvc784-2LV-c
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_datamover_fifo is
  port (
    sig_cmd2mstr_cmd_valid : out STD_LOGIC;
    s_axis_mm2s_cmd_tready : out STD_LOGIC;
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    sig_cmd_stat_rst_int_reg_n_reg : out STD_LOGIC;
    Q : out STD_LOGIC_VECTOR ( 47 downto 0 );
    SR : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_mm2s_aclk : in STD_LOGIC;
    \USE_SINGLE_REG.sig_regfifo_full_reg_reg_0\ : in STD_LOGIC;
    s_axis_mm2s_cmd_tvalid_split : in STD_LOGIC;
    sig_cmd_stat_rst_int_reg_n : in STD_LOGIC;
    sig_init_done : in STD_LOGIC;
    \USE_SINGLE_REG.sig_regfifo_empty_reg_reg_0\ : in STD_LOGIC;
    D : in STD_LOGIC_VECTOR ( 47 downto 0 )
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_datamover_fifo;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_datamover_fifo is
  signal \^e\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \GEN_INCLUDE_STATUS_FIFO.I_STS_FIFO/sig_init_reg\ : STD_LOGIC;
  signal \GEN_INCLUDE_STATUS_FIFO.I_STS_FIFO/sig_init_reg2\ : STD_LOGIC;
  signal \USE_SINGLE_REG.sig_regfifo_empty_reg_i_1_n_0\ : STD_LOGIC;
  signal \^s_axis_mm2s_cmd_tready\ : STD_LOGIC;
  signal sig_init_done_0 : STD_LOGIC;
  signal \sig_init_done_i_1__2_n_0\ : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \sig_init_done_i_1__2\ : label is "soft_lutpair39";
  attribute SOFT_HLUTNM of \sig_init_done_i_1__3\ : label is "soft_lutpair39";
begin
  E(0) <= \^e\(0);
  s_axis_mm2s_cmd_tready <= \^s_axis_mm2s_cmd_tready\;
\USE_SINGLE_REG.sig_regfifo_dout_reg[66]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^s_axis_mm2s_cmd_tready\,
      I1 => s_axis_mm2s_cmd_tvalid_split,
      O => \^e\(0)
    );
\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => \^e\(0),
      D => D(0),
      Q => Q(0),
      R => SR(0)
    );
\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => \^e\(0),
      D => D(10),
      Q => Q(10),
      R => SR(0)
    );
\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => \^e\(0),
      D => D(11),
      Q => Q(11),
      R => SR(0)
    );
\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => \^e\(0),
      D => D(12),
      Q => Q(12),
      R => SR(0)
    );
\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => \^e\(0),
      D => D(13),
      Q => Q(13),
      R => SR(0)
    );
\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => \^e\(0),
      D => D(1),
      Q => Q(1),
      R => SR(0)
    );
\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => \^e\(0),
      D => D(14),
      Q => Q(14),
      R => SR(0)
    );
\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => \^e\(0),
      D => D(2),
      Q => Q(2),
      R => SR(0)
    );
\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[33]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => \^e\(0),
      D => D(15),
      Q => Q(15),
      R => SR(0)
    );
\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[35]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => \^e\(0),
      D => D(16),
      Q => Q(16),
      R => SR(0)
    );
\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[36]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => \^e\(0),
      D => D(17),
      Q => Q(17),
      R => SR(0)
    );
\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[37]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => \^e\(0),
      D => D(18),
      Q => Q(18),
      R => SR(0)
    );
\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[38]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => \^e\(0),
      D => D(19),
      Q => Q(19),
      R => SR(0)
    );
\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[39]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => \^e\(0),
      D => D(20),
      Q => Q(20),
      R => SR(0)
    );
\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => \^e\(0),
      D => D(3),
      Q => Q(3),
      R => SR(0)
    );
\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[40]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => \^e\(0),
      D => D(21),
      Q => Q(21),
      R => SR(0)
    );
\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[41]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => \^e\(0),
      D => D(22),
      Q => Q(22),
      R => SR(0)
    );
\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[42]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => \^e\(0),
      D => D(23),
      Q => Q(23),
      R => SR(0)
    );
\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[43]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => \^e\(0),
      D => D(24),
      Q => Q(24),
      R => SR(0)
    );
\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[44]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => \^e\(0),
      D => D(25),
      Q => Q(25),
      R => SR(0)
    );
\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[45]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => \^e\(0),
      D => D(26),
      Q => Q(26),
      R => SR(0)
    );
\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[46]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => \^e\(0),
      D => D(27),
      Q => Q(27),
      R => SR(0)
    );
\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[47]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => \^e\(0),
      D => D(28),
      Q => Q(28),
      R => SR(0)
    );
\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[48]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => \^e\(0),
      D => D(29),
      Q => Q(29),
      R => SR(0)
    );
\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[49]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => \^e\(0),
      D => D(30),
      Q => Q(30),
      R => SR(0)
    );
\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => \^e\(0),
      D => D(4),
      Q => Q(4),
      R => SR(0)
    );
\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[50]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => \^e\(0),
      D => D(31),
      Q => Q(31),
      R => SR(0)
    );
\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[51]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => \^e\(0),
      D => D(32),
      Q => Q(32),
      R => SR(0)
    );
\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[52]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => \^e\(0),
      D => D(33),
      Q => Q(33),
      R => SR(0)
    );
\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[53]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => \^e\(0),
      D => D(34),
      Q => Q(34),
      R => SR(0)
    );
\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[54]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => \^e\(0),
      D => D(35),
      Q => Q(35),
      R => SR(0)
    );
\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[55]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => \^e\(0),
      D => D(36),
      Q => Q(36),
      R => SR(0)
    );
\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[56]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => \^e\(0),
      D => D(37),
      Q => Q(37),
      R => SR(0)
    );
\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[57]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => \^e\(0),
      D => D(38),
      Q => Q(38),
      R => SR(0)
    );
\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[58]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => \^e\(0),
      D => D(39),
      Q => Q(39),
      R => SR(0)
    );
\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[59]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => \^e\(0),
      D => D(40),
      Q => Q(40),
      R => SR(0)
    );
\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => \^e\(0),
      D => D(5),
      Q => Q(5),
      R => SR(0)
    );
\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[60]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => \^e\(0),
      D => D(41),
      Q => Q(41),
      R => SR(0)
    );
\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[61]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => \^e\(0),
      D => D(42),
      Q => Q(42),
      R => SR(0)
    );
\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[62]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => \^e\(0),
      D => D(43),
      Q => Q(43),
      R => SR(0)
    );
\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[63]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => \^e\(0),
      D => D(44),
      Q => Q(44),
      R => SR(0)
    );
\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[64]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => \^e\(0),
      D => D(45),
      Q => Q(45),
      R => SR(0)
    );
\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[65]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => \^e\(0),
      D => D(46),
      Q => Q(46),
      R => SR(0)
    );
\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[66]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => \^e\(0),
      D => D(47),
      Q => Q(47),
      R => SR(0)
    );
\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => \^e\(0),
      D => D(6),
      Q => Q(6),
      R => SR(0)
    );
\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => \^e\(0),
      D => D(7),
      Q => Q(7),
      R => SR(0)
    );
\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => \^e\(0),
      D => D(8),
      Q => Q(8),
      R => SR(0)
    );
\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => \^e\(0),
      D => D(9),
      Q => Q(9),
      R => SR(0)
    );
\USE_SINGLE_REG.sig_regfifo_empty_reg_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"BAFF"
    )
        port map (
      I0 => sig_init_done_0,
      I1 => s_axis_mm2s_cmd_tvalid_split,
      I2 => \^s_axis_mm2s_cmd_tready\,
      I3 => \USE_SINGLE_REG.sig_regfifo_empty_reg_reg_0\,
      O => \USE_SINGLE_REG.sig_regfifo_empty_reg_i_1_n_0\
    );
\USE_SINGLE_REG.sig_regfifo_empty_reg_reg\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => '1',
      D => \USE_SINGLE_REG.sig_regfifo_empty_reg_i_1_n_0\,
      Q => \^s_axis_mm2s_cmd_tready\,
      R => SR(0)
    );
\USE_SINGLE_REG.sig_regfifo_full_reg_reg\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => '1',
      D => \USE_SINGLE_REG.sig_regfifo_full_reg_reg_0\,
      Q => sig_cmd2mstr_cmd_valid,
      R => '0'
    );
\sig_init_done_i_1__2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2000"
    )
        port map (
      I0 => sig_cmd_stat_rst_int_reg_n,
      I1 => sig_init_done_0,
      I2 => \GEN_INCLUDE_STATUS_FIFO.I_STS_FIFO/sig_init_reg\,
      I3 => \GEN_INCLUDE_STATUS_FIFO.I_STS_FIFO/sig_init_reg2\,
      O => \sig_init_done_i_1__2_n_0\
    );
\sig_init_done_i_1__3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2000"
    )
        port map (
      I0 => sig_cmd_stat_rst_int_reg_n,
      I1 => sig_init_done,
      I2 => \GEN_INCLUDE_STATUS_FIFO.I_STS_FIFO/sig_init_reg\,
      I3 => \GEN_INCLUDE_STATUS_FIFO.I_STS_FIFO/sig_init_reg2\,
      O => sig_cmd_stat_rst_int_reg_n_reg
    );
sig_init_done_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => '1',
      D => \sig_init_done_i_1__2_n_0\,
      Q => sig_init_done_0,
      R => '0'
    );
sig_init_reg2_reg: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => '1',
      D => \GEN_INCLUDE_STATUS_FIFO.I_STS_FIFO/sig_init_reg\,
      Q => \GEN_INCLUDE_STATUS_FIFO.I_STS_FIFO/sig_init_reg2\,
      S => SR(0)
    );
sig_init_reg_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => '1',
      D => SR(0),
      Q => \GEN_INCLUDE_STATUS_FIFO.I_STS_FIFO/sig_init_reg\,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_datamover_fifo__parameterized0\ is
  port (
    sig_init_done : out STD_LOGIC;
    \USE_SINGLE_REG.sig_regfifo_full_reg_reg_0\ : out STD_LOGIC;
    \USE_SINGLE_REG.sig_regfifo_empty_reg_reg_0\ : out STD_LOGIC;
    mm2s_decerr_i : out STD_LOGIC;
    mm2s_interr_i : out STD_LOGIC;
    mm2s_slverr_i : out STD_LOGIC;
    sig_init_done_reg_0 : in STD_LOGIC;
    m_axi_mm2s_aclk : in STD_LOGIC;
    SR : in STD_LOGIC_VECTOR ( 0 to 0 );
    mm2s_sts_received : in STD_LOGIC;
    sig_cmd_stat_rst_int_reg_n : in STD_LOGIC;
    sig_rsc2stat_status_valid : in STD_LOGIC;
    m_axis_mm2s_sts_tready : in STD_LOGIC;
    \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[6]_0\ : in STD_LOGIC_VECTOR ( 2 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_datamover_fifo__parameterized0\ : entity is "axi_datamover_fifo";
end \decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_datamover_fifo__parameterized0\;

architecture STRUCTURE of \decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_datamover_fifo__parameterized0\ is
  signal \USE_SINGLE_REG.sig_push_regfifo\ : STD_LOGIC;
  signal \USE_SINGLE_REG.sig_regfifo_empty_reg_i_1__0_n_0\ : STD_LOGIC;
  signal \^use_single_reg.sig_regfifo_empty_reg_reg_0\ : STD_LOGIC;
  signal \USE_SINGLE_REG.sig_regfifo_full_reg_i_1_n_0\ : STD_LOGIC;
  signal \^use_single_reg.sig_regfifo_full_reg_reg_0\ : STD_LOGIC;
  signal m_axis_mm2s_sts_tdata_int : STD_LOGIC_VECTOR ( 6 downto 4 );
  signal \^sig_init_done\ : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of mm2s_decerr_i_i_1 : label is "soft_lutpair38";
  attribute SOFT_HLUTNM of mm2s_interr_i_i_1 : label is "soft_lutpair38";
begin
  \USE_SINGLE_REG.sig_regfifo_empty_reg_reg_0\ <= \^use_single_reg.sig_regfifo_empty_reg_reg_0\;
  \USE_SINGLE_REG.sig_regfifo_full_reg_reg_0\ <= \^use_single_reg.sig_regfifo_full_reg_reg_0\;
  sig_init_done <= \^sig_init_done\;
\USE_SINGLE_REG.sig_regfifo_dout_reg[6]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^use_single_reg.sig_regfifo_empty_reg_reg_0\,
      I1 => sig_rsc2stat_status_valid,
      O => \USE_SINGLE_REG.sig_push_regfifo\
    );
\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => \USE_SINGLE_REG.sig_push_regfifo\,
      D => \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[6]_0\(0),
      Q => m_axis_mm2s_sts_tdata_int(4),
      R => SR(0)
    );
\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => \USE_SINGLE_REG.sig_push_regfifo\,
      D => \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[6]_0\(1),
      Q => m_axis_mm2s_sts_tdata_int(5),
      R => SR(0)
    );
\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => \USE_SINGLE_REG.sig_push_regfifo\,
      D => \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[6]_0\(2),
      Q => m_axis_mm2s_sts_tdata_int(6),
      R => SR(0)
    );
\USE_SINGLE_REG.sig_regfifo_empty_reg_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F8FFF8F8"
    )
        port map (
      I0 => m_axis_mm2s_sts_tready,
      I1 => \^use_single_reg.sig_regfifo_full_reg_reg_0\,
      I2 => \^sig_init_done\,
      I3 => sig_rsc2stat_status_valid,
      I4 => \^use_single_reg.sig_regfifo_empty_reg_reg_0\,
      O => \USE_SINGLE_REG.sig_regfifo_empty_reg_i_1__0_n_0\
    );
\USE_SINGLE_REG.sig_regfifo_empty_reg_reg\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => '1',
      D => \USE_SINGLE_REG.sig_regfifo_empty_reg_i_1__0_n_0\,
      Q => \^use_single_reg.sig_regfifo_empty_reg_reg_0\,
      R => SR(0)
    );
\USE_SINGLE_REG.sig_regfifo_full_reg_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0080AA80"
    )
        port map (
      I0 => sig_cmd_stat_rst_int_reg_n,
      I1 => sig_rsc2stat_status_valid,
      I2 => \^use_single_reg.sig_regfifo_empty_reg_reg_0\,
      I3 => \^use_single_reg.sig_regfifo_full_reg_reg_0\,
      I4 => m_axis_mm2s_sts_tready,
      O => \USE_SINGLE_REG.sig_regfifo_full_reg_i_1_n_0\
    );
\USE_SINGLE_REG.sig_regfifo_full_reg_reg\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => '1',
      D => \USE_SINGLE_REG.sig_regfifo_full_reg_i_1_n_0\,
      Q => \^use_single_reg.sig_regfifo_full_reg_reg_0\,
      R => '0'
    );
mm2s_decerr_i_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => mm2s_sts_received,
      I1 => \^use_single_reg.sig_regfifo_full_reg_reg_0\,
      I2 => m_axis_mm2s_sts_tdata_int(5),
      O => mm2s_decerr_i
    );
mm2s_interr_i_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => mm2s_sts_received,
      I1 => \^use_single_reg.sig_regfifo_full_reg_reg_0\,
      I2 => m_axis_mm2s_sts_tdata_int(4),
      O => mm2s_interr_i
    );
mm2s_slverr_i_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => mm2s_sts_received,
      I1 => \^use_single_reg.sig_regfifo_full_reg_reg_0\,
      I2 => m_axis_mm2s_sts_tdata_int(6),
      O => mm2s_slverr_i
    );
sig_init_done_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => '1',
      D => sig_init_done_reg_0,
      Q => \^sig_init_done\,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_datamover_pcc is
  port (
    sig_init_reg : out STD_LOGIC;
    \in\ : out STD_LOGIC_VECTOR ( 35 downto 0 );
    sig_mstr2sf_cmd_valid : out STD_LOGIC;
    sig_mstr2data_cmd_valid : out STD_LOGIC;
    sig_mstr2addr_cmd_valid : out STD_LOGIC;
    sig_mstr2data_sequential : out STD_LOGIC;
    sig_cmd_stat_rst_int_reg_n_reg : out STD_LOGIC;
    sig_input_reg_empty_reg_0 : out STD_LOGIC;
    sig_cmd2data_valid_reg_0 : out STD_LOGIC;
    sig_calc_error_reg_reg_0 : out STD_LOGIC_VECTOR ( 33 downto 0 );
    SS : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_mm2s_aclk : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 47 downto 0 );
    sig_cmd_stat_rst_int_reg_n : in STD_LOGIC;
    E : in STD_LOGIC_VECTOR ( 0 to 0 );
    sig_cmd2mstr_cmd_valid : in STD_LOGIC;
    \sig_addr_cntr_lsh_im0_reg[0]_0\ : in STD_LOGIC;
    sig_cmd2dre_valid_reg_0 : in STD_LOGIC;
    sig_inhibit_rdy_n : in STD_LOGIC;
    sig_cmd2data_valid_reg_1 : in STD_LOGIC;
    sig_inhibit_rdy_n_0 : in STD_LOGIC;
    sig_inhibit_rdy_n_1 : in STD_LOGIC;
    sig_cmd2addr_valid_reg_0 : in STD_LOGIC
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_datamover_pcc;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_datamover_pcc is
  signal \FSM_onehot_sig_pcc_sm_state[1]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_sig_pcc_sm_state[2]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_sig_pcc_sm_state[5]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_sig_pcc_sm_state[6]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_sig_pcc_sm_state[7]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_sig_pcc_sm_state_reg_n_0_[0]\ : STD_LOGIC;
  signal \FSM_onehot_sig_pcc_sm_state_reg_n_0_[1]\ : STD_LOGIC;
  signal \FSM_onehot_sig_pcc_sm_state_reg_n_0_[5]\ : STD_LOGIC;
  signal \FSM_onehot_sig_pcc_sm_state_reg_n_0_[6]\ : STD_LOGIC;
  signal \FSM_onehot_sig_pcc_sm_state_reg_n_0_[7]\ : STD_LOGIC;
  signal \I_STRT_STRB_GEN/GEN_OFF_LEN_CASE.lsig_end_addr_us__37\ : STD_LOGIC_VECTOR ( 1 to 1 );
  signal \I_STRT_STRB_GEN/GEN_OFF_LEN_CASE.lsig_length_adjust_us__3\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \I_STRT_STRB_GEN/sig_end_offset_un\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \^in\ : STD_LOGIC_VECTOR ( 35 downto 0 );
  signal p_0_in : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal p_0_in_0 : STD_LOGIC;
  signal p_1_in : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal p_1_in_1 : STD_LOGIC;
  signal sel0 : STD_LOGIC_VECTOR ( 3 to 3 );
  signal sig_addr_aligned_im0 : STD_LOGIC;
  signal sig_addr_aligned_ireg1 : STD_LOGIC;
  signal \sig_addr_cntr_im0_msh[11]_i_2_n_0\ : STD_LOGIC;
  signal \sig_addr_cntr_im0_msh[13]_i_2_n_0\ : STD_LOGIC;
  signal \sig_addr_cntr_im0_msh[15]_i_1_n_0\ : STD_LOGIC;
  signal \sig_addr_cntr_im0_msh[15]_i_3_n_0\ : STD_LOGIC;
  signal \sig_addr_cntr_im0_msh[4]_i_2_n_0\ : STD_LOGIC;
  signal \sig_addr_cntr_im0_msh[7]_i_2_n_0\ : STD_LOGIC;
  signal \sig_addr_cntr_im0_msh[8]_i_2_n_0\ : STD_LOGIC;
  signal sig_addr_cntr_im0_msh_reg : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \sig_addr_cntr_incr_ireg2[0]_i_1_n_0\ : STD_LOGIC;
  signal \sig_addr_cntr_incr_ireg2[1]_i_1_n_0\ : STD_LOGIC;
  signal \sig_addr_cntr_incr_ireg2[2]_i_1_n_0\ : STD_LOGIC;
  signal \sig_addr_cntr_incr_ireg2[3]_i_1_n_0\ : STD_LOGIC;
  signal \sig_addr_cntr_incr_ireg2[4]_i_1_n_0\ : STD_LOGIC;
  signal \sig_addr_cntr_incr_ireg2[5]_i_1_n_0\ : STD_LOGIC;
  signal \sig_addr_cntr_incr_ireg2[6]_i_1_n_0\ : STD_LOGIC;
  signal \sig_addr_cntr_incr_ireg2_reg_n_0_[0]\ : STD_LOGIC;
  signal \sig_addr_cntr_incr_ireg2_reg_n_0_[1]\ : STD_LOGIC;
  signal \sig_addr_cntr_incr_ireg2_reg_n_0_[2]\ : STD_LOGIC;
  signal \sig_addr_cntr_incr_ireg2_reg_n_0_[3]\ : STD_LOGIC;
  signal \sig_addr_cntr_incr_ireg2_reg_n_0_[4]\ : STD_LOGIC;
  signal \sig_addr_cntr_incr_ireg2_reg_n_0_[5]\ : STD_LOGIC;
  signal \sig_addr_cntr_incr_ireg2_reg_n_0_[6]\ : STD_LOGIC;
  signal \sig_addr_cntr_lsh_im0[15]_i_1_n_0\ : STD_LOGIC;
  signal \sig_addr_cntr_lsh_im0_reg_n_0_[10]\ : STD_LOGIC;
  signal \sig_addr_cntr_lsh_im0_reg_n_0_[11]\ : STD_LOGIC;
  signal \sig_addr_cntr_lsh_im0_reg_n_0_[12]\ : STD_LOGIC;
  signal \sig_addr_cntr_lsh_im0_reg_n_0_[13]\ : STD_LOGIC;
  signal \sig_addr_cntr_lsh_im0_reg_n_0_[14]\ : STD_LOGIC;
  signal \sig_addr_cntr_lsh_im0_reg_n_0_[6]\ : STD_LOGIC;
  signal \sig_addr_cntr_lsh_im0_reg_n_0_[7]\ : STD_LOGIC;
  signal \sig_addr_cntr_lsh_im0_reg_n_0_[8]\ : STD_LOGIC;
  signal \sig_addr_cntr_lsh_im0_reg_n_0_[9]\ : STD_LOGIC;
  signal sig_addr_cntr_lsh_kh : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal sig_adjusted_addr_incr_im1 : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal \sig_adjusted_addr_incr_ireg2[1]_i_2_n_0\ : STD_LOGIC;
  signal \sig_adjusted_addr_incr_ireg2[2]_i_2_n_0\ : STD_LOGIC;
  signal \sig_adjusted_addr_incr_ireg2[5]_i_2_n_0\ : STD_LOGIC;
  signal \sig_adjusted_addr_incr_ireg2_reg_n_0_[0]\ : STD_LOGIC;
  signal \sig_adjusted_addr_incr_ireg2_reg_n_0_[1]\ : STD_LOGIC;
  signal \sig_adjusted_addr_incr_ireg2_reg_n_0_[2]\ : STD_LOGIC;
  signal \sig_adjusted_addr_incr_ireg2_reg_n_0_[3]\ : STD_LOGIC;
  signal \sig_adjusted_addr_incr_ireg2_reg_n_0_[4]\ : STD_LOGIC;
  signal \sig_adjusted_addr_incr_ireg2_reg_n_0_[5]\ : STD_LOGIC;
  signal sig_brst_cnt_eq_one_im0 : STD_LOGIC;
  signal sig_brst_cnt_eq_one_ireg1 : STD_LOGIC;
  signal sig_brst_cnt_eq_zero_im0 : STD_LOGIC;
  signal sig_brst_cnt_eq_zero_ireg1 : STD_LOGIC;
  signal \sig_btt_cntr_im0[13]_i_2_n_0\ : STD_LOGIC;
  signal \sig_btt_cntr_im0[13]_i_3_n_0\ : STD_LOGIC;
  signal \sig_btt_cntr_im0[13]_i_4_n_0\ : STD_LOGIC;
  signal \sig_btt_cntr_im0[13]_i_5_n_0\ : STD_LOGIC;
  signal \sig_btt_cntr_im0[13]_i_6_n_0\ : STD_LOGIC;
  signal \sig_btt_cntr_im0[13]_i_7_n_0\ : STD_LOGIC;
  signal \sig_btt_cntr_im0[13]_i_8_n_0\ : STD_LOGIC;
  signal \sig_btt_cntr_im0[7]_i_10_n_0\ : STD_LOGIC;
  signal \sig_btt_cntr_im0[7]_i_11_n_0\ : STD_LOGIC;
  signal \sig_btt_cntr_im0[7]_i_12_n_0\ : STD_LOGIC;
  signal \sig_btt_cntr_im0[7]_i_13_n_0\ : STD_LOGIC;
  signal \sig_btt_cntr_im0[7]_i_14_n_0\ : STD_LOGIC;
  signal \sig_btt_cntr_im0[7]_i_15_n_0\ : STD_LOGIC;
  signal \sig_btt_cntr_im0[7]_i_16_n_0\ : STD_LOGIC;
  signal \sig_btt_cntr_im0[7]_i_2_n_0\ : STD_LOGIC;
  signal \sig_btt_cntr_im0[7]_i_3_n_0\ : STD_LOGIC;
  signal \sig_btt_cntr_im0[7]_i_4_n_0\ : STD_LOGIC;
  signal \sig_btt_cntr_im0[7]_i_5_n_0\ : STD_LOGIC;
  signal \sig_btt_cntr_im0[7]_i_6_n_0\ : STD_LOGIC;
  signal \sig_btt_cntr_im0[7]_i_7_n_0\ : STD_LOGIC;
  signal \sig_btt_cntr_im0[7]_i_8_n_0\ : STD_LOGIC;
  signal \sig_btt_cntr_im0[7]_i_9_n_0\ : STD_LOGIC;
  signal \sig_btt_cntr_im0_reg[13]_i_1_n_10\ : STD_LOGIC;
  signal \sig_btt_cntr_im0_reg[13]_i_1_n_11\ : STD_LOGIC;
  signal \sig_btt_cntr_im0_reg[13]_i_1_n_12\ : STD_LOGIC;
  signal \sig_btt_cntr_im0_reg[13]_i_1_n_13\ : STD_LOGIC;
  signal \sig_btt_cntr_im0_reg[13]_i_1_n_14\ : STD_LOGIC;
  signal \sig_btt_cntr_im0_reg[13]_i_1_n_15\ : STD_LOGIC;
  signal \sig_btt_cntr_im0_reg[13]_i_1_n_3\ : STD_LOGIC;
  signal \sig_btt_cntr_im0_reg[13]_i_1_n_4\ : STD_LOGIC;
  signal \sig_btt_cntr_im0_reg[13]_i_1_n_5\ : STD_LOGIC;
  signal \sig_btt_cntr_im0_reg[13]_i_1_n_6\ : STD_LOGIC;
  signal \sig_btt_cntr_im0_reg[13]_i_1_n_7\ : STD_LOGIC;
  signal \sig_btt_cntr_im0_reg[7]_i_1_n_0\ : STD_LOGIC;
  signal \sig_btt_cntr_im0_reg[7]_i_1_n_1\ : STD_LOGIC;
  signal \sig_btt_cntr_im0_reg[7]_i_1_n_10\ : STD_LOGIC;
  signal \sig_btt_cntr_im0_reg[7]_i_1_n_11\ : STD_LOGIC;
  signal \sig_btt_cntr_im0_reg[7]_i_1_n_12\ : STD_LOGIC;
  signal \sig_btt_cntr_im0_reg[7]_i_1_n_13\ : STD_LOGIC;
  signal \sig_btt_cntr_im0_reg[7]_i_1_n_14\ : STD_LOGIC;
  signal \sig_btt_cntr_im0_reg[7]_i_1_n_15\ : STD_LOGIC;
  signal \sig_btt_cntr_im0_reg[7]_i_1_n_2\ : STD_LOGIC;
  signal \sig_btt_cntr_im0_reg[7]_i_1_n_3\ : STD_LOGIC;
  signal \sig_btt_cntr_im0_reg[7]_i_1_n_4\ : STD_LOGIC;
  signal \sig_btt_cntr_im0_reg[7]_i_1_n_5\ : STD_LOGIC;
  signal \sig_btt_cntr_im0_reg[7]_i_1_n_6\ : STD_LOGIC;
  signal \sig_btt_cntr_im0_reg[7]_i_1_n_7\ : STD_LOGIC;
  signal \sig_btt_cntr_im0_reg[7]_i_1_n_8\ : STD_LOGIC;
  signal \sig_btt_cntr_im0_reg[7]_i_1_n_9\ : STD_LOGIC;
  signal \sig_btt_cntr_im0_reg_n_0_[0]\ : STD_LOGIC;
  signal \sig_btt_cntr_im0_reg_n_0_[10]\ : STD_LOGIC;
  signal \sig_btt_cntr_im0_reg_n_0_[11]\ : STD_LOGIC;
  signal \sig_btt_cntr_im0_reg_n_0_[12]\ : STD_LOGIC;
  signal \sig_btt_cntr_im0_reg_n_0_[13]\ : STD_LOGIC;
  signal \sig_btt_cntr_im0_reg_n_0_[1]\ : STD_LOGIC;
  signal \sig_btt_cntr_im0_reg_n_0_[2]\ : STD_LOGIC;
  signal \sig_btt_cntr_im0_reg_n_0_[3]\ : STD_LOGIC;
  signal \sig_btt_cntr_im0_reg_n_0_[4]\ : STD_LOGIC;
  signal \sig_btt_cntr_im0_reg_n_0_[5]\ : STD_LOGIC;
  signal \sig_btt_cntr_im0_reg_n_0_[6]\ : STD_LOGIC;
  signal \sig_btt_cntr_im0_reg_n_0_[7]\ : STD_LOGIC;
  signal \sig_btt_cntr_im0_reg_n_0_[8]\ : STD_LOGIC;
  signal \sig_btt_cntr_im0_reg_n_0_[9]\ : STD_LOGIC;
  signal sig_btt_eq_b2mbaa_im0 : STD_LOGIC;
  signal sig_btt_eq_b2mbaa_ireg1 : STD_LOGIC;
  signal sig_btt_eq_b2mbaa_ireg1_i_2_n_0 : STD_LOGIC;
  signal sig_btt_eq_b2mbaa_ireg1_i_3_n_0 : STD_LOGIC;
  signal sig_btt_eq_b2mbaa_ireg1_i_4_n_0 : STD_LOGIC;
  signal sig_btt_is_zero : STD_LOGIC;
  signal sig_btt_lt_b2mbaa_im0 : STD_LOGIC;
  signal sig_btt_lt_b2mbaa_im01 : STD_LOGIC;
  signal sig_btt_lt_b2mbaa_im01_carry_i_1_n_0 : STD_LOGIC;
  signal sig_btt_lt_b2mbaa_im01_carry_i_2_n_0 : STD_LOGIC;
  signal sig_btt_lt_b2mbaa_im01_carry_i_3_n_0 : STD_LOGIC;
  signal sig_btt_lt_b2mbaa_im01_carry_i_4_n_0 : STD_LOGIC;
  signal sig_btt_lt_b2mbaa_im01_carry_i_5_n_0 : STD_LOGIC;
  signal sig_btt_lt_b2mbaa_im01_carry_i_6_n_0 : STD_LOGIC;
  signal sig_btt_lt_b2mbaa_im01_carry_i_7_n_0 : STD_LOGIC;
  signal sig_btt_lt_b2mbaa_im01_carry_i_8_n_0 : STD_LOGIC;
  signal sig_btt_lt_b2mbaa_im01_carry_i_9_n_0 : STD_LOGIC;
  signal sig_btt_lt_b2mbaa_im01_carry_n_5 : STD_LOGIC;
  signal sig_btt_lt_b2mbaa_im01_carry_n_6 : STD_LOGIC;
  signal sig_btt_lt_b2mbaa_im01_carry_n_7 : STD_LOGIC;
  signal sig_btt_lt_b2mbaa_ireg1 : STD_LOGIC;
  signal sig_btt_lt_b2mbaa_ireg1_i_2_n_0 : STD_LOGIC;
  signal sig_btt_lt_b2mbaa_ireg1_i_3_n_0 : STD_LOGIC;
  signal sig_bytes_to_mbaa_im0 : STD_LOGIC_VECTOR ( 5 downto 1 );
  signal sig_bytes_to_mbaa_ireg1 : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal sig_calc_error_pushed : STD_LOGIC;
  signal sig_calc_error_pushed_i_1_n_0 : STD_LOGIC;
  signal sig_calc_error_reg_i_2_n_0 : STD_LOGIC;
  signal sig_calc_error_reg_i_3_n_0 : STD_LOGIC;
  signal sig_cmd2addr_valid_i_1_n_0 : STD_LOGIC;
  signal sig_cmd2data_valid_i_1_n_0 : STD_LOGIC;
  signal sig_cmd2dre_valid_i_1_n_0 : STD_LOGIC;
  signal sig_first_xfer_im0 : STD_LOGIC;
  signal sig_first_xfer_im0_i_1_n_0 : STD_LOGIC;
  signal \^sig_init_reg\ : STD_LOGIC;
  signal sig_input_cache_type_reg0 : STD_LOGIC;
  signal sig_input_reg_empty : STD_LOGIC;
  signal sig_ld_xfer_reg : STD_LOGIC;
  signal sig_ld_xfer_reg_i_1_n_0 : STD_LOGIC;
  signal sig_ld_xfer_reg_tmp : STD_LOGIC;
  signal sig_ld_xfer_reg_tmp_i_1_n_0 : STD_LOGIC;
  signal sig_mbaa_addr_cntr_slice_im0 : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal \^sig_mstr2addr_cmd_valid\ : STD_LOGIC;
  signal \^sig_mstr2data_cmd_valid\ : STD_LOGIC;
  signal \^sig_mstr2data_sequential\ : STD_LOGIC;
  signal \^sig_mstr2sf_cmd_valid\ : STD_LOGIC;
  signal sig_mstr2sf_eof : STD_LOGIC;
  signal sig_no_btt_residue_im0 : STD_LOGIC;
  signal sig_no_btt_residue_ireg1 : STD_LOGIC;
  signal sig_parent_done : STD_LOGIC;
  signal sig_parent_done_i_1_n_0 : STD_LOGIC;
  signal sig_predict_addr_lsh_im2 : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \sig_predict_addr_lsh_ireg3[7]_i_2_n_0\ : STD_LOGIC;
  signal \sig_predict_addr_lsh_ireg3[7]_i_3_n_0\ : STD_LOGIC;
  signal \sig_predict_addr_lsh_ireg3[7]_i_4_n_0\ : STD_LOGIC;
  signal \sig_predict_addr_lsh_ireg3[7]_i_5_n_0\ : STD_LOGIC;
  signal \sig_predict_addr_lsh_ireg3[7]_i_6_n_0\ : STD_LOGIC;
  signal \sig_predict_addr_lsh_ireg3[7]_i_7_n_0\ : STD_LOGIC;
  signal \sig_predict_addr_lsh_ireg3[7]_i_8_n_0\ : STD_LOGIC;
  signal \sig_predict_addr_lsh_ireg3_reg[15]_i_1_n_1\ : STD_LOGIC;
  signal \sig_predict_addr_lsh_ireg3_reg[15]_i_1_n_2\ : STD_LOGIC;
  signal \sig_predict_addr_lsh_ireg3_reg[15]_i_1_n_3\ : STD_LOGIC;
  signal \sig_predict_addr_lsh_ireg3_reg[15]_i_1_n_4\ : STD_LOGIC;
  signal \sig_predict_addr_lsh_ireg3_reg[15]_i_1_n_5\ : STD_LOGIC;
  signal \sig_predict_addr_lsh_ireg3_reg[15]_i_1_n_6\ : STD_LOGIC;
  signal \sig_predict_addr_lsh_ireg3_reg[15]_i_1_n_7\ : STD_LOGIC;
  signal \sig_predict_addr_lsh_ireg3_reg[7]_i_1_n_0\ : STD_LOGIC;
  signal \sig_predict_addr_lsh_ireg3_reg[7]_i_1_n_1\ : STD_LOGIC;
  signal \sig_predict_addr_lsh_ireg3_reg[7]_i_1_n_2\ : STD_LOGIC;
  signal \sig_predict_addr_lsh_ireg3_reg[7]_i_1_n_3\ : STD_LOGIC;
  signal \sig_predict_addr_lsh_ireg3_reg[7]_i_1_n_4\ : STD_LOGIC;
  signal \sig_predict_addr_lsh_ireg3_reg[7]_i_1_n_5\ : STD_LOGIC;
  signal \sig_predict_addr_lsh_ireg3_reg[7]_i_1_n_6\ : STD_LOGIC;
  signal \sig_predict_addr_lsh_ireg3_reg[7]_i_1_n_7\ : STD_LOGIC;
  signal \sig_predict_addr_lsh_ireg3_reg_n_0_[0]\ : STD_LOGIC;
  signal \sig_predict_addr_lsh_ireg3_reg_n_0_[10]\ : STD_LOGIC;
  signal \sig_predict_addr_lsh_ireg3_reg_n_0_[11]\ : STD_LOGIC;
  signal \sig_predict_addr_lsh_ireg3_reg_n_0_[12]\ : STD_LOGIC;
  signal \sig_predict_addr_lsh_ireg3_reg_n_0_[13]\ : STD_LOGIC;
  signal \sig_predict_addr_lsh_ireg3_reg_n_0_[14]\ : STD_LOGIC;
  signal \sig_predict_addr_lsh_ireg3_reg_n_0_[1]\ : STD_LOGIC;
  signal \sig_predict_addr_lsh_ireg3_reg_n_0_[2]\ : STD_LOGIC;
  signal \sig_predict_addr_lsh_ireg3_reg_n_0_[3]\ : STD_LOGIC;
  signal \sig_predict_addr_lsh_ireg3_reg_n_0_[4]\ : STD_LOGIC;
  signal \sig_predict_addr_lsh_ireg3_reg_n_0_[5]\ : STD_LOGIC;
  signal \sig_predict_addr_lsh_ireg3_reg_n_0_[6]\ : STD_LOGIC;
  signal \sig_predict_addr_lsh_ireg3_reg_n_0_[7]\ : STD_LOGIC;
  signal \sig_predict_addr_lsh_ireg3_reg_n_0_[8]\ : STD_LOGIC;
  signal \sig_predict_addr_lsh_ireg3_reg_n_0_[9]\ : STD_LOGIC;
  signal sig_push_input_reg11_out : STD_LOGIC;
  signal sig_sm_halt_ns : STD_LOGIC;
  signal sig_sm_halt_reg : STD_LOGIC;
  signal sig_sm_ld_calc2_reg : STD_LOGIC;
  signal sig_sm_ld_calc2_reg_ns : STD_LOGIC;
  signal sig_sm_ld_calc3_reg : STD_LOGIC;
  signal sig_sm_pop_input_reg : STD_LOGIC;
  signal sig_sm_pop_input_reg_ns : STD_LOGIC;
  signal sig_strbgen_addr_ireg2 : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal sig_strbgen_bytes_ireg2 : STD_LOGIC_VECTOR ( 4 to 4 );
  signal \sig_strbgen_bytes_ireg2[3]_i_1_n_0\ : STD_LOGIC;
  signal \sig_strbgen_bytes_ireg2[4]_i_1_n_0\ : STD_LOGIC;
  signal \sig_strbgen_bytes_ireg2_reg_n_0_[0]\ : STD_LOGIC;
  signal \sig_strbgen_bytes_ireg2_reg_n_0_[1]\ : STD_LOGIC;
  signal \sig_strbgen_bytes_ireg2_reg_n_0_[2]\ : STD_LOGIC;
  signal \sig_strbgen_bytes_ireg2_reg_n_0_[3]\ : STD_LOGIC;
  signal \sig_strbgen_bytes_ireg2_reg_n_0_[4]\ : STD_LOGIC;
  signal sig_xfer_end_strb_ireg3 : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \sig_xfer_end_strb_ireg3[10]_i_1_n_0\ : STD_LOGIC;
  signal \sig_xfer_end_strb_ireg3[11]_i_1_n_0\ : STD_LOGIC;
  signal \sig_xfer_end_strb_ireg3[12]_i_1_n_0\ : STD_LOGIC;
  signal \sig_xfer_end_strb_ireg3[13]_i_1_n_0\ : STD_LOGIC;
  signal \sig_xfer_end_strb_ireg3[14]_i_1_n_0\ : STD_LOGIC;
  signal \sig_xfer_end_strb_ireg3[15]_i_1_n_0\ : STD_LOGIC;
  signal \sig_xfer_end_strb_ireg3[1]_i_1_n_0\ : STD_LOGIC;
  signal \sig_xfer_end_strb_ireg3[2]_i_1_n_0\ : STD_LOGIC;
  signal \sig_xfer_end_strb_ireg3[3]_i_1_n_0\ : STD_LOGIC;
  signal \sig_xfer_end_strb_ireg3[4]_i_1_n_0\ : STD_LOGIC;
  signal \sig_xfer_end_strb_ireg3[5]_i_1_n_0\ : STD_LOGIC;
  signal \sig_xfer_end_strb_ireg3[6]_i_1_n_0\ : STD_LOGIC;
  signal \sig_xfer_end_strb_ireg3[7]_i_1_n_0\ : STD_LOGIC;
  signal \sig_xfer_end_strb_ireg3[9]_i_1_n_0\ : STD_LOGIC;
  signal sig_xfer_len_eq_0_ireg3 : STD_LOGIC;
  signal sig_xfer_len_eq_0_ireg3_i_1_n_0 : STD_LOGIC;
  signal sig_xfer_reg_empty : STD_LOGIC;
  signal sig_xfer_reg_empty_i_1_n_0 : STD_LOGIC;
  signal sig_xfer_strt_strb_im2 : STD_LOGIC_VECTOR ( 14 downto 1 );
  signal sig_xfer_strt_strb_ireg3 : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \sig_xfer_strt_strb_ireg3[0]_i_1_n_0\ : STD_LOGIC;
  signal \sig_xfer_strt_strb_ireg3[10]_i_2_n_0\ : STD_LOGIC;
  signal \sig_xfer_strt_strb_ireg3[12]_i_1_n_0\ : STD_LOGIC;
  signal \sig_xfer_strt_strb_ireg3[13]_i_2_n_0\ : STD_LOGIC;
  signal \sig_xfer_strt_strb_ireg3[14]_i_2_n_0\ : STD_LOGIC;
  signal \sig_xfer_strt_strb_ireg3[15]_i_10_n_0\ : STD_LOGIC;
  signal \sig_xfer_strt_strb_ireg3[15]_i_11_n_0\ : STD_LOGIC;
  signal \sig_xfer_strt_strb_ireg3[15]_i_12_n_0\ : STD_LOGIC;
  signal \sig_xfer_strt_strb_ireg3[15]_i_13_n_0\ : STD_LOGIC;
  signal \sig_xfer_strt_strb_ireg3[15]_i_14_n_0\ : STD_LOGIC;
  signal \sig_xfer_strt_strb_ireg3[15]_i_15_n_0\ : STD_LOGIC;
  signal \sig_xfer_strt_strb_ireg3[15]_i_1_n_0\ : STD_LOGIC;
  signal \sig_xfer_strt_strb_ireg3[15]_i_6_n_0\ : STD_LOGIC;
  signal \sig_xfer_strt_strb_ireg3[15]_i_7_n_0\ : STD_LOGIC;
  signal \sig_xfer_strt_strb_ireg3[15]_i_9_n_0\ : STD_LOGIC;
  signal \sig_xfer_strt_strb_ireg3[7]_i_1_n_0\ : STD_LOGIC;
  signal \sig_xfer_strt_strb_ireg3[9]_i_2_n_0\ : STD_LOGIC;
  signal \NLW_sig_btt_cntr_im0_reg[13]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 5 );
  signal \NLW_sig_btt_cntr_im0_reg[13]_i_1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 6 );
  signal NLW_sig_btt_lt_b2mbaa_im01_carry_CO_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 4 );
  signal NLW_sig_btt_lt_b2mbaa_im01_carry_O_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_sig_predict_addr_lsh_ireg3_reg[15]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 to 7 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \FSM_onehot_sig_pcc_sm_state[2]_i_1\ : label is "soft_lutpair71";
  attribute SOFT_HLUTNM of \FSM_onehot_sig_pcc_sm_state[5]_i_1\ : label is "soft_lutpair85";
  attribute SOFT_HLUTNM of \FSM_onehot_sig_pcc_sm_state[6]_i_1\ : label is "soft_lutpair85";
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \FSM_onehot_sig_pcc_sm_state_reg[0]\ : label is "init:00000001,calc_2:00001000,calc_3:00010000,wait_on_xfer_push:00100000,chk_if_done:01000000,error_trap:10000000,calc_1:00000100,wait_for_cmd:00000010";
  attribute FSM_ENCODED_STATES of \FSM_onehot_sig_pcc_sm_state_reg[1]\ : label is "init:00000001,calc_2:00001000,calc_3:00010000,wait_on_xfer_push:00100000,chk_if_done:01000000,error_trap:10000000,calc_1:00000100,wait_for_cmd:00000010";
  attribute FSM_ENCODED_STATES of \FSM_onehot_sig_pcc_sm_state_reg[2]\ : label is "init:00000001,calc_2:00001000,calc_3:00010000,wait_on_xfer_push:00100000,chk_if_done:01000000,error_trap:10000000,calc_1:00000100,wait_for_cmd:00000010";
  attribute FSM_ENCODED_STATES of \FSM_onehot_sig_pcc_sm_state_reg[5]\ : label is "init:00000001,calc_2:00001000,calc_3:00010000,wait_on_xfer_push:00100000,chk_if_done:01000000,error_trap:10000000,calc_1:00000100,wait_for_cmd:00000010";
  attribute FSM_ENCODED_STATES of \FSM_onehot_sig_pcc_sm_state_reg[6]\ : label is "init:00000001,calc_2:00001000,calc_3:00010000,wait_on_xfer_push:00100000,chk_if_done:01000000,error_trap:10000000,calc_1:00000100,wait_for_cmd:00000010";
  attribute FSM_ENCODED_STATES of \FSM_onehot_sig_pcc_sm_state_reg[7]\ : label is "init:00000001,calc_2:00001000,calc_3:00010000,wait_on_xfer_push:00100000,chk_if_done:01000000,error_trap:10000000,calc_1:00000100,wait_for_cmd:00000010";
  attribute SOFT_HLUTNM of \data_reg[3][10]_srl4_i_1\ : label is "soft_lutpair52";
  attribute SOFT_HLUTNM of \data_reg[3][11]_srl4_i_1\ : label is "soft_lutpair53";
  attribute SOFT_HLUTNM of \data_reg[3][12]_srl4_i_1\ : label is "soft_lutpair54";
  attribute SOFT_HLUTNM of \data_reg[3][13]_srl4_i_1\ : label is "soft_lutpair55";
  attribute SOFT_HLUTNM of \data_reg[3][14]_srl4_i_1\ : label is "soft_lutpair56";
  attribute SOFT_HLUTNM of \data_reg[3][15]_srl4_i_1\ : label is "soft_lutpair57";
  attribute SOFT_HLUTNM of \data_reg[3][16]_srl4_i_1\ : label is "soft_lutpair58";
  attribute SOFT_HLUTNM of \data_reg[3][17]_srl4_i_1\ : label is "soft_lutpair59";
  attribute SOFT_HLUTNM of \data_reg[3][18]_srl4_i_1\ : label is "soft_lutpair60";
  attribute SOFT_HLUTNM of \data_reg[3][19]_srl4_i_1\ : label is "soft_lutpair61";
  attribute SOFT_HLUTNM of \data_reg[3][20]_srl4_i_1\ : label is "soft_lutpair62";
  attribute SOFT_HLUTNM of \data_reg[3][21]_srl4_i_1\ : label is "soft_lutpair63";
  attribute SOFT_HLUTNM of \data_reg[3][22]_srl4_i_1\ : label is "soft_lutpair64";
  attribute SOFT_HLUTNM of \data_reg[3][22]_srl4_i_1__0\ : label is "soft_lutpair69";
  attribute SOFT_HLUTNM of \data_reg[3][23]_srl4_i_1\ : label is "soft_lutpair49";
  attribute SOFT_HLUTNM of \data_reg[3][23]_srl4_i_1__0\ : label is "soft_lutpair96";
  attribute SOFT_HLUTNM of \data_reg[3][24]_srl4_i_1\ : label is "soft_lutpair50";
  attribute SOFT_HLUTNM of \data_reg[3][24]_srl4_i_1__0\ : label is "soft_lutpair95";
  attribute SOFT_HLUTNM of \data_reg[3][25]_srl4_i_1\ : label is "soft_lutpair51";
  attribute SOFT_HLUTNM of \data_reg[3][25]_srl4_i_1__0\ : label is "soft_lutpair95";
  attribute SOFT_HLUTNM of \data_reg[3][26]_srl4_i_1\ : label is "soft_lutpair52";
  attribute SOFT_HLUTNM of \data_reg[3][26]_srl4_i_1__0\ : label is "soft_lutpair93";
  attribute SOFT_HLUTNM of \data_reg[3][27]_srl4_i_1\ : label is "soft_lutpair53";
  attribute SOFT_HLUTNM of \data_reg[3][27]_srl4_i_1__0\ : label is "soft_lutpair91";
  attribute SOFT_HLUTNM of \data_reg[3][28]_srl4_i_1\ : label is "soft_lutpair54";
  attribute SOFT_HLUTNM of \data_reg[3][28]_srl4_i_1__0\ : label is "soft_lutpair92";
  attribute SOFT_HLUTNM of \data_reg[3][29]_srl4_i_1\ : label is "soft_lutpair55";
  attribute SOFT_HLUTNM of \data_reg[3][29]_srl4_i_1__0\ : label is "soft_lutpair89";
  attribute SOFT_HLUTNM of \data_reg[3][30]_srl4_i_1\ : label is "soft_lutpair56";
  attribute SOFT_HLUTNM of \data_reg[3][30]_srl4_i_1__0\ : label is "soft_lutpair96";
  attribute SOFT_HLUTNM of \data_reg[3][31]_srl4_i_1\ : label is "soft_lutpair57";
  attribute SOFT_HLUTNM of \data_reg[3][31]_srl4_i_1__0\ : label is "soft_lutpair94";
  attribute SOFT_HLUTNM of \data_reg[3][32]_srl4_i_1\ : label is "soft_lutpair58";
  attribute SOFT_HLUTNM of \data_reg[3][32]_srl4_i_1__0\ : label is "soft_lutpair92";
  attribute SOFT_HLUTNM of \data_reg[3][33]_srl4_i_1\ : label is "soft_lutpair59";
  attribute SOFT_HLUTNM of \data_reg[3][33]_srl4_i_1__0\ : label is "soft_lutpair90";
  attribute SOFT_HLUTNM of \data_reg[3][34]_srl4_i_1\ : label is "soft_lutpair60";
  attribute SOFT_HLUTNM of \data_reg[3][34]_srl4_i_1__0\ : label is "soft_lutpair94";
  attribute SOFT_HLUTNM of \data_reg[3][35]_srl4_i_1\ : label is "soft_lutpair61";
  attribute SOFT_HLUTNM of \data_reg[3][35]_srl4_i_1__0\ : label is "soft_lutpair93";
  attribute SOFT_HLUTNM of \data_reg[3][36]_srl4_i_1\ : label is "soft_lutpair62";
  attribute SOFT_HLUTNM of \data_reg[3][36]_srl4_i_1__0\ : label is "soft_lutpair90";
  attribute SOFT_HLUTNM of \data_reg[3][37]_srl4_i_1\ : label is "soft_lutpair63";
  attribute SOFT_HLUTNM of \data_reg[3][37]_srl4_i_1__0\ : label is "soft_lutpair89";
  attribute SOFT_HLUTNM of \data_reg[3][38]_srl4_i_1\ : label is "soft_lutpair64";
  attribute SOFT_HLUTNM of \data_reg[3][38]_srl4_i_1__0\ : label is "soft_lutpair88";
  attribute SOFT_HLUTNM of \data_reg[3][39]_srl4_i_1\ : label is "soft_lutpair98";
  attribute SOFT_HLUTNM of \data_reg[3][3]_srl4_i_1\ : label is "soft_lutpair83";
  attribute SOFT_HLUTNM of \data_reg[3][40]_srl4_i_1\ : label is "soft_lutpair107";
  attribute SOFT_HLUTNM of \data_reg[3][41]_srl4_i_1\ : label is "soft_lutpair107";
  attribute SOFT_HLUTNM of \data_reg[3][42]_srl4_i_1\ : label is "soft_lutpair108";
  attribute SOFT_HLUTNM of \data_reg[3][43]_srl4_i_1\ : label is "soft_lutpair108";
  attribute SOFT_HLUTNM of \data_reg[3][44]_srl4_i_1\ : label is "soft_lutpair109";
  attribute SOFT_HLUTNM of \data_reg[3][45]_srl4_i_1\ : label is "soft_lutpair109";
  attribute SOFT_HLUTNM of \data_reg[3][46]_srl4_i_1__0\ : label is "soft_lutpair110";
  attribute SOFT_HLUTNM of \data_reg[3][47]_srl4_i_1\ : label is "soft_lutpair110";
  attribute SOFT_HLUTNM of \data_reg[3][48]_srl4_i_1\ : label is "soft_lutpair98";
  attribute SOFT_HLUTNM of \data_reg[3][49]_srl4_i_1\ : label is "soft_lutpair91";
  attribute SOFT_HLUTNM of \data_reg[3][50]_srl4_i_1\ : label is "soft_lutpair88";
  attribute SOFT_HLUTNM of \data_reg[3][51]_srl4_i_1\ : label is "soft_lutpair87";
  attribute SOFT_HLUTNM of \data_reg[3][52]_srl4_i_1\ : label is "soft_lutpair87";
  attribute SOFT_HLUTNM of \data_reg[3][53]_srl4_i_1\ : label is "soft_lutpair86";
  attribute SOFT_HLUTNM of \data_reg[3][54]_srl4_i_2\ : label is "soft_lutpair86";
  attribute SOFT_HLUTNM of \data_reg[3][7]_srl4_i_1\ : label is "soft_lutpair49";
  attribute SOFT_HLUTNM of \data_reg[3][8]_srl4_i_1\ : label is "soft_lutpair50";
  attribute SOFT_HLUTNM of \data_reg[3][9]_srl4_i_1\ : label is "soft_lutpair51";
  attribute SOFT_HLUTNM of \sig_addr_cntr_im0_msh[0]_i_1\ : label is "soft_lutpair74";
  attribute SOFT_HLUTNM of \sig_addr_cntr_im0_msh[10]_i_1\ : label is "soft_lutpair68";
  attribute SOFT_HLUTNM of \sig_addr_cntr_im0_msh[13]_i_2\ : label is "soft_lutpair68";
  attribute SOFT_HLUTNM of \sig_addr_cntr_im0_msh[1]_i_1\ : label is "soft_lutpair74";
  attribute SOFT_HLUTNM of \sig_addr_cntr_im0_msh[4]_i_2\ : label is "soft_lutpair42";
  attribute SOFT_HLUTNM of \sig_addr_cntr_im0_msh[7]_i_2\ : label is "soft_lutpair42";
  attribute SOFT_HLUTNM of \sig_addr_cntr_incr_ireg2[5]_i_1\ : label is "soft_lutpair72";
  attribute SOFT_HLUTNM of \sig_addr_cntr_incr_ireg2[6]_i_1\ : label is "soft_lutpair72";
  attribute SOFT_HLUTNM of \sig_addr_cntr_lsh_im0[0]_i_1\ : label is "soft_lutpair106";
  attribute SOFT_HLUTNM of \sig_addr_cntr_lsh_im0[10]_i_1\ : label is "soft_lutpair101";
  attribute SOFT_HLUTNM of \sig_addr_cntr_lsh_im0[11]_i_1\ : label is "soft_lutpair101";
  attribute SOFT_HLUTNM of \sig_addr_cntr_lsh_im0[12]_i_1\ : label is "soft_lutpair100";
  attribute SOFT_HLUTNM of \sig_addr_cntr_lsh_im0[13]_i_1\ : label is "soft_lutpair100";
  attribute SOFT_HLUTNM of \sig_addr_cntr_lsh_im0[14]_i_1\ : label is "soft_lutpair99";
  attribute SOFT_HLUTNM of \sig_addr_cntr_lsh_im0[15]_i_2\ : label is "soft_lutpair99";
  attribute SOFT_HLUTNM of \sig_addr_cntr_lsh_im0[1]_i_1\ : label is "soft_lutpair106";
  attribute SOFT_HLUTNM of \sig_addr_cntr_lsh_im0[2]_i_1\ : label is "soft_lutpair105";
  attribute SOFT_HLUTNM of \sig_addr_cntr_lsh_im0[3]_i_1\ : label is "soft_lutpair105";
  attribute SOFT_HLUTNM of \sig_addr_cntr_lsh_im0[4]_i_1\ : label is "soft_lutpair104";
  attribute SOFT_HLUTNM of \sig_addr_cntr_lsh_im0[5]_i_1\ : label is "soft_lutpair104";
  attribute SOFT_HLUTNM of \sig_addr_cntr_lsh_im0[6]_i_1\ : label is "soft_lutpair103";
  attribute SOFT_HLUTNM of \sig_addr_cntr_lsh_im0[7]_i_1\ : label is "soft_lutpair103";
  attribute SOFT_HLUTNM of \sig_addr_cntr_lsh_im0[8]_i_1\ : label is "soft_lutpair102";
  attribute SOFT_HLUTNM of \sig_addr_cntr_lsh_im0[9]_i_1\ : label is "soft_lutpair102";
  attribute SOFT_HLUTNM of \sig_adjusted_addr_incr_ireg2[0]_i_1\ : label is "soft_lutpair45";
  attribute SOFT_HLUTNM of \sig_adjusted_addr_incr_ireg2[1]_i_2\ : label is "soft_lutpair45";
  attribute SOFT_HLUTNM of \sig_adjusted_addr_incr_ireg2[4]_i_1\ : label is "soft_lutpair44";
  attribute SOFT_HLUTNM of \sig_adjusted_addr_incr_ireg2[5]_i_1\ : label is "soft_lutpair44";
  attribute SOFT_HLUTNM of sig_brst_cnt_eq_one_ireg1_i_1 : label is "soft_lutpair84";
  attribute SOFT_HLUTNM of sig_btt_eq_b2mbaa_ireg1_i_3 : label is "soft_lutpair70";
  attribute COMPARATOR_THRESHOLD : integer;
  attribute COMPARATOR_THRESHOLD of sig_btt_lt_b2mbaa_im01_carry : label is 11;
  attribute SOFT_HLUTNM of sig_btt_lt_b2mbaa_im01_carry_i_8 : label is "soft_lutpair66";
  attribute SOFT_HLUTNM of sig_btt_lt_b2mbaa_ireg1_i_1 : label is "soft_lutpair84";
  attribute SOFT_HLUTNM of \sig_bytes_to_mbaa_ireg1[1]_i_1\ : label is "soft_lutpair70";
  attribute SOFT_HLUTNM of \sig_bytes_to_mbaa_ireg1[2]_i_1\ : label is "soft_lutpair82";
  attribute SOFT_HLUTNM of \sig_bytes_to_mbaa_ireg1[3]_i_1\ : label is "soft_lutpair82";
  attribute SOFT_HLUTNM of \sig_bytes_to_mbaa_ireg1[4]_i_1\ : label is "soft_lutpair66";
  attribute SOFT_HLUTNM of sig_calc_error_pushed_i_1 : label is "soft_lutpair83";
  attribute SOFT_HLUTNM of sig_last_addr_offset_im2 : label is "soft_lutpair81";
  attribute SOFT_HLUTNM of sig_ld_xfer_reg_i_1 : label is "soft_lutpair73";
  attribute ADDER_THRESHOLD : integer;
  attribute ADDER_THRESHOLD of \sig_predict_addr_lsh_ireg3_reg[15]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \sig_predict_addr_lsh_ireg3_reg[7]_i_1\ : label is 35;
  attribute SOFT_HLUTNM of sig_sm_pop_input_reg_i_1 : label is "soft_lutpair71";
  attribute SOFT_HLUTNM of \sig_xfer_end_strb_ireg3[10]_i_1\ : label is "soft_lutpair76";
  attribute SOFT_HLUTNM of \sig_xfer_end_strb_ireg3[11]_i_1\ : label is "soft_lutpair77";
  attribute SOFT_HLUTNM of \sig_xfer_end_strb_ireg3[12]_i_1\ : label is "soft_lutpair81";
  attribute SOFT_HLUTNM of \sig_xfer_end_strb_ireg3[13]_i_1\ : label is "soft_lutpair80";
  attribute SOFT_HLUTNM of \sig_xfer_end_strb_ireg3[14]_i_1\ : label is "soft_lutpair75";
  attribute SOFT_HLUTNM of \sig_xfer_end_strb_ireg3[15]_i_1\ : label is "soft_lutpair78";
  attribute SOFT_HLUTNM of \sig_xfer_end_strb_ireg3[1]_i_1\ : label is "soft_lutpair78";
  attribute SOFT_HLUTNM of \sig_xfer_end_strb_ireg3[2]_i_1\ : label is "soft_lutpair75";
  attribute SOFT_HLUTNM of \sig_xfer_end_strb_ireg3[3]_i_1\ : label is "soft_lutpair76";
  attribute SOFT_HLUTNM of \sig_xfer_end_strb_ireg3[4]_i_1\ : label is "soft_lutpair80";
  attribute SOFT_HLUTNM of \sig_xfer_end_strb_ireg3[5]_i_1\ : label is "soft_lutpair79";
  attribute SOFT_HLUTNM of \sig_xfer_end_strb_ireg3[6]_i_1\ : label is "soft_lutpair69";
  attribute SOFT_HLUTNM of \sig_xfer_end_strb_ireg3[7]_i_1\ : label is "soft_lutpair77";
  attribute SOFT_HLUTNM of \sig_xfer_end_strb_ireg3[9]_i_1\ : label is "soft_lutpair79";
  attribute SOFT_HLUTNM of sig_xfer_reg_empty_i_1 : label is "soft_lutpair73";
  attribute SOFT_HLUTNM of \sig_xfer_strt_strb_ireg3[0]_i_1\ : label is "soft_lutpair48";
  attribute SOFT_HLUTNM of \sig_xfer_strt_strb_ireg3[10]_i_1\ : label is "soft_lutpair47";
  attribute SOFT_HLUTNM of \sig_xfer_strt_strb_ireg3[10]_i_2\ : label is "soft_lutpair97";
  attribute SOFT_HLUTNM of \sig_xfer_strt_strb_ireg3[13]_i_2\ : label is "soft_lutpair111";
  attribute SOFT_HLUTNM of \sig_xfer_strt_strb_ireg3[14]_i_1\ : label is "soft_lutpair43";
  attribute SOFT_HLUTNM of \sig_xfer_strt_strb_ireg3[14]_i_2\ : label is "soft_lutpair97";
  attribute SOFT_HLUTNM of \sig_xfer_strt_strb_ireg3[15]_i_1\ : label is "soft_lutpair40";
  attribute SOFT_HLUTNM of \sig_xfer_strt_strb_ireg3[15]_i_10\ : label is "soft_lutpair65";
  attribute SOFT_HLUTNM of \sig_xfer_strt_strb_ireg3[15]_i_11\ : label is "soft_lutpair67";
  attribute SOFT_HLUTNM of \sig_xfer_strt_strb_ireg3[15]_i_12\ : label is "soft_lutpair67";
  attribute SOFT_HLUTNM of \sig_xfer_strt_strb_ireg3[15]_i_13\ : label is "soft_lutpair46";
  attribute SOFT_HLUTNM of \sig_xfer_strt_strb_ireg3[15]_i_14\ : label is "soft_lutpair41";
  attribute SOFT_HLUTNM of \sig_xfer_strt_strb_ireg3[15]_i_16\ : label is "soft_lutpair41";
  attribute SOFT_HLUTNM of \sig_xfer_strt_strb_ireg3[15]_i_6\ : label is "soft_lutpair65";
  attribute SOFT_HLUTNM of \sig_xfer_strt_strb_ireg3[15]_i_8\ : label is "soft_lutpair46";
  attribute SOFT_HLUTNM of \sig_xfer_strt_strb_ireg3[2]_i_1\ : label is "soft_lutpair47";
  attribute SOFT_HLUTNM of \sig_xfer_strt_strb_ireg3[6]_i_1\ : label is "soft_lutpair43";
  attribute SOFT_HLUTNM of \sig_xfer_strt_strb_ireg3[7]_i_1\ : label is "soft_lutpair40";
  attribute SOFT_HLUTNM of \sig_xfer_strt_strb_ireg3[8]_i_1\ : label is "soft_lutpair48";
  attribute SOFT_HLUTNM of \sig_xfer_strt_strb_ireg3[9]_i_2\ : label is "soft_lutpair111";
begin
  \in\(35 downto 0) <= \^in\(35 downto 0);
  sig_init_reg <= \^sig_init_reg\;
  sig_mstr2addr_cmd_valid <= \^sig_mstr2addr_cmd_valid\;
  sig_mstr2data_cmd_valid <= \^sig_mstr2data_cmd_valid\;
  sig_mstr2data_sequential <= \^sig_mstr2data_sequential\;
  sig_mstr2sf_cmd_valid <= \^sig_mstr2sf_cmd_valid\;
\FSM_onehot_sig_pcc_sm_state[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BAAAFFFFBAAABAAA"
    )
        port map (
      I0 => \FSM_onehot_sig_pcc_sm_state_reg_n_0_[0]\,
      I1 => sig_calc_error_pushed,
      I2 => sig_parent_done,
      I3 => \FSM_onehot_sig_pcc_sm_state_reg_n_0_[6]\,
      I4 => sig_push_input_reg11_out,
      I5 => \FSM_onehot_sig_pcc_sm_state_reg_n_0_[1]\,
      O => \FSM_onehot_sig_pcc_sm_state[1]_i_1_n_0\
    );
\FSM_onehot_sig_pcc_sm_state[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF020202"
    )
        port map (
      I0 => \FSM_onehot_sig_pcc_sm_state_reg_n_0_[6]\,
      I1 => sig_parent_done,
      I2 => sig_calc_error_pushed,
      I3 => sig_push_input_reg11_out,
      I4 => \FSM_onehot_sig_pcc_sm_state_reg_n_0_[1]\,
      O => \FSM_onehot_sig_pcc_sm_state[2]_i_1_n_0\
    );
\FSM_onehot_sig_pcc_sm_state[5]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"F4"
    )
        port map (
      I0 => \sig_addr_cntr_lsh_im0_reg[0]_0\,
      I1 => \FSM_onehot_sig_pcc_sm_state_reg_n_0_[5]\,
      I2 => sig_sm_ld_calc3_reg,
      O => \FSM_onehot_sig_pcc_sm_state[5]_i_1_n_0\
    );
\FSM_onehot_sig_pcc_sm_state[6]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \FSM_onehot_sig_pcc_sm_state_reg_n_0_[5]\,
      I1 => \sig_addr_cntr_lsh_im0_reg[0]_0\,
      O => \FSM_onehot_sig_pcc_sm_state[6]_i_1_n_0\
    );
\FSM_onehot_sig_pcc_sm_state[6]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF8A8A8AFF8A8A"
    )
        port map (
      I0 => \^sig_mstr2data_cmd_valid\,
      I1 => sig_cmd2data_valid_reg_1,
      I2 => sig_inhibit_rdy_n_0,
      I3 => sig_inhibit_rdy_n,
      I4 => \^sig_mstr2sf_cmd_valid\,
      I5 => sig_cmd2dre_valid_reg_0,
      O => sig_cmd2data_valid_reg_0
    );
\FSM_onehot_sig_pcc_sm_state[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"F8"
    )
        port map (
      I0 => sig_calc_error_pushed,
      I1 => \FSM_onehot_sig_pcc_sm_state_reg_n_0_[6]\,
      I2 => \FSM_onehot_sig_pcc_sm_state_reg_n_0_[7]\,
      O => \FSM_onehot_sig_pcc_sm_state[7]_i_1_n_0\
    );
\FSM_onehot_sig_pcc_sm_state_reg[0]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => '1',
      D => '0',
      Q => \FSM_onehot_sig_pcc_sm_state_reg_n_0_[0]\,
      S => \^sig_init_reg\
    );
\FSM_onehot_sig_pcc_sm_state_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => '1',
      D => \FSM_onehot_sig_pcc_sm_state[1]_i_1_n_0\,
      Q => \FSM_onehot_sig_pcc_sm_state_reg_n_0_[1]\,
      R => \^sig_init_reg\
    );
\FSM_onehot_sig_pcc_sm_state_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => '1',
      D => \FSM_onehot_sig_pcc_sm_state[2]_i_1_n_0\,
      Q => sig_sm_ld_calc2_reg_ns,
      R => \^sig_init_reg\
    );
\FSM_onehot_sig_pcc_sm_state_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => '1',
      D => \FSM_onehot_sig_pcc_sm_state[5]_i_1_n_0\,
      Q => \FSM_onehot_sig_pcc_sm_state_reg_n_0_[5]\,
      R => \^sig_init_reg\
    );
\FSM_onehot_sig_pcc_sm_state_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => '1',
      D => \FSM_onehot_sig_pcc_sm_state[6]_i_1_n_0\,
      Q => \FSM_onehot_sig_pcc_sm_state_reg_n_0_[6]\,
      R => \^sig_init_reg\
    );
\FSM_onehot_sig_pcc_sm_state_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => '1',
      D => \FSM_onehot_sig_pcc_sm_state[7]_i_1_n_0\,
      Q => \FSM_onehot_sig_pcc_sm_state_reg_n_0_[7]\,
      R => \^sig_init_reg\
    );
\USE_SINGLE_REG.sig_regfifo_empty_reg_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFDF"
    )
        port map (
      I0 => sig_input_reg_empty,
      I1 => sig_sm_halt_reg,
      I2 => sig_cmd2mstr_cmd_valid,
      I3 => sig_calc_error_pushed,
      O => sig_input_reg_empty_reg_0
    );
\USE_SINGLE_REG.sig_regfifo_full_reg_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AA88A088AA88AA88"
    )
        port map (
      I0 => sig_cmd_stat_rst_int_reg_n,
      I1 => E(0),
      I2 => sig_calc_error_pushed,
      I3 => sig_cmd2mstr_cmd_valid,
      I4 => sig_sm_halt_reg,
      I5 => sig_input_reg_empty,
      O => sig_cmd_stat_rst_int_reg_n_reg
    );
\data_reg[3][10]_srl4_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF3FEA2A"
    )
        port map (
      I0 => \^sig_mstr2data_sequential\,
      I1 => sig_first_xfer_im0,
      I2 => sig_xfer_len_eq_0_ireg3,
      I3 => sig_xfer_strt_strb_ireg3(12),
      I4 => sig_xfer_end_strb_ireg3(12),
      O => sig_calc_error_reg_reg_0(28)
    );
\data_reg[3][11]_srl4_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF3FEA2A"
    )
        port map (
      I0 => \^sig_mstr2data_sequential\,
      I1 => sig_first_xfer_im0,
      I2 => sig_xfer_len_eq_0_ireg3,
      I3 => sig_xfer_strt_strb_ireg3(11),
      I4 => sig_xfer_end_strb_ireg3(11),
      O => sig_calc_error_reg_reg_0(27)
    );
\data_reg[3][12]_srl4_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF3FEA2A"
    )
        port map (
      I0 => \^sig_mstr2data_sequential\,
      I1 => sig_first_xfer_im0,
      I2 => sig_xfer_len_eq_0_ireg3,
      I3 => sig_xfer_strt_strb_ireg3(10),
      I4 => sig_xfer_end_strb_ireg3(10),
      O => sig_calc_error_reg_reg_0(26)
    );
\data_reg[3][13]_srl4_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF3FEA2A"
    )
        port map (
      I0 => \^sig_mstr2data_sequential\,
      I1 => sig_first_xfer_im0,
      I2 => sig_xfer_len_eq_0_ireg3,
      I3 => sig_xfer_strt_strb_ireg3(9),
      I4 => sig_xfer_end_strb_ireg3(9),
      O => sig_calc_error_reg_reg_0(25)
    );
\data_reg[3][14]_srl4_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF3FEA2A"
    )
        port map (
      I0 => \^sig_mstr2data_sequential\,
      I1 => sig_first_xfer_im0,
      I2 => sig_xfer_len_eq_0_ireg3,
      I3 => sig_xfer_strt_strb_ireg3(8),
      I4 => sig_xfer_end_strb_ireg3(8),
      O => sig_calc_error_reg_reg_0(24)
    );
\data_reg[3][15]_srl4_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF3FEA2A"
    )
        port map (
      I0 => \^sig_mstr2data_sequential\,
      I1 => sig_first_xfer_im0,
      I2 => sig_xfer_len_eq_0_ireg3,
      I3 => sig_xfer_strt_strb_ireg3(7),
      I4 => sig_xfer_end_strb_ireg3(7),
      O => sig_calc_error_reg_reg_0(23)
    );
\data_reg[3][16]_srl4_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF3FEA2A"
    )
        port map (
      I0 => \^sig_mstr2data_sequential\,
      I1 => sig_first_xfer_im0,
      I2 => sig_xfer_len_eq_0_ireg3,
      I3 => sig_xfer_strt_strb_ireg3(6),
      I4 => sig_xfer_end_strb_ireg3(6),
      O => sig_calc_error_reg_reg_0(22)
    );
\data_reg[3][17]_srl4_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF3FEA2A"
    )
        port map (
      I0 => \^sig_mstr2data_sequential\,
      I1 => sig_first_xfer_im0,
      I2 => sig_xfer_len_eq_0_ireg3,
      I3 => sig_xfer_strt_strb_ireg3(5),
      I4 => sig_xfer_end_strb_ireg3(5),
      O => sig_calc_error_reg_reg_0(21)
    );
\data_reg[3][18]_srl4_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF3FEA2A"
    )
        port map (
      I0 => \^sig_mstr2data_sequential\,
      I1 => sig_first_xfer_im0,
      I2 => sig_xfer_len_eq_0_ireg3,
      I3 => sig_xfer_strt_strb_ireg3(4),
      I4 => sig_xfer_end_strb_ireg3(4),
      O => sig_calc_error_reg_reg_0(20)
    );
\data_reg[3][19]_srl4_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF3FEA2A"
    )
        port map (
      I0 => \^sig_mstr2data_sequential\,
      I1 => sig_first_xfer_im0,
      I2 => sig_xfer_len_eq_0_ireg3,
      I3 => sig_xfer_strt_strb_ireg3(3),
      I4 => sig_xfer_end_strb_ireg3(3),
      O => sig_calc_error_reg_reg_0(19)
    );
\data_reg[3][20]_srl4_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF3FEA2A"
    )
        port map (
      I0 => \^sig_mstr2data_sequential\,
      I1 => sig_first_xfer_im0,
      I2 => sig_xfer_len_eq_0_ireg3,
      I3 => sig_xfer_strt_strb_ireg3(2),
      I4 => sig_xfer_end_strb_ireg3(2),
      O => sig_calc_error_reg_reg_0(18)
    );
\data_reg[3][21]_srl4_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF3FEA2A"
    )
        port map (
      I0 => \^sig_mstr2data_sequential\,
      I1 => sig_first_xfer_im0,
      I2 => sig_xfer_len_eq_0_ireg3,
      I3 => sig_xfer_strt_strb_ireg3(1),
      I4 => sig_xfer_end_strb_ireg3(1),
      O => sig_calc_error_reg_reg_0(17)
    );
\data_reg[3][21]_srl4_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAAAAAAAAA9"
    )
        port map (
      I0 => \sig_adjusted_addr_incr_ireg2_reg_n_0_[5]\,
      I1 => \sig_adjusted_addr_incr_ireg2_reg_n_0_[3]\,
      I2 => \sig_adjusted_addr_incr_ireg2_reg_n_0_[1]\,
      I3 => \sig_adjusted_addr_incr_ireg2_reg_n_0_[0]\,
      I4 => \sig_adjusted_addr_incr_ireg2_reg_n_0_[2]\,
      I5 => \sig_adjusted_addr_incr_ireg2_reg_n_0_[4]\,
      O => \^in\(33)
    );
\data_reg[3][22]_srl4_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF3FEA2A"
    )
        port map (
      I0 => \^sig_mstr2data_sequential\,
      I1 => sig_first_xfer_im0,
      I2 => sig_xfer_len_eq_0_ireg3,
      I3 => sig_xfer_strt_strb_ireg3(0),
      I4 => sig_xfer_end_strb_ireg3(0),
      O => sig_calc_error_reg_reg_0(16)
    );
\data_reg[3][22]_srl4_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAAAA9"
    )
        port map (
      I0 => \sig_adjusted_addr_incr_ireg2_reg_n_0_[4]\,
      I1 => \sig_adjusted_addr_incr_ireg2_reg_n_0_[2]\,
      I2 => \sig_adjusted_addr_incr_ireg2_reg_n_0_[0]\,
      I3 => \sig_adjusted_addr_incr_ireg2_reg_n_0_[1]\,
      I4 => \sig_adjusted_addr_incr_ireg2_reg_n_0_[3]\,
      O => \^in\(32)
    );
\data_reg[3][23]_srl4_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => sig_xfer_strt_strb_ireg3(15),
      I1 => sig_first_xfer_im0,
      O => sig_calc_error_reg_reg_0(15)
    );
\data_reg[3][23]_srl4_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => sig_addr_cntr_im0_msh_reg(15),
      I1 => \^in\(34),
      I2 => sig_addr_cntr_lsh_kh(31),
      O => \^in\(31)
    );
\data_reg[3][24]_srl4_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => sig_xfer_strt_strb_ireg3(14),
      I1 => sig_first_xfer_im0,
      O => sig_calc_error_reg_reg_0(14)
    );
\data_reg[3][24]_srl4_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => sig_addr_cntr_im0_msh_reg(14),
      I1 => \^in\(34),
      I2 => sig_addr_cntr_lsh_kh(30),
      O => \^in\(30)
    );
\data_reg[3][25]_srl4_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => sig_xfer_strt_strb_ireg3(13),
      I1 => sig_first_xfer_im0,
      O => sig_calc_error_reg_reg_0(13)
    );
\data_reg[3][25]_srl4_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => sig_addr_cntr_im0_msh_reg(13),
      I1 => \^in\(34),
      I2 => sig_addr_cntr_lsh_kh(29),
      O => \^in\(29)
    );
\data_reg[3][26]_srl4_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => sig_xfer_strt_strb_ireg3(12),
      I1 => sig_first_xfer_im0,
      O => sig_calc_error_reg_reg_0(12)
    );
\data_reg[3][26]_srl4_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => sig_addr_cntr_im0_msh_reg(12),
      I1 => \^in\(34),
      I2 => sig_addr_cntr_lsh_kh(28),
      O => \^in\(28)
    );
\data_reg[3][27]_srl4_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => sig_xfer_strt_strb_ireg3(11),
      I1 => sig_first_xfer_im0,
      O => sig_calc_error_reg_reg_0(11)
    );
\data_reg[3][27]_srl4_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => sig_addr_cntr_im0_msh_reg(11),
      I1 => \^in\(34),
      I2 => sig_addr_cntr_lsh_kh(27),
      O => \^in\(27)
    );
\data_reg[3][28]_srl4_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => sig_xfer_strt_strb_ireg3(10),
      I1 => sig_first_xfer_im0,
      O => sig_calc_error_reg_reg_0(10)
    );
\data_reg[3][28]_srl4_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => sig_addr_cntr_im0_msh_reg(10),
      I1 => \^in\(34),
      I2 => sig_addr_cntr_lsh_kh(26),
      O => \^in\(26)
    );
\data_reg[3][29]_srl4_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => sig_xfer_strt_strb_ireg3(9),
      I1 => sig_first_xfer_im0,
      O => sig_calc_error_reg_reg_0(9)
    );
\data_reg[3][29]_srl4_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => sig_addr_cntr_im0_msh_reg(9),
      I1 => \^in\(34),
      I2 => sig_addr_cntr_lsh_kh(25),
      O => \^in\(25)
    );
\data_reg[3][30]_srl4_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => sig_xfer_strt_strb_ireg3(8),
      I1 => sig_first_xfer_im0,
      O => sig_calc_error_reg_reg_0(8)
    );
\data_reg[3][30]_srl4_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => sig_addr_cntr_im0_msh_reg(8),
      I1 => \^in\(34),
      I2 => sig_addr_cntr_lsh_kh(24),
      O => \^in\(24)
    );
\data_reg[3][31]_srl4_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => sig_xfer_strt_strb_ireg3(7),
      I1 => sig_first_xfer_im0,
      O => sig_calc_error_reg_reg_0(7)
    );
\data_reg[3][31]_srl4_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => sig_addr_cntr_im0_msh_reg(7),
      I1 => \^in\(34),
      I2 => sig_addr_cntr_lsh_kh(23),
      O => \^in\(23)
    );
\data_reg[3][32]_srl4_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => sig_xfer_strt_strb_ireg3(6),
      I1 => sig_first_xfer_im0,
      O => sig_calc_error_reg_reg_0(6)
    );
\data_reg[3][32]_srl4_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => sig_addr_cntr_im0_msh_reg(6),
      I1 => \^in\(34),
      I2 => sig_addr_cntr_lsh_kh(22),
      O => \^in\(22)
    );
\data_reg[3][33]_srl4_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => sig_xfer_strt_strb_ireg3(5),
      I1 => sig_first_xfer_im0,
      O => sig_calc_error_reg_reg_0(5)
    );
\data_reg[3][33]_srl4_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => sig_addr_cntr_im0_msh_reg(5),
      I1 => \^in\(34),
      I2 => sig_addr_cntr_lsh_kh(21),
      O => \^in\(21)
    );
\data_reg[3][34]_srl4_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => sig_xfer_strt_strb_ireg3(4),
      I1 => sig_first_xfer_im0,
      O => sig_calc_error_reg_reg_0(4)
    );
\data_reg[3][34]_srl4_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => sig_addr_cntr_im0_msh_reg(4),
      I1 => \^in\(34),
      I2 => sig_addr_cntr_lsh_kh(20),
      O => \^in\(20)
    );
\data_reg[3][35]_srl4_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => sig_xfer_strt_strb_ireg3(3),
      I1 => sig_first_xfer_im0,
      O => sig_calc_error_reg_reg_0(3)
    );
\data_reg[3][35]_srl4_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => sig_addr_cntr_im0_msh_reg(3),
      I1 => \^in\(34),
      I2 => sig_addr_cntr_lsh_kh(19),
      O => \^in\(19)
    );
\data_reg[3][36]_srl4_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => sig_xfer_strt_strb_ireg3(2),
      I1 => sig_first_xfer_im0,
      O => sig_calc_error_reg_reg_0(2)
    );
\data_reg[3][36]_srl4_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => sig_addr_cntr_im0_msh_reg(2),
      I1 => \^in\(34),
      I2 => sig_addr_cntr_lsh_kh(18),
      O => \^in\(18)
    );
\data_reg[3][37]_srl4_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => sig_xfer_strt_strb_ireg3(1),
      I1 => sig_first_xfer_im0,
      O => sig_calc_error_reg_reg_0(1)
    );
\data_reg[3][37]_srl4_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => sig_addr_cntr_im0_msh_reg(1),
      I1 => \^in\(34),
      I2 => sig_addr_cntr_lsh_kh(17),
      O => \^in\(17)
    );
\data_reg[3][38]_srl4_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => sig_xfer_strt_strb_ireg3(0),
      I1 => sig_first_xfer_im0,
      O => sig_calc_error_reg_reg_0(0)
    );
\data_reg[3][38]_srl4_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => sig_addr_cntr_im0_msh_reg(0),
      I1 => \^in\(34),
      I2 => sig_addr_cntr_lsh_kh(16),
      O => \^in\(16)
    );
\data_reg[3][39]_srl4_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => p_1_in_1,
      I1 => \^in\(34),
      I2 => sig_addr_cntr_lsh_kh(15),
      O => \^in\(15)
    );
\data_reg[3][3]_srl4_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => \^in\(35),
      I1 => \^sig_mstr2data_sequential\,
      O => sig_calc_error_reg_reg_0(33)
    );
\data_reg[3][40]_srl4_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \sig_addr_cntr_lsh_im0_reg_n_0_[14]\,
      I1 => \^in\(34),
      I2 => sig_addr_cntr_lsh_kh(14),
      O => \^in\(14)
    );
\data_reg[3][41]_srl4_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \sig_addr_cntr_lsh_im0_reg_n_0_[13]\,
      I1 => \^in\(34),
      I2 => sig_addr_cntr_lsh_kh(13),
      O => \^in\(13)
    );
\data_reg[3][42]_srl4_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \sig_addr_cntr_lsh_im0_reg_n_0_[12]\,
      I1 => \^in\(34),
      I2 => sig_addr_cntr_lsh_kh(12),
      O => \^in\(12)
    );
\data_reg[3][43]_srl4_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \sig_addr_cntr_lsh_im0_reg_n_0_[11]\,
      I1 => \^in\(34),
      I2 => sig_addr_cntr_lsh_kh(11),
      O => \^in\(11)
    );
\data_reg[3][44]_srl4_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \sig_addr_cntr_lsh_im0_reg_n_0_[10]\,
      I1 => \^in\(34),
      I2 => sig_addr_cntr_lsh_kh(10),
      O => \^in\(10)
    );
\data_reg[3][45]_srl4_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \sig_addr_cntr_lsh_im0_reg_n_0_[9]\,
      I1 => \^in\(34),
      I2 => sig_addr_cntr_lsh_kh(9),
      O => \^in\(9)
    );
\data_reg[3][46]_srl4_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \sig_addr_cntr_lsh_im0_reg_n_0_[8]\,
      I1 => \^in\(34),
      I2 => sig_addr_cntr_lsh_kh(8),
      O => \^in\(8)
    );
\data_reg[3][47]_srl4_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \sig_addr_cntr_lsh_im0_reg_n_0_[7]\,
      I1 => \^in\(34),
      I2 => sig_addr_cntr_lsh_kh(7),
      O => \^in\(7)
    );
\data_reg[3][48]_srl4_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \sig_addr_cntr_lsh_im0_reg_n_0_[6]\,
      I1 => \^in\(34),
      I2 => sig_addr_cntr_lsh_kh(6),
      O => \^in\(6)
    );
\data_reg[3][49]_srl4_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => sig_mbaa_addr_cntr_slice_im0(5),
      I1 => \^in\(34),
      I2 => sig_addr_cntr_lsh_kh(5),
      O => \^in\(5)
    );
\data_reg[3][4]_srl4_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0F0F11FFFFFF11FF"
    )
        port map (
      I0 => sig_btt_lt_b2mbaa_ireg1,
      I1 => sig_btt_eq_b2mbaa_ireg1,
      I2 => sig_addr_aligned_ireg1,
      I3 => sig_brst_cnt_eq_zero_ireg1,
      I4 => sig_no_btt_residue_ireg1,
      I5 => sig_brst_cnt_eq_one_ireg1,
      O => \^sig_mstr2data_sequential\
    );
\data_reg[3][50]_srl4_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => sig_mbaa_addr_cntr_slice_im0(4),
      I1 => \^in\(34),
      I2 => sig_addr_cntr_lsh_kh(4),
      O => \^in\(4)
    );
\data_reg[3][51]_srl4_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => sig_mbaa_addr_cntr_slice_im0(3),
      I1 => \^in\(34),
      I2 => sig_addr_cntr_lsh_kh(3),
      O => \^in\(3)
    );
\data_reg[3][52]_srl4_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => sig_mbaa_addr_cntr_slice_im0(2),
      I1 => \^in\(34),
      I2 => sig_addr_cntr_lsh_kh(2),
      O => \^in\(2)
    );
\data_reg[3][53]_srl4_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => sig_mbaa_addr_cntr_slice_im0(1),
      I1 => \^in\(34),
      I2 => sig_addr_cntr_lsh_kh(1),
      O => \^in\(1)
    );
\data_reg[3][54]_srl4_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => sig_mbaa_addr_cntr_slice_im0(0),
      I1 => \^in\(34),
      I2 => sig_addr_cntr_lsh_kh(0),
      O => \^in\(0)
    );
\data_reg[3][5]_srl4_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => sig_mstr2sf_eof,
      I1 => \^sig_mstr2data_sequential\,
      O => sig_calc_error_reg_reg_0(32)
    );
\data_reg[3][7]_srl4_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF3FEA2A"
    )
        port map (
      I0 => \^sig_mstr2data_sequential\,
      I1 => sig_first_xfer_im0,
      I2 => sig_xfer_len_eq_0_ireg3,
      I3 => sig_xfer_strt_strb_ireg3(15),
      I4 => sig_xfer_end_strb_ireg3(15),
      O => sig_calc_error_reg_reg_0(31)
    );
\data_reg[3][8]_srl4_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF3FEA2A"
    )
        port map (
      I0 => \^sig_mstr2data_sequential\,
      I1 => sig_first_xfer_im0,
      I2 => sig_xfer_len_eq_0_ireg3,
      I3 => sig_xfer_strt_strb_ireg3(14),
      I4 => sig_xfer_end_strb_ireg3(14),
      O => sig_calc_error_reg_reg_0(30)
    );
\data_reg[3][9]_srl4_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF3FEA2A"
    )
        port map (
      I0 => \^sig_mstr2data_sequential\,
      I1 => sig_first_xfer_im0,
      I2 => sig_xfer_len_eq_0_ireg3,
      I3 => sig_xfer_strt_strb_ireg3(13),
      I4 => sig_xfer_end_strb_ireg3(13),
      O => sig_calc_error_reg_reg_0(29)
    );
sig_addr_aligned_ireg1_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
        port map (
      I0 => sig_mbaa_addr_cntr_slice_im0(4),
      I1 => sig_mbaa_addr_cntr_slice_im0(3),
      I2 => sig_mbaa_addr_cntr_slice_im0(2),
      I3 => sig_mbaa_addr_cntr_slice_im0(0),
      I4 => sig_mbaa_addr_cntr_slice_im0(1),
      I5 => sig_mbaa_addr_cntr_slice_im0(5),
      O => sig_addr_aligned_im0
    );
sig_addr_aligned_ireg1_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_sm_ld_calc2_reg_ns,
      D => sig_addr_aligned_im0,
      Q => sig_addr_aligned_ireg1,
      R => \^sig_init_reg\
    );
\sig_addr_cntr_im0_msh[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"8B"
    )
        port map (
      I0 => Q(32),
      I1 => sig_push_input_reg11_out,
      I2 => sig_addr_cntr_im0_msh_reg(0),
      O => p_0_in(0)
    );
\sig_addr_cntr_im0_msh[10]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAACF30"
    )
        port map (
      I0 => Q(42),
      I1 => \sig_addr_cntr_im0_msh[11]_i_2_n_0\,
      I2 => sig_addr_cntr_im0_msh_reg(9),
      I3 => sig_addr_cntr_im0_msh_reg(10),
      I4 => sig_push_input_reg11_out,
      O => p_0_in(10)
    );
\sig_addr_cntr_im0_msh[11]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF9AAA00009AAA"
    )
        port map (
      I0 => sig_addr_cntr_im0_msh_reg(11),
      I1 => \sig_addr_cntr_im0_msh[11]_i_2_n_0\,
      I2 => sig_addr_cntr_im0_msh_reg(9),
      I3 => sig_addr_cntr_im0_msh_reg(10),
      I4 => sig_push_input_reg11_out,
      I5 => Q(43),
      O => p_0_in(11)
    );
\sig_addr_cntr_im0_msh[11]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F7FFFFFF"
    )
        port map (
      I0 => sig_addr_cntr_im0_msh_reg(7),
      I1 => sig_addr_cntr_im0_msh_reg(5),
      I2 => \sig_addr_cntr_im0_msh[7]_i_2_n_0\,
      I3 => sig_addr_cntr_im0_msh_reg(6),
      I4 => sig_addr_cntr_im0_msh_reg(8),
      O => \sig_addr_cntr_im0_msh[11]_i_2_n_0\
    );
\sig_addr_cntr_im0_msh[12]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF6A006A"
    )
        port map (
      I0 => sig_addr_cntr_im0_msh_reg(12),
      I1 => \sig_addr_cntr_im0_msh[13]_i_2_n_0\,
      I2 => sig_addr_cntr_im0_msh_reg(11),
      I3 => sig_push_input_reg11_out,
      I4 => Q(44),
      O => p_0_in(12)
    );
\sig_addr_cntr_im0_msh[13]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF6AAA00006AAA"
    )
        port map (
      I0 => sig_addr_cntr_im0_msh_reg(13),
      I1 => sig_addr_cntr_im0_msh_reg(12),
      I2 => sig_addr_cntr_im0_msh_reg(11),
      I3 => \sig_addr_cntr_im0_msh[13]_i_2_n_0\,
      I4 => sig_push_input_reg11_out,
      I5 => Q(45),
      O => p_0_in(13)
    );
\sig_addr_cntr_im0_msh[13]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => sig_addr_cntr_im0_msh_reg(10),
      I1 => sig_addr_cntr_im0_msh_reg(9),
      I2 => \sig_addr_cntr_im0_msh[11]_i_2_n_0\,
      O => \sig_addr_cntr_im0_msh[13]_i_2_n_0\
    );
\sig_addr_cntr_im0_msh[14]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F909"
    )
        port map (
      I0 => sig_addr_cntr_im0_msh_reg(14),
      I1 => \sig_addr_cntr_im0_msh[15]_i_3_n_0\,
      I2 => sig_push_input_reg11_out,
      I3 => Q(46),
      O => p_0_in(14)
    );
\sig_addr_cntr_im0_msh[15]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FF08"
    )
        port map (
      I0 => \sig_addr_cntr_lsh_im0_reg[0]_0\,
      I1 => p_1_in_1,
      I2 => p_0_in_0,
      I3 => sig_push_input_reg11_out,
      O => \sig_addr_cntr_im0_msh[15]_i_1_n_0\
    );
\sig_addr_cntr_im0_msh[15]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFA600A6"
    )
        port map (
      I0 => sig_addr_cntr_im0_msh_reg(15),
      I1 => sig_addr_cntr_im0_msh_reg(14),
      I2 => \sig_addr_cntr_im0_msh[15]_i_3_n_0\,
      I3 => sig_push_input_reg11_out,
      I4 => Q(47),
      O => p_0_in(15)
    );
\sig_addr_cntr_im0_msh[15]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F7FFFFFFFFFFFFFF"
    )
        port map (
      I0 => sig_addr_cntr_im0_msh_reg(12),
      I1 => sig_addr_cntr_im0_msh_reg(11),
      I2 => \sig_addr_cntr_im0_msh[11]_i_2_n_0\,
      I3 => sig_addr_cntr_im0_msh_reg(9),
      I4 => sig_addr_cntr_im0_msh_reg(10),
      I5 => sig_addr_cntr_im0_msh_reg(13),
      O => \sig_addr_cntr_im0_msh[15]_i_3_n_0\
    );
\sig_addr_cntr_im0_msh[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F606"
    )
        port map (
      I0 => sig_addr_cntr_im0_msh_reg(1),
      I1 => sig_addr_cntr_im0_msh_reg(0),
      I2 => sig_push_input_reg11_out,
      I3 => Q(33),
      O => p_0_in(1)
    );
\sig_addr_cntr_im0_msh[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF6A006A"
    )
        port map (
      I0 => sig_addr_cntr_im0_msh_reg(2),
      I1 => sig_addr_cntr_im0_msh_reg(0),
      I2 => sig_addr_cntr_im0_msh_reg(1),
      I3 => sig_push_input_reg11_out,
      I4 => Q(34),
      O => p_0_in(2)
    );
\sig_addr_cntr_im0_msh[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF6AAA00006AAA"
    )
        port map (
      I0 => sig_addr_cntr_im0_msh_reg(3),
      I1 => sig_addr_cntr_im0_msh_reg(1),
      I2 => sig_addr_cntr_im0_msh_reg(0),
      I3 => sig_addr_cntr_im0_msh_reg(2),
      I4 => sig_push_input_reg11_out,
      I5 => Q(35),
      O => p_0_in(3)
    );
\sig_addr_cntr_im0_msh[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAACC3C"
    )
        port map (
      I0 => Q(36),
      I1 => sig_addr_cntr_im0_msh_reg(4),
      I2 => sig_addr_cntr_im0_msh_reg(3),
      I3 => \sig_addr_cntr_im0_msh[4]_i_2_n_0\,
      I4 => sig_push_input_reg11_out,
      O => p_0_in(4)
    );
\sig_addr_cntr_im0_msh[4]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"7F"
    )
        port map (
      I0 => sig_addr_cntr_im0_msh_reg(1),
      I1 => sig_addr_cntr_im0_msh_reg(0),
      I2 => sig_addr_cntr_im0_msh_reg(2),
      O => \sig_addr_cntr_im0_msh[4]_i_2_n_0\
    );
\sig_addr_cntr_im0_msh[5]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F909"
    )
        port map (
      I0 => sig_addr_cntr_im0_msh_reg(5),
      I1 => \sig_addr_cntr_im0_msh[7]_i_2_n_0\,
      I2 => sig_push_input_reg11_out,
      I3 => Q(37),
      O => p_0_in(5)
    );
\sig_addr_cntr_im0_msh[6]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFA600A6"
    )
        port map (
      I0 => sig_addr_cntr_im0_msh_reg(6),
      I1 => sig_addr_cntr_im0_msh_reg(5),
      I2 => \sig_addr_cntr_im0_msh[7]_i_2_n_0\,
      I3 => sig_push_input_reg11_out,
      I4 => Q(38),
      O => p_0_in(6)
    );
\sig_addr_cntr_im0_msh[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFA6AA0000A6AA"
    )
        port map (
      I0 => sig_addr_cntr_im0_msh_reg(7),
      I1 => sig_addr_cntr_im0_msh_reg(6),
      I2 => \sig_addr_cntr_im0_msh[7]_i_2_n_0\,
      I3 => sig_addr_cntr_im0_msh_reg(5),
      I4 => sig_push_input_reg11_out,
      I5 => Q(39),
      O => p_0_in(7)
    );
\sig_addr_cntr_im0_msh[7]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFFFFFF"
    )
        port map (
      I0 => sig_addr_cntr_im0_msh_reg(3),
      I1 => sig_addr_cntr_im0_msh_reg(1),
      I2 => sig_addr_cntr_im0_msh_reg(0),
      I3 => sig_addr_cntr_im0_msh_reg(2),
      I4 => sig_addr_cntr_im0_msh_reg(4),
      O => \sig_addr_cntr_im0_msh[7]_i_2_n_0\
    );
\sig_addr_cntr_im0_msh[8]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAACC3CCCCC"
    )
        port map (
      I0 => Q(40),
      I1 => sig_addr_cntr_im0_msh_reg(8),
      I2 => sig_addr_cntr_im0_msh_reg(7),
      I3 => \sig_addr_cntr_im0_msh[8]_i_2_n_0\,
      I4 => sig_addr_cntr_im0_msh_reg(6),
      I5 => sig_push_input_reg11_out,
      O => p_0_in(8)
    );
\sig_addr_cntr_im0_msh[8]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFFFFFFFFFF"
    )
        port map (
      I0 => sig_addr_cntr_im0_msh_reg(4),
      I1 => sig_addr_cntr_im0_msh_reg(2),
      I2 => sig_addr_cntr_im0_msh_reg(0),
      I3 => sig_addr_cntr_im0_msh_reg(1),
      I4 => sig_addr_cntr_im0_msh_reg(3),
      I5 => sig_addr_cntr_im0_msh_reg(5),
      O => \sig_addr_cntr_im0_msh[8]_i_2_n_0\
    );
\sig_addr_cntr_im0_msh[9]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F909"
    )
        port map (
      I0 => sig_addr_cntr_im0_msh_reg(9),
      I1 => \sig_addr_cntr_im0_msh[11]_i_2_n_0\,
      I2 => sig_push_input_reg11_out,
      I3 => Q(41),
      O => p_0_in(9)
    );
\sig_addr_cntr_im0_msh_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => \sig_addr_cntr_im0_msh[15]_i_1_n_0\,
      D => p_0_in(0),
      Q => sig_addr_cntr_im0_msh_reg(0),
      R => \^sig_init_reg\
    );
\sig_addr_cntr_im0_msh_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => \sig_addr_cntr_im0_msh[15]_i_1_n_0\,
      D => p_0_in(10),
      Q => sig_addr_cntr_im0_msh_reg(10),
      R => \^sig_init_reg\
    );
\sig_addr_cntr_im0_msh_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => \sig_addr_cntr_im0_msh[15]_i_1_n_0\,
      D => p_0_in(11),
      Q => sig_addr_cntr_im0_msh_reg(11),
      R => \^sig_init_reg\
    );
\sig_addr_cntr_im0_msh_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => \sig_addr_cntr_im0_msh[15]_i_1_n_0\,
      D => p_0_in(12),
      Q => sig_addr_cntr_im0_msh_reg(12),
      R => \^sig_init_reg\
    );
\sig_addr_cntr_im0_msh_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => \sig_addr_cntr_im0_msh[15]_i_1_n_0\,
      D => p_0_in(13),
      Q => sig_addr_cntr_im0_msh_reg(13),
      R => \^sig_init_reg\
    );
\sig_addr_cntr_im0_msh_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => \sig_addr_cntr_im0_msh[15]_i_1_n_0\,
      D => p_0_in(14),
      Q => sig_addr_cntr_im0_msh_reg(14),
      R => \^sig_init_reg\
    );
\sig_addr_cntr_im0_msh_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => \sig_addr_cntr_im0_msh[15]_i_1_n_0\,
      D => p_0_in(15),
      Q => sig_addr_cntr_im0_msh_reg(15),
      R => \^sig_init_reg\
    );
\sig_addr_cntr_im0_msh_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => \sig_addr_cntr_im0_msh[15]_i_1_n_0\,
      D => p_0_in(1),
      Q => sig_addr_cntr_im0_msh_reg(1),
      R => \^sig_init_reg\
    );
\sig_addr_cntr_im0_msh_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => \sig_addr_cntr_im0_msh[15]_i_1_n_0\,
      D => p_0_in(2),
      Q => sig_addr_cntr_im0_msh_reg(2),
      R => \^sig_init_reg\
    );
\sig_addr_cntr_im0_msh_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => \sig_addr_cntr_im0_msh[15]_i_1_n_0\,
      D => p_0_in(3),
      Q => sig_addr_cntr_im0_msh_reg(3),
      R => \^sig_init_reg\
    );
\sig_addr_cntr_im0_msh_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => \sig_addr_cntr_im0_msh[15]_i_1_n_0\,
      D => p_0_in(4),
      Q => sig_addr_cntr_im0_msh_reg(4),
      R => \^sig_init_reg\
    );
\sig_addr_cntr_im0_msh_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => \sig_addr_cntr_im0_msh[15]_i_1_n_0\,
      D => p_0_in(5),
      Q => sig_addr_cntr_im0_msh_reg(5),
      R => \^sig_init_reg\
    );
\sig_addr_cntr_im0_msh_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => \sig_addr_cntr_im0_msh[15]_i_1_n_0\,
      D => p_0_in(6),
      Q => sig_addr_cntr_im0_msh_reg(6),
      R => \^sig_init_reg\
    );
\sig_addr_cntr_im0_msh_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => \sig_addr_cntr_im0_msh[15]_i_1_n_0\,
      D => p_0_in(7),
      Q => sig_addr_cntr_im0_msh_reg(7),
      R => \^sig_init_reg\
    );
\sig_addr_cntr_im0_msh_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => \sig_addr_cntr_im0_msh[15]_i_1_n_0\,
      D => p_0_in(8),
      Q => sig_addr_cntr_im0_msh_reg(8),
      R => \^sig_init_reg\
    );
\sig_addr_cntr_im0_msh_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => \sig_addr_cntr_im0_msh[15]_i_1_n_0\,
      D => p_0_in(9),
      Q => sig_addr_cntr_im0_msh_reg(9),
      R => \^sig_init_reg\
    );
\sig_addr_cntr_incr_ireg2[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"AAC0"
    )
        port map (
      I0 => \sig_btt_cntr_im0_reg_n_0_[0]\,
      I1 => sig_bytes_to_mbaa_ireg1(0),
      I2 => sig_first_xfer_im0,
      I3 => sig_btt_lt_b2mbaa_ireg1,
      O => \sig_addr_cntr_incr_ireg2[0]_i_1_n_0\
    );
\sig_addr_cntr_incr_ireg2[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"AAC0"
    )
        port map (
      I0 => \sig_btt_cntr_im0_reg_n_0_[1]\,
      I1 => sig_bytes_to_mbaa_ireg1(1),
      I2 => sig_first_xfer_im0,
      I3 => sig_btt_lt_b2mbaa_ireg1,
      O => \sig_addr_cntr_incr_ireg2[1]_i_1_n_0\
    );
\sig_addr_cntr_incr_ireg2[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"AAC0"
    )
        port map (
      I0 => \sig_btt_cntr_im0_reg_n_0_[2]\,
      I1 => sig_bytes_to_mbaa_ireg1(2),
      I2 => sig_first_xfer_im0,
      I3 => sig_btt_lt_b2mbaa_ireg1,
      O => \sig_addr_cntr_incr_ireg2[2]_i_1_n_0\
    );
\sig_addr_cntr_incr_ireg2[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"AAC0"
    )
        port map (
      I0 => \sig_btt_cntr_im0_reg_n_0_[3]\,
      I1 => sig_bytes_to_mbaa_ireg1(3),
      I2 => sig_first_xfer_im0,
      I3 => sig_btt_lt_b2mbaa_ireg1,
      O => \sig_addr_cntr_incr_ireg2[3]_i_1_n_0\
    );
\sig_addr_cntr_incr_ireg2[4]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"AAC0"
    )
        port map (
      I0 => \sig_btt_cntr_im0_reg_n_0_[4]\,
      I1 => sig_bytes_to_mbaa_ireg1(4),
      I2 => sig_first_xfer_im0,
      I3 => sig_btt_lt_b2mbaa_ireg1,
      O => \sig_addr_cntr_incr_ireg2[4]_i_1_n_0\
    );
\sig_addr_cntr_incr_ireg2[5]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"AAC0"
    )
        port map (
      I0 => \sig_btt_cntr_im0_reg_n_0_[5]\,
      I1 => sig_bytes_to_mbaa_ireg1(5),
      I2 => sig_first_xfer_im0,
      I3 => sig_btt_lt_b2mbaa_ireg1,
      O => \sig_addr_cntr_incr_ireg2[5]_i_1_n_0\
    );
\sig_addr_cntr_incr_ireg2[6]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"0D"
    )
        port map (
      I0 => sig_first_xfer_im0,
      I1 => sig_addr_aligned_ireg1,
      I2 => sig_btt_lt_b2mbaa_ireg1,
      O => \sig_addr_cntr_incr_ireg2[6]_i_1_n_0\
    );
\sig_addr_cntr_incr_ireg2_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_sm_ld_calc2_reg,
      D => \sig_addr_cntr_incr_ireg2[0]_i_1_n_0\,
      Q => \sig_addr_cntr_incr_ireg2_reg_n_0_[0]\,
      R => \^sig_init_reg\
    );
\sig_addr_cntr_incr_ireg2_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_sm_ld_calc2_reg,
      D => \sig_addr_cntr_incr_ireg2[1]_i_1_n_0\,
      Q => \sig_addr_cntr_incr_ireg2_reg_n_0_[1]\,
      R => \^sig_init_reg\
    );
\sig_addr_cntr_incr_ireg2_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_sm_ld_calc2_reg,
      D => \sig_addr_cntr_incr_ireg2[2]_i_1_n_0\,
      Q => \sig_addr_cntr_incr_ireg2_reg_n_0_[2]\,
      R => \^sig_init_reg\
    );
\sig_addr_cntr_incr_ireg2_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_sm_ld_calc2_reg,
      D => \sig_addr_cntr_incr_ireg2[3]_i_1_n_0\,
      Q => \sig_addr_cntr_incr_ireg2_reg_n_0_[3]\,
      R => \^sig_init_reg\
    );
\sig_addr_cntr_incr_ireg2_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_sm_ld_calc2_reg,
      D => \sig_addr_cntr_incr_ireg2[4]_i_1_n_0\,
      Q => \sig_addr_cntr_incr_ireg2_reg_n_0_[4]\,
      R => \^sig_init_reg\
    );
\sig_addr_cntr_incr_ireg2_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_sm_ld_calc2_reg,
      D => \sig_addr_cntr_incr_ireg2[5]_i_1_n_0\,
      Q => \sig_addr_cntr_incr_ireg2_reg_n_0_[5]\,
      R => \^sig_init_reg\
    );
\sig_addr_cntr_incr_ireg2_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_sm_ld_calc2_reg,
      D => \sig_addr_cntr_incr_ireg2[6]_i_1_n_0\,
      Q => \sig_addr_cntr_incr_ireg2_reg_n_0_[6]\,
      R => \^sig_init_reg\
    );
\sig_addr_cntr_lsh_im0[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => Q(16),
      I1 => sig_push_input_reg11_out,
      I2 => \sig_predict_addr_lsh_ireg3_reg_n_0_[0]\,
      O => p_1_in(0)
    );
\sig_addr_cntr_lsh_im0[10]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => Q(26),
      I1 => sig_push_input_reg11_out,
      I2 => \sig_predict_addr_lsh_ireg3_reg_n_0_[10]\,
      O => p_1_in(10)
    );
\sig_addr_cntr_lsh_im0[11]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => Q(27),
      I1 => sig_push_input_reg11_out,
      I2 => \sig_predict_addr_lsh_ireg3_reg_n_0_[11]\,
      O => p_1_in(11)
    );
\sig_addr_cntr_lsh_im0[12]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => Q(28),
      I1 => sig_push_input_reg11_out,
      I2 => \sig_predict_addr_lsh_ireg3_reg_n_0_[12]\,
      O => p_1_in(12)
    );
\sig_addr_cntr_lsh_im0[13]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => Q(29),
      I1 => sig_push_input_reg11_out,
      I2 => \sig_predict_addr_lsh_ireg3_reg_n_0_[13]\,
      O => p_1_in(13)
    );
\sig_addr_cntr_lsh_im0[14]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => Q(30),
      I1 => sig_push_input_reg11_out,
      I2 => \sig_predict_addr_lsh_ireg3_reg_n_0_[14]\,
      O => p_1_in(14)
    );
\sig_addr_cntr_lsh_im0[15]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => sig_push_input_reg11_out,
      I1 => \sig_addr_cntr_lsh_im0_reg[0]_0\,
      O => \sig_addr_cntr_lsh_im0[15]_i_1_n_0\
    );
\sig_addr_cntr_lsh_im0[15]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => Q(31),
      I1 => sig_push_input_reg11_out,
      I2 => p_0_in_0,
      O => p_1_in(15)
    );
\sig_addr_cntr_lsh_im0[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => Q(17),
      I1 => sig_push_input_reg11_out,
      I2 => \sig_predict_addr_lsh_ireg3_reg_n_0_[1]\,
      O => p_1_in(1)
    );
\sig_addr_cntr_lsh_im0[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => Q(18),
      I1 => sig_push_input_reg11_out,
      I2 => \sig_predict_addr_lsh_ireg3_reg_n_0_[2]\,
      O => p_1_in(2)
    );
\sig_addr_cntr_lsh_im0[3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => Q(19),
      I1 => sig_push_input_reg11_out,
      I2 => \sig_predict_addr_lsh_ireg3_reg_n_0_[3]\,
      O => p_1_in(3)
    );
\sig_addr_cntr_lsh_im0[4]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => Q(20),
      I1 => sig_push_input_reg11_out,
      I2 => \sig_predict_addr_lsh_ireg3_reg_n_0_[4]\,
      O => p_1_in(4)
    );
\sig_addr_cntr_lsh_im0[5]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => Q(21),
      I1 => sig_push_input_reg11_out,
      I2 => \sig_predict_addr_lsh_ireg3_reg_n_0_[5]\,
      O => p_1_in(5)
    );
\sig_addr_cntr_lsh_im0[6]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => Q(22),
      I1 => sig_push_input_reg11_out,
      I2 => \sig_predict_addr_lsh_ireg3_reg_n_0_[6]\,
      O => p_1_in(6)
    );
\sig_addr_cntr_lsh_im0[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => Q(23),
      I1 => sig_push_input_reg11_out,
      I2 => \sig_predict_addr_lsh_ireg3_reg_n_0_[7]\,
      O => p_1_in(7)
    );
\sig_addr_cntr_lsh_im0[8]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => Q(24),
      I1 => sig_push_input_reg11_out,
      I2 => \sig_predict_addr_lsh_ireg3_reg_n_0_[8]\,
      O => p_1_in(8)
    );
\sig_addr_cntr_lsh_im0[9]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => Q(25),
      I1 => sig_push_input_reg11_out,
      I2 => \sig_predict_addr_lsh_ireg3_reg_n_0_[9]\,
      O => p_1_in(9)
    );
\sig_addr_cntr_lsh_im0_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => \sig_addr_cntr_lsh_im0[15]_i_1_n_0\,
      D => p_1_in(0),
      Q => sig_mbaa_addr_cntr_slice_im0(0),
      R => \^sig_init_reg\
    );
\sig_addr_cntr_lsh_im0_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => \sig_addr_cntr_lsh_im0[15]_i_1_n_0\,
      D => p_1_in(10),
      Q => \sig_addr_cntr_lsh_im0_reg_n_0_[10]\,
      R => \^sig_init_reg\
    );
\sig_addr_cntr_lsh_im0_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => \sig_addr_cntr_lsh_im0[15]_i_1_n_0\,
      D => p_1_in(11),
      Q => \sig_addr_cntr_lsh_im0_reg_n_0_[11]\,
      R => \^sig_init_reg\
    );
\sig_addr_cntr_lsh_im0_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => \sig_addr_cntr_lsh_im0[15]_i_1_n_0\,
      D => p_1_in(12),
      Q => \sig_addr_cntr_lsh_im0_reg_n_0_[12]\,
      R => \^sig_init_reg\
    );
\sig_addr_cntr_lsh_im0_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => \sig_addr_cntr_lsh_im0[15]_i_1_n_0\,
      D => p_1_in(13),
      Q => \sig_addr_cntr_lsh_im0_reg_n_0_[13]\,
      R => \^sig_init_reg\
    );
\sig_addr_cntr_lsh_im0_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => \sig_addr_cntr_lsh_im0[15]_i_1_n_0\,
      D => p_1_in(14),
      Q => \sig_addr_cntr_lsh_im0_reg_n_0_[14]\,
      R => \^sig_init_reg\
    );
\sig_addr_cntr_lsh_im0_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => \sig_addr_cntr_lsh_im0[15]_i_1_n_0\,
      D => p_1_in(15),
      Q => p_1_in_1,
      R => \^sig_init_reg\
    );
\sig_addr_cntr_lsh_im0_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => \sig_addr_cntr_lsh_im0[15]_i_1_n_0\,
      D => p_1_in(1),
      Q => sig_mbaa_addr_cntr_slice_im0(1),
      R => \^sig_init_reg\
    );
\sig_addr_cntr_lsh_im0_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => \sig_addr_cntr_lsh_im0[15]_i_1_n_0\,
      D => p_1_in(2),
      Q => sig_mbaa_addr_cntr_slice_im0(2),
      R => \^sig_init_reg\
    );
\sig_addr_cntr_lsh_im0_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => \sig_addr_cntr_lsh_im0[15]_i_1_n_0\,
      D => p_1_in(3),
      Q => sig_mbaa_addr_cntr_slice_im0(3),
      R => \^sig_init_reg\
    );
\sig_addr_cntr_lsh_im0_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => \sig_addr_cntr_lsh_im0[15]_i_1_n_0\,
      D => p_1_in(4),
      Q => sig_mbaa_addr_cntr_slice_im0(4),
      R => \^sig_init_reg\
    );
\sig_addr_cntr_lsh_im0_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => \sig_addr_cntr_lsh_im0[15]_i_1_n_0\,
      D => p_1_in(5),
      Q => sig_mbaa_addr_cntr_slice_im0(5),
      R => \^sig_init_reg\
    );
\sig_addr_cntr_lsh_im0_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => \sig_addr_cntr_lsh_im0[15]_i_1_n_0\,
      D => p_1_in(6),
      Q => \sig_addr_cntr_lsh_im0_reg_n_0_[6]\,
      R => \^sig_init_reg\
    );
\sig_addr_cntr_lsh_im0_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => \sig_addr_cntr_lsh_im0[15]_i_1_n_0\,
      D => p_1_in(7),
      Q => \sig_addr_cntr_lsh_im0_reg_n_0_[7]\,
      R => \^sig_init_reg\
    );
\sig_addr_cntr_lsh_im0_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => \sig_addr_cntr_lsh_im0[15]_i_1_n_0\,
      D => p_1_in(8),
      Q => \sig_addr_cntr_lsh_im0_reg_n_0_[8]\,
      R => \^sig_init_reg\
    );
\sig_addr_cntr_lsh_im0_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => \sig_addr_cntr_lsh_im0[15]_i_1_n_0\,
      D => p_1_in(9),
      Q => \sig_addr_cntr_lsh_im0_reg_n_0_[9]\,
      R => \^sig_init_reg\
    );
\sig_addr_cntr_lsh_kh_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_push_input_reg11_out,
      D => Q(16),
      Q => sig_addr_cntr_lsh_kh(0),
      R => \^sig_init_reg\
    );
\sig_addr_cntr_lsh_kh_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_push_input_reg11_out,
      D => Q(26),
      Q => sig_addr_cntr_lsh_kh(10),
      R => \^sig_init_reg\
    );
\sig_addr_cntr_lsh_kh_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_push_input_reg11_out,
      D => Q(27),
      Q => sig_addr_cntr_lsh_kh(11),
      R => \^sig_init_reg\
    );
\sig_addr_cntr_lsh_kh_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_push_input_reg11_out,
      D => Q(28),
      Q => sig_addr_cntr_lsh_kh(12),
      R => \^sig_init_reg\
    );
\sig_addr_cntr_lsh_kh_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_push_input_reg11_out,
      D => Q(29),
      Q => sig_addr_cntr_lsh_kh(13),
      R => \^sig_init_reg\
    );
\sig_addr_cntr_lsh_kh_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_push_input_reg11_out,
      D => Q(30),
      Q => sig_addr_cntr_lsh_kh(14),
      R => \^sig_init_reg\
    );
\sig_addr_cntr_lsh_kh_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_push_input_reg11_out,
      D => Q(31),
      Q => sig_addr_cntr_lsh_kh(15),
      R => \^sig_init_reg\
    );
\sig_addr_cntr_lsh_kh_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_push_input_reg11_out,
      D => Q(32),
      Q => sig_addr_cntr_lsh_kh(16),
      R => \^sig_init_reg\
    );
\sig_addr_cntr_lsh_kh_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_push_input_reg11_out,
      D => Q(33),
      Q => sig_addr_cntr_lsh_kh(17),
      R => \^sig_init_reg\
    );
\sig_addr_cntr_lsh_kh_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_push_input_reg11_out,
      D => Q(34),
      Q => sig_addr_cntr_lsh_kh(18),
      R => \^sig_init_reg\
    );
\sig_addr_cntr_lsh_kh_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_push_input_reg11_out,
      D => Q(35),
      Q => sig_addr_cntr_lsh_kh(19),
      R => \^sig_init_reg\
    );
\sig_addr_cntr_lsh_kh_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_push_input_reg11_out,
      D => Q(17),
      Q => sig_addr_cntr_lsh_kh(1),
      R => \^sig_init_reg\
    );
\sig_addr_cntr_lsh_kh_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_push_input_reg11_out,
      D => Q(36),
      Q => sig_addr_cntr_lsh_kh(20),
      R => \^sig_init_reg\
    );
\sig_addr_cntr_lsh_kh_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_push_input_reg11_out,
      D => Q(37),
      Q => sig_addr_cntr_lsh_kh(21),
      R => \^sig_init_reg\
    );
\sig_addr_cntr_lsh_kh_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_push_input_reg11_out,
      D => Q(38),
      Q => sig_addr_cntr_lsh_kh(22),
      R => \^sig_init_reg\
    );
\sig_addr_cntr_lsh_kh_reg[23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_push_input_reg11_out,
      D => Q(39),
      Q => sig_addr_cntr_lsh_kh(23),
      R => \^sig_init_reg\
    );
\sig_addr_cntr_lsh_kh_reg[24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_push_input_reg11_out,
      D => Q(40),
      Q => sig_addr_cntr_lsh_kh(24),
      R => \^sig_init_reg\
    );
\sig_addr_cntr_lsh_kh_reg[25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_push_input_reg11_out,
      D => Q(41),
      Q => sig_addr_cntr_lsh_kh(25),
      R => \^sig_init_reg\
    );
\sig_addr_cntr_lsh_kh_reg[26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_push_input_reg11_out,
      D => Q(42),
      Q => sig_addr_cntr_lsh_kh(26),
      R => \^sig_init_reg\
    );
\sig_addr_cntr_lsh_kh_reg[27]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_push_input_reg11_out,
      D => Q(43),
      Q => sig_addr_cntr_lsh_kh(27),
      R => \^sig_init_reg\
    );
\sig_addr_cntr_lsh_kh_reg[28]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_push_input_reg11_out,
      D => Q(44),
      Q => sig_addr_cntr_lsh_kh(28),
      R => \^sig_init_reg\
    );
\sig_addr_cntr_lsh_kh_reg[29]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_push_input_reg11_out,
      D => Q(45),
      Q => sig_addr_cntr_lsh_kh(29),
      R => \^sig_init_reg\
    );
\sig_addr_cntr_lsh_kh_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_push_input_reg11_out,
      D => Q(18),
      Q => sig_addr_cntr_lsh_kh(2),
      R => \^sig_init_reg\
    );
\sig_addr_cntr_lsh_kh_reg[30]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_push_input_reg11_out,
      D => Q(46),
      Q => sig_addr_cntr_lsh_kh(30),
      R => \^sig_init_reg\
    );
\sig_addr_cntr_lsh_kh_reg[31]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_push_input_reg11_out,
      D => Q(47),
      Q => sig_addr_cntr_lsh_kh(31),
      R => \^sig_init_reg\
    );
\sig_addr_cntr_lsh_kh_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_push_input_reg11_out,
      D => Q(19),
      Q => sig_addr_cntr_lsh_kh(3),
      R => \^sig_init_reg\
    );
\sig_addr_cntr_lsh_kh_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_push_input_reg11_out,
      D => Q(20),
      Q => sig_addr_cntr_lsh_kh(4),
      R => \^sig_init_reg\
    );
\sig_addr_cntr_lsh_kh_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_push_input_reg11_out,
      D => Q(21),
      Q => sig_addr_cntr_lsh_kh(5),
      R => \^sig_init_reg\
    );
\sig_addr_cntr_lsh_kh_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_push_input_reg11_out,
      D => Q(22),
      Q => sig_addr_cntr_lsh_kh(6),
      R => \^sig_init_reg\
    );
\sig_addr_cntr_lsh_kh_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_push_input_reg11_out,
      D => Q(23),
      Q => sig_addr_cntr_lsh_kh(7),
      R => \^sig_init_reg\
    );
\sig_addr_cntr_lsh_kh_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_push_input_reg11_out,
      D => Q(24),
      Q => sig_addr_cntr_lsh_kh(8),
      R => \^sig_init_reg\
    );
\sig_addr_cntr_lsh_kh_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_push_input_reg11_out,
      D => Q(25),
      Q => sig_addr_cntr_lsh_kh(9),
      R => \^sig_init_reg\
    );
\sig_adjusted_addr_incr_ireg2[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"56669AAA"
    )
        port map (
      I0 => sig_mbaa_addr_cntr_slice_im0(0),
      I1 => sig_btt_lt_b2mbaa_ireg1,
      I2 => sig_first_xfer_im0,
      I3 => sig_bytes_to_mbaa_ireg1(0),
      I4 => \sig_btt_cntr_im0_reg_n_0_[0]\,
      O => sig_adjusted_addr_incr_im1(0)
    );
\sig_adjusted_addr_incr_ireg2[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6969696966999999"
    )
        port map (
      I0 => \sig_adjusted_addr_incr_ireg2[1]_i_2_n_0\,
      I1 => sig_mbaa_addr_cntr_slice_im0(1),
      I2 => \sig_btt_cntr_im0_reg_n_0_[1]\,
      I3 => sig_bytes_to_mbaa_ireg1(1),
      I4 => sig_first_xfer_im0,
      I5 => sig_btt_lt_b2mbaa_ireg1,
      O => sig_adjusted_addr_incr_im1(1)
    );
\sig_adjusted_addr_incr_ireg2[1]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"15BFFFFF"
    )
        port map (
      I0 => sig_btt_lt_b2mbaa_ireg1,
      I1 => sig_first_xfer_im0,
      I2 => sig_bytes_to_mbaa_ireg1(0),
      I3 => \sig_btt_cntr_im0_reg_n_0_[0]\,
      I4 => sig_mbaa_addr_cntr_slice_im0(0),
      O => \sig_adjusted_addr_incr_ireg2[1]_i_2_n_0\
    );
\sig_adjusted_addr_incr_ireg2[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9999A55566665AAA"
    )
        port map (
      I0 => sig_mbaa_addr_cntr_slice_im0(2),
      I1 => \sig_btt_cntr_im0_reg_n_0_[2]\,
      I2 => sig_bytes_to_mbaa_ireg1(2),
      I3 => sig_first_xfer_im0,
      I4 => sig_btt_lt_b2mbaa_ireg1,
      I5 => \sig_adjusted_addr_incr_ireg2[2]_i_2_n_0\,
      O => sig_adjusted_addr_incr_im1(2)
    );
\sig_adjusted_addr_incr_ireg2[2]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B2B2B2B2BB222222"
    )
        port map (
      I0 => sig_mbaa_addr_cntr_slice_im0(1),
      I1 => \sig_adjusted_addr_incr_ireg2[1]_i_2_n_0\,
      I2 => \sig_btt_cntr_im0_reg_n_0_[1]\,
      I3 => sig_bytes_to_mbaa_ireg1(1),
      I4 => sig_first_xfer_im0,
      I5 => sig_btt_lt_b2mbaa_ireg1,
      O => \sig_adjusted_addr_incr_ireg2[2]_i_2_n_0\
    );
\sig_adjusted_addr_incr_ireg2[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"66665AAA9999A555"
    )
        port map (
      I0 => sig_mbaa_addr_cntr_slice_im0(3),
      I1 => \sig_btt_cntr_im0_reg_n_0_[3]\,
      I2 => sig_bytes_to_mbaa_ireg1(3),
      I3 => sig_first_xfer_im0,
      I4 => sig_btt_lt_b2mbaa_ireg1,
      I5 => \sig_adjusted_addr_incr_ireg2[5]_i_2_n_0\,
      O => sig_adjusted_addr_incr_im1(3)
    );
\sig_adjusted_addr_incr_ireg2[4]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"599A"
    )
        port map (
      I0 => \sig_addr_cntr_incr_ireg2[4]_i_1_n_0\,
      I1 => \sig_adjusted_addr_incr_ireg2[5]_i_2_n_0\,
      I2 => sig_mbaa_addr_cntr_slice_im0(3),
      I3 => \sig_addr_cntr_incr_ireg2[3]_i_1_n_0\,
      O => sig_adjusted_addr_incr_im1(4)
    );
\sig_adjusted_addr_incr_ireg2[5]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"66C6C6CC"
    )
        port map (
      I0 => \sig_addr_cntr_incr_ireg2[4]_i_1_n_0\,
      I1 => \sig_addr_cntr_incr_ireg2[5]_i_1_n_0\,
      I2 => \sig_adjusted_addr_incr_ireg2[5]_i_2_n_0\,
      I3 => sig_mbaa_addr_cntr_slice_im0(3),
      I4 => \sig_addr_cntr_incr_ireg2[3]_i_1_n_0\,
      O => sig_adjusted_addr_incr_im1(5)
    );
\sig_adjusted_addr_incr_ireg2[5]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000015BF15BFFFFF"
    )
        port map (
      I0 => sig_btt_lt_b2mbaa_ireg1,
      I1 => sig_first_xfer_im0,
      I2 => sig_bytes_to_mbaa_ireg1(2),
      I3 => \sig_btt_cntr_im0_reg_n_0_[2]\,
      I4 => \sig_adjusted_addr_incr_ireg2[2]_i_2_n_0\,
      I5 => sig_mbaa_addr_cntr_slice_im0(2),
      O => \sig_adjusted_addr_incr_ireg2[5]_i_2_n_0\
    );
\sig_adjusted_addr_incr_ireg2_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_sm_ld_calc2_reg,
      D => sig_adjusted_addr_incr_im1(0),
      Q => \sig_adjusted_addr_incr_ireg2_reg_n_0_[0]\,
      R => \^sig_init_reg\
    );
\sig_adjusted_addr_incr_ireg2_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_sm_ld_calc2_reg,
      D => sig_adjusted_addr_incr_im1(1),
      Q => \sig_adjusted_addr_incr_ireg2_reg_n_0_[1]\,
      R => \^sig_init_reg\
    );
\sig_adjusted_addr_incr_ireg2_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_sm_ld_calc2_reg,
      D => sig_adjusted_addr_incr_im1(2),
      Q => \sig_adjusted_addr_incr_ireg2_reg_n_0_[2]\,
      R => \^sig_init_reg\
    );
\sig_adjusted_addr_incr_ireg2_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_sm_ld_calc2_reg,
      D => sig_adjusted_addr_incr_im1(3),
      Q => \sig_adjusted_addr_incr_ireg2_reg_n_0_[3]\,
      R => \^sig_init_reg\
    );
\sig_adjusted_addr_incr_ireg2_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_sm_ld_calc2_reg,
      D => sig_adjusted_addr_incr_im1(4),
      Q => \sig_adjusted_addr_incr_ireg2_reg_n_0_[4]\,
      R => \^sig_init_reg\
    );
\sig_adjusted_addr_incr_ireg2_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_sm_ld_calc2_reg,
      D => sig_adjusted_addr_incr_im1(5),
      Q => \sig_adjusted_addr_incr_ireg2_reg_n_0_[5]\,
      R => \^sig_init_reg\
    );
sig_brst_cnt_eq_one_ireg1_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => sig_btt_lt_b2mbaa_ireg1_i_2_n_0,
      I1 => \sig_btt_cntr_im0_reg_n_0_[6]\,
      O => sig_brst_cnt_eq_one_im0
    );
sig_brst_cnt_eq_one_ireg1_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_sm_ld_calc2_reg_ns,
      D => sig_brst_cnt_eq_one_im0,
      Q => sig_brst_cnt_eq_one_ireg1,
      R => \^sig_init_reg\
    );
sig_brst_cnt_eq_zero_ireg1_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => sig_btt_lt_b2mbaa_ireg1_i_2_n_0,
      I1 => \sig_btt_cntr_im0_reg_n_0_[6]\,
      O => sig_brst_cnt_eq_zero_im0
    );
sig_brst_cnt_eq_zero_ireg1_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_sm_ld_calc2_reg_ns,
      D => sig_brst_cnt_eq_zero_im0,
      Q => sig_brst_cnt_eq_zero_ireg1,
      R => \^sig_init_reg\
    );
\sig_btt_cntr_im0[13]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FBFF"
    )
        port map (
      I0 => \^in\(35),
      I1 => sig_cmd2mstr_cmd_valid,
      I2 => sig_sm_halt_reg,
      I3 => sig_input_reg_empty,
      O => \sig_btt_cntr_im0[13]_i_2_n_0\
    );
\sig_btt_cntr_im0[13]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"D1"
    )
        port map (
      I0 => \sig_btt_cntr_im0_reg_n_0_[13]\,
      I1 => sig_push_input_reg11_out,
      I2 => Q(13),
      O => \sig_btt_cntr_im0[13]_i_3_n_0\
    );
\sig_btt_cntr_im0[13]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"D1"
    )
        port map (
      I0 => \sig_btt_cntr_im0_reg_n_0_[12]\,
      I1 => sig_push_input_reg11_out,
      I2 => Q(12),
      O => \sig_btt_cntr_im0[13]_i_4_n_0\
    );
\sig_btt_cntr_im0[13]_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"D1"
    )
        port map (
      I0 => \sig_btt_cntr_im0_reg_n_0_[11]\,
      I1 => sig_push_input_reg11_out,
      I2 => Q(11),
      O => \sig_btt_cntr_im0[13]_i_5_n_0\
    );
\sig_btt_cntr_im0[13]_i_6\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"D1"
    )
        port map (
      I0 => \sig_btt_cntr_im0_reg_n_0_[10]\,
      I1 => sig_push_input_reg11_out,
      I2 => Q(10),
      O => \sig_btt_cntr_im0[13]_i_6_n_0\
    );
\sig_btt_cntr_im0[13]_i_7\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"D1"
    )
        port map (
      I0 => \sig_btt_cntr_im0_reg_n_0_[9]\,
      I1 => sig_push_input_reg11_out,
      I2 => Q(9),
      O => \sig_btt_cntr_im0[13]_i_7_n_0\
    );
\sig_btt_cntr_im0[13]_i_8\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"D1"
    )
        port map (
      I0 => \sig_btt_cntr_im0_reg_n_0_[8]\,
      I1 => sig_push_input_reg11_out,
      I2 => Q(8),
      O => \sig_btt_cntr_im0[13]_i_8_n_0\
    );
\sig_btt_cntr_im0[7]_i_10\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F909"
    )
        port map (
      I0 => \sig_addr_cntr_incr_ireg2_reg_n_0_[6]\,
      I1 => \sig_btt_cntr_im0_reg_n_0_[6]\,
      I2 => sig_push_input_reg11_out,
      I3 => Q(6),
      O => \sig_btt_cntr_im0[7]_i_10_n_0\
    );
\sig_btt_cntr_im0[7]_i_11\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F909"
    )
        port map (
      I0 => \sig_addr_cntr_incr_ireg2_reg_n_0_[5]\,
      I1 => \sig_btt_cntr_im0_reg_n_0_[5]\,
      I2 => sig_push_input_reg11_out,
      I3 => Q(5),
      O => \sig_btt_cntr_im0[7]_i_11_n_0\
    );
\sig_btt_cntr_im0[7]_i_12\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F909"
    )
        port map (
      I0 => \sig_addr_cntr_incr_ireg2_reg_n_0_[4]\,
      I1 => \sig_btt_cntr_im0_reg_n_0_[4]\,
      I2 => sig_push_input_reg11_out,
      I3 => Q(4),
      O => \sig_btt_cntr_im0[7]_i_12_n_0\
    );
\sig_btt_cntr_im0[7]_i_13\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F909"
    )
        port map (
      I0 => \sig_addr_cntr_incr_ireg2_reg_n_0_[3]\,
      I1 => \sig_btt_cntr_im0_reg_n_0_[3]\,
      I2 => sig_push_input_reg11_out,
      I3 => Q(3),
      O => \sig_btt_cntr_im0[7]_i_13_n_0\
    );
\sig_btt_cntr_im0[7]_i_14\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F909"
    )
        port map (
      I0 => \sig_addr_cntr_incr_ireg2_reg_n_0_[2]\,
      I1 => \sig_btt_cntr_im0_reg_n_0_[2]\,
      I2 => sig_push_input_reg11_out,
      I3 => Q(2),
      O => \sig_btt_cntr_im0[7]_i_14_n_0\
    );
\sig_btt_cntr_im0[7]_i_15\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F909"
    )
        port map (
      I0 => \sig_addr_cntr_incr_ireg2_reg_n_0_[1]\,
      I1 => \sig_btt_cntr_im0_reg_n_0_[1]\,
      I2 => sig_push_input_reg11_out,
      I3 => Q(1),
      O => \sig_btt_cntr_im0[7]_i_15_n_0\
    );
\sig_btt_cntr_im0[7]_i_16\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F909"
    )
        port map (
      I0 => \sig_addr_cntr_incr_ireg2_reg_n_0_[0]\,
      I1 => \sig_btt_cntr_im0_reg_n_0_[0]\,
      I2 => sig_push_input_reg11_out,
      I3 => Q(0),
      O => \sig_btt_cntr_im0[7]_i_16_n_0\
    );
\sig_btt_cntr_im0[7]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \sig_addr_cntr_incr_ireg2_reg_n_0_[6]\,
      I1 => sig_push_input_reg11_out,
      O => \sig_btt_cntr_im0[7]_i_2_n_0\
    );
\sig_btt_cntr_im0[7]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \sig_addr_cntr_incr_ireg2_reg_n_0_[5]\,
      I1 => sig_push_input_reg11_out,
      O => \sig_btt_cntr_im0[7]_i_3_n_0\
    );
\sig_btt_cntr_im0[7]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \sig_addr_cntr_incr_ireg2_reg_n_0_[4]\,
      I1 => sig_push_input_reg11_out,
      O => \sig_btt_cntr_im0[7]_i_4_n_0\
    );
\sig_btt_cntr_im0[7]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \sig_addr_cntr_incr_ireg2_reg_n_0_[3]\,
      I1 => sig_push_input_reg11_out,
      O => \sig_btt_cntr_im0[7]_i_5_n_0\
    );
\sig_btt_cntr_im0[7]_i_6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \sig_addr_cntr_incr_ireg2_reg_n_0_[2]\,
      I1 => sig_push_input_reg11_out,
      O => \sig_btt_cntr_im0[7]_i_6_n_0\
    );
\sig_btt_cntr_im0[7]_i_7\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \sig_addr_cntr_incr_ireg2_reg_n_0_[1]\,
      I1 => sig_push_input_reg11_out,
      O => \sig_btt_cntr_im0[7]_i_7_n_0\
    );
\sig_btt_cntr_im0[7]_i_8\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \sig_addr_cntr_incr_ireg2_reg_n_0_[0]\,
      I1 => sig_push_input_reg11_out,
      O => \sig_btt_cntr_im0[7]_i_8_n_0\
    );
\sig_btt_cntr_im0[7]_i_9\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"D1"
    )
        port map (
      I0 => \sig_btt_cntr_im0_reg_n_0_[7]\,
      I1 => sig_push_input_reg11_out,
      I2 => Q(7),
      O => \sig_btt_cntr_im0[7]_i_9_n_0\
    );
\sig_btt_cntr_im0_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => \sig_addr_cntr_lsh_im0[15]_i_1_n_0\,
      D => \sig_btt_cntr_im0_reg[7]_i_1_n_15\,
      Q => \sig_btt_cntr_im0_reg_n_0_[0]\,
      R => \^sig_init_reg\
    );
\sig_btt_cntr_im0_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => \sig_addr_cntr_lsh_im0[15]_i_1_n_0\,
      D => \sig_btt_cntr_im0_reg[13]_i_1_n_13\,
      Q => \sig_btt_cntr_im0_reg_n_0_[10]\,
      R => \^sig_init_reg\
    );
\sig_btt_cntr_im0_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => \sig_addr_cntr_lsh_im0[15]_i_1_n_0\,
      D => \sig_btt_cntr_im0_reg[13]_i_1_n_12\,
      Q => \sig_btt_cntr_im0_reg_n_0_[11]\,
      R => \^sig_init_reg\
    );
\sig_btt_cntr_im0_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => \sig_addr_cntr_lsh_im0[15]_i_1_n_0\,
      D => \sig_btt_cntr_im0_reg[13]_i_1_n_11\,
      Q => \sig_btt_cntr_im0_reg_n_0_[12]\,
      R => \^sig_init_reg\
    );
\sig_btt_cntr_im0_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => \sig_addr_cntr_lsh_im0[15]_i_1_n_0\,
      D => \sig_btt_cntr_im0_reg[13]_i_1_n_10\,
      Q => \sig_btt_cntr_im0_reg_n_0_[13]\,
      R => \^sig_init_reg\
    );
\sig_btt_cntr_im0_reg[13]_i_1\: unisim.vcomponents.CARRY8
     port map (
      CI => \sig_btt_cntr_im0_reg[7]_i_1_n_0\,
      CI_TOP => '0',
      CO(7 downto 5) => \NLW_sig_btt_cntr_im0_reg[13]_i_1_CO_UNCONNECTED\(7 downto 5),
      CO(4) => \sig_btt_cntr_im0_reg[13]_i_1_n_3\,
      CO(3) => \sig_btt_cntr_im0_reg[13]_i_1_n_4\,
      CO(2) => \sig_btt_cntr_im0_reg[13]_i_1_n_5\,
      CO(1) => \sig_btt_cntr_im0_reg[13]_i_1_n_6\,
      CO(0) => \sig_btt_cntr_im0_reg[13]_i_1_n_7\,
      DI(7 downto 5) => B"000",
      DI(4) => \sig_btt_cntr_im0[13]_i_2_n_0\,
      DI(3) => \sig_btt_cntr_im0[13]_i_2_n_0\,
      DI(2) => \sig_btt_cntr_im0[13]_i_2_n_0\,
      DI(1) => \sig_btt_cntr_im0[13]_i_2_n_0\,
      DI(0) => \sig_btt_cntr_im0[13]_i_2_n_0\,
      O(7 downto 6) => \NLW_sig_btt_cntr_im0_reg[13]_i_1_O_UNCONNECTED\(7 downto 6),
      O(5) => \sig_btt_cntr_im0_reg[13]_i_1_n_10\,
      O(4) => \sig_btt_cntr_im0_reg[13]_i_1_n_11\,
      O(3) => \sig_btt_cntr_im0_reg[13]_i_1_n_12\,
      O(2) => \sig_btt_cntr_im0_reg[13]_i_1_n_13\,
      O(1) => \sig_btt_cntr_im0_reg[13]_i_1_n_14\,
      O(0) => \sig_btt_cntr_im0_reg[13]_i_1_n_15\,
      S(7 downto 6) => B"00",
      S(5) => \sig_btt_cntr_im0[13]_i_3_n_0\,
      S(4) => \sig_btt_cntr_im0[13]_i_4_n_0\,
      S(3) => \sig_btt_cntr_im0[13]_i_5_n_0\,
      S(2) => \sig_btt_cntr_im0[13]_i_6_n_0\,
      S(1) => \sig_btt_cntr_im0[13]_i_7_n_0\,
      S(0) => \sig_btt_cntr_im0[13]_i_8_n_0\
    );
\sig_btt_cntr_im0_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => \sig_addr_cntr_lsh_im0[15]_i_1_n_0\,
      D => \sig_btt_cntr_im0_reg[7]_i_1_n_14\,
      Q => \sig_btt_cntr_im0_reg_n_0_[1]\,
      R => \^sig_init_reg\
    );
\sig_btt_cntr_im0_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => \sig_addr_cntr_lsh_im0[15]_i_1_n_0\,
      D => \sig_btt_cntr_im0_reg[7]_i_1_n_13\,
      Q => \sig_btt_cntr_im0_reg_n_0_[2]\,
      R => \^sig_init_reg\
    );
\sig_btt_cntr_im0_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => \sig_addr_cntr_lsh_im0[15]_i_1_n_0\,
      D => \sig_btt_cntr_im0_reg[7]_i_1_n_12\,
      Q => \sig_btt_cntr_im0_reg_n_0_[3]\,
      R => \^sig_init_reg\
    );
\sig_btt_cntr_im0_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => \sig_addr_cntr_lsh_im0[15]_i_1_n_0\,
      D => \sig_btt_cntr_im0_reg[7]_i_1_n_11\,
      Q => \sig_btt_cntr_im0_reg_n_0_[4]\,
      R => \^sig_init_reg\
    );
\sig_btt_cntr_im0_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => \sig_addr_cntr_lsh_im0[15]_i_1_n_0\,
      D => \sig_btt_cntr_im0_reg[7]_i_1_n_10\,
      Q => \sig_btt_cntr_im0_reg_n_0_[5]\,
      R => \^sig_init_reg\
    );
\sig_btt_cntr_im0_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => \sig_addr_cntr_lsh_im0[15]_i_1_n_0\,
      D => \sig_btt_cntr_im0_reg[7]_i_1_n_9\,
      Q => \sig_btt_cntr_im0_reg_n_0_[6]\,
      R => \^sig_init_reg\
    );
\sig_btt_cntr_im0_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => \sig_addr_cntr_lsh_im0[15]_i_1_n_0\,
      D => \sig_btt_cntr_im0_reg[7]_i_1_n_8\,
      Q => \sig_btt_cntr_im0_reg_n_0_[7]\,
      R => \^sig_init_reg\
    );
\sig_btt_cntr_im0_reg[7]_i_1\: unisim.vcomponents.CARRY8
     port map (
      CI => \sig_btt_cntr_im0[13]_i_2_n_0\,
      CI_TOP => '0',
      CO(7) => \sig_btt_cntr_im0_reg[7]_i_1_n_0\,
      CO(6) => \sig_btt_cntr_im0_reg[7]_i_1_n_1\,
      CO(5) => \sig_btt_cntr_im0_reg[7]_i_1_n_2\,
      CO(4) => \sig_btt_cntr_im0_reg[7]_i_1_n_3\,
      CO(3) => \sig_btt_cntr_im0_reg[7]_i_1_n_4\,
      CO(2) => \sig_btt_cntr_im0_reg[7]_i_1_n_5\,
      CO(1) => \sig_btt_cntr_im0_reg[7]_i_1_n_6\,
      CO(0) => \sig_btt_cntr_im0_reg[7]_i_1_n_7\,
      DI(7) => \sig_btt_cntr_im0[13]_i_2_n_0\,
      DI(6) => \sig_btt_cntr_im0[7]_i_2_n_0\,
      DI(5) => \sig_btt_cntr_im0[7]_i_3_n_0\,
      DI(4) => \sig_btt_cntr_im0[7]_i_4_n_0\,
      DI(3) => \sig_btt_cntr_im0[7]_i_5_n_0\,
      DI(2) => \sig_btt_cntr_im0[7]_i_6_n_0\,
      DI(1) => \sig_btt_cntr_im0[7]_i_7_n_0\,
      DI(0) => \sig_btt_cntr_im0[7]_i_8_n_0\,
      O(7) => \sig_btt_cntr_im0_reg[7]_i_1_n_8\,
      O(6) => \sig_btt_cntr_im0_reg[7]_i_1_n_9\,
      O(5) => \sig_btt_cntr_im0_reg[7]_i_1_n_10\,
      O(4) => \sig_btt_cntr_im0_reg[7]_i_1_n_11\,
      O(3) => \sig_btt_cntr_im0_reg[7]_i_1_n_12\,
      O(2) => \sig_btt_cntr_im0_reg[7]_i_1_n_13\,
      O(1) => \sig_btt_cntr_im0_reg[7]_i_1_n_14\,
      O(0) => \sig_btt_cntr_im0_reg[7]_i_1_n_15\,
      S(7) => \sig_btt_cntr_im0[7]_i_9_n_0\,
      S(6) => \sig_btt_cntr_im0[7]_i_10_n_0\,
      S(5) => \sig_btt_cntr_im0[7]_i_11_n_0\,
      S(4) => \sig_btt_cntr_im0[7]_i_12_n_0\,
      S(3) => \sig_btt_cntr_im0[7]_i_13_n_0\,
      S(2) => \sig_btt_cntr_im0[7]_i_14_n_0\,
      S(1) => \sig_btt_cntr_im0[7]_i_15_n_0\,
      S(0) => \sig_btt_cntr_im0[7]_i_16_n_0\
    );
\sig_btt_cntr_im0_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => \sig_addr_cntr_lsh_im0[15]_i_1_n_0\,
      D => \sig_btt_cntr_im0_reg[13]_i_1_n_15\,
      Q => \sig_btt_cntr_im0_reg_n_0_[8]\,
      R => \^sig_init_reg\
    );
\sig_btt_cntr_im0_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => \sig_addr_cntr_lsh_im0[15]_i_1_n_0\,
      D => \sig_btt_cntr_im0_reg[13]_i_1_n_14\,
      Q => \sig_btt_cntr_im0_reg_n_0_[9]\,
      R => \^sig_init_reg\
    );
sig_btt_eq_b2mbaa_ireg1_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00800000"
    )
        port map (
      I0 => sig_btt_eq_b2mbaa_ireg1_i_2_n_0,
      I1 => sig_btt_lt_b2mbaa_ireg1_i_2_n_0,
      I2 => sig_btt_eq_b2mbaa_ireg1_i_3_n_0,
      I3 => sig_addr_aligned_im0,
      I4 => sig_btt_eq_b2mbaa_ireg1_i_4_n_0,
      O => sig_btt_eq_b2mbaa_im0
    );
sig_btt_eq_b2mbaa_ireg1_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"1212122448484881"
    )
        port map (
      I0 => \sig_btt_cntr_im0_reg_n_0_[2]\,
      I1 => \sig_btt_cntr_im0_reg_n_0_[3]\,
      I2 => sig_mbaa_addr_cntr_slice_im0(2),
      I3 => sig_mbaa_addr_cntr_slice_im0(0),
      I4 => sig_mbaa_addr_cntr_slice_im0(1),
      I5 => sig_mbaa_addr_cntr_slice_im0(3),
      O => sig_btt_eq_b2mbaa_ireg1_i_2_n_0
    );
sig_btt_eq_b2mbaa_ireg1_i_3: unisim.vcomponents.LUT5
    generic map(
      INIT => X"04104001"
    )
        port map (
      I0 => \sig_btt_cntr_im0_reg_n_0_[6]\,
      I1 => \sig_btt_cntr_im0_reg_n_0_[0]\,
      I2 => \sig_btt_cntr_im0_reg_n_0_[1]\,
      I3 => sig_mbaa_addr_cntr_slice_im0(0),
      I4 => sig_mbaa_addr_cntr_slice_im0(1),
      O => sig_btt_eq_b2mbaa_ireg1_i_3_n_0
    );
sig_btt_eq_b2mbaa_ireg1_i_4: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0660"
    )
        port map (
      I0 => \sig_btt_cntr_im0_reg_n_0_[5]\,
      I1 => sig_btt_lt_b2mbaa_im01_carry_i_9_n_0,
      I2 => sig_btt_lt_b2mbaa_im01_carry_i_8_n_0,
      I3 => \sig_btt_cntr_im0_reg_n_0_[4]\,
      O => sig_btt_eq_b2mbaa_ireg1_i_4_n_0
    );
sig_btt_eq_b2mbaa_ireg1_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_sm_ld_calc2_reg_ns,
      D => sig_btt_eq_b2mbaa_im0,
      Q => sig_btt_eq_b2mbaa_ireg1,
      R => \^sig_init_reg\
    );
sig_btt_lt_b2mbaa_im01_carry: unisim.vcomponents.CARRY8
     port map (
      CI => '0',
      CI_TOP => '0',
      CO(7 downto 4) => NLW_sig_btt_lt_b2mbaa_im01_carry_CO_UNCONNECTED(7 downto 4),
      CO(3) => sig_btt_lt_b2mbaa_im01,
      CO(2) => sig_btt_lt_b2mbaa_im01_carry_n_5,
      CO(1) => sig_btt_lt_b2mbaa_im01_carry_n_6,
      CO(0) => sig_btt_lt_b2mbaa_im01_carry_n_7,
      DI(7 downto 4) => B"0000",
      DI(3) => sig_addr_aligned_im0,
      DI(2) => sig_btt_lt_b2mbaa_im01_carry_i_1_n_0,
      DI(1) => sig_btt_lt_b2mbaa_im01_carry_i_2_n_0,
      DI(0) => sig_btt_lt_b2mbaa_im01_carry_i_3_n_0,
      O(7 downto 0) => NLW_sig_btt_lt_b2mbaa_im01_carry_O_UNCONNECTED(7 downto 0),
      S(7 downto 4) => B"0000",
      S(3) => sig_btt_lt_b2mbaa_im01_carry_i_4_n_0,
      S(2) => sig_btt_lt_b2mbaa_im01_carry_i_5_n_0,
      S(1) => sig_btt_lt_b2mbaa_im01_carry_i_6_n_0,
      S(0) => sig_btt_lt_b2mbaa_im01_carry_i_7_n_0
    );
sig_btt_lt_b2mbaa_im01_carry_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"011F"
    )
        port map (
      I0 => sig_btt_lt_b2mbaa_im01_carry_i_8_n_0,
      I1 => \sig_btt_cntr_im0_reg_n_0_[4]\,
      I2 => sig_btt_lt_b2mbaa_im01_carry_i_9_n_0,
      I3 => \sig_btt_cntr_im0_reg_n_0_[5]\,
      O => sig_btt_lt_b2mbaa_im01_carry_i_1_n_0
    );
sig_btt_lt_b2mbaa_im01_carry_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000111103337777C"
    )
        port map (
      I0 => \sig_btt_cntr_im0_reg_n_0_[2]\,
      I1 => sig_mbaa_addr_cntr_slice_im0(3),
      I2 => sig_mbaa_addr_cntr_slice_im0(1),
      I3 => sig_mbaa_addr_cntr_slice_im0(0),
      I4 => sig_mbaa_addr_cntr_slice_im0(2),
      I5 => \sig_btt_cntr_im0_reg_n_0_[3]\,
      O => sig_btt_lt_b2mbaa_im01_carry_i_2_n_0
    );
sig_btt_lt_b2mbaa_im01_carry_i_3: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1370"
    )
        port map (
      I0 => \sig_btt_cntr_im0_reg_n_0_[0]\,
      I1 => \sig_btt_cntr_im0_reg_n_0_[1]\,
      I2 => sig_mbaa_addr_cntr_slice_im0(0),
      I3 => sig_mbaa_addr_cntr_slice_im0(1),
      O => sig_btt_lt_b2mbaa_im01_carry_i_3_n_0
    );
sig_btt_lt_b2mbaa_im01_carry_i_4: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => sig_mbaa_addr_cntr_slice_im0(5),
      I1 => sig_mbaa_addr_cntr_slice_im0(1),
      I2 => sig_mbaa_addr_cntr_slice_im0(0),
      I3 => sig_mbaa_addr_cntr_slice_im0(2),
      I4 => sig_mbaa_addr_cntr_slice_im0(3),
      I5 => sig_mbaa_addr_cntr_slice_im0(4),
      O => sig_btt_lt_b2mbaa_im01_carry_i_4_n_0
    );
sig_btt_lt_b2mbaa_im01_carry_i_5: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0660"
    )
        port map (
      I0 => \sig_btt_cntr_im0_reg_n_0_[5]\,
      I1 => sig_btt_lt_b2mbaa_im01_carry_i_9_n_0,
      I2 => sig_btt_lt_b2mbaa_im01_carry_i_8_n_0,
      I3 => \sig_btt_cntr_im0_reg_n_0_[4]\,
      O => sig_btt_lt_b2mbaa_im01_carry_i_5_n_0
    );
sig_btt_lt_b2mbaa_im01_carry_i_6: unisim.vcomponents.LUT6
    generic map(
      INIT => X"1212122448484881"
    )
        port map (
      I0 => \sig_btt_cntr_im0_reg_n_0_[2]\,
      I1 => \sig_btt_cntr_im0_reg_n_0_[3]\,
      I2 => sig_mbaa_addr_cntr_slice_im0(2),
      I3 => sig_mbaa_addr_cntr_slice_im0(0),
      I4 => sig_mbaa_addr_cntr_slice_im0(1),
      I5 => sig_mbaa_addr_cntr_slice_im0(3),
      O => sig_btt_lt_b2mbaa_im01_carry_i_6_n_0
    );
sig_btt_lt_b2mbaa_im01_carry_i_7: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2481"
    )
        port map (
      I0 => \sig_btt_cntr_im0_reg_n_0_[0]\,
      I1 => \sig_btt_cntr_im0_reg_n_0_[1]\,
      I2 => sig_mbaa_addr_cntr_slice_im0(0),
      I3 => sig_mbaa_addr_cntr_slice_im0(1),
      O => sig_btt_lt_b2mbaa_im01_carry_i_7_n_0
    );
sig_btt_lt_b2mbaa_im01_carry_i_8: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAAAA9"
    )
        port map (
      I0 => sig_mbaa_addr_cntr_slice_im0(4),
      I1 => sig_mbaa_addr_cntr_slice_im0(3),
      I2 => sig_mbaa_addr_cntr_slice_im0(2),
      I3 => sig_mbaa_addr_cntr_slice_im0(0),
      I4 => sig_mbaa_addr_cntr_slice_im0(1),
      O => sig_btt_lt_b2mbaa_im01_carry_i_8_n_0
    );
sig_btt_lt_b2mbaa_im01_carry_i_9: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFE00000001"
    )
        port map (
      I0 => sig_mbaa_addr_cntr_slice_im0(4),
      I1 => sig_mbaa_addr_cntr_slice_im0(3),
      I2 => sig_mbaa_addr_cntr_slice_im0(2),
      I3 => sig_mbaa_addr_cntr_slice_im0(0),
      I4 => sig_mbaa_addr_cntr_slice_im0(1),
      I5 => sig_mbaa_addr_cntr_slice_im0(5),
      O => sig_btt_lt_b2mbaa_im01_carry_i_9_n_0
    );
sig_btt_lt_b2mbaa_ireg1_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => \sig_btt_cntr_im0_reg_n_0_[6]\,
      I1 => sig_btt_lt_b2mbaa_im01,
      I2 => sig_btt_lt_b2mbaa_ireg1_i_2_n_0,
      O => sig_btt_lt_b2mbaa_im0
    );
sig_btt_lt_b2mbaa_ireg1_i_2: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0100"
    )
        port map (
      I0 => \sig_btt_cntr_im0_reg_n_0_[7]\,
      I1 => \sig_btt_cntr_im0_reg_n_0_[11]\,
      I2 => \sig_btt_cntr_im0_reg_n_0_[13]\,
      I3 => sig_btt_lt_b2mbaa_ireg1_i_3_n_0,
      O => sig_btt_lt_b2mbaa_ireg1_i_2_n_0
    );
sig_btt_lt_b2mbaa_ireg1_i_3: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => \sig_btt_cntr_im0_reg_n_0_[12]\,
      I1 => \sig_btt_cntr_im0_reg_n_0_[10]\,
      I2 => \sig_btt_cntr_im0_reg_n_0_[9]\,
      I3 => \sig_btt_cntr_im0_reg_n_0_[8]\,
      O => sig_btt_lt_b2mbaa_ireg1_i_3_n_0
    );
sig_btt_lt_b2mbaa_ireg1_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_sm_ld_calc2_reg_ns,
      D => sig_btt_lt_b2mbaa_im0,
      Q => sig_btt_lt_b2mbaa_ireg1,
      R => \^sig_init_reg\
    );
\sig_bytes_to_mbaa_ireg1[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => sig_mbaa_addr_cntr_slice_im0(1),
      I1 => sig_mbaa_addr_cntr_slice_im0(0),
      O => sig_bytes_to_mbaa_im0(1)
    );
\sig_bytes_to_mbaa_ireg1[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"1E"
    )
        port map (
      I0 => sig_mbaa_addr_cntr_slice_im0(1),
      I1 => sig_mbaa_addr_cntr_slice_im0(0),
      I2 => sig_mbaa_addr_cntr_slice_im0(2),
      O => sig_bytes_to_mbaa_im0(2)
    );
\sig_bytes_to_mbaa_ireg1[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"5556"
    )
        port map (
      I0 => sig_mbaa_addr_cntr_slice_im0(3),
      I1 => sig_mbaa_addr_cntr_slice_im0(1),
      I2 => sig_mbaa_addr_cntr_slice_im0(0),
      I3 => sig_mbaa_addr_cntr_slice_im0(2),
      O => sig_bytes_to_mbaa_im0(3)
    );
\sig_bytes_to_mbaa_ireg1[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0001FFFE"
    )
        port map (
      I0 => sig_mbaa_addr_cntr_slice_im0(1),
      I1 => sig_mbaa_addr_cntr_slice_im0(0),
      I2 => sig_mbaa_addr_cntr_slice_im0(2),
      I3 => sig_mbaa_addr_cntr_slice_im0(3),
      I4 => sig_mbaa_addr_cntr_slice_im0(4),
      O => sig_bytes_to_mbaa_im0(4)
    );
\sig_bytes_to_mbaa_ireg1[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"5555555555555556"
    )
        port map (
      I0 => sig_mbaa_addr_cntr_slice_im0(5),
      I1 => sig_mbaa_addr_cntr_slice_im0(1),
      I2 => sig_mbaa_addr_cntr_slice_im0(0),
      I3 => sig_mbaa_addr_cntr_slice_im0(2),
      I4 => sig_mbaa_addr_cntr_slice_im0(3),
      I5 => sig_mbaa_addr_cntr_slice_im0(4),
      O => sig_bytes_to_mbaa_im0(5)
    );
\sig_bytes_to_mbaa_ireg1_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_sm_ld_calc2_reg_ns,
      D => sig_mbaa_addr_cntr_slice_im0(0),
      Q => sig_bytes_to_mbaa_ireg1(0),
      R => \^sig_init_reg\
    );
\sig_bytes_to_mbaa_ireg1_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_sm_ld_calc2_reg_ns,
      D => sig_bytes_to_mbaa_im0(1),
      Q => sig_bytes_to_mbaa_ireg1(1),
      R => \^sig_init_reg\
    );
\sig_bytes_to_mbaa_ireg1_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_sm_ld_calc2_reg_ns,
      D => sig_bytes_to_mbaa_im0(2),
      Q => sig_bytes_to_mbaa_ireg1(2),
      R => \^sig_init_reg\
    );
\sig_bytes_to_mbaa_ireg1_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_sm_ld_calc2_reg_ns,
      D => sig_bytes_to_mbaa_im0(3),
      Q => sig_bytes_to_mbaa_ireg1(3),
      R => \^sig_init_reg\
    );
\sig_bytes_to_mbaa_ireg1_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_sm_ld_calc2_reg_ns,
      D => sig_bytes_to_mbaa_im0(4),
      Q => sig_bytes_to_mbaa_ireg1(4),
      R => \^sig_init_reg\
    );
\sig_bytes_to_mbaa_ireg1_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_sm_ld_calc2_reg_ns,
      D => sig_bytes_to_mbaa_im0(5),
      Q => sig_bytes_to_mbaa_ireg1(5),
      R => \^sig_init_reg\
    );
sig_calc_error_pushed_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FF80"
    )
        port map (
      I0 => \^in\(35),
      I1 => sig_ld_xfer_reg,
      I2 => sig_xfer_reg_empty,
      I3 => sig_calc_error_pushed,
      O => sig_calc_error_pushed_i_1_n_0
    );
sig_calc_error_pushed_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => '1',
      D => sig_calc_error_pushed_i_1_n_0,
      Q => sig_calc_error_pushed,
      R => \^sig_init_reg\
    );
sig_calc_error_reg_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0200"
    )
        port map (
      I0 => sig_calc_error_reg_i_2_n_0,
      I1 => Q(0),
      I2 => Q(1),
      I3 => sig_calc_error_reg_i_3_n_0,
      O => sig_btt_is_zero
    );
sig_calc_error_reg_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
        port map (
      I0 => Q(10),
      I1 => Q(11),
      I2 => Q(8),
      I3 => Q(9),
      I4 => Q(13),
      I5 => Q(12),
      O => sig_calc_error_reg_i_2_n_0
    );
sig_calc_error_reg_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
        port map (
      I0 => Q(4),
      I1 => Q(5),
      I2 => Q(2),
      I3 => Q(3),
      I4 => Q(7),
      I5 => Q(6),
      O => sig_calc_error_reg_i_3_n_0
    );
sig_calc_error_reg_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_push_input_reg11_out,
      D => sig_btt_is_zero,
      Q => \^in\(35),
      R => \^sig_init_reg\
    );
sig_cmd2addr_valid_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"55440544"
    )
        port map (
      I0 => \^sig_init_reg\,
      I1 => sig_sm_ld_calc3_reg,
      I2 => sig_inhibit_rdy_n_1,
      I3 => \^sig_mstr2addr_cmd_valid\,
      I4 => sig_cmd2addr_valid_reg_0,
      O => sig_cmd2addr_valid_i_1_n_0
    );
sig_cmd2addr_valid_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => '1',
      D => sig_cmd2addr_valid_i_1_n_0,
      Q => \^sig_mstr2addr_cmd_valid\,
      R => '0'
    );
sig_cmd2data_valid_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"50554444"
    )
        port map (
      I0 => \^sig_init_reg\,
      I1 => sig_sm_ld_calc3_reg,
      I2 => sig_cmd2data_valid_reg_1,
      I3 => sig_inhibit_rdy_n_0,
      I4 => \^sig_mstr2data_cmd_valid\,
      O => sig_cmd2data_valid_i_1_n_0
    );
sig_cmd2data_valid_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => '1',
      D => sig_cmd2data_valid_i_1_n_0,
      Q => \^sig_mstr2data_cmd_valid\,
      R => '0'
    );
sig_cmd2dre_valid_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"5500404055554040"
    )
        port map (
      I0 => \^sig_init_reg\,
      I1 => sig_sm_ld_calc3_reg,
      I2 => sig_first_xfer_im0,
      I3 => sig_cmd2dre_valid_reg_0,
      I4 => \^sig_mstr2sf_cmd_valid\,
      I5 => sig_inhibit_rdy_n,
      O => sig_cmd2dre_valid_i_1_n_0
    );
sig_cmd2dre_valid_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => '1',
      D => sig_cmd2dre_valid_i_1_n_0,
      Q => \^sig_mstr2sf_cmd_valid\,
      R => '0'
    );
sig_first_xfer_im0_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0054"
    )
        port map (
      I0 => \^sig_init_reg\,
      I1 => sig_push_input_reg11_out,
      I2 => sig_first_xfer_im0,
      I3 => \sig_addr_cntr_lsh_im0_reg[0]_0\,
      O => sig_first_xfer_im0_i_1_n_0
    );
sig_first_xfer_im0_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => '1',
      D => sig_first_xfer_im0_i_1_n_0,
      Q => sig_first_xfer_im0,
      R => '0'
    );
sig_input_burst_type_reg_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => sig_calc_error_pushed,
      I1 => \^sig_init_reg\,
      I2 => sig_sm_pop_input_reg,
      O => sig_input_cache_type_reg0
    );
sig_input_burst_type_reg_i_2: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0020"
    )
        port map (
      I0 => sig_input_reg_empty,
      I1 => sig_sm_halt_reg,
      I2 => sig_cmd2mstr_cmd_valid,
      I3 => \^in\(35),
      O => sig_push_input_reg11_out
    );
sig_input_burst_type_reg_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_push_input_reg11_out,
      D => Q(14),
      Q => \^in\(34),
      R => sig_input_cache_type_reg0
    );
sig_input_eof_reg_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_push_input_reg11_out,
      D => Q(15),
      Q => sig_mstr2sf_eof,
      R => sig_input_cache_type_reg0
    );
sig_input_reg_empty_reg: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_push_input_reg11_out,
      D => '0',
      Q => sig_input_reg_empty,
      S => sig_input_cache_type_reg0
    );
sig_last_addr_offset_im2: unisim.vcomponents.LUT4
    generic map(
      INIT => X"AAA9"
    )
        port map (
      I0 => \sig_adjusted_addr_incr_ireg2_reg_n_0_[3]\,
      I1 => \sig_adjusted_addr_incr_ireg2_reg_n_0_[1]\,
      I2 => \sig_adjusted_addr_incr_ireg2_reg_n_0_[0]\,
      I3 => \sig_adjusted_addr_incr_ireg2_reg_n_0_[2]\,
      O => sel0(3)
    );
sig_ld_xfer_reg_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0454"
    )
        port map (
      I0 => \^sig_init_reg\,
      I1 => sig_sm_ld_calc3_reg,
      I2 => sig_ld_xfer_reg,
      I3 => sig_xfer_reg_empty,
      O => sig_ld_xfer_reg_i_1_n_0
    );
sig_ld_xfer_reg_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => '1',
      D => sig_ld_xfer_reg_i_1_n_0,
      Q => sig_ld_xfer_reg,
      R => '0'
    );
sig_ld_xfer_reg_tmp_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0054"
    )
        port map (
      I0 => \^sig_init_reg\,
      I1 => sig_sm_ld_calc3_reg,
      I2 => sig_ld_xfer_reg_tmp,
      I3 => \sig_addr_cntr_lsh_im0_reg[0]_0\,
      O => sig_ld_xfer_reg_tmp_i_1_n_0
    );
sig_ld_xfer_reg_tmp_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => '1',
      D => sig_ld_xfer_reg_tmp_i_1_n_0,
      Q => sig_ld_xfer_reg_tmp,
      R => '0'
    );
sig_mmap_reset_reg_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => '1',
      D => SS(0),
      Q => \^sig_init_reg\,
      R => '0'
    );
sig_no_btt_residue_ireg1_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
        port map (
      I0 => \sig_btt_cntr_im0_reg_n_0_[2]\,
      I1 => \sig_btt_cntr_im0_reg_n_0_[3]\,
      I2 => \sig_btt_cntr_im0_reg_n_0_[0]\,
      I3 => \sig_btt_cntr_im0_reg_n_0_[1]\,
      I4 => \sig_btt_cntr_im0_reg_n_0_[5]\,
      I5 => \sig_btt_cntr_im0_reg_n_0_[4]\,
      O => sig_no_btt_residue_im0
    );
sig_no_btt_residue_ireg1_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_sm_ld_calc2_reg_ns,
      D => sig_no_btt_residue_im0,
      Q => sig_no_btt_residue_ireg1,
      R => \^sig_init_reg\
    );
sig_parent_done_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00001510"
    )
        port map (
      I0 => \^sig_init_reg\,
      I1 => \^sig_mstr2data_sequential\,
      I2 => sig_ld_xfer_reg_tmp,
      I3 => sig_parent_done,
      I4 => sig_push_input_reg11_out,
      O => sig_parent_done_i_1_n_0
    );
sig_parent_done_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => '1',
      D => sig_parent_done_i_1_n_0,
      Q => sig_parent_done,
      R => '0'
    );
\sig_predict_addr_lsh_ireg3[7]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \sig_addr_cntr_lsh_im0_reg_n_0_[6]\,
      I1 => \sig_addr_cntr_incr_ireg2_reg_n_0_[6]\,
      O => \sig_predict_addr_lsh_ireg3[7]_i_2_n_0\
    );
\sig_predict_addr_lsh_ireg3[7]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => sig_mbaa_addr_cntr_slice_im0(5),
      I1 => \sig_addr_cntr_incr_ireg2_reg_n_0_[5]\,
      O => \sig_predict_addr_lsh_ireg3[7]_i_3_n_0\
    );
\sig_predict_addr_lsh_ireg3[7]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => sig_mbaa_addr_cntr_slice_im0(4),
      I1 => \sig_addr_cntr_incr_ireg2_reg_n_0_[4]\,
      O => \sig_predict_addr_lsh_ireg3[7]_i_4_n_0\
    );
\sig_predict_addr_lsh_ireg3[7]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => sig_mbaa_addr_cntr_slice_im0(3),
      I1 => \sig_addr_cntr_incr_ireg2_reg_n_0_[3]\,
      O => \sig_predict_addr_lsh_ireg3[7]_i_5_n_0\
    );
\sig_predict_addr_lsh_ireg3[7]_i_6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => sig_mbaa_addr_cntr_slice_im0(2),
      I1 => \sig_addr_cntr_incr_ireg2_reg_n_0_[2]\,
      O => \sig_predict_addr_lsh_ireg3[7]_i_6_n_0\
    );
\sig_predict_addr_lsh_ireg3[7]_i_7\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => sig_mbaa_addr_cntr_slice_im0(1),
      I1 => \sig_addr_cntr_incr_ireg2_reg_n_0_[1]\,
      O => \sig_predict_addr_lsh_ireg3[7]_i_7_n_0\
    );
\sig_predict_addr_lsh_ireg3[7]_i_8\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => sig_mbaa_addr_cntr_slice_im0(0),
      I1 => \sig_addr_cntr_incr_ireg2_reg_n_0_[0]\,
      O => \sig_predict_addr_lsh_ireg3[7]_i_8_n_0\
    );
\sig_predict_addr_lsh_ireg3_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_sm_ld_calc3_reg,
      D => sig_predict_addr_lsh_im2(0),
      Q => \sig_predict_addr_lsh_ireg3_reg_n_0_[0]\,
      R => \^sig_init_reg\
    );
\sig_predict_addr_lsh_ireg3_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_sm_ld_calc3_reg,
      D => sig_predict_addr_lsh_im2(10),
      Q => \sig_predict_addr_lsh_ireg3_reg_n_0_[10]\,
      R => \^sig_init_reg\
    );
\sig_predict_addr_lsh_ireg3_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_sm_ld_calc3_reg,
      D => sig_predict_addr_lsh_im2(11),
      Q => \sig_predict_addr_lsh_ireg3_reg_n_0_[11]\,
      R => \^sig_init_reg\
    );
\sig_predict_addr_lsh_ireg3_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_sm_ld_calc3_reg,
      D => sig_predict_addr_lsh_im2(12),
      Q => \sig_predict_addr_lsh_ireg3_reg_n_0_[12]\,
      R => \^sig_init_reg\
    );
\sig_predict_addr_lsh_ireg3_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_sm_ld_calc3_reg,
      D => sig_predict_addr_lsh_im2(13),
      Q => \sig_predict_addr_lsh_ireg3_reg_n_0_[13]\,
      R => \^sig_init_reg\
    );
\sig_predict_addr_lsh_ireg3_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_sm_ld_calc3_reg,
      D => sig_predict_addr_lsh_im2(14),
      Q => \sig_predict_addr_lsh_ireg3_reg_n_0_[14]\,
      R => \^sig_init_reg\
    );
\sig_predict_addr_lsh_ireg3_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_sm_ld_calc3_reg,
      D => sig_predict_addr_lsh_im2(15),
      Q => p_0_in_0,
      R => \^sig_init_reg\
    );
\sig_predict_addr_lsh_ireg3_reg[15]_i_1\: unisim.vcomponents.CARRY8
     port map (
      CI => \sig_predict_addr_lsh_ireg3_reg[7]_i_1_n_0\,
      CI_TOP => '0',
      CO(7) => \NLW_sig_predict_addr_lsh_ireg3_reg[15]_i_1_CO_UNCONNECTED\(7),
      CO(6) => \sig_predict_addr_lsh_ireg3_reg[15]_i_1_n_1\,
      CO(5) => \sig_predict_addr_lsh_ireg3_reg[15]_i_1_n_2\,
      CO(4) => \sig_predict_addr_lsh_ireg3_reg[15]_i_1_n_3\,
      CO(3) => \sig_predict_addr_lsh_ireg3_reg[15]_i_1_n_4\,
      CO(2) => \sig_predict_addr_lsh_ireg3_reg[15]_i_1_n_5\,
      CO(1) => \sig_predict_addr_lsh_ireg3_reg[15]_i_1_n_6\,
      CO(0) => \sig_predict_addr_lsh_ireg3_reg[15]_i_1_n_7\,
      DI(7) => '0',
      DI(6) => \sig_addr_cntr_lsh_im0_reg_n_0_[14]\,
      DI(5) => \sig_addr_cntr_lsh_im0_reg_n_0_[13]\,
      DI(4) => \sig_addr_cntr_lsh_im0_reg_n_0_[12]\,
      DI(3) => \sig_addr_cntr_lsh_im0_reg_n_0_[11]\,
      DI(2) => \sig_addr_cntr_lsh_im0_reg_n_0_[10]\,
      DI(1) => \sig_addr_cntr_lsh_im0_reg_n_0_[9]\,
      DI(0) => \sig_addr_cntr_lsh_im0_reg_n_0_[8]\,
      O(7 downto 0) => sig_predict_addr_lsh_im2(15 downto 8),
      S(7) => p_1_in_1,
      S(6) => \sig_addr_cntr_lsh_im0_reg_n_0_[14]\,
      S(5) => \sig_addr_cntr_lsh_im0_reg_n_0_[13]\,
      S(4) => \sig_addr_cntr_lsh_im0_reg_n_0_[12]\,
      S(3) => \sig_addr_cntr_lsh_im0_reg_n_0_[11]\,
      S(2) => \sig_addr_cntr_lsh_im0_reg_n_0_[10]\,
      S(1) => \sig_addr_cntr_lsh_im0_reg_n_0_[9]\,
      S(0) => \sig_addr_cntr_lsh_im0_reg_n_0_[8]\
    );
\sig_predict_addr_lsh_ireg3_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_sm_ld_calc3_reg,
      D => sig_predict_addr_lsh_im2(1),
      Q => \sig_predict_addr_lsh_ireg3_reg_n_0_[1]\,
      R => \^sig_init_reg\
    );
\sig_predict_addr_lsh_ireg3_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_sm_ld_calc3_reg,
      D => sig_predict_addr_lsh_im2(2),
      Q => \sig_predict_addr_lsh_ireg3_reg_n_0_[2]\,
      R => \^sig_init_reg\
    );
\sig_predict_addr_lsh_ireg3_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_sm_ld_calc3_reg,
      D => sig_predict_addr_lsh_im2(3),
      Q => \sig_predict_addr_lsh_ireg3_reg_n_0_[3]\,
      R => \^sig_init_reg\
    );
\sig_predict_addr_lsh_ireg3_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_sm_ld_calc3_reg,
      D => sig_predict_addr_lsh_im2(4),
      Q => \sig_predict_addr_lsh_ireg3_reg_n_0_[4]\,
      R => \^sig_init_reg\
    );
\sig_predict_addr_lsh_ireg3_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_sm_ld_calc3_reg,
      D => sig_predict_addr_lsh_im2(5),
      Q => \sig_predict_addr_lsh_ireg3_reg_n_0_[5]\,
      R => \^sig_init_reg\
    );
\sig_predict_addr_lsh_ireg3_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_sm_ld_calc3_reg,
      D => sig_predict_addr_lsh_im2(6),
      Q => \sig_predict_addr_lsh_ireg3_reg_n_0_[6]\,
      R => \^sig_init_reg\
    );
\sig_predict_addr_lsh_ireg3_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_sm_ld_calc3_reg,
      D => sig_predict_addr_lsh_im2(7),
      Q => \sig_predict_addr_lsh_ireg3_reg_n_0_[7]\,
      R => \^sig_init_reg\
    );
\sig_predict_addr_lsh_ireg3_reg[7]_i_1\: unisim.vcomponents.CARRY8
     port map (
      CI => '0',
      CI_TOP => '0',
      CO(7) => \sig_predict_addr_lsh_ireg3_reg[7]_i_1_n_0\,
      CO(6) => \sig_predict_addr_lsh_ireg3_reg[7]_i_1_n_1\,
      CO(5) => \sig_predict_addr_lsh_ireg3_reg[7]_i_1_n_2\,
      CO(4) => \sig_predict_addr_lsh_ireg3_reg[7]_i_1_n_3\,
      CO(3) => \sig_predict_addr_lsh_ireg3_reg[7]_i_1_n_4\,
      CO(2) => \sig_predict_addr_lsh_ireg3_reg[7]_i_1_n_5\,
      CO(1) => \sig_predict_addr_lsh_ireg3_reg[7]_i_1_n_6\,
      CO(0) => \sig_predict_addr_lsh_ireg3_reg[7]_i_1_n_7\,
      DI(7) => \sig_addr_cntr_lsh_im0_reg_n_0_[7]\,
      DI(6) => \sig_addr_cntr_lsh_im0_reg_n_0_[6]\,
      DI(5 downto 0) => sig_mbaa_addr_cntr_slice_im0(5 downto 0),
      O(7 downto 0) => sig_predict_addr_lsh_im2(7 downto 0),
      S(7) => \sig_addr_cntr_lsh_im0_reg_n_0_[7]\,
      S(6) => \sig_predict_addr_lsh_ireg3[7]_i_2_n_0\,
      S(5) => \sig_predict_addr_lsh_ireg3[7]_i_3_n_0\,
      S(4) => \sig_predict_addr_lsh_ireg3[7]_i_4_n_0\,
      S(3) => \sig_predict_addr_lsh_ireg3[7]_i_5_n_0\,
      S(2) => \sig_predict_addr_lsh_ireg3[7]_i_6_n_0\,
      S(1) => \sig_predict_addr_lsh_ireg3[7]_i_7_n_0\,
      S(0) => \sig_predict_addr_lsh_ireg3[7]_i_8_n_0\
    );
\sig_predict_addr_lsh_ireg3_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_sm_ld_calc3_reg,
      D => sig_predict_addr_lsh_im2(8),
      Q => \sig_predict_addr_lsh_ireg3_reg_n_0_[8]\,
      R => \^sig_init_reg\
    );
\sig_predict_addr_lsh_ireg3_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_sm_ld_calc3_reg,
      D => sig_predict_addr_lsh_im2(9),
      Q => \sig_predict_addr_lsh_ireg3_reg_n_0_[9]\,
      R => \^sig_init_reg\
    );
sig_sm_halt_reg_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFEA"
    )
        port map (
      I0 => \FSM_onehot_sig_pcc_sm_state_reg_n_0_[7]\,
      I1 => \FSM_onehot_sig_pcc_sm_state_reg_n_0_[6]\,
      I2 => sig_calc_error_pushed,
      I3 => \FSM_onehot_sig_pcc_sm_state_reg_n_0_[0]\,
      O => sig_sm_halt_ns
    );
sig_sm_halt_reg_reg: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => '1',
      D => sig_sm_halt_ns,
      Q => sig_sm_halt_reg,
      S => \^sig_init_reg\
    );
sig_sm_ld_calc2_reg_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => '1',
      D => sig_sm_ld_calc2_reg_ns,
      Q => sig_sm_ld_calc2_reg,
      R => \^sig_init_reg\
    );
sig_sm_ld_calc3_reg_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => '1',
      D => sig_sm_ld_calc2_reg,
      Q => sig_sm_ld_calc3_reg,
      R => \^sig_init_reg\
    );
sig_sm_pop_input_reg_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => sig_calc_error_pushed,
      I1 => sig_parent_done,
      I2 => \FSM_onehot_sig_pcc_sm_state_reg_n_0_[6]\,
      O => sig_sm_pop_input_reg_ns
    );
sig_sm_pop_input_reg_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => '1',
      D => sig_sm_pop_input_reg_ns,
      Q => sig_sm_pop_input_reg,
      R => \^sig_init_reg\
    );
\sig_strbgen_addr_ireg2_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_sm_ld_calc2_reg,
      D => sig_mbaa_addr_cntr_slice_im0(0),
      Q => sig_strbgen_addr_ireg2(0),
      R => \^sig_init_reg\
    );
\sig_strbgen_addr_ireg2_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_sm_ld_calc2_reg,
      D => sig_mbaa_addr_cntr_slice_im0(1),
      Q => sig_strbgen_addr_ireg2(1),
      R => \^sig_init_reg\
    );
\sig_strbgen_addr_ireg2_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_sm_ld_calc2_reg,
      D => sig_mbaa_addr_cntr_slice_im0(2),
      Q => sig_strbgen_addr_ireg2(2),
      R => \^sig_init_reg\
    );
\sig_strbgen_addr_ireg2_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_sm_ld_calc2_reg,
      D => sig_mbaa_addr_cntr_slice_im0(3),
      Q => sig_strbgen_addr_ireg2(3),
      R => \^sig_init_reg\
    );
\sig_strbgen_bytes_ireg2[3]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => sig_strbgen_bytes_ireg2(4),
      I1 => \^sig_init_reg\,
      O => \sig_strbgen_bytes_ireg2[3]_i_1_n_0\
    );
\sig_strbgen_bytes_ireg2[3]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFBABB00000000"
    )
        port map (
      I0 => \sig_addr_cntr_incr_ireg2[5]_i_1_n_0\,
      I1 => sig_btt_lt_b2mbaa_ireg1,
      I2 => sig_addr_aligned_ireg1,
      I3 => sig_first_xfer_im0,
      I4 => \sig_addr_cntr_incr_ireg2[4]_i_1_n_0\,
      I5 => sig_sm_ld_calc2_reg,
      O => sig_strbgen_bytes_ireg2(4)
    );
\sig_strbgen_bytes_ireg2[4]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FBF8"
    )
        port map (
      I0 => \sig_addr_cntr_incr_ireg2[4]_i_1_n_0\,
      I1 => sig_sm_ld_calc2_reg,
      I2 => sig_strbgen_bytes_ireg2(4),
      I3 => \sig_strbgen_bytes_ireg2_reg_n_0_[4]\,
      O => \sig_strbgen_bytes_ireg2[4]_i_1_n_0\
    );
\sig_strbgen_bytes_ireg2_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_sm_ld_calc2_reg,
      D => \sig_addr_cntr_incr_ireg2[0]_i_1_n_0\,
      Q => \sig_strbgen_bytes_ireg2_reg_n_0_[0]\,
      R => \sig_strbgen_bytes_ireg2[3]_i_1_n_0\
    );
\sig_strbgen_bytes_ireg2_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_sm_ld_calc2_reg,
      D => \sig_addr_cntr_incr_ireg2[1]_i_1_n_0\,
      Q => \sig_strbgen_bytes_ireg2_reg_n_0_[1]\,
      R => \sig_strbgen_bytes_ireg2[3]_i_1_n_0\
    );
\sig_strbgen_bytes_ireg2_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_sm_ld_calc2_reg,
      D => \sig_addr_cntr_incr_ireg2[2]_i_1_n_0\,
      Q => \sig_strbgen_bytes_ireg2_reg_n_0_[2]\,
      R => \sig_strbgen_bytes_ireg2[3]_i_1_n_0\
    );
\sig_strbgen_bytes_ireg2_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_sm_ld_calc2_reg,
      D => \sig_addr_cntr_incr_ireg2[3]_i_1_n_0\,
      Q => \sig_strbgen_bytes_ireg2_reg_n_0_[3]\,
      R => \sig_strbgen_bytes_ireg2[3]_i_1_n_0\
    );
\sig_strbgen_bytes_ireg2_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => '1',
      D => \sig_strbgen_bytes_ireg2[4]_i_1_n_0\,
      Q => \sig_strbgen_bytes_ireg2_reg_n_0_[4]\,
      R => \^sig_init_reg\
    );
\sig_xfer_end_strb_ireg3[10]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"AA81"
    )
        port map (
      I0 => \sig_adjusted_addr_incr_ireg2_reg_n_0_[3]\,
      I1 => \sig_adjusted_addr_incr_ireg2_reg_n_0_[1]\,
      I2 => \sig_adjusted_addr_incr_ireg2_reg_n_0_[0]\,
      I3 => \sig_adjusted_addr_incr_ireg2_reg_n_0_[2]\,
      O => \sig_xfer_end_strb_ireg3[10]_i_1_n_0\
    );
\sig_xfer_end_strb_ireg3[11]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"AA01"
    )
        port map (
      I0 => \sig_adjusted_addr_incr_ireg2_reg_n_0_[3]\,
      I1 => \sig_adjusted_addr_incr_ireg2_reg_n_0_[1]\,
      I2 => \sig_adjusted_addr_incr_ireg2_reg_n_0_[0]\,
      I3 => \sig_adjusted_addr_incr_ireg2_reg_n_0_[2]\,
      O => \sig_xfer_end_strb_ireg3[11]_i_1_n_0\
    );
\sig_xfer_end_strb_ireg3[12]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8881"
    )
        port map (
      I0 => \sig_adjusted_addr_incr_ireg2_reg_n_0_[3]\,
      I1 => \sig_adjusted_addr_incr_ireg2_reg_n_0_[2]\,
      I2 => \sig_adjusted_addr_incr_ireg2_reg_n_0_[0]\,
      I3 => \sig_adjusted_addr_incr_ireg2_reg_n_0_[1]\,
      O => \sig_xfer_end_strb_ireg3[12]_i_1_n_0\
    );
\sig_xfer_end_strb_ireg3[13]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8801"
    )
        port map (
      I0 => \sig_adjusted_addr_incr_ireg2_reg_n_0_[3]\,
      I1 => \sig_adjusted_addr_incr_ireg2_reg_n_0_[1]\,
      I2 => \sig_adjusted_addr_incr_ireg2_reg_n_0_[0]\,
      I3 => \sig_adjusted_addr_incr_ireg2_reg_n_0_[2]\,
      O => \sig_xfer_end_strb_ireg3[13]_i_1_n_0\
    );
\sig_xfer_end_strb_ireg3[14]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8001"
    )
        port map (
      I0 => \sig_adjusted_addr_incr_ireg2_reg_n_0_[3]\,
      I1 => \sig_adjusted_addr_incr_ireg2_reg_n_0_[1]\,
      I2 => \sig_adjusted_addr_incr_ireg2_reg_n_0_[0]\,
      I3 => \sig_adjusted_addr_incr_ireg2_reg_n_0_[2]\,
      O => \sig_xfer_end_strb_ireg3[14]_i_1_n_0\
    );
\sig_xfer_end_strb_ireg3[15]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => \sig_adjusted_addr_incr_ireg2_reg_n_0_[3]\,
      I1 => \sig_adjusted_addr_incr_ireg2_reg_n_0_[1]\,
      I2 => \sig_adjusted_addr_incr_ireg2_reg_n_0_[0]\,
      I3 => \sig_adjusted_addr_incr_ireg2_reg_n_0_[2]\,
      O => \sig_xfer_end_strb_ireg3[15]_i_1_n_0\
    );
\sig_xfer_end_strb_ireg3[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFEF"
    )
        port map (
      I0 => \sig_adjusted_addr_incr_ireg2_reg_n_0_[3]\,
      I1 => \sig_adjusted_addr_incr_ireg2_reg_n_0_[1]\,
      I2 => \sig_adjusted_addr_incr_ireg2_reg_n_0_[0]\,
      I3 => \sig_adjusted_addr_incr_ireg2_reg_n_0_[2]\,
      O => \sig_xfer_end_strb_ireg3[1]_i_1_n_0\
    );
\sig_xfer_end_strb_ireg3[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFEB"
    )
        port map (
      I0 => \sig_adjusted_addr_incr_ireg2_reg_n_0_[3]\,
      I1 => \sig_adjusted_addr_incr_ireg2_reg_n_0_[1]\,
      I2 => \sig_adjusted_addr_incr_ireg2_reg_n_0_[0]\,
      I3 => \sig_adjusted_addr_incr_ireg2_reg_n_0_[2]\,
      O => \sig_xfer_end_strb_ireg3[2]_i_1_n_0\
    );
\sig_xfer_end_strb_ireg3[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFAB"
    )
        port map (
      I0 => \sig_adjusted_addr_incr_ireg2_reg_n_0_[3]\,
      I1 => \sig_adjusted_addr_incr_ireg2_reg_n_0_[1]\,
      I2 => \sig_adjusted_addr_incr_ireg2_reg_n_0_[0]\,
      I3 => \sig_adjusted_addr_incr_ireg2_reg_n_0_[2]\,
      O => \sig_xfer_end_strb_ireg3[3]_i_1_n_0\
    );
\sig_xfer_end_strb_ireg3[4]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"EEEB"
    )
        port map (
      I0 => \sig_adjusted_addr_incr_ireg2_reg_n_0_[3]\,
      I1 => \sig_adjusted_addr_incr_ireg2_reg_n_0_[2]\,
      I2 => \sig_adjusted_addr_incr_ireg2_reg_n_0_[0]\,
      I3 => \sig_adjusted_addr_incr_ireg2_reg_n_0_[1]\,
      O => \sig_xfer_end_strb_ireg3[4]_i_1_n_0\
    );
\sig_xfer_end_strb_ireg3[5]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"EEAB"
    )
        port map (
      I0 => \sig_adjusted_addr_incr_ireg2_reg_n_0_[3]\,
      I1 => \sig_adjusted_addr_incr_ireg2_reg_n_0_[1]\,
      I2 => \sig_adjusted_addr_incr_ireg2_reg_n_0_[0]\,
      I3 => \sig_adjusted_addr_incr_ireg2_reg_n_0_[2]\,
      O => \sig_xfer_end_strb_ireg3[5]_i_1_n_0\
    );
\sig_xfer_end_strb_ireg3[6]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"EAAB"
    )
        port map (
      I0 => \sig_adjusted_addr_incr_ireg2_reg_n_0_[3]\,
      I1 => \sig_adjusted_addr_incr_ireg2_reg_n_0_[1]\,
      I2 => \sig_adjusted_addr_incr_ireg2_reg_n_0_[0]\,
      I3 => \sig_adjusted_addr_incr_ireg2_reg_n_0_[2]\,
      O => \sig_xfer_end_strb_ireg3[6]_i_1_n_0\
    );
\sig_xfer_end_strb_ireg3[7]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"AAAB"
    )
        port map (
      I0 => \sig_adjusted_addr_incr_ireg2_reg_n_0_[3]\,
      I1 => \sig_adjusted_addr_incr_ireg2_reg_n_0_[1]\,
      I2 => \sig_adjusted_addr_incr_ireg2_reg_n_0_[0]\,
      I3 => \sig_adjusted_addr_incr_ireg2_reg_n_0_[2]\,
      O => \sig_xfer_end_strb_ireg3[7]_i_1_n_0\
    );
\sig_xfer_end_strb_ireg3[9]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"AA89"
    )
        port map (
      I0 => \sig_adjusted_addr_incr_ireg2_reg_n_0_[3]\,
      I1 => \sig_adjusted_addr_incr_ireg2_reg_n_0_[1]\,
      I2 => \sig_adjusted_addr_incr_ireg2_reg_n_0_[0]\,
      I3 => \sig_adjusted_addr_incr_ireg2_reg_n_0_[2]\,
      O => \sig_xfer_end_strb_ireg3[9]_i_1_n_0\
    );
\sig_xfer_end_strb_ireg3_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_sm_ld_calc3_reg,
      D => '1',
      Q => sig_xfer_end_strb_ireg3(0),
      R => \^sig_init_reg\
    );
\sig_xfer_end_strb_ireg3_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_sm_ld_calc3_reg,
      D => \sig_xfer_end_strb_ireg3[10]_i_1_n_0\,
      Q => sig_xfer_end_strb_ireg3(10),
      R => \^sig_init_reg\
    );
\sig_xfer_end_strb_ireg3_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_sm_ld_calc3_reg,
      D => \sig_xfer_end_strb_ireg3[11]_i_1_n_0\,
      Q => sig_xfer_end_strb_ireg3(11),
      R => \^sig_init_reg\
    );
\sig_xfer_end_strb_ireg3_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_sm_ld_calc3_reg,
      D => \sig_xfer_end_strb_ireg3[12]_i_1_n_0\,
      Q => sig_xfer_end_strb_ireg3(12),
      R => \^sig_init_reg\
    );
\sig_xfer_end_strb_ireg3_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_sm_ld_calc3_reg,
      D => \sig_xfer_end_strb_ireg3[13]_i_1_n_0\,
      Q => sig_xfer_end_strb_ireg3(13),
      R => \^sig_init_reg\
    );
\sig_xfer_end_strb_ireg3_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_sm_ld_calc3_reg,
      D => \sig_xfer_end_strb_ireg3[14]_i_1_n_0\,
      Q => sig_xfer_end_strb_ireg3(14),
      R => \^sig_init_reg\
    );
\sig_xfer_end_strb_ireg3_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_sm_ld_calc3_reg,
      D => \sig_xfer_end_strb_ireg3[15]_i_1_n_0\,
      Q => sig_xfer_end_strb_ireg3(15),
      R => \^sig_init_reg\
    );
\sig_xfer_end_strb_ireg3_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_sm_ld_calc3_reg,
      D => \sig_xfer_end_strb_ireg3[1]_i_1_n_0\,
      Q => sig_xfer_end_strb_ireg3(1),
      R => \^sig_init_reg\
    );
\sig_xfer_end_strb_ireg3_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_sm_ld_calc3_reg,
      D => \sig_xfer_end_strb_ireg3[2]_i_1_n_0\,
      Q => sig_xfer_end_strb_ireg3(2),
      R => \^sig_init_reg\
    );
\sig_xfer_end_strb_ireg3_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_sm_ld_calc3_reg,
      D => \sig_xfer_end_strb_ireg3[3]_i_1_n_0\,
      Q => sig_xfer_end_strb_ireg3(3),
      R => \^sig_init_reg\
    );
\sig_xfer_end_strb_ireg3_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_sm_ld_calc3_reg,
      D => \sig_xfer_end_strb_ireg3[4]_i_1_n_0\,
      Q => sig_xfer_end_strb_ireg3(4),
      R => \^sig_init_reg\
    );
\sig_xfer_end_strb_ireg3_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_sm_ld_calc3_reg,
      D => \sig_xfer_end_strb_ireg3[5]_i_1_n_0\,
      Q => sig_xfer_end_strb_ireg3(5),
      R => \^sig_init_reg\
    );
\sig_xfer_end_strb_ireg3_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_sm_ld_calc3_reg,
      D => \sig_xfer_end_strb_ireg3[6]_i_1_n_0\,
      Q => sig_xfer_end_strb_ireg3(6),
      R => \^sig_init_reg\
    );
\sig_xfer_end_strb_ireg3_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_sm_ld_calc3_reg,
      D => \sig_xfer_end_strb_ireg3[7]_i_1_n_0\,
      Q => sig_xfer_end_strb_ireg3(7),
      R => \^sig_init_reg\
    );
\sig_xfer_end_strb_ireg3_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_sm_ld_calc3_reg,
      D => sel0(3),
      Q => sig_xfer_end_strb_ireg3(8),
      R => \^sig_init_reg\
    );
\sig_xfer_end_strb_ireg3_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_sm_ld_calc3_reg,
      D => \sig_xfer_end_strb_ireg3[9]_i_1_n_0\,
      Q => sig_xfer_end_strb_ireg3(9),
      R => \^sig_init_reg\
    );
sig_xfer_len_eq_0_ireg3_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"1111111111111114"
    )
        port map (
      I0 => \sig_adjusted_addr_incr_ireg2_reg_n_0_[5]\,
      I1 => \sig_adjusted_addr_incr_ireg2_reg_n_0_[4]\,
      I2 => \sig_adjusted_addr_incr_ireg2_reg_n_0_[2]\,
      I3 => \sig_adjusted_addr_incr_ireg2_reg_n_0_[0]\,
      I4 => \sig_adjusted_addr_incr_ireg2_reg_n_0_[1]\,
      I5 => \sig_adjusted_addr_incr_ireg2_reg_n_0_[3]\,
      O => sig_xfer_len_eq_0_ireg3_i_1_n_0
    );
sig_xfer_len_eq_0_ireg3_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_sm_ld_calc3_reg,
      D => sig_xfer_len_eq_0_ireg3_i_1_n_0,
      Q => sig_xfer_len_eq_0_ireg3,
      R => \^sig_init_reg\
    );
sig_xfer_reg_empty_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"AEFE"
    )
        port map (
      I0 => \^sig_init_reg\,
      I1 => \sig_addr_cntr_lsh_im0_reg[0]_0\,
      I2 => sig_xfer_reg_empty,
      I3 => sig_ld_xfer_reg,
      O => sig_xfer_reg_empty_i_1_n_0
    );
sig_xfer_reg_empty_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => '1',
      D => sig_xfer_reg_empty_i_1_n_0,
      Q => sig_xfer_reg_empty,
      R => '0'
    );
\sig_xfer_strt_strb_ireg3[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => sig_strbgen_addr_ireg2(2),
      I1 => sig_strbgen_addr_ireg2(1),
      I2 => sig_strbgen_addr_ireg2(0),
      I3 => sig_strbgen_addr_ireg2(3),
      O => \sig_xfer_strt_strb_ireg3[0]_i_1_n_0\
    );
\sig_xfer_strt_strb_ireg3[10]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"DDD00000"
    )
        port map (
      I0 => sig_strbgen_addr_ireg2(3),
      I1 => \sig_xfer_strt_strb_ireg3[10]_i_2_n_0\,
      I2 => \I_STRT_STRB_GEN/sig_end_offset_un\(2),
      I3 => \I_STRT_STRB_GEN/sig_end_offset_un\(1),
      I4 => \I_STRT_STRB_GEN/sig_end_offset_un\(3),
      O => sig_xfer_strt_strb_im2(10)
    );
\sig_xfer_strt_strb_ireg3[10]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"07"
    )
        port map (
      I0 => sig_strbgen_addr_ireg2(0),
      I1 => sig_strbgen_addr_ireg2(1),
      I2 => sig_strbgen_addr_ireg2(2),
      O => \sig_xfer_strt_strb_ireg3[10]_i_2_n_0\
    );
\sig_xfer_strt_strb_ireg3[11]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7770707000000000"
    )
        port map (
      I0 => sig_strbgen_addr_ireg2(2),
      I1 => sig_strbgen_addr_ireg2(3),
      I2 => \I_STRT_STRB_GEN/sig_end_offset_un\(2),
      I3 => \I_STRT_STRB_GEN/sig_end_offset_un\(1),
      I4 => \I_STRT_STRB_GEN/sig_end_offset_un\(0),
      I5 => \I_STRT_STRB_GEN/sig_end_offset_un\(3),
      O => sig_xfer_strt_strb_im2(11)
    );
\sig_xfer_strt_strb_ireg3[12]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"57FF000000000000"
    )
        port map (
      I0 => sig_strbgen_addr_ireg2(3),
      I1 => sig_strbgen_addr_ireg2(0),
      I2 => sig_strbgen_addr_ireg2(1),
      I3 => sig_strbgen_addr_ireg2(2),
      I4 => \I_STRT_STRB_GEN/sig_end_offset_un\(3),
      I5 => \I_STRT_STRB_GEN/sig_end_offset_un\(2),
      O => \sig_xfer_strt_strb_ireg3[12]_i_1_n_0\
    );
\sig_xfer_strt_strb_ireg3[13]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"D000D000D0000000"
    )
        port map (
      I0 => sig_strbgen_addr_ireg2(3),
      I1 => \sig_xfer_strt_strb_ireg3[13]_i_2_n_0\,
      I2 => \I_STRT_STRB_GEN/sig_end_offset_un\(2),
      I3 => \I_STRT_STRB_GEN/sig_end_offset_un\(3),
      I4 => \I_STRT_STRB_GEN/sig_end_offset_un\(1),
      I5 => \I_STRT_STRB_GEN/sig_end_offset_un\(0),
      O => sig_xfer_strt_strb_im2(13)
    );
\sig_xfer_strt_strb_ireg3[13]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => sig_strbgen_addr_ireg2(2),
      I1 => sig_strbgen_addr_ireg2(1),
      O => \sig_xfer_strt_strb_ireg3[13]_i_2_n_0\
    );
\sig_xfer_strt_strb_ireg3[14]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"D0000000"
    )
        port map (
      I0 => sig_strbgen_addr_ireg2(3),
      I1 => \sig_xfer_strt_strb_ireg3[14]_i_2_n_0\,
      I2 => \I_STRT_STRB_GEN/sig_end_offset_un\(3),
      I3 => \I_STRT_STRB_GEN/sig_end_offset_un\(1),
      I4 => \I_STRT_STRB_GEN/sig_end_offset_un\(2),
      O => sig_xfer_strt_strb_im2(14)
    );
\sig_xfer_strt_strb_ireg3[14]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"7F"
    )
        port map (
      I0 => sig_strbgen_addr_ireg2(0),
      I1 => sig_strbgen_addr_ireg2(1),
      I2 => sig_strbgen_addr_ireg2(2),
      O => \sig_xfer_strt_strb_ireg3[14]_i_2_n_0\
    );
\sig_xfer_strt_strb_ireg3[15]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => \I_STRT_STRB_GEN/sig_end_offset_un\(1),
      I1 => \I_STRT_STRB_GEN/sig_end_offset_un\(0),
      I2 => \I_STRT_STRB_GEN/sig_end_offset_un\(3),
      I3 => \I_STRT_STRB_GEN/sig_end_offset_un\(2),
      O => \sig_xfer_strt_strb_ireg3[15]_i_1_n_0\
    );
\sig_xfer_strt_strb_ireg3[15]_i_10\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0001FFFF"
    )
        port map (
      I0 => \sig_strbgen_bytes_ireg2_reg_n_0_[3]\,
      I1 => \sig_strbgen_bytes_ireg2_reg_n_0_[1]\,
      I2 => \sig_strbgen_bytes_ireg2_reg_n_0_[0]\,
      I3 => \sig_strbgen_bytes_ireg2_reg_n_0_[2]\,
      I4 => \sig_strbgen_bytes_ireg2_reg_n_0_[4]\,
      O => \sig_xfer_strt_strb_ireg3[15]_i_10_n_0\
    );
\sig_xfer_strt_strb_ireg3[15]_i_11\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0011FFEF"
    )
        port map (
      I0 => \sig_strbgen_bytes_ireg2_reg_n_0_[2]\,
      I1 => \sig_strbgen_bytes_ireg2_reg_n_0_[0]\,
      I2 => \sig_strbgen_bytes_ireg2_reg_n_0_[4]\,
      I3 => \sig_strbgen_bytes_ireg2_reg_n_0_[1]\,
      I4 => \sig_strbgen_bytes_ireg2_reg_n_0_[3]\,
      O => \sig_xfer_strt_strb_ireg3[15]_i_11_n_0\
    );
\sig_xfer_strt_strb_ireg3[15]_i_12\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0505FAFB"
    )
        port map (
      I0 => \sig_strbgen_bytes_ireg2_reg_n_0_[1]\,
      I1 => \sig_strbgen_bytes_ireg2_reg_n_0_[4]\,
      I2 => \sig_strbgen_bytes_ireg2_reg_n_0_[0]\,
      I3 => \sig_strbgen_bytes_ireg2_reg_n_0_[3]\,
      I4 => \sig_strbgen_bytes_ireg2_reg_n_0_[2]\,
      O => \sig_xfer_strt_strb_ireg3[15]_i_12_n_0\
    );
\sig_xfer_strt_strb_ireg3[15]_i_13\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BE189A00"
    )
        port map (
      I0 => \sig_strbgen_bytes_ireg2_reg_n_0_[1]\,
      I1 => \sig_strbgen_bytes_ireg2_reg_n_0_[0]\,
      I2 => \I_STRT_STRB_GEN/GEN_OFF_LEN_CASE.lsig_length_adjust_us__3\(0),
      I3 => sig_strbgen_addr_ireg2(1),
      I4 => sig_strbgen_addr_ireg2(0),
      O => \sig_xfer_strt_strb_ireg3[15]_i_13_n_0\
    );
\sig_xfer_strt_strb_ireg3[15]_i_14\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F0F0F0F1"
    )
        port map (
      I0 => \sig_strbgen_bytes_ireg2_reg_n_0_[2]\,
      I1 => \sig_strbgen_bytes_ireg2_reg_n_0_[4]\,
      I2 => \sig_strbgen_bytes_ireg2_reg_n_0_[0]\,
      I3 => \sig_strbgen_bytes_ireg2_reg_n_0_[1]\,
      I4 => \sig_strbgen_bytes_ireg2_reg_n_0_[3]\,
      O => \sig_xfer_strt_strb_ireg3[15]_i_14_n_0\
    );
\sig_xfer_strt_strb_ireg3[15]_i_15\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00AA00AA00AA00A8"
    )
        port map (
      I0 => sig_strbgen_addr_ireg2(0),
      I1 => \sig_strbgen_bytes_ireg2_reg_n_0_[3]\,
      I2 => \sig_strbgen_bytes_ireg2_reg_n_0_[1]\,
      I3 => \sig_strbgen_bytes_ireg2_reg_n_0_[0]\,
      I4 => \sig_strbgen_bytes_ireg2_reg_n_0_[4]\,
      I5 => \sig_strbgen_bytes_ireg2_reg_n_0_[2]\,
      O => \sig_xfer_strt_strb_ireg3[15]_i_15_n_0\
    );
\sig_xfer_strt_strb_ireg3[15]_i_16\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => \sig_strbgen_bytes_ireg2_reg_n_0_[3]\,
      I1 => \sig_strbgen_bytes_ireg2_reg_n_0_[1]\,
      I2 => \sig_strbgen_bytes_ireg2_reg_n_0_[0]\,
      I3 => \sig_strbgen_bytes_ireg2_reg_n_0_[4]\,
      I4 => \sig_strbgen_bytes_ireg2_reg_n_0_[2]\,
      O => \I_STRT_STRB_GEN/GEN_OFF_LEN_CASE.lsig_length_adjust_us__3\(0)
    );
\sig_xfer_strt_strb_ireg3[15]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF1E7878E1"
    )
        port map (
      I0 => \sig_strbgen_bytes_ireg2_reg_n_0_[3]\,
      I1 => \sig_xfer_strt_strb_ireg3[15]_i_6_n_0\,
      I2 => \sig_strbgen_bytes_ireg2_reg_n_0_[4]\,
      I3 => sig_strbgen_addr_ireg2(3),
      I4 => \sig_xfer_strt_strb_ireg3[15]_i_7_n_0\,
      I5 => \I_STRT_STRB_GEN/GEN_OFF_LEN_CASE.lsig_end_addr_us__37\(1),
      O => \I_STRT_STRB_GEN/sig_end_offset_un\(1)
    );
\sig_xfer_strt_strb_ireg3[15]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF1E7878E1"
    )
        port map (
      I0 => \sig_strbgen_bytes_ireg2_reg_n_0_[3]\,
      I1 => \sig_xfer_strt_strb_ireg3[15]_i_6_n_0\,
      I2 => \sig_strbgen_bytes_ireg2_reg_n_0_[4]\,
      I3 => sig_strbgen_addr_ireg2(3),
      I4 => \sig_xfer_strt_strb_ireg3[15]_i_7_n_0\,
      I5 => \sig_xfer_strt_strb_ireg3[15]_i_9_n_0\,
      O => \I_STRT_STRB_GEN/sig_end_offset_un\(0)
    );
\sig_xfer_strt_strb_ireg3[15]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"D77E7EEB"
    )
        port map (
      I0 => \sig_strbgen_bytes_ireg2_reg_n_0_[4]\,
      I1 => sig_strbgen_addr_ireg2(3),
      I2 => \sig_strbgen_bytes_ireg2_reg_n_0_[3]\,
      I3 => \sig_xfer_strt_strb_ireg3[15]_i_6_n_0\,
      I4 => \sig_xfer_strt_strb_ireg3[15]_i_7_n_0\,
      O => \I_STRT_STRB_GEN/sig_end_offset_un\(3)
    );
\sig_xfer_strt_strb_ireg3[15]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A6FFFFA6FF65A6FF"
    )
        port map (
      I0 => \sig_xfer_strt_strb_ireg3[15]_i_10_n_0\,
      I1 => \sig_xfer_strt_strb_ireg3[15]_i_11_n_0\,
      I2 => sig_strbgen_addr_ireg2(3),
      I3 => sig_strbgen_addr_ireg2(2),
      I4 => \sig_xfer_strt_strb_ireg3[15]_i_12_n_0\,
      I5 => \sig_xfer_strt_strb_ireg3[15]_i_13_n_0\,
      O => \I_STRT_STRB_GEN/sig_end_offset_un\(2)
    );
\sig_xfer_strt_strb_ireg3[15]_i_6\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFAFB"
    )
        port map (
      I0 => \sig_strbgen_bytes_ireg2_reg_n_0_[1]\,
      I1 => \sig_strbgen_bytes_ireg2_reg_n_0_[4]\,
      I2 => \sig_strbgen_bytes_ireg2_reg_n_0_[0]\,
      I3 => \sig_strbgen_bytes_ireg2_reg_n_0_[3]\,
      I4 => \sig_strbgen_bytes_ireg2_reg_n_0_[2]\,
      O => \sig_xfer_strt_strb_ireg3[15]_i_6_n_0\
    );
\sig_xfer_strt_strb_ireg3[15]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFA9EB81EB81A900"
    )
        port map (
      I0 => \sig_strbgen_bytes_ireg2_reg_n_0_[2]\,
      I1 => \sig_xfer_strt_strb_ireg3[15]_i_14_n_0\,
      I2 => \sig_strbgen_bytes_ireg2_reg_n_0_[1]\,
      I3 => sig_strbgen_addr_ireg2(2),
      I4 => \sig_xfer_strt_strb_ireg3[15]_i_15_n_0\,
      I5 => sig_strbgen_addr_ireg2(1),
      O => \sig_xfer_strt_strb_ireg3[15]_i_7_n_0\
    );
\sig_xfer_strt_strb_ireg3[15]_i_8\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"24DBDB24"
    )
        port map (
      I0 => sig_strbgen_addr_ireg2(0),
      I1 => \I_STRT_STRB_GEN/GEN_OFF_LEN_CASE.lsig_length_adjust_us__3\(0),
      I2 => \sig_strbgen_bytes_ireg2_reg_n_0_[0]\,
      I3 => \sig_strbgen_bytes_ireg2_reg_n_0_[1]\,
      I4 => sig_strbgen_addr_ireg2(1),
      O => \I_STRT_STRB_GEN/GEN_OFF_LEN_CASE.lsig_end_addr_us__37\(1)
    );
\sig_xfer_strt_strb_ireg3[15]_i_9\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AA55AA55AA55AA56"
    )
        port map (
      I0 => sig_strbgen_addr_ireg2(0),
      I1 => \sig_strbgen_bytes_ireg2_reg_n_0_[3]\,
      I2 => \sig_strbgen_bytes_ireg2_reg_n_0_[1]\,
      I3 => \sig_strbgen_bytes_ireg2_reg_n_0_[0]\,
      I4 => \sig_strbgen_bytes_ireg2_reg_n_0_[4]\,
      I5 => \sig_strbgen_bytes_ireg2_reg_n_0_[2]\,
      O => \sig_xfer_strt_strb_ireg3[15]_i_9_n_0\
    );
\sig_xfer_strt_strb_ireg3[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4444444444444440"
    )
        port map (
      I0 => sig_strbgen_addr_ireg2(3),
      I1 => \sig_xfer_strt_strb_ireg3[9]_i_2_n_0\,
      I2 => \I_STRT_STRB_GEN/sig_end_offset_un\(2),
      I3 => \I_STRT_STRB_GEN/sig_end_offset_un\(0),
      I4 => \I_STRT_STRB_GEN/sig_end_offset_un\(1),
      I5 => \I_STRT_STRB_GEN/sig_end_offset_un\(3),
      O => sig_xfer_strt_strb_im2(1)
    );
\sig_xfer_strt_strb_ireg3[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"44444440"
    )
        port map (
      I0 => sig_strbgen_addr_ireg2(3),
      I1 => \sig_xfer_strt_strb_ireg3[10]_i_2_n_0\,
      I2 => \I_STRT_STRB_GEN/sig_end_offset_un\(2),
      I3 => \I_STRT_STRB_GEN/sig_end_offset_un\(1),
      I4 => \I_STRT_STRB_GEN/sig_end_offset_un\(3),
      O => sig_xfer_strt_strb_im2(2)
    );
\sig_xfer_strt_strb_ireg3[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"1111111111101010"
    )
        port map (
      I0 => sig_strbgen_addr_ireg2(2),
      I1 => sig_strbgen_addr_ireg2(3),
      I2 => \I_STRT_STRB_GEN/sig_end_offset_un\(2),
      I3 => \I_STRT_STRB_GEN/sig_end_offset_un\(1),
      I4 => \I_STRT_STRB_GEN/sig_end_offset_un\(0),
      I5 => \I_STRT_STRB_GEN/sig_end_offset_un\(3),
      O => sig_xfer_strt_strb_im2(3)
    );
\sig_xfer_strt_strb_ireg3[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0155015501550000"
    )
        port map (
      I0 => sig_strbgen_addr_ireg2(3),
      I1 => sig_strbgen_addr_ireg2(0),
      I2 => sig_strbgen_addr_ireg2(1),
      I3 => sig_strbgen_addr_ireg2(2),
      I4 => \I_STRT_STRB_GEN/sig_end_offset_un\(2),
      I5 => \I_STRT_STRB_GEN/sig_end_offset_un\(3),
      O => sig_xfer_strt_strb_im2(4)
    );
\sig_xfer_strt_strb_ireg3[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4444444044004400"
    )
        port map (
      I0 => sig_strbgen_addr_ireg2(3),
      I1 => \sig_xfer_strt_strb_ireg3[13]_i_2_n_0\,
      I2 => \I_STRT_STRB_GEN/sig_end_offset_un\(0),
      I3 => \I_STRT_STRB_GEN/sig_end_offset_un\(3),
      I4 => \I_STRT_STRB_GEN/sig_end_offset_un\(1),
      I5 => \I_STRT_STRB_GEN/sig_end_offset_un\(2),
      O => sig_xfer_strt_strb_im2(5)
    );
\sig_xfer_strt_strb_ireg3[6]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"44444000"
    )
        port map (
      I0 => sig_strbgen_addr_ireg2(3),
      I1 => \sig_xfer_strt_strb_ireg3[14]_i_2_n_0\,
      I2 => \I_STRT_STRB_GEN/sig_end_offset_un\(1),
      I3 => \I_STRT_STRB_GEN/sig_end_offset_un\(2),
      I4 => \I_STRT_STRB_GEN/sig_end_offset_un\(3),
      O => sig_xfer_strt_strb_im2(6)
    );
\sig_xfer_strt_strb_ireg3[7]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000FF80"
    )
        port map (
      I0 => \I_STRT_STRB_GEN/sig_end_offset_un\(1),
      I1 => \I_STRT_STRB_GEN/sig_end_offset_un\(0),
      I2 => \I_STRT_STRB_GEN/sig_end_offset_un\(2),
      I3 => \I_STRT_STRB_GEN/sig_end_offset_un\(3),
      I4 => sig_strbgen_addr_ireg2(3),
      O => \sig_xfer_strt_strb_ireg3[7]_i_1_n_0\
    );
\sig_xfer_strt_strb_ireg3[8]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"55570000"
    )
        port map (
      I0 => sig_strbgen_addr_ireg2(3),
      I1 => sig_strbgen_addr_ireg2(0),
      I2 => sig_strbgen_addr_ireg2(1),
      I3 => sig_strbgen_addr_ireg2(2),
      I4 => \I_STRT_STRB_GEN/sig_end_offset_un\(3),
      O => sig_xfer_strt_strb_im2(8)
    );
\sig_xfer_strt_strb_ireg3[9]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"DDDDDDD000000000"
    )
        port map (
      I0 => sig_strbgen_addr_ireg2(3),
      I1 => \sig_xfer_strt_strb_ireg3[9]_i_2_n_0\,
      I2 => \I_STRT_STRB_GEN/sig_end_offset_un\(2),
      I3 => \I_STRT_STRB_GEN/sig_end_offset_un\(0),
      I4 => \I_STRT_STRB_GEN/sig_end_offset_un\(1),
      I5 => \I_STRT_STRB_GEN/sig_end_offset_un\(3),
      O => sig_xfer_strt_strb_im2(9)
    );
\sig_xfer_strt_strb_ireg3[9]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => sig_strbgen_addr_ireg2(2),
      I1 => sig_strbgen_addr_ireg2(1),
      O => \sig_xfer_strt_strb_ireg3[9]_i_2_n_0\
    );
\sig_xfer_strt_strb_ireg3_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_sm_ld_calc3_reg,
      D => \sig_xfer_strt_strb_ireg3[0]_i_1_n_0\,
      Q => sig_xfer_strt_strb_ireg3(0),
      R => \^sig_init_reg\
    );
\sig_xfer_strt_strb_ireg3_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_sm_ld_calc3_reg,
      D => sig_xfer_strt_strb_im2(10),
      Q => sig_xfer_strt_strb_ireg3(10),
      R => \^sig_init_reg\
    );
\sig_xfer_strt_strb_ireg3_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_sm_ld_calc3_reg,
      D => sig_xfer_strt_strb_im2(11),
      Q => sig_xfer_strt_strb_ireg3(11),
      R => \^sig_init_reg\
    );
\sig_xfer_strt_strb_ireg3_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_sm_ld_calc3_reg,
      D => \sig_xfer_strt_strb_ireg3[12]_i_1_n_0\,
      Q => sig_xfer_strt_strb_ireg3(12),
      R => \^sig_init_reg\
    );
\sig_xfer_strt_strb_ireg3_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_sm_ld_calc3_reg,
      D => sig_xfer_strt_strb_im2(13),
      Q => sig_xfer_strt_strb_ireg3(13),
      R => \^sig_init_reg\
    );
\sig_xfer_strt_strb_ireg3_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_sm_ld_calc3_reg,
      D => sig_xfer_strt_strb_im2(14),
      Q => sig_xfer_strt_strb_ireg3(14),
      R => \^sig_init_reg\
    );
\sig_xfer_strt_strb_ireg3_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_sm_ld_calc3_reg,
      D => \sig_xfer_strt_strb_ireg3[15]_i_1_n_0\,
      Q => sig_xfer_strt_strb_ireg3(15),
      R => \^sig_init_reg\
    );
\sig_xfer_strt_strb_ireg3_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_sm_ld_calc3_reg,
      D => sig_xfer_strt_strb_im2(1),
      Q => sig_xfer_strt_strb_ireg3(1),
      R => \^sig_init_reg\
    );
\sig_xfer_strt_strb_ireg3_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_sm_ld_calc3_reg,
      D => sig_xfer_strt_strb_im2(2),
      Q => sig_xfer_strt_strb_ireg3(2),
      R => \^sig_init_reg\
    );
\sig_xfer_strt_strb_ireg3_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_sm_ld_calc3_reg,
      D => sig_xfer_strt_strb_im2(3),
      Q => sig_xfer_strt_strb_ireg3(3),
      R => \^sig_init_reg\
    );
\sig_xfer_strt_strb_ireg3_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_sm_ld_calc3_reg,
      D => sig_xfer_strt_strb_im2(4),
      Q => sig_xfer_strt_strb_ireg3(4),
      R => \^sig_init_reg\
    );
\sig_xfer_strt_strb_ireg3_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_sm_ld_calc3_reg,
      D => sig_xfer_strt_strb_im2(5),
      Q => sig_xfer_strt_strb_ireg3(5),
      R => \^sig_init_reg\
    );
\sig_xfer_strt_strb_ireg3_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_sm_ld_calc3_reg,
      D => sig_xfer_strt_strb_im2(6),
      Q => sig_xfer_strt_strb_ireg3(6),
      R => \^sig_init_reg\
    );
\sig_xfer_strt_strb_ireg3_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_sm_ld_calc3_reg,
      D => \sig_xfer_strt_strb_ireg3[7]_i_1_n_0\,
      Q => sig_xfer_strt_strb_ireg3(7),
      R => \^sig_init_reg\
    );
\sig_xfer_strt_strb_ireg3_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_sm_ld_calc3_reg,
      D => sig_xfer_strt_strb_im2(8),
      Q => sig_xfer_strt_strb_ireg3(8),
      R => \^sig_init_reg\
    );
\sig_xfer_strt_strb_ireg3_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_sm_ld_calc3_reg,
      D => sig_xfer_strt_strb_im2(9),
      Q => sig_xfer_strt_strb_ireg3(9),
      R => \^sig_init_reg\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_datamover_rd_status_cntl is
  port (
    sig_rd_sts_slverr_reg_reg_0 : out STD_LOGIC_VECTOR ( 2 downto 0 );
    sig_rsc2stat_status_valid : out STD_LOGIC;
    sig_rsc2data_ready : out STD_LOGIC;
    sig_rd_sts_interr_reg0 : in STD_LOGIC;
    m_axi_mm2s_aclk : in STD_LOGIC;
    sig_rd_sts_slverr_reg0 : in STD_LOGIC;
    sig_data2rsc_decerr : in STD_LOGIC;
    sig_stat2rsc_status_ready : in STD_LOGIC;
    sig_mmap_rst_reg_n : in STD_LOGIC;
    sig_data2rsc_valid : in STD_LOGIC
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_datamover_rd_status_cntl;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_datamover_rd_status_cntl is
  signal sig_push_rd_sts_reg : STD_LOGIC;
  signal sig_rd_sts_decerr_reg0 : STD_LOGIC;
  signal \^sig_rd_sts_slverr_reg_reg_0\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal sig_rd_sts_tag_reg0 : STD_LOGIC;
  signal \^sig_rsc2data_ready\ : STD_LOGIC;
  signal \^sig_rsc2stat_status_valid\ : STD_LOGIC;
begin
  sig_rd_sts_slverr_reg_reg_0(2 downto 0) <= \^sig_rd_sts_slverr_reg_reg_0\(2 downto 0);
  sig_rsc2data_ready <= \^sig_rsc2data_ready\;
  sig_rsc2stat_status_valid <= \^sig_rsc2stat_status_valid\;
sig_rd_sts_decerr_reg_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \^sig_rd_sts_slverr_reg_reg_0\(1),
      I1 => sig_data2rsc_decerr,
      O => sig_rd_sts_decerr_reg0
    );
sig_rd_sts_decerr_reg_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_push_rd_sts_reg,
      D => sig_rd_sts_decerr_reg0,
      Q => \^sig_rd_sts_slverr_reg_reg_0\(1),
      R => sig_rd_sts_tag_reg0
    );
sig_rd_sts_interr_reg_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"8F"
    )
        port map (
      I0 => \^sig_rsc2stat_status_valid\,
      I1 => sig_stat2rsc_status_ready,
      I2 => sig_mmap_rst_reg_n,
      O => sig_rd_sts_tag_reg0
    );
sig_rd_sts_interr_reg_i_2: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^sig_rsc2data_ready\,
      I1 => sig_data2rsc_valid,
      O => sig_push_rd_sts_reg
    );
sig_rd_sts_interr_reg_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_push_rd_sts_reg,
      D => sig_rd_sts_interr_reg0,
      Q => \^sig_rd_sts_slverr_reg_reg_0\(0),
      R => sig_rd_sts_tag_reg0
    );
sig_rd_sts_reg_empty_reg: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_push_rd_sts_reg,
      D => '0',
      Q => \^sig_rsc2data_ready\,
      S => sig_rd_sts_tag_reg0
    );
sig_rd_sts_reg_full_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_push_rd_sts_reg,
      D => '1',
      Q => \^sig_rsc2stat_status_valid\,
      R => sig_rd_sts_tag_reg0
    );
sig_rd_sts_slverr_reg_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_push_rd_sts_reg,
      D => sig_rd_sts_slverr_reg0,
      Q => \^sig_rd_sts_slverr_reg_reg_0\(2),
      R => sig_rd_sts_tag_reg0
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_datamover_reset is
  port (
    sig_cmd_stat_rst_int_reg_n : out STD_LOGIC;
    sig_rst2all_stop_request : out STD_LOGIC;
    SR : out STD_LOGIC_VECTOR ( 0 to 0 );
    sig_mmap_rst_reg_n : out STD_LOGIC;
    sig_stream_rst_reg_n : out STD_LOGIC;
    sig_mmap_rst_reg_n_reg_0 : out STD_LOGIC;
    sig_mmap_rst_reg_n_reg_1 : out STD_LOGIC;
    SS : out STD_LOGIC_VECTOR ( 0 to 0 );
    sig_stream_rst_reg_n_reg_0 : out STD_LOGIC_VECTOR ( 0 to 0 );
    mm2s_halt_cmplt : out STD_LOGIC;
    \out\ : in STD_LOGIC;
    m_axi_mm2s_aclk : in STD_LOGIC;
    sig_s_h_halt_reg_reg_0 : in STD_LOGIC;
    sig_init_done : in STD_LOGIC;
    sig_init_reg : in STD_LOGIC;
    sig_init_reg2 : in STD_LOGIC;
    sig_init_done_0 : in STD_LOGIC;
    sig_halt_cmplt_reg_0 : in STD_LOGIC;
    sig_data2addr_stop_req : in STD_LOGIC;
    sig_halt_reg_dly3 : in STD_LOGIC;
    sig_addr_reg_empty : in STD_LOGIC;
    sig_addr2rsc_calc_error : in STD_LOGIC
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_datamover_reset;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_datamover_reset is
  signal \^sr\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \^mm2s_halt_cmplt\ : STD_LOGIC;
  signal \^sig_cmd_stat_rst_int_reg_n\ : STD_LOGIC;
  signal sig_cmd_stat_rst_user_reg_n_cdc_from : STD_LOGIC;
  attribute RTL_KEEP : string;
  attribute RTL_KEEP of sig_cmd_stat_rst_user_reg_n_cdc_from : signal is "true";
  signal sig_halt_cmplt_i_2_n_0 : STD_LOGIC;
  signal \^sig_mmap_rst_reg_n\ : STD_LOGIC;
  signal \^sig_stream_rst_reg_n\ : STD_LOGIC;
  attribute equivalent_register_removal : string;
  attribute equivalent_register_removal of sig_cmd_stat_rst_int_reg_n_reg : label is "no";
  attribute KEEP : string;
  attribute KEEP of sig_cmd_stat_rst_user_reg_n_cdc_from_reg : label is "yes";
  attribute equivalent_register_removal of sig_cmd_stat_rst_user_reg_n_cdc_from_reg : label is "no";
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of sig_init_done_i_1 : label is "soft_lutpair125";
  attribute SOFT_HLUTNM of \sig_init_done_i_1__0\ : label is "soft_lutpair125";
  attribute equivalent_register_removal of sig_mmap_rst_reg_n_reg : label is "no";
  attribute equivalent_register_removal of sig_stream_rst_reg_n_reg : label is "no";
begin
  SR(0) <= \^sr\(0);
  mm2s_halt_cmplt <= \^mm2s_halt_cmplt\;
  sig_cmd_stat_rst_int_reg_n <= \^sig_cmd_stat_rst_int_reg_n\;
  sig_mmap_rst_reg_n <= \^sig_mmap_rst_reg_n\;
  sig_stream_rst_reg_n <= \^sig_stream_rst_reg_n\;
\BLK_MEM.I_SYNC_FIFOGEN_FIFO_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^sig_mmap_rst_reg_n\,
      O => SS(0)
    );
sig_cmd_stat_rst_int_reg_n_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => '1',
      D => \out\,
      Q => \^sig_cmd_stat_rst_int_reg_n\,
      R => '0'
    );
sig_cmd_stat_rst_user_reg_n_cdc_from_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => '1',
      D => \out\,
      Q => sig_cmd_stat_rst_user_reg_n_cdc_from,
      R => '0'
    );
sig_halt_cmplt_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^sig_cmd_stat_rst_int_reg_n\,
      O => \^sr\(0)
    );
sig_halt_cmplt_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF80808000"
    )
        port map (
      I0 => sig_halt_cmplt_reg_0,
      I1 => sig_data2addr_stop_req,
      I2 => sig_halt_reg_dly3,
      I3 => sig_addr_reg_empty,
      I4 => sig_addr2rsc_calc_error,
      I5 => \^mm2s_halt_cmplt\,
      O => sig_halt_cmplt_i_2_n_0
    );
sig_halt_cmplt_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => '1',
      D => sig_halt_cmplt_i_2_n_0,
      Q => \^mm2s_halt_cmplt\,
      R => \^sr\(0)
    );
sig_init_done_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2000"
    )
        port map (
      I0 => \^sig_mmap_rst_reg_n\,
      I1 => sig_init_done,
      I2 => sig_init_reg,
      I3 => sig_init_reg2,
      O => sig_mmap_rst_reg_n_reg_0
    );
\sig_init_done_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2000"
    )
        port map (
      I0 => \^sig_mmap_rst_reg_n\,
      I1 => sig_init_done_0,
      I2 => sig_init_reg,
      I3 => sig_init_reg2,
      O => sig_mmap_rst_reg_n_reg_1
    );
sig_mmap_rst_reg_n_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => '1',
      D => \out\,
      Q => \^sig_mmap_rst_reg_n\,
      R => '0'
    );
sig_reset_reg_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^sig_stream_rst_reg_n\,
      O => sig_stream_rst_reg_n_reg_0(0)
    );
sig_s_h_halt_reg_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => '1',
      D => sig_s_h_halt_reg_reg_0,
      Q => sig_rst2all_stop_request,
      R => \^sr\(0)
    );
sig_stream_rst_reg_n_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => '1',
      D => \out\,
      Q => \^sig_stream_rst_reg_n\,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_datamover_skid_buf is
  port (
    \out\ : out STD_LOGIC;
    m_axis_mm2s_tvalid : out STD_LOGIC;
    m_axis_mm2s_tlast : out STD_LOGIC;
    sig_sstrb_stop_mask : out STD_LOGIC_VECTOR ( 0 to 0 );
    sig_s_ready_dup_reg_0 : out STD_LOGIC;
    m_axis_mm2s_tdata : out STD_LOGIC_VECTOR ( 127 downto 0 );
    m_axis_mm2s_tkeep : out STD_LOGIC_VECTOR ( 15 downto 0 );
    SR : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_mm2s_aclk : in STD_LOGIC;
    sig_s_ready_dup_reg_1 : in STD_LOGIC;
    sig_slast_with_stop : in STD_LOGIC;
    \sig_sstrb_stop_mask_reg[15]_0\ : in STD_LOGIC;
    \OMIT_UNPACKING.lsig_cmd_loaded\ : in STD_LOGIC;
    empty : in STD_LOGIC;
    m_axis_mm2s_tready : in STD_LOGIC;
    dout : in STD_LOGIC_VECTOR ( 144 downto 0 );
    sig_stream_rst_reg_n : in STD_LOGIC;
    sig_halt_reg_dly3 : in STD_LOGIC;
    sig_halt_reg_dly2 : in STD_LOGIC
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_datamover_skid_buf;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_datamover_skid_buf is
  signal sig_data_reg_out0 : STD_LOGIC;
  signal sig_data_reg_out_en : STD_LOGIC;
  signal sig_data_skid_mux_out : STD_LOGIC_VECTOR ( 127 downto 0 );
  signal sig_data_skid_reg : STD_LOGIC_VECTOR ( 127 downto 0 );
  signal sig_last_skid_mux_out : STD_LOGIC;
  signal sig_last_skid_reg : STD_LOGIC;
  signal sig_m_valid_dup : STD_LOGIC;
  attribute RTL_KEEP : string;
  attribute RTL_KEEP of sig_m_valid_dup : signal is "true";
  attribute equivalent_register_removal : string;
  attribute equivalent_register_removal of sig_m_valid_dup : signal is "no";
  signal sig_m_valid_dup_i_1_n_0 : STD_LOGIC;
  signal sig_m_valid_dup_i_3_n_0 : STD_LOGIC;
  signal sig_m_valid_out : STD_LOGIC;
  attribute RTL_KEEP of sig_m_valid_out : signal is "true";
  attribute equivalent_register_removal of sig_m_valid_out : signal is "no";
  signal sig_mvalid_stop : STD_LOGIC;
  signal sig_mvalid_stop_reg_i_1_n_0 : STD_LOGIC;
  signal sig_mvalid_stop_set : STD_LOGIC;
  signal sig_reset_reg : STD_LOGIC;
  signal sig_s_ready_dup : STD_LOGIC;
  attribute RTL_KEEP of sig_s_ready_dup : signal is "true";
  attribute equivalent_register_removal of sig_s_ready_dup : signal is "no";
  signal sig_s_ready_out : STD_LOGIC;
  attribute RTL_KEEP of sig_s_ready_out : signal is "true";
  attribute equivalent_register_removal of sig_s_ready_out : signal is "no";
  signal \^sig_sstrb_stop_mask\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal sig_sstrb_with_stop : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal sig_strb_skid_mux_out : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal sig_strb_skid_reg : STD_LOGIC_VECTOR ( 15 downto 0 );
  attribute KEEP : string;
  attribute KEEP of sig_m_valid_dup_reg : label is "yes";
  attribute equivalent_register_removal of sig_m_valid_dup_reg : label is "no";
  attribute KEEP of sig_m_valid_out_reg : label is "yes";
  attribute equivalent_register_removal of sig_m_valid_out_reg : label is "no";
  attribute KEEP of sig_s_ready_dup_reg : label is "yes";
  attribute equivalent_register_removal of sig_s_ready_dup_reg : label is "no";
  attribute KEEP of sig_s_ready_out_reg : label is "yes";
  attribute equivalent_register_removal of sig_s_ready_out_reg : label is "no";
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \sig_strb_skid_reg[0]_i_1\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \sig_strb_skid_reg[10]_i_1\ : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of \sig_strb_skid_reg[11]_i_1\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of \sig_strb_skid_reg[12]_i_1\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \sig_strb_skid_reg[13]_i_1\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \sig_strb_skid_reg[14]_i_1\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \sig_strb_skid_reg[15]_i_1\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \sig_strb_skid_reg[1]_i_1\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \sig_strb_skid_reg[2]_i_1\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \sig_strb_skid_reg[3]_i_1\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \sig_strb_skid_reg[4]_i_1\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \sig_strb_skid_reg[5]_i_1\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \sig_strb_skid_reg[6]_i_1\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \sig_strb_skid_reg[7]_i_1\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \sig_strb_skid_reg[8]_i_1\ : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of \sig_strb_skid_reg[9]_i_1\ : label is "soft_lutpair20";
begin
  m_axis_mm2s_tvalid <= sig_m_valid_out;
  \out\ <= sig_s_ready_out;
  sig_sstrb_stop_mask(0) <= \^sig_sstrb_stop_mask\(0);
\sig_data_reg_out[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dout(0),
      I1 => sig_s_ready_dup,
      I2 => sig_data_skid_reg(0),
      O => sig_data_skid_mux_out(0)
    );
\sig_data_reg_out[100]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dout(100),
      I1 => sig_s_ready_dup,
      I2 => sig_data_skid_reg(100),
      O => sig_data_skid_mux_out(100)
    );
\sig_data_reg_out[101]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dout(101),
      I1 => sig_s_ready_dup,
      I2 => sig_data_skid_reg(101),
      O => sig_data_skid_mux_out(101)
    );
\sig_data_reg_out[102]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dout(102),
      I1 => sig_s_ready_dup,
      I2 => sig_data_skid_reg(102),
      O => sig_data_skid_mux_out(102)
    );
\sig_data_reg_out[103]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dout(103),
      I1 => sig_s_ready_dup,
      I2 => sig_data_skid_reg(103),
      O => sig_data_skid_mux_out(103)
    );
\sig_data_reg_out[104]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dout(104),
      I1 => sig_s_ready_dup,
      I2 => sig_data_skid_reg(104),
      O => sig_data_skid_mux_out(104)
    );
\sig_data_reg_out[105]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dout(105),
      I1 => sig_s_ready_dup,
      I2 => sig_data_skid_reg(105),
      O => sig_data_skid_mux_out(105)
    );
\sig_data_reg_out[106]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dout(106),
      I1 => sig_s_ready_dup,
      I2 => sig_data_skid_reg(106),
      O => sig_data_skid_mux_out(106)
    );
\sig_data_reg_out[107]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dout(107),
      I1 => sig_s_ready_dup,
      I2 => sig_data_skid_reg(107),
      O => sig_data_skid_mux_out(107)
    );
\sig_data_reg_out[108]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dout(108),
      I1 => sig_s_ready_dup,
      I2 => sig_data_skid_reg(108),
      O => sig_data_skid_mux_out(108)
    );
\sig_data_reg_out[109]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dout(109),
      I1 => sig_s_ready_dup,
      I2 => sig_data_skid_reg(109),
      O => sig_data_skid_mux_out(109)
    );
\sig_data_reg_out[10]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dout(10),
      I1 => sig_s_ready_dup,
      I2 => sig_data_skid_reg(10),
      O => sig_data_skid_mux_out(10)
    );
\sig_data_reg_out[110]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dout(110),
      I1 => sig_s_ready_dup,
      I2 => sig_data_skid_reg(110),
      O => sig_data_skid_mux_out(110)
    );
\sig_data_reg_out[111]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dout(111),
      I1 => sig_s_ready_dup,
      I2 => sig_data_skid_reg(111),
      O => sig_data_skid_mux_out(111)
    );
\sig_data_reg_out[112]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dout(112),
      I1 => sig_s_ready_dup,
      I2 => sig_data_skid_reg(112),
      O => sig_data_skid_mux_out(112)
    );
\sig_data_reg_out[113]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dout(113),
      I1 => sig_s_ready_dup,
      I2 => sig_data_skid_reg(113),
      O => sig_data_skid_mux_out(113)
    );
\sig_data_reg_out[114]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dout(114),
      I1 => sig_s_ready_dup,
      I2 => sig_data_skid_reg(114),
      O => sig_data_skid_mux_out(114)
    );
\sig_data_reg_out[115]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dout(115),
      I1 => sig_s_ready_dup,
      I2 => sig_data_skid_reg(115),
      O => sig_data_skid_mux_out(115)
    );
\sig_data_reg_out[116]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dout(116),
      I1 => sig_s_ready_dup,
      I2 => sig_data_skid_reg(116),
      O => sig_data_skid_mux_out(116)
    );
\sig_data_reg_out[117]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dout(117),
      I1 => sig_s_ready_dup,
      I2 => sig_data_skid_reg(117),
      O => sig_data_skid_mux_out(117)
    );
\sig_data_reg_out[118]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dout(118),
      I1 => sig_s_ready_dup,
      I2 => sig_data_skid_reg(118),
      O => sig_data_skid_mux_out(118)
    );
\sig_data_reg_out[119]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dout(119),
      I1 => sig_s_ready_dup,
      I2 => sig_data_skid_reg(119),
      O => sig_data_skid_mux_out(119)
    );
\sig_data_reg_out[11]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dout(11),
      I1 => sig_s_ready_dup,
      I2 => sig_data_skid_reg(11),
      O => sig_data_skid_mux_out(11)
    );
\sig_data_reg_out[120]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dout(120),
      I1 => sig_s_ready_dup,
      I2 => sig_data_skid_reg(120),
      O => sig_data_skid_mux_out(120)
    );
\sig_data_reg_out[121]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dout(121),
      I1 => sig_s_ready_dup,
      I2 => sig_data_skid_reg(121),
      O => sig_data_skid_mux_out(121)
    );
\sig_data_reg_out[122]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dout(122),
      I1 => sig_s_ready_dup,
      I2 => sig_data_skid_reg(122),
      O => sig_data_skid_mux_out(122)
    );
\sig_data_reg_out[123]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dout(123),
      I1 => sig_s_ready_dup,
      I2 => sig_data_skid_reg(123),
      O => sig_data_skid_mux_out(123)
    );
\sig_data_reg_out[124]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dout(124),
      I1 => sig_s_ready_dup,
      I2 => sig_data_skid_reg(124),
      O => sig_data_skid_mux_out(124)
    );
\sig_data_reg_out[125]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dout(125),
      I1 => sig_s_ready_dup,
      I2 => sig_data_skid_reg(125),
      O => sig_data_skid_mux_out(125)
    );
\sig_data_reg_out[126]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dout(126),
      I1 => sig_s_ready_dup,
      I2 => sig_data_skid_reg(126),
      O => sig_data_skid_mux_out(126)
    );
\sig_data_reg_out[127]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => sig_mvalid_stop,
      I1 => sig_stream_rst_reg_n,
      O => sig_data_reg_out0
    );
\sig_data_reg_out[127]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => m_axis_mm2s_tready,
      I1 => sig_m_valid_dup,
      O => sig_data_reg_out_en
    );
\sig_data_reg_out[127]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dout(127),
      I1 => sig_s_ready_dup,
      I2 => sig_data_skid_reg(127),
      O => sig_data_skid_mux_out(127)
    );
\sig_data_reg_out[12]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dout(12),
      I1 => sig_s_ready_dup,
      I2 => sig_data_skid_reg(12),
      O => sig_data_skid_mux_out(12)
    );
\sig_data_reg_out[13]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dout(13),
      I1 => sig_s_ready_dup,
      I2 => sig_data_skid_reg(13),
      O => sig_data_skid_mux_out(13)
    );
\sig_data_reg_out[14]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dout(14),
      I1 => sig_s_ready_dup,
      I2 => sig_data_skid_reg(14),
      O => sig_data_skid_mux_out(14)
    );
\sig_data_reg_out[15]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dout(15),
      I1 => sig_s_ready_dup,
      I2 => sig_data_skid_reg(15),
      O => sig_data_skid_mux_out(15)
    );
\sig_data_reg_out[16]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dout(16),
      I1 => sig_s_ready_dup,
      I2 => sig_data_skid_reg(16),
      O => sig_data_skid_mux_out(16)
    );
\sig_data_reg_out[17]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dout(17),
      I1 => sig_s_ready_dup,
      I2 => sig_data_skid_reg(17),
      O => sig_data_skid_mux_out(17)
    );
\sig_data_reg_out[18]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dout(18),
      I1 => sig_s_ready_dup,
      I2 => sig_data_skid_reg(18),
      O => sig_data_skid_mux_out(18)
    );
\sig_data_reg_out[19]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dout(19),
      I1 => sig_s_ready_dup,
      I2 => sig_data_skid_reg(19),
      O => sig_data_skid_mux_out(19)
    );
\sig_data_reg_out[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dout(1),
      I1 => sig_s_ready_dup,
      I2 => sig_data_skid_reg(1),
      O => sig_data_skid_mux_out(1)
    );
\sig_data_reg_out[20]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dout(20),
      I1 => sig_s_ready_dup,
      I2 => sig_data_skid_reg(20),
      O => sig_data_skid_mux_out(20)
    );
\sig_data_reg_out[21]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dout(21),
      I1 => sig_s_ready_dup,
      I2 => sig_data_skid_reg(21),
      O => sig_data_skid_mux_out(21)
    );
\sig_data_reg_out[22]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dout(22),
      I1 => sig_s_ready_dup,
      I2 => sig_data_skid_reg(22),
      O => sig_data_skid_mux_out(22)
    );
\sig_data_reg_out[23]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dout(23),
      I1 => sig_s_ready_dup,
      I2 => sig_data_skid_reg(23),
      O => sig_data_skid_mux_out(23)
    );
\sig_data_reg_out[24]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dout(24),
      I1 => sig_s_ready_dup,
      I2 => sig_data_skid_reg(24),
      O => sig_data_skid_mux_out(24)
    );
\sig_data_reg_out[25]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dout(25),
      I1 => sig_s_ready_dup,
      I2 => sig_data_skid_reg(25),
      O => sig_data_skid_mux_out(25)
    );
\sig_data_reg_out[26]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dout(26),
      I1 => sig_s_ready_dup,
      I2 => sig_data_skid_reg(26),
      O => sig_data_skid_mux_out(26)
    );
\sig_data_reg_out[27]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dout(27),
      I1 => sig_s_ready_dup,
      I2 => sig_data_skid_reg(27),
      O => sig_data_skid_mux_out(27)
    );
\sig_data_reg_out[28]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dout(28),
      I1 => sig_s_ready_dup,
      I2 => sig_data_skid_reg(28),
      O => sig_data_skid_mux_out(28)
    );
\sig_data_reg_out[29]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dout(29),
      I1 => sig_s_ready_dup,
      I2 => sig_data_skid_reg(29),
      O => sig_data_skid_mux_out(29)
    );
\sig_data_reg_out[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dout(2),
      I1 => sig_s_ready_dup,
      I2 => sig_data_skid_reg(2),
      O => sig_data_skid_mux_out(2)
    );
\sig_data_reg_out[30]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dout(30),
      I1 => sig_s_ready_dup,
      I2 => sig_data_skid_reg(30),
      O => sig_data_skid_mux_out(30)
    );
\sig_data_reg_out[31]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dout(31),
      I1 => sig_s_ready_dup,
      I2 => sig_data_skid_reg(31),
      O => sig_data_skid_mux_out(31)
    );
\sig_data_reg_out[32]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dout(32),
      I1 => sig_s_ready_dup,
      I2 => sig_data_skid_reg(32),
      O => sig_data_skid_mux_out(32)
    );
\sig_data_reg_out[33]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dout(33),
      I1 => sig_s_ready_dup,
      I2 => sig_data_skid_reg(33),
      O => sig_data_skid_mux_out(33)
    );
\sig_data_reg_out[34]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dout(34),
      I1 => sig_s_ready_dup,
      I2 => sig_data_skid_reg(34),
      O => sig_data_skid_mux_out(34)
    );
\sig_data_reg_out[35]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dout(35),
      I1 => sig_s_ready_dup,
      I2 => sig_data_skid_reg(35),
      O => sig_data_skid_mux_out(35)
    );
\sig_data_reg_out[36]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dout(36),
      I1 => sig_s_ready_dup,
      I2 => sig_data_skid_reg(36),
      O => sig_data_skid_mux_out(36)
    );
\sig_data_reg_out[37]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dout(37),
      I1 => sig_s_ready_dup,
      I2 => sig_data_skid_reg(37),
      O => sig_data_skid_mux_out(37)
    );
\sig_data_reg_out[38]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dout(38),
      I1 => sig_s_ready_dup,
      I2 => sig_data_skid_reg(38),
      O => sig_data_skid_mux_out(38)
    );
\sig_data_reg_out[39]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dout(39),
      I1 => sig_s_ready_dup,
      I2 => sig_data_skid_reg(39),
      O => sig_data_skid_mux_out(39)
    );
\sig_data_reg_out[3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dout(3),
      I1 => sig_s_ready_dup,
      I2 => sig_data_skid_reg(3),
      O => sig_data_skid_mux_out(3)
    );
\sig_data_reg_out[40]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dout(40),
      I1 => sig_s_ready_dup,
      I2 => sig_data_skid_reg(40),
      O => sig_data_skid_mux_out(40)
    );
\sig_data_reg_out[41]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dout(41),
      I1 => sig_s_ready_dup,
      I2 => sig_data_skid_reg(41),
      O => sig_data_skid_mux_out(41)
    );
\sig_data_reg_out[42]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dout(42),
      I1 => sig_s_ready_dup,
      I2 => sig_data_skid_reg(42),
      O => sig_data_skid_mux_out(42)
    );
\sig_data_reg_out[43]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dout(43),
      I1 => sig_s_ready_dup,
      I2 => sig_data_skid_reg(43),
      O => sig_data_skid_mux_out(43)
    );
\sig_data_reg_out[44]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dout(44),
      I1 => sig_s_ready_dup,
      I2 => sig_data_skid_reg(44),
      O => sig_data_skid_mux_out(44)
    );
\sig_data_reg_out[45]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dout(45),
      I1 => sig_s_ready_dup,
      I2 => sig_data_skid_reg(45),
      O => sig_data_skid_mux_out(45)
    );
\sig_data_reg_out[46]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dout(46),
      I1 => sig_s_ready_dup,
      I2 => sig_data_skid_reg(46),
      O => sig_data_skid_mux_out(46)
    );
\sig_data_reg_out[47]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dout(47),
      I1 => sig_s_ready_dup,
      I2 => sig_data_skid_reg(47),
      O => sig_data_skid_mux_out(47)
    );
\sig_data_reg_out[48]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dout(48),
      I1 => sig_s_ready_dup,
      I2 => sig_data_skid_reg(48),
      O => sig_data_skid_mux_out(48)
    );
\sig_data_reg_out[49]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dout(49),
      I1 => sig_s_ready_dup,
      I2 => sig_data_skid_reg(49),
      O => sig_data_skid_mux_out(49)
    );
\sig_data_reg_out[4]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dout(4),
      I1 => sig_s_ready_dup,
      I2 => sig_data_skid_reg(4),
      O => sig_data_skid_mux_out(4)
    );
\sig_data_reg_out[50]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dout(50),
      I1 => sig_s_ready_dup,
      I2 => sig_data_skid_reg(50),
      O => sig_data_skid_mux_out(50)
    );
\sig_data_reg_out[51]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dout(51),
      I1 => sig_s_ready_dup,
      I2 => sig_data_skid_reg(51),
      O => sig_data_skid_mux_out(51)
    );
\sig_data_reg_out[52]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dout(52),
      I1 => sig_s_ready_dup,
      I2 => sig_data_skid_reg(52),
      O => sig_data_skid_mux_out(52)
    );
\sig_data_reg_out[53]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dout(53),
      I1 => sig_s_ready_dup,
      I2 => sig_data_skid_reg(53),
      O => sig_data_skid_mux_out(53)
    );
\sig_data_reg_out[54]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dout(54),
      I1 => sig_s_ready_dup,
      I2 => sig_data_skid_reg(54),
      O => sig_data_skid_mux_out(54)
    );
\sig_data_reg_out[55]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dout(55),
      I1 => sig_s_ready_dup,
      I2 => sig_data_skid_reg(55),
      O => sig_data_skid_mux_out(55)
    );
\sig_data_reg_out[56]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dout(56),
      I1 => sig_s_ready_dup,
      I2 => sig_data_skid_reg(56),
      O => sig_data_skid_mux_out(56)
    );
\sig_data_reg_out[57]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dout(57),
      I1 => sig_s_ready_dup,
      I2 => sig_data_skid_reg(57),
      O => sig_data_skid_mux_out(57)
    );
\sig_data_reg_out[58]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dout(58),
      I1 => sig_s_ready_dup,
      I2 => sig_data_skid_reg(58),
      O => sig_data_skid_mux_out(58)
    );
\sig_data_reg_out[59]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dout(59),
      I1 => sig_s_ready_dup,
      I2 => sig_data_skid_reg(59),
      O => sig_data_skid_mux_out(59)
    );
\sig_data_reg_out[5]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dout(5),
      I1 => sig_s_ready_dup,
      I2 => sig_data_skid_reg(5),
      O => sig_data_skid_mux_out(5)
    );
\sig_data_reg_out[60]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dout(60),
      I1 => sig_s_ready_dup,
      I2 => sig_data_skid_reg(60),
      O => sig_data_skid_mux_out(60)
    );
\sig_data_reg_out[61]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dout(61),
      I1 => sig_s_ready_dup,
      I2 => sig_data_skid_reg(61),
      O => sig_data_skid_mux_out(61)
    );
\sig_data_reg_out[62]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dout(62),
      I1 => sig_s_ready_dup,
      I2 => sig_data_skid_reg(62),
      O => sig_data_skid_mux_out(62)
    );
\sig_data_reg_out[63]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dout(63),
      I1 => sig_s_ready_dup,
      I2 => sig_data_skid_reg(63),
      O => sig_data_skid_mux_out(63)
    );
\sig_data_reg_out[64]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dout(64),
      I1 => sig_s_ready_dup,
      I2 => sig_data_skid_reg(64),
      O => sig_data_skid_mux_out(64)
    );
\sig_data_reg_out[65]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dout(65),
      I1 => sig_s_ready_dup,
      I2 => sig_data_skid_reg(65),
      O => sig_data_skid_mux_out(65)
    );
\sig_data_reg_out[66]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dout(66),
      I1 => sig_s_ready_dup,
      I2 => sig_data_skid_reg(66),
      O => sig_data_skid_mux_out(66)
    );
\sig_data_reg_out[67]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dout(67),
      I1 => sig_s_ready_dup,
      I2 => sig_data_skid_reg(67),
      O => sig_data_skid_mux_out(67)
    );
\sig_data_reg_out[68]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dout(68),
      I1 => sig_s_ready_dup,
      I2 => sig_data_skid_reg(68),
      O => sig_data_skid_mux_out(68)
    );
\sig_data_reg_out[69]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dout(69),
      I1 => sig_s_ready_dup,
      I2 => sig_data_skid_reg(69),
      O => sig_data_skid_mux_out(69)
    );
\sig_data_reg_out[6]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dout(6),
      I1 => sig_s_ready_dup,
      I2 => sig_data_skid_reg(6),
      O => sig_data_skid_mux_out(6)
    );
\sig_data_reg_out[70]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dout(70),
      I1 => sig_s_ready_dup,
      I2 => sig_data_skid_reg(70),
      O => sig_data_skid_mux_out(70)
    );
\sig_data_reg_out[71]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dout(71),
      I1 => sig_s_ready_dup,
      I2 => sig_data_skid_reg(71),
      O => sig_data_skid_mux_out(71)
    );
\sig_data_reg_out[72]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dout(72),
      I1 => sig_s_ready_dup,
      I2 => sig_data_skid_reg(72),
      O => sig_data_skid_mux_out(72)
    );
\sig_data_reg_out[73]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dout(73),
      I1 => sig_s_ready_dup,
      I2 => sig_data_skid_reg(73),
      O => sig_data_skid_mux_out(73)
    );
\sig_data_reg_out[74]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dout(74),
      I1 => sig_s_ready_dup,
      I2 => sig_data_skid_reg(74),
      O => sig_data_skid_mux_out(74)
    );
\sig_data_reg_out[75]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dout(75),
      I1 => sig_s_ready_dup,
      I2 => sig_data_skid_reg(75),
      O => sig_data_skid_mux_out(75)
    );
\sig_data_reg_out[76]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dout(76),
      I1 => sig_s_ready_dup,
      I2 => sig_data_skid_reg(76),
      O => sig_data_skid_mux_out(76)
    );
\sig_data_reg_out[77]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dout(77),
      I1 => sig_s_ready_dup,
      I2 => sig_data_skid_reg(77),
      O => sig_data_skid_mux_out(77)
    );
\sig_data_reg_out[78]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dout(78),
      I1 => sig_s_ready_dup,
      I2 => sig_data_skid_reg(78),
      O => sig_data_skid_mux_out(78)
    );
\sig_data_reg_out[79]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dout(79),
      I1 => sig_s_ready_dup,
      I2 => sig_data_skid_reg(79),
      O => sig_data_skid_mux_out(79)
    );
\sig_data_reg_out[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dout(7),
      I1 => sig_s_ready_dup,
      I2 => sig_data_skid_reg(7),
      O => sig_data_skid_mux_out(7)
    );
\sig_data_reg_out[80]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dout(80),
      I1 => sig_s_ready_dup,
      I2 => sig_data_skid_reg(80),
      O => sig_data_skid_mux_out(80)
    );
\sig_data_reg_out[81]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dout(81),
      I1 => sig_s_ready_dup,
      I2 => sig_data_skid_reg(81),
      O => sig_data_skid_mux_out(81)
    );
\sig_data_reg_out[82]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dout(82),
      I1 => sig_s_ready_dup,
      I2 => sig_data_skid_reg(82),
      O => sig_data_skid_mux_out(82)
    );
\sig_data_reg_out[83]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dout(83),
      I1 => sig_s_ready_dup,
      I2 => sig_data_skid_reg(83),
      O => sig_data_skid_mux_out(83)
    );
\sig_data_reg_out[84]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dout(84),
      I1 => sig_s_ready_dup,
      I2 => sig_data_skid_reg(84),
      O => sig_data_skid_mux_out(84)
    );
\sig_data_reg_out[85]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dout(85),
      I1 => sig_s_ready_dup,
      I2 => sig_data_skid_reg(85),
      O => sig_data_skid_mux_out(85)
    );
\sig_data_reg_out[86]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dout(86),
      I1 => sig_s_ready_dup,
      I2 => sig_data_skid_reg(86),
      O => sig_data_skid_mux_out(86)
    );
\sig_data_reg_out[87]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dout(87),
      I1 => sig_s_ready_dup,
      I2 => sig_data_skid_reg(87),
      O => sig_data_skid_mux_out(87)
    );
\sig_data_reg_out[88]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dout(88),
      I1 => sig_s_ready_dup,
      I2 => sig_data_skid_reg(88),
      O => sig_data_skid_mux_out(88)
    );
\sig_data_reg_out[89]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dout(89),
      I1 => sig_s_ready_dup,
      I2 => sig_data_skid_reg(89),
      O => sig_data_skid_mux_out(89)
    );
\sig_data_reg_out[8]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dout(8),
      I1 => sig_s_ready_dup,
      I2 => sig_data_skid_reg(8),
      O => sig_data_skid_mux_out(8)
    );
\sig_data_reg_out[90]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dout(90),
      I1 => sig_s_ready_dup,
      I2 => sig_data_skid_reg(90),
      O => sig_data_skid_mux_out(90)
    );
\sig_data_reg_out[91]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dout(91),
      I1 => sig_s_ready_dup,
      I2 => sig_data_skid_reg(91),
      O => sig_data_skid_mux_out(91)
    );
\sig_data_reg_out[92]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dout(92),
      I1 => sig_s_ready_dup,
      I2 => sig_data_skid_reg(92),
      O => sig_data_skid_mux_out(92)
    );
\sig_data_reg_out[93]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dout(93),
      I1 => sig_s_ready_dup,
      I2 => sig_data_skid_reg(93),
      O => sig_data_skid_mux_out(93)
    );
\sig_data_reg_out[94]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dout(94),
      I1 => sig_s_ready_dup,
      I2 => sig_data_skid_reg(94),
      O => sig_data_skid_mux_out(94)
    );
\sig_data_reg_out[95]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dout(95),
      I1 => sig_s_ready_dup,
      I2 => sig_data_skid_reg(95),
      O => sig_data_skid_mux_out(95)
    );
\sig_data_reg_out[96]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dout(96),
      I1 => sig_s_ready_dup,
      I2 => sig_data_skid_reg(96),
      O => sig_data_skid_mux_out(96)
    );
\sig_data_reg_out[97]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dout(97),
      I1 => sig_s_ready_dup,
      I2 => sig_data_skid_reg(97),
      O => sig_data_skid_mux_out(97)
    );
\sig_data_reg_out[98]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dout(98),
      I1 => sig_s_ready_dup,
      I2 => sig_data_skid_reg(98),
      O => sig_data_skid_mux_out(98)
    );
\sig_data_reg_out[99]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dout(99),
      I1 => sig_s_ready_dup,
      I2 => sig_data_skid_reg(99),
      O => sig_data_skid_mux_out(99)
    );
\sig_data_reg_out[9]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dout(9),
      I1 => sig_s_ready_dup,
      I2 => sig_data_skid_reg(9),
      O => sig_data_skid_mux_out(9)
    );
\sig_data_reg_out_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_data_reg_out_en,
      D => sig_data_skid_mux_out(0),
      Q => m_axis_mm2s_tdata(0),
      R => sig_data_reg_out0
    );
\sig_data_reg_out_reg[100]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_data_reg_out_en,
      D => sig_data_skid_mux_out(100),
      Q => m_axis_mm2s_tdata(100),
      R => sig_data_reg_out0
    );
\sig_data_reg_out_reg[101]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_data_reg_out_en,
      D => sig_data_skid_mux_out(101),
      Q => m_axis_mm2s_tdata(101),
      R => sig_data_reg_out0
    );
\sig_data_reg_out_reg[102]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_data_reg_out_en,
      D => sig_data_skid_mux_out(102),
      Q => m_axis_mm2s_tdata(102),
      R => sig_data_reg_out0
    );
\sig_data_reg_out_reg[103]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_data_reg_out_en,
      D => sig_data_skid_mux_out(103),
      Q => m_axis_mm2s_tdata(103),
      R => sig_data_reg_out0
    );
\sig_data_reg_out_reg[104]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_data_reg_out_en,
      D => sig_data_skid_mux_out(104),
      Q => m_axis_mm2s_tdata(104),
      R => sig_data_reg_out0
    );
\sig_data_reg_out_reg[105]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_data_reg_out_en,
      D => sig_data_skid_mux_out(105),
      Q => m_axis_mm2s_tdata(105),
      R => sig_data_reg_out0
    );
\sig_data_reg_out_reg[106]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_data_reg_out_en,
      D => sig_data_skid_mux_out(106),
      Q => m_axis_mm2s_tdata(106),
      R => sig_data_reg_out0
    );
\sig_data_reg_out_reg[107]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_data_reg_out_en,
      D => sig_data_skid_mux_out(107),
      Q => m_axis_mm2s_tdata(107),
      R => sig_data_reg_out0
    );
\sig_data_reg_out_reg[108]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_data_reg_out_en,
      D => sig_data_skid_mux_out(108),
      Q => m_axis_mm2s_tdata(108),
      R => sig_data_reg_out0
    );
\sig_data_reg_out_reg[109]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_data_reg_out_en,
      D => sig_data_skid_mux_out(109),
      Q => m_axis_mm2s_tdata(109),
      R => sig_data_reg_out0
    );
\sig_data_reg_out_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_data_reg_out_en,
      D => sig_data_skid_mux_out(10),
      Q => m_axis_mm2s_tdata(10),
      R => sig_data_reg_out0
    );
\sig_data_reg_out_reg[110]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_data_reg_out_en,
      D => sig_data_skid_mux_out(110),
      Q => m_axis_mm2s_tdata(110),
      R => sig_data_reg_out0
    );
\sig_data_reg_out_reg[111]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_data_reg_out_en,
      D => sig_data_skid_mux_out(111),
      Q => m_axis_mm2s_tdata(111),
      R => sig_data_reg_out0
    );
\sig_data_reg_out_reg[112]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_data_reg_out_en,
      D => sig_data_skid_mux_out(112),
      Q => m_axis_mm2s_tdata(112),
      R => sig_data_reg_out0
    );
\sig_data_reg_out_reg[113]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_data_reg_out_en,
      D => sig_data_skid_mux_out(113),
      Q => m_axis_mm2s_tdata(113),
      R => sig_data_reg_out0
    );
\sig_data_reg_out_reg[114]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_data_reg_out_en,
      D => sig_data_skid_mux_out(114),
      Q => m_axis_mm2s_tdata(114),
      R => sig_data_reg_out0
    );
\sig_data_reg_out_reg[115]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_data_reg_out_en,
      D => sig_data_skid_mux_out(115),
      Q => m_axis_mm2s_tdata(115),
      R => sig_data_reg_out0
    );
\sig_data_reg_out_reg[116]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_data_reg_out_en,
      D => sig_data_skid_mux_out(116),
      Q => m_axis_mm2s_tdata(116),
      R => sig_data_reg_out0
    );
\sig_data_reg_out_reg[117]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_data_reg_out_en,
      D => sig_data_skid_mux_out(117),
      Q => m_axis_mm2s_tdata(117),
      R => sig_data_reg_out0
    );
\sig_data_reg_out_reg[118]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_data_reg_out_en,
      D => sig_data_skid_mux_out(118),
      Q => m_axis_mm2s_tdata(118),
      R => sig_data_reg_out0
    );
\sig_data_reg_out_reg[119]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_data_reg_out_en,
      D => sig_data_skid_mux_out(119),
      Q => m_axis_mm2s_tdata(119),
      R => sig_data_reg_out0
    );
\sig_data_reg_out_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_data_reg_out_en,
      D => sig_data_skid_mux_out(11),
      Q => m_axis_mm2s_tdata(11),
      R => sig_data_reg_out0
    );
\sig_data_reg_out_reg[120]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_data_reg_out_en,
      D => sig_data_skid_mux_out(120),
      Q => m_axis_mm2s_tdata(120),
      R => sig_data_reg_out0
    );
\sig_data_reg_out_reg[121]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_data_reg_out_en,
      D => sig_data_skid_mux_out(121),
      Q => m_axis_mm2s_tdata(121),
      R => sig_data_reg_out0
    );
\sig_data_reg_out_reg[122]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_data_reg_out_en,
      D => sig_data_skid_mux_out(122),
      Q => m_axis_mm2s_tdata(122),
      R => sig_data_reg_out0
    );
\sig_data_reg_out_reg[123]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_data_reg_out_en,
      D => sig_data_skid_mux_out(123),
      Q => m_axis_mm2s_tdata(123),
      R => sig_data_reg_out0
    );
\sig_data_reg_out_reg[124]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_data_reg_out_en,
      D => sig_data_skid_mux_out(124),
      Q => m_axis_mm2s_tdata(124),
      R => sig_data_reg_out0
    );
\sig_data_reg_out_reg[125]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_data_reg_out_en,
      D => sig_data_skid_mux_out(125),
      Q => m_axis_mm2s_tdata(125),
      R => sig_data_reg_out0
    );
\sig_data_reg_out_reg[126]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_data_reg_out_en,
      D => sig_data_skid_mux_out(126),
      Q => m_axis_mm2s_tdata(126),
      R => sig_data_reg_out0
    );
\sig_data_reg_out_reg[127]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_data_reg_out_en,
      D => sig_data_skid_mux_out(127),
      Q => m_axis_mm2s_tdata(127),
      R => sig_data_reg_out0
    );
\sig_data_reg_out_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_data_reg_out_en,
      D => sig_data_skid_mux_out(12),
      Q => m_axis_mm2s_tdata(12),
      R => sig_data_reg_out0
    );
\sig_data_reg_out_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_data_reg_out_en,
      D => sig_data_skid_mux_out(13),
      Q => m_axis_mm2s_tdata(13),
      R => sig_data_reg_out0
    );
\sig_data_reg_out_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_data_reg_out_en,
      D => sig_data_skid_mux_out(14),
      Q => m_axis_mm2s_tdata(14),
      R => sig_data_reg_out0
    );
\sig_data_reg_out_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_data_reg_out_en,
      D => sig_data_skid_mux_out(15),
      Q => m_axis_mm2s_tdata(15),
      R => sig_data_reg_out0
    );
\sig_data_reg_out_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_data_reg_out_en,
      D => sig_data_skid_mux_out(16),
      Q => m_axis_mm2s_tdata(16),
      R => sig_data_reg_out0
    );
\sig_data_reg_out_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_data_reg_out_en,
      D => sig_data_skid_mux_out(17),
      Q => m_axis_mm2s_tdata(17),
      R => sig_data_reg_out0
    );
\sig_data_reg_out_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_data_reg_out_en,
      D => sig_data_skid_mux_out(18),
      Q => m_axis_mm2s_tdata(18),
      R => sig_data_reg_out0
    );
\sig_data_reg_out_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_data_reg_out_en,
      D => sig_data_skid_mux_out(19),
      Q => m_axis_mm2s_tdata(19),
      R => sig_data_reg_out0
    );
\sig_data_reg_out_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_data_reg_out_en,
      D => sig_data_skid_mux_out(1),
      Q => m_axis_mm2s_tdata(1),
      R => sig_data_reg_out0
    );
\sig_data_reg_out_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_data_reg_out_en,
      D => sig_data_skid_mux_out(20),
      Q => m_axis_mm2s_tdata(20),
      R => sig_data_reg_out0
    );
\sig_data_reg_out_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_data_reg_out_en,
      D => sig_data_skid_mux_out(21),
      Q => m_axis_mm2s_tdata(21),
      R => sig_data_reg_out0
    );
\sig_data_reg_out_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_data_reg_out_en,
      D => sig_data_skid_mux_out(22),
      Q => m_axis_mm2s_tdata(22),
      R => sig_data_reg_out0
    );
\sig_data_reg_out_reg[23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_data_reg_out_en,
      D => sig_data_skid_mux_out(23),
      Q => m_axis_mm2s_tdata(23),
      R => sig_data_reg_out0
    );
\sig_data_reg_out_reg[24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_data_reg_out_en,
      D => sig_data_skid_mux_out(24),
      Q => m_axis_mm2s_tdata(24),
      R => sig_data_reg_out0
    );
\sig_data_reg_out_reg[25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_data_reg_out_en,
      D => sig_data_skid_mux_out(25),
      Q => m_axis_mm2s_tdata(25),
      R => sig_data_reg_out0
    );
\sig_data_reg_out_reg[26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_data_reg_out_en,
      D => sig_data_skid_mux_out(26),
      Q => m_axis_mm2s_tdata(26),
      R => sig_data_reg_out0
    );
\sig_data_reg_out_reg[27]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_data_reg_out_en,
      D => sig_data_skid_mux_out(27),
      Q => m_axis_mm2s_tdata(27),
      R => sig_data_reg_out0
    );
\sig_data_reg_out_reg[28]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_data_reg_out_en,
      D => sig_data_skid_mux_out(28),
      Q => m_axis_mm2s_tdata(28),
      R => sig_data_reg_out0
    );
\sig_data_reg_out_reg[29]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_data_reg_out_en,
      D => sig_data_skid_mux_out(29),
      Q => m_axis_mm2s_tdata(29),
      R => sig_data_reg_out0
    );
\sig_data_reg_out_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_data_reg_out_en,
      D => sig_data_skid_mux_out(2),
      Q => m_axis_mm2s_tdata(2),
      R => sig_data_reg_out0
    );
\sig_data_reg_out_reg[30]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_data_reg_out_en,
      D => sig_data_skid_mux_out(30),
      Q => m_axis_mm2s_tdata(30),
      R => sig_data_reg_out0
    );
\sig_data_reg_out_reg[31]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_data_reg_out_en,
      D => sig_data_skid_mux_out(31),
      Q => m_axis_mm2s_tdata(31),
      R => sig_data_reg_out0
    );
\sig_data_reg_out_reg[32]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_data_reg_out_en,
      D => sig_data_skid_mux_out(32),
      Q => m_axis_mm2s_tdata(32),
      R => sig_data_reg_out0
    );
\sig_data_reg_out_reg[33]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_data_reg_out_en,
      D => sig_data_skid_mux_out(33),
      Q => m_axis_mm2s_tdata(33),
      R => sig_data_reg_out0
    );
\sig_data_reg_out_reg[34]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_data_reg_out_en,
      D => sig_data_skid_mux_out(34),
      Q => m_axis_mm2s_tdata(34),
      R => sig_data_reg_out0
    );
\sig_data_reg_out_reg[35]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_data_reg_out_en,
      D => sig_data_skid_mux_out(35),
      Q => m_axis_mm2s_tdata(35),
      R => sig_data_reg_out0
    );
\sig_data_reg_out_reg[36]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_data_reg_out_en,
      D => sig_data_skid_mux_out(36),
      Q => m_axis_mm2s_tdata(36),
      R => sig_data_reg_out0
    );
\sig_data_reg_out_reg[37]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_data_reg_out_en,
      D => sig_data_skid_mux_out(37),
      Q => m_axis_mm2s_tdata(37),
      R => sig_data_reg_out0
    );
\sig_data_reg_out_reg[38]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_data_reg_out_en,
      D => sig_data_skid_mux_out(38),
      Q => m_axis_mm2s_tdata(38),
      R => sig_data_reg_out0
    );
\sig_data_reg_out_reg[39]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_data_reg_out_en,
      D => sig_data_skid_mux_out(39),
      Q => m_axis_mm2s_tdata(39),
      R => sig_data_reg_out0
    );
\sig_data_reg_out_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_data_reg_out_en,
      D => sig_data_skid_mux_out(3),
      Q => m_axis_mm2s_tdata(3),
      R => sig_data_reg_out0
    );
\sig_data_reg_out_reg[40]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_data_reg_out_en,
      D => sig_data_skid_mux_out(40),
      Q => m_axis_mm2s_tdata(40),
      R => sig_data_reg_out0
    );
\sig_data_reg_out_reg[41]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_data_reg_out_en,
      D => sig_data_skid_mux_out(41),
      Q => m_axis_mm2s_tdata(41),
      R => sig_data_reg_out0
    );
\sig_data_reg_out_reg[42]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_data_reg_out_en,
      D => sig_data_skid_mux_out(42),
      Q => m_axis_mm2s_tdata(42),
      R => sig_data_reg_out0
    );
\sig_data_reg_out_reg[43]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_data_reg_out_en,
      D => sig_data_skid_mux_out(43),
      Q => m_axis_mm2s_tdata(43),
      R => sig_data_reg_out0
    );
\sig_data_reg_out_reg[44]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_data_reg_out_en,
      D => sig_data_skid_mux_out(44),
      Q => m_axis_mm2s_tdata(44),
      R => sig_data_reg_out0
    );
\sig_data_reg_out_reg[45]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_data_reg_out_en,
      D => sig_data_skid_mux_out(45),
      Q => m_axis_mm2s_tdata(45),
      R => sig_data_reg_out0
    );
\sig_data_reg_out_reg[46]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_data_reg_out_en,
      D => sig_data_skid_mux_out(46),
      Q => m_axis_mm2s_tdata(46),
      R => sig_data_reg_out0
    );
\sig_data_reg_out_reg[47]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_data_reg_out_en,
      D => sig_data_skid_mux_out(47),
      Q => m_axis_mm2s_tdata(47),
      R => sig_data_reg_out0
    );
\sig_data_reg_out_reg[48]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_data_reg_out_en,
      D => sig_data_skid_mux_out(48),
      Q => m_axis_mm2s_tdata(48),
      R => sig_data_reg_out0
    );
\sig_data_reg_out_reg[49]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_data_reg_out_en,
      D => sig_data_skid_mux_out(49),
      Q => m_axis_mm2s_tdata(49),
      R => sig_data_reg_out0
    );
\sig_data_reg_out_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_data_reg_out_en,
      D => sig_data_skid_mux_out(4),
      Q => m_axis_mm2s_tdata(4),
      R => sig_data_reg_out0
    );
\sig_data_reg_out_reg[50]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_data_reg_out_en,
      D => sig_data_skid_mux_out(50),
      Q => m_axis_mm2s_tdata(50),
      R => sig_data_reg_out0
    );
\sig_data_reg_out_reg[51]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_data_reg_out_en,
      D => sig_data_skid_mux_out(51),
      Q => m_axis_mm2s_tdata(51),
      R => sig_data_reg_out0
    );
\sig_data_reg_out_reg[52]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_data_reg_out_en,
      D => sig_data_skid_mux_out(52),
      Q => m_axis_mm2s_tdata(52),
      R => sig_data_reg_out0
    );
\sig_data_reg_out_reg[53]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_data_reg_out_en,
      D => sig_data_skid_mux_out(53),
      Q => m_axis_mm2s_tdata(53),
      R => sig_data_reg_out0
    );
\sig_data_reg_out_reg[54]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_data_reg_out_en,
      D => sig_data_skid_mux_out(54),
      Q => m_axis_mm2s_tdata(54),
      R => sig_data_reg_out0
    );
\sig_data_reg_out_reg[55]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_data_reg_out_en,
      D => sig_data_skid_mux_out(55),
      Q => m_axis_mm2s_tdata(55),
      R => sig_data_reg_out0
    );
\sig_data_reg_out_reg[56]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_data_reg_out_en,
      D => sig_data_skid_mux_out(56),
      Q => m_axis_mm2s_tdata(56),
      R => sig_data_reg_out0
    );
\sig_data_reg_out_reg[57]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_data_reg_out_en,
      D => sig_data_skid_mux_out(57),
      Q => m_axis_mm2s_tdata(57),
      R => sig_data_reg_out0
    );
\sig_data_reg_out_reg[58]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_data_reg_out_en,
      D => sig_data_skid_mux_out(58),
      Q => m_axis_mm2s_tdata(58),
      R => sig_data_reg_out0
    );
\sig_data_reg_out_reg[59]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_data_reg_out_en,
      D => sig_data_skid_mux_out(59),
      Q => m_axis_mm2s_tdata(59),
      R => sig_data_reg_out0
    );
\sig_data_reg_out_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_data_reg_out_en,
      D => sig_data_skid_mux_out(5),
      Q => m_axis_mm2s_tdata(5),
      R => sig_data_reg_out0
    );
\sig_data_reg_out_reg[60]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_data_reg_out_en,
      D => sig_data_skid_mux_out(60),
      Q => m_axis_mm2s_tdata(60),
      R => sig_data_reg_out0
    );
\sig_data_reg_out_reg[61]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_data_reg_out_en,
      D => sig_data_skid_mux_out(61),
      Q => m_axis_mm2s_tdata(61),
      R => sig_data_reg_out0
    );
\sig_data_reg_out_reg[62]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_data_reg_out_en,
      D => sig_data_skid_mux_out(62),
      Q => m_axis_mm2s_tdata(62),
      R => sig_data_reg_out0
    );
\sig_data_reg_out_reg[63]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_data_reg_out_en,
      D => sig_data_skid_mux_out(63),
      Q => m_axis_mm2s_tdata(63),
      R => sig_data_reg_out0
    );
\sig_data_reg_out_reg[64]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_data_reg_out_en,
      D => sig_data_skid_mux_out(64),
      Q => m_axis_mm2s_tdata(64),
      R => sig_data_reg_out0
    );
\sig_data_reg_out_reg[65]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_data_reg_out_en,
      D => sig_data_skid_mux_out(65),
      Q => m_axis_mm2s_tdata(65),
      R => sig_data_reg_out0
    );
\sig_data_reg_out_reg[66]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_data_reg_out_en,
      D => sig_data_skid_mux_out(66),
      Q => m_axis_mm2s_tdata(66),
      R => sig_data_reg_out0
    );
\sig_data_reg_out_reg[67]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_data_reg_out_en,
      D => sig_data_skid_mux_out(67),
      Q => m_axis_mm2s_tdata(67),
      R => sig_data_reg_out0
    );
\sig_data_reg_out_reg[68]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_data_reg_out_en,
      D => sig_data_skid_mux_out(68),
      Q => m_axis_mm2s_tdata(68),
      R => sig_data_reg_out0
    );
\sig_data_reg_out_reg[69]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_data_reg_out_en,
      D => sig_data_skid_mux_out(69),
      Q => m_axis_mm2s_tdata(69),
      R => sig_data_reg_out0
    );
\sig_data_reg_out_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_data_reg_out_en,
      D => sig_data_skid_mux_out(6),
      Q => m_axis_mm2s_tdata(6),
      R => sig_data_reg_out0
    );
\sig_data_reg_out_reg[70]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_data_reg_out_en,
      D => sig_data_skid_mux_out(70),
      Q => m_axis_mm2s_tdata(70),
      R => sig_data_reg_out0
    );
\sig_data_reg_out_reg[71]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_data_reg_out_en,
      D => sig_data_skid_mux_out(71),
      Q => m_axis_mm2s_tdata(71),
      R => sig_data_reg_out0
    );
\sig_data_reg_out_reg[72]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_data_reg_out_en,
      D => sig_data_skid_mux_out(72),
      Q => m_axis_mm2s_tdata(72),
      R => sig_data_reg_out0
    );
\sig_data_reg_out_reg[73]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_data_reg_out_en,
      D => sig_data_skid_mux_out(73),
      Q => m_axis_mm2s_tdata(73),
      R => sig_data_reg_out0
    );
\sig_data_reg_out_reg[74]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_data_reg_out_en,
      D => sig_data_skid_mux_out(74),
      Q => m_axis_mm2s_tdata(74),
      R => sig_data_reg_out0
    );
\sig_data_reg_out_reg[75]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_data_reg_out_en,
      D => sig_data_skid_mux_out(75),
      Q => m_axis_mm2s_tdata(75),
      R => sig_data_reg_out0
    );
\sig_data_reg_out_reg[76]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_data_reg_out_en,
      D => sig_data_skid_mux_out(76),
      Q => m_axis_mm2s_tdata(76),
      R => sig_data_reg_out0
    );
\sig_data_reg_out_reg[77]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_data_reg_out_en,
      D => sig_data_skid_mux_out(77),
      Q => m_axis_mm2s_tdata(77),
      R => sig_data_reg_out0
    );
\sig_data_reg_out_reg[78]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_data_reg_out_en,
      D => sig_data_skid_mux_out(78),
      Q => m_axis_mm2s_tdata(78),
      R => sig_data_reg_out0
    );
\sig_data_reg_out_reg[79]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_data_reg_out_en,
      D => sig_data_skid_mux_out(79),
      Q => m_axis_mm2s_tdata(79),
      R => sig_data_reg_out0
    );
\sig_data_reg_out_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_data_reg_out_en,
      D => sig_data_skid_mux_out(7),
      Q => m_axis_mm2s_tdata(7),
      R => sig_data_reg_out0
    );
\sig_data_reg_out_reg[80]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_data_reg_out_en,
      D => sig_data_skid_mux_out(80),
      Q => m_axis_mm2s_tdata(80),
      R => sig_data_reg_out0
    );
\sig_data_reg_out_reg[81]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_data_reg_out_en,
      D => sig_data_skid_mux_out(81),
      Q => m_axis_mm2s_tdata(81),
      R => sig_data_reg_out0
    );
\sig_data_reg_out_reg[82]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_data_reg_out_en,
      D => sig_data_skid_mux_out(82),
      Q => m_axis_mm2s_tdata(82),
      R => sig_data_reg_out0
    );
\sig_data_reg_out_reg[83]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_data_reg_out_en,
      D => sig_data_skid_mux_out(83),
      Q => m_axis_mm2s_tdata(83),
      R => sig_data_reg_out0
    );
\sig_data_reg_out_reg[84]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_data_reg_out_en,
      D => sig_data_skid_mux_out(84),
      Q => m_axis_mm2s_tdata(84),
      R => sig_data_reg_out0
    );
\sig_data_reg_out_reg[85]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_data_reg_out_en,
      D => sig_data_skid_mux_out(85),
      Q => m_axis_mm2s_tdata(85),
      R => sig_data_reg_out0
    );
\sig_data_reg_out_reg[86]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_data_reg_out_en,
      D => sig_data_skid_mux_out(86),
      Q => m_axis_mm2s_tdata(86),
      R => sig_data_reg_out0
    );
\sig_data_reg_out_reg[87]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_data_reg_out_en,
      D => sig_data_skid_mux_out(87),
      Q => m_axis_mm2s_tdata(87),
      R => sig_data_reg_out0
    );
\sig_data_reg_out_reg[88]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_data_reg_out_en,
      D => sig_data_skid_mux_out(88),
      Q => m_axis_mm2s_tdata(88),
      R => sig_data_reg_out0
    );
\sig_data_reg_out_reg[89]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_data_reg_out_en,
      D => sig_data_skid_mux_out(89),
      Q => m_axis_mm2s_tdata(89),
      R => sig_data_reg_out0
    );
\sig_data_reg_out_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_data_reg_out_en,
      D => sig_data_skid_mux_out(8),
      Q => m_axis_mm2s_tdata(8),
      R => sig_data_reg_out0
    );
\sig_data_reg_out_reg[90]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_data_reg_out_en,
      D => sig_data_skid_mux_out(90),
      Q => m_axis_mm2s_tdata(90),
      R => sig_data_reg_out0
    );
\sig_data_reg_out_reg[91]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_data_reg_out_en,
      D => sig_data_skid_mux_out(91),
      Q => m_axis_mm2s_tdata(91),
      R => sig_data_reg_out0
    );
\sig_data_reg_out_reg[92]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_data_reg_out_en,
      D => sig_data_skid_mux_out(92),
      Q => m_axis_mm2s_tdata(92),
      R => sig_data_reg_out0
    );
\sig_data_reg_out_reg[93]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_data_reg_out_en,
      D => sig_data_skid_mux_out(93),
      Q => m_axis_mm2s_tdata(93),
      R => sig_data_reg_out0
    );
\sig_data_reg_out_reg[94]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_data_reg_out_en,
      D => sig_data_skid_mux_out(94),
      Q => m_axis_mm2s_tdata(94),
      R => sig_data_reg_out0
    );
\sig_data_reg_out_reg[95]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_data_reg_out_en,
      D => sig_data_skid_mux_out(95),
      Q => m_axis_mm2s_tdata(95),
      R => sig_data_reg_out0
    );
\sig_data_reg_out_reg[96]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_data_reg_out_en,
      D => sig_data_skid_mux_out(96),
      Q => m_axis_mm2s_tdata(96),
      R => sig_data_reg_out0
    );
\sig_data_reg_out_reg[97]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_data_reg_out_en,
      D => sig_data_skid_mux_out(97),
      Q => m_axis_mm2s_tdata(97),
      R => sig_data_reg_out0
    );
\sig_data_reg_out_reg[98]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_data_reg_out_en,
      D => sig_data_skid_mux_out(98),
      Q => m_axis_mm2s_tdata(98),
      R => sig_data_reg_out0
    );
\sig_data_reg_out_reg[99]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_data_reg_out_en,
      D => sig_data_skid_mux_out(99),
      Q => m_axis_mm2s_tdata(99),
      R => sig_data_reg_out0
    );
\sig_data_reg_out_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_data_reg_out_en,
      D => sig_data_skid_mux_out(9),
      Q => m_axis_mm2s_tdata(9),
      R => sig_data_reg_out0
    );
\sig_data_skid_reg_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_s_ready_dup,
      D => dout(0),
      Q => sig_data_skid_reg(0),
      R => SR(0)
    );
\sig_data_skid_reg_reg[100]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_s_ready_dup,
      D => dout(100),
      Q => sig_data_skid_reg(100),
      R => SR(0)
    );
\sig_data_skid_reg_reg[101]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_s_ready_dup,
      D => dout(101),
      Q => sig_data_skid_reg(101),
      R => SR(0)
    );
\sig_data_skid_reg_reg[102]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_s_ready_dup,
      D => dout(102),
      Q => sig_data_skid_reg(102),
      R => SR(0)
    );
\sig_data_skid_reg_reg[103]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_s_ready_dup,
      D => dout(103),
      Q => sig_data_skid_reg(103),
      R => SR(0)
    );
\sig_data_skid_reg_reg[104]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_s_ready_dup,
      D => dout(104),
      Q => sig_data_skid_reg(104),
      R => SR(0)
    );
\sig_data_skid_reg_reg[105]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_s_ready_dup,
      D => dout(105),
      Q => sig_data_skid_reg(105),
      R => SR(0)
    );
\sig_data_skid_reg_reg[106]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_s_ready_dup,
      D => dout(106),
      Q => sig_data_skid_reg(106),
      R => SR(0)
    );
\sig_data_skid_reg_reg[107]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_s_ready_dup,
      D => dout(107),
      Q => sig_data_skid_reg(107),
      R => SR(0)
    );
\sig_data_skid_reg_reg[108]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_s_ready_dup,
      D => dout(108),
      Q => sig_data_skid_reg(108),
      R => SR(0)
    );
\sig_data_skid_reg_reg[109]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_s_ready_dup,
      D => dout(109),
      Q => sig_data_skid_reg(109),
      R => SR(0)
    );
\sig_data_skid_reg_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_s_ready_dup,
      D => dout(10),
      Q => sig_data_skid_reg(10),
      R => SR(0)
    );
\sig_data_skid_reg_reg[110]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_s_ready_dup,
      D => dout(110),
      Q => sig_data_skid_reg(110),
      R => SR(0)
    );
\sig_data_skid_reg_reg[111]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_s_ready_dup,
      D => dout(111),
      Q => sig_data_skid_reg(111),
      R => SR(0)
    );
\sig_data_skid_reg_reg[112]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_s_ready_dup,
      D => dout(112),
      Q => sig_data_skid_reg(112),
      R => SR(0)
    );
\sig_data_skid_reg_reg[113]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_s_ready_dup,
      D => dout(113),
      Q => sig_data_skid_reg(113),
      R => SR(0)
    );
\sig_data_skid_reg_reg[114]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_s_ready_dup,
      D => dout(114),
      Q => sig_data_skid_reg(114),
      R => SR(0)
    );
\sig_data_skid_reg_reg[115]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_s_ready_dup,
      D => dout(115),
      Q => sig_data_skid_reg(115),
      R => SR(0)
    );
\sig_data_skid_reg_reg[116]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_s_ready_dup,
      D => dout(116),
      Q => sig_data_skid_reg(116),
      R => SR(0)
    );
\sig_data_skid_reg_reg[117]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_s_ready_dup,
      D => dout(117),
      Q => sig_data_skid_reg(117),
      R => SR(0)
    );
\sig_data_skid_reg_reg[118]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_s_ready_dup,
      D => dout(118),
      Q => sig_data_skid_reg(118),
      R => SR(0)
    );
\sig_data_skid_reg_reg[119]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_s_ready_dup,
      D => dout(119),
      Q => sig_data_skid_reg(119),
      R => SR(0)
    );
\sig_data_skid_reg_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_s_ready_dup,
      D => dout(11),
      Q => sig_data_skid_reg(11),
      R => SR(0)
    );
\sig_data_skid_reg_reg[120]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_s_ready_dup,
      D => dout(120),
      Q => sig_data_skid_reg(120),
      R => SR(0)
    );
\sig_data_skid_reg_reg[121]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_s_ready_dup,
      D => dout(121),
      Q => sig_data_skid_reg(121),
      R => SR(0)
    );
\sig_data_skid_reg_reg[122]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_s_ready_dup,
      D => dout(122),
      Q => sig_data_skid_reg(122),
      R => SR(0)
    );
\sig_data_skid_reg_reg[123]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_s_ready_dup,
      D => dout(123),
      Q => sig_data_skid_reg(123),
      R => SR(0)
    );
\sig_data_skid_reg_reg[124]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_s_ready_dup,
      D => dout(124),
      Q => sig_data_skid_reg(124),
      R => SR(0)
    );
\sig_data_skid_reg_reg[125]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_s_ready_dup,
      D => dout(125),
      Q => sig_data_skid_reg(125),
      R => SR(0)
    );
\sig_data_skid_reg_reg[126]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_s_ready_dup,
      D => dout(126),
      Q => sig_data_skid_reg(126),
      R => SR(0)
    );
\sig_data_skid_reg_reg[127]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_s_ready_dup,
      D => dout(127),
      Q => sig_data_skid_reg(127),
      R => SR(0)
    );
\sig_data_skid_reg_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_s_ready_dup,
      D => dout(12),
      Q => sig_data_skid_reg(12),
      R => SR(0)
    );
\sig_data_skid_reg_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_s_ready_dup,
      D => dout(13),
      Q => sig_data_skid_reg(13),
      R => SR(0)
    );
\sig_data_skid_reg_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_s_ready_dup,
      D => dout(14),
      Q => sig_data_skid_reg(14),
      R => SR(0)
    );
\sig_data_skid_reg_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_s_ready_dup,
      D => dout(15),
      Q => sig_data_skid_reg(15),
      R => SR(0)
    );
\sig_data_skid_reg_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_s_ready_dup,
      D => dout(16),
      Q => sig_data_skid_reg(16),
      R => SR(0)
    );
\sig_data_skid_reg_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_s_ready_dup,
      D => dout(17),
      Q => sig_data_skid_reg(17),
      R => SR(0)
    );
\sig_data_skid_reg_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_s_ready_dup,
      D => dout(18),
      Q => sig_data_skid_reg(18),
      R => SR(0)
    );
\sig_data_skid_reg_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_s_ready_dup,
      D => dout(19),
      Q => sig_data_skid_reg(19),
      R => SR(0)
    );
\sig_data_skid_reg_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_s_ready_dup,
      D => dout(1),
      Q => sig_data_skid_reg(1),
      R => SR(0)
    );
\sig_data_skid_reg_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_s_ready_dup,
      D => dout(20),
      Q => sig_data_skid_reg(20),
      R => SR(0)
    );
\sig_data_skid_reg_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_s_ready_dup,
      D => dout(21),
      Q => sig_data_skid_reg(21),
      R => SR(0)
    );
\sig_data_skid_reg_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_s_ready_dup,
      D => dout(22),
      Q => sig_data_skid_reg(22),
      R => SR(0)
    );
\sig_data_skid_reg_reg[23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_s_ready_dup,
      D => dout(23),
      Q => sig_data_skid_reg(23),
      R => SR(0)
    );
\sig_data_skid_reg_reg[24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_s_ready_dup,
      D => dout(24),
      Q => sig_data_skid_reg(24),
      R => SR(0)
    );
\sig_data_skid_reg_reg[25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_s_ready_dup,
      D => dout(25),
      Q => sig_data_skid_reg(25),
      R => SR(0)
    );
\sig_data_skid_reg_reg[26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_s_ready_dup,
      D => dout(26),
      Q => sig_data_skid_reg(26),
      R => SR(0)
    );
\sig_data_skid_reg_reg[27]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_s_ready_dup,
      D => dout(27),
      Q => sig_data_skid_reg(27),
      R => SR(0)
    );
\sig_data_skid_reg_reg[28]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_s_ready_dup,
      D => dout(28),
      Q => sig_data_skid_reg(28),
      R => SR(0)
    );
\sig_data_skid_reg_reg[29]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_s_ready_dup,
      D => dout(29),
      Q => sig_data_skid_reg(29),
      R => SR(0)
    );
\sig_data_skid_reg_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_s_ready_dup,
      D => dout(2),
      Q => sig_data_skid_reg(2),
      R => SR(0)
    );
\sig_data_skid_reg_reg[30]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_s_ready_dup,
      D => dout(30),
      Q => sig_data_skid_reg(30),
      R => SR(0)
    );
\sig_data_skid_reg_reg[31]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_s_ready_dup,
      D => dout(31),
      Q => sig_data_skid_reg(31),
      R => SR(0)
    );
\sig_data_skid_reg_reg[32]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_s_ready_dup,
      D => dout(32),
      Q => sig_data_skid_reg(32),
      R => SR(0)
    );
\sig_data_skid_reg_reg[33]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_s_ready_dup,
      D => dout(33),
      Q => sig_data_skid_reg(33),
      R => SR(0)
    );
\sig_data_skid_reg_reg[34]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_s_ready_dup,
      D => dout(34),
      Q => sig_data_skid_reg(34),
      R => SR(0)
    );
\sig_data_skid_reg_reg[35]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_s_ready_dup,
      D => dout(35),
      Q => sig_data_skid_reg(35),
      R => SR(0)
    );
\sig_data_skid_reg_reg[36]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_s_ready_dup,
      D => dout(36),
      Q => sig_data_skid_reg(36),
      R => SR(0)
    );
\sig_data_skid_reg_reg[37]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_s_ready_dup,
      D => dout(37),
      Q => sig_data_skid_reg(37),
      R => SR(0)
    );
\sig_data_skid_reg_reg[38]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_s_ready_dup,
      D => dout(38),
      Q => sig_data_skid_reg(38),
      R => SR(0)
    );
\sig_data_skid_reg_reg[39]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_s_ready_dup,
      D => dout(39),
      Q => sig_data_skid_reg(39),
      R => SR(0)
    );
\sig_data_skid_reg_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_s_ready_dup,
      D => dout(3),
      Q => sig_data_skid_reg(3),
      R => SR(0)
    );
\sig_data_skid_reg_reg[40]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_s_ready_dup,
      D => dout(40),
      Q => sig_data_skid_reg(40),
      R => SR(0)
    );
\sig_data_skid_reg_reg[41]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_s_ready_dup,
      D => dout(41),
      Q => sig_data_skid_reg(41),
      R => SR(0)
    );
\sig_data_skid_reg_reg[42]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_s_ready_dup,
      D => dout(42),
      Q => sig_data_skid_reg(42),
      R => SR(0)
    );
\sig_data_skid_reg_reg[43]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_s_ready_dup,
      D => dout(43),
      Q => sig_data_skid_reg(43),
      R => SR(0)
    );
\sig_data_skid_reg_reg[44]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_s_ready_dup,
      D => dout(44),
      Q => sig_data_skid_reg(44),
      R => SR(0)
    );
\sig_data_skid_reg_reg[45]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_s_ready_dup,
      D => dout(45),
      Q => sig_data_skid_reg(45),
      R => SR(0)
    );
\sig_data_skid_reg_reg[46]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_s_ready_dup,
      D => dout(46),
      Q => sig_data_skid_reg(46),
      R => SR(0)
    );
\sig_data_skid_reg_reg[47]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_s_ready_dup,
      D => dout(47),
      Q => sig_data_skid_reg(47),
      R => SR(0)
    );
\sig_data_skid_reg_reg[48]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_s_ready_dup,
      D => dout(48),
      Q => sig_data_skid_reg(48),
      R => SR(0)
    );
\sig_data_skid_reg_reg[49]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_s_ready_dup,
      D => dout(49),
      Q => sig_data_skid_reg(49),
      R => SR(0)
    );
\sig_data_skid_reg_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_s_ready_dup,
      D => dout(4),
      Q => sig_data_skid_reg(4),
      R => SR(0)
    );
\sig_data_skid_reg_reg[50]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_s_ready_dup,
      D => dout(50),
      Q => sig_data_skid_reg(50),
      R => SR(0)
    );
\sig_data_skid_reg_reg[51]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_s_ready_dup,
      D => dout(51),
      Q => sig_data_skid_reg(51),
      R => SR(0)
    );
\sig_data_skid_reg_reg[52]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_s_ready_dup,
      D => dout(52),
      Q => sig_data_skid_reg(52),
      R => SR(0)
    );
\sig_data_skid_reg_reg[53]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_s_ready_dup,
      D => dout(53),
      Q => sig_data_skid_reg(53),
      R => SR(0)
    );
\sig_data_skid_reg_reg[54]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_s_ready_dup,
      D => dout(54),
      Q => sig_data_skid_reg(54),
      R => SR(0)
    );
\sig_data_skid_reg_reg[55]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_s_ready_dup,
      D => dout(55),
      Q => sig_data_skid_reg(55),
      R => SR(0)
    );
\sig_data_skid_reg_reg[56]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_s_ready_dup,
      D => dout(56),
      Q => sig_data_skid_reg(56),
      R => SR(0)
    );
\sig_data_skid_reg_reg[57]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_s_ready_dup,
      D => dout(57),
      Q => sig_data_skid_reg(57),
      R => SR(0)
    );
\sig_data_skid_reg_reg[58]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_s_ready_dup,
      D => dout(58),
      Q => sig_data_skid_reg(58),
      R => SR(0)
    );
\sig_data_skid_reg_reg[59]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_s_ready_dup,
      D => dout(59),
      Q => sig_data_skid_reg(59),
      R => SR(0)
    );
\sig_data_skid_reg_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_s_ready_dup,
      D => dout(5),
      Q => sig_data_skid_reg(5),
      R => SR(0)
    );
\sig_data_skid_reg_reg[60]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_s_ready_dup,
      D => dout(60),
      Q => sig_data_skid_reg(60),
      R => SR(0)
    );
\sig_data_skid_reg_reg[61]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_s_ready_dup,
      D => dout(61),
      Q => sig_data_skid_reg(61),
      R => SR(0)
    );
\sig_data_skid_reg_reg[62]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_s_ready_dup,
      D => dout(62),
      Q => sig_data_skid_reg(62),
      R => SR(0)
    );
\sig_data_skid_reg_reg[63]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_s_ready_dup,
      D => dout(63),
      Q => sig_data_skid_reg(63),
      R => SR(0)
    );
\sig_data_skid_reg_reg[64]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_s_ready_dup,
      D => dout(64),
      Q => sig_data_skid_reg(64),
      R => SR(0)
    );
\sig_data_skid_reg_reg[65]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_s_ready_dup,
      D => dout(65),
      Q => sig_data_skid_reg(65),
      R => SR(0)
    );
\sig_data_skid_reg_reg[66]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_s_ready_dup,
      D => dout(66),
      Q => sig_data_skid_reg(66),
      R => SR(0)
    );
\sig_data_skid_reg_reg[67]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_s_ready_dup,
      D => dout(67),
      Q => sig_data_skid_reg(67),
      R => SR(0)
    );
\sig_data_skid_reg_reg[68]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_s_ready_dup,
      D => dout(68),
      Q => sig_data_skid_reg(68),
      R => SR(0)
    );
\sig_data_skid_reg_reg[69]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_s_ready_dup,
      D => dout(69),
      Q => sig_data_skid_reg(69),
      R => SR(0)
    );
\sig_data_skid_reg_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_s_ready_dup,
      D => dout(6),
      Q => sig_data_skid_reg(6),
      R => SR(0)
    );
\sig_data_skid_reg_reg[70]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_s_ready_dup,
      D => dout(70),
      Q => sig_data_skid_reg(70),
      R => SR(0)
    );
\sig_data_skid_reg_reg[71]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_s_ready_dup,
      D => dout(71),
      Q => sig_data_skid_reg(71),
      R => SR(0)
    );
\sig_data_skid_reg_reg[72]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_s_ready_dup,
      D => dout(72),
      Q => sig_data_skid_reg(72),
      R => SR(0)
    );
\sig_data_skid_reg_reg[73]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_s_ready_dup,
      D => dout(73),
      Q => sig_data_skid_reg(73),
      R => SR(0)
    );
\sig_data_skid_reg_reg[74]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_s_ready_dup,
      D => dout(74),
      Q => sig_data_skid_reg(74),
      R => SR(0)
    );
\sig_data_skid_reg_reg[75]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_s_ready_dup,
      D => dout(75),
      Q => sig_data_skid_reg(75),
      R => SR(0)
    );
\sig_data_skid_reg_reg[76]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_s_ready_dup,
      D => dout(76),
      Q => sig_data_skid_reg(76),
      R => SR(0)
    );
\sig_data_skid_reg_reg[77]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_s_ready_dup,
      D => dout(77),
      Q => sig_data_skid_reg(77),
      R => SR(0)
    );
\sig_data_skid_reg_reg[78]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_s_ready_dup,
      D => dout(78),
      Q => sig_data_skid_reg(78),
      R => SR(0)
    );
\sig_data_skid_reg_reg[79]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_s_ready_dup,
      D => dout(79),
      Q => sig_data_skid_reg(79),
      R => SR(0)
    );
\sig_data_skid_reg_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_s_ready_dup,
      D => dout(7),
      Q => sig_data_skid_reg(7),
      R => SR(0)
    );
\sig_data_skid_reg_reg[80]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_s_ready_dup,
      D => dout(80),
      Q => sig_data_skid_reg(80),
      R => SR(0)
    );
\sig_data_skid_reg_reg[81]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_s_ready_dup,
      D => dout(81),
      Q => sig_data_skid_reg(81),
      R => SR(0)
    );
\sig_data_skid_reg_reg[82]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_s_ready_dup,
      D => dout(82),
      Q => sig_data_skid_reg(82),
      R => SR(0)
    );
\sig_data_skid_reg_reg[83]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_s_ready_dup,
      D => dout(83),
      Q => sig_data_skid_reg(83),
      R => SR(0)
    );
\sig_data_skid_reg_reg[84]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_s_ready_dup,
      D => dout(84),
      Q => sig_data_skid_reg(84),
      R => SR(0)
    );
\sig_data_skid_reg_reg[85]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_s_ready_dup,
      D => dout(85),
      Q => sig_data_skid_reg(85),
      R => SR(0)
    );
\sig_data_skid_reg_reg[86]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_s_ready_dup,
      D => dout(86),
      Q => sig_data_skid_reg(86),
      R => SR(0)
    );
\sig_data_skid_reg_reg[87]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_s_ready_dup,
      D => dout(87),
      Q => sig_data_skid_reg(87),
      R => SR(0)
    );
\sig_data_skid_reg_reg[88]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_s_ready_dup,
      D => dout(88),
      Q => sig_data_skid_reg(88),
      R => SR(0)
    );
\sig_data_skid_reg_reg[89]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_s_ready_dup,
      D => dout(89),
      Q => sig_data_skid_reg(89),
      R => SR(0)
    );
\sig_data_skid_reg_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_s_ready_dup,
      D => dout(8),
      Q => sig_data_skid_reg(8),
      R => SR(0)
    );
\sig_data_skid_reg_reg[90]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_s_ready_dup,
      D => dout(90),
      Q => sig_data_skid_reg(90),
      R => SR(0)
    );
\sig_data_skid_reg_reg[91]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_s_ready_dup,
      D => dout(91),
      Q => sig_data_skid_reg(91),
      R => SR(0)
    );
\sig_data_skid_reg_reg[92]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_s_ready_dup,
      D => dout(92),
      Q => sig_data_skid_reg(92),
      R => SR(0)
    );
\sig_data_skid_reg_reg[93]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_s_ready_dup,
      D => dout(93),
      Q => sig_data_skid_reg(93),
      R => SR(0)
    );
\sig_data_skid_reg_reg[94]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_s_ready_dup,
      D => dout(94),
      Q => sig_data_skid_reg(94),
      R => SR(0)
    );
\sig_data_skid_reg_reg[95]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_s_ready_dup,
      D => dout(95),
      Q => sig_data_skid_reg(95),
      R => SR(0)
    );
\sig_data_skid_reg_reg[96]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_s_ready_dup,
      D => dout(96),
      Q => sig_data_skid_reg(96),
      R => SR(0)
    );
\sig_data_skid_reg_reg[97]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_s_ready_dup,
      D => dout(97),
      Q => sig_data_skid_reg(97),
      R => SR(0)
    );
\sig_data_skid_reg_reg[98]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_s_ready_dup,
      D => dout(98),
      Q => sig_data_skid_reg(98),
      R => SR(0)
    );
\sig_data_skid_reg_reg[99]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_s_ready_dup,
      D => dout(99),
      Q => sig_data_skid_reg(99),
      R => SR(0)
    );
\sig_data_skid_reg_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_s_ready_dup,
      D => dout(9),
      Q => sig_data_skid_reg(9),
      R => SR(0)
    );
sig_last_reg_out_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFAACCCCAAAACCCC"
    )
        port map (
      I0 => \^sig_sstrb_stop_mask\(0),
      I1 => sig_last_skid_reg,
      I2 => empty,
      I3 => \OMIT_UNPACKING.lsig_cmd_loaded\,
      I4 => sig_s_ready_dup,
      I5 => dout(144),
      O => sig_last_skid_mux_out
    );
sig_last_reg_out_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_data_reg_out_en,
      D => sig_last_skid_mux_out,
      Q => m_axis_mm2s_tlast,
      R => sig_data_reg_out0
    );
sig_last_skid_reg_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_s_ready_dup,
      D => sig_slast_with_stop,
      Q => sig_last_skid_reg,
      R => SR(0)
    );
sig_m_valid_dup_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00040000"
    )
        port map (
      I0 => sig_mvalid_stop,
      I1 => sig_stream_rst_reg_n,
      I2 => sig_mvalid_stop_set,
      I3 => sig_reset_reg,
      I4 => sig_m_valid_dup_i_3_n_0,
      O => sig_m_valid_dup_i_1_n_0
    );
sig_m_valid_dup_i_2: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BBBB0800"
    )
        port map (
      I0 => m_axis_mm2s_tready,
      I1 => sig_m_valid_dup,
      I2 => sig_halt_reg_dly3,
      I3 => sig_halt_reg_dly2,
      I4 => \^sig_sstrb_stop_mask\(0),
      O => sig_mvalid_stop_set
    );
sig_m_valid_dup_i_3: unisim.vcomponents.LUT5
    generic map(
      INIT => X"2A2AFF2A"
    )
        port map (
      I0 => sig_m_valid_dup,
      I1 => sig_s_ready_dup,
      I2 => m_axis_mm2s_tready,
      I3 => \OMIT_UNPACKING.lsig_cmd_loaded\,
      I4 => empty,
      O => sig_m_valid_dup_i_3_n_0
    );
sig_m_valid_dup_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => '1',
      D => sig_m_valid_dup_i_1_n_0,
      Q => sig_m_valid_dup,
      R => '0'
    );
sig_m_valid_out_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => '1',
      D => sig_m_valid_dup_i_1_n_0,
      Q => sig_m_valid_out,
      R => '0'
    );
sig_mvalid_stop_reg_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFF0FF4000"
    )
        port map (
      I0 => sig_halt_reg_dly3,
      I1 => sig_halt_reg_dly2,
      I2 => m_axis_mm2s_tready,
      I3 => sig_m_valid_dup,
      I4 => \^sig_sstrb_stop_mask\(0),
      I5 => sig_mvalid_stop,
      O => sig_mvalid_stop_reg_i_1_n_0
    );
sig_mvalid_stop_reg_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => '1',
      D => sig_mvalid_stop_reg_i_1_n_0,
      Q => sig_mvalid_stop,
      R => SR(0)
    );
sig_reset_reg_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => '1',
      D => SR(0),
      Q => sig_reset_reg,
      R => '0'
    );
sig_s_ready_dup_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFA2AA"
    )
        port map (
      I0 => sig_s_ready_dup,
      I1 => \OMIT_UNPACKING.lsig_cmd_loaded\,
      I2 => empty,
      I3 => sig_m_valid_dup,
      I4 => m_axis_mm2s_tready,
      I5 => sig_reset_reg,
      O => sig_s_ready_dup_reg_0
    );
sig_s_ready_dup_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => '1',
      D => sig_s_ready_dup_reg_1,
      Q => sig_s_ready_dup,
      R => '0'
    );
sig_s_ready_out_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => '1',
      D => sig_s_ready_dup_reg_1,
      Q => sig_s_ready_out,
      R => '0'
    );
\sig_sstrb_stop_mask_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => '1',
      D => \sig_sstrb_stop_mask_reg[15]_0\,
      Q => \^sig_sstrb_stop_mask\(0),
      R => SR(0)
    );
\sig_strb_reg_out[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FCAC"
    )
        port map (
      I0 => \^sig_sstrb_stop_mask\(0),
      I1 => sig_strb_skid_reg(0),
      I2 => sig_s_ready_dup,
      I3 => dout(128),
      O => sig_strb_skid_mux_out(0)
    );
\sig_strb_reg_out[10]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FCAC"
    )
        port map (
      I0 => \^sig_sstrb_stop_mask\(0),
      I1 => sig_strb_skid_reg(10),
      I2 => sig_s_ready_dup,
      I3 => dout(138),
      O => sig_strb_skid_mux_out(10)
    );
\sig_strb_reg_out[11]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FCAC"
    )
        port map (
      I0 => \^sig_sstrb_stop_mask\(0),
      I1 => sig_strb_skid_reg(11),
      I2 => sig_s_ready_dup,
      I3 => dout(139),
      O => sig_strb_skid_mux_out(11)
    );
\sig_strb_reg_out[12]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FCAC"
    )
        port map (
      I0 => \^sig_sstrb_stop_mask\(0),
      I1 => sig_strb_skid_reg(12),
      I2 => sig_s_ready_dup,
      I3 => dout(140),
      O => sig_strb_skid_mux_out(12)
    );
\sig_strb_reg_out[13]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FCAC"
    )
        port map (
      I0 => \^sig_sstrb_stop_mask\(0),
      I1 => sig_strb_skid_reg(13),
      I2 => sig_s_ready_dup,
      I3 => dout(141),
      O => sig_strb_skid_mux_out(13)
    );
\sig_strb_reg_out[14]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FCAC"
    )
        port map (
      I0 => \^sig_sstrb_stop_mask\(0),
      I1 => sig_strb_skid_reg(14),
      I2 => sig_s_ready_dup,
      I3 => dout(142),
      O => sig_strb_skid_mux_out(14)
    );
\sig_strb_reg_out[15]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FCAC"
    )
        port map (
      I0 => \^sig_sstrb_stop_mask\(0),
      I1 => sig_strb_skid_reg(15),
      I2 => sig_s_ready_dup,
      I3 => dout(143),
      O => sig_strb_skid_mux_out(15)
    );
\sig_strb_reg_out[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FCAC"
    )
        port map (
      I0 => \^sig_sstrb_stop_mask\(0),
      I1 => sig_strb_skid_reg(1),
      I2 => sig_s_ready_dup,
      I3 => dout(129),
      O => sig_strb_skid_mux_out(1)
    );
\sig_strb_reg_out[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FCAC"
    )
        port map (
      I0 => \^sig_sstrb_stop_mask\(0),
      I1 => sig_strb_skid_reg(2),
      I2 => sig_s_ready_dup,
      I3 => dout(130),
      O => sig_strb_skid_mux_out(2)
    );
\sig_strb_reg_out[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FCAC"
    )
        port map (
      I0 => \^sig_sstrb_stop_mask\(0),
      I1 => sig_strb_skid_reg(3),
      I2 => sig_s_ready_dup,
      I3 => dout(131),
      O => sig_strb_skid_mux_out(3)
    );
\sig_strb_reg_out[4]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FCAC"
    )
        port map (
      I0 => \^sig_sstrb_stop_mask\(0),
      I1 => sig_strb_skid_reg(4),
      I2 => sig_s_ready_dup,
      I3 => dout(132),
      O => sig_strb_skid_mux_out(4)
    );
\sig_strb_reg_out[5]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FCAC"
    )
        port map (
      I0 => \^sig_sstrb_stop_mask\(0),
      I1 => sig_strb_skid_reg(5),
      I2 => sig_s_ready_dup,
      I3 => dout(133),
      O => sig_strb_skid_mux_out(5)
    );
\sig_strb_reg_out[6]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FCAC"
    )
        port map (
      I0 => \^sig_sstrb_stop_mask\(0),
      I1 => sig_strb_skid_reg(6),
      I2 => sig_s_ready_dup,
      I3 => dout(134),
      O => sig_strb_skid_mux_out(6)
    );
\sig_strb_reg_out[7]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FCAC"
    )
        port map (
      I0 => \^sig_sstrb_stop_mask\(0),
      I1 => sig_strb_skid_reg(7),
      I2 => sig_s_ready_dup,
      I3 => dout(135),
      O => sig_strb_skid_mux_out(7)
    );
\sig_strb_reg_out[8]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FCAC"
    )
        port map (
      I0 => \^sig_sstrb_stop_mask\(0),
      I1 => sig_strb_skid_reg(8),
      I2 => sig_s_ready_dup,
      I3 => dout(136),
      O => sig_strb_skid_mux_out(8)
    );
\sig_strb_reg_out[9]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FCAC"
    )
        port map (
      I0 => \^sig_sstrb_stop_mask\(0),
      I1 => sig_strb_skid_reg(9),
      I2 => sig_s_ready_dup,
      I3 => dout(137),
      O => sig_strb_skid_mux_out(9)
    );
\sig_strb_reg_out_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_data_reg_out_en,
      D => sig_strb_skid_mux_out(0),
      Q => m_axis_mm2s_tkeep(0),
      R => sig_data_reg_out0
    );
\sig_strb_reg_out_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_data_reg_out_en,
      D => sig_strb_skid_mux_out(10),
      Q => m_axis_mm2s_tkeep(10),
      R => sig_data_reg_out0
    );
\sig_strb_reg_out_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_data_reg_out_en,
      D => sig_strb_skid_mux_out(11),
      Q => m_axis_mm2s_tkeep(11),
      R => sig_data_reg_out0
    );
\sig_strb_reg_out_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_data_reg_out_en,
      D => sig_strb_skid_mux_out(12),
      Q => m_axis_mm2s_tkeep(12),
      R => sig_data_reg_out0
    );
\sig_strb_reg_out_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_data_reg_out_en,
      D => sig_strb_skid_mux_out(13),
      Q => m_axis_mm2s_tkeep(13),
      R => sig_data_reg_out0
    );
\sig_strb_reg_out_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_data_reg_out_en,
      D => sig_strb_skid_mux_out(14),
      Q => m_axis_mm2s_tkeep(14),
      R => sig_data_reg_out0
    );
\sig_strb_reg_out_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_data_reg_out_en,
      D => sig_strb_skid_mux_out(15),
      Q => m_axis_mm2s_tkeep(15),
      R => sig_data_reg_out0
    );
\sig_strb_reg_out_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_data_reg_out_en,
      D => sig_strb_skid_mux_out(1),
      Q => m_axis_mm2s_tkeep(1),
      R => sig_data_reg_out0
    );
\sig_strb_reg_out_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_data_reg_out_en,
      D => sig_strb_skid_mux_out(2),
      Q => m_axis_mm2s_tkeep(2),
      R => sig_data_reg_out0
    );
\sig_strb_reg_out_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_data_reg_out_en,
      D => sig_strb_skid_mux_out(3),
      Q => m_axis_mm2s_tkeep(3),
      R => sig_data_reg_out0
    );
\sig_strb_reg_out_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_data_reg_out_en,
      D => sig_strb_skid_mux_out(4),
      Q => m_axis_mm2s_tkeep(4),
      R => sig_data_reg_out0
    );
\sig_strb_reg_out_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_data_reg_out_en,
      D => sig_strb_skid_mux_out(5),
      Q => m_axis_mm2s_tkeep(5),
      R => sig_data_reg_out0
    );
\sig_strb_reg_out_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_data_reg_out_en,
      D => sig_strb_skid_mux_out(6),
      Q => m_axis_mm2s_tkeep(6),
      R => sig_data_reg_out0
    );
\sig_strb_reg_out_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_data_reg_out_en,
      D => sig_strb_skid_mux_out(7),
      Q => m_axis_mm2s_tkeep(7),
      R => sig_data_reg_out0
    );
\sig_strb_reg_out_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_data_reg_out_en,
      D => sig_strb_skid_mux_out(8),
      Q => m_axis_mm2s_tkeep(8),
      R => sig_data_reg_out0
    );
\sig_strb_reg_out_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_data_reg_out_en,
      D => sig_strb_skid_mux_out(9),
      Q => m_axis_mm2s_tkeep(9),
      R => sig_data_reg_out0
    );
\sig_strb_skid_reg[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \^sig_sstrb_stop_mask\(0),
      I1 => dout(128),
      O => sig_sstrb_with_stop(0)
    );
\sig_strb_skid_reg[10]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \^sig_sstrb_stop_mask\(0),
      I1 => dout(138),
      O => sig_sstrb_with_stop(10)
    );
\sig_strb_skid_reg[11]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \^sig_sstrb_stop_mask\(0),
      I1 => dout(139),
      O => sig_sstrb_with_stop(11)
    );
\sig_strb_skid_reg[12]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \^sig_sstrb_stop_mask\(0),
      I1 => dout(140),
      O => sig_sstrb_with_stop(12)
    );
\sig_strb_skid_reg[13]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \^sig_sstrb_stop_mask\(0),
      I1 => dout(141),
      O => sig_sstrb_with_stop(13)
    );
\sig_strb_skid_reg[14]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \^sig_sstrb_stop_mask\(0),
      I1 => dout(142),
      O => sig_sstrb_with_stop(14)
    );
\sig_strb_skid_reg[15]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \^sig_sstrb_stop_mask\(0),
      I1 => dout(143),
      O => sig_sstrb_with_stop(15)
    );
\sig_strb_skid_reg[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \^sig_sstrb_stop_mask\(0),
      I1 => dout(129),
      O => sig_sstrb_with_stop(1)
    );
\sig_strb_skid_reg[2]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \^sig_sstrb_stop_mask\(0),
      I1 => dout(130),
      O => sig_sstrb_with_stop(2)
    );
\sig_strb_skid_reg[3]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \^sig_sstrb_stop_mask\(0),
      I1 => dout(131),
      O => sig_sstrb_with_stop(3)
    );
\sig_strb_skid_reg[4]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \^sig_sstrb_stop_mask\(0),
      I1 => dout(132),
      O => sig_sstrb_with_stop(4)
    );
\sig_strb_skid_reg[5]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \^sig_sstrb_stop_mask\(0),
      I1 => dout(133),
      O => sig_sstrb_with_stop(5)
    );
\sig_strb_skid_reg[6]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \^sig_sstrb_stop_mask\(0),
      I1 => dout(134),
      O => sig_sstrb_with_stop(6)
    );
\sig_strb_skid_reg[7]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \^sig_sstrb_stop_mask\(0),
      I1 => dout(135),
      O => sig_sstrb_with_stop(7)
    );
\sig_strb_skid_reg[8]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \^sig_sstrb_stop_mask\(0),
      I1 => dout(136),
      O => sig_sstrb_with_stop(8)
    );
\sig_strb_skid_reg[9]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \^sig_sstrb_stop_mask\(0),
      I1 => dout(137),
      O => sig_sstrb_with_stop(9)
    );
\sig_strb_skid_reg_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_s_ready_dup,
      D => sig_sstrb_with_stop(0),
      Q => sig_strb_skid_reg(0),
      R => SR(0)
    );
\sig_strb_skid_reg_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_s_ready_dup,
      D => sig_sstrb_with_stop(10),
      Q => sig_strb_skid_reg(10),
      R => SR(0)
    );
\sig_strb_skid_reg_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_s_ready_dup,
      D => sig_sstrb_with_stop(11),
      Q => sig_strb_skid_reg(11),
      R => SR(0)
    );
\sig_strb_skid_reg_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_s_ready_dup,
      D => sig_sstrb_with_stop(12),
      Q => sig_strb_skid_reg(12),
      R => SR(0)
    );
\sig_strb_skid_reg_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_s_ready_dup,
      D => sig_sstrb_with_stop(13),
      Q => sig_strb_skid_reg(13),
      R => SR(0)
    );
\sig_strb_skid_reg_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_s_ready_dup,
      D => sig_sstrb_with_stop(14),
      Q => sig_strb_skid_reg(14),
      R => SR(0)
    );
\sig_strb_skid_reg_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_s_ready_dup,
      D => sig_sstrb_with_stop(15),
      Q => sig_strb_skid_reg(15),
      R => SR(0)
    );
\sig_strb_skid_reg_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_s_ready_dup,
      D => sig_sstrb_with_stop(1),
      Q => sig_strb_skid_reg(1),
      R => SR(0)
    );
\sig_strb_skid_reg_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_s_ready_dup,
      D => sig_sstrb_with_stop(2),
      Q => sig_strb_skid_reg(2),
      R => SR(0)
    );
\sig_strb_skid_reg_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_s_ready_dup,
      D => sig_sstrb_with_stop(3),
      Q => sig_strb_skid_reg(3),
      R => SR(0)
    );
\sig_strb_skid_reg_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_s_ready_dup,
      D => sig_sstrb_with_stop(4),
      Q => sig_strb_skid_reg(4),
      R => SR(0)
    );
\sig_strb_skid_reg_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_s_ready_dup,
      D => sig_sstrb_with_stop(5),
      Q => sig_strb_skid_reg(5),
      R => SR(0)
    );
\sig_strb_skid_reg_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_s_ready_dup,
      D => sig_sstrb_with_stop(6),
      Q => sig_strb_skid_reg(6),
      R => SR(0)
    );
\sig_strb_skid_reg_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_s_ready_dup,
      D => sig_sstrb_with_stop(7),
      Q => sig_strb_skid_reg(7),
      R => SR(0)
    );
\sig_strb_skid_reg_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_s_ready_dup,
      D => sig_sstrb_with_stop(8),
      Q => sig_strb_skid_reg(8),
      R => SR(0)
    );
\sig_strb_skid_reg_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_s_ready_dup,
      D => sig_sstrb_with_stop(9),
      Q => sig_strb_skid_reg(9),
      R => SR(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_datamover_v5_1_37_srl_fifo is
  port (
    FIFO_Full_reg_0 : out STD_LOGIC;
    FIFO_Full_reg_1 : out STD_LOGIC;
    sig_halt_reg_reg : out STD_LOGIC;
    sig_addr_reg_empty_reg : out STD_LOGIC;
    sig_calc_error_reg_reg : out STD_LOGIC;
    \out\ : out STD_LOGIC_VECTOR ( 36 downto 0 );
    SS : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_mm2s_aclk : in STD_LOGIC;
    \addr_i_reg[0]_0\ : in STD_LOGIC;
    \sig_addr_cntr_lsh_im0_reg[0]\ : in STD_LOGIC;
    \sig_addr_cntr_lsh_im0_reg[0]_0\ : in STD_LOGIC;
    \USE_SRL_FIFO.sig_wr_fifo\ : in STD_LOGIC;
    sig_mstr2addr_cmd_valid : in STD_LOGIC;
    sig_addr_reg_empty : in STD_LOGIC;
    sig_sf_allow_addr_req : in STD_LOGIC;
    sig_data2addr_stop_req : in STD_LOGIC;
    sig_mmap_rst_reg_n : in STD_LOGIC;
    \in\ : in STD_LOGIC_VECTOR ( 35 downto 0 )
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_datamover_v5_1_37_srl_fifo;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_datamover_v5_1_37_srl_fifo is
  signal \^fifo_full_reg_0\ : STD_LOGIC;
  signal \USE_SRL_FIFO.sig_wr_fifo_0\ : STD_LOGIC;
  signal addr_i : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal addr_i_p1 : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \addr_i_reg_n_0_[2]\ : STD_LOGIC;
  signal fifo_full_p1 : STD_LOGIC;
  signal \^out\ : STD_LOGIC_VECTOR ( 36 downto 0 );
  signal \^sig_halt_reg_reg\ : STD_LOGIC;
  attribute srl_bus_name : string;
  attribute srl_bus_name of \data_reg[3][11]_srl4\ : label is "U0/\I_PRMRY_DATAMOVER/GEN_MM2S_FULL.I_MM2S_FULL_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] ";
  attribute srl_name : string;
  attribute srl_name of \data_reg[3][11]_srl4\ : label is "U0/\I_PRMRY_DATAMOVER/GEN_MM2S_FULL.I_MM2S_FULL_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][11]_srl4 ";
  attribute srl_bus_name of \data_reg[3][12]_srl4\ : label is "U0/\I_PRMRY_DATAMOVER/GEN_MM2S_FULL.I_MM2S_FULL_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] ";
  attribute srl_name of \data_reg[3][12]_srl4\ : label is "U0/\I_PRMRY_DATAMOVER/GEN_MM2S_FULL.I_MM2S_FULL_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][12]_srl4 ";
  attribute srl_bus_name of \data_reg[3][21]_srl4\ : label is "U0/\I_PRMRY_DATAMOVER/GEN_MM2S_FULL.I_MM2S_FULL_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] ";
  attribute srl_name of \data_reg[3][21]_srl4\ : label is "U0/\I_PRMRY_DATAMOVER/GEN_MM2S_FULL.I_MM2S_FULL_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][21]_srl4 ";
  attribute srl_bus_name of \data_reg[3][22]_srl4\ : label is "U0/\I_PRMRY_DATAMOVER/GEN_MM2S_FULL.I_MM2S_FULL_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] ";
  attribute srl_name of \data_reg[3][22]_srl4\ : label is "U0/\I_PRMRY_DATAMOVER/GEN_MM2S_FULL.I_MM2S_FULL_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][22]_srl4 ";
  attribute srl_bus_name of \data_reg[3][23]_srl4\ : label is "U0/\I_PRMRY_DATAMOVER/GEN_MM2S_FULL.I_MM2S_FULL_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] ";
  attribute srl_name of \data_reg[3][23]_srl4\ : label is "U0/\I_PRMRY_DATAMOVER/GEN_MM2S_FULL.I_MM2S_FULL_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][23]_srl4 ";
  attribute srl_bus_name of \data_reg[3][24]_srl4\ : label is "U0/\I_PRMRY_DATAMOVER/GEN_MM2S_FULL.I_MM2S_FULL_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] ";
  attribute srl_name of \data_reg[3][24]_srl4\ : label is "U0/\I_PRMRY_DATAMOVER/GEN_MM2S_FULL.I_MM2S_FULL_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][24]_srl4 ";
  attribute srl_bus_name of \data_reg[3][25]_srl4\ : label is "U0/\I_PRMRY_DATAMOVER/GEN_MM2S_FULL.I_MM2S_FULL_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] ";
  attribute srl_name of \data_reg[3][25]_srl4\ : label is "U0/\I_PRMRY_DATAMOVER/GEN_MM2S_FULL.I_MM2S_FULL_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][25]_srl4 ";
  attribute srl_bus_name of \data_reg[3][26]_srl4\ : label is "U0/\I_PRMRY_DATAMOVER/GEN_MM2S_FULL.I_MM2S_FULL_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] ";
  attribute srl_name of \data_reg[3][26]_srl4\ : label is "U0/\I_PRMRY_DATAMOVER/GEN_MM2S_FULL.I_MM2S_FULL_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][26]_srl4 ";
  attribute srl_bus_name of \data_reg[3][27]_srl4\ : label is "U0/\I_PRMRY_DATAMOVER/GEN_MM2S_FULL.I_MM2S_FULL_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] ";
  attribute srl_name of \data_reg[3][27]_srl4\ : label is "U0/\I_PRMRY_DATAMOVER/GEN_MM2S_FULL.I_MM2S_FULL_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][27]_srl4 ";
  attribute srl_bus_name of \data_reg[3][28]_srl4\ : label is "U0/\I_PRMRY_DATAMOVER/GEN_MM2S_FULL.I_MM2S_FULL_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] ";
  attribute srl_name of \data_reg[3][28]_srl4\ : label is "U0/\I_PRMRY_DATAMOVER/GEN_MM2S_FULL.I_MM2S_FULL_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][28]_srl4 ";
  attribute srl_bus_name of \data_reg[3][29]_srl4\ : label is "U0/\I_PRMRY_DATAMOVER/GEN_MM2S_FULL.I_MM2S_FULL_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] ";
  attribute srl_name of \data_reg[3][29]_srl4\ : label is "U0/\I_PRMRY_DATAMOVER/GEN_MM2S_FULL.I_MM2S_FULL_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][29]_srl4 ";
  attribute srl_bus_name of \data_reg[3][30]_srl4\ : label is "U0/\I_PRMRY_DATAMOVER/GEN_MM2S_FULL.I_MM2S_FULL_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] ";
  attribute srl_name of \data_reg[3][30]_srl4\ : label is "U0/\I_PRMRY_DATAMOVER/GEN_MM2S_FULL.I_MM2S_FULL_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][30]_srl4 ";
  attribute srl_bus_name of \data_reg[3][31]_srl4\ : label is "U0/\I_PRMRY_DATAMOVER/GEN_MM2S_FULL.I_MM2S_FULL_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] ";
  attribute srl_name of \data_reg[3][31]_srl4\ : label is "U0/\I_PRMRY_DATAMOVER/GEN_MM2S_FULL.I_MM2S_FULL_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][31]_srl4 ";
  attribute srl_bus_name of \data_reg[3][32]_srl4\ : label is "U0/\I_PRMRY_DATAMOVER/GEN_MM2S_FULL.I_MM2S_FULL_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] ";
  attribute srl_name of \data_reg[3][32]_srl4\ : label is "U0/\I_PRMRY_DATAMOVER/GEN_MM2S_FULL.I_MM2S_FULL_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][32]_srl4 ";
  attribute srl_bus_name of \data_reg[3][33]_srl4\ : label is "U0/\I_PRMRY_DATAMOVER/GEN_MM2S_FULL.I_MM2S_FULL_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] ";
  attribute srl_name of \data_reg[3][33]_srl4\ : label is "U0/\I_PRMRY_DATAMOVER/GEN_MM2S_FULL.I_MM2S_FULL_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][33]_srl4 ";
  attribute srl_bus_name of \data_reg[3][34]_srl4\ : label is "U0/\I_PRMRY_DATAMOVER/GEN_MM2S_FULL.I_MM2S_FULL_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] ";
  attribute srl_name of \data_reg[3][34]_srl4\ : label is "U0/\I_PRMRY_DATAMOVER/GEN_MM2S_FULL.I_MM2S_FULL_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][34]_srl4 ";
  attribute srl_bus_name of \data_reg[3][35]_srl4\ : label is "U0/\I_PRMRY_DATAMOVER/GEN_MM2S_FULL.I_MM2S_FULL_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] ";
  attribute srl_name of \data_reg[3][35]_srl4\ : label is "U0/\I_PRMRY_DATAMOVER/GEN_MM2S_FULL.I_MM2S_FULL_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][35]_srl4 ";
  attribute srl_bus_name of \data_reg[3][36]_srl4\ : label is "U0/\I_PRMRY_DATAMOVER/GEN_MM2S_FULL.I_MM2S_FULL_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] ";
  attribute srl_name of \data_reg[3][36]_srl4\ : label is "U0/\I_PRMRY_DATAMOVER/GEN_MM2S_FULL.I_MM2S_FULL_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][36]_srl4 ";
  attribute srl_bus_name of \data_reg[3][37]_srl4\ : label is "U0/\I_PRMRY_DATAMOVER/GEN_MM2S_FULL.I_MM2S_FULL_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] ";
  attribute srl_name of \data_reg[3][37]_srl4\ : label is "U0/\I_PRMRY_DATAMOVER/GEN_MM2S_FULL.I_MM2S_FULL_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][37]_srl4 ";
  attribute srl_bus_name of \data_reg[3][38]_srl4\ : label is "U0/\I_PRMRY_DATAMOVER/GEN_MM2S_FULL.I_MM2S_FULL_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] ";
  attribute srl_name of \data_reg[3][38]_srl4\ : label is "U0/\I_PRMRY_DATAMOVER/GEN_MM2S_FULL.I_MM2S_FULL_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][38]_srl4 ";
  attribute srl_bus_name of \data_reg[3][39]_srl4\ : label is "U0/\I_PRMRY_DATAMOVER/GEN_MM2S_FULL.I_MM2S_FULL_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] ";
  attribute srl_name of \data_reg[3][39]_srl4\ : label is "U0/\I_PRMRY_DATAMOVER/GEN_MM2S_FULL.I_MM2S_FULL_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][39]_srl4 ";
  attribute srl_bus_name of \data_reg[3][40]_srl4\ : label is "U0/\I_PRMRY_DATAMOVER/GEN_MM2S_FULL.I_MM2S_FULL_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] ";
  attribute srl_name of \data_reg[3][40]_srl4\ : label is "U0/\I_PRMRY_DATAMOVER/GEN_MM2S_FULL.I_MM2S_FULL_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][40]_srl4 ";
  attribute srl_bus_name of \data_reg[3][41]_srl4\ : label is "U0/\I_PRMRY_DATAMOVER/GEN_MM2S_FULL.I_MM2S_FULL_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] ";
  attribute srl_name of \data_reg[3][41]_srl4\ : label is "U0/\I_PRMRY_DATAMOVER/GEN_MM2S_FULL.I_MM2S_FULL_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][41]_srl4 ";
  attribute srl_bus_name of \data_reg[3][42]_srl4\ : label is "U0/\I_PRMRY_DATAMOVER/GEN_MM2S_FULL.I_MM2S_FULL_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] ";
  attribute srl_name of \data_reg[3][42]_srl4\ : label is "U0/\I_PRMRY_DATAMOVER/GEN_MM2S_FULL.I_MM2S_FULL_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][42]_srl4 ";
  attribute srl_bus_name of \data_reg[3][43]_srl4\ : label is "U0/\I_PRMRY_DATAMOVER/GEN_MM2S_FULL.I_MM2S_FULL_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] ";
  attribute srl_name of \data_reg[3][43]_srl4\ : label is "U0/\I_PRMRY_DATAMOVER/GEN_MM2S_FULL.I_MM2S_FULL_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][43]_srl4 ";
  attribute srl_bus_name of \data_reg[3][44]_srl4\ : label is "U0/\I_PRMRY_DATAMOVER/GEN_MM2S_FULL.I_MM2S_FULL_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] ";
  attribute srl_name of \data_reg[3][44]_srl4\ : label is "U0/\I_PRMRY_DATAMOVER/GEN_MM2S_FULL.I_MM2S_FULL_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][44]_srl4 ";
  attribute srl_bus_name of \data_reg[3][45]_srl4\ : label is "U0/\I_PRMRY_DATAMOVER/GEN_MM2S_FULL.I_MM2S_FULL_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] ";
  attribute srl_name of \data_reg[3][45]_srl4\ : label is "U0/\I_PRMRY_DATAMOVER/GEN_MM2S_FULL.I_MM2S_FULL_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][45]_srl4 ";
  attribute srl_bus_name of \data_reg[3][46]_srl4\ : label is "U0/\I_PRMRY_DATAMOVER/GEN_MM2S_FULL.I_MM2S_FULL_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] ";
  attribute srl_name of \data_reg[3][46]_srl4\ : label is "U0/\I_PRMRY_DATAMOVER/GEN_MM2S_FULL.I_MM2S_FULL_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][46]_srl4 ";
  attribute srl_bus_name of \data_reg[3][47]_srl4\ : label is "U0/\I_PRMRY_DATAMOVER/GEN_MM2S_FULL.I_MM2S_FULL_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] ";
  attribute srl_name of \data_reg[3][47]_srl4\ : label is "U0/\I_PRMRY_DATAMOVER/GEN_MM2S_FULL.I_MM2S_FULL_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][47]_srl4 ";
  attribute srl_bus_name of \data_reg[3][48]_srl4\ : label is "U0/\I_PRMRY_DATAMOVER/GEN_MM2S_FULL.I_MM2S_FULL_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] ";
  attribute srl_name of \data_reg[3][48]_srl4\ : label is "U0/\I_PRMRY_DATAMOVER/GEN_MM2S_FULL.I_MM2S_FULL_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][48]_srl4 ";
  attribute srl_bus_name of \data_reg[3][49]_srl4\ : label is "U0/\I_PRMRY_DATAMOVER/GEN_MM2S_FULL.I_MM2S_FULL_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] ";
  attribute srl_name of \data_reg[3][49]_srl4\ : label is "U0/\I_PRMRY_DATAMOVER/GEN_MM2S_FULL.I_MM2S_FULL_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][49]_srl4 ";
  attribute srl_bus_name of \data_reg[3][50]_srl4\ : label is "U0/\I_PRMRY_DATAMOVER/GEN_MM2S_FULL.I_MM2S_FULL_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] ";
  attribute srl_name of \data_reg[3][50]_srl4\ : label is "U0/\I_PRMRY_DATAMOVER/GEN_MM2S_FULL.I_MM2S_FULL_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][50]_srl4 ";
  attribute srl_bus_name of \data_reg[3][51]_srl4\ : label is "U0/\I_PRMRY_DATAMOVER/GEN_MM2S_FULL.I_MM2S_FULL_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] ";
  attribute srl_name of \data_reg[3][51]_srl4\ : label is "U0/\I_PRMRY_DATAMOVER/GEN_MM2S_FULL.I_MM2S_FULL_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][51]_srl4 ";
  attribute srl_bus_name of \data_reg[3][52]_srl4\ : label is "U0/\I_PRMRY_DATAMOVER/GEN_MM2S_FULL.I_MM2S_FULL_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] ";
  attribute srl_name of \data_reg[3][52]_srl4\ : label is "U0/\I_PRMRY_DATAMOVER/GEN_MM2S_FULL.I_MM2S_FULL_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][52]_srl4 ";
  attribute srl_bus_name of \data_reg[3][53]_srl4\ : label is "U0/\I_PRMRY_DATAMOVER/GEN_MM2S_FULL.I_MM2S_FULL_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] ";
  attribute srl_name of \data_reg[3][53]_srl4\ : label is "U0/\I_PRMRY_DATAMOVER/GEN_MM2S_FULL.I_MM2S_FULL_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][53]_srl4 ";
  attribute srl_bus_name of \data_reg[3][54]_srl4\ : label is "U0/\I_PRMRY_DATAMOVER/GEN_MM2S_FULL.I_MM2S_FULL_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] ";
  attribute srl_name of \data_reg[3][54]_srl4\ : label is "U0/\I_PRMRY_DATAMOVER/GEN_MM2S_FULL.I_MM2S_FULL_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][54]_srl4 ";
  attribute srl_bus_name of \data_reg[3][8]_srl4\ : label is "U0/\I_PRMRY_DATAMOVER/GEN_MM2S_FULL.I_MM2S_FULL_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] ";
  attribute srl_name of \data_reg[3][8]_srl4\ : label is "U0/\I_PRMRY_DATAMOVER/GEN_MM2S_FULL.I_MM2S_FULL_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][8]_srl4 ";
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \sig_next_addr_reg[31]_i_2\ : label is "soft_lutpair37";
  attribute SOFT_HLUTNM of sig_posted_to_axi_2_i_1 : label is "soft_lutpair37";
begin
  FIFO_Full_reg_0 <= \^fifo_full_reg_0\;
  \out\(36 downto 0) <= \^out\(36 downto 0);
  sig_halt_reg_reg <= \^sig_halt_reg_reg\;
\FIFO_Full_i_1__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"20020020"
    )
        port map (
      I0 => addr_i(1),
      I1 => \addr_i_reg_n_0_[2]\,
      I2 => \USE_SRL_FIFO.sig_wr_fifo_0\,
      I3 => \^sig_halt_reg_reg\,
      I4 => addr_i(0),
      O => fifo_full_p1
    );
FIFO_Full_reg: unisim.vcomponents.FDRE
     port map (
      C => m_axi_mm2s_aclk,
      CE => '1',
      D => fifo_full_p1,
      Q => \^fifo_full_reg_0\,
      R => SS(0)
    );
\FSM_onehot_sig_pcc_sm_state[6]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"040404040F0F0F00"
    )
        port map (
      I0 => \^fifo_full_reg_0\,
      I1 => \addr_i_reg[0]_0\,
      I2 => \sig_addr_cntr_lsh_im0_reg[0]\,
      I3 => \sig_addr_cntr_lsh_im0_reg[0]_0\,
      I4 => \USE_SRL_FIFO.sig_wr_fifo\,
      I5 => sig_mstr2addr_cmd_valid,
      O => FIFO_Full_reg_1
    );
\addr_i[0]_i_1__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"40BFBF40"
    )
        port map (
      I0 => \^fifo_full_reg_0\,
      I1 => sig_mstr2addr_cmd_valid,
      I2 => \addr_i_reg[0]_0\,
      I3 => \^sig_halt_reg_reg\,
      I4 => addr_i(0),
      O => addr_i_p1(0)
    );
\addr_i[1]_i_1__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9A9A9A9AA69A9A9A"
    )
        port map (
      I0 => addr_i(1),
      I1 => addr_i(0),
      I2 => \^sig_halt_reg_reg\,
      I3 => \addr_i_reg[0]_0\,
      I4 => sig_mstr2addr_cmd_valid,
      I5 => \^fifo_full_reg_0\,
      O => addr_i_p1(1)
    );
\addr_i[2]_i_1__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A6AAAABA"
    )
        port map (
      I0 => \addr_i_reg_n_0_[2]\,
      I1 => addr_i(0),
      I2 => \^sig_halt_reg_reg\,
      I3 => \USE_SRL_FIFO.sig_wr_fifo_0\,
      I4 => addr_i(1),
      O => addr_i_p1(2)
    );
\addr_i_reg[0]\: unisim.vcomponents.FDSE
     port map (
      C => m_axi_mm2s_aclk,
      CE => '1',
      D => addr_i_p1(0),
      Q => addr_i(0),
      S => SS(0)
    );
\addr_i_reg[1]\: unisim.vcomponents.FDSE
     port map (
      C => m_axi_mm2s_aclk,
      CE => '1',
      D => addr_i_p1(1),
      Q => addr_i(1),
      S => SS(0)
    );
\addr_i_reg[2]\: unisim.vcomponents.FDSE
     port map (
      C => m_axi_mm2s_aclk,
      CE => '1',
      D => addr_i_p1(2),
      Q => \addr_i_reg_n_0_[2]\,
      S => SS(0)
    );
\data_reg[3][11]_srl4\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => addr_i(0),
      A1 => addr_i(1),
      A2 => '0',
      A3 => '0',
      CE => \USE_SRL_FIFO.sig_wr_fifo_0\,
      CLK => m_axi_mm2s_aclk,
      D => \in\(34),
      Q => \^out\(35)
    );
\data_reg[3][12]_srl4\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => addr_i(0),
      A1 => addr_i(1),
      A2 => '0',
      A3 => '0',
      CE => \USE_SRL_FIFO.sig_wr_fifo_0\,
      CLK => m_axi_mm2s_aclk,
      D => '1',
      Q => \^out\(34)
    );
\data_reg[3][21]_srl4\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => addr_i(0),
      A1 => addr_i(1),
      A2 => '0',
      A3 => '0',
      CE => \USE_SRL_FIFO.sig_wr_fifo_0\,
      CLK => m_axi_mm2s_aclk,
      D => \in\(33),
      Q => \^out\(33)
    );
\data_reg[3][22]_srl4\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => addr_i(0),
      A1 => addr_i(1),
      A2 => '0',
      A3 => '0',
      CE => \USE_SRL_FIFO.sig_wr_fifo_0\,
      CLK => m_axi_mm2s_aclk,
      D => \in\(32),
      Q => \^out\(32)
    );
\data_reg[3][23]_srl4\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => addr_i(0),
      A1 => addr_i(1),
      A2 => '0',
      A3 => '0',
      CE => \USE_SRL_FIFO.sig_wr_fifo_0\,
      CLK => m_axi_mm2s_aclk,
      D => \in\(31),
      Q => \^out\(31)
    );
\data_reg[3][24]_srl4\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => addr_i(0),
      A1 => addr_i(1),
      A2 => '0',
      A3 => '0',
      CE => \USE_SRL_FIFO.sig_wr_fifo_0\,
      CLK => m_axi_mm2s_aclk,
      D => \in\(30),
      Q => \^out\(30)
    );
\data_reg[3][25]_srl4\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => addr_i(0),
      A1 => addr_i(1),
      A2 => '0',
      A3 => '0',
      CE => \USE_SRL_FIFO.sig_wr_fifo_0\,
      CLK => m_axi_mm2s_aclk,
      D => \in\(29),
      Q => \^out\(29)
    );
\data_reg[3][26]_srl4\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => addr_i(0),
      A1 => addr_i(1),
      A2 => '0',
      A3 => '0',
      CE => \USE_SRL_FIFO.sig_wr_fifo_0\,
      CLK => m_axi_mm2s_aclk,
      D => \in\(28),
      Q => \^out\(28)
    );
\data_reg[3][27]_srl4\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => addr_i(0),
      A1 => addr_i(1),
      A2 => '0',
      A3 => '0',
      CE => \USE_SRL_FIFO.sig_wr_fifo_0\,
      CLK => m_axi_mm2s_aclk,
      D => \in\(27),
      Q => \^out\(27)
    );
\data_reg[3][28]_srl4\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => addr_i(0),
      A1 => addr_i(1),
      A2 => '0',
      A3 => '0',
      CE => \USE_SRL_FIFO.sig_wr_fifo_0\,
      CLK => m_axi_mm2s_aclk,
      D => \in\(26),
      Q => \^out\(26)
    );
\data_reg[3][29]_srl4\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => addr_i(0),
      A1 => addr_i(1),
      A2 => '0',
      A3 => '0',
      CE => \USE_SRL_FIFO.sig_wr_fifo_0\,
      CLK => m_axi_mm2s_aclk,
      D => \in\(25),
      Q => \^out\(25)
    );
\data_reg[3][30]_srl4\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => addr_i(0),
      A1 => addr_i(1),
      A2 => '0',
      A3 => '0',
      CE => \USE_SRL_FIFO.sig_wr_fifo_0\,
      CLK => m_axi_mm2s_aclk,
      D => \in\(24),
      Q => \^out\(24)
    );
\data_reg[3][31]_srl4\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => addr_i(0),
      A1 => addr_i(1),
      A2 => '0',
      A3 => '0',
      CE => \USE_SRL_FIFO.sig_wr_fifo_0\,
      CLK => m_axi_mm2s_aclk,
      D => \in\(23),
      Q => \^out\(23)
    );
\data_reg[3][32]_srl4\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => addr_i(0),
      A1 => addr_i(1),
      A2 => '0',
      A3 => '0',
      CE => \USE_SRL_FIFO.sig_wr_fifo_0\,
      CLK => m_axi_mm2s_aclk,
      D => \in\(22),
      Q => \^out\(22)
    );
\data_reg[3][33]_srl4\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => addr_i(0),
      A1 => addr_i(1),
      A2 => '0',
      A3 => '0',
      CE => \USE_SRL_FIFO.sig_wr_fifo_0\,
      CLK => m_axi_mm2s_aclk,
      D => \in\(21),
      Q => \^out\(21)
    );
\data_reg[3][34]_srl4\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => addr_i(0),
      A1 => addr_i(1),
      A2 => '0',
      A3 => '0',
      CE => \USE_SRL_FIFO.sig_wr_fifo_0\,
      CLK => m_axi_mm2s_aclk,
      D => \in\(20),
      Q => \^out\(20)
    );
\data_reg[3][35]_srl4\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => addr_i(0),
      A1 => addr_i(1),
      A2 => '0',
      A3 => '0',
      CE => \USE_SRL_FIFO.sig_wr_fifo_0\,
      CLK => m_axi_mm2s_aclk,
      D => \in\(19),
      Q => \^out\(19)
    );
\data_reg[3][36]_srl4\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => addr_i(0),
      A1 => addr_i(1),
      A2 => '0',
      A3 => '0',
      CE => \USE_SRL_FIFO.sig_wr_fifo_0\,
      CLK => m_axi_mm2s_aclk,
      D => \in\(18),
      Q => \^out\(18)
    );
\data_reg[3][37]_srl4\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => addr_i(0),
      A1 => addr_i(1),
      A2 => '0',
      A3 => '0',
      CE => \USE_SRL_FIFO.sig_wr_fifo_0\,
      CLK => m_axi_mm2s_aclk,
      D => \in\(17),
      Q => \^out\(17)
    );
\data_reg[3][38]_srl4\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => addr_i(0),
      A1 => addr_i(1),
      A2 => '0',
      A3 => '0',
      CE => \USE_SRL_FIFO.sig_wr_fifo_0\,
      CLK => m_axi_mm2s_aclk,
      D => \in\(16),
      Q => \^out\(16)
    );
\data_reg[3][39]_srl4\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => addr_i(0),
      A1 => addr_i(1),
      A2 => '0',
      A3 => '0',
      CE => \USE_SRL_FIFO.sig_wr_fifo_0\,
      CLK => m_axi_mm2s_aclk,
      D => \in\(15),
      Q => \^out\(15)
    );
\data_reg[3][40]_srl4\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => addr_i(0),
      A1 => addr_i(1),
      A2 => '0',
      A3 => '0',
      CE => \USE_SRL_FIFO.sig_wr_fifo_0\,
      CLK => m_axi_mm2s_aclk,
      D => \in\(14),
      Q => \^out\(14)
    );
\data_reg[3][41]_srl4\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => addr_i(0),
      A1 => addr_i(1),
      A2 => '0',
      A3 => '0',
      CE => \USE_SRL_FIFO.sig_wr_fifo_0\,
      CLK => m_axi_mm2s_aclk,
      D => \in\(13),
      Q => \^out\(13)
    );
\data_reg[3][42]_srl4\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => addr_i(0),
      A1 => addr_i(1),
      A2 => '0',
      A3 => '0',
      CE => \USE_SRL_FIFO.sig_wr_fifo_0\,
      CLK => m_axi_mm2s_aclk,
      D => \in\(12),
      Q => \^out\(12)
    );
\data_reg[3][43]_srl4\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => addr_i(0),
      A1 => addr_i(1),
      A2 => '0',
      A3 => '0',
      CE => \USE_SRL_FIFO.sig_wr_fifo_0\,
      CLK => m_axi_mm2s_aclk,
      D => \in\(11),
      Q => \^out\(11)
    );
\data_reg[3][44]_srl4\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => addr_i(0),
      A1 => addr_i(1),
      A2 => '0',
      A3 => '0',
      CE => \USE_SRL_FIFO.sig_wr_fifo_0\,
      CLK => m_axi_mm2s_aclk,
      D => \in\(10),
      Q => \^out\(10)
    );
\data_reg[3][45]_srl4\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => addr_i(0),
      A1 => addr_i(1),
      A2 => '0',
      A3 => '0',
      CE => \USE_SRL_FIFO.sig_wr_fifo_0\,
      CLK => m_axi_mm2s_aclk,
      D => \in\(9),
      Q => \^out\(9)
    );
\data_reg[3][46]_srl4\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => addr_i(0),
      A1 => addr_i(1),
      A2 => '0',
      A3 => '0',
      CE => \USE_SRL_FIFO.sig_wr_fifo_0\,
      CLK => m_axi_mm2s_aclk,
      D => \in\(8),
      Q => \^out\(8)
    );
\data_reg[3][47]_srl4\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => addr_i(0),
      A1 => addr_i(1),
      A2 => '0',
      A3 => '0',
      CE => \USE_SRL_FIFO.sig_wr_fifo_0\,
      CLK => m_axi_mm2s_aclk,
      D => \in\(7),
      Q => \^out\(7)
    );
\data_reg[3][48]_srl4\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => addr_i(0),
      A1 => addr_i(1),
      A2 => '0',
      A3 => '0',
      CE => \USE_SRL_FIFO.sig_wr_fifo_0\,
      CLK => m_axi_mm2s_aclk,
      D => \in\(6),
      Q => \^out\(6)
    );
\data_reg[3][49]_srl4\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => addr_i(0),
      A1 => addr_i(1),
      A2 => '0',
      A3 => '0',
      CE => \USE_SRL_FIFO.sig_wr_fifo_0\,
      CLK => m_axi_mm2s_aclk,
      D => \in\(5),
      Q => \^out\(5)
    );
\data_reg[3][50]_srl4\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => addr_i(0),
      A1 => addr_i(1),
      A2 => '0',
      A3 => '0',
      CE => \USE_SRL_FIFO.sig_wr_fifo_0\,
      CLK => m_axi_mm2s_aclk,
      D => \in\(4),
      Q => \^out\(4)
    );
\data_reg[3][51]_srl4\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => addr_i(0),
      A1 => addr_i(1),
      A2 => '0',
      A3 => '0',
      CE => \USE_SRL_FIFO.sig_wr_fifo_0\,
      CLK => m_axi_mm2s_aclk,
      D => \in\(3),
      Q => \^out\(3)
    );
\data_reg[3][52]_srl4\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => addr_i(0),
      A1 => addr_i(1),
      A2 => '0',
      A3 => '0',
      CE => \USE_SRL_FIFO.sig_wr_fifo_0\,
      CLK => m_axi_mm2s_aclk,
      D => \in\(2),
      Q => \^out\(2)
    );
\data_reg[3][53]_srl4\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => addr_i(0),
      A1 => addr_i(1),
      A2 => '0',
      A3 => '0',
      CE => \USE_SRL_FIFO.sig_wr_fifo_0\,
      CLK => m_axi_mm2s_aclk,
      D => \in\(1),
      Q => \^out\(1)
    );
\data_reg[3][54]_srl4\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => addr_i(0),
      A1 => addr_i(1),
      A2 => '0',
      A3 => '0',
      CE => \USE_SRL_FIFO.sig_wr_fifo_0\,
      CLK => m_axi_mm2s_aclk,
      D => \in\(0),
      Q => \^out\(0)
    );
\data_reg[3][54]_srl4_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => \^fifo_full_reg_0\,
      I1 => sig_mstr2addr_cmd_valid,
      I2 => \addr_i_reg[0]_0\,
      O => \USE_SRL_FIFO.sig_wr_fifo_0\
    );
\data_reg[3][8]_srl4\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => addr_i(0),
      A1 => addr_i(1),
      A2 => '0',
      A3 => '0',
      CE => \USE_SRL_FIFO.sig_wr_fifo_0\,
      CLK => m_axi_mm2s_aclk,
      D => \in\(35),
      Q => \^out\(36)
    );
sig_addr_valid_reg_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^out\(36),
      O => sig_calc_error_reg_reg
    );
\sig_next_addr_reg[31]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0400"
    )
        port map (
      I0 => sig_data2addr_stop_req,
      I1 => sig_sf_allow_addr_req,
      I2 => \addr_i_reg_n_0_[2]\,
      I3 => sig_addr_reg_empty,
      O => \^sig_halt_reg_reg\
    );
sig_posted_to_axi_2_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00200000"
    )
        port map (
      I0 => sig_addr_reg_empty,
      I1 => \addr_i_reg_n_0_[2]\,
      I2 => sig_sf_allow_addr_req,
      I3 => sig_data2addr_stop_req,
      I4 => sig_mmap_rst_reg_n,
      O => sig_addr_reg_empty_reg
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_datamover_v5_1_37_srl_fifo__parameterized0\ is
  port (
    FIFO_Full_reg_0 : out STD_LOGIC;
    sig_mmap_rst_reg_n_reg : out STD_LOGIC;
    sig_dqual_reg_empty_reg : out STD_LOGIC;
    sig_cmd2data_valid_reg : out STD_LOGIC;
    SR : out STD_LOGIC_VECTOR ( 0 to 0 );
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    D : out STD_LOGIC_VECTOR ( 7 downto 0 );
    sig_mmap_rst_reg_n_reg_0 : out STD_LOGIC;
    sig_mmap_rst_reg_n_reg_1 : out STD_LOGIC;
    \out\ : out STD_LOGIC_VECTOR ( 35 downto 0 );
    SS : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_mm2s_aclk : in STD_LOGIC;
    sig_mmap_rst_reg_n : in STD_LOGIC;
    sig_first_dbeat : in STD_LOGIC;
    sig_first_dbeat_reg : in STD_LOGIC;
    \sig_dbeat_cntr_reg[0]\ : in STD_LOGIC;
    sig_mstr2data_cmd_valid : in STD_LOGIC;
    \addr_i_reg[1]_0\ : in STD_LOGIC;
    m_axi_mm2s_rlast : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 7 downto 0 );
    sig_last_dbeat_reg : in STD_LOGIC;
    \sig_dbeat_cntr_reg[6]\ : in STD_LOGIC;
    \sig_dbeat_cntr_reg[5]\ : in STD_LOGIC;
    sig_ld_new_cmd_reg : in STD_LOGIC;
    sig_dqual_reg_empty : in STD_LOGIC;
    sig_dqual_reg_empty_reg_0 : in STD_LOGIC;
    sig_dqual_reg_empty_reg_1 : in STD_LOGIC;
    m_axi_mm2s_rvalid : in STD_LOGIC;
    full : in STD_LOGIC;
    sig_dqual_reg_empty_reg_2 : in STD_LOGIC;
    sig_last_dbeat_reg_0 : in STD_LOGIC;
    sig_next_sequential_reg : in STD_LOGIC;
    sig_dqual_reg_empty_reg_3 : in STD_LOGIC_VECTOR ( 2 downto 0 );
    sig_next_calc_error_reg : in STD_LOGIC;
    sig_rsc2stat_status_valid : in STD_LOGIC;
    sig_stat2rsc_status_ready : in STD_LOGIC;
    \in\ : in STD_LOGIC_VECTOR ( 37 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_datamover_v5_1_37_srl_fifo__parameterized0\ : entity is "axi_datamover_v5_1_37_srl_fifo";
end \decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_datamover_v5_1_37_srl_fifo__parameterized0\;

architecture STRUCTURE of \decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_datamover_v5_1_37_srl_fifo__parameterized0\ is
  signal \^e\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \^fifo_full_reg_0\ : STD_LOGIC;
  signal addr_i : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal addr_i_p1 : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \addr_i_reg_n_0_[2]\ : STD_LOGIC;
  signal fifo_full_p1 : STD_LOGIC;
  signal \^sig_cmd2data_valid_reg\ : STD_LOGIC;
  signal sig_cmd_fifo_data_out : STD_LOGIC_VECTOR ( 9 downto 8 );
  signal \^sig_dqual_reg_empty_reg\ : STD_LOGIC;
  signal sig_last_dbeat_i_2_n_0 : STD_LOGIC;
  signal sig_last_dbeat_i_3_n_0 : STD_LOGIC;
  signal sig_next_cmd_cmplt_reg_i_4_n_0 : STD_LOGIC;
  signal sig_next_cmd_cmplt_reg_i_5_n_0 : STD_LOGIC;
  signal sig_next_cmd_cmplt_reg_i_6_n_0 : STD_LOGIC;
  signal sig_next_cmd_cmplt_reg_i_7_n_0 : STD_LOGIC;
  attribute srl_bus_name : string;
  attribute srl_bus_name of \data_reg[3][10]_srl4\ : label is "U0/\I_PRMRY_DATAMOVER/GEN_MM2S_FULL.I_MM2S_FULL_WRAPPER/I_RD_DATA_CNTL/GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] ";
  attribute srl_name : string;
  attribute srl_name of \data_reg[3][10]_srl4\ : label is "U0/\I_PRMRY_DATAMOVER/GEN_MM2S_FULL.I_MM2S_FULL_WRAPPER/I_RD_DATA_CNTL/GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][10]_srl4 ";
  attribute srl_bus_name of \data_reg[3][11]_srl4\ : label is "U0/\I_PRMRY_DATAMOVER/GEN_MM2S_FULL.I_MM2S_FULL_WRAPPER/I_RD_DATA_CNTL/GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] ";
  attribute srl_name of \data_reg[3][11]_srl4\ : label is "U0/\I_PRMRY_DATAMOVER/GEN_MM2S_FULL.I_MM2S_FULL_WRAPPER/I_RD_DATA_CNTL/GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][11]_srl4 ";
  attribute srl_bus_name of \data_reg[3][12]_srl4\ : label is "U0/\I_PRMRY_DATAMOVER/GEN_MM2S_FULL.I_MM2S_FULL_WRAPPER/I_RD_DATA_CNTL/GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] ";
  attribute srl_name of \data_reg[3][12]_srl4\ : label is "U0/\I_PRMRY_DATAMOVER/GEN_MM2S_FULL.I_MM2S_FULL_WRAPPER/I_RD_DATA_CNTL/GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][12]_srl4 ";
  attribute srl_bus_name of \data_reg[3][13]_srl4\ : label is "U0/\I_PRMRY_DATAMOVER/GEN_MM2S_FULL.I_MM2S_FULL_WRAPPER/I_RD_DATA_CNTL/GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] ";
  attribute srl_name of \data_reg[3][13]_srl4\ : label is "U0/\I_PRMRY_DATAMOVER/GEN_MM2S_FULL.I_MM2S_FULL_WRAPPER/I_RD_DATA_CNTL/GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][13]_srl4 ";
  attribute srl_bus_name of \data_reg[3][14]_srl4\ : label is "U0/\I_PRMRY_DATAMOVER/GEN_MM2S_FULL.I_MM2S_FULL_WRAPPER/I_RD_DATA_CNTL/GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] ";
  attribute srl_name of \data_reg[3][14]_srl4\ : label is "U0/\I_PRMRY_DATAMOVER/GEN_MM2S_FULL.I_MM2S_FULL_WRAPPER/I_RD_DATA_CNTL/GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][14]_srl4 ";
  attribute srl_bus_name of \data_reg[3][15]_srl4\ : label is "U0/\I_PRMRY_DATAMOVER/GEN_MM2S_FULL.I_MM2S_FULL_WRAPPER/I_RD_DATA_CNTL/GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] ";
  attribute srl_name of \data_reg[3][15]_srl4\ : label is "U0/\I_PRMRY_DATAMOVER/GEN_MM2S_FULL.I_MM2S_FULL_WRAPPER/I_RD_DATA_CNTL/GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][15]_srl4 ";
  attribute srl_bus_name of \data_reg[3][16]_srl4\ : label is "U0/\I_PRMRY_DATAMOVER/GEN_MM2S_FULL.I_MM2S_FULL_WRAPPER/I_RD_DATA_CNTL/GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] ";
  attribute srl_name of \data_reg[3][16]_srl4\ : label is "U0/\I_PRMRY_DATAMOVER/GEN_MM2S_FULL.I_MM2S_FULL_WRAPPER/I_RD_DATA_CNTL/GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][16]_srl4 ";
  attribute srl_bus_name of \data_reg[3][17]_srl4\ : label is "U0/\I_PRMRY_DATAMOVER/GEN_MM2S_FULL.I_MM2S_FULL_WRAPPER/I_RD_DATA_CNTL/GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] ";
  attribute srl_name of \data_reg[3][17]_srl4\ : label is "U0/\I_PRMRY_DATAMOVER/GEN_MM2S_FULL.I_MM2S_FULL_WRAPPER/I_RD_DATA_CNTL/GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][17]_srl4 ";
  attribute srl_bus_name of \data_reg[3][18]_srl4\ : label is "U0/\I_PRMRY_DATAMOVER/GEN_MM2S_FULL.I_MM2S_FULL_WRAPPER/I_RD_DATA_CNTL/GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] ";
  attribute srl_name of \data_reg[3][18]_srl4\ : label is "U0/\I_PRMRY_DATAMOVER/GEN_MM2S_FULL.I_MM2S_FULL_WRAPPER/I_RD_DATA_CNTL/GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][18]_srl4 ";
  attribute srl_bus_name of \data_reg[3][19]_srl4\ : label is "U0/\I_PRMRY_DATAMOVER/GEN_MM2S_FULL.I_MM2S_FULL_WRAPPER/I_RD_DATA_CNTL/GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] ";
  attribute srl_name of \data_reg[3][19]_srl4\ : label is "U0/\I_PRMRY_DATAMOVER/GEN_MM2S_FULL.I_MM2S_FULL_WRAPPER/I_RD_DATA_CNTL/GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][19]_srl4 ";
  attribute srl_bus_name of \data_reg[3][20]_srl4\ : label is "U0/\I_PRMRY_DATAMOVER/GEN_MM2S_FULL.I_MM2S_FULL_WRAPPER/I_RD_DATA_CNTL/GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] ";
  attribute srl_name of \data_reg[3][20]_srl4\ : label is "U0/\I_PRMRY_DATAMOVER/GEN_MM2S_FULL.I_MM2S_FULL_WRAPPER/I_RD_DATA_CNTL/GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][20]_srl4 ";
  attribute srl_bus_name of \data_reg[3][21]_srl4\ : label is "U0/\I_PRMRY_DATAMOVER/GEN_MM2S_FULL.I_MM2S_FULL_WRAPPER/I_RD_DATA_CNTL/GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] ";
  attribute srl_name of \data_reg[3][21]_srl4\ : label is "U0/\I_PRMRY_DATAMOVER/GEN_MM2S_FULL.I_MM2S_FULL_WRAPPER/I_RD_DATA_CNTL/GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][21]_srl4 ";
  attribute srl_bus_name of \data_reg[3][22]_srl4\ : label is "U0/\I_PRMRY_DATAMOVER/GEN_MM2S_FULL.I_MM2S_FULL_WRAPPER/I_RD_DATA_CNTL/GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] ";
  attribute srl_name of \data_reg[3][22]_srl4\ : label is "U0/\I_PRMRY_DATAMOVER/GEN_MM2S_FULL.I_MM2S_FULL_WRAPPER/I_RD_DATA_CNTL/GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][22]_srl4 ";
  attribute srl_bus_name of \data_reg[3][23]_srl4\ : label is "U0/\I_PRMRY_DATAMOVER/GEN_MM2S_FULL.I_MM2S_FULL_WRAPPER/I_RD_DATA_CNTL/GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] ";
  attribute srl_name of \data_reg[3][23]_srl4\ : label is "U0/\I_PRMRY_DATAMOVER/GEN_MM2S_FULL.I_MM2S_FULL_WRAPPER/I_RD_DATA_CNTL/GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][23]_srl4 ";
  attribute srl_bus_name of \data_reg[3][24]_srl4\ : label is "U0/\I_PRMRY_DATAMOVER/GEN_MM2S_FULL.I_MM2S_FULL_WRAPPER/I_RD_DATA_CNTL/GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] ";
  attribute srl_name of \data_reg[3][24]_srl4\ : label is "U0/\I_PRMRY_DATAMOVER/GEN_MM2S_FULL.I_MM2S_FULL_WRAPPER/I_RD_DATA_CNTL/GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][24]_srl4 ";
  attribute srl_bus_name of \data_reg[3][25]_srl4\ : label is "U0/\I_PRMRY_DATAMOVER/GEN_MM2S_FULL.I_MM2S_FULL_WRAPPER/I_RD_DATA_CNTL/GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] ";
  attribute srl_name of \data_reg[3][25]_srl4\ : label is "U0/\I_PRMRY_DATAMOVER/GEN_MM2S_FULL.I_MM2S_FULL_WRAPPER/I_RD_DATA_CNTL/GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][25]_srl4 ";
  attribute srl_bus_name of \data_reg[3][26]_srl4\ : label is "U0/\I_PRMRY_DATAMOVER/GEN_MM2S_FULL.I_MM2S_FULL_WRAPPER/I_RD_DATA_CNTL/GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] ";
  attribute srl_name of \data_reg[3][26]_srl4\ : label is "U0/\I_PRMRY_DATAMOVER/GEN_MM2S_FULL.I_MM2S_FULL_WRAPPER/I_RD_DATA_CNTL/GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][26]_srl4 ";
  attribute srl_bus_name of \data_reg[3][27]_srl4\ : label is "U0/\I_PRMRY_DATAMOVER/GEN_MM2S_FULL.I_MM2S_FULL_WRAPPER/I_RD_DATA_CNTL/GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] ";
  attribute srl_name of \data_reg[3][27]_srl4\ : label is "U0/\I_PRMRY_DATAMOVER/GEN_MM2S_FULL.I_MM2S_FULL_WRAPPER/I_RD_DATA_CNTL/GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][27]_srl4 ";
  attribute srl_bus_name of \data_reg[3][28]_srl4\ : label is "U0/\I_PRMRY_DATAMOVER/GEN_MM2S_FULL.I_MM2S_FULL_WRAPPER/I_RD_DATA_CNTL/GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] ";
  attribute srl_name of \data_reg[3][28]_srl4\ : label is "U0/\I_PRMRY_DATAMOVER/GEN_MM2S_FULL.I_MM2S_FULL_WRAPPER/I_RD_DATA_CNTL/GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][28]_srl4 ";
  attribute srl_bus_name of \data_reg[3][29]_srl4\ : label is "U0/\I_PRMRY_DATAMOVER/GEN_MM2S_FULL.I_MM2S_FULL_WRAPPER/I_RD_DATA_CNTL/GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] ";
  attribute srl_name of \data_reg[3][29]_srl4\ : label is "U0/\I_PRMRY_DATAMOVER/GEN_MM2S_FULL.I_MM2S_FULL_WRAPPER/I_RD_DATA_CNTL/GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][29]_srl4 ";
  attribute srl_bus_name of \data_reg[3][2]_srl4\ : label is "U0/\I_PRMRY_DATAMOVER/GEN_MM2S_FULL.I_MM2S_FULL_WRAPPER/I_RD_DATA_CNTL/GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] ";
  attribute srl_name of \data_reg[3][2]_srl4\ : label is "U0/\I_PRMRY_DATAMOVER/GEN_MM2S_FULL.I_MM2S_FULL_WRAPPER/I_RD_DATA_CNTL/GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][2]_srl4 ";
  attribute srl_bus_name of \data_reg[3][30]_srl4\ : label is "U0/\I_PRMRY_DATAMOVER/GEN_MM2S_FULL.I_MM2S_FULL_WRAPPER/I_RD_DATA_CNTL/GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] ";
  attribute srl_name of \data_reg[3][30]_srl4\ : label is "U0/\I_PRMRY_DATAMOVER/GEN_MM2S_FULL.I_MM2S_FULL_WRAPPER/I_RD_DATA_CNTL/GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][30]_srl4 ";
  attribute srl_bus_name of \data_reg[3][31]_srl4\ : label is "U0/\I_PRMRY_DATAMOVER/GEN_MM2S_FULL.I_MM2S_FULL_WRAPPER/I_RD_DATA_CNTL/GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] ";
  attribute srl_name of \data_reg[3][31]_srl4\ : label is "U0/\I_PRMRY_DATAMOVER/GEN_MM2S_FULL.I_MM2S_FULL_WRAPPER/I_RD_DATA_CNTL/GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][31]_srl4 ";
  attribute srl_bus_name of \data_reg[3][32]_srl4\ : label is "U0/\I_PRMRY_DATAMOVER/GEN_MM2S_FULL.I_MM2S_FULL_WRAPPER/I_RD_DATA_CNTL/GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] ";
  attribute srl_name of \data_reg[3][32]_srl4\ : label is "U0/\I_PRMRY_DATAMOVER/GEN_MM2S_FULL.I_MM2S_FULL_WRAPPER/I_RD_DATA_CNTL/GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][32]_srl4 ";
  attribute srl_bus_name of \data_reg[3][33]_srl4\ : label is "U0/\I_PRMRY_DATAMOVER/GEN_MM2S_FULL.I_MM2S_FULL_WRAPPER/I_RD_DATA_CNTL/GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] ";
  attribute srl_name of \data_reg[3][33]_srl4\ : label is "U0/\I_PRMRY_DATAMOVER/GEN_MM2S_FULL.I_MM2S_FULL_WRAPPER/I_RD_DATA_CNTL/GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][33]_srl4 ";
  attribute srl_bus_name of \data_reg[3][34]_srl4\ : label is "U0/\I_PRMRY_DATAMOVER/GEN_MM2S_FULL.I_MM2S_FULL_WRAPPER/I_RD_DATA_CNTL/GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] ";
  attribute srl_name of \data_reg[3][34]_srl4\ : label is "U0/\I_PRMRY_DATAMOVER/GEN_MM2S_FULL.I_MM2S_FULL_WRAPPER/I_RD_DATA_CNTL/GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][34]_srl4 ";
  attribute srl_bus_name of \data_reg[3][35]_srl4\ : label is "U0/\I_PRMRY_DATAMOVER/GEN_MM2S_FULL.I_MM2S_FULL_WRAPPER/I_RD_DATA_CNTL/GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] ";
  attribute srl_name of \data_reg[3][35]_srl4\ : label is "U0/\I_PRMRY_DATAMOVER/GEN_MM2S_FULL.I_MM2S_FULL_WRAPPER/I_RD_DATA_CNTL/GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][35]_srl4 ";
  attribute srl_bus_name of \data_reg[3][36]_srl4\ : label is "U0/\I_PRMRY_DATAMOVER/GEN_MM2S_FULL.I_MM2S_FULL_WRAPPER/I_RD_DATA_CNTL/GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] ";
  attribute srl_name of \data_reg[3][36]_srl4\ : label is "U0/\I_PRMRY_DATAMOVER/GEN_MM2S_FULL.I_MM2S_FULL_WRAPPER/I_RD_DATA_CNTL/GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][36]_srl4 ";
  attribute srl_bus_name of \data_reg[3][37]_srl4\ : label is "U0/\I_PRMRY_DATAMOVER/GEN_MM2S_FULL.I_MM2S_FULL_WRAPPER/I_RD_DATA_CNTL/GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] ";
  attribute srl_name of \data_reg[3][37]_srl4\ : label is "U0/\I_PRMRY_DATAMOVER/GEN_MM2S_FULL.I_MM2S_FULL_WRAPPER/I_RD_DATA_CNTL/GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][37]_srl4 ";
  attribute srl_bus_name of \data_reg[3][38]_srl4\ : label is "U0/\I_PRMRY_DATAMOVER/GEN_MM2S_FULL.I_MM2S_FULL_WRAPPER/I_RD_DATA_CNTL/GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] ";
  attribute srl_name of \data_reg[3][38]_srl4\ : label is "U0/\I_PRMRY_DATAMOVER/GEN_MM2S_FULL.I_MM2S_FULL_WRAPPER/I_RD_DATA_CNTL/GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][38]_srl4 ";
  attribute srl_bus_name of \data_reg[3][3]_srl4\ : label is "U0/\I_PRMRY_DATAMOVER/GEN_MM2S_FULL.I_MM2S_FULL_WRAPPER/I_RD_DATA_CNTL/GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] ";
  attribute srl_name of \data_reg[3][3]_srl4\ : label is "U0/\I_PRMRY_DATAMOVER/GEN_MM2S_FULL.I_MM2S_FULL_WRAPPER/I_RD_DATA_CNTL/GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][3]_srl4 ";
  attribute srl_bus_name of \data_reg[3][45]_srl4\ : label is "U0/\I_PRMRY_DATAMOVER/GEN_MM2S_FULL.I_MM2S_FULL_WRAPPER/I_RD_DATA_CNTL/GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] ";
  attribute srl_name of \data_reg[3][45]_srl4\ : label is "U0/\I_PRMRY_DATAMOVER/GEN_MM2S_FULL.I_MM2S_FULL_WRAPPER/I_RD_DATA_CNTL/GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][45]_srl4 ";
  attribute srl_bus_name of \data_reg[3][46]_srl4\ : label is "U0/\I_PRMRY_DATAMOVER/GEN_MM2S_FULL.I_MM2S_FULL_WRAPPER/I_RD_DATA_CNTL/GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] ";
  attribute srl_name of \data_reg[3][46]_srl4\ : label is "U0/\I_PRMRY_DATAMOVER/GEN_MM2S_FULL.I_MM2S_FULL_WRAPPER/I_RD_DATA_CNTL/GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][46]_srl4 ";
  attribute srl_bus_name of \data_reg[3][4]_srl4\ : label is "U0/\I_PRMRY_DATAMOVER/GEN_MM2S_FULL.I_MM2S_FULL_WRAPPER/I_RD_DATA_CNTL/GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] ";
  attribute srl_name of \data_reg[3][4]_srl4\ : label is "U0/\I_PRMRY_DATAMOVER/GEN_MM2S_FULL.I_MM2S_FULL_WRAPPER/I_RD_DATA_CNTL/GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][4]_srl4 ";
  attribute srl_bus_name of \data_reg[3][5]_srl4\ : label is "U0/\I_PRMRY_DATAMOVER/GEN_MM2S_FULL.I_MM2S_FULL_WRAPPER/I_RD_DATA_CNTL/GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] ";
  attribute srl_name of \data_reg[3][5]_srl4\ : label is "U0/\I_PRMRY_DATAMOVER/GEN_MM2S_FULL.I_MM2S_FULL_WRAPPER/I_RD_DATA_CNTL/GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][5]_srl4 ";
  attribute srl_bus_name of \data_reg[3][7]_srl4\ : label is "U0/\I_PRMRY_DATAMOVER/GEN_MM2S_FULL.I_MM2S_FULL_WRAPPER/I_RD_DATA_CNTL/GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] ";
  attribute srl_name of \data_reg[3][7]_srl4\ : label is "U0/\I_PRMRY_DATAMOVER/GEN_MM2S_FULL.I_MM2S_FULL_WRAPPER/I_RD_DATA_CNTL/GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][7]_srl4 ";
  attribute srl_bus_name of \data_reg[3][8]_srl4\ : label is "U0/\I_PRMRY_DATAMOVER/GEN_MM2S_FULL.I_MM2S_FULL_WRAPPER/I_RD_DATA_CNTL/GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] ";
  attribute srl_name of \data_reg[3][8]_srl4\ : label is "U0/\I_PRMRY_DATAMOVER/GEN_MM2S_FULL.I_MM2S_FULL_WRAPPER/I_RD_DATA_CNTL/GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][8]_srl4 ";
  attribute srl_bus_name of \data_reg[3][9]_srl4\ : label is "U0/\I_PRMRY_DATAMOVER/GEN_MM2S_FULL.I_MM2S_FULL_WRAPPER/I_RD_DATA_CNTL/GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] ";
  attribute srl_name of \data_reg[3][9]_srl4\ : label is "U0/\I_PRMRY_DATAMOVER/GEN_MM2S_FULL.I_MM2S_FULL_WRAPPER/I_RD_DATA_CNTL/GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][9]_srl4 ";
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \sig_dbeat_cntr[0]_i_1\ : label is "soft_lutpair115";
  attribute SOFT_HLUTNM of \sig_dbeat_cntr[1]_i_1\ : label is "soft_lutpair115";
  attribute SOFT_HLUTNM of \sig_dbeat_cntr[2]_i_1\ : label is "soft_lutpair113";
  attribute SOFT_HLUTNM of \sig_dbeat_cntr[3]_i_1\ : label is "soft_lutpair113";
  attribute SOFT_HLUTNM of \sig_dbeat_cntr[5]_i_1\ : label is "soft_lutpair116";
  attribute SOFT_HLUTNM of \sig_dbeat_cntr[6]_i_1\ : label is "soft_lutpair116";
  attribute SOFT_HLUTNM of \sig_dbeat_cntr[7]_i_1\ : label is "soft_lutpair112";
  attribute SOFT_HLUTNM of \sig_dbeat_cntr[7]_i_2\ : label is "soft_lutpair112";
  attribute SOFT_HLUTNM of sig_ld_new_cmd_reg_i_1 : label is "soft_lutpair114";
  attribute SOFT_HLUTNM of sig_next_cmd_cmplt_reg_i_1 : label is "soft_lutpair114";
begin
  E(0) <= \^e\(0);
  FIFO_Full_reg_0 <= \^fifo_full_reg_0\;
  sig_cmd2data_valid_reg <= \^sig_cmd2data_valid_reg\;
  sig_dqual_reg_empty_reg <= \^sig_dqual_reg_empty_reg\;
\FIFO_Full_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"41000400"
    )
        port map (
      I0 => \addr_i_reg_n_0_[2]\,
      I1 => \^sig_cmd2data_valid_reg\,
      I2 => \^sig_dqual_reg_empty_reg\,
      I3 => addr_i(1),
      I4 => addr_i(0),
      O => fifo_full_p1
    );
FIFO_Full_reg: unisim.vcomponents.FDRE
     port map (
      C => m_axi_mm2s_aclk,
      CE => '1',
      D => fifo_full_p1,
      Q => \^fifo_full_reg_0\,
      R => SS(0)
    );
\addr_i[0]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"08F7F708"
    )
        port map (
      I0 => sig_mstr2data_cmd_valid,
      I1 => \addr_i_reg[1]_0\,
      I2 => \^fifo_full_reg_0\,
      I3 => addr_i(0),
      I4 => \^sig_dqual_reg_empty_reg\,
      O => addr_i_p1(0)
    );
\addr_i[1]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9C9C9C9CC69C9C9C"
    )
        port map (
      I0 => addr_i(0),
      I1 => addr_i(1),
      I2 => \^sig_dqual_reg_empty_reg\,
      I3 => sig_mstr2data_cmd_valid,
      I4 => \addr_i_reg[1]_0\,
      I5 => \^fifo_full_reg_0\,
      O => addr_i_p1(1)
    );
\addr_i[2]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"9AAAAAAE"
    )
        port map (
      I0 => \addr_i_reg_n_0_[2]\,
      I1 => \^sig_dqual_reg_empty_reg\,
      I2 => addr_i(1),
      I3 => addr_i(0),
      I4 => \^sig_cmd2data_valid_reg\,
      O => addr_i_p1(2)
    );
\addr_i_reg[0]\: unisim.vcomponents.FDSE
     port map (
      C => m_axi_mm2s_aclk,
      CE => '1',
      D => addr_i_p1(0),
      Q => addr_i(0),
      S => SS(0)
    );
\addr_i_reg[1]\: unisim.vcomponents.FDSE
     port map (
      C => m_axi_mm2s_aclk,
      CE => '1',
      D => addr_i_p1(1),
      Q => addr_i(1),
      S => SS(0)
    );
\addr_i_reg[2]\: unisim.vcomponents.FDSE
     port map (
      C => m_axi_mm2s_aclk,
      CE => '1',
      D => addr_i_p1(2),
      Q => \addr_i_reg_n_0_[2]\,
      S => SS(0)
    );
\data_reg[3][10]_srl4\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => addr_i(0),
      A1 => addr_i(1),
      A2 => '0',
      A3 => '0',
      CE => \^sig_cmd2data_valid_reg\,
      CLK => m_axi_mm2s_aclk,
      D => \in\(30),
      Q => \out\(28)
    );
\data_reg[3][11]_srl4\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => addr_i(0),
      A1 => addr_i(1),
      A2 => '0',
      A3 => '0',
      CE => \^sig_cmd2data_valid_reg\,
      CLK => m_axi_mm2s_aclk,
      D => \in\(29),
      Q => \out\(27)
    );
\data_reg[3][12]_srl4\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => addr_i(0),
      A1 => addr_i(1),
      A2 => '0',
      A3 => '0',
      CE => \^sig_cmd2data_valid_reg\,
      CLK => m_axi_mm2s_aclk,
      D => \in\(28),
      Q => \out\(26)
    );
\data_reg[3][13]_srl4\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => addr_i(0),
      A1 => addr_i(1),
      A2 => '0',
      A3 => '0',
      CE => \^sig_cmd2data_valid_reg\,
      CLK => m_axi_mm2s_aclk,
      D => \in\(27),
      Q => \out\(25)
    );
\data_reg[3][14]_srl4\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => addr_i(0),
      A1 => addr_i(1),
      A2 => '0',
      A3 => '0',
      CE => \^sig_cmd2data_valid_reg\,
      CLK => m_axi_mm2s_aclk,
      D => \in\(26),
      Q => \out\(24)
    );
\data_reg[3][15]_srl4\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => addr_i(0),
      A1 => addr_i(1),
      A2 => '0',
      A3 => '0',
      CE => \^sig_cmd2data_valid_reg\,
      CLK => m_axi_mm2s_aclk,
      D => \in\(25),
      Q => \out\(23)
    );
\data_reg[3][16]_srl4\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => addr_i(0),
      A1 => addr_i(1),
      A2 => '0',
      A3 => '0',
      CE => \^sig_cmd2data_valid_reg\,
      CLK => m_axi_mm2s_aclk,
      D => \in\(24),
      Q => \out\(22)
    );
\data_reg[3][17]_srl4\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => addr_i(0),
      A1 => addr_i(1),
      A2 => '0',
      A3 => '0',
      CE => \^sig_cmd2data_valid_reg\,
      CLK => m_axi_mm2s_aclk,
      D => \in\(23),
      Q => \out\(21)
    );
\data_reg[3][18]_srl4\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => addr_i(0),
      A1 => addr_i(1),
      A2 => '0',
      A3 => '0',
      CE => \^sig_cmd2data_valid_reg\,
      CLK => m_axi_mm2s_aclk,
      D => \in\(22),
      Q => \out\(20)
    );
\data_reg[3][19]_srl4\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => addr_i(0),
      A1 => addr_i(1),
      A2 => '0',
      A3 => '0',
      CE => \^sig_cmd2data_valid_reg\,
      CLK => m_axi_mm2s_aclk,
      D => \in\(21),
      Q => \out\(19)
    );
\data_reg[3][20]_srl4\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => addr_i(0),
      A1 => addr_i(1),
      A2 => '0',
      A3 => '0',
      CE => \^sig_cmd2data_valid_reg\,
      CLK => m_axi_mm2s_aclk,
      D => \in\(20),
      Q => \out\(18)
    );
\data_reg[3][21]_srl4\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => addr_i(0),
      A1 => addr_i(1),
      A2 => '0',
      A3 => '0',
      CE => \^sig_cmd2data_valid_reg\,
      CLK => m_axi_mm2s_aclk,
      D => \in\(19),
      Q => \out\(17)
    );
\data_reg[3][22]_srl4\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => addr_i(0),
      A1 => addr_i(1),
      A2 => '0',
      A3 => '0',
      CE => \^sig_cmd2data_valid_reg\,
      CLK => m_axi_mm2s_aclk,
      D => \in\(18),
      Q => \out\(16)
    );
\data_reg[3][23]_srl4\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => addr_i(0),
      A1 => addr_i(1),
      A2 => '0',
      A3 => '0',
      CE => \^sig_cmd2data_valid_reg\,
      CLK => m_axi_mm2s_aclk,
      D => \in\(17),
      Q => \out\(15)
    );
\data_reg[3][24]_srl4\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => addr_i(0),
      A1 => addr_i(1),
      A2 => '0',
      A3 => '0',
      CE => \^sig_cmd2data_valid_reg\,
      CLK => m_axi_mm2s_aclk,
      D => \in\(16),
      Q => \out\(14)
    );
\data_reg[3][25]_srl4\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => addr_i(0),
      A1 => addr_i(1),
      A2 => '0',
      A3 => '0',
      CE => \^sig_cmd2data_valid_reg\,
      CLK => m_axi_mm2s_aclk,
      D => \in\(15),
      Q => \out\(13)
    );
\data_reg[3][26]_srl4\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => addr_i(0),
      A1 => addr_i(1),
      A2 => '0',
      A3 => '0',
      CE => \^sig_cmd2data_valid_reg\,
      CLK => m_axi_mm2s_aclk,
      D => \in\(14),
      Q => \out\(12)
    );
\data_reg[3][27]_srl4\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => addr_i(0),
      A1 => addr_i(1),
      A2 => '0',
      A3 => '0',
      CE => \^sig_cmd2data_valid_reg\,
      CLK => m_axi_mm2s_aclk,
      D => \in\(13),
      Q => \out\(11)
    );
\data_reg[3][28]_srl4\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => addr_i(0),
      A1 => addr_i(1),
      A2 => '0',
      A3 => '0',
      CE => \^sig_cmd2data_valid_reg\,
      CLK => m_axi_mm2s_aclk,
      D => \in\(12),
      Q => \out\(10)
    );
\data_reg[3][29]_srl4\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => addr_i(0),
      A1 => addr_i(1),
      A2 => '0',
      A3 => '0',
      CE => \^sig_cmd2data_valid_reg\,
      CLK => m_axi_mm2s_aclk,
      D => \in\(11),
      Q => \out\(9)
    );
\data_reg[3][2]_srl4\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => addr_i(0),
      A1 => addr_i(1),
      A2 => '0',
      A3 => '0',
      CE => \^sig_cmd2data_valid_reg\,
      CLK => m_axi_mm2s_aclk,
      D => \in\(37),
      Q => \out\(35)
    );
\data_reg[3][30]_srl4\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => addr_i(0),
      A1 => addr_i(1),
      A2 => '0',
      A3 => '0',
      CE => \^sig_cmd2data_valid_reg\,
      CLK => m_axi_mm2s_aclk,
      D => \in\(10),
      Q => \out\(8)
    );
\data_reg[3][31]_srl4\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => addr_i(0),
      A1 => addr_i(1),
      A2 => '0',
      A3 => '0',
      CE => \^sig_cmd2data_valid_reg\,
      CLK => m_axi_mm2s_aclk,
      D => \in\(9),
      Q => \out\(7)
    );
\data_reg[3][32]_srl4\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => addr_i(0),
      A1 => addr_i(1),
      A2 => '0',
      A3 => '0',
      CE => \^sig_cmd2data_valid_reg\,
      CLK => m_axi_mm2s_aclk,
      D => \in\(8),
      Q => \out\(6)
    );
\data_reg[3][33]_srl4\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => addr_i(0),
      A1 => addr_i(1),
      A2 => '0',
      A3 => '0',
      CE => \^sig_cmd2data_valid_reg\,
      CLK => m_axi_mm2s_aclk,
      D => \in\(7),
      Q => \out\(5)
    );
\data_reg[3][34]_srl4\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => addr_i(0),
      A1 => addr_i(1),
      A2 => '0',
      A3 => '0',
      CE => \^sig_cmd2data_valid_reg\,
      CLK => m_axi_mm2s_aclk,
      D => \in\(6),
      Q => \out\(4)
    );
\data_reg[3][35]_srl4\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => addr_i(0),
      A1 => addr_i(1),
      A2 => '0',
      A3 => '0',
      CE => \^sig_cmd2data_valid_reg\,
      CLK => m_axi_mm2s_aclk,
      D => \in\(5),
      Q => \out\(3)
    );
\data_reg[3][36]_srl4\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => addr_i(0),
      A1 => addr_i(1),
      A2 => '0',
      A3 => '0',
      CE => \^sig_cmd2data_valid_reg\,
      CLK => m_axi_mm2s_aclk,
      D => \in\(4),
      Q => \out\(2)
    );
\data_reg[3][37]_srl4\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => addr_i(0),
      A1 => addr_i(1),
      A2 => '0',
      A3 => '0',
      CE => \^sig_cmd2data_valid_reg\,
      CLK => m_axi_mm2s_aclk,
      D => \in\(3),
      Q => \out\(1)
    );
\data_reg[3][38]_srl4\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => addr_i(0),
      A1 => addr_i(1),
      A2 => '0',
      A3 => '0',
      CE => \^sig_cmd2data_valid_reg\,
      CLK => m_axi_mm2s_aclk,
      D => \in\(2),
      Q => \out\(0)
    );
\data_reg[3][3]_srl4\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => addr_i(0),
      A1 => addr_i(1),
      A2 => '0',
      A3 => '0',
      CE => \^sig_cmd2data_valid_reg\,
      CLK => m_axi_mm2s_aclk,
      D => \in\(36),
      Q => \out\(34)
    );
\data_reg[3][45]_srl4\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => addr_i(0),
      A1 => addr_i(1),
      A2 => '0',
      A3 => '0',
      CE => \^sig_cmd2data_valid_reg\,
      CLK => m_axi_mm2s_aclk,
      D => \in\(1),
      Q => sig_cmd_fifo_data_out(9)
    );
\data_reg[3][46]_srl4\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => addr_i(0),
      A1 => addr_i(1),
      A2 => '0',
      A3 => '0',
      CE => \^sig_cmd2data_valid_reg\,
      CLK => m_axi_mm2s_aclk,
      D => \in\(0),
      Q => sig_cmd_fifo_data_out(8)
    );
\data_reg[3][46]_srl4_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => sig_mstr2data_cmd_valid,
      I1 => \addr_i_reg[1]_0\,
      I2 => \^fifo_full_reg_0\,
      O => \^sig_cmd2data_valid_reg\
    );
\data_reg[3][4]_srl4\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => addr_i(0),
      A1 => addr_i(1),
      A2 => '0',
      A3 => '0',
      CE => \^sig_cmd2data_valid_reg\,
      CLK => m_axi_mm2s_aclk,
      D => \in\(35),
      Q => \out\(33)
    );
\data_reg[3][5]_srl4\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => addr_i(0),
      A1 => addr_i(1),
      A2 => '0',
      A3 => '0',
      CE => \^sig_cmd2data_valid_reg\,
      CLK => m_axi_mm2s_aclk,
      D => \in\(34),
      Q => \out\(32)
    );
\data_reg[3][7]_srl4\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => addr_i(0),
      A1 => addr_i(1),
      A2 => '0',
      A3 => '0',
      CE => \^sig_cmd2data_valid_reg\,
      CLK => m_axi_mm2s_aclk,
      D => \in\(33),
      Q => \out\(31)
    );
\data_reg[3][8]_srl4\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => addr_i(0),
      A1 => addr_i(1),
      A2 => '0',
      A3 => '0',
      CE => \^sig_cmd2data_valid_reg\,
      CLK => m_axi_mm2s_aclk,
      D => \in\(32),
      Q => \out\(30)
    );
\data_reg[3][9]_srl4\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => addr_i(0),
      A1 => addr_i(1),
      A2 => '0',
      A3 => '0',
      CE => \^sig_cmd2data_valid_reg\,
      CLK => m_axi_mm2s_aclk,
      D => \in\(31),
      Q => \out\(29)
    );
\sig_dbeat_cntr[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"8B"
    )
        port map (
      I0 => sig_cmd_fifo_data_out(8),
      I1 => \^sig_dqual_reg_empty_reg\,
      I2 => Q(0),
      O => D(0)
    );
\sig_dbeat_cntr[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F909"
    )
        port map (
      I0 => Q(1),
      I1 => Q(0),
      I2 => \^sig_dqual_reg_empty_reg\,
      I3 => sig_cmd_fifo_data_out(9),
      O => D(1)
    );
\sig_dbeat_cntr[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"5401"
    )
        port map (
      I0 => \^sig_dqual_reg_empty_reg\,
      I1 => Q(1),
      I2 => Q(0),
      I3 => Q(2),
      O => D(2)
    );
\sig_dbeat_cntr[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"55540001"
    )
        port map (
      I0 => \^sig_dqual_reg_empty_reg\,
      I1 => Q(2),
      I2 => Q(0),
      I3 => Q(1),
      I4 => Q(3),
      O => D(3)
    );
\sig_dbeat_cntr[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"5555555400000001"
    )
        port map (
      I0 => \^sig_dqual_reg_empty_reg\,
      I1 => Q(3),
      I2 => Q(1),
      I3 => Q(0),
      I4 => Q(2),
      I5 => Q(4),
      O => D(4)
    );
\sig_dbeat_cntr[5]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"41"
    )
        port map (
      I0 => \^sig_dqual_reg_empty_reg\,
      I1 => \sig_dbeat_cntr_reg[5]\,
      I2 => Q(5),
      O => D(5)
    );
\sig_dbeat_cntr[6]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"41"
    )
        port map (
      I0 => \^sig_dqual_reg_empty_reg\,
      I1 => \sig_dbeat_cntr_reg[6]\,
      I2 => Q(6),
      O => D(6)
    );
\sig_dbeat_cntr[7]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFAAA8"
    )
        port map (
      I0 => \sig_dbeat_cntr_reg[0]\,
      I1 => Q(6),
      I2 => \sig_dbeat_cntr_reg[6]\,
      I3 => Q(7),
      I4 => \^sig_dqual_reg_empty_reg\,
      O => \^e\(0)
    );
\sig_dbeat_cntr[7]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"5401"
    )
        port map (
      I0 => \^sig_dqual_reg_empty_reg\,
      I1 => Q(6),
      I2 => \sig_dbeat_cntr_reg[6]\,
      I3 => Q(7),
      O => D(7)
    );
sig_first_dbeat_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"222200A02222A0A0"
    )
        port map (
      I0 => sig_mmap_rst_reg_n,
      I1 => sig_last_dbeat_i_2_n_0,
      I2 => sig_first_dbeat,
      I3 => sig_first_dbeat_reg,
      I4 => \^sig_dqual_reg_empty_reg\,
      I5 => \sig_dbeat_cntr_reg[0]\,
      O => sig_mmap_rst_reg_n_reg
    );
sig_last_dbeat_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F8FFF0F0F800F0F0"
    )
        port map (
      I0 => \^sig_dqual_reg_empty_reg\,
      I1 => sig_last_dbeat_i_2_n_0,
      I2 => sig_last_dbeat_i_3_n_0,
      I3 => \^e\(0),
      I4 => sig_mmap_rst_reg_n,
      I5 => sig_last_dbeat_reg_0,
      O => sig_mmap_rst_reg_n_reg_1
    );
sig_last_dbeat_i_2: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => sig_cmd_fifo_data_out(8),
      I1 => sig_cmd_fifo_data_out(9),
      O => sig_last_dbeat_i_2_n_0
    );
sig_last_dbeat_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000040000000"
    )
        port map (
      I0 => Q(1),
      I1 => Q(0),
      I2 => sig_mmap_rst_reg_n,
      I3 => sig_last_dbeat_reg,
      I4 => \sig_dbeat_cntr_reg[0]\,
      I5 => \^sig_dqual_reg_empty_reg\,
      O => sig_last_dbeat_i_3_n_0
    );
sig_ld_new_cmd_reg_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"20"
    )
        port map (
      I0 => sig_mmap_rst_reg_n,
      I1 => sig_ld_new_cmd_reg,
      I2 => \^sig_dqual_reg_empty_reg\,
      O => sig_mmap_rst_reg_n_reg_0
    );
sig_next_cmd_cmplt_reg_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"40FF"
    )
        port map (
      I0 => \^sig_dqual_reg_empty_reg\,
      I1 => \sig_dbeat_cntr_reg[0]\,
      I2 => m_axi_mm2s_rlast,
      I3 => sig_mmap_rst_reg_n,
      O => SR(0)
    );
sig_next_cmd_cmplt_reg_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4440404040404040"
    )
        port map (
      I0 => sig_next_cmd_cmplt_reg_i_4_n_0,
      I1 => sig_next_cmd_cmplt_reg_i_5_n_0,
      I2 => sig_dqual_reg_empty,
      I3 => sig_next_cmd_cmplt_reg_i_6_n_0,
      I4 => sig_dqual_reg_empty_reg_0,
      I5 => sig_next_cmd_cmplt_reg_i_7_n_0,
      O => \^sig_dqual_reg_empty_reg\
    );
sig_next_cmd_cmplt_reg_i_4: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => sig_dqual_reg_empty_reg_3(2),
      I1 => sig_dqual_reg_empty_reg_3(1),
      I2 => sig_dqual_reg_empty_reg_3(0),
      O => sig_next_cmd_cmplt_reg_i_4_n_0
    );
sig_next_cmd_cmplt_reg_i_5: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1101"
    )
        port map (
      I0 => sig_next_calc_error_reg,
      I1 => \addr_i_reg_n_0_[2]\,
      I2 => sig_rsc2stat_status_valid,
      I3 => sig_stat2rsc_status_ready,
      O => sig_next_cmd_cmplt_reg_i_5_n_0
    );
sig_next_cmd_cmplt_reg_i_6: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => sig_last_dbeat_reg_0,
      I1 => sig_next_sequential_reg,
      O => sig_next_cmd_cmplt_reg_i_6_n_0
    );
sig_next_cmd_cmplt_reg_i_7: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4404"
    )
        port map (
      I0 => sig_dqual_reg_empty_reg_1,
      I1 => m_axi_mm2s_rvalid,
      I2 => full,
      I3 => sig_dqual_reg_empty_reg_2,
      O => sig_next_cmd_cmplt_reg_i_7_n_0
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_datamover_v5_1_37_srl_fifo__parameterized1\ is
  port (
    FIFO_Full_reg_0 : out STD_LOGIC;
    Q : out STD_LOGIC_VECTOR ( 0 to 0 );
    sig_inhibit_rdy_n_reg : out STD_LOGIC;
    SS : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_mm2s_aclk : in STD_LOGIC;
    \OMIT_UNPACKING.lsig_ld_cmd\ : in STD_LOGIC;
    \addr_i_reg[0]_0\ : in STD_LOGIC;
    sig_mstr2sf_cmd_valid : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_datamover_v5_1_37_srl_fifo__parameterized1\ : entity is "axi_datamover_v5_1_37_srl_fifo";
end \decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_datamover_v5_1_37_srl_fifo__parameterized1\;

architecture STRUCTURE of \decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_datamover_v5_1_37_srl_fifo__parameterized1\ is
  signal \^fifo_full_reg_0\ : STD_LOGIC;
  signal \^q\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal addr_i : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal addr_i_p1 : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal fifo_full_p1 : STD_LOGIC;
  signal \^sig_inhibit_rdy_n_reg\ : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \addr_i[0]_i_1\ : label is "soft_lutpair33";
  attribute SOFT_HLUTNM of \addr_i[2]_i_2\ : label is "soft_lutpair33";
begin
  FIFO_Full_reg_0 <= \^fifo_full_reg_0\;
  Q(0) <= \^q\(0);
  sig_inhibit_rdy_n_reg <= \^sig_inhibit_rdy_n_reg\;
FIFO_Full_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"41100000"
    )
        port map (
      I0 => \^q\(0),
      I1 => \OMIT_UNPACKING.lsig_ld_cmd\,
      I2 => \^sig_inhibit_rdy_n_reg\,
      I3 => addr_i(0),
      I4 => addr_i(1),
      O => fifo_full_p1
    );
FIFO_Full_reg: unisim.vcomponents.FDRE
     port map (
      C => m_axi_mm2s_aclk,
      CE => '1',
      D => fifo_full_p1,
      Q => \^fifo_full_reg_0\,
      R => SS(0)
    );
\addr_i[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"5595AA6A"
    )
        port map (
      I0 => \OMIT_UNPACKING.lsig_ld_cmd\,
      I1 => \addr_i_reg[0]_0\,
      I2 => sig_mstr2sf_cmd_valid,
      I3 => \^fifo_full_reg_0\,
      I4 => addr_i(0),
      O => addr_i_p1(0)
    );
\addr_i[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAA9AAA6666A666"
    )
        port map (
      I0 => addr_i(1),
      I1 => \OMIT_UNPACKING.lsig_ld_cmd\,
      I2 => \addr_i_reg[0]_0\,
      I3 => sig_mstr2sf_cmd_valid,
      I4 => \^fifo_full_reg_0\,
      I5 => addr_i(0),
      O => addr_i_p1(1)
    );
\addr_i[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAB6AAA"
    )
        port map (
      I0 => \^q\(0),
      I1 => addr_i(0),
      I2 => addr_i(1),
      I3 => \^sig_inhibit_rdy_n_reg\,
      I4 => \OMIT_UNPACKING.lsig_ld_cmd\,
      O => addr_i_p1(2)
    );
\addr_i[2]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => \addr_i_reg[0]_0\,
      I1 => sig_mstr2sf_cmd_valid,
      I2 => \^fifo_full_reg_0\,
      O => \^sig_inhibit_rdy_n_reg\
    );
\addr_i_reg[0]\: unisim.vcomponents.FDSE
     port map (
      C => m_axi_mm2s_aclk,
      CE => '1',
      D => addr_i_p1(0),
      Q => addr_i(0),
      S => SS(0)
    );
\addr_i_reg[1]\: unisim.vcomponents.FDSE
     port map (
      C => m_axi_mm2s_aclk,
      CE => '1',
      D => addr_i_p1(1),
      Q => addr_i(1),
      S => SS(0)
    );
\addr_i_reg[2]\: unisim.vcomponents.FDSE
     port map (
      C => m_axi_mm2s_aclk,
      CE => '1',
      D => addr_i_p1(2),
      Q => \^q\(0),
      S => SS(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_dma_lite_if is
  port (
    s_axi_lite_wready : out STD_LOGIC;
    rdy : out STD_LOGIC;
    s_axi_lite_arready : out STD_LOGIC;
    axi2ip_wrce : out STD_LOGIC_VECTOR ( 1 downto 0 );
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    p_0_in1_in : out STD_LOGIC;
    s_axi_lite_bvalid : out STD_LOGIC;
    \GEN_SYNC_READ.s_axi_lite_rvalid_i_reg_0\ : out STD_LOGIC;
    buffer_length_wren0 : out STD_LOGIC;
    SS : out STD_LOGIC_VECTOR ( 0 to 0 );
    \GEN_SYNC_READ.axi2ip_rdaddr_reg[9]_0\ : out STD_LOGIC;
    \GEN_SYNC_READ.axi2ip_rdaddr_reg[7]_0\ : out STD_LOGIC;
    \GEN_SYNC_READ.axi2ip_rdaddr_reg[9]_1\ : out STD_LOGIC;
    \GEN_SYNC_READ.axi2ip_rdaddr_reg[9]_2\ : out STD_LOGIC;
    \GEN_SYNC_READ.axi2ip_rdaddr_reg[9]_3\ : out STD_LOGIC;
    \GEN_SYNC_READ.axi2ip_rdaddr_reg[9]_4\ : out STD_LOGIC;
    s_axi_lite_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_lite_aclk : in STD_LOGIC;
    SR : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_lite_awvalid : in STD_LOGIC;
    s_axi_lite_wvalid : in STD_LOGIC;
    s_axi_lite_arvalid : in STD_LOGIC;
    \GEN_SYNC_WRITE.axi2ip_wrce_reg[10]_0\ : in STD_LOGIC;
    s_axi_lite_wdata : in STD_LOGIC_VECTOR ( 21 downto 0 );
    \out\ : in STD_LOGIC;
    D : in STD_LOGIC_VECTOR ( 25 downto 0 );
    Q : in STD_LOGIC_VECTOR ( 5 downto 0 );
    \GEN_SYNC_READ.s_axi_lite_rdata_reg[4]_0\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    \GEN_SYNC_READ.s_axi_lite_rdata_reg[12]_0\ : in STD_LOGIC_VECTOR ( 4 downto 0 );
    \GEN_SYNC_READ.s_axi_lite_rdata_reg[4]_1\ : in STD_LOGIC;
    \GEN_SYNC_READ.s_axi_lite_rdata_reg[12]_1\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    \GEN_SYNC_READ.s_axi_lite_rdata_reg[12]_2\ : in STD_LOGIC;
    \GEN_SYNC_READ.s_axi_lite_rdata_reg[0]_0\ : in STD_LOGIC;
    mm2s_dmasr : in STD_LOGIC_VECTOR ( 0 to 0 );
    \GEN_SYNC_READ.s_axi_lite_rdata_reg[1]_0\ : in STD_LOGIC;
    \GEN_SYNC_READ.s_axi_lite_rdata_reg[5]_0\ : in STD_LOGIC;
    \GEN_SYNC_WRITE.rdy_reg_0\ : in STD_LOGIC;
    s_axi_lite_bready : in STD_LOGIC;
    s_axi_lite_rready : in STD_LOGIC;
    s_axi_lite_awaddr : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_lite_araddr : in STD_LOGIC_VECTOR ( 9 downto 0 )
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_dma_lite_if;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_dma_lite_if is
  signal \GEN_REG_FOR_SMPL.buffer_length_wren_i_2_n_0\ : STD_LOGIC;
  signal \GEN_REG_FOR_SMPL.buffer_length_wren_i_3_n_0\ : STD_LOGIC;
  signal \GEN_REG_FOR_SMPL.buffer_length_wren_i_4_n_0\ : STD_LOGIC;
  signal \^gen_sync_read.axi2ip_rdaddr_reg[7]_0\ : STD_LOGIC;
  signal \^gen_sync_read.axi2ip_rdaddr_reg[9]_0\ : STD_LOGIC;
  signal \^gen_sync_read.axi2ip_rdaddr_reg[9]_2\ : STD_LOGIC;
  signal \^gen_sync_read.axi2ip_rdaddr_reg[9]_3\ : STD_LOGIC;
  signal \GEN_SYNC_READ.s_axi_lite_rdata[0]_i_2_n_0\ : STD_LOGIC;
  signal \GEN_SYNC_READ.s_axi_lite_rdata[12]_i_2_n_0\ : STD_LOGIC;
  signal \GEN_SYNC_READ.s_axi_lite_rdata[1]_i_2_n_0\ : STD_LOGIC;
  signal \GEN_SYNC_READ.s_axi_lite_rdata[1]_i_3_n_0\ : STD_LOGIC;
  signal \GEN_SYNC_READ.s_axi_lite_rdata[1]_i_4_n_0\ : STD_LOGIC;
  signal \GEN_SYNC_READ.s_axi_lite_rdata[1]_i_5_n_0\ : STD_LOGIC;
  signal \GEN_SYNC_READ.s_axi_lite_rdata[1]_i_6_n_0\ : STD_LOGIC;
  signal \GEN_SYNC_READ.s_axi_lite_rdata[1]_i_7_n_0\ : STD_LOGIC;
  signal \GEN_SYNC_READ.s_axi_lite_rdata[1]_i_8_n_0\ : STD_LOGIC;
  signal \GEN_SYNC_READ.s_axi_lite_rdata[31]_i_1_n_0\ : STD_LOGIC;
  signal \GEN_SYNC_READ.s_axi_lite_rdata[31]_i_5_n_0\ : STD_LOGIC;
  signal \GEN_SYNC_READ.s_axi_lite_rdata[31]_i_6_n_0\ : STD_LOGIC;
  signal \GEN_SYNC_READ.s_axi_lite_rdata[4]_i_2_n_0\ : STD_LOGIC;
  signal \GEN_SYNC_READ.s_axi_lite_rdata[5]_i_2_n_0\ : STD_LOGIC;
  signal \GEN_SYNC_READ.s_axi_lite_rvalid_i_i_1_n_0\ : STD_LOGIC;
  signal \^gen_sync_read.s_axi_lite_rvalid_i_reg_0\ : STD_LOGIC;
  signal \GEN_SYNC_WRITE.awvalid_d1_i_1_n_0\ : STD_LOGIC;
  signal \GEN_SYNC_WRITE.axi2ip_wrce[0]_i_1_n_0\ : STD_LOGIC;
  signal \GEN_SYNC_WRITE.axi2ip_wrce[10]_i_2_n_0\ : STD_LOGIC;
  signal \GEN_SYNC_WRITE.axi2ip_wrce[1]_i_1_n_0\ : STD_LOGIC;
  signal \GEN_SYNC_WRITE.axi2ip_wrce[6]_i_1_n_0\ : STD_LOGIC;
  signal \GEN_SYNC_WRITE.bvalid_i_i_1_n_0\ : STD_LOGIC;
  signal \GEN_SYNC_WRITE.rdy_i_1_n_0\ : STD_LOGIC;
  signal \GEN_SYNC_WRITE.rdy_i_2_n_0\ : STD_LOGIC;
  signal \GEN_SYNC_WRITE.wr_addr_cap_i_1_n_0\ : STD_LOGIC;
  signal \GEN_SYNC_WRITE.wr_data_cap_i_1_n_0\ : STD_LOGIC;
  signal \GEN_SYNC_WRITE.wr_in_progress_i_1_n_0\ : STD_LOGIC;
  signal araddr : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal arvalid : STD_LOGIC;
  signal arvalid_d1 : STD_LOGIC;
  signal arvalid_d1_i_1_n_0 : STD_LOGIC;
  signal arvalid_re : STD_LOGIC;
  signal awvalid : STD_LOGIC;
  signal awvalid_d1 : STD_LOGIC;
  signal axi2ip_rdaddr : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal axi2ip_rdaddr_i : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal \^axi2ip_wrce\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \dmacr_i[23]_i_2_n_0\ : STD_LOGIC;
  signal ip2axi_rddata1_out : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \^rdy\ : STD_LOGIC;
  signal rvalid : STD_LOGIC;
  signal \^s_axi_lite_arready\ : STD_LOGIC;
  signal \^s_axi_lite_bvalid\ : STD_LOGIC;
  signal \^s_axi_lite_wready\ : STD_LOGIC;
  signal wr_addr_cap : STD_LOGIC;
  signal wr_data_cap : STD_LOGIC;
  signal wr_in_progress : STD_LOGIC;
  signal wvalid : STD_LOGIC;
  signal wvalid_d1 : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \GEN_SYNC_READ.s_axi_lite_rdata[13]_i_2\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \GEN_SYNC_READ.s_axi_lite_rdata[15]_i_2\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \GEN_SYNC_READ.s_axi_lite_rdata[1]_i_4\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \GEN_SYNC_READ.s_axi_lite_rdata[1]_i_5\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \GEN_SYNC_READ.s_axi_lite_rdata[1]_i_6\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \GEN_SYNC_READ.s_axi_lite_rdata[1]_i_7\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \GEN_SYNC_READ.s_axi_lite_rdata[1]_i_8\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \GEN_SYNC_READ.s_axi_lite_rdata[31]_i_4\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \GEN_SYNC_READ.s_axi_lite_rdata[31]_i_5\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \GEN_SYNC_READ.s_axi_lite_rdata[6]_i_2\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \GEN_SYNC_READ.s_axi_lite_rvalid_i_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \GEN_SYNC_WRITE.axi2ip_wrce[0]_i_1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \GEN_SYNC_WRITE.axi2ip_wrce[10]_i_2\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \GEN_SYNC_WRITE.axi2ip_wrce[1]_i_1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \GEN_SYNC_WRITE.axi2ip_wrce[6]_i_1\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \GEN_SYNC_WRITE.rdy_i_2\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \GEN_SYNC_WRITE.wr_addr_cap_i_1\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of arvalid_d1_i_1 : label is "soft_lutpair8";
begin
  \GEN_SYNC_READ.axi2ip_rdaddr_reg[7]_0\ <= \^gen_sync_read.axi2ip_rdaddr_reg[7]_0\;
  \GEN_SYNC_READ.axi2ip_rdaddr_reg[9]_0\ <= \^gen_sync_read.axi2ip_rdaddr_reg[9]_0\;
  \GEN_SYNC_READ.axi2ip_rdaddr_reg[9]_2\ <= \^gen_sync_read.axi2ip_rdaddr_reg[9]_2\;
  \GEN_SYNC_READ.axi2ip_rdaddr_reg[9]_3\ <= \^gen_sync_read.axi2ip_rdaddr_reg[9]_3\;
  \GEN_SYNC_READ.s_axi_lite_rvalid_i_reg_0\ <= \^gen_sync_read.s_axi_lite_rvalid_i_reg_0\;
  axi2ip_wrce(1 downto 0) <= \^axi2ip_wrce\(1 downto 0);
  rdy <= \^rdy\;
  s_axi_lite_arready <= \^s_axi_lite_arready\;
  s_axi_lite_bvalid <= \^s_axi_lite_bvalid\;
  s_axi_lite_wready <= \^s_axi_lite_wready\;
\GEN_REG_FOR_SMPL.buffer_length_wren_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFEEFEEE"
    )
        port map (
      I0 => \GEN_REG_FOR_SMPL.buffer_length_wren_i_2_n_0\,
      I1 => \GEN_REG_FOR_SMPL.buffer_length_wren_i_3_n_0\,
      I2 => s_axi_lite_wdata(2),
      I3 => \^axi2ip_wrce\(1),
      I4 => s_axi_lite_wdata(0),
      I5 => \GEN_REG_FOR_SMPL.buffer_length_wren_i_4_n_0\,
      O => buffer_length_wren0
    );
\GEN_REG_FOR_SMPL.buffer_length_wren_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF00FE00"
    )
        port map (
      I0 => s_axi_lite_wdata(8),
      I1 => s_axi_lite_wdata(10),
      I2 => s_axi_lite_wdata(3),
      I3 => \^axi2ip_wrce\(1),
      I4 => s_axi_lite_wdata(9),
      O => \GEN_REG_FOR_SMPL.buffer_length_wren_i_2_n_0\
    );
\GEN_REG_FOR_SMPL.buffer_length_wren_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF00FE00"
    )
        port map (
      I0 => s_axi_lite_wdata(7),
      I1 => s_axi_lite_wdata(11),
      I2 => s_axi_lite_wdata(4),
      I3 => \^axi2ip_wrce\(1),
      I4 => s_axi_lite_wdata(5),
      O => \GEN_REG_FOR_SMPL.buffer_length_wren_i_3_n_0\
    );
\GEN_REG_FOR_SMPL.buffer_length_wren_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F0F0F0E0"
    )
        port map (
      I0 => s_axi_lite_wdata(12),
      I1 => s_axi_lite_wdata(6),
      I2 => \^axi2ip_wrce\(1),
      I3 => s_axi_lite_wdata(1),
      I4 => s_axi_lite_wdata(13),
      O => \GEN_REG_FOR_SMPL.buffer_length_wren_i_4_n_0\
    );
\GEN_SYNC_READ.axi2ip_rdaddr_i_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_lite_aclk,
      CE => arvalid_re,
      D => araddr(0),
      Q => axi2ip_rdaddr_i(0),
      R => SR(0)
    );
\GEN_SYNC_READ.axi2ip_rdaddr_i_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_lite_aclk,
      CE => arvalid_re,
      D => araddr(1),
      Q => axi2ip_rdaddr_i(1),
      R => SR(0)
    );
\GEN_SYNC_READ.axi2ip_rdaddr_i_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_lite_aclk,
      CE => arvalid_re,
      D => araddr(2),
      Q => axi2ip_rdaddr_i(2),
      R => SR(0)
    );
\GEN_SYNC_READ.axi2ip_rdaddr_i_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_lite_aclk,
      CE => arvalid_re,
      D => araddr(3),
      Q => axi2ip_rdaddr_i(3),
      R => SR(0)
    );
\GEN_SYNC_READ.axi2ip_rdaddr_i_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_lite_aclk,
      CE => arvalid_re,
      D => araddr(4),
      Q => axi2ip_rdaddr_i(4),
      R => SR(0)
    );
\GEN_SYNC_READ.axi2ip_rdaddr_i_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_lite_aclk,
      CE => arvalid_re,
      D => araddr(5),
      Q => axi2ip_rdaddr_i(5),
      R => SR(0)
    );
\GEN_SYNC_READ.axi2ip_rdaddr_i_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_lite_aclk,
      CE => arvalid_re,
      D => araddr(6),
      Q => axi2ip_rdaddr_i(6),
      R => SR(0)
    );
\GEN_SYNC_READ.axi2ip_rdaddr_i_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_lite_aclk,
      CE => arvalid_re,
      D => araddr(7),
      Q => axi2ip_rdaddr_i(7),
      R => SR(0)
    );
\GEN_SYNC_READ.axi2ip_rdaddr_i_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_lite_aclk,
      CE => arvalid_re,
      D => araddr(8),
      Q => axi2ip_rdaddr_i(8),
      R => SR(0)
    );
\GEN_SYNC_READ.axi2ip_rdaddr_i_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_lite_aclk,
      CE => arvalid_re,
      D => araddr(9),
      Q => axi2ip_rdaddr_i(9),
      R => SR(0)
    );
\GEN_SYNC_READ.axi2ip_rdaddr_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_lite_aclk,
      CE => '1',
      D => axi2ip_rdaddr_i(0),
      Q => axi2ip_rdaddr(0),
      R => SR(0)
    );
\GEN_SYNC_READ.axi2ip_rdaddr_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_lite_aclk,
      CE => '1',
      D => axi2ip_rdaddr_i(1),
      Q => axi2ip_rdaddr(1),
      R => SR(0)
    );
\GEN_SYNC_READ.axi2ip_rdaddr_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_lite_aclk,
      CE => '1',
      D => axi2ip_rdaddr_i(2),
      Q => axi2ip_rdaddr(2),
      R => SR(0)
    );
\GEN_SYNC_READ.axi2ip_rdaddr_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_lite_aclk,
      CE => '1',
      D => axi2ip_rdaddr_i(3),
      Q => axi2ip_rdaddr(3),
      R => SR(0)
    );
\GEN_SYNC_READ.axi2ip_rdaddr_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_lite_aclk,
      CE => '1',
      D => axi2ip_rdaddr_i(4),
      Q => axi2ip_rdaddr(4),
      R => SR(0)
    );
\GEN_SYNC_READ.axi2ip_rdaddr_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_lite_aclk,
      CE => '1',
      D => axi2ip_rdaddr_i(5),
      Q => axi2ip_rdaddr(5),
      R => SR(0)
    );
\GEN_SYNC_READ.axi2ip_rdaddr_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_lite_aclk,
      CE => '1',
      D => axi2ip_rdaddr_i(6),
      Q => axi2ip_rdaddr(6),
      R => SR(0)
    );
\GEN_SYNC_READ.axi2ip_rdaddr_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_lite_aclk,
      CE => '1',
      D => axi2ip_rdaddr_i(7),
      Q => axi2ip_rdaddr(7),
      R => SR(0)
    );
\GEN_SYNC_READ.axi2ip_rdaddr_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_lite_aclk,
      CE => '1',
      D => axi2ip_rdaddr_i(8),
      Q => axi2ip_rdaddr(8),
      R => SR(0)
    );
\GEN_SYNC_READ.axi2ip_rdaddr_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_lite_aclk,
      CE => '1',
      D => axi2ip_rdaddr_i(9),
      Q => axi2ip_rdaddr(9),
      R => SR(0)
    );
\GEN_SYNC_READ.rvalid_reg\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_lite_aclk,
      CE => '1',
      D => \^s_axi_lite_arready\,
      Q => rvalid,
      R => SR(0)
    );
\GEN_SYNC_READ.s_axi_lite_rdata[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFEAEAEA"
    )
        port map (
      I0 => \GEN_SYNC_READ.s_axi_lite_rdata[0]_i_2_n_0\,
      I1 => \^gen_sync_read.axi2ip_rdaddr_reg[9]_0\,
      I2 => \GEN_SYNC_READ.s_axi_lite_rdata_reg[0]_0\,
      I3 => Q(0),
      I4 => \^gen_sync_read.axi2ip_rdaddr_reg[7]_0\,
      O => ip2axi_rddata1_out(0)
    );
\GEN_SYNC_READ.s_axi_lite_rdata[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00F0000088000000"
    )
        port map (
      I0 => mm2s_dmasr(0),
      I1 => \GEN_SYNC_READ.s_axi_lite_rdata[1]_i_3_n_0\,
      I2 => \GEN_SYNC_READ.s_axi_lite_rdata_reg[12]_0\(0),
      I3 => \GEN_SYNC_READ.s_axi_lite_rdata[31]_i_5_n_0\,
      I4 => \GEN_SYNC_READ.s_axi_lite_rdata[1]_i_4_n_0\,
      I5 => \GEN_SYNC_READ.s_axi_lite_rdata[1]_i_5_n_0\,
      O => \GEN_SYNC_READ.s_axi_lite_rdata[0]_i_2_n_0\
    );
\GEN_SYNC_READ.s_axi_lite_rdata[12]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFEAEAEA"
    )
        port map (
      I0 => \GEN_SYNC_READ.s_axi_lite_rdata[12]_i_2_n_0\,
      I1 => \^gen_sync_read.axi2ip_rdaddr_reg[9]_0\,
      I2 => \GEN_SYNC_READ.s_axi_lite_rdata_reg[12]_1\(0),
      I3 => Q(4),
      I4 => \^gen_sync_read.axi2ip_rdaddr_reg[7]_0\,
      O => ip2axi_rddata1_out(12)
    );
\GEN_SYNC_READ.s_axi_lite_rdata[12]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AC00A0A000000000"
    )
        port map (
      I0 => \GEN_SYNC_READ.s_axi_lite_rdata_reg[12]_0\(4),
      I1 => \GEN_SYNC_READ.s_axi_lite_rdata_reg[12]_2\,
      I2 => \GEN_SYNC_READ.s_axi_lite_rdata[1]_i_5_n_0\,
      I3 => \GEN_SYNC_READ.s_axi_lite_rdata[1]_i_3_n_0\,
      I4 => \GEN_SYNC_READ.s_axi_lite_rdata[31]_i_5_n_0\,
      I5 => \GEN_SYNC_READ.s_axi_lite_rdata[1]_i_4_n_0\,
      O => \GEN_SYNC_READ.s_axi_lite_rdata[12]_i_2_n_0\
    );
\GEN_SYNC_READ.s_axi_lite_rdata[13]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00010000"
    )
        port map (
      I0 => \GEN_SYNC_READ.s_axi_lite_rdata[31]_i_5_n_0\,
      I1 => axi2ip_rdaddr(9),
      I2 => axi2ip_rdaddr(8),
      I3 => axi2ip_rdaddr(7),
      I4 => \GEN_SYNC_READ.s_axi_lite_rdata[1]_i_5_n_0\,
      O => \^gen_sync_read.axi2ip_rdaddr_reg[9]_3\
    );
\GEN_SYNC_READ.s_axi_lite_rdata[14]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000040"
    )
        port map (
      I0 => \GEN_SYNC_READ.s_axi_lite_rdata[1]_i_5_n_0\,
      I1 => \GEN_SYNC_READ.s_axi_lite_rdata[1]_i_3_n_0\,
      I2 => \GEN_SYNC_READ.s_axi_lite_rdata[31]_i_5_n_0\,
      I3 => axi2ip_rdaddr(9),
      I4 => axi2ip_rdaddr(8),
      I5 => axi2ip_rdaddr(7),
      O => \GEN_SYNC_READ.axi2ip_rdaddr_reg[9]_4\
    );
\GEN_SYNC_READ.s_axi_lite_rdata[15]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^gen_sync_read.axi2ip_rdaddr_reg[9]_2\,
      I1 => Q(5),
      O => ip2axi_rddata1_out(15)
    );
\GEN_SYNC_READ.s_axi_lite_rdata[15]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00010000"
    )
        port map (
      I0 => \GEN_SYNC_READ.s_axi_lite_rdata[31]_i_5_n_0\,
      I1 => axi2ip_rdaddr(9),
      I2 => axi2ip_rdaddr(8),
      I3 => axi2ip_rdaddr(7),
      I4 => \GEN_SYNC_READ.s_axi_lite_rdata[1]_i_3_n_0\,
      O => \^gen_sync_read.axi2ip_rdaddr_reg[9]_2\
    );
\GEN_SYNC_READ.s_axi_lite_rdata[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAFFAABAAABAAABA"
    )
        port map (
      I0 => \GEN_SYNC_READ.s_axi_lite_rdata[1]_i_2_n_0\,
      I1 => \GEN_SYNC_READ.s_axi_lite_rdata[1]_i_3_n_0\,
      I2 => \GEN_SYNC_READ.s_axi_lite_rdata[1]_i_4_n_0\,
      I3 => \GEN_SYNC_READ.s_axi_lite_rdata[1]_i_5_n_0\,
      I4 => Q(1),
      I5 => \GEN_SYNC_READ.s_axi_lite_rdata[1]_i_6_n_0\,
      O => ip2axi_rddata1_out(1)
    );
\GEN_SYNC_READ.s_axi_lite_rdata[1]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"2C002000"
    )
        port map (
      I0 => \GEN_SYNC_READ.s_axi_lite_rdata_reg[12]_0\(1),
      I1 => \GEN_SYNC_READ.s_axi_lite_rdata[31]_i_5_n_0\,
      I2 => \GEN_SYNC_READ.s_axi_lite_rdata[1]_i_5_n_0\,
      I3 => \GEN_SYNC_READ.s_axi_lite_rdata[1]_i_4_n_0\,
      I4 => \GEN_SYNC_READ.s_axi_lite_rdata_reg[1]_0\,
      O => \GEN_SYNC_READ.s_axi_lite_rdata[1]_i_2_n_0\
    );
\GEN_SYNC_READ.s_axi_lite_rdata[1]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000101000000"
    )
        port map (
      I0 => \GEN_SYNC_READ.s_axi_lite_rdata[1]_i_7_n_0\,
      I1 => axi2ip_rdaddr(5),
      I2 => axi2ip_rdaddr(6),
      I3 => axi2ip_rdaddr(4),
      I4 => axi2ip_rdaddr(3),
      I5 => axi2ip_rdaddr(2),
      O => \GEN_SYNC_READ.s_axi_lite_rdata[1]_i_3_n_0\
    );
\GEN_SYNC_READ.s_axi_lite_rdata[1]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
        port map (
      I0 => axi2ip_rdaddr(9),
      I1 => axi2ip_rdaddr(8),
      I2 => axi2ip_rdaddr(7),
      O => \GEN_SYNC_READ.s_axi_lite_rdata[1]_i_4_n_0\
    );
\GEN_SYNC_READ.s_axi_lite_rdata[1]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFF8FC"
    )
        port map (
      I0 => axi2ip_rdaddr(2),
      I1 => axi2ip_rdaddr(3),
      I2 => axi2ip_rdaddr(5),
      I3 => axi2ip_rdaddr(4),
      I4 => \GEN_SYNC_READ.s_axi_lite_rdata[1]_i_8_n_0\,
      O => \GEN_SYNC_READ.s_axi_lite_rdata[1]_i_5_n_0\
    );
\GEN_SYNC_READ.s_axi_lite_rdata[1]_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => axi2ip_rdaddr(7),
      I1 => axi2ip_rdaddr(8),
      I2 => axi2ip_rdaddr(9),
      I3 => \GEN_SYNC_READ.s_axi_lite_rdata[31]_i_5_n_0\,
      O => \GEN_SYNC_READ.s_axi_lite_rdata[1]_i_6_n_0\
    );
\GEN_SYNC_READ.s_axi_lite_rdata[1]_i_7\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => axi2ip_rdaddr(0),
      I1 => axi2ip_rdaddr(1),
      O => \GEN_SYNC_READ.s_axi_lite_rdata[1]_i_7_n_0\
    );
\GEN_SYNC_READ.s_axi_lite_rdata[1]_i_8\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FEFEFFFE"
    )
        port map (
      I0 => axi2ip_rdaddr(1),
      I1 => axi2ip_rdaddr(0),
      I2 => axi2ip_rdaddr(6),
      I3 => axi2ip_rdaddr(4),
      I4 => axi2ip_rdaddr(3),
      O => \GEN_SYNC_READ.s_axi_lite_rdata[1]_i_8_n_0\
    );
\GEN_SYNC_READ.s_axi_lite_rdata[31]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"8F"
    )
        port map (
      I0 => s_axi_lite_rready,
      I1 => \^gen_sync_read.s_axi_lite_rvalid_i_reg_0\,
      I2 => \GEN_SYNC_WRITE.rdy_reg_0\,
      O => \GEN_SYNC_READ.s_axi_lite_rdata[31]_i_1_n_0\
    );
\GEN_SYNC_READ.s_axi_lite_rdata[31]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000010000"
    )
        port map (
      I0 => axi2ip_rdaddr(7),
      I1 => axi2ip_rdaddr(8),
      I2 => axi2ip_rdaddr(9),
      I3 => \GEN_SYNC_READ.s_axi_lite_rdata[31]_i_5_n_0\,
      I4 => \GEN_SYNC_READ.s_axi_lite_rdata[1]_i_3_n_0\,
      I5 => \GEN_SYNC_READ.s_axi_lite_rdata[1]_i_5_n_0\,
      O => \^gen_sync_read.axi2ip_rdaddr_reg[7]_0\
    );
\GEN_SYNC_READ.s_axi_lite_rdata[31]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00010000"
    )
        port map (
      I0 => \GEN_SYNC_READ.s_axi_lite_rdata[1]_i_5_n_0\,
      I1 => axi2ip_rdaddr(9),
      I2 => axi2ip_rdaddr(8),
      I3 => axi2ip_rdaddr(7),
      I4 => \GEN_SYNC_READ.s_axi_lite_rdata[31]_i_6_n_0\,
      O => \^gen_sync_read.axi2ip_rdaddr_reg[9]_0\
    );
\GEN_SYNC_READ.s_axi_lite_rdata[31]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFBAE"
    )
        port map (
      I0 => axi2ip_rdaddr(2),
      I1 => axi2ip_rdaddr(3),
      I2 => axi2ip_rdaddr(4),
      I3 => axi2ip_rdaddr(5),
      I4 => \GEN_SYNC_READ.s_axi_lite_rdata[1]_i_8_n_0\,
      O => \GEN_SYNC_READ.s_axi_lite_rdata[31]_i_5_n_0\
    );
\GEN_SYNC_READ.s_axi_lite_rdata[31]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFEFEFBFFFF"
    )
        port map (
      I0 => \GEN_SYNC_READ.s_axi_lite_rdata[1]_i_7_n_0\,
      I1 => axi2ip_rdaddr(5),
      I2 => axi2ip_rdaddr(6),
      I3 => axi2ip_rdaddr(4),
      I4 => axi2ip_rdaddr(3),
      I5 => axi2ip_rdaddr(2),
      O => \GEN_SYNC_READ.s_axi_lite_rdata[31]_i_6_n_0\
    );
\GEN_SYNC_READ.s_axi_lite_rdata[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFEAEAEA"
    )
        port map (
      I0 => \GEN_SYNC_READ.s_axi_lite_rdata[4]_i_2_n_0\,
      I1 => \GEN_SYNC_READ.s_axi_lite_rdata_reg[4]_0\(0),
      I2 => \^gen_sync_read.axi2ip_rdaddr_reg[9]_0\,
      I3 => Q(2),
      I4 => \^gen_sync_read.axi2ip_rdaddr_reg[7]_0\,
      O => ip2axi_rddata1_out(4)
    );
\GEN_SYNC_READ.s_axi_lite_rdata[4]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AC00A0A000000000"
    )
        port map (
      I0 => \GEN_SYNC_READ.s_axi_lite_rdata_reg[12]_0\(2),
      I1 => \GEN_SYNC_READ.s_axi_lite_rdata_reg[4]_1\,
      I2 => \GEN_SYNC_READ.s_axi_lite_rdata[1]_i_5_n_0\,
      I3 => \GEN_SYNC_READ.s_axi_lite_rdata[1]_i_3_n_0\,
      I4 => \GEN_SYNC_READ.s_axi_lite_rdata[31]_i_5_n_0\,
      I5 => \GEN_SYNC_READ.s_axi_lite_rdata[1]_i_4_n_0\,
      O => \GEN_SYNC_READ.s_axi_lite_rdata[4]_i_2_n_0\
    );
\GEN_SYNC_READ.s_axi_lite_rdata[5]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFF888"
    )
        port map (
      I0 => \^gen_sync_read.axi2ip_rdaddr_reg[9]_2\,
      I1 => Q(3),
      I2 => \^gen_sync_read.axi2ip_rdaddr_reg[9]_3\,
      I3 => \GEN_SYNC_READ.s_axi_lite_rdata_reg[12]_0\(3),
      I4 => \GEN_SYNC_READ.s_axi_lite_rdata[5]_i_2_n_0\,
      O => ip2axi_rddata1_out(5)
    );
\GEN_SYNC_READ.s_axi_lite_rdata[5]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0002000000000000"
    )
        port map (
      I0 => \GEN_SYNC_READ.s_axi_lite_rdata[31]_i_5_n_0\,
      I1 => axi2ip_rdaddr(7),
      I2 => axi2ip_rdaddr(8),
      I3 => axi2ip_rdaddr(9),
      I4 => \GEN_SYNC_READ.s_axi_lite_rdata_reg[5]_0\,
      I5 => \GEN_SYNC_READ.s_axi_lite_rdata[1]_i_3_n_0\,
      O => \GEN_SYNC_READ.s_axi_lite_rdata[5]_i_2_n_0\
    );
\GEN_SYNC_READ.s_axi_lite_rdata[6]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00010000"
    )
        port map (
      I0 => \GEN_SYNC_READ.s_axi_lite_rdata[31]_i_6_n_0\,
      I1 => axi2ip_rdaddr(9),
      I2 => axi2ip_rdaddr(8),
      I3 => axi2ip_rdaddr(7),
      I4 => \GEN_SYNC_READ.s_axi_lite_rdata[1]_i_5_n_0\,
      O => \GEN_SYNC_READ.axi2ip_rdaddr_reg[9]_1\
    );
\GEN_SYNC_READ.s_axi_lite_rdata_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_lite_aclk,
      CE => rvalid,
      D => ip2axi_rddata1_out(0),
      Q => s_axi_lite_rdata(0),
      R => \GEN_SYNC_READ.s_axi_lite_rdata[31]_i_1_n_0\
    );
\GEN_SYNC_READ.s_axi_lite_rdata_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_lite_aclk,
      CE => rvalid,
      D => D(6),
      Q => s_axi_lite_rdata(10),
      R => \GEN_SYNC_READ.s_axi_lite_rdata[31]_i_1_n_0\
    );
\GEN_SYNC_READ.s_axi_lite_rdata_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_lite_aclk,
      CE => rvalid,
      D => D(7),
      Q => s_axi_lite_rdata(11),
      R => \GEN_SYNC_READ.s_axi_lite_rdata[31]_i_1_n_0\
    );
\GEN_SYNC_READ.s_axi_lite_rdata_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_lite_aclk,
      CE => rvalid,
      D => ip2axi_rddata1_out(12),
      Q => s_axi_lite_rdata(12),
      R => \GEN_SYNC_READ.s_axi_lite_rdata[31]_i_1_n_0\
    );
\GEN_SYNC_READ.s_axi_lite_rdata_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_lite_aclk,
      CE => rvalid,
      D => D(8),
      Q => s_axi_lite_rdata(13),
      R => \GEN_SYNC_READ.s_axi_lite_rdata[31]_i_1_n_0\
    );
\GEN_SYNC_READ.s_axi_lite_rdata_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_lite_aclk,
      CE => rvalid,
      D => D(9),
      Q => s_axi_lite_rdata(14),
      R => \GEN_SYNC_READ.s_axi_lite_rdata[31]_i_1_n_0\
    );
\GEN_SYNC_READ.s_axi_lite_rdata_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_lite_aclk,
      CE => rvalid,
      D => ip2axi_rddata1_out(15),
      Q => s_axi_lite_rdata(15),
      R => \GEN_SYNC_READ.s_axi_lite_rdata[31]_i_1_n_0\
    );
\GEN_SYNC_READ.s_axi_lite_rdata_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_lite_aclk,
      CE => rvalid,
      D => D(10),
      Q => s_axi_lite_rdata(16),
      R => \GEN_SYNC_READ.s_axi_lite_rdata[31]_i_1_n_0\
    );
\GEN_SYNC_READ.s_axi_lite_rdata_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_lite_aclk,
      CE => rvalid,
      D => D(11),
      Q => s_axi_lite_rdata(17),
      R => \GEN_SYNC_READ.s_axi_lite_rdata[31]_i_1_n_0\
    );
\GEN_SYNC_READ.s_axi_lite_rdata_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_lite_aclk,
      CE => rvalid,
      D => D(12),
      Q => s_axi_lite_rdata(18),
      R => \GEN_SYNC_READ.s_axi_lite_rdata[31]_i_1_n_0\
    );
\GEN_SYNC_READ.s_axi_lite_rdata_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_lite_aclk,
      CE => rvalid,
      D => D(13),
      Q => s_axi_lite_rdata(19),
      R => \GEN_SYNC_READ.s_axi_lite_rdata[31]_i_1_n_0\
    );
\GEN_SYNC_READ.s_axi_lite_rdata_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_lite_aclk,
      CE => rvalid,
      D => ip2axi_rddata1_out(1),
      Q => s_axi_lite_rdata(1),
      R => \GEN_SYNC_READ.s_axi_lite_rdata[31]_i_1_n_0\
    );
\GEN_SYNC_READ.s_axi_lite_rdata_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_lite_aclk,
      CE => rvalid,
      D => D(14),
      Q => s_axi_lite_rdata(20),
      R => \GEN_SYNC_READ.s_axi_lite_rdata[31]_i_1_n_0\
    );
\GEN_SYNC_READ.s_axi_lite_rdata_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_lite_aclk,
      CE => rvalid,
      D => D(15),
      Q => s_axi_lite_rdata(21),
      R => \GEN_SYNC_READ.s_axi_lite_rdata[31]_i_1_n_0\
    );
\GEN_SYNC_READ.s_axi_lite_rdata_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_lite_aclk,
      CE => rvalid,
      D => D(16),
      Q => s_axi_lite_rdata(22),
      R => \GEN_SYNC_READ.s_axi_lite_rdata[31]_i_1_n_0\
    );
\GEN_SYNC_READ.s_axi_lite_rdata_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_lite_aclk,
      CE => rvalid,
      D => D(17),
      Q => s_axi_lite_rdata(23),
      R => \GEN_SYNC_READ.s_axi_lite_rdata[31]_i_1_n_0\
    );
\GEN_SYNC_READ.s_axi_lite_rdata_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_lite_aclk,
      CE => rvalid,
      D => D(18),
      Q => s_axi_lite_rdata(24),
      R => \GEN_SYNC_READ.s_axi_lite_rdata[31]_i_1_n_0\
    );
\GEN_SYNC_READ.s_axi_lite_rdata_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_lite_aclk,
      CE => rvalid,
      D => D(19),
      Q => s_axi_lite_rdata(25),
      R => \GEN_SYNC_READ.s_axi_lite_rdata[31]_i_1_n_0\
    );
\GEN_SYNC_READ.s_axi_lite_rdata_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_lite_aclk,
      CE => rvalid,
      D => D(20),
      Q => s_axi_lite_rdata(26),
      R => \GEN_SYNC_READ.s_axi_lite_rdata[31]_i_1_n_0\
    );
\GEN_SYNC_READ.s_axi_lite_rdata_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_lite_aclk,
      CE => rvalid,
      D => D(21),
      Q => s_axi_lite_rdata(27),
      R => \GEN_SYNC_READ.s_axi_lite_rdata[31]_i_1_n_0\
    );
\GEN_SYNC_READ.s_axi_lite_rdata_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_lite_aclk,
      CE => rvalid,
      D => D(22),
      Q => s_axi_lite_rdata(28),
      R => \GEN_SYNC_READ.s_axi_lite_rdata[31]_i_1_n_0\
    );
\GEN_SYNC_READ.s_axi_lite_rdata_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_lite_aclk,
      CE => rvalid,
      D => D(23),
      Q => s_axi_lite_rdata(29),
      R => \GEN_SYNC_READ.s_axi_lite_rdata[31]_i_1_n_0\
    );
\GEN_SYNC_READ.s_axi_lite_rdata_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_lite_aclk,
      CE => rvalid,
      D => D(0),
      Q => s_axi_lite_rdata(2),
      R => \GEN_SYNC_READ.s_axi_lite_rdata[31]_i_1_n_0\
    );
\GEN_SYNC_READ.s_axi_lite_rdata_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_lite_aclk,
      CE => rvalid,
      D => D(24),
      Q => s_axi_lite_rdata(30),
      R => \GEN_SYNC_READ.s_axi_lite_rdata[31]_i_1_n_0\
    );
\GEN_SYNC_READ.s_axi_lite_rdata_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_lite_aclk,
      CE => rvalid,
      D => D(25),
      Q => s_axi_lite_rdata(31),
      R => \GEN_SYNC_READ.s_axi_lite_rdata[31]_i_1_n_0\
    );
\GEN_SYNC_READ.s_axi_lite_rdata_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_lite_aclk,
      CE => rvalid,
      D => D(1),
      Q => s_axi_lite_rdata(3),
      R => \GEN_SYNC_READ.s_axi_lite_rdata[31]_i_1_n_0\
    );
\GEN_SYNC_READ.s_axi_lite_rdata_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_lite_aclk,
      CE => rvalid,
      D => ip2axi_rddata1_out(4),
      Q => s_axi_lite_rdata(4),
      R => \GEN_SYNC_READ.s_axi_lite_rdata[31]_i_1_n_0\
    );
\GEN_SYNC_READ.s_axi_lite_rdata_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_lite_aclk,
      CE => rvalid,
      D => ip2axi_rddata1_out(5),
      Q => s_axi_lite_rdata(5),
      R => \GEN_SYNC_READ.s_axi_lite_rdata[31]_i_1_n_0\
    );
\GEN_SYNC_READ.s_axi_lite_rdata_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_lite_aclk,
      CE => rvalid,
      D => D(2),
      Q => s_axi_lite_rdata(6),
      R => \GEN_SYNC_READ.s_axi_lite_rdata[31]_i_1_n_0\
    );
\GEN_SYNC_READ.s_axi_lite_rdata_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_lite_aclk,
      CE => rvalid,
      D => D(3),
      Q => s_axi_lite_rdata(7),
      R => \GEN_SYNC_READ.s_axi_lite_rdata[31]_i_1_n_0\
    );
\GEN_SYNC_READ.s_axi_lite_rdata_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_lite_aclk,
      CE => rvalid,
      D => D(4),
      Q => s_axi_lite_rdata(8),
      R => \GEN_SYNC_READ.s_axi_lite_rdata[31]_i_1_n_0\
    );
\GEN_SYNC_READ.s_axi_lite_rdata_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_lite_aclk,
      CE => rvalid,
      D => D(5),
      Q => s_axi_lite_rdata(9),
      R => \GEN_SYNC_READ.s_axi_lite_rdata[31]_i_1_n_0\
    );
\GEN_SYNC_READ.s_axi_lite_rvalid_i_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0C88"
    )
        port map (
      I0 => rvalid,
      I1 => \GEN_SYNC_WRITE.rdy_reg_0\,
      I2 => s_axi_lite_rready,
      I3 => \^gen_sync_read.s_axi_lite_rvalid_i_reg_0\,
      O => \GEN_SYNC_READ.s_axi_lite_rvalid_i_i_1_n_0\
    );
\GEN_SYNC_READ.s_axi_lite_rvalid_i_reg\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_lite_aclk,
      CE => '1',
      D => \GEN_SYNC_READ.s_axi_lite_rvalid_i_i_1_n_0\,
      Q => \^gen_sync_read.s_axi_lite_rvalid_i_reg_0\,
      R => '0'
    );
\GEN_SYNC_WRITE.awvalid_d1_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => \^s_axi_lite_bvalid\,
      I1 => \GEN_SYNC_WRITE.rdy_reg_0\,
      O => \GEN_SYNC_WRITE.awvalid_d1_i_1_n_0\
    );
\GEN_SYNC_WRITE.awvalid_d1_reg\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_lite_aclk,
      CE => '1',
      D => awvalid,
      Q => awvalid_d1,
      R => \GEN_SYNC_WRITE.awvalid_d1_i_1_n_0\
    );
\GEN_SYNC_WRITE.axi2ip_wrce[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => s_axi_lite_awaddr(1),
      I1 => s_axi_lite_awaddr(0),
      I2 => s_axi_lite_awaddr(3),
      I3 => s_axi_lite_awaddr(2),
      O => \GEN_SYNC_WRITE.axi2ip_wrce[0]_i_1_n_0\
    );
\GEN_SYNC_WRITE.axi2ip_wrce[10]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0400"
    )
        port map (
      I0 => s_axi_lite_awaddr(0),
      I1 => s_axi_lite_awaddr(1),
      I2 => s_axi_lite_awaddr(2),
      I3 => s_axi_lite_awaddr(3),
      O => \GEN_SYNC_WRITE.axi2ip_wrce[10]_i_2_n_0\
    );
\GEN_SYNC_WRITE.axi2ip_wrce[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0004"
    )
        port map (
      I0 => s_axi_lite_awaddr(1),
      I1 => s_axi_lite_awaddr(0),
      I2 => s_axi_lite_awaddr(3),
      I3 => s_axi_lite_awaddr(2),
      O => \GEN_SYNC_WRITE.axi2ip_wrce[1]_i_1_n_0\
    );
\GEN_SYNC_WRITE.axi2ip_wrce[6]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0400"
    )
        port map (
      I0 => s_axi_lite_awaddr(0),
      I1 => s_axi_lite_awaddr(1),
      I2 => s_axi_lite_awaddr(3),
      I3 => s_axi_lite_awaddr(2),
      O => \GEN_SYNC_WRITE.axi2ip_wrce[6]_i_1_n_0\
    );
\GEN_SYNC_WRITE.axi2ip_wrce_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_lite_aclk,
      CE => '1',
      D => \GEN_SYNC_WRITE.axi2ip_wrce[0]_i_1_n_0\,
      Q => \^axi2ip_wrce\(0),
      R => \GEN_SYNC_WRITE.axi2ip_wrce_reg[10]_0\
    );
\GEN_SYNC_WRITE.axi2ip_wrce_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_lite_aclk,
      CE => '1',
      D => \GEN_SYNC_WRITE.axi2ip_wrce[10]_i_2_n_0\,
      Q => \^axi2ip_wrce\(1),
      R => \GEN_SYNC_WRITE.axi2ip_wrce_reg[10]_0\
    );
\GEN_SYNC_WRITE.axi2ip_wrce_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_lite_aclk,
      CE => '1',
      D => \GEN_SYNC_WRITE.axi2ip_wrce[1]_i_1_n_0\,
      Q => p_0_in1_in,
      R => \GEN_SYNC_WRITE.axi2ip_wrce_reg[10]_0\
    );
\GEN_SYNC_WRITE.axi2ip_wrce_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_lite_aclk,
      CE => '1',
      D => \GEN_SYNC_WRITE.axi2ip_wrce[6]_i_1_n_0\,
      Q => E(0),
      R => \GEN_SYNC_WRITE.axi2ip_wrce_reg[10]_0\
    );
\GEN_SYNC_WRITE.bvalid_i_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0C88"
    )
        port map (
      I0 => \^s_axi_lite_wready\,
      I1 => \GEN_SYNC_WRITE.rdy_reg_0\,
      I2 => s_axi_lite_bready,
      I3 => \^s_axi_lite_bvalid\,
      O => \GEN_SYNC_WRITE.bvalid_i_i_1_n_0\
    );
\GEN_SYNC_WRITE.bvalid_i_reg\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_lite_aclk,
      CE => '1',
      D => \GEN_SYNC_WRITE.bvalid_i_i_1_n_0\,
      Q => \^s_axi_lite_bvalid\,
      R => '0'
    );
\GEN_SYNC_WRITE.rdy_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => \^rdy\,
      I1 => \GEN_SYNC_WRITE.rdy_reg_0\,
      O => \GEN_SYNC_WRITE.rdy_i_1_n_0\
    );
\GEN_SYNC_WRITE.rdy_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => wr_addr_cap,
      I1 => wr_data_cap,
      O => \GEN_SYNC_WRITE.rdy_i_2_n_0\
    );
\GEN_SYNC_WRITE.rdy_reg\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_lite_aclk,
      CE => '1',
      D => \GEN_SYNC_WRITE.rdy_i_2_n_0\,
      Q => \^rdy\,
      R => \GEN_SYNC_WRITE.rdy_i_1_n_0\
    );
\GEN_SYNC_WRITE.wr_addr_cap_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FF10"
    )
        port map (
      I0 => wr_in_progress,
      I1 => awvalid_d1,
      I2 => awvalid,
      I3 => wr_addr_cap,
      O => \GEN_SYNC_WRITE.wr_addr_cap_i_1_n_0\
    );
\GEN_SYNC_WRITE.wr_addr_cap_reg\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_lite_aclk,
      CE => '1',
      D => \GEN_SYNC_WRITE.wr_addr_cap_i_1_n_0\,
      Q => wr_addr_cap,
      R => \GEN_SYNC_WRITE.rdy_i_1_n_0\
    );
\GEN_SYNC_WRITE.wr_data_cap_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"F4"
    )
        port map (
      I0 => wvalid_d1,
      I1 => wvalid,
      I2 => wr_data_cap,
      O => \GEN_SYNC_WRITE.wr_data_cap_i_1_n_0\
    );
\GEN_SYNC_WRITE.wr_data_cap_reg\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_lite_aclk,
      CE => '1',
      D => \GEN_SYNC_WRITE.wr_data_cap_i_1_n_0\,
      Q => wr_data_cap,
      R => \GEN_SYNC_WRITE.rdy_i_1_n_0\
    );
\GEN_SYNC_WRITE.wr_in_progress_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"F4"
    )
        port map (
      I0 => awvalid_d1,
      I1 => awvalid,
      I2 => wr_in_progress,
      O => \GEN_SYNC_WRITE.wr_in_progress_i_1_n_0\
    );
\GEN_SYNC_WRITE.wr_in_progress_reg\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_lite_aclk,
      CE => '1',
      D => \GEN_SYNC_WRITE.wr_in_progress_i_1_n_0\,
      Q => wr_in_progress,
      R => \GEN_SYNC_WRITE.awvalid_d1_i_1_n_0\
    );
\GEN_SYNC_WRITE.wready_i_reg\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_lite_aclk,
      CE => '1',
      D => \^rdy\,
      Q => \^s_axi_lite_wready\,
      R => '0'
    );
\GEN_SYNC_WRITE.wvalid_d1_reg\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_lite_aclk,
      CE => '1',
      D => wvalid,
      Q => wvalid_d1,
      R => \GEN_SYNC_WRITE.awvalid_d1_i_1_n_0\
    );
\araddr_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_lite_aclk,
      CE => '1',
      D => s_axi_lite_araddr(0),
      Q => araddr(0),
      R => SR(0)
    );
\araddr_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_lite_aclk,
      CE => '1',
      D => s_axi_lite_araddr(1),
      Q => araddr(1),
      R => SR(0)
    );
\araddr_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_lite_aclk,
      CE => '1',
      D => s_axi_lite_araddr(2),
      Q => araddr(2),
      R => SR(0)
    );
\araddr_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_lite_aclk,
      CE => '1',
      D => s_axi_lite_araddr(3),
      Q => araddr(3),
      R => SR(0)
    );
\araddr_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_lite_aclk,
      CE => '1',
      D => s_axi_lite_araddr(4),
      Q => araddr(4),
      R => SR(0)
    );
\araddr_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_lite_aclk,
      CE => '1',
      D => s_axi_lite_araddr(5),
      Q => araddr(5),
      R => SR(0)
    );
\araddr_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_lite_aclk,
      CE => '1',
      D => s_axi_lite_araddr(6),
      Q => araddr(6),
      R => SR(0)
    );
\araddr_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_lite_aclk,
      CE => '1',
      D => s_axi_lite_araddr(7),
      Q => araddr(7),
      R => SR(0)
    );
\araddr_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_lite_aclk,
      CE => '1',
      D => s_axi_lite_araddr(8),
      Q => araddr(8),
      R => SR(0)
    );
\araddr_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_lite_aclk,
      CE => '1',
      D => s_axi_lite_araddr(9),
      Q => araddr(9),
      R => SR(0)
    );
arready_i_i_2: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
        port map (
      I0 => \^gen_sync_read.s_axi_lite_rvalid_i_reg_0\,
      I1 => arvalid,
      I2 => arvalid_d1,
      O => arvalid_re
    );
arready_i_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_lite_aclk,
      CE => '1',
      D => arvalid_re,
      Q => \^s_axi_lite_arready\,
      R => SR(0)
    );
arvalid_d1_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => \^gen_sync_read.s_axi_lite_rvalid_i_reg_0\,
      I1 => arvalid,
      I2 => \GEN_SYNC_WRITE.rdy_reg_0\,
      O => arvalid_d1_i_1_n_0
    );
arvalid_d1_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_lite_aclk,
      CE => '1',
      D => arvalid_d1_i_1_n_0,
      Q => arvalid_d1,
      R => '0'
    );
arvalid_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_lite_aclk,
      CE => '1',
      D => s_axi_lite_arvalid,
      Q => arvalid,
      R => SR(0)
    );
awvalid_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_lite_aclk,
      CE => '1',
      D => s_axi_lite_awvalid,
      Q => awvalid,
      R => SR(0)
    );
\dmacr_i[23]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0100FFFF"
    )
        port map (
      I0 => s_axi_lite_wdata(16),
      I1 => s_axi_lite_wdata(15),
      I2 => s_axi_lite_wdata(14),
      I3 => \dmacr_i[23]_i_2_n_0\,
      I4 => \out\,
      O => SS(0)
    );
\dmacr_i[23]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000100000000"
    )
        port map (
      I0 => s_axi_lite_wdata(17),
      I1 => s_axi_lite_wdata(18),
      I2 => s_axi_lite_wdata(19),
      I3 => s_axi_lite_wdata(20),
      I4 => s_axi_lite_wdata(21),
      I5 => \^axi2ip_wrce\(0),
      O => \dmacr_i[23]_i_2_n_0\
    );
wvalid_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_lite_aclk,
      CE => '1',
      D => s_axi_lite_wvalid,
      Q => wvalid,
      R => SR(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_dma_mm2s_cmdsts_if is
  port (
    \GEN_NO_HOLD_DATA.s_axis_mm2s_cmd_tvalid_reg_0\ : out STD_LOGIC;
    sts_received_i_reg_0 : out STD_LOGIC;
    m_axis_mm2s_sts_tready : out STD_LOGIC;
    \GNE_SYNC_RESET.scndry_resetn_reg\ : out STD_LOGIC;
    mm2s_error_reg_0 : out STD_LOGIC;
    D : out STD_LOGIC_VECTOR ( 1 downto 0 );
    \dmacr_i_reg[2]\ : out STD_LOGIC;
    write_cmnd_cmb : out STD_LOGIC;
    mm2s_stop_i : out STD_LOGIC;
    mm2s_interr_i_reg_0 : out STD_LOGIC;
    mm2s_slverr_i_reg_0 : out STD_LOGIC;
    mm2s_decerr_i_reg_0 : out STD_LOGIC;
    halted1 : in STD_LOGIC;
    mm2s_decerr_i : in STD_LOGIC;
    s_axi_lite_aclk : in STD_LOGIC;
    mm2s_interr_i : in STD_LOGIC;
    mm2s_slverr_i : in STD_LOGIC;
    \GEN_NO_HOLD_DATA.s_axis_mm2s_cmd_tvalid_reg_1\ : in STD_LOGIC;
    sts_received_i_reg_1 : in STD_LOGIC;
    \out\ : in STD_LOGIC;
    mm2s_cmnd_wr_1 : in STD_LOGIC;
    cmnds_queued : in STD_LOGIC;
    soft_reset : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axis_mm2s_sts_tvalid_int : in STD_LOGIC;
    dma_interr_reg : in STD_LOGIC;
    dma_slverr_reg : in STD_LOGIC;
    dma_decerr_reg : in STD_LOGIC
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_dma_mm2s_cmdsts_if;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_dma_mm2s_cmdsts_if is
  signal \^gen_no_hold_data.s_axis_mm2s_cmd_tvalid_reg_0\ : STD_LOGIC;
  signal \^m_axis_mm2s_sts_tready\ : STD_LOGIC;
  signal mm2s_error_i_1_n_0 : STD_LOGIC;
  signal \^mm2s_error_reg_0\ : STD_LOGIC;
  signal mm2s_smpl_decerr_set : STD_LOGIC;
  signal mm2s_smpl_interr_set : STD_LOGIC;
  signal mm2s_smpl_slverr_set : STD_LOGIC;
  signal \^sts_received_i_reg_0\ : STD_LOGIC;
  signal sts_tready_i_1_n_0 : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \FSM_sequential_smpl_cs[0]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \GEN_CMD_BTT_LESS_23.cmnd_wr_i_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \GEN_MM2S_REGISTERS.I_MM2S_DMA_REGISTER/dma_interr_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of mm2s_error_i_1 : label is "soft_lutpair1";
begin
  \GEN_NO_HOLD_DATA.s_axis_mm2s_cmd_tvalid_reg_0\ <= \^gen_no_hold_data.s_axis_mm2s_cmd_tvalid_reg_0\;
  m_axis_mm2s_sts_tready <= \^m_axis_mm2s_sts_tready\;
  mm2s_error_reg_0 <= \^mm2s_error_reg_0\;
  sts_received_i_reg_0 <= \^sts_received_i_reg_0\;
\FSM_sequential_smpl_cs[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"000200FF"
    )
        port map (
      I0 => \^gen_no_hold_data.s_axis_mm2s_cmd_tvalid_reg_0\,
      I1 => soft_reset,
      I2 => \^mm2s_error_reg_0\,
      I3 => Q(1),
      I4 => Q(0),
      O => D(0)
    );
\FSM_sequential_smpl_cs[1]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000010000030100"
    )
        port map (
      I0 => \^sts_received_i_reg_0\,
      I1 => soft_reset,
      I2 => \^mm2s_error_reg_0\,
      I3 => Q(1),
      I4 => Q(0),
      I5 => \^gen_no_hold_data.s_axis_mm2s_cmd_tvalid_reg_0\,
      O => D(1)
    );
\GEN_CMD_BTT_LESS_23.cmnd_data[66]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000100FFFFFFFF"
    )
        port map (
      I0 => soft_reset,
      I1 => \^mm2s_error_reg_0\,
      I2 => Q(1),
      I3 => Q(0),
      I4 => \^gen_no_hold_data.s_axis_mm2s_cmd_tvalid_reg_0\,
      I5 => \out\,
      O => \dmacr_i_reg[2]\
    );
\GEN_CMD_BTT_LESS_23.cmnd_wr_i_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000004"
    )
        port map (
      I0 => \^gen_no_hold_data.s_axis_mm2s_cmd_tvalid_reg_0\,
      I1 => Q(0),
      I2 => Q(1),
      I3 => \^mm2s_error_reg_0\,
      I4 => soft_reset,
      O => write_cmnd_cmb
    );
\GEN_MM2S_DMA_CONTROL.mm2s_stop_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \^mm2s_error_reg_0\,
      I1 => soft_reset,
      O => mm2s_stop_i
    );
\GEN_MM2S_REGISTERS.I_MM2S_DMA_REGISTER/dma_decerr_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => mm2s_smpl_decerr_set,
      I1 => dma_decerr_reg,
      O => mm2s_decerr_i_reg_0
    );
\GEN_MM2S_REGISTERS.I_MM2S_DMA_REGISTER/dma_interr_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => mm2s_smpl_interr_set,
      I1 => dma_interr_reg,
      O => mm2s_interr_i_reg_0
    );
\GEN_MM2S_REGISTERS.I_MM2S_DMA_REGISTER/dma_slverr_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => mm2s_smpl_slverr_set,
      I1 => dma_slverr_reg,
      O => mm2s_slverr_i_reg_0
    );
\GEN_NO_HOLD_DATA.s_axis_mm2s_cmd_tvalid_reg\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_lite_aclk,
      CE => '1',
      D => \GEN_NO_HOLD_DATA.s_axis_mm2s_cmd_tvalid_reg_1\,
      Q => \^gen_no_hold_data.s_axis_mm2s_cmd_tvalid_reg_0\,
      R => halted1
    );
cmnds_queued_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000000000A2A0"
    )
        port map (
      I0 => \out\,
      I1 => \^sts_received_i_reg_0\,
      I2 => mm2s_cmnd_wr_1,
      I3 => cmnds_queued,
      I4 => soft_reset,
      I5 => \^mm2s_error_reg_0\,
      O => \GNE_SYNC_RESET.scndry_resetn_reg\
    );
mm2s_decerr_i_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_lite_aclk,
      CE => '1',
      D => mm2s_decerr_i,
      Q => mm2s_smpl_decerr_set,
      R => halted1
    );
mm2s_error_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => mm2s_smpl_interr_set,
      I1 => mm2s_smpl_decerr_set,
      I2 => mm2s_smpl_slverr_set,
      I3 => \^mm2s_error_reg_0\,
      O => mm2s_error_i_1_n_0
    );
mm2s_error_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_lite_aclk,
      CE => '1',
      D => mm2s_error_i_1_n_0,
      Q => \^mm2s_error_reg_0\,
      R => halted1
    );
mm2s_interr_i_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_lite_aclk,
      CE => '1',
      D => mm2s_interr_i,
      Q => mm2s_smpl_interr_set,
      R => halted1
    );
mm2s_slverr_i_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_lite_aclk,
      CE => '1',
      D => mm2s_slverr_i,
      Q => mm2s_smpl_slverr_set,
      R => halted1
    );
sts_received_i_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_lite_aclk,
      CE => '1',
      D => sts_received_i_reg_1,
      Q => \^sts_received_i_reg_0\,
      R => '0'
    );
sts_tready_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0A22"
    )
        port map (
      I0 => \out\,
      I1 => \^sts_received_i_reg_0\,
      I2 => m_axis_mm2s_sts_tvalid_int,
      I3 => \^m_axis_mm2s_sts_tready\,
      O => sts_tready_i_1_n_0
    );
sts_tready_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_lite_aclk,
      CE => '1',
      D => sts_tready_i_1_n_0,
      Q => \^m_axis_mm2s_sts_tready\,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_dma_mm2s_sts_mngr is
  port (
    axi_dma_tstvec : out STD_LOGIC_VECTOR ( 0 to 0 );
    mm2s_halted_set_reg_0 : out STD_LOGIC;
    \GNE_SYNC_RESET.scndry_resetn_reg\ : out STD_LOGIC;
    halted1 : in STD_LOGIC;
    mm2s_dmacr : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_lite_aclk : in STD_LOGIC;
    mm2s_halted_set0 : in STD_LOGIC;
    mm2s_all_idle : in STD_LOGIC;
    mm2s_dmasr : in STD_LOGIC_VECTOR ( 0 to 0 );
    dma_mm2s_error : in STD_LOGIC;
    soft_reset : in STD_LOGIC;
    mm2s_sts_received_clr : in STD_LOGIC;
    \out\ : in STD_LOGIC;
    idle_reg : in STD_LOGIC
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_dma_mm2s_sts_mngr;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_dma_mm2s_sts_mngr is
  signal all_is_idle_d1 : STD_LOGIC;
  signal mm2s_halted_clr : STD_LOGIC;
  signal mm2s_halted_set : STD_LOGIC;
begin
all_is_idle_d1_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_lite_aclk,
      CE => '1',
      D => mm2s_all_idle,
      Q => all_is_idle_d1,
      R => halted1
    );
\axi_dma_tstvec[4]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"222F2220"
    )
        port map (
      I0 => mm2s_halted_set,
      I1 => mm2s_dmasr(0),
      I2 => dma_mm2s_error,
      I3 => soft_reset,
      I4 => mm2s_sts_received_clr,
      O => axi_dma_tstvec(0)
    );
halted_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"DFDD"
    )
        port map (
      I0 => \out\,
      I1 => mm2s_halted_set,
      I2 => mm2s_halted_clr,
      I3 => mm2s_dmasr(0),
      O => \GNE_SYNC_RESET.scndry_resetn_reg\
    );
idle_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4400444000004400"
    )
        port map (
      I0 => mm2s_halted_set,
      I1 => \out\,
      I2 => mm2s_dmacr(0),
      I3 => idle_reg,
      I4 => all_is_idle_d1,
      I5 => mm2s_all_idle,
      O => mm2s_halted_set_reg_0
    );
mm2s_halted_clr_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_lite_aclk,
      CE => '1',
      D => mm2s_dmacr(0),
      Q => mm2s_halted_clr,
      R => halted1
    );
mm2s_halted_set_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_lite_aclk,
      CE => '1',
      D => mm2s_halted_set0,
      Q => mm2s_halted_set,
      R => halted1
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_dma_register is
  port (
    dma_interr_reg_0 : out STD_LOGIC;
    dma_slverr_reg_0 : out STD_LOGIC;
    dma_decerr_reg_0 : out STD_LOGIC;
    mm2s_length_wren : out STD_LOGIC;
    \dmacr_i_reg[0]_0\ : out STD_LOGIC;
    mm2s_dmasr : out STD_LOGIC_VECTOR ( 0 to 0 );
    idle_reg_0 : out STD_LOGIC;
    mm2s_introut : out STD_LOGIC;
    \dmacr_i_reg[2]_0\ : out STD_LOGIC;
    soft_reset_re0 : out STD_LOGIC;
    mm2s_halted_set0 : out STD_LOGIC;
    ioc_irq_reg_0 : out STD_LOGIC;
    Q : out STD_LOGIC_VECTOR ( 0 to 0 );
    D : out STD_LOGIC_VECTOR ( 25 downto 0 );
    \GEN_REG_FOR_SMPL.buffer_address_i_reg[31]_0\ : out STD_LOGIC_VECTOR ( 31 downto 0 );
    \GEN_REG_FOR_SMPL.buffer_length_i_reg[13]_0\ : out STD_LOGIC_VECTOR ( 13 downto 0 );
    \dmacr_i_reg[3]_0\ : out STD_LOGIC;
    \dmacr_i_reg[4]_0\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    \dmacr_i_reg[4]_1\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    dma_interr_reg_1 : in STD_LOGIC;
    s_axi_lite_aclk : in STD_LOGIC;
    dma_slverr_reg_1 : in STD_LOGIC;
    dma_decerr_reg_1 : in STD_LOGIC;
    buffer_length_wren0 : in STD_LOGIC;
    halted_reg_0 : in STD_LOGIC;
    idle_reg_1 : in STD_LOGIC;
    \out\ : in STD_LOGIC;
    s_axi_lite_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    axi2ip_wrce : in STD_LOGIC_VECTOR ( 1 downto 0 );
    mm2s_stop : in STD_LOGIC;
    soft_reset_d1 : in STD_LOGIC;
    mm2s_halt_cmplt : in STD_LOGIC;
    dma_mm2s_error : in STD_LOGIC;
    mm2s_all_idle : in STD_LOGIC;
    \GEN_SYNC_READ.s_axi_lite_rdata_reg[2]\ : in STD_LOGIC;
    \GEN_SYNC_READ.s_axi_lite_rdata_reg[2]_0\ : in STD_LOGIC;
    \GEN_SYNC_READ.s_axi_lite_rdata_reg[2]_1\ : in STD_LOGIC;
    \GEN_SYNC_READ.s_axi_lite_rdata_reg[6]\ : in STD_LOGIC;
    \GEN_SYNC_READ.s_axi_lite_rdata_reg[7]\ : in STD_LOGIC;
    \GEN_SYNC_READ.s_axi_lite_rdata_reg[7]_0\ : in STD_LOGIC;
    soft_reset_clr : in STD_LOGIC;
    SS : in STD_LOGIC_VECTOR ( 0 to 0 );
    p_0_in1_in : in STD_LOGIC;
    axi_dma_tstvec : in STD_LOGIC_VECTOR ( 0 to 0 );
    E : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_dma_register;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_dma_register is
  signal \^gen_reg_for_smpl.buffer_address_i_reg[31]_0\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \^gen_reg_for_smpl.buffer_length_i_reg[13]_0\ : STD_LOGIC_VECTOR ( 13 downto 0 );
  signal \^q\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \^dma_decerr_reg_0\ : STD_LOGIC;
  signal \^dma_interr_reg_0\ : STD_LOGIC;
  signal \^dma_slverr_reg_0\ : STD_LOGIC;
  signal \dmacr_i[0]_i_1_n_0\ : STD_LOGIC;
  signal \dmacr_i[0]_i_2_n_0\ : STD_LOGIC;
  signal \dmacr_i[2]_i_1_n_0\ : STD_LOGIC;
  signal \^dmacr_i_reg[0]_0\ : STD_LOGIC;
  signal \^dmacr_i_reg[2]_0\ : STD_LOGIC;
  signal \dmacr_i_reg_n_0_[13]\ : STD_LOGIC;
  signal \dmacr_i_reg_n_0_[14]\ : STD_LOGIC;
  signal \dmacr_i_reg_n_0_[16]\ : STD_LOGIC;
  signal \dmacr_i_reg_n_0_[17]\ : STD_LOGIC;
  signal \dmacr_i_reg_n_0_[18]\ : STD_LOGIC;
  signal \dmacr_i_reg_n_0_[19]\ : STD_LOGIC;
  signal \dmacr_i_reg_n_0_[20]\ : STD_LOGIC;
  signal \dmacr_i_reg_n_0_[21]\ : STD_LOGIC;
  signal \dmacr_i_reg_n_0_[22]\ : STD_LOGIC;
  signal \dmacr_i_reg_n_0_[23]\ : STD_LOGIC;
  signal \dmacr_i_reg_n_0_[24]\ : STD_LOGIC;
  signal \dmacr_i_reg_n_0_[25]\ : STD_LOGIC;
  signal \dmacr_i_reg_n_0_[26]\ : STD_LOGIC;
  signal \dmacr_i_reg_n_0_[27]\ : STD_LOGIC;
  signal \dmacr_i_reg_n_0_[28]\ : STD_LOGIC;
  signal \dmacr_i_reg_n_0_[29]\ : STD_LOGIC;
  signal \dmacr_i_reg_n_0_[30]\ : STD_LOGIC;
  signal \dmacr_i_reg_n_0_[31]\ : STD_LOGIC;
  signal err_irq_i_1_n_0 : STD_LOGIC;
  signal err_irq_reg_n_0 : STD_LOGIC;
  signal error_d1 : STD_LOGIC;
  signal error_d1_i_1_n_0 : STD_LOGIC;
  signal introut_i_1_n_0 : STD_LOGIC;
  signal ioc_irq_i_1_n_0 : STD_LOGIC;
  signal \^ioc_irq_reg_0\ : STD_LOGIC;
  signal mm2s_dmacr : STD_LOGIC_VECTOR ( 3 to 3 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \dmacr_i[0]_i_1\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \dmacr_i[2]_i_1\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of error_d1_i_1 : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of soft_reset_re_i_1 : label is "soft_lutpair13";
begin
  \GEN_REG_FOR_SMPL.buffer_address_i_reg[31]_0\(31 downto 0) <= \^gen_reg_for_smpl.buffer_address_i_reg[31]_0\(31 downto 0);
  \GEN_REG_FOR_SMPL.buffer_length_i_reg[13]_0\(13 downto 0) <= \^gen_reg_for_smpl.buffer_length_i_reg[13]_0\(13 downto 0);
  Q(0) <= \^q\(0);
  dma_decerr_reg_0 <= \^dma_decerr_reg_0\;
  dma_interr_reg_0 <= \^dma_interr_reg_0\;
  dma_slverr_reg_0 <= \^dma_slverr_reg_0\;
  \dmacr_i_reg[0]_0\ <= \^dmacr_i_reg[0]_0\;
  \dmacr_i_reg[2]_0\ <= \^dmacr_i_reg[2]_0\;
  ioc_irq_reg_0 <= \^ioc_irq_reg_0\;
\GEN_CMD_BTT_LESS_23.cmnd_data[26]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => mm2s_dmacr(3),
      O => \dmacr_i_reg[3]_0\
    );
\GEN_REG_FOR_SMPL.buffer_address_i_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_lite_aclk,
      CE => E(0),
      D => s_axi_lite_wdata(0),
      Q => \^gen_reg_for_smpl.buffer_address_i_reg[31]_0\(0),
      R => \dmacr_i_reg[4]_1\(0)
    );
\GEN_REG_FOR_SMPL.buffer_address_i_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_lite_aclk,
      CE => E(0),
      D => s_axi_lite_wdata(10),
      Q => \^gen_reg_for_smpl.buffer_address_i_reg[31]_0\(10),
      R => \dmacr_i_reg[4]_1\(0)
    );
\GEN_REG_FOR_SMPL.buffer_address_i_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_lite_aclk,
      CE => E(0),
      D => s_axi_lite_wdata(11),
      Q => \^gen_reg_for_smpl.buffer_address_i_reg[31]_0\(11),
      R => \dmacr_i_reg[4]_1\(0)
    );
\GEN_REG_FOR_SMPL.buffer_address_i_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_lite_aclk,
      CE => E(0),
      D => s_axi_lite_wdata(12),
      Q => \^gen_reg_for_smpl.buffer_address_i_reg[31]_0\(12),
      R => \dmacr_i_reg[4]_1\(0)
    );
\GEN_REG_FOR_SMPL.buffer_address_i_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_lite_aclk,
      CE => E(0),
      D => s_axi_lite_wdata(13),
      Q => \^gen_reg_for_smpl.buffer_address_i_reg[31]_0\(13),
      R => \dmacr_i_reg[4]_1\(0)
    );
\GEN_REG_FOR_SMPL.buffer_address_i_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_lite_aclk,
      CE => E(0),
      D => s_axi_lite_wdata(14),
      Q => \^gen_reg_for_smpl.buffer_address_i_reg[31]_0\(14),
      R => \dmacr_i_reg[4]_1\(0)
    );
\GEN_REG_FOR_SMPL.buffer_address_i_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_lite_aclk,
      CE => E(0),
      D => s_axi_lite_wdata(15),
      Q => \^gen_reg_for_smpl.buffer_address_i_reg[31]_0\(15),
      R => \dmacr_i_reg[4]_1\(0)
    );
\GEN_REG_FOR_SMPL.buffer_address_i_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_lite_aclk,
      CE => E(0),
      D => s_axi_lite_wdata(16),
      Q => \^gen_reg_for_smpl.buffer_address_i_reg[31]_0\(16),
      R => \dmacr_i_reg[4]_1\(0)
    );
\GEN_REG_FOR_SMPL.buffer_address_i_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_lite_aclk,
      CE => E(0),
      D => s_axi_lite_wdata(17),
      Q => \^gen_reg_for_smpl.buffer_address_i_reg[31]_0\(17),
      R => \dmacr_i_reg[4]_1\(0)
    );
\GEN_REG_FOR_SMPL.buffer_address_i_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_lite_aclk,
      CE => E(0),
      D => s_axi_lite_wdata(18),
      Q => \^gen_reg_for_smpl.buffer_address_i_reg[31]_0\(18),
      R => \dmacr_i_reg[4]_1\(0)
    );
\GEN_REG_FOR_SMPL.buffer_address_i_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_lite_aclk,
      CE => E(0),
      D => s_axi_lite_wdata(19),
      Q => \^gen_reg_for_smpl.buffer_address_i_reg[31]_0\(19),
      R => \dmacr_i_reg[4]_1\(0)
    );
\GEN_REG_FOR_SMPL.buffer_address_i_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_lite_aclk,
      CE => E(0),
      D => s_axi_lite_wdata(1),
      Q => \^gen_reg_for_smpl.buffer_address_i_reg[31]_0\(1),
      R => \dmacr_i_reg[4]_1\(0)
    );
\GEN_REG_FOR_SMPL.buffer_address_i_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_lite_aclk,
      CE => E(0),
      D => s_axi_lite_wdata(20),
      Q => \^gen_reg_for_smpl.buffer_address_i_reg[31]_0\(20),
      R => \dmacr_i_reg[4]_1\(0)
    );
\GEN_REG_FOR_SMPL.buffer_address_i_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_lite_aclk,
      CE => E(0),
      D => s_axi_lite_wdata(21),
      Q => \^gen_reg_for_smpl.buffer_address_i_reg[31]_0\(21),
      R => \dmacr_i_reg[4]_1\(0)
    );
\GEN_REG_FOR_SMPL.buffer_address_i_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_lite_aclk,
      CE => E(0),
      D => s_axi_lite_wdata(22),
      Q => \^gen_reg_for_smpl.buffer_address_i_reg[31]_0\(22),
      R => \dmacr_i_reg[4]_1\(0)
    );
\GEN_REG_FOR_SMPL.buffer_address_i_reg[23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_lite_aclk,
      CE => E(0),
      D => s_axi_lite_wdata(23),
      Q => \^gen_reg_for_smpl.buffer_address_i_reg[31]_0\(23),
      R => \dmacr_i_reg[4]_1\(0)
    );
\GEN_REG_FOR_SMPL.buffer_address_i_reg[24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_lite_aclk,
      CE => E(0),
      D => s_axi_lite_wdata(24),
      Q => \^gen_reg_for_smpl.buffer_address_i_reg[31]_0\(24),
      R => \dmacr_i_reg[4]_1\(0)
    );
\GEN_REG_FOR_SMPL.buffer_address_i_reg[25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_lite_aclk,
      CE => E(0),
      D => s_axi_lite_wdata(25),
      Q => \^gen_reg_for_smpl.buffer_address_i_reg[31]_0\(25),
      R => \dmacr_i_reg[4]_1\(0)
    );
\GEN_REG_FOR_SMPL.buffer_address_i_reg[26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_lite_aclk,
      CE => E(0),
      D => s_axi_lite_wdata(26),
      Q => \^gen_reg_for_smpl.buffer_address_i_reg[31]_0\(26),
      R => \dmacr_i_reg[4]_1\(0)
    );
\GEN_REG_FOR_SMPL.buffer_address_i_reg[27]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_lite_aclk,
      CE => E(0),
      D => s_axi_lite_wdata(27),
      Q => \^gen_reg_for_smpl.buffer_address_i_reg[31]_0\(27),
      R => \dmacr_i_reg[4]_1\(0)
    );
\GEN_REG_FOR_SMPL.buffer_address_i_reg[28]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_lite_aclk,
      CE => E(0),
      D => s_axi_lite_wdata(28),
      Q => \^gen_reg_for_smpl.buffer_address_i_reg[31]_0\(28),
      R => \dmacr_i_reg[4]_1\(0)
    );
\GEN_REG_FOR_SMPL.buffer_address_i_reg[29]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_lite_aclk,
      CE => E(0),
      D => s_axi_lite_wdata(29),
      Q => \^gen_reg_for_smpl.buffer_address_i_reg[31]_0\(29),
      R => \dmacr_i_reg[4]_1\(0)
    );
\GEN_REG_FOR_SMPL.buffer_address_i_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_lite_aclk,
      CE => E(0),
      D => s_axi_lite_wdata(2),
      Q => \^gen_reg_for_smpl.buffer_address_i_reg[31]_0\(2),
      R => \dmacr_i_reg[4]_1\(0)
    );
\GEN_REG_FOR_SMPL.buffer_address_i_reg[30]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_lite_aclk,
      CE => E(0),
      D => s_axi_lite_wdata(30),
      Q => \^gen_reg_for_smpl.buffer_address_i_reg[31]_0\(30),
      R => \dmacr_i_reg[4]_1\(0)
    );
\GEN_REG_FOR_SMPL.buffer_address_i_reg[31]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_lite_aclk,
      CE => E(0),
      D => s_axi_lite_wdata(31),
      Q => \^gen_reg_for_smpl.buffer_address_i_reg[31]_0\(31),
      R => \dmacr_i_reg[4]_1\(0)
    );
\GEN_REG_FOR_SMPL.buffer_address_i_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_lite_aclk,
      CE => E(0),
      D => s_axi_lite_wdata(3),
      Q => \^gen_reg_for_smpl.buffer_address_i_reg[31]_0\(3),
      R => \dmacr_i_reg[4]_1\(0)
    );
\GEN_REG_FOR_SMPL.buffer_address_i_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_lite_aclk,
      CE => E(0),
      D => s_axi_lite_wdata(4),
      Q => \^gen_reg_for_smpl.buffer_address_i_reg[31]_0\(4),
      R => \dmacr_i_reg[4]_1\(0)
    );
\GEN_REG_FOR_SMPL.buffer_address_i_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_lite_aclk,
      CE => E(0),
      D => s_axi_lite_wdata(5),
      Q => \^gen_reg_for_smpl.buffer_address_i_reg[31]_0\(5),
      R => \dmacr_i_reg[4]_1\(0)
    );
\GEN_REG_FOR_SMPL.buffer_address_i_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_lite_aclk,
      CE => E(0),
      D => s_axi_lite_wdata(6),
      Q => \^gen_reg_for_smpl.buffer_address_i_reg[31]_0\(6),
      R => \dmacr_i_reg[4]_1\(0)
    );
\GEN_REG_FOR_SMPL.buffer_address_i_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_lite_aclk,
      CE => E(0),
      D => s_axi_lite_wdata(7),
      Q => \^gen_reg_for_smpl.buffer_address_i_reg[31]_0\(7),
      R => \dmacr_i_reg[4]_1\(0)
    );
\GEN_REG_FOR_SMPL.buffer_address_i_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_lite_aclk,
      CE => E(0),
      D => s_axi_lite_wdata(8),
      Q => \^gen_reg_for_smpl.buffer_address_i_reg[31]_0\(8),
      R => \dmacr_i_reg[4]_1\(0)
    );
\GEN_REG_FOR_SMPL.buffer_address_i_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_lite_aclk,
      CE => E(0),
      D => s_axi_lite_wdata(9),
      Q => \^gen_reg_for_smpl.buffer_address_i_reg[31]_0\(9),
      R => \dmacr_i_reg[4]_1\(0)
    );
\GEN_REG_FOR_SMPL.buffer_length_i_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_lite_aclk,
      CE => axi2ip_wrce(1),
      D => s_axi_lite_wdata(0),
      Q => \^gen_reg_for_smpl.buffer_length_i_reg[13]_0\(0),
      R => \dmacr_i_reg[4]_1\(0)
    );
\GEN_REG_FOR_SMPL.buffer_length_i_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_lite_aclk,
      CE => axi2ip_wrce(1),
      D => s_axi_lite_wdata(10),
      Q => \^gen_reg_for_smpl.buffer_length_i_reg[13]_0\(10),
      R => \dmacr_i_reg[4]_1\(0)
    );
\GEN_REG_FOR_SMPL.buffer_length_i_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_lite_aclk,
      CE => axi2ip_wrce(1),
      D => s_axi_lite_wdata(11),
      Q => \^gen_reg_for_smpl.buffer_length_i_reg[13]_0\(11),
      R => \dmacr_i_reg[4]_1\(0)
    );
\GEN_REG_FOR_SMPL.buffer_length_i_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_lite_aclk,
      CE => axi2ip_wrce(1),
      D => s_axi_lite_wdata(12),
      Q => \^gen_reg_for_smpl.buffer_length_i_reg[13]_0\(12),
      R => \dmacr_i_reg[4]_1\(0)
    );
\GEN_REG_FOR_SMPL.buffer_length_i_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_lite_aclk,
      CE => axi2ip_wrce(1),
      D => s_axi_lite_wdata(13),
      Q => \^gen_reg_for_smpl.buffer_length_i_reg[13]_0\(13),
      R => \dmacr_i_reg[4]_1\(0)
    );
\GEN_REG_FOR_SMPL.buffer_length_i_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_lite_aclk,
      CE => axi2ip_wrce(1),
      D => s_axi_lite_wdata(1),
      Q => \^gen_reg_for_smpl.buffer_length_i_reg[13]_0\(1),
      R => \dmacr_i_reg[4]_1\(0)
    );
\GEN_REG_FOR_SMPL.buffer_length_i_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_lite_aclk,
      CE => axi2ip_wrce(1),
      D => s_axi_lite_wdata(2),
      Q => \^gen_reg_for_smpl.buffer_length_i_reg[13]_0\(2),
      R => \dmacr_i_reg[4]_1\(0)
    );
\GEN_REG_FOR_SMPL.buffer_length_i_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_lite_aclk,
      CE => axi2ip_wrce(1),
      D => s_axi_lite_wdata(3),
      Q => \^gen_reg_for_smpl.buffer_length_i_reg[13]_0\(3),
      R => \dmacr_i_reg[4]_1\(0)
    );
\GEN_REG_FOR_SMPL.buffer_length_i_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_lite_aclk,
      CE => axi2ip_wrce(1),
      D => s_axi_lite_wdata(4),
      Q => \^gen_reg_for_smpl.buffer_length_i_reg[13]_0\(4),
      R => \dmacr_i_reg[4]_1\(0)
    );
\GEN_REG_FOR_SMPL.buffer_length_i_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_lite_aclk,
      CE => axi2ip_wrce(1),
      D => s_axi_lite_wdata(5),
      Q => \^gen_reg_for_smpl.buffer_length_i_reg[13]_0\(5),
      R => \dmacr_i_reg[4]_1\(0)
    );
\GEN_REG_FOR_SMPL.buffer_length_i_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_lite_aclk,
      CE => axi2ip_wrce(1),
      D => s_axi_lite_wdata(6),
      Q => \^gen_reg_for_smpl.buffer_length_i_reg[13]_0\(6),
      R => \dmacr_i_reg[4]_1\(0)
    );
\GEN_REG_FOR_SMPL.buffer_length_i_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_lite_aclk,
      CE => axi2ip_wrce(1),
      D => s_axi_lite_wdata(7),
      Q => \^gen_reg_for_smpl.buffer_length_i_reg[13]_0\(7),
      R => \dmacr_i_reg[4]_1\(0)
    );
\GEN_REG_FOR_SMPL.buffer_length_i_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_lite_aclk,
      CE => axi2ip_wrce(1),
      D => s_axi_lite_wdata(8),
      Q => \^gen_reg_for_smpl.buffer_length_i_reg[13]_0\(8),
      R => \dmacr_i_reg[4]_1\(0)
    );
\GEN_REG_FOR_SMPL.buffer_length_i_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_lite_aclk,
      CE => axi2ip_wrce(1),
      D => s_axi_lite_wdata(9),
      Q => \^gen_reg_for_smpl.buffer_length_i_reg[13]_0\(9),
      R => \dmacr_i_reg[4]_1\(0)
    );
\GEN_REG_FOR_SMPL.buffer_length_wren_reg\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_lite_aclk,
      CE => '1',
      D => buffer_length_wren0,
      Q => mm2s_length_wren,
      R => \dmacr_i_reg[4]_1\(0)
    );
\GEN_SYNC_READ.s_axi_lite_rdata[10]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F888"
    )
        port map (
      I0 => \^gen_reg_for_smpl.buffer_address_i_reg[31]_0\(10),
      I1 => \GEN_SYNC_READ.s_axi_lite_rdata_reg[7]\,
      I2 => \^gen_reg_for_smpl.buffer_length_i_reg[13]_0\(10),
      I3 => \GEN_SYNC_READ.s_axi_lite_rdata_reg[7]_0\,
      O => D(6)
    );
\GEN_SYNC_READ.s_axi_lite_rdata[11]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F888"
    )
        port map (
      I0 => \^gen_reg_for_smpl.buffer_address_i_reg[31]_0\(11),
      I1 => \GEN_SYNC_READ.s_axi_lite_rdata_reg[7]\,
      I2 => \^gen_reg_for_smpl.buffer_length_i_reg[13]_0\(11),
      I3 => \GEN_SYNC_READ.s_axi_lite_rdata_reg[7]_0\,
      O => D(7)
    );
\GEN_SYNC_READ.s_axi_lite_rdata[13]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \dmacr_i_reg_n_0_[13]\,
      I1 => \GEN_SYNC_READ.s_axi_lite_rdata_reg[2]_0\,
      I2 => \^gen_reg_for_smpl.buffer_address_i_reg[31]_0\(13),
      I3 => \GEN_SYNC_READ.s_axi_lite_rdata_reg[2]\,
      I4 => \^gen_reg_for_smpl.buffer_length_i_reg[13]_0\(13),
      I5 => \GEN_SYNC_READ.s_axi_lite_rdata_reg[7]_0\,
      O => D(8)
    );
\GEN_SYNC_READ.s_axi_lite_rdata[14]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \^gen_reg_for_smpl.buffer_address_i_reg[31]_0\(14),
      I1 => \GEN_SYNC_READ.s_axi_lite_rdata_reg[2]\,
      I2 => \GEN_SYNC_READ.s_axi_lite_rdata_reg[2]_0\,
      I3 => \dmacr_i_reg_n_0_[14]\,
      I4 => err_irq_reg_n_0,
      I5 => \GEN_SYNC_READ.s_axi_lite_rdata_reg[6]\,
      O => D(9)
    );
\GEN_SYNC_READ.s_axi_lite_rdata[16]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F888"
    )
        port map (
      I0 => \^gen_reg_for_smpl.buffer_address_i_reg[31]_0\(16),
      I1 => \GEN_SYNC_READ.s_axi_lite_rdata_reg[2]\,
      I2 => \dmacr_i_reg_n_0_[16]\,
      I3 => \GEN_SYNC_READ.s_axi_lite_rdata_reg[2]_0\,
      O => D(10)
    );
\GEN_SYNC_READ.s_axi_lite_rdata[17]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F888"
    )
        port map (
      I0 => \^gen_reg_for_smpl.buffer_address_i_reg[31]_0\(17),
      I1 => \GEN_SYNC_READ.s_axi_lite_rdata_reg[2]\,
      I2 => \dmacr_i_reg_n_0_[17]\,
      I3 => \GEN_SYNC_READ.s_axi_lite_rdata_reg[2]_0\,
      O => D(11)
    );
\GEN_SYNC_READ.s_axi_lite_rdata[18]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F888"
    )
        port map (
      I0 => \^gen_reg_for_smpl.buffer_address_i_reg[31]_0\(18),
      I1 => \GEN_SYNC_READ.s_axi_lite_rdata_reg[2]\,
      I2 => \dmacr_i_reg_n_0_[18]\,
      I3 => \GEN_SYNC_READ.s_axi_lite_rdata_reg[2]_0\,
      O => D(12)
    );
\GEN_SYNC_READ.s_axi_lite_rdata[19]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F888"
    )
        port map (
      I0 => \^gen_reg_for_smpl.buffer_address_i_reg[31]_0\(19),
      I1 => \GEN_SYNC_READ.s_axi_lite_rdata_reg[2]\,
      I2 => \dmacr_i_reg_n_0_[19]\,
      I3 => \GEN_SYNC_READ.s_axi_lite_rdata_reg[2]_0\,
      O => D(13)
    );
\GEN_SYNC_READ.s_axi_lite_rdata[20]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F888"
    )
        port map (
      I0 => \^gen_reg_for_smpl.buffer_address_i_reg[31]_0\(20),
      I1 => \GEN_SYNC_READ.s_axi_lite_rdata_reg[2]\,
      I2 => \dmacr_i_reg_n_0_[20]\,
      I3 => \GEN_SYNC_READ.s_axi_lite_rdata_reg[2]_0\,
      O => D(14)
    );
\GEN_SYNC_READ.s_axi_lite_rdata[21]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F888"
    )
        port map (
      I0 => \^gen_reg_for_smpl.buffer_address_i_reg[31]_0\(21),
      I1 => \GEN_SYNC_READ.s_axi_lite_rdata_reg[2]\,
      I2 => \dmacr_i_reg_n_0_[21]\,
      I3 => \GEN_SYNC_READ.s_axi_lite_rdata_reg[2]_0\,
      O => D(15)
    );
\GEN_SYNC_READ.s_axi_lite_rdata[22]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F888"
    )
        port map (
      I0 => \^gen_reg_for_smpl.buffer_address_i_reg[31]_0\(22),
      I1 => \GEN_SYNC_READ.s_axi_lite_rdata_reg[2]\,
      I2 => \dmacr_i_reg_n_0_[22]\,
      I3 => \GEN_SYNC_READ.s_axi_lite_rdata_reg[2]_0\,
      O => D(16)
    );
\GEN_SYNC_READ.s_axi_lite_rdata[23]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F888"
    )
        port map (
      I0 => \^gen_reg_for_smpl.buffer_address_i_reg[31]_0\(23),
      I1 => \GEN_SYNC_READ.s_axi_lite_rdata_reg[2]\,
      I2 => \dmacr_i_reg_n_0_[23]\,
      I3 => \GEN_SYNC_READ.s_axi_lite_rdata_reg[2]_0\,
      O => D(17)
    );
\GEN_SYNC_READ.s_axi_lite_rdata[24]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F888"
    )
        port map (
      I0 => \^gen_reg_for_smpl.buffer_address_i_reg[31]_0\(24),
      I1 => \GEN_SYNC_READ.s_axi_lite_rdata_reg[2]\,
      I2 => \dmacr_i_reg_n_0_[24]\,
      I3 => \GEN_SYNC_READ.s_axi_lite_rdata_reg[2]_0\,
      O => D(18)
    );
\GEN_SYNC_READ.s_axi_lite_rdata[25]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F888"
    )
        port map (
      I0 => \^gen_reg_for_smpl.buffer_address_i_reg[31]_0\(25),
      I1 => \GEN_SYNC_READ.s_axi_lite_rdata_reg[2]\,
      I2 => \dmacr_i_reg_n_0_[25]\,
      I3 => \GEN_SYNC_READ.s_axi_lite_rdata_reg[2]_0\,
      O => D(19)
    );
\GEN_SYNC_READ.s_axi_lite_rdata[26]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F888"
    )
        port map (
      I0 => \^gen_reg_for_smpl.buffer_address_i_reg[31]_0\(26),
      I1 => \GEN_SYNC_READ.s_axi_lite_rdata_reg[2]\,
      I2 => \dmacr_i_reg_n_0_[26]\,
      I3 => \GEN_SYNC_READ.s_axi_lite_rdata_reg[2]_0\,
      O => D(20)
    );
\GEN_SYNC_READ.s_axi_lite_rdata[27]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F888"
    )
        port map (
      I0 => \^gen_reg_for_smpl.buffer_address_i_reg[31]_0\(27),
      I1 => \GEN_SYNC_READ.s_axi_lite_rdata_reg[2]\,
      I2 => \dmacr_i_reg_n_0_[27]\,
      I3 => \GEN_SYNC_READ.s_axi_lite_rdata_reg[2]_0\,
      O => D(21)
    );
\GEN_SYNC_READ.s_axi_lite_rdata[28]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F888"
    )
        port map (
      I0 => \^gen_reg_for_smpl.buffer_address_i_reg[31]_0\(28),
      I1 => \GEN_SYNC_READ.s_axi_lite_rdata_reg[2]\,
      I2 => \dmacr_i_reg_n_0_[28]\,
      I3 => \GEN_SYNC_READ.s_axi_lite_rdata_reg[2]_0\,
      O => D(22)
    );
\GEN_SYNC_READ.s_axi_lite_rdata[29]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F888"
    )
        port map (
      I0 => \^gen_reg_for_smpl.buffer_address_i_reg[31]_0\(29),
      I1 => \GEN_SYNC_READ.s_axi_lite_rdata_reg[2]\,
      I2 => \dmacr_i_reg_n_0_[29]\,
      I3 => \GEN_SYNC_READ.s_axi_lite_rdata_reg[2]_0\,
      O => D(23)
    );
\GEN_SYNC_READ.s_axi_lite_rdata[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \^gen_reg_for_smpl.buffer_address_i_reg[31]_0\(2),
      I1 => \GEN_SYNC_READ.s_axi_lite_rdata_reg[2]\,
      I2 => \GEN_SYNC_READ.s_axi_lite_rdata_reg[2]_0\,
      I3 => \^dmacr_i_reg[2]_0\,
      I4 => \^gen_reg_for_smpl.buffer_length_i_reg[13]_0\(2),
      I5 => \GEN_SYNC_READ.s_axi_lite_rdata_reg[2]_1\,
      O => D(0)
    );
\GEN_SYNC_READ.s_axi_lite_rdata[30]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F888"
    )
        port map (
      I0 => \^gen_reg_for_smpl.buffer_address_i_reg[31]_0\(30),
      I1 => \GEN_SYNC_READ.s_axi_lite_rdata_reg[2]\,
      I2 => \dmacr_i_reg_n_0_[30]\,
      I3 => \GEN_SYNC_READ.s_axi_lite_rdata_reg[2]_0\,
      O => D(24)
    );
\GEN_SYNC_READ.s_axi_lite_rdata[31]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F888"
    )
        port map (
      I0 => \^gen_reg_for_smpl.buffer_address_i_reg[31]_0\(31),
      I1 => \GEN_SYNC_READ.s_axi_lite_rdata_reg[2]\,
      I2 => \dmacr_i_reg_n_0_[31]\,
      I3 => \GEN_SYNC_READ.s_axi_lite_rdata_reg[2]_0\,
      O => D(25)
    );
\GEN_SYNC_READ.s_axi_lite_rdata[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \^gen_reg_for_smpl.buffer_address_i_reg[31]_0\(3),
      I1 => \GEN_SYNC_READ.s_axi_lite_rdata_reg[2]\,
      I2 => mm2s_dmacr(3),
      I3 => \GEN_SYNC_READ.s_axi_lite_rdata_reg[2]_0\,
      I4 => \^gen_reg_for_smpl.buffer_length_i_reg[13]_0\(3),
      I5 => \GEN_SYNC_READ.s_axi_lite_rdata_reg[2]_1\,
      O => D(1)
    );
\GEN_SYNC_READ.s_axi_lite_rdata[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \^gen_reg_for_smpl.buffer_address_i_reg[31]_0\(6),
      I1 => \GEN_SYNC_READ.s_axi_lite_rdata_reg[2]\,
      I2 => \GEN_SYNC_READ.s_axi_lite_rdata_reg[6]\,
      I3 => \^dma_decerr_reg_0\,
      I4 => \^gen_reg_for_smpl.buffer_length_i_reg[13]_0\(6),
      I5 => \GEN_SYNC_READ.s_axi_lite_rdata_reg[2]_1\,
      O => D(2)
    );
\GEN_SYNC_READ.s_axi_lite_rdata[7]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F888"
    )
        port map (
      I0 => \^gen_reg_for_smpl.buffer_address_i_reg[31]_0\(7),
      I1 => \GEN_SYNC_READ.s_axi_lite_rdata_reg[7]\,
      I2 => \^gen_reg_for_smpl.buffer_length_i_reg[13]_0\(7),
      I3 => \GEN_SYNC_READ.s_axi_lite_rdata_reg[7]_0\,
      O => D(3)
    );
\GEN_SYNC_READ.s_axi_lite_rdata[8]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F888"
    )
        port map (
      I0 => \^gen_reg_for_smpl.buffer_address_i_reg[31]_0\(8),
      I1 => \GEN_SYNC_READ.s_axi_lite_rdata_reg[7]\,
      I2 => \^gen_reg_for_smpl.buffer_length_i_reg[13]_0\(8),
      I3 => \GEN_SYNC_READ.s_axi_lite_rdata_reg[7]_0\,
      O => D(4)
    );
\GEN_SYNC_READ.s_axi_lite_rdata[9]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F888"
    )
        port map (
      I0 => \^gen_reg_for_smpl.buffer_address_i_reg[31]_0\(9),
      I1 => \GEN_SYNC_READ.s_axi_lite_rdata_reg[7]\,
      I2 => \^gen_reg_for_smpl.buffer_length_i_reg[13]_0\(9),
      I3 => \GEN_SYNC_READ.s_axi_lite_rdata_reg[7]_0\,
      O => D(5)
    );
dma_decerr_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_lite_aclk,
      CE => '1',
      D => dma_decerr_reg_1,
      Q => \^dma_decerr_reg_0\,
      R => \dmacr_i_reg[4]_1\(0)
    );
dma_interr_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_lite_aclk,
      CE => '1',
      D => dma_interr_reg_1,
      Q => \^dma_interr_reg_0\,
      R => \dmacr_i_reg[4]_1\(0)
    );
dma_slverr_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_lite_aclk,
      CE => '1',
      D => dma_slverr_reg_1,
      Q => \^dma_slverr_reg_0\,
      R => \dmacr_i_reg[4]_1\(0)
    );
\dmacr_i[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0002"
    )
        port map (
      I0 => \dmacr_i[0]_i_2_n_0\,
      I1 => \^dma_slverr_reg_0\,
      I2 => \^dma_interr_reg_0\,
      I3 => \^dma_decerr_reg_0\,
      O => \dmacr_i[0]_i_1_n_0\
    );
\dmacr_i[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000008A80"
    )
        port map (
      I0 => \out\,
      I1 => s_axi_lite_wdata(0),
      I2 => axi2ip_wrce(0),
      I3 => \^dmacr_i_reg[0]_0\,
      I4 => \^dmacr_i_reg[2]_0\,
      I5 => mm2s_stop,
      O => \dmacr_i[0]_i_2_n_0\
    );
\dmacr_i[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00EA"
    )
        port map (
      I0 => \^dmacr_i_reg[2]_0\,
      I1 => axi2ip_wrce(0),
      I2 => s_axi_lite_wdata(2),
      I3 => soft_reset_clr,
      O => \dmacr_i[2]_i_1_n_0\
    );
\dmacr_i_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_lite_aclk,
      CE => '1',
      D => \dmacr_i[0]_i_1_n_0\,
      Q => \^dmacr_i_reg[0]_0\,
      R => '0'
    );
\dmacr_i_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_lite_aclk,
      CE => axi2ip_wrce(0),
      D => s_axi_lite_wdata(12),
      Q => \^q\(0),
      R => \dmacr_i_reg[4]_1\(0)
    );
\dmacr_i_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_lite_aclk,
      CE => axi2ip_wrce(0),
      D => s_axi_lite_wdata(13),
      Q => \dmacr_i_reg_n_0_[13]\,
      R => \dmacr_i_reg[4]_1\(0)
    );
\dmacr_i_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_lite_aclk,
      CE => axi2ip_wrce(0),
      D => s_axi_lite_wdata(14),
      Q => \dmacr_i_reg_n_0_[14]\,
      R => \dmacr_i_reg[4]_1\(0)
    );
\dmacr_i_reg[16]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_lite_aclk,
      CE => axi2ip_wrce(0),
      D => s_axi_lite_wdata(16),
      Q => \dmacr_i_reg_n_0_[16]\,
      S => SS(0)
    );
\dmacr_i_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_lite_aclk,
      CE => axi2ip_wrce(0),
      D => s_axi_lite_wdata(17),
      Q => \dmacr_i_reg_n_0_[17]\,
      R => SS(0)
    );
\dmacr_i_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_lite_aclk,
      CE => axi2ip_wrce(0),
      D => s_axi_lite_wdata(18),
      Q => \dmacr_i_reg_n_0_[18]\,
      R => SS(0)
    );
\dmacr_i_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_lite_aclk,
      CE => axi2ip_wrce(0),
      D => s_axi_lite_wdata(19),
      Q => \dmacr_i_reg_n_0_[19]\,
      R => SS(0)
    );
\dmacr_i_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_lite_aclk,
      CE => axi2ip_wrce(0),
      D => s_axi_lite_wdata(20),
      Q => \dmacr_i_reg_n_0_[20]\,
      R => SS(0)
    );
\dmacr_i_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_lite_aclk,
      CE => axi2ip_wrce(0),
      D => s_axi_lite_wdata(21),
      Q => \dmacr_i_reg_n_0_[21]\,
      R => SS(0)
    );
\dmacr_i_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_lite_aclk,
      CE => axi2ip_wrce(0),
      D => s_axi_lite_wdata(22),
      Q => \dmacr_i_reg_n_0_[22]\,
      R => SS(0)
    );
\dmacr_i_reg[23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_lite_aclk,
      CE => axi2ip_wrce(0),
      D => s_axi_lite_wdata(23),
      Q => \dmacr_i_reg_n_0_[23]\,
      R => SS(0)
    );
\dmacr_i_reg[24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_lite_aclk,
      CE => axi2ip_wrce(0),
      D => s_axi_lite_wdata(24),
      Q => \dmacr_i_reg_n_0_[24]\,
      R => \dmacr_i_reg[4]_1\(0)
    );
\dmacr_i_reg[25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_lite_aclk,
      CE => axi2ip_wrce(0),
      D => s_axi_lite_wdata(25),
      Q => \dmacr_i_reg_n_0_[25]\,
      R => \dmacr_i_reg[4]_1\(0)
    );
\dmacr_i_reg[26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_lite_aclk,
      CE => axi2ip_wrce(0),
      D => s_axi_lite_wdata(26),
      Q => \dmacr_i_reg_n_0_[26]\,
      R => \dmacr_i_reg[4]_1\(0)
    );
\dmacr_i_reg[27]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_lite_aclk,
      CE => axi2ip_wrce(0),
      D => s_axi_lite_wdata(27),
      Q => \dmacr_i_reg_n_0_[27]\,
      R => \dmacr_i_reg[4]_1\(0)
    );
\dmacr_i_reg[28]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_lite_aclk,
      CE => axi2ip_wrce(0),
      D => s_axi_lite_wdata(28),
      Q => \dmacr_i_reg_n_0_[28]\,
      R => \dmacr_i_reg[4]_1\(0)
    );
\dmacr_i_reg[29]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_lite_aclk,
      CE => axi2ip_wrce(0),
      D => s_axi_lite_wdata(29),
      Q => \dmacr_i_reg_n_0_[29]\,
      R => \dmacr_i_reg[4]_1\(0)
    );
\dmacr_i_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_lite_aclk,
      CE => '1',
      D => \dmacr_i[2]_i_1_n_0\,
      Q => \^dmacr_i_reg[2]_0\,
      R => '0'
    );
\dmacr_i_reg[30]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_lite_aclk,
      CE => axi2ip_wrce(0),
      D => s_axi_lite_wdata(30),
      Q => \dmacr_i_reg_n_0_[30]\,
      R => \dmacr_i_reg[4]_1\(0)
    );
\dmacr_i_reg[31]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_lite_aclk,
      CE => axi2ip_wrce(0),
      D => s_axi_lite_wdata(31),
      Q => \dmacr_i_reg_n_0_[31]\,
      R => \dmacr_i_reg[4]_1\(0)
    );
\dmacr_i_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_lite_aclk,
      CE => axi2ip_wrce(0),
      D => s_axi_lite_wdata(3),
      Q => mm2s_dmacr(3),
      R => \dmacr_i_reg[4]_1\(0)
    );
\dmacr_i_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_lite_aclk,
      CE => axi2ip_wrce(0),
      D => s_axi_lite_wdata(4),
      Q => \dmacr_i_reg[4]_0\(0),
      R => \dmacr_i_reg[4]_1\(0)
    );
err_irq_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"5DFF0C0C"
    )
        port map (
      I0 => s_axi_lite_wdata(14),
      I1 => error_d1_i_1_n_0,
      I2 => error_d1,
      I3 => p_0_in1_in,
      I4 => err_irq_reg_n_0,
      O => err_irq_i_1_n_0
    );
err_irq_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_lite_aclk,
      CE => '1',
      D => err_irq_i_1_n_0,
      Q => err_irq_reg_n_0,
      R => \dmacr_i_reg[4]_1\(0)
    );
error_d1_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => \^dma_decerr_reg_0\,
      I1 => \^dma_interr_reg_0\,
      I2 => \^dma_slverr_reg_0\,
      O => error_d1_i_1_n_0
    );
error_d1_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_lite_aclk,
      CE => '1',
      D => error_d1_i_1_n_0,
      Q => error_d1,
      R => \dmacr_i_reg[4]_1\(0)
    );
halted_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_lite_aclk,
      CE => '1',
      D => halted_reg_0,
      Q => mm2s_dmasr(0),
      R => '0'
    );
idle_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_lite_aclk,
      CE => '1',
      D => idle_reg_1,
      Q => idle_reg_0,
      R => '0'
    );
introut_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4444400040004000"
    )
        port map (
      I0 => \^dmacr_i_reg[2]_0\,
      I1 => \out\,
      I2 => err_irq_reg_n_0,
      I3 => \dmacr_i_reg_n_0_[14]\,
      I4 => \^ioc_irq_reg_0\,
      I5 => \^q\(0),
      O => introut_i_1_n_0
    );
introut_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_lite_aclk,
      CE => '1',
      D => introut_i_1_n_0,
      Q => mm2s_introut,
      R => '0'
    );
ioc_irq_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F7F0"
    )
        port map (
      I0 => s_axi_lite_wdata(12),
      I1 => p_0_in1_in,
      I2 => axi_dma_tstvec(0),
      I3 => \^ioc_irq_reg_0\,
      O => ioc_irq_i_1_n_0
    );
ioc_irq_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_lite_aclk,
      CE => '1',
      D => ioc_irq_i_1_n_0,
      Q => \^ioc_irq_reg_0\,
      R => \dmacr_i_reg[4]_1\(0)
    );
mm2s_halted_set_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"44450000"
    )
        port map (
      I0 => \^dmacr_i_reg[0]_0\,
      I1 => mm2s_halt_cmplt,
      I2 => \^dmacr_i_reg[2]_0\,
      I3 => dma_mm2s_error,
      I4 => mm2s_all_idle,
      O => mm2s_halted_set0
    );
soft_reset_re_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^dmacr_i_reg[2]_0\,
      I1 => soft_reset_d1,
      O => soft_reset_re0
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_dma_reset is
  port (
    \out\ : out STD_LOGIC;
    \GNE_SYNC_RESET.prmry_resetn_reg_0\ : out STD_LOGIC;
    \GNE_SYNC_RESET.s_soft_reset_i_reg_0\ : out STD_LOGIC;
    mm2s_prmry_reset_out_n : out STD_LOGIC;
    mm2s_cntrl_reset_out_n : out STD_LOGIC;
    soft_reset_d1 : out STD_LOGIC;
    \GNE_SYNC_RESET.scndry_resetn_reg_0\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    \GNE_SYNC_RESET.halt_i_reg_0\ : out STD_LOGIC;
    \GNE_SYNC_RESET.min_assert_sftrst_reg_0\ : out STD_LOGIC;
    s_axi_lite_aclk : in STD_LOGIC;
    mm2s_all_idle : in STD_LOGIC;
    soft_reset : in STD_LOGIC;
    soft_reset_re0 : in STD_LOGIC;
    mm2s_halt_cmplt : in STD_LOGIC;
    soft_reset_clr : in STD_LOGIC;
    dest_rst : in STD_LOGIC;
    mm2s_stop : in STD_LOGIC;
    sig_rst2all_stop_request : in STD_LOGIC
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_dma_reset;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_dma_reset is
  signal \GNE_SYNC_RESET.halt_i_i_1_n_0\ : STD_LOGIC;
  signal \GNE_SYNC_RESET.min_assert_sftrst_i_1_n_0\ : STD_LOGIC;
  signal \GNE_SYNC_RESET.prmry_reset_out_n_reg0\ : STD_LOGIC;
  signal \GNE_SYNC_RESET.s_soft_reset_i_i_1_n_0\ : STD_LOGIC;
  signal assert_sftrst_d1 : STD_LOGIC;
  signal dm_mm2s_scndry_resetn : STD_LOGIC;
  attribute RTL_KEEP : string;
  attribute RTL_KEEP of dm_mm2s_scndry_resetn : signal is "true";
  attribute equivalent_register_removal : string;
  attribute equivalent_register_removal of dm_mm2s_scndry_resetn : signal is "no";
  signal min_assert_sftrst : STD_LOGIC;
  signal mm2s_halt : STD_LOGIC;
  signal \^out\ : STD_LOGIC;
  attribute RTL_KEEP of \out\ : signal is "true";
  attribute equivalent_register_removal of \out\ : signal is "no";
  signal s_soft_reset_i : STD_LOGIC;
  signal s_soft_reset_i_d1 : STD_LOGIC;
  signal s_soft_reset_i_re : STD_LOGIC;
  signal sft_rst_dly1 : STD_LOGIC;
  signal sft_rst_dly2 : STD_LOGIC;
  signal sft_rst_dly3 : STD_LOGIC;
  signal sft_rst_dly4 : STD_LOGIC;
  signal sft_rst_dly5 : STD_LOGIC;
  signal sft_rst_dly6 : STD_LOGIC;
  signal sft_rst_dly7 : STD_LOGIC;
  signal soft_reset_re : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \GEN_RESET_FOR_MM2S.mm2s_soft_reset_done_i_1\ : label is "soft_lutpair126";
  attribute SOFT_HLUTNM of \GNE_SYNC_RESET.prmry_reset_out_n_i_1\ : label is "soft_lutpair126";
  attribute KEEP : string;
  attribute KEEP of \GNE_SYNC_RESET.prmry_reset_out_n_reg\ : label is "yes";
  attribute equivalent_register_removal of \GNE_SYNC_RESET.prmry_reset_out_n_reg\ : label is "no";
  attribute KEEP of \GNE_SYNC_RESET.prmry_resetn_reg\ : label is "yes";
  attribute equivalent_register_removal of \GNE_SYNC_RESET.prmry_resetn_reg\ : label is "no";
  attribute KEEP of \GNE_SYNC_RESET.scndry_resetn_reg\ : label is "yes";
  attribute equivalent_register_removal of \GNE_SYNC_RESET.scndry_resetn_reg\ : label is "no";
begin
  \out\ <= \^out\;
\GEN_MM2S_FULL.I_MM2S_FULL_WRAPPER/I_RESET/sig_s_h_halt_reg_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => mm2s_halt,
      I1 => sig_rst2all_stop_request,
      O => \GNE_SYNC_RESET.halt_i_reg_0\
    );
\GEN_RESET_FOR_MM2S.mm2s_soft_reset_done_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0040"
    )
        port map (
      I0 => min_assert_sftrst,
      I1 => assert_sftrst_d1,
      I2 => dest_rst,
      I3 => soft_reset_clr,
      O => \GNE_SYNC_RESET.min_assert_sftrst_reg_0\
    );
\GNE_SYNC_RESET.halt_i_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0404040404040400"
    )
        port map (
      I0 => min_assert_sftrst,
      I1 => dest_rst,
      I2 => s_soft_reset_i,
      I3 => mm2s_halt,
      I4 => mm2s_stop,
      I5 => soft_reset_re,
      O => \GNE_SYNC_RESET.halt_i_i_1_n_0\
    );
\GNE_SYNC_RESET.halt_i_reg\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_lite_aclk,
      CE => '1',
      D => \GNE_SYNC_RESET.halt_i_i_1_n_0\,
      Q => mm2s_halt,
      R => '0'
    );
\GNE_SYNC_RESET.min_assert_sftrst_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4F44"
    )
        port map (
      I0 => sft_rst_dly7,
      I1 => min_assert_sftrst,
      I2 => s_soft_reset_i_d1,
      I3 => s_soft_reset_i,
      O => \GNE_SYNC_RESET.min_assert_sftrst_i_1_n_0\
    );
\GNE_SYNC_RESET.min_assert_sftrst_reg\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_lite_aclk,
      CE => '1',
      D => \GNE_SYNC_RESET.min_assert_sftrst_i_1_n_0\,
      Q => min_assert_sftrst,
      R => '0'
    );
\GNE_SYNC_RESET.prmry_reset_out_n_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
        port map (
      I0 => min_assert_sftrst,
      I1 => dest_rst,
      I2 => s_soft_reset_i,
      O => \GNE_SYNC_RESET.prmry_reset_out_n_reg0\
    );
\GNE_SYNC_RESET.prmry_reset_out_n_reg\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => s_axi_lite_aclk,
      CE => '1',
      D => \GNE_SYNC_RESET.prmry_reset_out_n_reg0\,
      Q => mm2s_prmry_reset_out_n,
      R => '0'
    );
\GNE_SYNC_RESET.prmry_resetn_reg\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_lite_aclk,
      CE => '1',
      D => dm_mm2s_scndry_resetn,
      Q => \GNE_SYNC_RESET.prmry_resetn_reg_0\,
      R => '0'
    );
\GNE_SYNC_RESET.s_soft_reset_i_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80FF8080"
    )
        port map (
      I0 => mm2s_all_idle,
      I1 => mm2s_halt_cmplt,
      I2 => soft_reset,
      I3 => soft_reset_clr,
      I4 => s_soft_reset_i,
      O => \GNE_SYNC_RESET.s_soft_reset_i_i_1_n_0\
    );
\GNE_SYNC_RESET.s_soft_reset_i_reg\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_lite_aclk,
      CE => '1',
      D => \GNE_SYNC_RESET.s_soft_reset_i_i_1_n_0\,
      Q => s_soft_reset_i,
      R => '0'
    );
\GNE_SYNC_RESET.scndry_resetn_reg\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => s_axi_lite_aclk,
      CE => '1',
      D => dm_mm2s_scndry_resetn,
      Q => \^out\,
      R => '0'
    );
\GNE_SYNC_RESET.sft_rst_dly1_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => s_soft_reset_i,
      I1 => s_soft_reset_i_d1,
      O => s_soft_reset_i_re
    );
\GNE_SYNC_RESET.sft_rst_dly1_reg\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_lite_aclk,
      CE => mm2s_all_idle,
      D => '0',
      Q => sft_rst_dly1,
      S => s_soft_reset_i_re
    );
\GNE_SYNC_RESET.sft_rst_dly2_reg\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_lite_aclk,
      CE => mm2s_all_idle,
      D => sft_rst_dly1,
      Q => sft_rst_dly2,
      R => s_soft_reset_i_re
    );
\GNE_SYNC_RESET.sft_rst_dly3_reg\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_lite_aclk,
      CE => mm2s_all_idle,
      D => sft_rst_dly2,
      Q => sft_rst_dly3,
      R => s_soft_reset_i_re
    );
\GNE_SYNC_RESET.sft_rst_dly4_reg\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_lite_aclk,
      CE => mm2s_all_idle,
      D => sft_rst_dly3,
      Q => sft_rst_dly4,
      R => s_soft_reset_i_re
    );
\GNE_SYNC_RESET.sft_rst_dly5_reg\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_lite_aclk,
      CE => mm2s_all_idle,
      D => sft_rst_dly4,
      Q => sft_rst_dly5,
      R => s_soft_reset_i_re
    );
\GNE_SYNC_RESET.sft_rst_dly6_reg\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_lite_aclk,
      CE => mm2s_all_idle,
      D => sft_rst_dly5,
      Q => sft_rst_dly6,
      R => s_soft_reset_i_re
    );
\GNE_SYNC_RESET.sft_rst_dly7_reg\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_lite_aclk,
      CE => mm2s_all_idle,
      D => sft_rst_dly6,
      Q => sft_rst_dly7,
      R => s_soft_reset_i_re
    );
assert_sftrst_d1_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_lite_aclk,
      CE => '1',
      D => min_assert_sftrst,
      Q => assert_sftrst_d1,
      R => '0'
    );
dm_prmry_resetn_inst: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => dm_mm2s_scndry_resetn,
      O => \GNE_SYNC_RESET.s_soft_reset_i_reg_0\
    );
\dmacr_i[4]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^out\,
      O => \GNE_SYNC_RESET.scndry_resetn_reg_0\(0)
    );
i_0: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '1',
      O => mm2s_cntrl_reset_out_n
    );
resetn_i: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
        port map (
      I0 => s_soft_reset_i,
      I1 => dest_rst,
      I2 => min_assert_sftrst,
      O => dm_mm2s_scndry_resetn
    );
s_soft_reset_i_d1_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_lite_aclk,
      CE => '1',
      D => s_soft_reset_i,
      Q => s_soft_reset_i_d1,
      R => '0'
    );
soft_reset_d1_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_lite_aclk,
      CE => '1',
      D => soft_reset,
      Q => soft_reset_d1,
      R => '0'
    );
soft_reset_re_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_lite_aclk,
      CE => '1',
      D => soft_reset_re0,
      Q => soft_reset_re,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_dma_smple_sm is
  port (
    mm2s_cmnd_wr_1 : out STD_LOGIC;
    mm2s_sts_received_clr : out STD_LOGIC;
    cmnds_queued : out STD_LOGIC;
    Q : out STD_LOGIC_VECTOR ( 1 downto 0 );
    mm2s_all_idle : out STD_LOGIC;
    sts_received_clr_reg_0 : out STD_LOGIC;
    \GEN_CMD_BTT_LESS_23.cmnd_wr_i_reg_0\ : out STD_LOGIC;
    \GEN_CMD_BTT_LESS_23.cmnd_data_reg[66]_0\ : out STD_LOGIC_VECTOR ( 47 downto 0 );
    halted1 : in STD_LOGIC;
    write_cmnd_cmb : in STD_LOGIC;
    s_axi_lite_aclk : in STD_LOGIC;
    cmnds_queued_reg_0 : in STD_LOGIC;
    mm2s_stop_i : in STD_LOGIC;
    mm2s_dmacr : in STD_LOGIC_VECTOR ( 0 to 0 );
    mm2s_length_wren : in STD_LOGIC;
    sts_received_i_reg : in STD_LOGIC;
    sts_received_clr_reg_1 : in STD_LOGIC;
    soft_reset : in STD_LOGIC;
    \out\ : in STD_LOGIC;
    m_axis_mm2s_sts_tvalid_int : in STD_LOGIC;
    s_axis_mm2s_cmd_tready : in STD_LOGIC;
    \GEN_NO_HOLD_DATA.s_axis_mm2s_cmd_tvalid_reg\ : in STD_LOGIC;
    D : in STD_LOGIC_VECTOR ( 1 downto 0 );
    \GEN_CMD_BTT_LESS_23.cmnd_data_reg[66]_1\ : in STD_LOGIC;
    \GEN_CMD_BTT_LESS_23.cmnd_data_reg[66]_2\ : in STD_LOGIC_VECTOR ( 31 downto 0 );
    \GEN_CMD_BTT_LESS_23.cmnd_data_reg[26]_0\ : in STD_LOGIC;
    \GEN_CMD_BTT_LESS_23.cmnd_data_reg[13]_0\ : in STD_LOGIC_VECTOR ( 13 downto 0 )
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_dma_smple_sm;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_dma_smple_sm is
  signal \FSM_sequential_smpl_cs[1]_i_1_n_0\ : STD_LOGIC;
  signal \GEN_CMD_BTT_LESS_23.cmnd_data[33]_i_1_n_0\ : STD_LOGIC;
  signal \^gen_cmd_btt_less_23.cmnd_data_reg[66]_0\ : STD_LOGIC_VECTOR ( 47 downto 0 );
  signal \^q\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \^cmnds_queued\ : STD_LOGIC;
  signal \^mm2s_cmnd_wr_1\ : STD_LOGIC;
  signal \^mm2s_sts_received_clr\ : STD_LOGIC;
  signal sts_received_clr_cmb : STD_LOGIC;
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \FSM_sequential_smpl_cs_reg[0]\ : label is "execute_xfer:01,wait_status:10,idle:00";
  attribute FSM_ENCODED_STATES of \FSM_sequential_smpl_cs_reg[1]\ : label is "execute_xfer:01,wait_status:10,idle:00";
begin
  \GEN_CMD_BTT_LESS_23.cmnd_data_reg[66]_0\(47 downto 0) <= \^gen_cmd_btt_less_23.cmnd_data_reg[66]_0\(47 downto 0);
  Q(1 downto 0) <= \^q\(1 downto 0);
  cmnds_queued <= \^cmnds_queued\;
  mm2s_cmnd_wr_1 <= \^mm2s_cmnd_wr_1\;
  mm2s_sts_received_clr <= \^mm2s_sts_received_clr\;
\FSM_sequential_smpl_cs[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6667666666666666"
    )
        port map (
      I0 => \^q\(0),
      I1 => \^q\(1),
      I2 => mm2s_stop_i,
      I3 => \^cmnds_queued\,
      I4 => mm2s_dmacr(0),
      I5 => mm2s_length_wren,
      O => \FSM_sequential_smpl_cs[1]_i_1_n_0\
    );
\FSM_sequential_smpl_cs_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_lite_aclk,
      CE => \FSM_sequential_smpl_cs[1]_i_1_n_0\,
      D => D(0),
      Q => \^q\(0),
      R => halted1
    );
\FSM_sequential_smpl_cs_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_lite_aclk,
      CE => \FSM_sequential_smpl_cs[1]_i_1_n_0\,
      D => D(1),
      Q => \^q\(1),
      R => halted1
    );
\GEN_CMD_BTT_LESS_23.cmnd_data[33]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \out\,
      I1 => \GEN_CMD_BTT_LESS_23.cmnd_data_reg[66]_1\,
      I2 => \^gen_cmd_btt_less_23.cmnd_data_reg[66]_0\(15),
      O => \GEN_CMD_BTT_LESS_23.cmnd_data[33]_i_1_n_0\
    );
\GEN_CMD_BTT_LESS_23.cmnd_data_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_lite_aclk,
      CE => \GEN_CMD_BTT_LESS_23.cmnd_data_reg[66]_1\,
      D => \GEN_CMD_BTT_LESS_23.cmnd_data_reg[13]_0\(0),
      Q => \^gen_cmd_btt_less_23.cmnd_data_reg[66]_0\(0),
      R => halted1
    );
\GEN_CMD_BTT_LESS_23.cmnd_data_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_lite_aclk,
      CE => \GEN_CMD_BTT_LESS_23.cmnd_data_reg[66]_1\,
      D => \GEN_CMD_BTT_LESS_23.cmnd_data_reg[13]_0\(10),
      Q => \^gen_cmd_btt_less_23.cmnd_data_reg[66]_0\(10),
      R => halted1
    );
\GEN_CMD_BTT_LESS_23.cmnd_data_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_lite_aclk,
      CE => \GEN_CMD_BTT_LESS_23.cmnd_data_reg[66]_1\,
      D => \GEN_CMD_BTT_LESS_23.cmnd_data_reg[13]_0\(11),
      Q => \^gen_cmd_btt_less_23.cmnd_data_reg[66]_0\(11),
      R => halted1
    );
\GEN_CMD_BTT_LESS_23.cmnd_data_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_lite_aclk,
      CE => \GEN_CMD_BTT_LESS_23.cmnd_data_reg[66]_1\,
      D => \GEN_CMD_BTT_LESS_23.cmnd_data_reg[13]_0\(12),
      Q => \^gen_cmd_btt_less_23.cmnd_data_reg[66]_0\(12),
      R => halted1
    );
\GEN_CMD_BTT_LESS_23.cmnd_data_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_lite_aclk,
      CE => \GEN_CMD_BTT_LESS_23.cmnd_data_reg[66]_1\,
      D => \GEN_CMD_BTT_LESS_23.cmnd_data_reg[13]_0\(13),
      Q => \^gen_cmd_btt_less_23.cmnd_data_reg[66]_0\(13),
      R => halted1
    );
\GEN_CMD_BTT_LESS_23.cmnd_data_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_lite_aclk,
      CE => \GEN_CMD_BTT_LESS_23.cmnd_data_reg[66]_1\,
      D => \GEN_CMD_BTT_LESS_23.cmnd_data_reg[13]_0\(1),
      Q => \^gen_cmd_btt_less_23.cmnd_data_reg[66]_0\(1),
      R => halted1
    );
\GEN_CMD_BTT_LESS_23.cmnd_data_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_lite_aclk,
      CE => \GEN_CMD_BTT_LESS_23.cmnd_data_reg[66]_1\,
      D => \GEN_CMD_BTT_LESS_23.cmnd_data_reg[26]_0\,
      Q => \^gen_cmd_btt_less_23.cmnd_data_reg[66]_0\(14),
      R => halted1
    );
\GEN_CMD_BTT_LESS_23.cmnd_data_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_lite_aclk,
      CE => \GEN_CMD_BTT_LESS_23.cmnd_data_reg[66]_1\,
      D => \GEN_CMD_BTT_LESS_23.cmnd_data_reg[13]_0\(2),
      Q => \^gen_cmd_btt_less_23.cmnd_data_reg[66]_0\(2),
      R => halted1
    );
\GEN_CMD_BTT_LESS_23.cmnd_data_reg[33]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_lite_aclk,
      CE => '1',
      D => \GEN_CMD_BTT_LESS_23.cmnd_data[33]_i_1_n_0\,
      Q => \^gen_cmd_btt_less_23.cmnd_data_reg[66]_0\(15),
      R => '0'
    );
\GEN_CMD_BTT_LESS_23.cmnd_data_reg[35]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_lite_aclk,
      CE => \GEN_CMD_BTT_LESS_23.cmnd_data_reg[66]_1\,
      D => \GEN_CMD_BTT_LESS_23.cmnd_data_reg[66]_2\(0),
      Q => \^gen_cmd_btt_less_23.cmnd_data_reg[66]_0\(16),
      R => halted1
    );
\GEN_CMD_BTT_LESS_23.cmnd_data_reg[36]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_lite_aclk,
      CE => \GEN_CMD_BTT_LESS_23.cmnd_data_reg[66]_1\,
      D => \GEN_CMD_BTT_LESS_23.cmnd_data_reg[66]_2\(1),
      Q => \^gen_cmd_btt_less_23.cmnd_data_reg[66]_0\(17),
      R => halted1
    );
\GEN_CMD_BTT_LESS_23.cmnd_data_reg[37]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_lite_aclk,
      CE => \GEN_CMD_BTT_LESS_23.cmnd_data_reg[66]_1\,
      D => \GEN_CMD_BTT_LESS_23.cmnd_data_reg[66]_2\(2),
      Q => \^gen_cmd_btt_less_23.cmnd_data_reg[66]_0\(18),
      R => halted1
    );
\GEN_CMD_BTT_LESS_23.cmnd_data_reg[38]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_lite_aclk,
      CE => \GEN_CMD_BTT_LESS_23.cmnd_data_reg[66]_1\,
      D => \GEN_CMD_BTT_LESS_23.cmnd_data_reg[66]_2\(3),
      Q => \^gen_cmd_btt_less_23.cmnd_data_reg[66]_0\(19),
      R => halted1
    );
\GEN_CMD_BTT_LESS_23.cmnd_data_reg[39]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_lite_aclk,
      CE => \GEN_CMD_BTT_LESS_23.cmnd_data_reg[66]_1\,
      D => \GEN_CMD_BTT_LESS_23.cmnd_data_reg[66]_2\(4),
      Q => \^gen_cmd_btt_less_23.cmnd_data_reg[66]_0\(20),
      R => halted1
    );
\GEN_CMD_BTT_LESS_23.cmnd_data_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_lite_aclk,
      CE => \GEN_CMD_BTT_LESS_23.cmnd_data_reg[66]_1\,
      D => \GEN_CMD_BTT_LESS_23.cmnd_data_reg[13]_0\(3),
      Q => \^gen_cmd_btt_less_23.cmnd_data_reg[66]_0\(3),
      R => halted1
    );
\GEN_CMD_BTT_LESS_23.cmnd_data_reg[40]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_lite_aclk,
      CE => \GEN_CMD_BTT_LESS_23.cmnd_data_reg[66]_1\,
      D => \GEN_CMD_BTT_LESS_23.cmnd_data_reg[66]_2\(5),
      Q => \^gen_cmd_btt_less_23.cmnd_data_reg[66]_0\(21),
      R => halted1
    );
\GEN_CMD_BTT_LESS_23.cmnd_data_reg[41]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_lite_aclk,
      CE => \GEN_CMD_BTT_LESS_23.cmnd_data_reg[66]_1\,
      D => \GEN_CMD_BTT_LESS_23.cmnd_data_reg[66]_2\(6),
      Q => \^gen_cmd_btt_less_23.cmnd_data_reg[66]_0\(22),
      R => halted1
    );
\GEN_CMD_BTT_LESS_23.cmnd_data_reg[42]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_lite_aclk,
      CE => \GEN_CMD_BTT_LESS_23.cmnd_data_reg[66]_1\,
      D => \GEN_CMD_BTT_LESS_23.cmnd_data_reg[66]_2\(7),
      Q => \^gen_cmd_btt_less_23.cmnd_data_reg[66]_0\(23),
      R => halted1
    );
\GEN_CMD_BTT_LESS_23.cmnd_data_reg[43]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_lite_aclk,
      CE => \GEN_CMD_BTT_LESS_23.cmnd_data_reg[66]_1\,
      D => \GEN_CMD_BTT_LESS_23.cmnd_data_reg[66]_2\(8),
      Q => \^gen_cmd_btt_less_23.cmnd_data_reg[66]_0\(24),
      R => halted1
    );
\GEN_CMD_BTT_LESS_23.cmnd_data_reg[44]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_lite_aclk,
      CE => \GEN_CMD_BTT_LESS_23.cmnd_data_reg[66]_1\,
      D => \GEN_CMD_BTT_LESS_23.cmnd_data_reg[66]_2\(9),
      Q => \^gen_cmd_btt_less_23.cmnd_data_reg[66]_0\(25),
      R => halted1
    );
\GEN_CMD_BTT_LESS_23.cmnd_data_reg[45]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_lite_aclk,
      CE => \GEN_CMD_BTT_LESS_23.cmnd_data_reg[66]_1\,
      D => \GEN_CMD_BTT_LESS_23.cmnd_data_reg[66]_2\(10),
      Q => \^gen_cmd_btt_less_23.cmnd_data_reg[66]_0\(26),
      R => halted1
    );
\GEN_CMD_BTT_LESS_23.cmnd_data_reg[46]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_lite_aclk,
      CE => \GEN_CMD_BTT_LESS_23.cmnd_data_reg[66]_1\,
      D => \GEN_CMD_BTT_LESS_23.cmnd_data_reg[66]_2\(11),
      Q => \^gen_cmd_btt_less_23.cmnd_data_reg[66]_0\(27),
      R => halted1
    );
\GEN_CMD_BTT_LESS_23.cmnd_data_reg[47]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_lite_aclk,
      CE => \GEN_CMD_BTT_LESS_23.cmnd_data_reg[66]_1\,
      D => \GEN_CMD_BTT_LESS_23.cmnd_data_reg[66]_2\(12),
      Q => \^gen_cmd_btt_less_23.cmnd_data_reg[66]_0\(28),
      R => halted1
    );
\GEN_CMD_BTT_LESS_23.cmnd_data_reg[48]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_lite_aclk,
      CE => \GEN_CMD_BTT_LESS_23.cmnd_data_reg[66]_1\,
      D => \GEN_CMD_BTT_LESS_23.cmnd_data_reg[66]_2\(13),
      Q => \^gen_cmd_btt_less_23.cmnd_data_reg[66]_0\(29),
      R => halted1
    );
\GEN_CMD_BTT_LESS_23.cmnd_data_reg[49]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_lite_aclk,
      CE => \GEN_CMD_BTT_LESS_23.cmnd_data_reg[66]_1\,
      D => \GEN_CMD_BTT_LESS_23.cmnd_data_reg[66]_2\(14),
      Q => \^gen_cmd_btt_less_23.cmnd_data_reg[66]_0\(30),
      R => halted1
    );
\GEN_CMD_BTT_LESS_23.cmnd_data_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_lite_aclk,
      CE => \GEN_CMD_BTT_LESS_23.cmnd_data_reg[66]_1\,
      D => \GEN_CMD_BTT_LESS_23.cmnd_data_reg[13]_0\(4),
      Q => \^gen_cmd_btt_less_23.cmnd_data_reg[66]_0\(4),
      R => halted1
    );
\GEN_CMD_BTT_LESS_23.cmnd_data_reg[50]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_lite_aclk,
      CE => \GEN_CMD_BTT_LESS_23.cmnd_data_reg[66]_1\,
      D => \GEN_CMD_BTT_LESS_23.cmnd_data_reg[66]_2\(15),
      Q => \^gen_cmd_btt_less_23.cmnd_data_reg[66]_0\(31),
      R => halted1
    );
\GEN_CMD_BTT_LESS_23.cmnd_data_reg[51]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_lite_aclk,
      CE => \GEN_CMD_BTT_LESS_23.cmnd_data_reg[66]_1\,
      D => \GEN_CMD_BTT_LESS_23.cmnd_data_reg[66]_2\(16),
      Q => \^gen_cmd_btt_less_23.cmnd_data_reg[66]_0\(32),
      R => halted1
    );
\GEN_CMD_BTT_LESS_23.cmnd_data_reg[52]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_lite_aclk,
      CE => \GEN_CMD_BTT_LESS_23.cmnd_data_reg[66]_1\,
      D => \GEN_CMD_BTT_LESS_23.cmnd_data_reg[66]_2\(17),
      Q => \^gen_cmd_btt_less_23.cmnd_data_reg[66]_0\(33),
      R => halted1
    );
\GEN_CMD_BTT_LESS_23.cmnd_data_reg[53]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_lite_aclk,
      CE => \GEN_CMD_BTT_LESS_23.cmnd_data_reg[66]_1\,
      D => \GEN_CMD_BTT_LESS_23.cmnd_data_reg[66]_2\(18),
      Q => \^gen_cmd_btt_less_23.cmnd_data_reg[66]_0\(34),
      R => halted1
    );
\GEN_CMD_BTT_LESS_23.cmnd_data_reg[54]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_lite_aclk,
      CE => \GEN_CMD_BTT_LESS_23.cmnd_data_reg[66]_1\,
      D => \GEN_CMD_BTT_LESS_23.cmnd_data_reg[66]_2\(19),
      Q => \^gen_cmd_btt_less_23.cmnd_data_reg[66]_0\(35),
      R => halted1
    );
\GEN_CMD_BTT_LESS_23.cmnd_data_reg[55]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_lite_aclk,
      CE => \GEN_CMD_BTT_LESS_23.cmnd_data_reg[66]_1\,
      D => \GEN_CMD_BTT_LESS_23.cmnd_data_reg[66]_2\(20),
      Q => \^gen_cmd_btt_less_23.cmnd_data_reg[66]_0\(36),
      R => halted1
    );
\GEN_CMD_BTT_LESS_23.cmnd_data_reg[56]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_lite_aclk,
      CE => \GEN_CMD_BTT_LESS_23.cmnd_data_reg[66]_1\,
      D => \GEN_CMD_BTT_LESS_23.cmnd_data_reg[66]_2\(21),
      Q => \^gen_cmd_btt_less_23.cmnd_data_reg[66]_0\(37),
      R => halted1
    );
\GEN_CMD_BTT_LESS_23.cmnd_data_reg[57]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_lite_aclk,
      CE => \GEN_CMD_BTT_LESS_23.cmnd_data_reg[66]_1\,
      D => \GEN_CMD_BTT_LESS_23.cmnd_data_reg[66]_2\(22),
      Q => \^gen_cmd_btt_less_23.cmnd_data_reg[66]_0\(38),
      R => halted1
    );
\GEN_CMD_BTT_LESS_23.cmnd_data_reg[58]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_lite_aclk,
      CE => \GEN_CMD_BTT_LESS_23.cmnd_data_reg[66]_1\,
      D => \GEN_CMD_BTT_LESS_23.cmnd_data_reg[66]_2\(23),
      Q => \^gen_cmd_btt_less_23.cmnd_data_reg[66]_0\(39),
      R => halted1
    );
\GEN_CMD_BTT_LESS_23.cmnd_data_reg[59]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_lite_aclk,
      CE => \GEN_CMD_BTT_LESS_23.cmnd_data_reg[66]_1\,
      D => \GEN_CMD_BTT_LESS_23.cmnd_data_reg[66]_2\(24),
      Q => \^gen_cmd_btt_less_23.cmnd_data_reg[66]_0\(40),
      R => halted1
    );
\GEN_CMD_BTT_LESS_23.cmnd_data_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_lite_aclk,
      CE => \GEN_CMD_BTT_LESS_23.cmnd_data_reg[66]_1\,
      D => \GEN_CMD_BTT_LESS_23.cmnd_data_reg[13]_0\(5),
      Q => \^gen_cmd_btt_less_23.cmnd_data_reg[66]_0\(5),
      R => halted1
    );
\GEN_CMD_BTT_LESS_23.cmnd_data_reg[60]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_lite_aclk,
      CE => \GEN_CMD_BTT_LESS_23.cmnd_data_reg[66]_1\,
      D => \GEN_CMD_BTT_LESS_23.cmnd_data_reg[66]_2\(25),
      Q => \^gen_cmd_btt_less_23.cmnd_data_reg[66]_0\(41),
      R => halted1
    );
\GEN_CMD_BTT_LESS_23.cmnd_data_reg[61]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_lite_aclk,
      CE => \GEN_CMD_BTT_LESS_23.cmnd_data_reg[66]_1\,
      D => \GEN_CMD_BTT_LESS_23.cmnd_data_reg[66]_2\(26),
      Q => \^gen_cmd_btt_less_23.cmnd_data_reg[66]_0\(42),
      R => halted1
    );
\GEN_CMD_BTT_LESS_23.cmnd_data_reg[62]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_lite_aclk,
      CE => \GEN_CMD_BTT_LESS_23.cmnd_data_reg[66]_1\,
      D => \GEN_CMD_BTT_LESS_23.cmnd_data_reg[66]_2\(27),
      Q => \^gen_cmd_btt_less_23.cmnd_data_reg[66]_0\(43),
      R => halted1
    );
\GEN_CMD_BTT_LESS_23.cmnd_data_reg[63]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_lite_aclk,
      CE => \GEN_CMD_BTT_LESS_23.cmnd_data_reg[66]_1\,
      D => \GEN_CMD_BTT_LESS_23.cmnd_data_reg[66]_2\(28),
      Q => \^gen_cmd_btt_less_23.cmnd_data_reg[66]_0\(44),
      R => halted1
    );
\GEN_CMD_BTT_LESS_23.cmnd_data_reg[64]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_lite_aclk,
      CE => \GEN_CMD_BTT_LESS_23.cmnd_data_reg[66]_1\,
      D => \GEN_CMD_BTT_LESS_23.cmnd_data_reg[66]_2\(29),
      Q => \^gen_cmd_btt_less_23.cmnd_data_reg[66]_0\(45),
      R => halted1
    );
\GEN_CMD_BTT_LESS_23.cmnd_data_reg[65]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_lite_aclk,
      CE => \GEN_CMD_BTT_LESS_23.cmnd_data_reg[66]_1\,
      D => \GEN_CMD_BTT_LESS_23.cmnd_data_reg[66]_2\(30),
      Q => \^gen_cmd_btt_less_23.cmnd_data_reg[66]_0\(46),
      R => halted1
    );
\GEN_CMD_BTT_LESS_23.cmnd_data_reg[66]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_lite_aclk,
      CE => \GEN_CMD_BTT_LESS_23.cmnd_data_reg[66]_1\,
      D => \GEN_CMD_BTT_LESS_23.cmnd_data_reg[66]_2\(31),
      Q => \^gen_cmd_btt_less_23.cmnd_data_reg[66]_0\(47),
      R => halted1
    );
\GEN_CMD_BTT_LESS_23.cmnd_data_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_lite_aclk,
      CE => \GEN_CMD_BTT_LESS_23.cmnd_data_reg[66]_1\,
      D => \GEN_CMD_BTT_LESS_23.cmnd_data_reg[13]_0\(6),
      Q => \^gen_cmd_btt_less_23.cmnd_data_reg[66]_0\(6),
      R => halted1
    );
\GEN_CMD_BTT_LESS_23.cmnd_data_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_lite_aclk,
      CE => \GEN_CMD_BTT_LESS_23.cmnd_data_reg[66]_1\,
      D => \GEN_CMD_BTT_LESS_23.cmnd_data_reg[13]_0\(7),
      Q => \^gen_cmd_btt_less_23.cmnd_data_reg[66]_0\(7),
      R => halted1
    );
\GEN_CMD_BTT_LESS_23.cmnd_data_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_lite_aclk,
      CE => \GEN_CMD_BTT_LESS_23.cmnd_data_reg[66]_1\,
      D => \GEN_CMD_BTT_LESS_23.cmnd_data_reg[13]_0\(8),
      Q => \^gen_cmd_btt_less_23.cmnd_data_reg[66]_0\(8),
      R => halted1
    );
\GEN_CMD_BTT_LESS_23.cmnd_data_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_lite_aclk,
      CE => \GEN_CMD_BTT_LESS_23.cmnd_data_reg[66]_1\,
      D => \GEN_CMD_BTT_LESS_23.cmnd_data_reg[13]_0\(9),
      Q => \^gen_cmd_btt_less_23.cmnd_data_reg[66]_0\(9),
      R => halted1
    );
\GEN_CMD_BTT_LESS_23.cmnd_wr_i_reg\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_lite_aclk,
      CE => '1',
      D => write_cmnd_cmb,
      Q => \^mm2s_cmnd_wr_1\,
      R => halted1
    );
\GEN_NO_HOLD_DATA.s_axis_mm2s_cmd_tvalid_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"BA"
    )
        port map (
      I0 => \^mm2s_cmnd_wr_1\,
      I1 => s_axis_mm2s_cmd_tready,
      I2 => \GEN_NO_HOLD_DATA.s_axis_mm2s_cmd_tvalid_reg\,
      O => \GEN_CMD_BTT_LESS_23.cmnd_wr_i_reg_0\
    );
all_is_idle_d1_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000000000F7"
    )
        port map (
      I0 => mm2s_length_wren,
      I1 => mm2s_dmacr(0),
      I2 => mm2s_stop_i,
      I3 => \^q\(0),
      I4 => \^q\(1),
      I5 => \^cmnds_queued\,
      O => mm2s_all_idle
    );
cmnds_queued_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_lite_aclk,
      CE => '1',
      D => cmnds_queued_reg_0,
      Q => \^cmnds_queued\,
      R => '0'
    );
sts_received_clr_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"44444440"
    )
        port map (
      I0 => \^q\(0),
      I1 => \^q\(1),
      I2 => sts_received_i_reg,
      I3 => sts_received_clr_reg_1,
      I4 => soft_reset,
      O => sts_received_clr_cmb
    );
sts_received_clr_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_lite_aclk,
      CE => '1',
      D => sts_received_clr_cmb,
      Q => \^mm2s_sts_received_clr\,
      R => halted1
    );
sts_received_i_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4440"
    )
        port map (
      I0 => \^mm2s_sts_received_clr\,
      I1 => \out\,
      I2 => sts_received_i_reg,
      I3 => m_axis_mm2s_sts_tvalid_int,
      O => sts_received_clr_reg_0
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_dma_sofeof_gen is
  port (
    axi_dma_tstvec : out STD_LOGIC_VECTOR ( 1 downto 0 );
    SR : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_lite_aclk : in STD_LOGIC;
    m_axis_mm2s_tvalid : in STD_LOGIC;
    m_axis_mm2s_tready : in STD_LOGIC;
    m_axis_mm2s_tlast : in STD_LOGIC;
    \out\ : in STD_LOGIC
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_dma_sofeof_gen;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_dma_sofeof_gen is
  signal \GEN_FOR_SYNC.s_sof_generated_i_1_n_0\ : STD_LOGIC;
  signal \^axi_dma_tstvec\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal p_3_in : STD_LOGIC;
  signal s_last : STD_LOGIC;
  signal s_last_d1 : STD_LOGIC;
  signal s_last_d10 : STD_LOGIC;
  signal s_ready : STD_LOGIC;
  signal s_sof_d1_cdc_tig : STD_LOGIC;
  signal s_sof_generated : STD_LOGIC;
  signal s_valid : STD_LOGIC;
  signal s_valid_d1 : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \GEN_FOR_SYNC.s_valid_d1_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \axi_dma_tstvec[0]_INST_0\ : label is "soft_lutpair2";
begin
  axi_dma_tstvec(1 downto 0) <= \^axi_dma_tstvec\(1 downto 0);
\GEN_FOR_SYNC.s_last_d1_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => s_valid,
      I1 => s_ready,
      I2 => s_last,
      O => s_last_d10
    );
\GEN_FOR_SYNC.s_last_d1_reg\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_lite_aclk,
      CE => '1',
      D => s_last_d10,
      Q => s_last_d1,
      R => SR(0)
    );
\GEN_FOR_SYNC.s_last_reg\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_lite_aclk,
      CE => '1',
      D => m_axis_mm2s_tlast,
      Q => s_last,
      R => SR(0)
    );
\GEN_FOR_SYNC.s_ready_reg\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_lite_aclk,
      CE => '1',
      D => m_axis_mm2s_tready,
      Q => s_ready,
      R => SR(0)
    );
\GEN_FOR_SYNC.s_sof_d1_cdc_tig_reg\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_lite_aclk,
      CE => '1',
      D => s_sof_generated,
      Q => s_sof_d1_cdc_tig,
      R => SR(0)
    );
\GEN_FOR_SYNC.s_sof_generated_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000FBAA0000"
    )
        port map (
      I0 => s_sof_generated,
      I1 => s_valid_d1,
      I2 => s_sof_d1_cdc_tig,
      I3 => p_3_in,
      I4 => \out\,
      I5 => \^axi_dma_tstvec\(1),
      O => \GEN_FOR_SYNC.s_sof_generated_i_1_n_0\
    );
\GEN_FOR_SYNC.s_sof_generated_reg\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_lite_aclk,
      CE => '1',
      D => \GEN_FOR_SYNC.s_sof_generated_i_1_n_0\,
      Q => s_sof_generated,
      R => '0'
    );
\GEN_FOR_SYNC.s_valid_d1_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => s_ready,
      I1 => s_valid,
      O => p_3_in
    );
\GEN_FOR_SYNC.s_valid_d1_reg\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_lite_aclk,
      CE => '1',
      D => p_3_in,
      Q => s_valid_d1,
      R => SR(0)
    );
\GEN_FOR_SYNC.s_valid_reg\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_lite_aclk,
      CE => '1',
      D => m_axis_mm2s_tvalid,
      Q => s_valid,
      R => SR(0)
    );
\axi_dma_tstvec[0]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0D000000"
    )
        port map (
      I0 => s_valid_d1,
      I1 => s_sof_d1_cdc_tig,
      I2 => s_sof_generated,
      I3 => s_ready,
      I4 => s_valid,
      O => \^axi_dma_tstvec\(0)
    );
\axi_dma_tstvec[1]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"40C0404000000000"
    )
        port map (
      I0 => s_last_d1,
      I1 => s_valid,
      I2 => s_ready,
      I3 => s_sof_generated,
      I4 => s_sof_d1_cdc_tig,
      I5 => s_last,
      O => \^axi_dma_tstvec\(1)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_cdc_sync_rst is
  port (
    src_rst : in STD_LOGIC;
    dest_clk : in STD_LOGIC;
    dest_rst : out STD_LOGIC
  );
  attribute DEF_VAL : string;
  attribute DEF_VAL of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_cdc_sync_rst : entity is "1'b0";
  attribute DEST_SYNC_FF : integer;
  attribute DEST_SYNC_FF of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_cdc_sync_rst : entity is 4;
  attribute INIT : string;
  attribute INIT of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_cdc_sync_rst : entity is "0";
  attribute INIT_SYNC_FF : integer;
  attribute INIT_SYNC_FF of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_cdc_sync_rst : entity is 0;
  attribute SIM_ASSERT_CHK : integer;
  attribute SIM_ASSERT_CHK of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_cdc_sync_rst : entity is 0;
  attribute VERSION : integer;
  attribute VERSION of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_cdc_sync_rst : entity is 0;
  attribute XPM_MODULE : string;
  attribute XPM_MODULE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_cdc_sync_rst : entity is "TRUE";
  attribute keep_hierarchy : string;
  attribute keep_hierarchy of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_cdc_sync_rst : entity is "soft";
  attribute xpm_cdc : string;
  attribute xpm_cdc of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_cdc_sync_rst : entity is "SYNC_RST";
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_cdc_sync_rst;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_cdc_sync_rst is
  signal syncstages_ff : STD_LOGIC_VECTOR ( 3 downto 0 );
  attribute RTL_KEEP : string;
  attribute RTL_KEEP of syncstages_ff : signal is "true";
  attribute async_reg : string;
  attribute async_reg of syncstages_ff : signal is "true";
  attribute xpm_cdc of syncstages_ff : signal is "SYNC_RST";
  attribute ASYNC_REG_boolean : boolean;
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[0]\ : label is std.standard.true;
  attribute KEEP : string;
  attribute KEEP of \syncstages_ff_reg[0]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[0]\ : label is "SYNC_RST";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[1]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[1]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[1]\ : label is "SYNC_RST";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[2]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[2]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[2]\ : label is "SYNC_RST";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[3]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[3]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[3]\ : label is "SYNC_RST";
begin
  dest_rst <= syncstages_ff(3);
\syncstages_ff_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => dest_clk,
      CE => '1',
      D => src_rst,
      Q => syncstages_ff(0),
      R => '0'
    );
\syncstages_ff_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => dest_clk,
      CE => '1',
      D => syncstages_ff(0),
      Q => syncstages_ff(1),
      R => '0'
    );
\syncstages_ff_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => dest_clk,
      CE => '1',
      D => syncstages_ff(1),
      Q => syncstages_ff(2),
      R => '0'
    );
\syncstages_ff_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => dest_clk,
      CE => '1',
      D => syncstages_ff(2),
      Q => syncstages_ff(3),
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_cdc_sync_rst__1\ is
  port (
    src_rst : in STD_LOGIC;
    dest_clk : in STD_LOGIC;
    dest_rst : out STD_LOGIC
  );
  attribute DEF_VAL : string;
  attribute DEF_VAL of \decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_cdc_sync_rst__1\ : entity is "1'b0";
  attribute DEST_SYNC_FF : integer;
  attribute DEST_SYNC_FF of \decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_cdc_sync_rst__1\ : entity is 4;
  attribute INIT : string;
  attribute INIT of \decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_cdc_sync_rst__1\ : entity is "0";
  attribute INIT_SYNC_FF : integer;
  attribute INIT_SYNC_FF of \decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_cdc_sync_rst__1\ : entity is 0;
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_cdc_sync_rst__1\ : entity is "xpm_cdc_sync_rst";
  attribute SIM_ASSERT_CHK : integer;
  attribute SIM_ASSERT_CHK of \decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_cdc_sync_rst__1\ : entity is 0;
  attribute VERSION : integer;
  attribute VERSION of \decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_cdc_sync_rst__1\ : entity is 0;
  attribute XPM_MODULE : string;
  attribute XPM_MODULE of \decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_cdc_sync_rst__1\ : entity is "TRUE";
  attribute keep_hierarchy : string;
  attribute keep_hierarchy of \decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_cdc_sync_rst__1\ : entity is "soft";
  attribute xpm_cdc : string;
  attribute xpm_cdc of \decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_cdc_sync_rst__1\ : entity is "SYNC_RST";
end \decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_cdc_sync_rst__1\;

architecture STRUCTURE of \decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_cdc_sync_rst__1\ is
  signal syncstages_ff : STD_LOGIC_VECTOR ( 3 downto 0 );
  attribute RTL_KEEP : string;
  attribute RTL_KEEP of syncstages_ff : signal is "true";
  attribute async_reg : string;
  attribute async_reg of syncstages_ff : signal is "true";
  attribute xpm_cdc of syncstages_ff : signal is "SYNC_RST";
  attribute ASYNC_REG_boolean : boolean;
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[0]\ : label is std.standard.true;
  attribute KEEP : string;
  attribute KEEP of \syncstages_ff_reg[0]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[0]\ : label is "SYNC_RST";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[1]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[1]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[1]\ : label is "SYNC_RST";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[2]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[2]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[2]\ : label is "SYNC_RST";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[3]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[3]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[3]\ : label is "SYNC_RST";
begin
  dest_rst <= syncstages_ff(3);
\syncstages_ff_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => dest_clk,
      CE => '1',
      D => src_rst,
      Q => syncstages_ff(0),
      R => '0'
    );
\syncstages_ff_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => dest_clk,
      CE => '1',
      D => syncstages_ff(0),
      Q => syncstages_ff(1),
      R => '0'
    );
\syncstages_ff_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => dest_clk,
      CE => '1',
      D => syncstages_ff(1),
      Q => syncstages_ff(2),
      R => '0'
    );
\syncstages_ff_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => dest_clk,
      CE => '1',
      D => syncstages_ff(2),
      Q => syncstages_ff(3),
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_counter_updn__parameterized1\ is
  port (
    Q : out STD_LOGIC_VECTOR ( 0 to 0 );
    S : out STD_LOGIC_VECTOR ( 1 downto 0 );
    DI : out STD_LOGIC_VECTOR ( 0 to 0 );
    ram_empty_i : in STD_LOGIC;
    \count_value_i_reg[0]_0\ : in STD_LOGIC_VECTOR ( 1 downto 0 );
    rd_en : in STD_LOGIC;
    \gwdc.wr_data_count_i_reg[7]\ : in STD_LOGIC_VECTOR ( 1 downto 0 );
    \gwdc.wr_data_count_i_reg[7]_0\ : in STD_LOGIC_VECTOR ( 1 downto 0 );
    SR : in STD_LOGIC_VECTOR ( 0 to 0 );
    wr_clk : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_counter_updn__parameterized1\ : entity is "xpm_counter_updn";
end \decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_counter_updn__parameterized1\;

architecture STRUCTURE of \decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_counter_updn__parameterized1\ is
  signal \^di\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \^q\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal count_value_i : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \count_value_i[0]_i_1__3_n_0\ : STD_LOGIC;
  signal \count_value_i[1]_i_3_n_0\ : STD_LOGIC;
  signal \gen_fwft.count_en\ : STD_LOGIC;
  attribute HLUTNM : string;
  attribute HLUTNM of \gwdc.wr_data_count_i[7]_i_15\ : label is "lutpair0";
  attribute HLUTNM of \gwdc.wr_data_count_i[7]_i_7\ : label is "lutpair0";
begin
  DI(0) <= \^di\(0);
  Q(0) <= \^q\(0);
\count_value_i[0]_i_1__3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"5AAAA655"
    )
        port map (
      I0 => count_value_i(0),
      I1 => \count_value_i_reg[0]_0\(0),
      I2 => rd_en,
      I3 => \count_value_i_reg[0]_0\(1),
      I4 => ram_empty_i,
      O => \count_value_i[0]_i_1__3_n_0\
    );
\count_value_i[1]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"C02F"
    )
        port map (
      I0 => \count_value_i_reg[0]_0\(0),
      I1 => rd_en,
      I2 => \count_value_i_reg[0]_0\(1),
      I3 => ram_empty_i,
      O => \gen_fwft.count_en\
    );
\count_value_i[1]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A999A9A96AAA6AAA"
    )
        port map (
      I0 => \^q\(0),
      I1 => ram_empty_i,
      I2 => \count_value_i_reg[0]_0\(1),
      I3 => rd_en,
      I4 => \count_value_i_reg[0]_0\(0),
      I5 => count_value_i(0),
      O => \count_value_i[1]_i_3_n_0\
    );
\count_value_i_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => \gen_fwft.count_en\,
      D => \count_value_i[0]_i_1__3_n_0\,
      Q => count_value_i(0),
      R => SR(0)
    );
\count_value_i_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => \gen_fwft.count_en\,
      D => \count_value_i[1]_i_3_n_0\,
      Q => \^q\(0),
      R => SR(0)
    );
\gwdc.wr_data_count_i[7]_i_14\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9669"
    )
        port map (
      I0 => \^di\(0),
      I1 => \gwdc.wr_data_count_i_reg[7]\(1),
      I2 => \^q\(0),
      I3 => \gwdc.wr_data_count_i_reg[7]_0\(1),
      O => S(1)
    );
\gwdc.wr_data_count_i[7]_i_15\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"96"
    )
        port map (
      I0 => count_value_i(0),
      I1 => \gwdc.wr_data_count_i_reg[7]\(0),
      I2 => \gwdc.wr_data_count_i_reg[7]_0\(0),
      O => S(0)
    );
\gwdc.wr_data_count_i[7]_i_7\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => count_value_i(0),
      I1 => \gwdc.wr_data_count_i_reg[7]\(0),
      O => \^di\(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_counter_updn__parameterized2\ is
  port (
    DI : out STD_LOGIC_VECTOR ( 0 to 0 );
    Q : out STD_LOGIC_VECTOR ( 6 downto 0 );
    S : out STD_LOGIC_VECTOR ( 4 downto 0 );
    \FSM_sequential_gen_fwft.curr_fwft_state_reg[1]\ : out STD_LOGIC;
    leaving_empty0 : out STD_LOGIC;
    \gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_reg\ : out STD_LOGIC;
    \gwdc.wr_data_count_i_reg[7]\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    \gwdc.wr_data_count_i_reg[7]_0\ : in STD_LOGIC_VECTOR ( 7 downto 0 );
    \count_value_i_reg[0]_0\ : in STD_LOGIC_VECTOR ( 1 downto 0 );
    rd_en : in STD_LOGIC;
    ram_empty_i : in STD_LOGIC;
    \gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_reg_0\ : in STD_LOGIC_VECTOR ( 6 downto 0 );
    \gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_reg_1\ : in STD_LOGIC;
    ram_wr_en_pf : in STD_LOGIC;
    clr_full : in STD_LOGIC;
    \count_value_i_reg[0]_1\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    wr_clk : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_counter_updn__parameterized2\ : entity is "xpm_counter_updn";
end \decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_counter_updn__parameterized2\;

architecture STRUCTURE of \decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_counter_updn__parameterized2\ is
  signal \^fsm_sequential_gen_fwft.curr_fwft_state_reg[1]\ : STD_LOGIC;
  signal \^q\ : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal \count_value_i[0]_i_1__1_n_0\ : STD_LOGIC;
  signal \count_value_i[1]_i_1__1_n_0\ : STD_LOGIC;
  signal \count_value_i[2]_i_1__1_n_0\ : STD_LOGIC;
  signal \count_value_i[3]_i_1__1_n_0\ : STD_LOGIC;
  signal \count_value_i[4]_i_1__1_n_0\ : STD_LOGIC;
  signal \count_value_i[5]_i_1__1_n_0\ : STD_LOGIC;
  signal \count_value_i[6]_i_1__1_n_0\ : STD_LOGIC;
  signal \count_value_i[6]_i_2__1_n_0\ : STD_LOGIC;
  signal \count_value_i[7]_i_1__0_n_0\ : STD_LOGIC;
  signal \count_value_i[7]_i_2__0_n_0\ : STD_LOGIC;
  signal \count_value_i_reg_n_0_[7]\ : STD_LOGIC;
  signal \gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_i_5_n_0\ : STD_LOGIC;
  signal \gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_i_6_n_0\ : STD_LOGIC;
  signal \gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_i_7_n_0\ : STD_LOGIC;
  signal \gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_i_8_n_0\ : STD_LOGIC;
  signal going_full1 : STD_LOGIC;
  signal \^leaving_empty0\ : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \count_value_i[0]_i_1__1\ : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of \count_value_i[1]_i_1__1\ : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of \count_value_i[3]_i_1__1\ : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of \count_value_i[4]_i_1__1\ : label is "soft_lutpair23";
begin
  \FSM_sequential_gen_fwft.curr_fwft_state_reg[1]\ <= \^fsm_sequential_gen_fwft.curr_fwft_state_reg[1]\;
  Q(6 downto 0) <= \^q\(6 downto 0);
  leaving_empty0 <= \^leaving_empty0\;
\count_value_i[0]_i_1__1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"10EF"
    )
        port map (
      I0 => rd_en,
      I1 => \count_value_i_reg[0]_0\(0),
      I2 => \count_value_i_reg[0]_0\(1),
      I3 => \^q\(0),
      O => \count_value_i[0]_i_1__1_n_0\
    );
\count_value_i[1]_i_1__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"02FFFD00"
    )
        port map (
      I0 => \count_value_i_reg[0]_0\(1),
      I1 => \count_value_i_reg[0]_0\(0),
      I2 => rd_en,
      I3 => \^q\(0),
      I4 => \^q\(1),
      O => \count_value_i[1]_i_1__1_n_0\
    );
\count_value_i[2]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => \^q\(0),
      I1 => \^q\(1),
      I2 => \^q\(2),
      O => \count_value_i[2]_i_1__1_n_0\
    );
\count_value_i[3]_i_1__1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => \^q\(1),
      I1 => \^q\(0),
      I2 => \^q\(2),
      I3 => \^q\(3),
      O => \count_value_i[3]_i_1__1_n_0\
    );
\count_value_i[4]_i_1__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
        port map (
      I0 => \^q\(2),
      I1 => \^q\(0),
      I2 => \^q\(1),
      I3 => \^q\(3),
      I4 => \^q\(4),
      O => \count_value_i[4]_i_1__1_n_0\
    );
\count_value_i[5]_i_1__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
        port map (
      I0 => \^q\(3),
      I1 => \count_value_i[6]_i_2__1_n_0\,
      I2 => \^q\(2),
      I3 => \^q\(4),
      I4 => \^q\(5),
      O => \count_value_i[5]_i_1__1_n_0\
    );
\count_value_i[6]_i_1__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFF80000000"
    )
        port map (
      I0 => \^q\(4),
      I1 => \^q\(2),
      I2 => \count_value_i[6]_i_2__1_n_0\,
      I3 => \^q\(3),
      I4 => \^q\(5),
      I5 => \^q\(6),
      O => \count_value_i[6]_i_1__1_n_0\
    );
\count_value_i[6]_i_2__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000AAA200000000"
    )
        port map (
      I0 => \^q\(1),
      I1 => \count_value_i_reg[0]_0\(1),
      I2 => \count_value_i_reg[0]_0\(0),
      I3 => rd_en,
      I4 => ram_empty_i,
      I5 => \^q\(0),
      O => \count_value_i[6]_i_2__1_n_0\
    );
\count_value_i[7]_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => \^q\(5),
      I1 => \count_value_i[7]_i_2__0_n_0\,
      I2 => \^q\(6),
      I3 => \count_value_i_reg_n_0_[7]\,
      O => \count_value_i[7]_i_1__0_n_0\
    );
\count_value_i[7]_i_2__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => \^q\(4),
      I1 => \^q\(2),
      I2 => \^q\(0),
      I3 => \^fsm_sequential_gen_fwft.curr_fwft_state_reg[1]\,
      I4 => \^q\(1),
      I5 => \^q\(3),
      O => \count_value_i[7]_i_2__0_n_0\
    );
\count_value_i_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => \^fsm_sequential_gen_fwft.curr_fwft_state_reg[1]\,
      D => \count_value_i[0]_i_1__1_n_0\,
      Q => \^q\(0),
      R => \count_value_i_reg[0]_1\(0)
    );
\count_value_i_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => \^fsm_sequential_gen_fwft.curr_fwft_state_reg[1]\,
      D => \count_value_i[1]_i_1__1_n_0\,
      Q => \^q\(1),
      R => \count_value_i_reg[0]_1\(0)
    );
\count_value_i_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => \^fsm_sequential_gen_fwft.curr_fwft_state_reg[1]\,
      D => \count_value_i[2]_i_1__1_n_0\,
      Q => \^q\(2),
      R => \count_value_i_reg[0]_1\(0)
    );
\count_value_i_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => \^fsm_sequential_gen_fwft.curr_fwft_state_reg[1]\,
      D => \count_value_i[3]_i_1__1_n_0\,
      Q => \^q\(3),
      R => \count_value_i_reg[0]_1\(0)
    );
\count_value_i_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => \^fsm_sequential_gen_fwft.curr_fwft_state_reg[1]\,
      D => \count_value_i[4]_i_1__1_n_0\,
      Q => \^q\(4),
      R => \count_value_i_reg[0]_1\(0)
    );
\count_value_i_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => \^fsm_sequential_gen_fwft.curr_fwft_state_reg[1]\,
      D => \count_value_i[5]_i_1__1_n_0\,
      Q => \^q\(5),
      R => \count_value_i_reg[0]_1\(0)
    );
\count_value_i_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => \^fsm_sequential_gen_fwft.curr_fwft_state_reg[1]\,
      D => \count_value_i[6]_i_1__1_n_0\,
      Q => \^q\(6),
      R => \count_value_i_reg[0]_1\(0)
    );
\count_value_i_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => \^fsm_sequential_gen_fwft.curr_fwft_state_reg[1]\,
      D => \count_value_i[7]_i_1__0_n_0\,
      Q => \count_value_i_reg_n_0_[7]\,
      R => \count_value_i_reg[0]_1\(0)
    );
\gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000003B2A2A2A"
    )
        port map (
      I0 => \gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_reg_1\,
      I1 => \^fsm_sequential_gen_fwft.curr_fwft_state_reg[1]\,
      I2 => \^leaving_empty0\,
      I3 => going_full1,
      I4 => ram_wr_en_pf,
      I5 => clr_full,
      O => \gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_reg\
    );
\gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9000"
    )
        port map (
      I0 => \^q\(6),
      I1 => \gwdc.wr_data_count_i_reg[7]_0\(6),
      I2 => \gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_i_5_n_0\,
      I3 => \gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_i_6_n_0\,
      O => \^leaving_empty0\
    );
\gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9000"
    )
        port map (
      I0 => \^q\(6),
      I1 => \gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_reg_0\(6),
      I2 => \gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_i_7_n_0\,
      I3 => \gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_i_8_n_0\,
      O => going_full1
    );
\gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => \^q\(3),
      I1 => \gwdc.wr_data_count_i_reg[7]_0\(3),
      I2 => \gwdc.wr_data_count_i_reg[7]_0\(5),
      I3 => \^q\(5),
      I4 => \gwdc.wr_data_count_i_reg[7]_0\(4),
      I5 => \^q\(4),
      O => \gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_i_5_n_0\
    );
\gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => \^q\(0),
      I1 => \gwdc.wr_data_count_i_reg[7]_0\(0),
      I2 => \gwdc.wr_data_count_i_reg[7]_0\(2),
      I3 => \^q\(2),
      I4 => \gwdc.wr_data_count_i_reg[7]_0\(1),
      I5 => \^q\(1),
      O => \gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_i_6_n_0\
    );
\gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => \^q\(3),
      I1 => \gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_reg_0\(3),
      I2 => \gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_reg_0\(5),
      I3 => \^q\(5),
      I4 => \gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_reg_0\(4),
      I5 => \^q\(4),
      O => \gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_i_7_n_0\
    );
\gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => \^q\(0),
      I1 => \gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_reg_0\(0),
      I2 => \gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_reg_0\(2),
      I3 => \^q\(2),
      I4 => \gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_reg_0\(1),
      I5 => \^q\(1),
      O => \gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_i_8_n_0\
    );
\gen_sdpram.xpm_memory_base_inst_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00FD"
    )
        port map (
      I0 => \count_value_i_reg[0]_0\(1),
      I1 => \count_value_i_reg[0]_0\(0),
      I2 => rd_en,
      I3 => ram_empty_i,
      O => \^fsm_sequential_gen_fwft.curr_fwft_state_reg[1]\
    );
\gwdc.wr_data_count_i[7]_i_10\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"B44B"
    )
        port map (
      I0 => \^q\(4),
      I1 => \gwdc.wr_data_count_i_reg[7]_0\(4),
      I2 => \^q\(5),
      I3 => \gwdc.wr_data_count_i_reg[7]_0\(5),
      O => S(2)
    );
\gwdc.wr_data_count_i[7]_i_11\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"B44B"
    )
        port map (
      I0 => \^q\(3),
      I1 => \gwdc.wr_data_count_i_reg[7]_0\(3),
      I2 => \^q\(4),
      I3 => \gwdc.wr_data_count_i_reg[7]_0\(4),
      O => S(1)
    );
\gwdc.wr_data_count_i[7]_i_12\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"B44B"
    )
        port map (
      I0 => \^q\(2),
      I1 => \gwdc.wr_data_count_i_reg[7]_0\(2),
      I2 => \^q\(3),
      I3 => \gwdc.wr_data_count_i_reg[7]_0\(3),
      O => S(0)
    );
\gwdc.wr_data_count_i[7]_i_6\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"D4"
    )
        port map (
      I0 => \^q\(1),
      I1 => \gwdc.wr_data_count_i_reg[7]\(0),
      I2 => \gwdc.wr_data_count_i_reg[7]_0\(1),
      O => DI(0)
    );
\gwdc.wr_data_count_i[7]_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"B44B"
    )
        port map (
      I0 => \^q\(6),
      I1 => \gwdc.wr_data_count_i_reg[7]_0\(6),
      I2 => \count_value_i_reg_n_0_[7]\,
      I3 => \gwdc.wr_data_count_i_reg[7]_0\(7),
      O => S(4)
    );
\gwdc.wr_data_count_i[7]_i_9\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"B44B"
    )
        port map (
      I0 => \^q\(5),
      I1 => \gwdc.wr_data_count_i_reg[7]_0\(5),
      I2 => \^q\(6),
      I3 => \gwdc.wr_data_count_i_reg[7]_0\(6),
      O => S(3)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_counter_updn__parameterized2_0\ is
  port (
    ram_empty_i0 : out STD_LOGIC;
    Q : out STD_LOGIC_VECTOR ( 7 downto 0 );
    D : out STD_LOGIC_VECTOR ( 5 downto 0 );
    \gen_pntr_flags_cc.ram_empty_i_reg\ : in STD_LOGIC;
    leaving_empty0 : in STD_LOGIC;
    ram_wr_en_pf : in STD_LOGIC;
    ram_empty_i : in STD_LOGIC;
    wr_en : in STD_LOGIC;
    \count_value_i_reg[5]_0\ : in STD_LOGIC;
    \count_value_i_reg[7]_0\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    rst_d1 : in STD_LOGIC;
    \gen_pntr_flags_cc.ram_empty_i_reg_0\ : in STD_LOGIC_VECTOR ( 6 downto 0 );
    DI : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S : in STD_LOGIC_VECTOR ( 6 downto 0 );
    \gwdc.wr_data_count_i_reg[7]\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    \gwdc.wr_data_count_i_reg[7]_0\ : in STD_LOGIC_VECTOR ( 4 downto 0 );
    wr_clk : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_counter_updn__parameterized2_0\ : entity is "xpm_counter_updn";
end \decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_counter_updn__parameterized2_0\;

architecture STRUCTURE of \decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_counter_updn__parameterized2_0\ is
  signal \^q\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \count_value_i[0]_i_1_n_0\ : STD_LOGIC;
  signal \count_value_i[1]_i_1_n_0\ : STD_LOGIC;
  signal \count_value_i[2]_i_1_n_0\ : STD_LOGIC;
  signal \count_value_i[3]_i_1_n_0\ : STD_LOGIC;
  signal \count_value_i[4]_i_1_n_0\ : STD_LOGIC;
  signal \count_value_i[5]_i_1__0_n_0\ : STD_LOGIC;
  signal \count_value_i[6]_i_1__0_n_0\ : STD_LOGIC;
  signal \count_value_i[6]_i_2__0_n_0\ : STD_LOGIC;
  signal \count_value_i[7]_i_1_n_0\ : STD_LOGIC;
  signal \count_value_i[7]_i_2_n_0\ : STD_LOGIC;
  signal \gen_pntr_flags_cc.ram_empty_i_i_3_n_0\ : STD_LOGIC;
  signal \gen_pntr_flags_cc.ram_empty_i_i_4_n_0\ : STD_LOGIC;
  signal going_empty1 : STD_LOGIC;
  signal \gwdc.wr_data_count_i[7]_i_13_n_0\ : STD_LOGIC;
  signal \gwdc.wr_data_count_i[7]_i_2_n_0\ : STD_LOGIC;
  signal \gwdc.wr_data_count_i[7]_i_3_n_0\ : STD_LOGIC;
  signal \gwdc.wr_data_count_i[7]_i_4_n_0\ : STD_LOGIC;
  signal \gwdc.wr_data_count_i[7]_i_5_n_0\ : STD_LOGIC;
  signal \gwdc.wr_data_count_i_reg[7]_i_1_n_1\ : STD_LOGIC;
  signal \gwdc.wr_data_count_i_reg[7]_i_1_n_2\ : STD_LOGIC;
  signal \gwdc.wr_data_count_i_reg[7]_i_1_n_3\ : STD_LOGIC;
  signal \gwdc.wr_data_count_i_reg[7]_i_1_n_4\ : STD_LOGIC;
  signal \gwdc.wr_data_count_i_reg[7]_i_1_n_5\ : STD_LOGIC;
  signal \gwdc.wr_data_count_i_reg[7]_i_1_n_6\ : STD_LOGIC;
  signal \gwdc.wr_data_count_i_reg[7]_i_1_n_7\ : STD_LOGIC;
  signal \NLW_gwdc.wr_data_count_i_reg[7]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 to 7 );
  signal \NLW_gwdc.wr_data_count_i_reg[7]_i_1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \count_value_i[1]_i_1\ : label is "soft_lutpair26";
  attribute SOFT_HLUTNM of \count_value_i[2]_i_1\ : label is "soft_lutpair26";
  attribute SOFT_HLUTNM of \count_value_i[3]_i_1\ : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of \count_value_i[4]_i_1\ : label is "soft_lutpair25";
  attribute ADDER_THRESHOLD : integer;
  attribute ADDER_THRESHOLD of \gwdc.wr_data_count_i_reg[7]_i_1\ : label is 35;
begin
  Q(7 downto 0) <= \^q\(7 downto 0);
\count_value_i[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^q\(0),
      O => \count_value_i[0]_i_1_n_0\
    );
\count_value_i[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \^q\(0),
      I1 => \^q\(1),
      O => \count_value_i[1]_i_1_n_0\
    );
\count_value_i[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => \^q\(0),
      I1 => \^q\(1),
      I2 => \^q\(2),
      O => \count_value_i[2]_i_1_n_0\
    );
\count_value_i[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => \^q\(1),
      I1 => \^q\(0),
      I2 => \^q\(2),
      I3 => \^q\(3),
      O => \count_value_i[3]_i_1_n_0\
    );
\count_value_i[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
        port map (
      I0 => \^q\(2),
      I1 => \^q\(0),
      I2 => \^q\(1),
      I3 => \^q\(3),
      I4 => \^q\(4),
      O => \count_value_i[4]_i_1_n_0\
    );
\count_value_i[5]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
        port map (
      I0 => \^q\(3),
      I1 => \count_value_i[6]_i_2__0_n_0\,
      I2 => \^q\(2),
      I3 => \^q\(4),
      I4 => \^q\(5),
      O => \count_value_i[5]_i_1__0_n_0\
    );
\count_value_i[6]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFF80000000"
    )
        port map (
      I0 => \^q\(4),
      I1 => \^q\(2),
      I2 => \count_value_i[6]_i_2__0_n_0\,
      I3 => \^q\(3),
      I4 => \^q\(5),
      I5 => \^q\(6),
      O => \count_value_i[6]_i_1__0_n_0\
    );
\count_value_i[6]_i_2__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000800000000"
    )
        port map (
      I0 => \^q\(1),
      I1 => wr_en,
      I2 => \count_value_i_reg[5]_0\,
      I3 => \count_value_i_reg[7]_0\(0),
      I4 => rst_d1,
      I5 => \^q\(0),
      O => \count_value_i[6]_i_2__0_n_0\
    );
\count_value_i[7]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => \^q\(5),
      I1 => \count_value_i[7]_i_2_n_0\,
      I2 => \^q\(6),
      I3 => \^q\(7),
      O => \count_value_i[7]_i_1_n_0\
    );
\count_value_i[7]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => \^q\(4),
      I1 => \^q\(2),
      I2 => \^q\(0),
      I3 => ram_wr_en_pf,
      I4 => \^q\(1),
      I5 => \^q\(3),
      O => \count_value_i[7]_i_2_n_0\
    );
\count_value_i_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => ram_wr_en_pf,
      D => \count_value_i[0]_i_1_n_0\,
      Q => \^q\(0),
      R => \count_value_i_reg[7]_0\(0)
    );
\count_value_i_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => ram_wr_en_pf,
      D => \count_value_i[1]_i_1_n_0\,
      Q => \^q\(1),
      R => \count_value_i_reg[7]_0\(0)
    );
\count_value_i_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => ram_wr_en_pf,
      D => \count_value_i[2]_i_1_n_0\,
      Q => \^q\(2),
      R => \count_value_i_reg[7]_0\(0)
    );
\count_value_i_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => ram_wr_en_pf,
      D => \count_value_i[3]_i_1_n_0\,
      Q => \^q\(3),
      R => \count_value_i_reg[7]_0\(0)
    );
\count_value_i_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => ram_wr_en_pf,
      D => \count_value_i[4]_i_1_n_0\,
      Q => \^q\(4),
      R => \count_value_i_reg[7]_0\(0)
    );
\count_value_i_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => ram_wr_en_pf,
      D => \count_value_i[5]_i_1__0_n_0\,
      Q => \^q\(5),
      R => \count_value_i_reg[7]_0\(0)
    );
\count_value_i_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => ram_wr_en_pf,
      D => \count_value_i[6]_i_1__0_n_0\,
      Q => \^q\(6),
      R => \count_value_i_reg[7]_0\(0)
    );
\count_value_i_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => ram_wr_en_pf,
      D => \count_value_i[7]_i_1_n_0\,
      Q => \^q\(7),
      R => \count_value_i_reg[7]_0\(0)
    );
\gen_pntr_flags_cc.ram_empty_i_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0FFF0088"
    )
        port map (
      I0 => \gen_pntr_flags_cc.ram_empty_i_reg\,
      I1 => going_empty1,
      I2 => leaving_empty0,
      I3 => ram_wr_en_pf,
      I4 => ram_empty_i,
      O => ram_empty_i0
    );
\gen_pntr_flags_cc.ram_empty_i_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9000"
    )
        port map (
      I0 => \^q\(6),
      I1 => \gen_pntr_flags_cc.ram_empty_i_reg_0\(6),
      I2 => \gen_pntr_flags_cc.ram_empty_i_i_3_n_0\,
      I3 => \gen_pntr_flags_cc.ram_empty_i_i_4_n_0\,
      O => going_empty1
    );
\gen_pntr_flags_cc.ram_empty_i_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => \^q\(3),
      I1 => \gen_pntr_flags_cc.ram_empty_i_reg_0\(3),
      I2 => \gen_pntr_flags_cc.ram_empty_i_reg_0\(5),
      I3 => \^q\(5),
      I4 => \gen_pntr_flags_cc.ram_empty_i_reg_0\(4),
      I5 => \^q\(4),
      O => \gen_pntr_flags_cc.ram_empty_i_i_3_n_0\
    );
\gen_pntr_flags_cc.ram_empty_i_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => \^q\(0),
      I1 => \gen_pntr_flags_cc.ram_empty_i_reg_0\(0),
      I2 => \gen_pntr_flags_cc.ram_empty_i_reg_0\(2),
      I3 => \^q\(2),
      I4 => \gen_pntr_flags_cc.ram_empty_i_reg_0\(1),
      I5 => \^q\(1),
      O => \gen_pntr_flags_cc.ram_empty_i_i_4_n_0\
    );
\gwdc.wr_data_count_i[7]_i_13\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"718E8E71"
    )
        port map (
      I0 => \^q\(1),
      I1 => \gwdc.wr_data_count_i_reg[7]\(0),
      I2 => \gwdc.wr_data_count_i_reg[7]_0\(0),
      I3 => \gwdc.wr_data_count_i_reg[7]_0\(1),
      I4 => \^q\(2),
      O => \gwdc.wr_data_count_i[7]_i_13_n_0\
    );
\gwdc.wr_data_count_i[7]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^q\(5),
      I1 => \gwdc.wr_data_count_i_reg[7]_0\(4),
      O => \gwdc.wr_data_count_i[7]_i_2_n_0\
    );
\gwdc.wr_data_count_i[7]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^q\(4),
      I1 => \gwdc.wr_data_count_i_reg[7]_0\(3),
      O => \gwdc.wr_data_count_i[7]_i_3_n_0\
    );
\gwdc.wr_data_count_i[7]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^q\(3),
      I1 => \gwdc.wr_data_count_i_reg[7]_0\(2),
      O => \gwdc.wr_data_count_i[7]_i_4_n_0\
    );
\gwdc.wr_data_count_i[7]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^q\(2),
      I1 => \gwdc.wr_data_count_i_reg[7]_0\(1),
      O => \gwdc.wr_data_count_i[7]_i_5_n_0\
    );
\gwdc.wr_data_count_i_reg[7]_i_1\: unisim.vcomponents.CARRY8
     port map (
      CI => '0',
      CI_TOP => '0',
      CO(7) => \NLW_gwdc.wr_data_count_i_reg[7]_i_1_CO_UNCONNECTED\(7),
      CO(6) => \gwdc.wr_data_count_i_reg[7]_i_1_n_1\,
      CO(5) => \gwdc.wr_data_count_i_reg[7]_i_1_n_2\,
      CO(4) => \gwdc.wr_data_count_i_reg[7]_i_1_n_3\,
      CO(3) => \gwdc.wr_data_count_i_reg[7]_i_1_n_4\,
      CO(2) => \gwdc.wr_data_count_i_reg[7]_i_1_n_5\,
      CO(1) => \gwdc.wr_data_count_i_reg[7]_i_1_n_6\,
      CO(0) => \gwdc.wr_data_count_i_reg[7]_i_1_n_7\,
      DI(7) => '0',
      DI(6) => \gwdc.wr_data_count_i[7]_i_2_n_0\,
      DI(5) => \gwdc.wr_data_count_i[7]_i_3_n_0\,
      DI(4) => \gwdc.wr_data_count_i[7]_i_4_n_0\,
      DI(3) => \gwdc.wr_data_count_i[7]_i_5_n_0\,
      DI(2 downto 1) => DI(1 downto 0),
      DI(0) => \^q\(0),
      O(7 downto 2) => D(5 downto 0),
      O(1 downto 0) => \NLW_gwdc.wr_data_count_i_reg[7]_i_1_O_UNCONNECTED\(1 downto 0),
      S(7 downto 3) => S(6 downto 2),
      S(2) => \gwdc.wr_data_count_i[7]_i_13_n_0\,
      S(1 downto 0) => S(1 downto 0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_counter_updn__parameterized3\ is
  port (
    Q : out STD_LOGIC_VECTOR ( 6 downto 0 );
    \count_value_i_reg[1]_0\ : in STD_LOGIC_VECTOR ( 1 downto 0 );
    rd_en : in STD_LOGIC;
    ram_empty_i : in STD_LOGIC;
    \count_value_i_reg[0]_0\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    E : in STD_LOGIC_VECTOR ( 0 to 0 );
    wr_clk : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_counter_updn__parameterized3\ : entity is "xpm_counter_updn";
end \decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_counter_updn__parameterized3\;

architecture STRUCTURE of \decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_counter_updn__parameterized3\ is
  signal \^q\ : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal \count_value_i[0]_i_1__2_n_0\ : STD_LOGIC;
  signal \count_value_i[1]_i_1__2_n_0\ : STD_LOGIC;
  signal \count_value_i[2]_i_1__2_n_0\ : STD_LOGIC;
  signal \count_value_i[3]_i_1__2_n_0\ : STD_LOGIC;
  signal \count_value_i[4]_i_1__2_n_0\ : STD_LOGIC;
  signal \count_value_i[5]_i_1__2_n_0\ : STD_LOGIC;
  signal \count_value_i[6]_i_1__2_n_0\ : STD_LOGIC;
  signal \count_value_i[6]_i_2__2_n_0\ : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \count_value_i[3]_i_1__2\ : label is "soft_lutpair24";
  attribute SOFT_HLUTNM of \count_value_i[4]_i_1__2\ : label is "soft_lutpair24";
begin
  Q(6 downto 0) <= \^q\(6 downto 0);
\count_value_i[0]_i_1__2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"10EF"
    )
        port map (
      I0 => rd_en,
      I1 => \count_value_i_reg[1]_0\(0),
      I2 => \count_value_i_reg[1]_0\(1),
      I3 => \^q\(0),
      O => \count_value_i[0]_i_1__2_n_0\
    );
\count_value_i[1]_i_1__2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"02FFFD00"
    )
        port map (
      I0 => \count_value_i_reg[1]_0\(1),
      I1 => \count_value_i_reg[1]_0\(0),
      I2 => rd_en,
      I3 => \^q\(0),
      I4 => \^q\(1),
      O => \count_value_i[1]_i_1__2_n_0\
    );
\count_value_i[2]_i_1__2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => \^q\(0),
      I1 => \^q\(1),
      I2 => \^q\(2),
      O => \count_value_i[2]_i_1__2_n_0\
    );
\count_value_i[3]_i_1__2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => \^q\(1),
      I1 => \^q\(0),
      I2 => \^q\(2),
      I3 => \^q\(3),
      O => \count_value_i[3]_i_1__2_n_0\
    );
\count_value_i[4]_i_1__2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
        port map (
      I0 => \^q\(2),
      I1 => \^q\(0),
      I2 => \^q\(1),
      I3 => \^q\(3),
      I4 => \^q\(4),
      O => \count_value_i[4]_i_1__2_n_0\
    );
\count_value_i[5]_i_1__2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
        port map (
      I0 => \^q\(3),
      I1 => \count_value_i[6]_i_2__2_n_0\,
      I2 => \^q\(2),
      I3 => \^q\(4),
      I4 => \^q\(5),
      O => \count_value_i[5]_i_1__2_n_0\
    );
\count_value_i[6]_i_1__2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFF80000000"
    )
        port map (
      I0 => \^q\(4),
      I1 => \^q\(2),
      I2 => \count_value_i[6]_i_2__2_n_0\,
      I3 => \^q\(3),
      I4 => \^q\(5),
      I5 => \^q\(6),
      O => \count_value_i[6]_i_1__2_n_0\
    );
\count_value_i[6]_i_2__2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000AAA200000000"
    )
        port map (
      I0 => \^q\(1),
      I1 => \count_value_i_reg[1]_0\(1),
      I2 => \count_value_i_reg[1]_0\(0),
      I3 => rd_en,
      I4 => ram_empty_i,
      I5 => \^q\(0),
      O => \count_value_i[6]_i_2__2_n_0\
    );
\count_value_i_reg[0]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => wr_clk,
      CE => E(0),
      D => \count_value_i[0]_i_1__2_n_0\,
      Q => \^q\(0),
      S => \count_value_i_reg[0]_0\(0)
    );
\count_value_i_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => E(0),
      D => \count_value_i[1]_i_1__2_n_0\,
      Q => \^q\(1),
      R => \count_value_i_reg[0]_0\(0)
    );
\count_value_i_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => E(0),
      D => \count_value_i[2]_i_1__2_n_0\,
      Q => \^q\(2),
      R => \count_value_i_reg[0]_0\(0)
    );
\count_value_i_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => E(0),
      D => \count_value_i[3]_i_1__2_n_0\,
      Q => \^q\(3),
      R => \count_value_i_reg[0]_0\(0)
    );
\count_value_i_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => E(0),
      D => \count_value_i[4]_i_1__2_n_0\,
      Q => \^q\(4),
      R => \count_value_i_reg[0]_0\(0)
    );
\count_value_i_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => E(0),
      D => \count_value_i[5]_i_1__2_n_0\,
      Q => \^q\(5),
      R => \count_value_i_reg[0]_0\(0)
    );
\count_value_i_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => E(0),
      D => \count_value_i[6]_i_1__2_n_0\,
      Q => \^q\(6),
      R => \count_value_i_reg[0]_0\(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_counter_updn__parameterized3_1\ is
  port (
    Q : out STD_LOGIC_VECTOR ( 6 downto 0 );
    wr_en : in STD_LOGIC;
    \count_value_i_reg[5]_0\ : in STD_LOGIC;
    \count_value_i_reg[0]_0\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    rst_d1 : in STD_LOGIC;
    E : in STD_LOGIC_VECTOR ( 0 to 0 );
    wr_clk : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_counter_updn__parameterized3_1\ : entity is "xpm_counter_updn";
end \decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_counter_updn__parameterized3_1\;

architecture STRUCTURE of \decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_counter_updn__parameterized3_1\ is
  signal \^q\ : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal \count_value_i[0]_i_1__0_n_0\ : STD_LOGIC;
  signal \count_value_i[1]_i_1__0_n_0\ : STD_LOGIC;
  signal \count_value_i[2]_i_1__0_n_0\ : STD_LOGIC;
  signal \count_value_i[3]_i_1__0_n_0\ : STD_LOGIC;
  signal \count_value_i[4]_i_1__0_n_0\ : STD_LOGIC;
  signal \count_value_i[5]_i_1_n_0\ : STD_LOGIC;
  signal \count_value_i[6]_i_1_n_0\ : STD_LOGIC;
  signal \count_value_i[6]_i_2_n_0\ : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \count_value_i[1]_i_1__0\ : label is "soft_lutpair28";
  attribute SOFT_HLUTNM of \count_value_i[2]_i_1__0\ : label is "soft_lutpair28";
  attribute SOFT_HLUTNM of \count_value_i[3]_i_1__0\ : label is "soft_lutpair27";
  attribute SOFT_HLUTNM of \count_value_i[4]_i_1__0\ : label is "soft_lutpair27";
begin
  Q(6 downto 0) <= \^q\(6 downto 0);
\count_value_i[0]_i_1__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^q\(0),
      O => \count_value_i[0]_i_1__0_n_0\
    );
\count_value_i[1]_i_1__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \^q\(0),
      I1 => \^q\(1),
      O => \count_value_i[1]_i_1__0_n_0\
    );
\count_value_i[2]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => \^q\(0),
      I1 => \^q\(1),
      I2 => \^q\(2),
      O => \count_value_i[2]_i_1__0_n_0\
    );
\count_value_i[3]_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => \^q\(1),
      I1 => \^q\(0),
      I2 => \^q\(2),
      I3 => \^q\(3),
      O => \count_value_i[3]_i_1__0_n_0\
    );
\count_value_i[4]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
        port map (
      I0 => \^q\(2),
      I1 => \^q\(0),
      I2 => \^q\(1),
      I3 => \^q\(3),
      I4 => \^q\(4),
      O => \count_value_i[4]_i_1__0_n_0\
    );
\count_value_i[5]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
        port map (
      I0 => \^q\(3),
      I1 => \count_value_i[6]_i_2_n_0\,
      I2 => \^q\(2),
      I3 => \^q\(4),
      I4 => \^q\(5),
      O => \count_value_i[5]_i_1_n_0\
    );
\count_value_i[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFF80000000"
    )
        port map (
      I0 => \^q\(4),
      I1 => \^q\(2),
      I2 => \count_value_i[6]_i_2_n_0\,
      I3 => \^q\(3),
      I4 => \^q\(5),
      I5 => \^q\(6),
      O => \count_value_i[6]_i_1_n_0\
    );
\count_value_i[6]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000800000000"
    )
        port map (
      I0 => \^q\(1),
      I1 => wr_en,
      I2 => \count_value_i_reg[5]_0\,
      I3 => \count_value_i_reg[0]_0\(0),
      I4 => rst_d1,
      I5 => \^q\(0),
      O => \count_value_i[6]_i_2_n_0\
    );
\count_value_i_reg[0]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => wr_clk,
      CE => E(0),
      D => \count_value_i[0]_i_1__0_n_0\,
      Q => \^q\(0),
      S => \count_value_i_reg[0]_0\(0)
    );
\count_value_i_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => E(0),
      D => \count_value_i[1]_i_1__0_n_0\,
      Q => \^q\(1),
      R => \count_value_i_reg[0]_0\(0)
    );
\count_value_i_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => E(0),
      D => \count_value_i[2]_i_1__0_n_0\,
      Q => \^q\(2),
      R => \count_value_i_reg[0]_0\(0)
    );
\count_value_i_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => E(0),
      D => \count_value_i[3]_i_1__0_n_0\,
      Q => \^q\(3),
      R => \count_value_i_reg[0]_0\(0)
    );
\count_value_i_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => E(0),
      D => \count_value_i[4]_i_1__0_n_0\,
      Q => \^q\(4),
      R => \count_value_i_reg[0]_0\(0)
    );
\count_value_i_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => E(0),
      D => \count_value_i[5]_i_1_n_0\,
      Q => \^q\(5),
      R => \count_value_i_reg[0]_0\(0)
    );
\count_value_i_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => E(0),
      D => \count_value_i[6]_i_1_n_0\,
      Q => \^q\(6),
      R => \count_value_i_reg[0]_0\(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_reg_bit is
  port (
    rst_d1 : out STD_LOGIC;
    clr_full : out STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 0 to 0 );
    wr_clk : in STD_LOGIC;
    rst : in STD_LOGIC
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_reg_bit;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_reg_bit is
  signal \^rst_d1\ : STD_LOGIC;
begin
  rst_d1 <= \^rst_d1\;
d_out_int_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => '1',
      D => Q(0),
      Q => \^rst_d1\,
      R => '0'
    );
\gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
        port map (
      I0 => rst,
      I1 => \^rst_d1\,
      I2 => Q(0),
      O => clr_full
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_rst is
  port (
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    Q : out STD_LOGIC_VECTOR ( 0 to 0 );
    SR : out STD_LOGIC_VECTOR ( 0 to 0 );
    rst : in STD_LOGIC;
    wr_en : in STD_LOGIC;
    \count_value_i_reg[6]\ : in STD_LOGIC;
    rst_d1 : in STD_LOGIC;
    ram_empty_i : in STD_LOGIC;
    \count_value_i_reg[1]\ : in STD_LOGIC_VECTOR ( 1 downto 0 );
    wr_clk : in STD_LOGIC
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_rst;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_rst is
  signal \^q\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \gen_rst_cc.fifo_wr_rst_cc\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal p_0_in : STD_LOGIC;
  signal \power_on_rst_reg_n_0_[0]\ : STD_LOGIC;
  signal rst_i : STD_LOGIC;
begin
  Q(0) <= \^q\(0);
\count_value_i[1]_i_1__3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"AAAE"
    )
        port map (
      I0 => \^q\(0),
      I1 => ram_empty_i,
      I2 => \count_value_i_reg[1]\(1),
      I3 => \count_value_i_reg[1]\(0),
      O => SR(0)
    );
\gen_rst_cc.fifo_wr_rst_cc[2]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => p_0_in,
      I1 => rst,
      O => rst_i
    );
\gen_rst_cc.fifo_wr_rst_cc_reg[0]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => wr_clk,
      CE => '1',
      D => '0',
      Q => \gen_rst_cc.fifo_wr_rst_cc\(0),
      S => rst_i
    );
\gen_rst_cc.fifo_wr_rst_cc_reg[1]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => wr_clk,
      CE => '1',
      D => \gen_rst_cc.fifo_wr_rst_cc\(0),
      Q => \gen_rst_cc.fifo_wr_rst_cc\(1),
      S => rst_i
    );
\gen_rst_cc.fifo_wr_rst_cc_reg[2]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => wr_clk,
      CE => '1',
      D => \gen_rst_cc.fifo_wr_rst_cc\(1),
      Q => \^q\(0),
      S => rst_i
    );
\gen_sdpram.xpm_memory_base_inst_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0002"
    )
        port map (
      I0 => wr_en,
      I1 => \count_value_i_reg[6]\,
      I2 => \^q\(0),
      I3 => rst_d1,
      O => E(0)
    );
\power_on_rst_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => wr_clk,
      CE => '1',
      D => '0',
      Q => \power_on_rst_reg_n_0_[0]\,
      R => '0'
    );
\power_on_rst_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => wr_clk,
      CE => '1',
      D => \power_on_rst_reg_n_0_[0]\,
      Q => p_0_in,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base is
  port (
    sleep : in STD_LOGIC;
    clka : in STD_LOGIC;
    rsta : in STD_LOGIC;
    ena : in STD_LOGIC;
    regcea : in STD_LOGIC;
    wea : in STD_LOGIC_VECTOR ( 0 to 0 );
    addra : in STD_LOGIC_VECTOR ( 6 downto 0 );
    dina : in STD_LOGIC_VECTOR ( 146 downto 0 );
    injectsbiterra : in STD_LOGIC;
    injectdbiterra : in STD_LOGIC;
    douta : out STD_LOGIC_VECTOR ( 146 downto 0 );
    sbiterra : out STD_LOGIC;
    dbiterra : out STD_LOGIC;
    clkb : in STD_LOGIC;
    rstb : in STD_LOGIC;
    enb : in STD_LOGIC;
    regceb : in STD_LOGIC;
    web : in STD_LOGIC_VECTOR ( 0 to 0 );
    addrb : in STD_LOGIC_VECTOR ( 6 downto 0 );
    dinb : in STD_LOGIC_VECTOR ( 146 downto 0 );
    injectsbiterrb : in STD_LOGIC;
    injectdbiterrb : in STD_LOGIC;
    doutb : out STD_LOGIC_VECTOR ( 146 downto 0 );
    sbiterrb : out STD_LOGIC;
    dbiterrb : out STD_LOGIC
  );
  attribute ADDR_WIDTH_A : integer;
  attribute ADDR_WIDTH_A of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 7;
  attribute ADDR_WIDTH_B : integer;
  attribute ADDR_WIDTH_B of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 7;
  attribute AUTO_SLEEP_TIME : integer;
  attribute AUTO_SLEEP_TIME of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 0;
  attribute BYTE_WRITE_WIDTH_A : integer;
  attribute BYTE_WRITE_WIDTH_A of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 147;
  attribute BYTE_WRITE_WIDTH_B : integer;
  attribute BYTE_WRITE_WIDTH_B of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 147;
  attribute CASCADE_HEIGHT : integer;
  attribute CASCADE_HEIGHT of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 0;
  attribute CLOCKING_MODE : integer;
  attribute CLOCKING_MODE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 0;
  attribute ECC_BIT_RANGE : string;
  attribute ECC_BIT_RANGE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is "[7:0]";
  attribute ECC_MODE : integer;
  attribute ECC_MODE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 0;
  attribute ECC_TYPE : string;
  attribute ECC_TYPE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is "NONE";
  attribute IGNORE_INIT_SYNTH : integer;
  attribute IGNORE_INIT_SYNTH of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 0;
  attribute MAX_NUM_CHAR : integer;
  attribute MAX_NUM_CHAR of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 0;
  attribute MEMORY_INIT_FILE : string;
  attribute MEMORY_INIT_FILE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is "none";
  attribute MEMORY_INIT_PARAM : string;
  attribute MEMORY_INIT_PARAM of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is "";
  attribute MEMORY_OPTIMIZATION : string;
  attribute MEMORY_OPTIMIZATION of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is "true";
  attribute MEMORY_PRIMITIVE : integer;
  attribute MEMORY_PRIMITIVE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 2;
  attribute MEMORY_SIZE : integer;
  attribute MEMORY_SIZE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 18816;
  attribute MEMORY_TYPE : integer;
  attribute MEMORY_TYPE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 1;
  attribute MESSAGE_CONTROL : integer;
  attribute MESSAGE_CONTROL of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 0;
  attribute NUM_CHAR_LOC : integer;
  attribute NUM_CHAR_LOC of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 0;
  attribute P_ECC_MODE : integer;
  attribute P_ECC_MODE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 0;
  attribute P_ENABLE_BYTE_WRITE_A : integer;
  attribute P_ENABLE_BYTE_WRITE_A of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 0;
  attribute P_ENABLE_BYTE_WRITE_B : integer;
  attribute P_ENABLE_BYTE_WRITE_B of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 0;
  attribute P_MAX_DEPTH_DATA : integer;
  attribute P_MAX_DEPTH_DATA of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 128;
  attribute P_MEMORY_OPT : string;
  attribute P_MEMORY_OPT of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is "yes";
  attribute P_MEMORY_PRIMITIVE : string;
  attribute P_MEMORY_PRIMITIVE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is "block";
  attribute P_MIN_WIDTH_DATA : integer;
  attribute P_MIN_WIDTH_DATA of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 147;
  attribute P_MIN_WIDTH_DATA_A : integer;
  attribute P_MIN_WIDTH_DATA_A of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 147;
  attribute P_MIN_WIDTH_DATA_B : integer;
  attribute P_MIN_WIDTH_DATA_B of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 147;
  attribute P_MIN_WIDTH_DATA_ECC : integer;
  attribute P_MIN_WIDTH_DATA_ECC of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 147;
  attribute P_MIN_WIDTH_DATA_LDW : integer;
  attribute P_MIN_WIDTH_DATA_LDW of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 4;
  attribute P_MIN_WIDTH_DATA_SHFT : integer;
  attribute P_MIN_WIDTH_DATA_SHFT of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 147;
  attribute P_NUM_COLS_WRITE_A : integer;
  attribute P_NUM_COLS_WRITE_A of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 1;
  attribute P_NUM_COLS_WRITE_B : integer;
  attribute P_NUM_COLS_WRITE_B of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 1;
  attribute P_NUM_COL_READ_A : integer;
  attribute P_NUM_COL_READ_A of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 1;
  attribute P_NUM_COL_READ_B : integer;
  attribute P_NUM_COL_READ_B of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 1;
  attribute P_NUM_COL_WRITE_A : integer;
  attribute P_NUM_COL_WRITE_A of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 1;
  attribute P_NUM_COL_WRITE_B : integer;
  attribute P_NUM_COL_WRITE_B of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 1;
  attribute P_NUM_ROWS_READ_A : integer;
  attribute P_NUM_ROWS_READ_A of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 1;
  attribute P_NUM_ROWS_READ_B : integer;
  attribute P_NUM_ROWS_READ_B of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 1;
  attribute P_NUM_ROWS_WRITE_A : integer;
  attribute P_NUM_ROWS_WRITE_A of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 1;
  attribute P_NUM_ROWS_WRITE_B : integer;
  attribute P_NUM_ROWS_WRITE_B of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 1;
  attribute P_SDP_WRITE_MODE : string;
  attribute P_SDP_WRITE_MODE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is "no";
  attribute P_WIDTH_ADDR_LSB_READ_A : integer;
  attribute P_WIDTH_ADDR_LSB_READ_A of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 0;
  attribute P_WIDTH_ADDR_LSB_READ_B : integer;
  attribute P_WIDTH_ADDR_LSB_READ_B of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 0;
  attribute P_WIDTH_ADDR_LSB_READ_COLL_A : integer;
  attribute P_WIDTH_ADDR_LSB_READ_COLL_A of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 1;
  attribute P_WIDTH_ADDR_LSB_READ_COLL_B : integer;
  attribute P_WIDTH_ADDR_LSB_READ_COLL_B of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 1;
  attribute P_WIDTH_ADDR_LSB_WRITE_A : integer;
  attribute P_WIDTH_ADDR_LSB_WRITE_A of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 0;
  attribute P_WIDTH_ADDR_LSB_WRITE_B : integer;
  attribute P_WIDTH_ADDR_LSB_WRITE_B of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 0;
  attribute P_WIDTH_ADDR_LSB_WRITE_COLL_A : integer;
  attribute P_WIDTH_ADDR_LSB_WRITE_COLL_A of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 1;
  attribute P_WIDTH_ADDR_LSB_WRITE_COLL_B : integer;
  attribute P_WIDTH_ADDR_LSB_WRITE_COLL_B of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 1;
  attribute P_WIDTH_ADDR_READ_A : integer;
  attribute P_WIDTH_ADDR_READ_A of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 7;
  attribute P_WIDTH_ADDR_READ_B : integer;
  attribute P_WIDTH_ADDR_READ_B of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 7;
  attribute P_WIDTH_ADDR_WRITE_A : integer;
  attribute P_WIDTH_ADDR_WRITE_A of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 7;
  attribute P_WIDTH_ADDR_WRITE_B : integer;
  attribute P_WIDTH_ADDR_WRITE_B of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 7;
  attribute P_WIDTH_COL_WRITE_A : integer;
  attribute P_WIDTH_COL_WRITE_A of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 147;
  attribute P_WIDTH_COL_WRITE_B : integer;
  attribute P_WIDTH_COL_WRITE_B of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 147;
  attribute RAM_DECOMP : string;
  attribute RAM_DECOMP of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is "auto";
  attribute READ_DATA_WIDTH_A : integer;
  attribute READ_DATA_WIDTH_A of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 147;
  attribute READ_DATA_WIDTH_B : integer;
  attribute READ_DATA_WIDTH_B of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 147;
  attribute READ_LATENCY_A : integer;
  attribute READ_LATENCY_A of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 2;
  attribute READ_LATENCY_B : integer;
  attribute READ_LATENCY_B of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 2;
  attribute READ_RESET_VALUE_A : string;
  attribute READ_RESET_VALUE_A of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is "0";
  attribute READ_RESET_VALUE_B : string;
  attribute READ_RESET_VALUE_B of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is "0";
  attribute RST_MODE_A : string;
  attribute RST_MODE_A of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is "SYNC";
  attribute RST_MODE_B : string;
  attribute RST_MODE_B of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is "SYNC";
  attribute SIM_ASSERT_CHK : integer;
  attribute SIM_ASSERT_CHK of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 0;
  attribute USE_EMBEDDED_CONSTRAINT : integer;
  attribute USE_EMBEDDED_CONSTRAINT of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 0;
  attribute USE_MEM_INIT : integer;
  attribute USE_MEM_INIT of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 0;
  attribute USE_MEM_INIT_MMI : integer;
  attribute USE_MEM_INIT_MMI of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 0;
  attribute VERSION : integer;
  attribute VERSION of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 0;
  attribute WAKEUP_TIME : integer;
  attribute WAKEUP_TIME of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 0;
  attribute WRITE_DATA_WIDTH_A : integer;
  attribute WRITE_DATA_WIDTH_A of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 147;
  attribute WRITE_DATA_WIDTH_B : integer;
  attribute WRITE_DATA_WIDTH_B of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 147;
  attribute WRITE_MODE_A : integer;
  attribute WRITE_MODE_A of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 2;
  attribute WRITE_MODE_B : integer;
  attribute WRITE_MODE_B of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 2;
  attribute WRITE_PROTECT : integer;
  attribute WRITE_PROTECT of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 1;
  attribute XPM_MODULE : string;
  attribute XPM_MODULE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is "TRUE";
  attribute keep_hierarchy : string;
  attribute keep_hierarchy of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is "soft";
  attribute rsta_loop_iter : integer;
  attribute rsta_loop_iter of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 148;
  attribute rstb_loop_iter : integer;
  attribute rstb_loop_iter of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 148;
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base is
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_0_CASOUTDBITERR_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_0_CASOUTSBITERR_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_0_DBITERR_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_0_SBITERR_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_0_CASDINA_UNCONNECTED\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_0_CASDINB_UNCONNECTED\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_0_CASDINPA_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_0_CASDINPB_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_0_CASDOUTA_UNCONNECTED\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_0_CASDOUTB_UNCONNECTED\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_0_CASDOUTPA_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_0_CASDOUTPB_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_0_ECCPARITY_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_0_RDADDRECC_UNCONNECTED\ : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_1_CASOUTDBITERR_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_1_CASOUTSBITERR_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_1_DBITERR_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_1_SBITERR_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_1_CASDINA_UNCONNECTED\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_1_CASDINB_UNCONNECTED\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_1_CASDINPA_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_1_CASDINPB_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_1_CASDOUTA_UNCONNECTED\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_1_CASDOUTB_UNCONNECTED\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_1_CASDOUTPA_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_1_CASDOUTPB_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_1_ECCPARITY_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_1_RDADDRECC_UNCONNECTED\ : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_2_CASDINA_UNCONNECTED\ : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_2_CASDINB_UNCONNECTED\ : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_2_CASDINPA_UNCONNECTED\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_2_CASDINPB_UNCONNECTED\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_2_CASDOUTA_UNCONNECTED\ : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_2_CASDOUTB_UNCONNECTED\ : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_2_CASDOUTPA_UNCONNECTED\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_2_CASDOUTPB_UNCONNECTED\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_2_DOUTADOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 15 downto 2 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_2_DOUTBDOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_2_DOUTPADOUTP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_2_DOUTPBDOUTP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute \MEM.PORTA.ADDRESS_BEGIN\ : integer;
  attribute \MEM.PORTA.ADDRESS_BEGIN\ of \gen_wr_a.gen_word_narrow.mem_reg_0\ : label is 0;
  attribute \MEM.PORTA.ADDRESS_END\ : integer;
  attribute \MEM.PORTA.ADDRESS_END\ of \gen_wr_a.gen_word_narrow.mem_reg_0\ : label is 511;
  attribute \MEM.PORTA.DATA_BIT_LAYOUT\ : string;
  attribute \MEM.PORTA.DATA_BIT_LAYOUT\ of \gen_wr_a.gen_word_narrow.mem_reg_0\ : label is "p8_d64";
  attribute \MEM.PORTA.DATA_LSB\ : integer;
  attribute \MEM.PORTA.DATA_LSB\ of \gen_wr_a.gen_word_narrow.mem_reg_0\ : label is 0;
  attribute \MEM.PORTA.DATA_MSB\ : integer;
  attribute \MEM.PORTA.DATA_MSB\ of \gen_wr_a.gen_word_narrow.mem_reg_0\ : label is 71;
  attribute \MEM.PORTB.ADDRESS_BEGIN\ : integer;
  attribute \MEM.PORTB.ADDRESS_BEGIN\ of \gen_wr_a.gen_word_narrow.mem_reg_0\ : label is 0;
  attribute \MEM.PORTB.ADDRESS_END\ : integer;
  attribute \MEM.PORTB.ADDRESS_END\ of \gen_wr_a.gen_word_narrow.mem_reg_0\ : label is 511;
  attribute \MEM.PORTB.DATA_BIT_LAYOUT\ : string;
  attribute \MEM.PORTB.DATA_BIT_LAYOUT\ of \gen_wr_a.gen_word_narrow.mem_reg_0\ : label is "p8_d64";
  attribute \MEM.PORTB.DATA_LSB\ : integer;
  attribute \MEM.PORTB.DATA_LSB\ of \gen_wr_a.gen_word_narrow.mem_reg_0\ : label is 0;
  attribute \MEM.PORTB.DATA_MSB\ : integer;
  attribute \MEM.PORTB.DATA_MSB\ of \gen_wr_a.gen_word_narrow.mem_reg_0\ : label is 71;
  attribute METHODOLOGY_DRC_VIOS : string;
  attribute METHODOLOGY_DRC_VIOS of \gen_wr_a.gen_word_narrow.mem_reg_0\ : label is "";
  attribute RDADDR_COLLISION_HWCONFIG : string;
  attribute RDADDR_COLLISION_HWCONFIG of \gen_wr_a.gen_word_narrow.mem_reg_0\ : label is "DELAYED_WRITE";
  attribute RTL_RAM_BITS : integer;
  attribute RTL_RAM_BITS of \gen_wr_a.gen_word_narrow.mem_reg_0\ : label is 18816;
  attribute RTL_RAM_NAME : string;
  attribute RTL_RAM_NAME of \gen_wr_a.gen_word_narrow.mem_reg_0\ : label is "xpm_memory_base/gen_wr_a.gen_word_narrow.mem_reg";
  attribute RTL_RAM_STYLE : string;
  attribute RTL_RAM_STYLE of \gen_wr_a.gen_word_narrow.mem_reg_0\ : label is "block";
  attribute RTL_RAM_TYPE : string;
  attribute RTL_RAM_TYPE of \gen_wr_a.gen_word_narrow.mem_reg_0\ : label is "RAM_SDP";
  attribute ram_addr_begin : integer;
  attribute ram_addr_begin of \gen_wr_a.gen_word_narrow.mem_reg_0\ : label is 0;
  attribute ram_addr_end : integer;
  attribute ram_addr_end of \gen_wr_a.gen_word_narrow.mem_reg_0\ : label is 511;
  attribute ram_offset : integer;
  attribute ram_offset of \gen_wr_a.gen_word_narrow.mem_reg_0\ : label is 0;
  attribute ram_slice_begin : integer;
  attribute ram_slice_begin of \gen_wr_a.gen_word_narrow.mem_reg_0\ : label is 0;
  attribute ram_slice_end : integer;
  attribute ram_slice_end of \gen_wr_a.gen_word_narrow.mem_reg_0\ : label is 71;
  attribute \MEM.PORTA.ADDRESS_BEGIN\ of \gen_wr_a.gen_word_narrow.mem_reg_1\ : label is 0;
  attribute \MEM.PORTA.ADDRESS_END\ of \gen_wr_a.gen_word_narrow.mem_reg_1\ : label is 511;
  attribute \MEM.PORTA.DATA_BIT_LAYOUT\ of \gen_wr_a.gen_word_narrow.mem_reg_1\ : label is "p8_d64";
  attribute \MEM.PORTA.DATA_LSB\ of \gen_wr_a.gen_word_narrow.mem_reg_1\ : label is 72;
  attribute \MEM.PORTA.DATA_MSB\ of \gen_wr_a.gen_word_narrow.mem_reg_1\ : label is 143;
  attribute \MEM.PORTB.ADDRESS_BEGIN\ of \gen_wr_a.gen_word_narrow.mem_reg_1\ : label is 0;
  attribute \MEM.PORTB.ADDRESS_END\ of \gen_wr_a.gen_word_narrow.mem_reg_1\ : label is 511;
  attribute \MEM.PORTB.DATA_BIT_LAYOUT\ of \gen_wr_a.gen_word_narrow.mem_reg_1\ : label is "p8_d64";
  attribute \MEM.PORTB.DATA_LSB\ of \gen_wr_a.gen_word_narrow.mem_reg_1\ : label is 72;
  attribute \MEM.PORTB.DATA_MSB\ of \gen_wr_a.gen_word_narrow.mem_reg_1\ : label is 143;
  attribute METHODOLOGY_DRC_VIOS of \gen_wr_a.gen_word_narrow.mem_reg_1\ : label is "";
  attribute RDADDR_COLLISION_HWCONFIG of \gen_wr_a.gen_word_narrow.mem_reg_1\ : label is "DELAYED_WRITE";
  attribute RTL_RAM_BITS of \gen_wr_a.gen_word_narrow.mem_reg_1\ : label is 18816;
  attribute RTL_RAM_NAME of \gen_wr_a.gen_word_narrow.mem_reg_1\ : label is "xpm_memory_base/gen_wr_a.gen_word_narrow.mem_reg";
  attribute RTL_RAM_STYLE of \gen_wr_a.gen_word_narrow.mem_reg_1\ : label is "block";
  attribute RTL_RAM_TYPE of \gen_wr_a.gen_word_narrow.mem_reg_1\ : label is "RAM_SDP";
  attribute ram_addr_begin of \gen_wr_a.gen_word_narrow.mem_reg_1\ : label is 0;
  attribute ram_addr_end of \gen_wr_a.gen_word_narrow.mem_reg_1\ : label is 511;
  attribute ram_offset of \gen_wr_a.gen_word_narrow.mem_reg_1\ : label is 0;
  attribute ram_slice_begin of \gen_wr_a.gen_word_narrow.mem_reg_1\ : label is 72;
  attribute ram_slice_end of \gen_wr_a.gen_word_narrow.mem_reg_1\ : label is 143;
  attribute \MEM.PORTA.ADDRESS_BEGIN\ of \gen_wr_a.gen_word_narrow.mem_reg_2\ : label is 0;
  attribute \MEM.PORTA.ADDRESS_END\ of \gen_wr_a.gen_word_narrow.mem_reg_2\ : label is 511;
  attribute \MEM.PORTA.DATA_BIT_LAYOUT\ of \gen_wr_a.gen_word_narrow.mem_reg_2\ : label is "p0_d2";
  attribute \MEM.PORTA.DATA_LSB\ of \gen_wr_a.gen_word_narrow.mem_reg_2\ : label is 144;
  attribute \MEM.PORTA.DATA_MSB\ of \gen_wr_a.gen_word_narrow.mem_reg_2\ : label is 145;
  attribute \MEM.PORTB.ADDRESS_BEGIN\ of \gen_wr_a.gen_word_narrow.mem_reg_2\ : label is 0;
  attribute \MEM.PORTB.ADDRESS_END\ of \gen_wr_a.gen_word_narrow.mem_reg_2\ : label is 511;
  attribute \MEM.PORTB.DATA_BIT_LAYOUT\ of \gen_wr_a.gen_word_narrow.mem_reg_2\ : label is "p0_d2";
  attribute \MEM.PORTB.DATA_LSB\ of \gen_wr_a.gen_word_narrow.mem_reg_2\ : label is 144;
  attribute \MEM.PORTB.DATA_MSB\ of \gen_wr_a.gen_word_narrow.mem_reg_2\ : label is 145;
  attribute METHODOLOGY_DRC_VIOS of \gen_wr_a.gen_word_narrow.mem_reg_2\ : label is "";
  attribute RDADDR_COLLISION_HWCONFIG of \gen_wr_a.gen_word_narrow.mem_reg_2\ : label is "DELAYED_WRITE";
  attribute RTL_RAM_BITS of \gen_wr_a.gen_word_narrow.mem_reg_2\ : label is 18816;
  attribute RTL_RAM_NAME of \gen_wr_a.gen_word_narrow.mem_reg_2\ : label is "xpm_memory_base/gen_wr_a.gen_word_narrow.mem_reg";
  attribute RTL_RAM_STYLE of \gen_wr_a.gen_word_narrow.mem_reg_2\ : label is "block";
  attribute RTL_RAM_TYPE of \gen_wr_a.gen_word_narrow.mem_reg_2\ : label is "RAM_SDP";
  attribute ram_addr_begin of \gen_wr_a.gen_word_narrow.mem_reg_2\ : label is 0;
  attribute ram_addr_end of \gen_wr_a.gen_word_narrow.mem_reg_2\ : label is 511;
  attribute ram_offset of \gen_wr_a.gen_word_narrow.mem_reg_2\ : label is 0;
  attribute ram_slice_begin of \gen_wr_a.gen_word_narrow.mem_reg_2\ : label is 144;
  attribute ram_slice_end of \gen_wr_a.gen_word_narrow.mem_reg_2\ : label is 145;
begin
\gen_wr_a.gen_word_narrow.mem_reg_0\: unisim.vcomponents.RAMB36E2
    generic map(
      CASCADE_ORDER_A => "NONE",
      CASCADE_ORDER_B => "NONE",
      CLOCK_DOMAINS => "COMMON",
      DOA_REG => 1,
      DOB_REG => 1,
      ENADDRENA => "FALSE",
      ENADDRENB => "FALSE",
      EN_ECC_PIPE => "FALSE",
      EN_ECC_READ => "FALSE",
      EN_ECC_WRITE => "FALSE",
      INITP_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_08 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_09 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_08 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_09 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_10 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_11 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_12 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_13 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_14 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_15 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_16 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_17 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_18 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_19 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_20 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_21 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_22 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_23 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_24 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_25 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_26 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_27 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_28 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_29 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_30 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_31 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_32 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_33 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_34 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_35 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_36 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_37 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_38 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_39 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_40 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_41 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_42 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_43 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_44 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_45 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_46 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_47 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_48 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_49 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_50 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_51 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_52 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_53 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_54 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_55 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_56 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_57 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_58 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_59 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_60 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_61 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_62 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_63 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_64 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_65 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_66 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_67 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_68 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_69 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_70 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_71 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_72 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_73 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_74 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_75 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_76 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_77 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_78 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_79 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_A => X"000000000",
      INIT_B => X"000000000",
      INIT_FILE => "NONE",
      RDADDRCHANGEA => "FALSE",
      RDADDRCHANGEB => "FALSE",
      READ_WIDTH_A => 72,
      READ_WIDTH_B => 0,
      RSTREG_PRIORITY_A => "RSTREG",
      RSTREG_PRIORITY_B => "RSTREG",
      SIM_COLLISION_CHECK => "ALL",
      SLEEP_ASYNC => "FALSE",
      SRVAL_A => X"000000000",
      SRVAL_B => X"000000000",
      WRITE_MODE_A => "NO_CHANGE",
      WRITE_MODE_B => "NO_CHANGE",
      WRITE_WIDTH_A => 0,
      WRITE_WIDTH_B => 72
    )
        port map (
      ADDRARDADDR(14 downto 13) => B"00",
      ADDRARDADDR(12 downto 6) => addrb(6 downto 0),
      ADDRARDADDR(5 downto 0) => B"111111",
      ADDRBWRADDR(14 downto 13) => B"00",
      ADDRBWRADDR(12 downto 6) => addra(6 downto 0),
      ADDRBWRADDR(5 downto 0) => B"111111",
      ADDRENA => '1',
      ADDRENB => '1',
      CASDIMUXA => '0',
      CASDIMUXB => '0',
      CASDINA(31 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_0_CASDINA_UNCONNECTED\(31 downto 0),
      CASDINB(31 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_0_CASDINB_UNCONNECTED\(31 downto 0),
      CASDINPA(3 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_0_CASDINPA_UNCONNECTED\(3 downto 0),
      CASDINPB(3 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_0_CASDINPB_UNCONNECTED\(3 downto 0),
      CASDOMUXA => '0',
      CASDOMUXB => '0',
      CASDOMUXEN_A => '1',
      CASDOMUXEN_B => '1',
      CASDOUTA(31 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_0_CASDOUTA_UNCONNECTED\(31 downto 0),
      CASDOUTB(31 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_0_CASDOUTB_UNCONNECTED\(31 downto 0),
      CASDOUTPA(3 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_0_CASDOUTPA_UNCONNECTED\(3 downto 0),
      CASDOUTPB(3 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_0_CASDOUTPB_UNCONNECTED\(3 downto 0),
      CASINDBITERR => '0',
      CASINSBITERR => '0',
      CASOREGIMUXA => '0',
      CASOREGIMUXB => '0',
      CASOREGIMUXEN_A => '1',
      CASOREGIMUXEN_B => '1',
      CASOUTDBITERR => \NLW_gen_wr_a.gen_word_narrow.mem_reg_0_CASOUTDBITERR_UNCONNECTED\,
      CASOUTSBITERR => \NLW_gen_wr_a.gen_word_narrow.mem_reg_0_CASOUTSBITERR_UNCONNECTED\,
      CLKARDCLK => clka,
      CLKBWRCLK => clka,
      DBITERR => \NLW_gen_wr_a.gen_word_narrow.mem_reg_0_DBITERR_UNCONNECTED\,
      DINADIN(31 downto 0) => dina(31 downto 0),
      DINBDIN(31 downto 0) => dina(63 downto 32),
      DINPADINP(3 downto 0) => dina(67 downto 64),
      DINPBDINP(3 downto 0) => dina(71 downto 68),
      DOUTADOUT(31 downto 0) => doutb(31 downto 0),
      DOUTBDOUT(31 downto 0) => doutb(63 downto 32),
      DOUTPADOUTP(3 downto 0) => doutb(67 downto 64),
      DOUTPBDOUTP(3 downto 0) => doutb(71 downto 68),
      ECCPARITY(7 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_0_ECCPARITY_UNCONNECTED\(7 downto 0),
      ECCPIPECE => '1',
      ENARDEN => enb,
      ENBWREN => '1',
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      RDADDRECC(8 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_0_RDADDRECC_UNCONNECTED\(8 downto 0),
      REGCEAREGCE => regceb,
      REGCEB => '0',
      RSTRAMARSTRAM => '0',
      RSTRAMB => '0',
      RSTREGARSTREG => rstb,
      RSTREGB => '0',
      SBITERR => \NLW_gen_wr_a.gen_word_narrow.mem_reg_0_SBITERR_UNCONNECTED\,
      SLEEP => '0',
      WEA(3 downto 0) => B"0000",
      WEBWE(7) => wea(0),
      WEBWE(6) => wea(0),
      WEBWE(5) => wea(0),
      WEBWE(4) => wea(0),
      WEBWE(3) => wea(0),
      WEBWE(2) => wea(0),
      WEBWE(1) => wea(0),
      WEBWE(0) => wea(0)
    );
\gen_wr_a.gen_word_narrow.mem_reg_1\: unisim.vcomponents.RAMB36E2
    generic map(
      CASCADE_ORDER_A => "NONE",
      CASCADE_ORDER_B => "NONE",
      CLOCK_DOMAINS => "COMMON",
      DOA_REG => 1,
      DOB_REG => 1,
      ENADDRENA => "FALSE",
      ENADDRENB => "FALSE",
      EN_ECC_PIPE => "FALSE",
      EN_ECC_READ => "FALSE",
      EN_ECC_WRITE => "FALSE",
      INITP_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_08 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_09 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_08 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_09 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_10 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_11 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_12 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_13 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_14 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_15 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_16 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_17 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_18 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_19 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_20 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_21 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_22 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_23 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_24 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_25 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_26 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_27 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_28 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_29 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_30 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_31 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_32 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_33 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_34 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_35 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_36 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_37 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_38 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_39 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_40 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_41 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_42 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_43 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_44 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_45 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_46 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_47 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_48 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_49 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_50 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_51 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_52 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_53 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_54 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_55 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_56 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_57 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_58 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_59 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_60 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_61 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_62 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_63 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_64 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_65 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_66 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_67 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_68 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_69 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_70 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_71 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_72 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_73 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_74 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_75 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_76 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_77 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_78 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_79 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_A => X"000000000",
      INIT_B => X"000000000",
      INIT_FILE => "NONE",
      RDADDRCHANGEA => "FALSE",
      RDADDRCHANGEB => "FALSE",
      READ_WIDTH_A => 72,
      READ_WIDTH_B => 0,
      RSTREG_PRIORITY_A => "RSTREG",
      RSTREG_PRIORITY_B => "RSTREG",
      SIM_COLLISION_CHECK => "ALL",
      SLEEP_ASYNC => "FALSE",
      SRVAL_A => X"000000000",
      SRVAL_B => X"000000000",
      WRITE_MODE_A => "NO_CHANGE",
      WRITE_MODE_B => "NO_CHANGE",
      WRITE_WIDTH_A => 0,
      WRITE_WIDTH_B => 72
    )
        port map (
      ADDRARDADDR(14 downto 13) => B"00",
      ADDRARDADDR(12 downto 6) => addrb(6 downto 0),
      ADDRARDADDR(5 downto 0) => B"111111",
      ADDRBWRADDR(14 downto 13) => B"00",
      ADDRBWRADDR(12 downto 6) => addra(6 downto 0),
      ADDRBWRADDR(5 downto 0) => B"111111",
      ADDRENA => '1',
      ADDRENB => '1',
      CASDIMUXA => '0',
      CASDIMUXB => '0',
      CASDINA(31 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_1_CASDINA_UNCONNECTED\(31 downto 0),
      CASDINB(31 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_1_CASDINB_UNCONNECTED\(31 downto 0),
      CASDINPA(3 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_1_CASDINPA_UNCONNECTED\(3 downto 0),
      CASDINPB(3 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_1_CASDINPB_UNCONNECTED\(3 downto 0),
      CASDOMUXA => '0',
      CASDOMUXB => '0',
      CASDOMUXEN_A => '1',
      CASDOMUXEN_B => '1',
      CASDOUTA(31 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_1_CASDOUTA_UNCONNECTED\(31 downto 0),
      CASDOUTB(31 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_1_CASDOUTB_UNCONNECTED\(31 downto 0),
      CASDOUTPA(3 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_1_CASDOUTPA_UNCONNECTED\(3 downto 0),
      CASDOUTPB(3 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_1_CASDOUTPB_UNCONNECTED\(3 downto 0),
      CASINDBITERR => '0',
      CASINSBITERR => '0',
      CASOREGIMUXA => '0',
      CASOREGIMUXB => '0',
      CASOREGIMUXEN_A => '1',
      CASOREGIMUXEN_B => '1',
      CASOUTDBITERR => \NLW_gen_wr_a.gen_word_narrow.mem_reg_1_CASOUTDBITERR_UNCONNECTED\,
      CASOUTSBITERR => \NLW_gen_wr_a.gen_word_narrow.mem_reg_1_CASOUTSBITERR_UNCONNECTED\,
      CLKARDCLK => clka,
      CLKBWRCLK => clka,
      DBITERR => \NLW_gen_wr_a.gen_word_narrow.mem_reg_1_DBITERR_UNCONNECTED\,
      DINADIN(31 downto 0) => dina(103 downto 72),
      DINBDIN(31 downto 0) => dina(135 downto 104),
      DINPADINP(3 downto 0) => dina(139 downto 136),
      DINPBDINP(3 downto 0) => dina(143 downto 140),
      DOUTADOUT(31 downto 0) => doutb(103 downto 72),
      DOUTBDOUT(31 downto 0) => doutb(135 downto 104),
      DOUTPADOUTP(3 downto 0) => doutb(139 downto 136),
      DOUTPBDOUTP(3 downto 0) => doutb(143 downto 140),
      ECCPARITY(7 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_1_ECCPARITY_UNCONNECTED\(7 downto 0),
      ECCPIPECE => '1',
      ENARDEN => enb,
      ENBWREN => '1',
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      RDADDRECC(8 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_1_RDADDRECC_UNCONNECTED\(8 downto 0),
      REGCEAREGCE => regceb,
      REGCEB => '0',
      RSTRAMARSTRAM => '0',
      RSTRAMB => '0',
      RSTREGARSTREG => rstb,
      RSTREGB => '0',
      SBITERR => \NLW_gen_wr_a.gen_word_narrow.mem_reg_1_SBITERR_UNCONNECTED\,
      SLEEP => '0',
      WEA(3 downto 0) => B"0000",
      WEBWE(7) => wea(0),
      WEBWE(6) => wea(0),
      WEBWE(5) => wea(0),
      WEBWE(4) => wea(0),
      WEBWE(3) => wea(0),
      WEBWE(2) => wea(0),
      WEBWE(1) => wea(0),
      WEBWE(0) => wea(0)
    );
\gen_wr_a.gen_word_narrow.mem_reg_2\: unisim.vcomponents.RAMB18E2
    generic map(
      CASCADE_ORDER_A => "NONE",
      CASCADE_ORDER_B => "NONE",
      CLOCK_DOMAINS => "COMMON",
      DOA_REG => 1,
      DOB_REG => 0,
      ENADDRENA => "FALSE",
      ENADDRENB => "FALSE",
      INITP_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_08 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_09 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_10 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_11 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_12 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_13 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_14 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_15 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_16 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_17 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_18 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_19 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_20 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_21 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_22 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_23 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_24 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_25 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_26 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_27 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_28 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_29 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_30 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_31 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_32 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_33 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_34 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_35 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_36 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_37 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_38 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_39 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_A => B"00" & X"0000",
      INIT_B => B"00" & X"0000",
      INIT_FILE => "NONE",
      RDADDRCHANGEA => "FALSE",
      RDADDRCHANGEB => "FALSE",
      READ_WIDTH_A => 36,
      READ_WIDTH_B => 0,
      RSTREG_PRIORITY_A => "RSTREG",
      RSTREG_PRIORITY_B => "RSTREG",
      SIM_COLLISION_CHECK => "ALL",
      SLEEP_ASYNC => "FALSE",
      SRVAL_A => B"00" & X"0000",
      SRVAL_B => B"00" & X"0000",
      WRITE_MODE_A => "NO_CHANGE",
      WRITE_MODE_B => "NO_CHANGE",
      WRITE_WIDTH_A => 0,
      WRITE_WIDTH_B => 36
    )
        port map (
      ADDRARDADDR(13 downto 12) => B"00",
      ADDRARDADDR(11 downto 5) => addrb(6 downto 0),
      ADDRARDADDR(4 downto 0) => B"11111",
      ADDRBWRADDR(13 downto 12) => B"00",
      ADDRBWRADDR(11 downto 5) => addra(6 downto 0),
      ADDRBWRADDR(4 downto 0) => B"11111",
      ADDRENA => '1',
      ADDRENB => '1',
      CASDIMUXA => '0',
      CASDIMUXB => '0',
      CASDINA(15 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_2_CASDINA_UNCONNECTED\(15 downto 0),
      CASDINB(15 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_2_CASDINB_UNCONNECTED\(15 downto 0),
      CASDINPA(1 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_2_CASDINPA_UNCONNECTED\(1 downto 0),
      CASDINPB(1 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_2_CASDINPB_UNCONNECTED\(1 downto 0),
      CASDOMUXA => '0',
      CASDOMUXB => '0',
      CASDOMUXEN_A => '1',
      CASDOMUXEN_B => '1',
      CASDOUTA(15 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_2_CASDOUTA_UNCONNECTED\(15 downto 0),
      CASDOUTB(15 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_2_CASDOUTB_UNCONNECTED\(15 downto 0),
      CASDOUTPA(1 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_2_CASDOUTPA_UNCONNECTED\(1 downto 0),
      CASDOUTPB(1 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_2_CASDOUTPB_UNCONNECTED\(1 downto 0),
      CASOREGIMUXA => '0',
      CASOREGIMUXB => '0',
      CASOREGIMUXEN_A => '1',
      CASOREGIMUXEN_B => '1',
      CLKARDCLK => clka,
      CLKBWRCLK => clka,
      DINADIN(15 downto 2) => B"11111111111111",
      DINADIN(1 downto 0) => dina(145 downto 144),
      DINBDIN(15 downto 0) => B"1111111111111111",
      DINPADINP(1 downto 0) => B"11",
      DINPBDINP(1 downto 0) => B"11",
      DOUTADOUT(15 downto 2) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_2_DOUTADOUT_UNCONNECTED\(15 downto 2),
      DOUTADOUT(1 downto 0) => doutb(145 downto 144),
      DOUTBDOUT(15 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_2_DOUTBDOUT_UNCONNECTED\(15 downto 0),
      DOUTPADOUTP(1 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_2_DOUTPADOUTP_UNCONNECTED\(1 downto 0),
      DOUTPBDOUTP(1 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_2_DOUTPBDOUTP_UNCONNECTED\(1 downto 0),
      ENARDEN => enb,
      ENBWREN => '1',
      REGCEAREGCE => regceb,
      REGCEB => '1',
      RSTRAMARSTRAM => '0',
      RSTRAMB => '0',
      RSTREGARSTREG => rstb,
      RSTREGB => '0',
      SLEEP => '0',
      WEA(1 downto 0) => B"00",
      WEBWE(3) => wea(0),
      WEBWE(2) => wea(0),
      WEBWE(1) => wea(0),
      WEBWE(0) => wea(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_datamover_cmd_status is
  port (
    sig_cmd2mstr_cmd_valid : out STD_LOGIC;
    s_axis_mm2s_cmd_tready : out STD_LOGIC;
    \USE_SINGLE_REG.sig_regfifo_full_reg_reg\ : out STD_LOGIC;
    sig_stat2rsc_status_ready : out STD_LOGIC;
    mm2s_decerr_i : out STD_LOGIC;
    mm2s_interr_i : out STD_LOGIC;
    mm2s_slverr_i : out STD_LOGIC;
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    Q : out STD_LOGIC_VECTOR ( 47 downto 0 );
    SR : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_mm2s_aclk : in STD_LOGIC;
    \USE_SINGLE_REG.sig_regfifo_full_reg_reg_0\ : in STD_LOGIC;
    mm2s_sts_received : in STD_LOGIC;
    sig_cmd_stat_rst_int_reg_n : in STD_LOGIC;
    sig_rsc2stat_status_valid : in STD_LOGIC;
    m_axis_mm2s_sts_tready : in STD_LOGIC;
    s_axis_mm2s_cmd_tvalid_split : in STD_LOGIC;
    \USE_SINGLE_REG.sig_regfifo_empty_reg_reg\ : in STD_LOGIC;
    D : in STD_LOGIC_VECTOR ( 47 downto 0 );
    \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[6]\ : in STD_LOGIC_VECTOR ( 2 downto 0 )
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_datamover_cmd_status;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_datamover_cmd_status is
  signal I_CMD_FIFO_n_3 : STD_LOGIC;
  signal sig_init_done : STD_LOGIC;
begin
\GEN_INCLUDE_STATUS_FIFO.I_STS_FIFO\: entity work.\decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_datamover_fifo__parameterized0\
     port map (
      SR(0) => SR(0),
      \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[6]_0\(2 downto 0) => \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[6]\(2 downto 0),
      \USE_SINGLE_REG.sig_regfifo_empty_reg_reg_0\ => sig_stat2rsc_status_ready,
      \USE_SINGLE_REG.sig_regfifo_full_reg_reg_0\ => \USE_SINGLE_REG.sig_regfifo_full_reg_reg\,
      m_axi_mm2s_aclk => m_axi_mm2s_aclk,
      m_axis_mm2s_sts_tready => m_axis_mm2s_sts_tready,
      mm2s_decerr_i => mm2s_decerr_i,
      mm2s_interr_i => mm2s_interr_i,
      mm2s_slverr_i => mm2s_slverr_i,
      mm2s_sts_received => mm2s_sts_received,
      sig_cmd_stat_rst_int_reg_n => sig_cmd_stat_rst_int_reg_n,
      sig_init_done => sig_init_done,
      sig_init_done_reg_0 => I_CMD_FIFO_n_3,
      sig_rsc2stat_status_valid => sig_rsc2stat_status_valid
    );
I_CMD_FIFO: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_datamover_fifo
     port map (
      D(47 downto 0) => D(47 downto 0),
      E(0) => E(0),
      Q(47 downto 0) => Q(47 downto 0),
      SR(0) => SR(0),
      \USE_SINGLE_REG.sig_regfifo_empty_reg_reg_0\ => \USE_SINGLE_REG.sig_regfifo_empty_reg_reg\,
      \USE_SINGLE_REG.sig_regfifo_full_reg_reg_0\ => \USE_SINGLE_REG.sig_regfifo_full_reg_reg_0\,
      m_axi_mm2s_aclk => m_axi_mm2s_aclk,
      s_axis_mm2s_cmd_tready => s_axis_mm2s_cmd_tready,
      s_axis_mm2s_cmd_tvalid_split => s_axis_mm2s_cmd_tvalid_split,
      sig_cmd2mstr_cmd_valid => sig_cmd2mstr_cmd_valid,
      sig_cmd_stat_rst_int_reg_n => sig_cmd_stat_rst_int_reg_n,
      sig_cmd_stat_rst_int_reg_n_reg => I_CMD_FIFO_n_3,
      sig_init_done => sig_init_done
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_datamover_fifo__parameterized1\ is
  port (
    FIFO_Full_reg : out STD_LOGIC;
    sig_init_reg2 : out STD_LOGIC;
    FIFO_Full_reg_0 : out STD_LOGIC;
    sig_inhibit_rdy_n_reg_0 : out STD_LOGIC;
    sig_push_addr_reg1_out : out STD_LOGIC;
    sig_addr_reg_empty_reg : out STD_LOGIC;
    sig_calc_error_reg_reg : out STD_LOGIC;
    \out\ : out STD_LOGIC_VECTOR ( 36 downto 0 );
    SS : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_mm2s_aclk : in STD_LOGIC;
    sig_init_reg : in STD_LOGIC;
    \sig_addr_cntr_lsh_im0_reg[0]\ : in STD_LOGIC;
    \sig_addr_cntr_lsh_im0_reg[0]_0\ : in STD_LOGIC;
    \USE_SRL_FIFO.sig_wr_fifo\ : in STD_LOGIC;
    sig_mstr2addr_cmd_valid : in STD_LOGIC;
    sig_mmap_rst_reg_n : in STD_LOGIC;
    sig_addr_reg_empty : in STD_LOGIC;
    sig_sf_allow_addr_req : in STD_LOGIC;
    sig_data2addr_stop_req : in STD_LOGIC;
    \in\ : in STD_LOGIC_VECTOR ( 35 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_datamover_fifo__parameterized1\ : entity is "axi_datamover_fifo";
end \decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_datamover_fifo__parameterized1\;

architecture STRUCTURE of \decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_datamover_fifo__parameterized1\ is
  signal sig_inhibit_rdy_n_i_1_n_0 : STD_LOGIC;
  signal \^sig_inhibit_rdy_n_reg_0\ : STD_LOGIC;
  signal sig_init_done : STD_LOGIC;
  signal \sig_init_done_i_1__1_n_0\ : STD_LOGIC;
  signal \^sig_init_reg2\ : STD_LOGIC;
begin
  sig_inhibit_rdy_n_reg_0 <= \^sig_inhibit_rdy_n_reg_0\;
  sig_init_reg2 <= \^sig_init_reg2\;
\USE_SRL_FIFO.I_SYNC_FIFO\: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_datamover_v5_1_37_srl_fifo
     port map (
      FIFO_Full_reg_0 => FIFO_Full_reg,
      FIFO_Full_reg_1 => FIFO_Full_reg_0,
      SS(0) => SS(0),
      \USE_SRL_FIFO.sig_wr_fifo\ => \USE_SRL_FIFO.sig_wr_fifo\,
      \addr_i_reg[0]_0\ => \^sig_inhibit_rdy_n_reg_0\,
      \in\(35 downto 0) => \in\(35 downto 0),
      m_axi_mm2s_aclk => m_axi_mm2s_aclk,
      \out\(36 downto 0) => \out\(36 downto 0),
      \sig_addr_cntr_lsh_im0_reg[0]\ => \sig_addr_cntr_lsh_im0_reg[0]\,
      \sig_addr_cntr_lsh_im0_reg[0]_0\ => \sig_addr_cntr_lsh_im0_reg[0]_0\,
      sig_addr_reg_empty => sig_addr_reg_empty,
      sig_addr_reg_empty_reg => sig_addr_reg_empty_reg,
      sig_calc_error_reg_reg => sig_calc_error_reg_reg,
      sig_data2addr_stop_req => sig_data2addr_stop_req,
      sig_halt_reg_reg => sig_push_addr_reg1_out,
      sig_mmap_rst_reg_n => sig_mmap_rst_reg_n,
      sig_mstr2addr_cmd_valid => sig_mstr2addr_cmd_valid,
      sig_sf_allow_addr_req => sig_sf_allow_addr_req
    );
sig_inhibit_rdy_n_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => sig_init_done,
      I1 => \^sig_inhibit_rdy_n_reg_0\,
      O => sig_inhibit_rdy_n_i_1_n_0
    );
sig_inhibit_rdy_n_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => '1',
      D => sig_inhibit_rdy_n_i_1_n_0,
      Q => \^sig_inhibit_rdy_n_reg_0\,
      R => SS(0)
    );
\sig_init_done_i_1__1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2000"
    )
        port map (
      I0 => sig_mmap_rst_reg_n,
      I1 => sig_init_done,
      I2 => sig_init_reg,
      I3 => \^sig_init_reg2\,
      O => \sig_init_done_i_1__1_n_0\
    );
sig_init_done_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => '1',
      D => \sig_init_done_i_1__1_n_0\,
      Q => sig_init_done,
      R => '0'
    );
sig_init_reg2_reg: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => '1',
      D => sig_init_reg,
      Q => \^sig_init_reg2\,
      S => SS(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_datamover_fifo__parameterized2\ is
  port (
    FIFO_Full_reg : out STD_LOGIC;
    sig_init_done : out STD_LOGIC;
    sig_mmap_rst_reg_n_reg : out STD_LOGIC;
    sig_push_dqual_reg : out STD_LOGIC;
    sel : out STD_LOGIC;
    sig_inhibit_rdy_n_reg_0 : out STD_LOGIC;
    SR : out STD_LOGIC_VECTOR ( 0 to 0 );
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    D : out STD_LOGIC_VECTOR ( 7 downto 0 );
    \out\ : out STD_LOGIC_VECTOR ( 35 downto 0 );
    sig_mmap_rst_reg_n_reg_0 : out STD_LOGIC;
    sig_mmap_rst_reg_n_reg_1 : out STD_LOGIC;
    SS : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_mm2s_aclk : in STD_LOGIC;
    sig_init_done_reg_0 : in STD_LOGIC;
    sig_mmap_rst_reg_n : in STD_LOGIC;
    sig_first_dbeat : in STD_LOGIC;
    sig_first_dbeat_reg : in STD_LOGIC;
    \sig_dbeat_cntr_reg[0]\ : in STD_LOGIC;
    sig_mstr2data_cmd_valid : in STD_LOGIC;
    m_axi_mm2s_rlast : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 7 downto 0 );
    sig_last_dbeat_reg : in STD_LOGIC;
    \sig_dbeat_cntr_reg[6]\ : in STD_LOGIC;
    \sig_dbeat_cntr_reg[5]\ : in STD_LOGIC;
    sig_ld_new_cmd_reg : in STD_LOGIC;
    sig_dqual_reg_empty : in STD_LOGIC;
    sig_dqual_reg_empty_reg : in STD_LOGIC;
    sig_dqual_reg_empty_reg_0 : in STD_LOGIC;
    m_axi_mm2s_rvalid : in STD_LOGIC;
    full : in STD_LOGIC;
    sig_dqual_reg_empty_reg_1 : in STD_LOGIC;
    sig_last_dbeat_reg_0 : in STD_LOGIC;
    sig_next_sequential_reg : in STD_LOGIC;
    sig_dqual_reg_empty_reg_2 : in STD_LOGIC_VECTOR ( 2 downto 0 );
    sig_next_calc_error_reg : in STD_LOGIC;
    sig_rsc2stat_status_valid : in STD_LOGIC;
    sig_stat2rsc_status_ready : in STD_LOGIC;
    \in\ : in STD_LOGIC_VECTOR ( 37 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_datamover_fifo__parameterized2\ : entity is "axi_datamover_fifo";
end \decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_datamover_fifo__parameterized2\;

architecture STRUCTURE of \decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_datamover_fifo__parameterized2\ is
  signal sig_inhibit_rdy_n_i_1_n_0 : STD_LOGIC;
  signal \^sig_inhibit_rdy_n_reg_0\ : STD_LOGIC;
  signal \^sig_init_done\ : STD_LOGIC;
begin
  sig_inhibit_rdy_n_reg_0 <= \^sig_inhibit_rdy_n_reg_0\;
  sig_init_done <= \^sig_init_done\;
\USE_SRL_FIFO.I_SYNC_FIFO\: entity work.\decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_datamover_v5_1_37_srl_fifo__parameterized0\
     port map (
      D(7 downto 0) => D(7 downto 0),
      E(0) => E(0),
      FIFO_Full_reg_0 => FIFO_Full_reg,
      Q(7 downto 0) => Q(7 downto 0),
      SR(0) => SR(0),
      SS(0) => SS(0),
      \addr_i_reg[1]_0\ => \^sig_inhibit_rdy_n_reg_0\,
      full => full,
      \in\(37 downto 0) => \in\(37 downto 0),
      m_axi_mm2s_aclk => m_axi_mm2s_aclk,
      m_axi_mm2s_rlast => m_axi_mm2s_rlast,
      m_axi_mm2s_rvalid => m_axi_mm2s_rvalid,
      \out\(35 downto 0) => \out\(35 downto 0),
      sig_cmd2data_valid_reg => sel,
      \sig_dbeat_cntr_reg[0]\ => \sig_dbeat_cntr_reg[0]\,
      \sig_dbeat_cntr_reg[5]\ => \sig_dbeat_cntr_reg[5]\,
      \sig_dbeat_cntr_reg[6]\ => \sig_dbeat_cntr_reg[6]\,
      sig_dqual_reg_empty => sig_dqual_reg_empty,
      sig_dqual_reg_empty_reg => sig_push_dqual_reg,
      sig_dqual_reg_empty_reg_0 => sig_dqual_reg_empty_reg,
      sig_dqual_reg_empty_reg_1 => sig_dqual_reg_empty_reg_0,
      sig_dqual_reg_empty_reg_2 => sig_dqual_reg_empty_reg_1,
      sig_dqual_reg_empty_reg_3(2 downto 0) => sig_dqual_reg_empty_reg_2(2 downto 0),
      sig_first_dbeat => sig_first_dbeat,
      sig_first_dbeat_reg => sig_first_dbeat_reg,
      sig_last_dbeat_reg => sig_last_dbeat_reg,
      sig_last_dbeat_reg_0 => sig_last_dbeat_reg_0,
      sig_ld_new_cmd_reg => sig_ld_new_cmd_reg,
      sig_mmap_rst_reg_n => sig_mmap_rst_reg_n,
      sig_mmap_rst_reg_n_reg => sig_mmap_rst_reg_n_reg,
      sig_mmap_rst_reg_n_reg_0 => sig_mmap_rst_reg_n_reg_0,
      sig_mmap_rst_reg_n_reg_1 => sig_mmap_rst_reg_n_reg_1,
      sig_mstr2data_cmd_valid => sig_mstr2data_cmd_valid,
      sig_next_calc_error_reg => sig_next_calc_error_reg,
      sig_next_sequential_reg => sig_next_sequential_reg,
      sig_rsc2stat_status_valid => sig_rsc2stat_status_valid,
      sig_stat2rsc_status_ready => sig_stat2rsc_status_ready
    );
sig_inhibit_rdy_n_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \^sig_init_done\,
      I1 => \^sig_inhibit_rdy_n_reg_0\,
      O => sig_inhibit_rdy_n_i_1_n_0
    );
sig_inhibit_rdy_n_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => '1',
      D => sig_inhibit_rdy_n_i_1_n_0,
      Q => \^sig_inhibit_rdy_n_reg_0\,
      R => SS(0)
    );
sig_init_done_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => '1',
      D => sig_init_done_reg_0,
      Q => \^sig_init_done\,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_datamover_fifo__parameterized3\ is
  port (
    FIFO_Full_reg : out STD_LOGIC;
    sig_init_done : out STD_LOGIC;
    Q : out STD_LOGIC_VECTOR ( 0 to 0 );
    sig_inhibit_rdy_n_reg_0 : out STD_LOGIC;
    sig_inhibit_rdy_n_reg_1 : out STD_LOGIC;
    SS : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_mm2s_aclk : in STD_LOGIC;
    sig_init_done_reg_0 : in STD_LOGIC;
    \OMIT_UNPACKING.lsig_ld_cmd\ : in STD_LOGIC;
    sig_mstr2sf_cmd_valid : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_datamover_fifo__parameterized3\ : entity is "axi_datamover_fifo";
end \decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_datamover_fifo__parameterized3\;

architecture STRUCTURE of \decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_datamover_fifo__parameterized3\ is
  signal sig_inhibit_rdy_n_i_1_n_0 : STD_LOGIC;
  signal \^sig_inhibit_rdy_n_reg_1\ : STD_LOGIC;
  signal \^sig_init_done\ : STD_LOGIC;
begin
  sig_inhibit_rdy_n_reg_1 <= \^sig_inhibit_rdy_n_reg_1\;
  sig_init_done <= \^sig_init_done\;
\USE_SRL_FIFO.I_SYNC_FIFO\: entity work.\decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_datamover_v5_1_37_srl_fifo__parameterized1\
     port map (
      FIFO_Full_reg_0 => FIFO_Full_reg,
      \OMIT_UNPACKING.lsig_ld_cmd\ => \OMIT_UNPACKING.lsig_ld_cmd\,
      Q(0) => Q(0),
      SS(0) => SS(0),
      \addr_i_reg[0]_0\ => \^sig_inhibit_rdy_n_reg_1\,
      m_axi_mm2s_aclk => m_axi_mm2s_aclk,
      sig_inhibit_rdy_n_reg => sig_inhibit_rdy_n_reg_0,
      sig_mstr2sf_cmd_valid => sig_mstr2sf_cmd_valid
    );
sig_inhibit_rdy_n_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \^sig_init_done\,
      I1 => \^sig_inhibit_rdy_n_reg_1\,
      O => sig_inhibit_rdy_n_i_1_n_0
    );
sig_inhibit_rdy_n_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => '1',
      D => sig_inhibit_rdy_n_i_1_n_0,
      Q => \^sig_inhibit_rdy_n_reg_1\,
      R => SS(0)
    );
sig_init_done_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => '1',
      D => sig_init_done_reg_0,
      Q => \^sig_init_done\,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_dma_mm2s_mngr is
  port (
    mm2s_all_idle : out STD_LOGIC;
    mm2s_stop : out STD_LOGIC;
    s_axis_mm2s_cmd_tvalid_split : out STD_LOGIC;
    mm2s_sts_received : out STD_LOGIC;
    m_axis_mm2s_sts_tready : out STD_LOGIC;
    dma_mm2s_error : out STD_LOGIC;
    axi_dma_tstvec : out STD_LOGIC_VECTOR ( 0 to 0 );
    mm2s_halted_set_reg : out STD_LOGIC;
    \GNE_SYNC_RESET.scndry_resetn_reg\ : out STD_LOGIC;
    mm2s_interr_i_reg : out STD_LOGIC;
    mm2s_slverr_i_reg : out STD_LOGIC;
    mm2s_decerr_i_reg : out STD_LOGIC;
    D : out STD_LOGIC_VECTOR ( 47 downto 0 );
    halted1 : in STD_LOGIC;
    s_axi_lite_aclk : in STD_LOGIC;
    mm2s_decerr_i : in STD_LOGIC;
    mm2s_interr_i : in STD_LOGIC;
    mm2s_slverr_i : in STD_LOGIC;
    mm2s_dmacr : in STD_LOGIC_VECTOR ( 0 to 0 );
    mm2s_halted_set0 : in STD_LOGIC;
    \out\ : in STD_LOGIC;
    soft_reset : in STD_LOGIC;
    mm2s_dmasr : in STD_LOGIC_VECTOR ( 0 to 0 );
    mm2s_length_wren : in STD_LOGIC;
    idle_reg : in STD_LOGIC;
    m_axis_mm2s_sts_tvalid_int : in STD_LOGIC;
    s_axis_mm2s_cmd_tready : in STD_LOGIC;
    dma_interr_reg : in STD_LOGIC;
    dma_slverr_reg : in STD_LOGIC;
    dma_decerr_reg : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 31 downto 0 );
    \GEN_CMD_BTT_LESS_23.cmnd_data_reg[26]\ : in STD_LOGIC;
    \GEN_CMD_BTT_LESS_23.cmnd_data_reg[13]\ : in STD_LOGIC_VECTOR ( 13 downto 0 )
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_dma_mm2s_mngr;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_dma_mm2s_mngr is
  signal \GEN_MM2S_DMA_CONTROL.GEN_SIMPLE_DMA_MODE.I_MM2S_SMPL_SM_n_6\ : STD_LOGIC;
  signal \GEN_MM2S_DMA_CONTROL.GEN_SIMPLE_DMA_MODE.I_MM2S_SMPL_SM_n_7\ : STD_LOGIC;
  signal \GEN_MM2S_DMA_CONTROL.I_MM2S_CMDSTS_n_3\ : STD_LOGIC;
  signal \GEN_MM2S_DMA_CONTROL.I_MM2S_CMDSTS_n_6\ : STD_LOGIC;
  signal \GEN_MM2S_DMA_CONTROL.I_MM2S_CMDSTS_n_7\ : STD_LOGIC;
  signal cmnds_queued : STD_LOGIC;
  signal \^dma_mm2s_error\ : STD_LOGIC;
  signal \^mm2s_all_idle\ : STD_LOGIC;
  signal mm2s_cmnd_wr_1 : STD_LOGIC;
  signal mm2s_stop_i : STD_LOGIC;
  signal \^mm2s_sts_received\ : STD_LOGIC;
  signal mm2s_sts_received_clr : STD_LOGIC;
  signal \^s_axis_mm2s_cmd_tvalid_split\ : STD_LOGIC;
  signal smpl_cs : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal smpl_ns : STD_LOGIC_VECTOR ( 1 to 1 );
  signal write_cmnd_cmb : STD_LOGIC;
begin
  dma_mm2s_error <= \^dma_mm2s_error\;
  mm2s_all_idle <= \^mm2s_all_idle\;
  mm2s_sts_received <= \^mm2s_sts_received\;
  s_axis_mm2s_cmd_tvalid_split <= \^s_axis_mm2s_cmd_tvalid_split\;
\GEN_MM2S_DMA_CONTROL.GEN_SIMPLE_DMA_MODE.I_MM2S_SMPL_SM\: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_dma_smple_sm
     port map (
      D(1) => smpl_ns(1),
      D(0) => \GEN_MM2S_DMA_CONTROL.I_MM2S_CMDSTS_n_6\,
      \GEN_CMD_BTT_LESS_23.cmnd_data_reg[13]_0\(13 downto 0) => \GEN_CMD_BTT_LESS_23.cmnd_data_reg[13]\(13 downto 0),
      \GEN_CMD_BTT_LESS_23.cmnd_data_reg[26]_0\ => \GEN_CMD_BTT_LESS_23.cmnd_data_reg[26]\,
      \GEN_CMD_BTT_LESS_23.cmnd_data_reg[66]_0\(47 downto 0) => D(47 downto 0),
      \GEN_CMD_BTT_LESS_23.cmnd_data_reg[66]_1\ => \GEN_MM2S_DMA_CONTROL.I_MM2S_CMDSTS_n_7\,
      \GEN_CMD_BTT_LESS_23.cmnd_data_reg[66]_2\(31 downto 0) => Q(31 downto 0),
      \GEN_CMD_BTT_LESS_23.cmnd_wr_i_reg_0\ => \GEN_MM2S_DMA_CONTROL.GEN_SIMPLE_DMA_MODE.I_MM2S_SMPL_SM_n_7\,
      \GEN_NO_HOLD_DATA.s_axis_mm2s_cmd_tvalid_reg\ => \^s_axis_mm2s_cmd_tvalid_split\,
      Q(1 downto 0) => smpl_cs(1 downto 0),
      cmnds_queued => cmnds_queued,
      cmnds_queued_reg_0 => \GEN_MM2S_DMA_CONTROL.I_MM2S_CMDSTS_n_3\,
      halted1 => halted1,
      m_axis_mm2s_sts_tvalid_int => m_axis_mm2s_sts_tvalid_int,
      mm2s_all_idle => \^mm2s_all_idle\,
      mm2s_cmnd_wr_1 => mm2s_cmnd_wr_1,
      mm2s_dmacr(0) => mm2s_dmacr(0),
      mm2s_length_wren => mm2s_length_wren,
      mm2s_stop_i => mm2s_stop_i,
      mm2s_sts_received_clr => mm2s_sts_received_clr,
      \out\ => \out\,
      s_axi_lite_aclk => s_axi_lite_aclk,
      s_axis_mm2s_cmd_tready => s_axis_mm2s_cmd_tready,
      soft_reset => soft_reset,
      sts_received_clr_reg_0 => \GEN_MM2S_DMA_CONTROL.GEN_SIMPLE_DMA_MODE.I_MM2S_SMPL_SM_n_6\,
      sts_received_clr_reg_1 => \^dma_mm2s_error\,
      sts_received_i_reg => \^mm2s_sts_received\,
      write_cmnd_cmb => write_cmnd_cmb
    );
\GEN_MM2S_DMA_CONTROL.I_MM2S_CMDSTS\: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_dma_mm2s_cmdsts_if
     port map (
      D(1) => smpl_ns(1),
      D(0) => \GEN_MM2S_DMA_CONTROL.I_MM2S_CMDSTS_n_6\,
      \GEN_NO_HOLD_DATA.s_axis_mm2s_cmd_tvalid_reg_0\ => \^s_axis_mm2s_cmd_tvalid_split\,
      \GEN_NO_HOLD_DATA.s_axis_mm2s_cmd_tvalid_reg_1\ => \GEN_MM2S_DMA_CONTROL.GEN_SIMPLE_DMA_MODE.I_MM2S_SMPL_SM_n_7\,
      \GNE_SYNC_RESET.scndry_resetn_reg\ => \GEN_MM2S_DMA_CONTROL.I_MM2S_CMDSTS_n_3\,
      Q(1 downto 0) => smpl_cs(1 downto 0),
      cmnds_queued => cmnds_queued,
      dma_decerr_reg => dma_decerr_reg,
      dma_interr_reg => dma_interr_reg,
      dma_slverr_reg => dma_slverr_reg,
      \dmacr_i_reg[2]\ => \GEN_MM2S_DMA_CONTROL.I_MM2S_CMDSTS_n_7\,
      halted1 => halted1,
      m_axis_mm2s_sts_tready => m_axis_mm2s_sts_tready,
      m_axis_mm2s_sts_tvalid_int => m_axis_mm2s_sts_tvalid_int,
      mm2s_cmnd_wr_1 => mm2s_cmnd_wr_1,
      mm2s_decerr_i => mm2s_decerr_i,
      mm2s_decerr_i_reg_0 => mm2s_decerr_i_reg,
      mm2s_error_reg_0 => \^dma_mm2s_error\,
      mm2s_interr_i => mm2s_interr_i,
      mm2s_interr_i_reg_0 => mm2s_interr_i_reg,
      mm2s_slverr_i => mm2s_slverr_i,
      mm2s_slverr_i_reg_0 => mm2s_slverr_i_reg,
      mm2s_stop_i => mm2s_stop_i,
      \out\ => \out\,
      s_axi_lite_aclk => s_axi_lite_aclk,
      soft_reset => soft_reset,
      sts_received_i_reg_0 => \^mm2s_sts_received\,
      sts_received_i_reg_1 => \GEN_MM2S_DMA_CONTROL.GEN_SIMPLE_DMA_MODE.I_MM2S_SMPL_SM_n_6\,
      write_cmnd_cmb => write_cmnd_cmb
    );
\GEN_MM2S_DMA_CONTROL.I_MM2S_STS_MNGR\: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_dma_mm2s_sts_mngr
     port map (
      \GNE_SYNC_RESET.scndry_resetn_reg\ => \GNE_SYNC_RESET.scndry_resetn_reg\,
      axi_dma_tstvec(0) => axi_dma_tstvec(0),
      dma_mm2s_error => \^dma_mm2s_error\,
      halted1 => halted1,
      idle_reg => idle_reg,
      mm2s_all_idle => \^mm2s_all_idle\,
      mm2s_dmacr(0) => mm2s_dmacr(0),
      mm2s_dmasr(0) => mm2s_dmasr(0),
      mm2s_halted_set0 => mm2s_halted_set0,
      mm2s_halted_set_reg_0 => mm2s_halted_set_reg,
      mm2s_sts_received_clr => mm2s_sts_received_clr,
      \out\ => \out\,
      s_axi_lite_aclk => s_axi_lite_aclk,
      soft_reset => soft_reset
    );
\GEN_MM2S_DMA_CONTROL.mm2s_stop_reg\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_lite_aclk,
      CE => '1',
      D => mm2s_stop_i,
      Q => mm2s_stop,
      R => halted1
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_dma_reg_module is
  port (
    s_axi_lite_wready : out STD_LOGIC;
    rdy : out STD_LOGIC;
    s_axi_lite_arready : out STD_LOGIC;
    dma_interr_reg : out STD_LOGIC;
    dma_slverr_reg : out STD_LOGIC;
    dma_decerr_reg : out STD_LOGIC;
    mm2s_length_wren : out STD_LOGIC;
    s_axi_lite_bvalid : out STD_LOGIC;
    \GEN_SYNC_READ.s_axi_lite_rvalid_i_reg\ : out STD_LOGIC;
    \dmacr_i_reg[0]\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    mm2s_dmasr : out STD_LOGIC_VECTOR ( 0 to 0 );
    idle_reg : out STD_LOGIC;
    mm2s_introut : out STD_LOGIC;
    soft_reset : out STD_LOGIC;
    soft_reset_re0 : out STD_LOGIC;
    mm2s_halted_set0 : out STD_LOGIC;
    Q : out STD_LOGIC_VECTOR ( 31 downto 0 );
    \GEN_REG_FOR_SMPL.buffer_length_i_reg[13]\ : out STD_LOGIC_VECTOR ( 13 downto 0 );
    \dmacr_i_reg[3]\ : out STD_LOGIC;
    s_axi_lite_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_lite_aclk : in STD_LOGIC;
    SR : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_lite_awvalid : in STD_LOGIC;
    s_axi_lite_wvalid : in STD_LOGIC;
    s_axi_lite_arvalid : in STD_LOGIC;
    \dmacr_i_reg[4]\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    dma_interr_reg_0 : in STD_LOGIC;
    dma_slverr_reg_0 : in STD_LOGIC;
    dma_decerr_reg_0 : in STD_LOGIC;
    \GEN_SYNC_WRITE.axi2ip_wrce_reg[10]\ : in STD_LOGIC;
    halted_reg : in STD_LOGIC;
    idle_reg_0 : in STD_LOGIC;
    \out\ : in STD_LOGIC;
    s_axi_lite_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    mm2s_stop : in STD_LOGIC;
    soft_reset_d1 : in STD_LOGIC;
    mm2s_halt_cmplt : in STD_LOGIC;
    dma_mm2s_error : in STD_LOGIC;
    mm2s_all_idle : in STD_LOGIC;
    \GEN_SYNC_WRITE.rdy_reg\ : in STD_LOGIC;
    s_axi_lite_bready : in STD_LOGIC;
    s_axi_lite_rready : in STD_LOGIC;
    s_axi_lite_awaddr : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_lite_araddr : in STD_LOGIC_VECTOR ( 9 downto 0 );
    soft_reset_clr : in STD_LOGIC;
    axi_dma_tstvec : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_dma_reg_module;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_dma_reg_module is
  signal \GEN_AXI_LITE_IF.AXI_LITE_IF_I_n_11\ : STD_LOGIC;
  signal \GEN_AXI_LITE_IF.AXI_LITE_IF_I_n_12\ : STD_LOGIC;
  signal \GEN_AXI_LITE_IF.AXI_LITE_IF_I_n_13\ : STD_LOGIC;
  signal \GEN_AXI_LITE_IF.AXI_LITE_IF_I_n_14\ : STD_LOGIC;
  signal \GEN_AXI_LITE_IF.AXI_LITE_IF_I_n_15\ : STD_LOGIC;
  signal \GEN_AXI_LITE_IF.AXI_LITE_IF_I_n_16\ : STD_LOGIC;
  signal \GEN_MM2S_REGISTERS.I_MM2S_DMA_REGISTER_n_11\ : STD_LOGIC;
  signal \GEN_MM2S_REGISTERS.I_MM2S_DMA_REGISTER_n_12\ : STD_LOGIC;
  signal \GEN_MM2S_REGISTERS.I_MM2S_DMA_REGISTER_n_86\ : STD_LOGIC;
  signal \^gen_reg_for_smpl.buffer_length_i_reg[13]\ : STD_LOGIC_VECTOR ( 13 downto 0 );
  signal \^q\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi2ip_wrce : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal buffer_length_wren0 : STD_LOGIC;
  signal \^dma_interr_reg\ : STD_LOGIC;
  signal \^dma_slverr_reg\ : STD_LOGIC;
  signal \^dmacr_i_reg[0]\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \^idle_reg\ : STD_LOGIC;
  signal ip2axi_rddata1_out : STD_LOGIC_VECTOR ( 31 downto 2 );
  signal \^mm2s_dmasr\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal p_0_in : STD_LOGIC_VECTOR ( 7 to 7 );
  signal p_0_in1_in : STD_LOGIC;
  signal p_1_in : STD_LOGIC;
  signal strm_valid_int2 : STD_LOGIC;
  attribute async_reg : string;
  attribute async_reg of strm_valid_int2 : signal is "true";
  signal strm_valid_int_cdc_to : STD_LOGIC;
  attribute async_reg of strm_valid_int_cdc_to : signal is "true";
begin
  \GEN_REG_FOR_SMPL.buffer_length_i_reg[13]\(13 downto 0) <= \^gen_reg_for_smpl.buffer_length_i_reg[13]\(13 downto 0);
  Q(31 downto 0) <= \^q\(31 downto 0);
  dma_interr_reg <= \^dma_interr_reg\;
  dma_slverr_reg <= \^dma_slverr_reg\;
  \dmacr_i_reg[0]\(0) <= \^dmacr_i_reg[0]\(0);
  idle_reg <= \^idle_reg\;
  mm2s_dmasr(0) <= \^mm2s_dmasr\(0);
\GEN_AXI_LITE_IF.AXI_LITE_IF_I\: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_dma_lite_if
     port map (
      D(25 downto 10) => ip2axi_rddata1_out(31 downto 16),
      D(9 downto 8) => ip2axi_rddata1_out(14 downto 13),
      D(7 downto 2) => ip2axi_rddata1_out(11 downto 6),
      D(1 downto 0) => ip2axi_rddata1_out(3 downto 2),
      E(0) => p_1_in,
      \GEN_SYNC_READ.axi2ip_rdaddr_reg[7]_0\ => \GEN_AXI_LITE_IF.AXI_LITE_IF_I_n_12\,
      \GEN_SYNC_READ.axi2ip_rdaddr_reg[9]_0\ => \GEN_AXI_LITE_IF.AXI_LITE_IF_I_n_11\,
      \GEN_SYNC_READ.axi2ip_rdaddr_reg[9]_1\ => \GEN_AXI_LITE_IF.AXI_LITE_IF_I_n_13\,
      \GEN_SYNC_READ.axi2ip_rdaddr_reg[9]_2\ => \GEN_AXI_LITE_IF.AXI_LITE_IF_I_n_14\,
      \GEN_SYNC_READ.axi2ip_rdaddr_reg[9]_3\ => \GEN_AXI_LITE_IF.AXI_LITE_IF_I_n_15\,
      \GEN_SYNC_READ.axi2ip_rdaddr_reg[9]_4\ => \GEN_AXI_LITE_IF.AXI_LITE_IF_I_n_16\,
      \GEN_SYNC_READ.s_axi_lite_rdata_reg[0]_0\ => \^dmacr_i_reg[0]\(0),
      \GEN_SYNC_READ.s_axi_lite_rdata_reg[12]_0\(4) => \^gen_reg_for_smpl.buffer_length_i_reg[13]\(12),
      \GEN_SYNC_READ.s_axi_lite_rdata_reg[12]_0\(3 downto 2) => \^gen_reg_for_smpl.buffer_length_i_reg[13]\(5 downto 4),
      \GEN_SYNC_READ.s_axi_lite_rdata_reg[12]_0\(1 downto 0) => \^gen_reg_for_smpl.buffer_length_i_reg[13]\(1 downto 0),
      \GEN_SYNC_READ.s_axi_lite_rdata_reg[12]_1\(0) => \GEN_MM2S_REGISTERS.I_MM2S_DMA_REGISTER_n_12\,
      \GEN_SYNC_READ.s_axi_lite_rdata_reg[12]_2\ => \GEN_MM2S_REGISTERS.I_MM2S_DMA_REGISTER_n_11\,
      \GEN_SYNC_READ.s_axi_lite_rdata_reg[1]_0\ => \^idle_reg\,
      \GEN_SYNC_READ.s_axi_lite_rdata_reg[4]_0\(0) => \GEN_MM2S_REGISTERS.I_MM2S_DMA_REGISTER_n_86\,
      \GEN_SYNC_READ.s_axi_lite_rdata_reg[4]_1\ => \^dma_interr_reg\,
      \GEN_SYNC_READ.s_axi_lite_rdata_reg[5]_0\ => \^dma_slverr_reg\,
      \GEN_SYNC_READ.s_axi_lite_rvalid_i_reg_0\ => \GEN_SYNC_READ.s_axi_lite_rvalid_i_reg\,
      \GEN_SYNC_WRITE.axi2ip_wrce_reg[10]_0\ => \GEN_SYNC_WRITE.axi2ip_wrce_reg[10]\,
      \GEN_SYNC_WRITE.rdy_reg_0\ => \GEN_SYNC_WRITE.rdy_reg\,
      Q(5) => \^q\(15),
      Q(4) => \^q\(12),
      Q(3 downto 2) => \^q\(5 downto 4),
      Q(1 downto 0) => \^q\(1 downto 0),
      SR(0) => SR(0),
      SS(0) => p_0_in(7),
      axi2ip_wrce(1) => axi2ip_wrce(10),
      axi2ip_wrce(0) => axi2ip_wrce(0),
      buffer_length_wren0 => buffer_length_wren0,
      mm2s_dmasr(0) => \^mm2s_dmasr\(0),
      \out\ => \out\,
      p_0_in1_in => p_0_in1_in,
      rdy => rdy,
      s_axi_lite_aclk => s_axi_lite_aclk,
      s_axi_lite_araddr(9 downto 0) => s_axi_lite_araddr(9 downto 0),
      s_axi_lite_arready => s_axi_lite_arready,
      s_axi_lite_arvalid => s_axi_lite_arvalid,
      s_axi_lite_awaddr(3 downto 0) => s_axi_lite_awaddr(3 downto 0),
      s_axi_lite_awvalid => s_axi_lite_awvalid,
      s_axi_lite_bready => s_axi_lite_bready,
      s_axi_lite_bvalid => s_axi_lite_bvalid,
      s_axi_lite_rdata(31 downto 0) => s_axi_lite_rdata(31 downto 0),
      s_axi_lite_rready => s_axi_lite_rready,
      s_axi_lite_wdata(21 downto 14) => s_axi_lite_wdata(23 downto 16),
      s_axi_lite_wdata(13 downto 0) => s_axi_lite_wdata(13 downto 0),
      s_axi_lite_wready => s_axi_lite_wready,
      s_axi_lite_wvalid => s_axi_lite_wvalid
    );
\GEN_MM2S_REGISTERS.I_MM2S_DMA_REGISTER\: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_dma_register
     port map (
      D(25 downto 10) => ip2axi_rddata1_out(31 downto 16),
      D(9 downto 8) => ip2axi_rddata1_out(14 downto 13),
      D(7 downto 2) => ip2axi_rddata1_out(11 downto 6),
      D(1 downto 0) => ip2axi_rddata1_out(3 downto 2),
      E(0) => p_1_in,
      \GEN_REG_FOR_SMPL.buffer_address_i_reg[31]_0\(31 downto 0) => \^q\(31 downto 0),
      \GEN_REG_FOR_SMPL.buffer_length_i_reg[13]_0\(13 downto 0) => \^gen_reg_for_smpl.buffer_length_i_reg[13]\(13 downto 0),
      \GEN_SYNC_READ.s_axi_lite_rdata_reg[2]\ => \GEN_AXI_LITE_IF.AXI_LITE_IF_I_n_12\,
      \GEN_SYNC_READ.s_axi_lite_rdata_reg[2]_0\ => \GEN_AXI_LITE_IF.AXI_LITE_IF_I_n_11\,
      \GEN_SYNC_READ.s_axi_lite_rdata_reg[2]_1\ => \GEN_AXI_LITE_IF.AXI_LITE_IF_I_n_13\,
      \GEN_SYNC_READ.s_axi_lite_rdata_reg[6]\ => \GEN_AXI_LITE_IF.AXI_LITE_IF_I_n_16\,
      \GEN_SYNC_READ.s_axi_lite_rdata_reg[7]\ => \GEN_AXI_LITE_IF.AXI_LITE_IF_I_n_14\,
      \GEN_SYNC_READ.s_axi_lite_rdata_reg[7]_0\ => \GEN_AXI_LITE_IF.AXI_LITE_IF_I_n_15\,
      Q(0) => \GEN_MM2S_REGISTERS.I_MM2S_DMA_REGISTER_n_12\,
      SS(0) => p_0_in(7),
      axi2ip_wrce(1) => axi2ip_wrce(10),
      axi2ip_wrce(0) => axi2ip_wrce(0),
      axi_dma_tstvec(0) => axi_dma_tstvec(0),
      buffer_length_wren0 => buffer_length_wren0,
      dma_decerr_reg_0 => dma_decerr_reg,
      dma_decerr_reg_1 => dma_decerr_reg_0,
      dma_interr_reg_0 => \^dma_interr_reg\,
      dma_interr_reg_1 => dma_interr_reg_0,
      dma_mm2s_error => dma_mm2s_error,
      dma_slverr_reg_0 => \^dma_slverr_reg\,
      dma_slverr_reg_1 => dma_slverr_reg_0,
      \dmacr_i_reg[0]_0\ => \^dmacr_i_reg[0]\(0),
      \dmacr_i_reg[2]_0\ => soft_reset,
      \dmacr_i_reg[3]_0\ => \dmacr_i_reg[3]\,
      \dmacr_i_reg[4]_0\(0) => \GEN_MM2S_REGISTERS.I_MM2S_DMA_REGISTER_n_86\,
      \dmacr_i_reg[4]_1\(0) => \dmacr_i_reg[4]\(0),
      halted_reg_0 => halted_reg,
      idle_reg_0 => \^idle_reg\,
      idle_reg_1 => idle_reg_0,
      ioc_irq_reg_0 => \GEN_MM2S_REGISTERS.I_MM2S_DMA_REGISTER_n_11\,
      mm2s_all_idle => mm2s_all_idle,
      mm2s_dmasr(0) => \^mm2s_dmasr\(0),
      mm2s_halt_cmplt => mm2s_halt_cmplt,
      mm2s_halted_set0 => mm2s_halted_set0,
      mm2s_introut => mm2s_introut,
      mm2s_length_wren => mm2s_length_wren,
      mm2s_stop => mm2s_stop,
      \out\ => \out\,
      p_0_in1_in => p_0_in1_in,
      s_axi_lite_aclk => s_axi_lite_aclk,
      s_axi_lite_wdata(31 downto 0) => s_axi_lite_wdata(31 downto 0),
      soft_reset_clr => soft_reset_clr,
      soft_reset_d1 => soft_reset_d1,
      soft_reset_re0 => soft_reset_re0
    );
i_0: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => strm_valid_int2
    );
i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => strm_valid_int_cdc_to
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_dma_rst_module is
  port (
    \out\ : out STD_LOGIC;
    \GNE_SYNC_RESET.prmry_resetn_reg\ : out STD_LOGIC;
    \GNE_SYNC_RESET.s_soft_reset_i_reg\ : out STD_LOGIC;
    mm2s_prmry_reset_out_n : out STD_LOGIC;
    mm2s_cntrl_reset_out_n : out STD_LOGIC;
    \syncstages_ff_reg[3]\ : out STD_LOGIC;
    soft_reset_d1 : out STD_LOGIC;
    soft_reset_clr : out STD_LOGIC;
    \GNE_SYNC_RESET.scndry_resetn_reg\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    SR : out STD_LOGIC_VECTOR ( 0 to 0 );
    \s_axi_lite_awaddr[6]\ : out STD_LOGIC;
    \GNE_SYNC_RESET.halt_i_reg\ : out STD_LOGIC;
    axi_resetn : in STD_LOGIC;
    s_axi_lite_aclk : in STD_LOGIC;
    mm2s_all_idle : in STD_LOGIC;
    soft_reset : in STD_LOGIC;
    soft_reset_re0 : in STD_LOGIC;
    mm2s_halt_cmplt : in STD_LOGIC;
    mm2s_stop : in STD_LOGIC;
    s_axi_lite_awaddr : in STD_LOGIC_VECTOR ( 0 to 0 );
    rdy : in STD_LOGIC;
    sig_rst2all_stop_request : in STD_LOGIC
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_dma_rst_module;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_dma_rst_module is
  signal \GEN_RESET_FOR_MM2S.RESET_I_n_8\ : STD_LOGIC;
  signal m_axi_sg_hrdresetn : STD_LOGIC;
  attribute RTL_KEEP : string;
  attribute RTL_KEEP of m_axi_sg_hrdresetn : signal is "true";
  attribute equivalent_register_removal : string;
  attribute equivalent_register_removal of m_axi_sg_hrdresetn : signal is "no";
  signal \^soft_reset_clr\ : STD_LOGIC;
  signal \^syncstages_ff_reg[3]\ : STD_LOGIC;
  attribute RTL_KEEP of \syncstages_ff_reg[3]\ : signal is "true";
  attribute equivalent_register_removal of \syncstages_ff_reg[3]\ : signal is "no";
  attribute DEF_VAL : string;
  attribute DEF_VAL of REG_HRD_RST : label is "1'b0";
  attribute DEST_SYNC_FF : integer;
  attribute DEST_SYNC_FF of REG_HRD_RST : label is 4;
  attribute INIT : string;
  attribute INIT of REG_HRD_RST : label is "0";
  attribute INIT_SYNC_FF : integer;
  attribute INIT_SYNC_FF of REG_HRD_RST : label is 0;
  attribute SIM_ASSERT_CHK : integer;
  attribute SIM_ASSERT_CHK of REG_HRD_RST : label is 0;
  attribute VERSION : integer;
  attribute VERSION of REG_HRD_RST : label is 0;
  attribute XPM_CDC : string;
  attribute XPM_CDC of REG_HRD_RST : label is "SYNC_RST";
  attribute XPM_MODULE : string;
  attribute XPM_MODULE of REG_HRD_RST : label is "TRUE";
  attribute DEF_VAL of REG_HRD_RST_OUT : label is "1'b0";
  attribute DEST_SYNC_FF of REG_HRD_RST_OUT : label is 4;
  attribute INIT of REG_HRD_RST_OUT : label is "0";
  attribute INIT_SYNC_FF of REG_HRD_RST_OUT : label is 0;
  attribute SIM_ASSERT_CHK of REG_HRD_RST_OUT : label is 0;
  attribute VERSION of REG_HRD_RST_OUT : label is 0;
  attribute XPM_CDC of REG_HRD_RST_OUT : label is "SYNC_RST";
  attribute XPM_MODULE of REG_HRD_RST_OUT : label is "TRUE";
begin
  soft_reset_clr <= \^soft_reset_clr\;
  \syncstages_ff_reg[3]\ <= \^syncstages_ff_reg[3]\;
\GEN_RESET_FOR_MM2S.RESET_I\: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_dma_reset
     port map (
      \GNE_SYNC_RESET.halt_i_reg_0\ => \GNE_SYNC_RESET.halt_i_reg\,
      \GNE_SYNC_RESET.min_assert_sftrst_reg_0\ => \GEN_RESET_FOR_MM2S.RESET_I_n_8\,
      \GNE_SYNC_RESET.prmry_resetn_reg_0\ => \GNE_SYNC_RESET.prmry_resetn_reg\,
      \GNE_SYNC_RESET.s_soft_reset_i_reg_0\ => \GNE_SYNC_RESET.s_soft_reset_i_reg\,
      \GNE_SYNC_RESET.scndry_resetn_reg_0\(0) => \GNE_SYNC_RESET.scndry_resetn_reg\(0),
      dest_rst => m_axi_sg_hrdresetn,
      mm2s_all_idle => mm2s_all_idle,
      mm2s_cntrl_reset_out_n => mm2s_cntrl_reset_out_n,
      mm2s_halt_cmplt => mm2s_halt_cmplt,
      mm2s_prmry_reset_out_n => mm2s_prmry_reset_out_n,
      mm2s_stop => mm2s_stop,
      \out\ => \out\,
      s_axi_lite_aclk => s_axi_lite_aclk,
      sig_rst2all_stop_request => sig_rst2all_stop_request,
      soft_reset => soft_reset,
      soft_reset_clr => \^soft_reset_clr\,
      soft_reset_d1 => soft_reset_d1,
      soft_reset_re0 => soft_reset_re0
    );
\GEN_RESET_FOR_MM2S.mm2s_soft_reset_done_reg\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_lite_aclk,
      CE => '1',
      D => \GEN_RESET_FOR_MM2S.RESET_I_n_8\,
      Q => \^soft_reset_clr\,
      R => '0'
    );
\GEN_SYNC_WRITE.axi2ip_wrce[10]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"BF"
    )
        port map (
      I0 => s_axi_lite_awaddr(0),
      I1 => \^syncstages_ff_reg[3]\,
      I2 => rdy,
      O => \s_axi_lite_awaddr[6]\
    );
REG_HRD_RST: entity work.\decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_cdc_sync_rst__1\
     port map (
      dest_clk => s_axi_lite_aclk,
      dest_rst => m_axi_sg_hrdresetn,
      src_rst => axi_resetn
    );
REG_HRD_RST_OUT: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_cdc_sync_rst
     port map (
      dest_clk => s_axi_lite_aclk,
      dest_rst => \^syncstages_ff_reg[3]\,
      src_rst => axi_resetn
    );
arready_i_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^syncstages_ff_reg[3]\,
      O => SR(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_base is
  port (
    sleep : in STD_LOGIC;
    rst : in STD_LOGIC;
    wr_clk : in STD_LOGIC;
    wr_en : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 146 downto 0 );
    full : out STD_LOGIC;
    full_n : out STD_LOGIC;
    prog_full : out STD_LOGIC;
    wr_data_count : out STD_LOGIC_VECTOR ( 7 downto 0 );
    overflow : out STD_LOGIC;
    wr_rst_busy : out STD_LOGIC;
    almost_full : out STD_LOGIC;
    wr_ack : out STD_LOGIC;
    rd_clk : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    dout : out STD_LOGIC_VECTOR ( 146 downto 0 );
    empty : out STD_LOGIC;
    prog_empty : out STD_LOGIC;
    rd_data_count : out STD_LOGIC_VECTOR ( 7 downto 0 );
    underflow : out STD_LOGIC;
    rd_rst_busy : out STD_LOGIC;
    almost_empty : out STD_LOGIC;
    data_valid : out STD_LOGIC;
    injectsbiterr : in STD_LOGIC;
    injectdbiterr : in STD_LOGIC;
    sbiterr : out STD_LOGIC;
    dbiterr : out STD_LOGIC
  );
  attribute CASCADE_HEIGHT : integer;
  attribute CASCADE_HEIGHT of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_base : entity is 0;
  attribute CDC_DEST_SYNC_FF : integer;
  attribute CDC_DEST_SYNC_FF of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_base : entity is 2;
  attribute COMMON_CLOCK : integer;
  attribute COMMON_CLOCK of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_base : entity is 1;
  attribute DOUT_RESET_VALUE : string;
  attribute DOUT_RESET_VALUE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_base : entity is "0";
  attribute ECC_MODE : integer;
  attribute ECC_MODE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_base : entity is 0;
  attribute ENABLE_ECC : integer;
  attribute ENABLE_ECC of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_base : entity is 0;
  attribute EN_ADV_FEATURE : string;
  attribute EN_ADV_FEATURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_base : entity is "16'b0001111100011111";
  attribute EN_AE : string;
  attribute EN_AE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_base : entity is "1'b1";
  attribute EN_AF : string;
  attribute EN_AF of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_base : entity is "1'b1";
  attribute EN_DVLD : string;
  attribute EN_DVLD of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_base : entity is "1'b1";
  attribute EN_OF : string;
  attribute EN_OF of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_base : entity is "1'b1";
  attribute EN_PE : string;
  attribute EN_PE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_base : entity is "1'b1";
  attribute EN_PF : string;
  attribute EN_PF of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_base : entity is "1'b1";
  attribute EN_RDC : string;
  attribute EN_RDC of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_base : entity is "1'b1";
  attribute EN_SIM_ASSERT_ERR : string;
  attribute EN_SIM_ASSERT_ERR of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_base : entity is "warning";
  attribute EN_UF : string;
  attribute EN_UF of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_base : entity is "1'b1";
  attribute EN_WACK : string;
  attribute EN_WACK of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_base : entity is "1'b1";
  attribute EN_WDC : string;
  attribute EN_WDC of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_base : entity is "1'b1";
  attribute FG_EQ_ASYM_DOUT : string;
  attribute FG_EQ_ASYM_DOUT of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_base : entity is "1'b0";
  attribute FIFO_MEMORY_TYPE : integer;
  attribute FIFO_MEMORY_TYPE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_base : entity is 2;
  attribute FIFO_MEM_TYPE : integer;
  attribute FIFO_MEM_TYPE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_base : entity is 2;
  attribute FIFO_READ_DEPTH : integer;
  attribute FIFO_READ_DEPTH of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_base : entity is 128;
  attribute FIFO_READ_LATENCY : integer;
  attribute FIFO_READ_LATENCY of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_base : entity is 0;
  attribute FIFO_SIZE : integer;
  attribute FIFO_SIZE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_base : entity is 18816;
  attribute FIFO_WRITE_DEPTH : integer;
  attribute FIFO_WRITE_DEPTH of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_base : entity is 128;
  attribute FULL_RESET_VALUE : integer;
  attribute FULL_RESET_VALUE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_base : entity is 1;
  attribute FULL_RST_VAL : string;
  attribute FULL_RST_VAL of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_base : entity is "1'b1";
  attribute PE_THRESH_ADJ : integer;
  attribute PE_THRESH_ADJ of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_base : entity is 8;
  attribute PE_THRESH_MAX : integer;
  attribute PE_THRESH_MAX of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_base : entity is 123;
  attribute PE_THRESH_MIN : integer;
  attribute PE_THRESH_MIN of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_base : entity is 5;
  attribute PF_THRESH_ADJ : integer;
  attribute PF_THRESH_ADJ of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_base : entity is 8;
  attribute PF_THRESH_MAX : integer;
  attribute PF_THRESH_MAX of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_base : entity is 123;
  attribute PF_THRESH_MIN : integer;
  attribute PF_THRESH_MIN of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_base : entity is 5;
  attribute PROG_EMPTY_THRESH : integer;
  attribute PROG_EMPTY_THRESH of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_base : entity is 10;
  attribute PROG_FULL_THRESH : integer;
  attribute PROG_FULL_THRESH of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_base : entity is 10;
  attribute RD_DATA_COUNT_WIDTH : integer;
  attribute RD_DATA_COUNT_WIDTH of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_base : entity is 8;
  attribute RD_DC_WIDTH_EXT : integer;
  attribute RD_DC_WIDTH_EXT of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_base : entity is 8;
  attribute RD_LATENCY : integer;
  attribute RD_LATENCY of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_base : entity is 2;
  attribute RD_MODE : integer;
  attribute RD_MODE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_base : entity is 1;
  attribute RD_PNTR_WIDTH : integer;
  attribute RD_PNTR_WIDTH of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_base : entity is 7;
  attribute READ_DATA_WIDTH : integer;
  attribute READ_DATA_WIDTH of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_base : entity is 147;
  attribute READ_MODE : integer;
  attribute READ_MODE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_base : entity is 1;
  attribute READ_MODE_LL : integer;
  attribute READ_MODE_LL of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_base : entity is 1;
  attribute RELATED_CLOCKS : integer;
  attribute RELATED_CLOCKS of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_base : entity is 0;
  attribute REMOVE_WR_RD_PROT_LOGIC : integer;
  attribute REMOVE_WR_RD_PROT_LOGIC of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_base : entity is 0;
  attribute SIM_ASSERT_CHK : integer;
  attribute SIM_ASSERT_CHK of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_base : entity is 0;
  attribute USE_ADV_FEATURES : string;
  attribute USE_ADV_FEATURES of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_base : entity is "1F1F";
  attribute VERSION : integer;
  attribute VERSION of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_base : entity is 0;
  attribute WAKEUP_TIME : integer;
  attribute WAKEUP_TIME of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_base : entity is 0;
  attribute WIDTH_RATIO : integer;
  attribute WIDTH_RATIO of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_base : entity is 1;
  attribute WRITE_DATA_WIDTH : integer;
  attribute WRITE_DATA_WIDTH of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_base : entity is 147;
  attribute WR_DATA_COUNT_WIDTH : integer;
  attribute WR_DATA_COUNT_WIDTH of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_base : entity is 8;
  attribute WR_DC_WIDTH_EXT : integer;
  attribute WR_DC_WIDTH_EXT of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_base : entity is 8;
  attribute WR_DEPTH_LOG : integer;
  attribute WR_DEPTH_LOG of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_base : entity is 7;
  attribute WR_PNTR_WIDTH : integer;
  attribute WR_PNTR_WIDTH of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_base : entity is 7;
  attribute WR_RD_RATIO : integer;
  attribute WR_RD_RATIO of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_base : entity is 0;
  attribute WR_WIDTH_LOG : integer;
  attribute WR_WIDTH_LOG of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_base : entity is 8;
  attribute XPM_MODULE : string;
  attribute XPM_MODULE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_base : entity is "TRUE";
  attribute both_stages_valid : integer;
  attribute both_stages_valid of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_base : entity is 3;
  attribute invalid : integer;
  attribute invalid of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_base : entity is 0;
  attribute keep_hierarchy : string;
  attribute keep_hierarchy of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_base : entity is "soft";
  attribute stage1_valid : integer;
  attribute stage1_valid of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_base : entity is 2;
  attribute stage2_valid : integer;
  attribute stage2_valid of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_base : entity is 1;
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_base;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_base is
  signal clr_full : STD_LOGIC;
  signal count_value_i : STD_LOGIC_VECTOR ( 1 to 1 );
  signal curr_fwft_state : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal data_valid_fwft1 : STD_LOGIC;
  signal \^empty\ : STD_LOGIC;
  signal \^full\ : STD_LOGIC;
  signal \gen_fwft.count_rst\ : STD_LOGIC;
  signal \gen_fwft.ram_regout_en\ : STD_LOGIC;
  signal \gen_fwft.rdpp1_inst_n_1\ : STD_LOGIC;
  signal \gen_fwft.rdpp1_inst_n_2\ : STD_LOGIC;
  signal \gen_fwft.rdpp1_inst_n_3\ : STD_LOGIC;
  signal \grdc.diff_wr_rd_pntr_rdc\ : STD_LOGIC_VECTOR ( 7 downto 2 );
  signal leaving_empty0 : STD_LOGIC;
  signal \next_fwft_state__0\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal ram_empty_i : STD_LOGIC;
  signal ram_empty_i0 : STD_LOGIC;
  signal ram_wr_en_pf : STD_LOGIC;
  signal rd_pntr_ext : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal rdp_inst_n_0 : STD_LOGIC;
  signal rdp_inst_n_10 : STD_LOGIC;
  signal rdp_inst_n_11 : STD_LOGIC;
  signal rdp_inst_n_12 : STD_LOGIC;
  signal rdp_inst_n_13 : STD_LOGIC;
  signal rdp_inst_n_15 : STD_LOGIC;
  signal rdp_inst_n_8 : STD_LOGIC;
  signal rdp_inst_n_9 : STD_LOGIC;
  signal rdpp1_inst_n_0 : STD_LOGIC;
  signal rdpp1_inst_n_1 : STD_LOGIC;
  signal rdpp1_inst_n_2 : STD_LOGIC;
  signal rdpp1_inst_n_3 : STD_LOGIC;
  signal rdpp1_inst_n_4 : STD_LOGIC;
  signal rdpp1_inst_n_5 : STD_LOGIC;
  signal rdpp1_inst_n_6 : STD_LOGIC;
  signal rst_d1 : STD_LOGIC;
  signal wr_pntr_ext : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal wrp_inst_n_1 : STD_LOGIC;
  signal wrpp1_inst_n_0 : STD_LOGIC;
  signal wrpp1_inst_n_1 : STD_LOGIC;
  signal wrpp1_inst_n_2 : STD_LOGIC;
  signal wrpp1_inst_n_3 : STD_LOGIC;
  signal wrpp1_inst_n_4 : STD_LOGIC;
  signal wrpp1_inst_n_5 : STD_LOGIC;
  signal wrpp1_inst_n_6 : STD_LOGIC;
  signal xpm_fifo_rst_inst_n_1 : STD_LOGIC;
  signal \NLW_gen_sdpram.xpm_memory_base_inst_dbiterra_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_sdpram.xpm_memory_base_inst_dbiterrb_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_sdpram.xpm_memory_base_inst_sbiterra_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_sdpram.xpm_memory_base_inst_sbiterrb_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_sdpram.xpm_memory_base_inst_douta_UNCONNECTED\ : STD_LOGIC_VECTOR ( 146 downto 0 );
  signal \NLW_gen_sdpram.xpm_memory_base_inst_doutb_UNCONNECTED\ : STD_LOGIC_VECTOR ( 146 to 146 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \FSM_sequential_gen_fwft.curr_fwft_state[0]_i_1\ : label is "soft_lutpair30";
  attribute SOFT_HLUTNM of \FSM_sequential_gen_fwft.curr_fwft_state[1]_i_1\ : label is "soft_lutpair30";
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \FSM_sequential_gen_fwft.curr_fwft_state_reg[0]\ : label is "invalid:00,stage1_valid:01,both_stages_valid:10,stage2_valid:11";
  attribute FSM_ENCODED_STATES of \FSM_sequential_gen_fwft.curr_fwft_state_reg[1]\ : label is "invalid:00,stage1_valid:01,both_stages_valid:10,stage2_valid:11";
  attribute SOFT_HLUTNM of \gen_fwft.empty_fwft_i_i_1\ : label is "soft_lutpair29";
  attribute ADDR_WIDTH_A : integer;
  attribute ADDR_WIDTH_A of \gen_sdpram.xpm_memory_base_inst\ : label is 7;
  attribute ADDR_WIDTH_B : integer;
  attribute ADDR_WIDTH_B of \gen_sdpram.xpm_memory_base_inst\ : label is 7;
  attribute AUTO_SLEEP_TIME : integer;
  attribute AUTO_SLEEP_TIME of \gen_sdpram.xpm_memory_base_inst\ : label is 0;
  attribute BYTE_WRITE_WIDTH_A : integer;
  attribute BYTE_WRITE_WIDTH_A of \gen_sdpram.xpm_memory_base_inst\ : label is 147;
  attribute BYTE_WRITE_WIDTH_B : integer;
  attribute BYTE_WRITE_WIDTH_B of \gen_sdpram.xpm_memory_base_inst\ : label is 147;
  attribute CASCADE_HEIGHT of \gen_sdpram.xpm_memory_base_inst\ : label is 0;
  attribute CLOCKING_MODE : integer;
  attribute CLOCKING_MODE of \gen_sdpram.xpm_memory_base_inst\ : label is 0;
  attribute ECC_BIT_RANGE : string;
  attribute ECC_BIT_RANGE of \gen_sdpram.xpm_memory_base_inst\ : label is "[7:0]";
  attribute ECC_MODE of \gen_sdpram.xpm_memory_base_inst\ : label is 0;
  attribute ECC_TYPE : string;
  attribute ECC_TYPE of \gen_sdpram.xpm_memory_base_inst\ : label is "NONE";
  attribute IGNORE_INIT_SYNTH : integer;
  attribute IGNORE_INIT_SYNTH of \gen_sdpram.xpm_memory_base_inst\ : label is 0;
  attribute KEEP_HIERARCHY of \gen_sdpram.xpm_memory_base_inst\ : label is "SOFT";
  attribute MAX_NUM_CHAR : integer;
  attribute MAX_NUM_CHAR of \gen_sdpram.xpm_memory_base_inst\ : label is 0;
  attribute \MEM.ADDRESS_SPACE\ : boolean;
  attribute \MEM.ADDRESS_SPACE\ of \gen_sdpram.xpm_memory_base_inst\ : label is std.standard.true;
  attribute \MEM.ADDRESS_SPACE_BEGIN\ : integer;
  attribute \MEM.ADDRESS_SPACE_BEGIN\ of \gen_sdpram.xpm_memory_base_inst\ : label is 0;
  attribute \MEM.ADDRESS_SPACE_DATA_LSB\ : integer;
  attribute \MEM.ADDRESS_SPACE_DATA_LSB\ of \gen_sdpram.xpm_memory_base_inst\ : label is 0;
  attribute \MEM.ADDRESS_SPACE_DATA_MSB\ : integer;
  attribute \MEM.ADDRESS_SPACE_DATA_MSB\ of \gen_sdpram.xpm_memory_base_inst\ : label is 145;
  attribute \MEM.ADDRESS_SPACE_END\ : integer;
  attribute \MEM.ADDRESS_SPACE_END\ of \gen_sdpram.xpm_memory_base_inst\ : label is 511;
  attribute \MEM.CORE_MEMORY_WIDTH\ : integer;
  attribute \MEM.CORE_MEMORY_WIDTH\ of \gen_sdpram.xpm_memory_base_inst\ : label is 146;
  attribute MEMORY_INIT_FILE : string;
  attribute MEMORY_INIT_FILE of \gen_sdpram.xpm_memory_base_inst\ : label is "none";
  attribute MEMORY_INIT_PARAM : string;
  attribute MEMORY_INIT_PARAM of \gen_sdpram.xpm_memory_base_inst\ : label is "";
  attribute MEMORY_OPTIMIZATION : string;
  attribute MEMORY_OPTIMIZATION of \gen_sdpram.xpm_memory_base_inst\ : label is "true";
  attribute MEMORY_PRIMITIVE : integer;
  attribute MEMORY_PRIMITIVE of \gen_sdpram.xpm_memory_base_inst\ : label is 2;
  attribute MEMORY_SIZE : integer;
  attribute MEMORY_SIZE of \gen_sdpram.xpm_memory_base_inst\ : label is 18816;
  attribute MEMORY_TYPE : integer;
  attribute MEMORY_TYPE of \gen_sdpram.xpm_memory_base_inst\ : label is 1;
  attribute MESSAGE_CONTROL : integer;
  attribute MESSAGE_CONTROL of \gen_sdpram.xpm_memory_base_inst\ : label is 0;
  attribute NUM_CHAR_LOC : integer;
  attribute NUM_CHAR_LOC of \gen_sdpram.xpm_memory_base_inst\ : label is 0;
  attribute P_ECC_MODE : string;
  attribute P_ECC_MODE of \gen_sdpram.xpm_memory_base_inst\ : label is "no_ecc";
  attribute P_ENABLE_BYTE_WRITE_A : integer;
  attribute P_ENABLE_BYTE_WRITE_A of \gen_sdpram.xpm_memory_base_inst\ : label is 0;
  attribute P_ENABLE_BYTE_WRITE_B : integer;
  attribute P_ENABLE_BYTE_WRITE_B of \gen_sdpram.xpm_memory_base_inst\ : label is 0;
  attribute P_MAX_DEPTH_DATA : integer;
  attribute P_MAX_DEPTH_DATA of \gen_sdpram.xpm_memory_base_inst\ : label is 128;
  attribute P_MEMORY_OPT : string;
  attribute P_MEMORY_OPT of \gen_sdpram.xpm_memory_base_inst\ : label is "yes";
  attribute P_MEMORY_PRIMITIVE : string;
  attribute P_MEMORY_PRIMITIVE of \gen_sdpram.xpm_memory_base_inst\ : label is "block";
  attribute P_MIN_WIDTH_DATA : integer;
  attribute P_MIN_WIDTH_DATA of \gen_sdpram.xpm_memory_base_inst\ : label is 147;
  attribute P_MIN_WIDTH_DATA_A : integer;
  attribute P_MIN_WIDTH_DATA_A of \gen_sdpram.xpm_memory_base_inst\ : label is 147;
  attribute P_MIN_WIDTH_DATA_B : integer;
  attribute P_MIN_WIDTH_DATA_B of \gen_sdpram.xpm_memory_base_inst\ : label is 147;
  attribute P_MIN_WIDTH_DATA_ECC : integer;
  attribute P_MIN_WIDTH_DATA_ECC of \gen_sdpram.xpm_memory_base_inst\ : label is 147;
  attribute P_MIN_WIDTH_DATA_LDW : integer;
  attribute P_MIN_WIDTH_DATA_LDW of \gen_sdpram.xpm_memory_base_inst\ : label is 4;
  attribute P_MIN_WIDTH_DATA_SHFT : integer;
  attribute P_MIN_WIDTH_DATA_SHFT of \gen_sdpram.xpm_memory_base_inst\ : label is 147;
  attribute P_NUM_COLS_WRITE_A : integer;
  attribute P_NUM_COLS_WRITE_A of \gen_sdpram.xpm_memory_base_inst\ : label is 1;
  attribute P_NUM_COLS_WRITE_B : integer;
  attribute P_NUM_COLS_WRITE_B of \gen_sdpram.xpm_memory_base_inst\ : label is 1;
  attribute P_NUM_COL_READ_A : integer;
  attribute P_NUM_COL_READ_A of \gen_sdpram.xpm_memory_base_inst\ : label is 1;
  attribute P_NUM_COL_READ_B : integer;
  attribute P_NUM_COL_READ_B of \gen_sdpram.xpm_memory_base_inst\ : label is 1;
  attribute P_NUM_COL_WRITE_A : integer;
  attribute P_NUM_COL_WRITE_A of \gen_sdpram.xpm_memory_base_inst\ : label is 1;
  attribute P_NUM_COL_WRITE_B : integer;
  attribute P_NUM_COL_WRITE_B of \gen_sdpram.xpm_memory_base_inst\ : label is 1;
  attribute P_NUM_ROWS_READ_A : integer;
  attribute P_NUM_ROWS_READ_A of \gen_sdpram.xpm_memory_base_inst\ : label is 1;
  attribute P_NUM_ROWS_READ_B : integer;
  attribute P_NUM_ROWS_READ_B of \gen_sdpram.xpm_memory_base_inst\ : label is 1;
  attribute P_NUM_ROWS_WRITE_A : integer;
  attribute P_NUM_ROWS_WRITE_A of \gen_sdpram.xpm_memory_base_inst\ : label is 1;
  attribute P_NUM_ROWS_WRITE_B : integer;
  attribute P_NUM_ROWS_WRITE_B of \gen_sdpram.xpm_memory_base_inst\ : label is 1;
  attribute P_SDP_WRITE_MODE : string;
  attribute P_SDP_WRITE_MODE of \gen_sdpram.xpm_memory_base_inst\ : label is "no";
  attribute P_WIDTH_ADDR_LSB_READ_A : integer;
  attribute P_WIDTH_ADDR_LSB_READ_A of \gen_sdpram.xpm_memory_base_inst\ : label is 0;
  attribute P_WIDTH_ADDR_LSB_READ_B : integer;
  attribute P_WIDTH_ADDR_LSB_READ_B of \gen_sdpram.xpm_memory_base_inst\ : label is 0;
  attribute P_WIDTH_ADDR_LSB_READ_COLL_A : integer;
  attribute P_WIDTH_ADDR_LSB_READ_COLL_A of \gen_sdpram.xpm_memory_base_inst\ : label is 1;
  attribute P_WIDTH_ADDR_LSB_READ_COLL_B : integer;
  attribute P_WIDTH_ADDR_LSB_READ_COLL_B of \gen_sdpram.xpm_memory_base_inst\ : label is 1;
  attribute P_WIDTH_ADDR_LSB_WRITE_A : integer;
  attribute P_WIDTH_ADDR_LSB_WRITE_A of \gen_sdpram.xpm_memory_base_inst\ : label is 0;
  attribute P_WIDTH_ADDR_LSB_WRITE_B : integer;
  attribute P_WIDTH_ADDR_LSB_WRITE_B of \gen_sdpram.xpm_memory_base_inst\ : label is 0;
  attribute P_WIDTH_ADDR_LSB_WRITE_COLL_A : integer;
  attribute P_WIDTH_ADDR_LSB_WRITE_COLL_A of \gen_sdpram.xpm_memory_base_inst\ : label is 1;
  attribute P_WIDTH_ADDR_LSB_WRITE_COLL_B : integer;
  attribute P_WIDTH_ADDR_LSB_WRITE_COLL_B of \gen_sdpram.xpm_memory_base_inst\ : label is 1;
  attribute P_WIDTH_ADDR_READ_A : integer;
  attribute P_WIDTH_ADDR_READ_A of \gen_sdpram.xpm_memory_base_inst\ : label is 7;
  attribute P_WIDTH_ADDR_READ_B : integer;
  attribute P_WIDTH_ADDR_READ_B of \gen_sdpram.xpm_memory_base_inst\ : label is 7;
  attribute P_WIDTH_ADDR_WRITE_A : integer;
  attribute P_WIDTH_ADDR_WRITE_A of \gen_sdpram.xpm_memory_base_inst\ : label is 7;
  attribute P_WIDTH_ADDR_WRITE_B : integer;
  attribute P_WIDTH_ADDR_WRITE_B of \gen_sdpram.xpm_memory_base_inst\ : label is 7;
  attribute P_WIDTH_COL_WRITE_A : integer;
  attribute P_WIDTH_COL_WRITE_A of \gen_sdpram.xpm_memory_base_inst\ : label is 147;
  attribute P_WIDTH_COL_WRITE_B : integer;
  attribute P_WIDTH_COL_WRITE_B of \gen_sdpram.xpm_memory_base_inst\ : label is 147;
  attribute RAM_DECOMP : string;
  attribute RAM_DECOMP of \gen_sdpram.xpm_memory_base_inst\ : label is "auto";
  attribute READ_DATA_WIDTH_A : integer;
  attribute READ_DATA_WIDTH_A of \gen_sdpram.xpm_memory_base_inst\ : label is 147;
  attribute READ_DATA_WIDTH_B : integer;
  attribute READ_DATA_WIDTH_B of \gen_sdpram.xpm_memory_base_inst\ : label is 147;
  attribute READ_LATENCY_A : integer;
  attribute READ_LATENCY_A of \gen_sdpram.xpm_memory_base_inst\ : label is 2;
  attribute READ_LATENCY_B : integer;
  attribute READ_LATENCY_B of \gen_sdpram.xpm_memory_base_inst\ : label is 2;
  attribute READ_RESET_VALUE_A : string;
  attribute READ_RESET_VALUE_A of \gen_sdpram.xpm_memory_base_inst\ : label is "0";
  attribute READ_RESET_VALUE_B : string;
  attribute READ_RESET_VALUE_B of \gen_sdpram.xpm_memory_base_inst\ : label is "0";
  attribute RST_MODE_A : string;
  attribute RST_MODE_A of \gen_sdpram.xpm_memory_base_inst\ : label is "SYNC";
  attribute RST_MODE_B : string;
  attribute RST_MODE_B of \gen_sdpram.xpm_memory_base_inst\ : label is "SYNC";
  attribute SIM_ASSERT_CHK of \gen_sdpram.xpm_memory_base_inst\ : label is 0;
  attribute USE_EMBEDDED_CONSTRAINT : integer;
  attribute USE_EMBEDDED_CONSTRAINT of \gen_sdpram.xpm_memory_base_inst\ : label is 0;
  attribute USE_MEM_INIT : integer;
  attribute USE_MEM_INIT of \gen_sdpram.xpm_memory_base_inst\ : label is 0;
  attribute USE_MEM_INIT_MMI : integer;
  attribute USE_MEM_INIT_MMI of \gen_sdpram.xpm_memory_base_inst\ : label is 0;
  attribute VERSION of \gen_sdpram.xpm_memory_base_inst\ : label is 0;
  attribute WAKEUP_TIME of \gen_sdpram.xpm_memory_base_inst\ : label is 0;
  attribute WRITE_DATA_WIDTH_A : integer;
  attribute WRITE_DATA_WIDTH_A of \gen_sdpram.xpm_memory_base_inst\ : label is 147;
  attribute WRITE_DATA_WIDTH_B : integer;
  attribute WRITE_DATA_WIDTH_B of \gen_sdpram.xpm_memory_base_inst\ : label is 147;
  attribute WRITE_MODE_A : integer;
  attribute WRITE_MODE_A of \gen_sdpram.xpm_memory_base_inst\ : label is 2;
  attribute WRITE_MODE_B : integer;
  attribute WRITE_MODE_B of \gen_sdpram.xpm_memory_base_inst\ : label is 2;
  attribute WRITE_PROTECT : integer;
  attribute WRITE_PROTECT of \gen_sdpram.xpm_memory_base_inst\ : label is 1;
  attribute XPM_MODULE of \gen_sdpram.xpm_memory_base_inst\ : label is "TRUE";
  attribute rsta_loop_iter : integer;
  attribute rsta_loop_iter of \gen_sdpram.xpm_memory_base_inst\ : label is 148;
  attribute rstb_loop_iter : integer;
  attribute rstb_loop_iter of \gen_sdpram.xpm_memory_base_inst\ : label is 148;
  attribute SOFT_HLUTNM of \gen_sdpram.xpm_memory_base_inst_i_3\ : label is "soft_lutpair29";
begin
  empty <= \^empty\;
  full <= \^full\;
\FSM_sequential_gen_fwft.curr_fwft_state[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6A85"
    )
        port map (
      I0 => curr_fwft_state(0),
      I1 => rd_en,
      I2 => curr_fwft_state(1),
      I3 => ram_empty_i,
      O => \next_fwft_state__0\(0)
    );
\FSM_sequential_gen_fwft.curr_fwft_state[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"7C"
    )
        port map (
      I0 => rd_en,
      I1 => curr_fwft_state(1),
      I2 => curr_fwft_state(0),
      O => \next_fwft_state__0\(1)
    );
\FSM_sequential_gen_fwft.curr_fwft_state_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => '1',
      D => \next_fwft_state__0\(0),
      Q => curr_fwft_state(0),
      R => xpm_fifo_rst_inst_n_1
    );
\FSM_sequential_gen_fwft.curr_fwft_state_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => '1',
      D => \next_fwft_state__0\(1),
      Q => curr_fwft_state(1),
      R => xpm_fifo_rst_inst_n_1
    );
\gen_fwft.empty_fwft_i_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F380"
    )
        port map (
      I0 => rd_en,
      I1 => curr_fwft_state(0),
      I2 => curr_fwft_state(1),
      I3 => \^empty\,
      O => data_valid_fwft1
    );
\gen_fwft.empty_fwft_i_reg\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => wr_clk,
      CE => '1',
      D => data_valid_fwft1,
      Q => \^empty\,
      S => xpm_fifo_rst_inst_n_1
    );
\gen_fwft.rdpp1_inst\: entity work.\decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_counter_updn__parameterized1\
     port map (
      DI(0) => \gen_fwft.rdpp1_inst_n_3\,
      Q(0) => count_value_i(1),
      S(1) => \gen_fwft.rdpp1_inst_n_1\,
      S(0) => \gen_fwft.rdpp1_inst_n_2\,
      SR(0) => \gen_fwft.count_rst\,
      \count_value_i_reg[0]_0\(1 downto 0) => curr_fwft_state(1 downto 0),
      \gwdc.wr_data_count_i_reg[7]\(1 downto 0) => rd_pntr_ext(1 downto 0),
      \gwdc.wr_data_count_i_reg[7]_0\(1 downto 0) => wr_pntr_ext(1 downto 0),
      ram_empty_i => ram_empty_i,
      rd_en => rd_en,
      wr_clk => wr_clk
    );
\gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_reg\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => wr_clk,
      CE => '1',
      D => rdp_inst_n_15,
      Q => \^full\,
      S => xpm_fifo_rst_inst_n_1
    );
\gen_pntr_flags_cc.ram_empty_i_reg\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => wr_clk,
      CE => '1',
      D => ram_empty_i0,
      Q => ram_empty_i,
      S => xpm_fifo_rst_inst_n_1
    );
\gen_sdpram.xpm_memory_base_inst\: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base
     port map (
      addra(6 downto 0) => wr_pntr_ext(6 downto 0),
      addrb(6 downto 0) => rd_pntr_ext(6 downto 0),
      clka => wr_clk,
      clkb => '0',
      dbiterra => \NLW_gen_sdpram.xpm_memory_base_inst_dbiterra_UNCONNECTED\,
      dbiterrb => \NLW_gen_sdpram.xpm_memory_base_inst_dbiterrb_UNCONNECTED\,
      dina(146) => '0',
      dina(145 downto 0) => din(145 downto 0),
      dinb(146 downto 0) => B"000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
      douta(146 downto 0) => \NLW_gen_sdpram.xpm_memory_base_inst_douta_UNCONNECTED\(146 downto 0),
      doutb(146) => \NLW_gen_sdpram.xpm_memory_base_inst_doutb_UNCONNECTED\(146),
      doutb(145 downto 0) => dout(145 downto 0),
      ena => '0',
      enb => rdp_inst_n_13,
      injectdbiterra => '0',
      injectdbiterrb => '0',
      injectsbiterra => '0',
      injectsbiterrb => '0',
      regcea => '0',
      regceb => \gen_fwft.ram_regout_en\,
      rsta => '0',
      rstb => xpm_fifo_rst_inst_n_1,
      sbiterra => \NLW_gen_sdpram.xpm_memory_base_inst_sbiterra_UNCONNECTED\,
      sbiterrb => \NLW_gen_sdpram.xpm_memory_base_inst_sbiterrb_UNCONNECTED\,
      sleep => sleep,
      wea(0) => ram_wr_en_pf,
      web(0) => '0'
    );
\gen_sdpram.xpm_memory_base_inst_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"62"
    )
        port map (
      I0 => curr_fwft_state(0),
      I1 => curr_fwft_state(1),
      I2 => rd_en,
      O => \gen_fwft.ram_regout_en\
    );
\gwdc.wr_data_count_i_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => wr_clk,
      CE => '1',
      D => \grdc.diff_wr_rd_pntr_rdc\(2),
      Q => wr_data_count(2),
      R => xpm_fifo_rst_inst_n_1
    );
\gwdc.wr_data_count_i_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => wr_clk,
      CE => '1',
      D => \grdc.diff_wr_rd_pntr_rdc\(3),
      Q => wr_data_count(3),
      R => xpm_fifo_rst_inst_n_1
    );
\gwdc.wr_data_count_i_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => wr_clk,
      CE => '1',
      D => \grdc.diff_wr_rd_pntr_rdc\(4),
      Q => wr_data_count(4),
      R => xpm_fifo_rst_inst_n_1
    );
\gwdc.wr_data_count_i_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => wr_clk,
      CE => '1',
      D => \grdc.diff_wr_rd_pntr_rdc\(5),
      Q => wr_data_count(5),
      R => xpm_fifo_rst_inst_n_1
    );
\gwdc.wr_data_count_i_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => wr_clk,
      CE => '1',
      D => \grdc.diff_wr_rd_pntr_rdc\(6),
      Q => wr_data_count(6),
      R => xpm_fifo_rst_inst_n_1
    );
\gwdc.wr_data_count_i_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => wr_clk,
      CE => '1',
      D => \grdc.diff_wr_rd_pntr_rdc\(7),
      Q => wr_data_count(7),
      R => xpm_fifo_rst_inst_n_1
    );
rdp_inst: entity work.\decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_counter_updn__parameterized2\
     port map (
      DI(0) => rdp_inst_n_0,
      \FSM_sequential_gen_fwft.curr_fwft_state_reg[1]\ => rdp_inst_n_13,
      Q(6 downto 0) => rd_pntr_ext(6 downto 0),
      S(4) => rdp_inst_n_8,
      S(3) => rdp_inst_n_9,
      S(2) => rdp_inst_n_10,
      S(1) => rdp_inst_n_11,
      S(0) => rdp_inst_n_12,
      clr_full => clr_full,
      \count_value_i_reg[0]_0\(1 downto 0) => curr_fwft_state(1 downto 0),
      \count_value_i_reg[0]_1\(0) => xpm_fifo_rst_inst_n_1,
      \gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_reg\ => rdp_inst_n_15,
      \gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_reg_0\(6) => wrpp1_inst_n_0,
      \gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_reg_0\(5) => wrpp1_inst_n_1,
      \gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_reg_0\(4) => wrpp1_inst_n_2,
      \gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_reg_0\(3) => wrpp1_inst_n_3,
      \gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_reg_0\(2) => wrpp1_inst_n_4,
      \gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_reg_0\(1) => wrpp1_inst_n_5,
      \gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_reg_0\(0) => wrpp1_inst_n_6,
      \gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_reg_1\ => \^full\,
      \gwdc.wr_data_count_i_reg[7]\(0) => count_value_i(1),
      \gwdc.wr_data_count_i_reg[7]_0\(7) => wrp_inst_n_1,
      \gwdc.wr_data_count_i_reg[7]_0\(6 downto 0) => wr_pntr_ext(6 downto 0),
      leaving_empty0 => leaving_empty0,
      ram_empty_i => ram_empty_i,
      ram_wr_en_pf => ram_wr_en_pf,
      rd_en => rd_en,
      wr_clk => wr_clk
    );
rdpp1_inst: entity work.\decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_counter_updn__parameterized3\
     port map (
      E(0) => rdp_inst_n_13,
      Q(6) => rdpp1_inst_n_0,
      Q(5) => rdpp1_inst_n_1,
      Q(4) => rdpp1_inst_n_2,
      Q(3) => rdpp1_inst_n_3,
      Q(2) => rdpp1_inst_n_4,
      Q(1) => rdpp1_inst_n_5,
      Q(0) => rdpp1_inst_n_6,
      \count_value_i_reg[0]_0\(0) => xpm_fifo_rst_inst_n_1,
      \count_value_i_reg[1]_0\(1 downto 0) => curr_fwft_state(1 downto 0),
      ram_empty_i => ram_empty_i,
      rd_en => rd_en,
      wr_clk => wr_clk
    );
rst_d1_inst: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_reg_bit
     port map (
      Q(0) => xpm_fifo_rst_inst_n_1,
      clr_full => clr_full,
      rst => rst,
      rst_d1 => rst_d1,
      wr_clk => wr_clk
    );
wrp_inst: entity work.\decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_counter_updn__parameterized2_0\
     port map (
      D(5 downto 0) => \grdc.diff_wr_rd_pntr_rdc\(7 downto 2),
      DI(1) => rdp_inst_n_0,
      DI(0) => \gen_fwft.rdpp1_inst_n_3\,
      Q(7) => wrp_inst_n_1,
      Q(6 downto 0) => wr_pntr_ext(6 downto 0),
      S(6) => rdp_inst_n_8,
      S(5) => rdp_inst_n_9,
      S(4) => rdp_inst_n_10,
      S(3) => rdp_inst_n_11,
      S(2) => rdp_inst_n_12,
      S(1) => \gen_fwft.rdpp1_inst_n_1\,
      S(0) => \gen_fwft.rdpp1_inst_n_2\,
      \count_value_i_reg[5]_0\ => \^full\,
      \count_value_i_reg[7]_0\(0) => xpm_fifo_rst_inst_n_1,
      \gen_pntr_flags_cc.ram_empty_i_reg\ => rdp_inst_n_13,
      \gen_pntr_flags_cc.ram_empty_i_reg_0\(6) => rdpp1_inst_n_0,
      \gen_pntr_flags_cc.ram_empty_i_reg_0\(5) => rdpp1_inst_n_1,
      \gen_pntr_flags_cc.ram_empty_i_reg_0\(4) => rdpp1_inst_n_2,
      \gen_pntr_flags_cc.ram_empty_i_reg_0\(3) => rdpp1_inst_n_3,
      \gen_pntr_flags_cc.ram_empty_i_reg_0\(2) => rdpp1_inst_n_4,
      \gen_pntr_flags_cc.ram_empty_i_reg_0\(1) => rdpp1_inst_n_5,
      \gen_pntr_flags_cc.ram_empty_i_reg_0\(0) => rdpp1_inst_n_6,
      \gwdc.wr_data_count_i_reg[7]\(0) => count_value_i(1),
      \gwdc.wr_data_count_i_reg[7]_0\(4 downto 0) => rd_pntr_ext(5 downto 1),
      leaving_empty0 => leaving_empty0,
      ram_empty_i => ram_empty_i,
      ram_empty_i0 => ram_empty_i0,
      ram_wr_en_pf => ram_wr_en_pf,
      rst_d1 => rst_d1,
      wr_clk => wr_clk,
      wr_en => wr_en
    );
wrpp1_inst: entity work.\decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_counter_updn__parameterized3_1\
     port map (
      E(0) => ram_wr_en_pf,
      Q(6) => wrpp1_inst_n_0,
      Q(5) => wrpp1_inst_n_1,
      Q(4) => wrpp1_inst_n_2,
      Q(3) => wrpp1_inst_n_3,
      Q(2) => wrpp1_inst_n_4,
      Q(1) => wrpp1_inst_n_5,
      Q(0) => wrpp1_inst_n_6,
      \count_value_i_reg[0]_0\(0) => xpm_fifo_rst_inst_n_1,
      \count_value_i_reg[5]_0\ => \^full\,
      rst_d1 => rst_d1,
      wr_clk => wr_clk,
      wr_en => wr_en
    );
xpm_fifo_rst_inst: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_rst
     port map (
      E(0) => ram_wr_en_pf,
      Q(0) => xpm_fifo_rst_inst_n_1,
      SR(0) => \gen_fwft.count_rst\,
      \count_value_i_reg[1]\(1 downto 0) => curr_fwft_state(1 downto 0),
      \count_value_i_reg[6]\ => \^full\,
      ram_empty_i => ram_empty_i,
      rst => rst,
      rst_d1 => rst_d1,
      wr_clk => wr_clk,
      wr_en => wr_en
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_datamover_addr_cntl is
  port (
    \out\ : out STD_LOGIC;
    sig_posted_to_axi_reg_0 : out STD_LOGIC;
    FIFO_Full_reg : out STD_LOGIC;
    sig_init_reg2 : out STD_LOGIC;
    sig_addr_reg_empty : out STD_LOGIC;
    sig_addr2rsc_calc_error : out STD_LOGIC;
    m_axi_mm2s_arsize : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_mm2s_arburst : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_mm2s_arvalid : out STD_LOGIC;
    FIFO_Full_reg_0 : out STD_LOGIC;
    sig_inhibit_rdy_n : out STD_LOGIC;
    m_axi_mm2s_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_mm2s_arlen : out STD_LOGIC_VECTOR ( 1 downto 0 );
    SS : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_mm2s_aclk : in STD_LOGIC;
    sig_init_reg : in STD_LOGIC;
    \sig_addr_cntr_lsh_im0_reg[0]\ : in STD_LOGIC;
    \sig_addr_cntr_lsh_im0_reg[0]_0\ : in STD_LOGIC;
    \USE_SRL_FIFO.sig_wr_fifo\ : in STD_LOGIC;
    sig_mstr2addr_cmd_valid : in STD_LOGIC;
    sig_mmap_rst_reg_n : in STD_LOGIC;
    sig_sf_allow_addr_req : in STD_LOGIC;
    sig_data2addr_stop_req : in STD_LOGIC;
    m_axi_mm2s_arready : in STD_LOGIC;
    \in\ : in STD_LOGIC_VECTOR ( 35 downto 0 )
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_datamover_addr_cntl;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_datamover_addr_cntl is
  signal \GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO_n_5\ : STD_LOGIC;
  signal \GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO_n_6\ : STD_LOGIC;
  signal \^sig_addr2rsc_calc_error\ : STD_LOGIC;
  signal \^sig_addr_reg_empty\ : STD_LOGIC;
  signal sig_addr_reg_full : STD_LOGIC;
  signal sig_aq_fifo_data_out : STD_LOGIC_VECTOR ( 50 downto 4 );
  signal sig_next_addr_reg0 : STD_LOGIC;
  signal sig_posted_to_axi : STD_LOGIC;
  attribute RTL_KEEP : string;
  attribute RTL_KEEP of sig_posted_to_axi : signal is "true";
  attribute equivalent_register_removal : string;
  attribute equivalent_register_removal of sig_posted_to_axi : signal is "no";
  signal sig_posted_to_axi_2 : STD_LOGIC;
  attribute RTL_KEEP of sig_posted_to_axi_2 : signal is "true";
  attribute equivalent_register_removal of sig_posted_to_axi_2 : signal is "no";
  signal sig_push_addr_reg1_out : STD_LOGIC;
  attribute KEEP : string;
  attribute KEEP of sig_posted_to_axi_2_reg : label is "yes";
  attribute equivalent_register_removal of sig_posted_to_axi_2_reg : label is "no";
  attribute KEEP of sig_posted_to_axi_reg : label is "yes";
  attribute equivalent_register_removal of sig_posted_to_axi_reg : label is "no";
begin
  \out\ <= sig_posted_to_axi_2;
  sig_addr2rsc_calc_error <= \^sig_addr2rsc_calc_error\;
  sig_addr_reg_empty <= \^sig_addr_reg_empty\;
  sig_posted_to_axi_reg_0 <= sig_posted_to_axi;
\GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO\: entity work.\decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_datamover_fifo__parameterized1\
     port map (
      FIFO_Full_reg => FIFO_Full_reg,
      FIFO_Full_reg_0 => FIFO_Full_reg_0,
      SS(0) => SS(0),
      \USE_SRL_FIFO.sig_wr_fifo\ => \USE_SRL_FIFO.sig_wr_fifo\,
      \in\(35 downto 0) => \in\(35 downto 0),
      m_axi_mm2s_aclk => m_axi_mm2s_aclk,
      \out\(36) => sig_aq_fifo_data_out(50),
      \out\(35 downto 34) => sig_aq_fifo_data_out(47 downto 46),
      \out\(33 downto 0) => sig_aq_fifo_data_out(37 downto 4),
      \sig_addr_cntr_lsh_im0_reg[0]\ => \sig_addr_cntr_lsh_im0_reg[0]\,
      \sig_addr_cntr_lsh_im0_reg[0]_0\ => \sig_addr_cntr_lsh_im0_reg[0]_0\,
      sig_addr_reg_empty => \^sig_addr_reg_empty\,
      sig_addr_reg_empty_reg => \GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO_n_5\,
      sig_calc_error_reg_reg => \GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO_n_6\,
      sig_data2addr_stop_req => sig_data2addr_stop_req,
      sig_inhibit_rdy_n_reg_0 => sig_inhibit_rdy_n,
      sig_init_reg => sig_init_reg,
      sig_init_reg2 => sig_init_reg2,
      sig_mmap_rst_reg_n => sig_mmap_rst_reg_n,
      sig_mstr2addr_cmd_valid => sig_mstr2addr_cmd_valid,
      sig_push_addr_reg1_out => sig_push_addr_reg1_out,
      sig_sf_allow_addr_req => sig_sf_allow_addr_req
    );
sig_addr_reg_empty_reg: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_push_addr_reg1_out,
      D => '0',
      Q => \^sig_addr_reg_empty\,
      S => sig_next_addr_reg0
    );
sig_addr_reg_full_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_push_addr_reg1_out,
      D => '1',
      Q => sig_addr_reg_full,
      R => sig_next_addr_reg0
    );
sig_addr_valid_reg_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_push_addr_reg1_out,
      D => \GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO_n_6\,
      Q => m_axi_mm2s_arvalid,
      R => sig_next_addr_reg0
    );
sig_calc_error_reg_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_push_addr_reg1_out,
      D => sig_aq_fifo_data_out(50),
      Q => \^sig_addr2rsc_calc_error\,
      R => sig_next_addr_reg0
    );
\sig_next_addr_reg[31]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"08FF"
    )
        port map (
      I0 => sig_addr_reg_full,
      I1 => m_axi_mm2s_arready,
      I2 => \^sig_addr2rsc_calc_error\,
      I3 => sig_mmap_rst_reg_n,
      O => sig_next_addr_reg0
    );
\sig_next_addr_reg_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_push_addr_reg1_out,
      D => sig_aq_fifo_data_out(4),
      Q => m_axi_mm2s_araddr(0),
      R => sig_next_addr_reg0
    );
\sig_next_addr_reg_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_push_addr_reg1_out,
      D => sig_aq_fifo_data_out(14),
      Q => m_axi_mm2s_araddr(10),
      R => sig_next_addr_reg0
    );
\sig_next_addr_reg_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_push_addr_reg1_out,
      D => sig_aq_fifo_data_out(15),
      Q => m_axi_mm2s_araddr(11),
      R => sig_next_addr_reg0
    );
\sig_next_addr_reg_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_push_addr_reg1_out,
      D => sig_aq_fifo_data_out(16),
      Q => m_axi_mm2s_araddr(12),
      R => sig_next_addr_reg0
    );
\sig_next_addr_reg_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_push_addr_reg1_out,
      D => sig_aq_fifo_data_out(17),
      Q => m_axi_mm2s_araddr(13),
      R => sig_next_addr_reg0
    );
\sig_next_addr_reg_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_push_addr_reg1_out,
      D => sig_aq_fifo_data_out(18),
      Q => m_axi_mm2s_araddr(14),
      R => sig_next_addr_reg0
    );
\sig_next_addr_reg_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_push_addr_reg1_out,
      D => sig_aq_fifo_data_out(19),
      Q => m_axi_mm2s_araddr(15),
      R => sig_next_addr_reg0
    );
\sig_next_addr_reg_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_push_addr_reg1_out,
      D => sig_aq_fifo_data_out(20),
      Q => m_axi_mm2s_araddr(16),
      R => sig_next_addr_reg0
    );
\sig_next_addr_reg_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_push_addr_reg1_out,
      D => sig_aq_fifo_data_out(21),
      Q => m_axi_mm2s_araddr(17),
      R => sig_next_addr_reg0
    );
\sig_next_addr_reg_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_push_addr_reg1_out,
      D => sig_aq_fifo_data_out(22),
      Q => m_axi_mm2s_araddr(18),
      R => sig_next_addr_reg0
    );
\sig_next_addr_reg_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_push_addr_reg1_out,
      D => sig_aq_fifo_data_out(23),
      Q => m_axi_mm2s_araddr(19),
      R => sig_next_addr_reg0
    );
\sig_next_addr_reg_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_push_addr_reg1_out,
      D => sig_aq_fifo_data_out(5),
      Q => m_axi_mm2s_araddr(1),
      R => sig_next_addr_reg0
    );
\sig_next_addr_reg_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_push_addr_reg1_out,
      D => sig_aq_fifo_data_out(24),
      Q => m_axi_mm2s_araddr(20),
      R => sig_next_addr_reg0
    );
\sig_next_addr_reg_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_push_addr_reg1_out,
      D => sig_aq_fifo_data_out(25),
      Q => m_axi_mm2s_araddr(21),
      R => sig_next_addr_reg0
    );
\sig_next_addr_reg_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_push_addr_reg1_out,
      D => sig_aq_fifo_data_out(26),
      Q => m_axi_mm2s_araddr(22),
      R => sig_next_addr_reg0
    );
\sig_next_addr_reg_reg[23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_push_addr_reg1_out,
      D => sig_aq_fifo_data_out(27),
      Q => m_axi_mm2s_araddr(23),
      R => sig_next_addr_reg0
    );
\sig_next_addr_reg_reg[24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_push_addr_reg1_out,
      D => sig_aq_fifo_data_out(28),
      Q => m_axi_mm2s_araddr(24),
      R => sig_next_addr_reg0
    );
\sig_next_addr_reg_reg[25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_push_addr_reg1_out,
      D => sig_aq_fifo_data_out(29),
      Q => m_axi_mm2s_araddr(25),
      R => sig_next_addr_reg0
    );
\sig_next_addr_reg_reg[26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_push_addr_reg1_out,
      D => sig_aq_fifo_data_out(30),
      Q => m_axi_mm2s_araddr(26),
      R => sig_next_addr_reg0
    );
\sig_next_addr_reg_reg[27]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_push_addr_reg1_out,
      D => sig_aq_fifo_data_out(31),
      Q => m_axi_mm2s_araddr(27),
      R => sig_next_addr_reg0
    );
\sig_next_addr_reg_reg[28]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_push_addr_reg1_out,
      D => sig_aq_fifo_data_out(32),
      Q => m_axi_mm2s_araddr(28),
      R => sig_next_addr_reg0
    );
\sig_next_addr_reg_reg[29]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_push_addr_reg1_out,
      D => sig_aq_fifo_data_out(33),
      Q => m_axi_mm2s_araddr(29),
      R => sig_next_addr_reg0
    );
\sig_next_addr_reg_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_push_addr_reg1_out,
      D => sig_aq_fifo_data_out(6),
      Q => m_axi_mm2s_araddr(2),
      R => sig_next_addr_reg0
    );
\sig_next_addr_reg_reg[30]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_push_addr_reg1_out,
      D => sig_aq_fifo_data_out(34),
      Q => m_axi_mm2s_araddr(30),
      R => sig_next_addr_reg0
    );
\sig_next_addr_reg_reg[31]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_push_addr_reg1_out,
      D => sig_aq_fifo_data_out(35),
      Q => m_axi_mm2s_araddr(31),
      R => sig_next_addr_reg0
    );
\sig_next_addr_reg_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_push_addr_reg1_out,
      D => sig_aq_fifo_data_out(7),
      Q => m_axi_mm2s_araddr(3),
      R => sig_next_addr_reg0
    );
\sig_next_addr_reg_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_push_addr_reg1_out,
      D => sig_aq_fifo_data_out(8),
      Q => m_axi_mm2s_araddr(4),
      R => sig_next_addr_reg0
    );
\sig_next_addr_reg_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_push_addr_reg1_out,
      D => sig_aq_fifo_data_out(9),
      Q => m_axi_mm2s_araddr(5),
      R => sig_next_addr_reg0
    );
\sig_next_addr_reg_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_push_addr_reg1_out,
      D => sig_aq_fifo_data_out(10),
      Q => m_axi_mm2s_araddr(6),
      R => sig_next_addr_reg0
    );
\sig_next_addr_reg_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_push_addr_reg1_out,
      D => sig_aq_fifo_data_out(11),
      Q => m_axi_mm2s_araddr(7),
      R => sig_next_addr_reg0
    );
\sig_next_addr_reg_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_push_addr_reg1_out,
      D => sig_aq_fifo_data_out(12),
      Q => m_axi_mm2s_araddr(8),
      R => sig_next_addr_reg0
    );
\sig_next_addr_reg_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_push_addr_reg1_out,
      D => sig_aq_fifo_data_out(13),
      Q => m_axi_mm2s_araddr(9),
      R => sig_next_addr_reg0
    );
\sig_next_burst_reg_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_push_addr_reg1_out,
      D => sig_aq_fifo_data_out(47),
      Q => m_axi_mm2s_arburst(0),
      R => sig_next_addr_reg0
    );
\sig_next_len_reg_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_push_addr_reg1_out,
      D => sig_aq_fifo_data_out(36),
      Q => m_axi_mm2s_arlen(0),
      R => sig_next_addr_reg0
    );
\sig_next_len_reg_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_push_addr_reg1_out,
      D => sig_aq_fifo_data_out(37),
      Q => m_axi_mm2s_arlen(1),
      R => sig_next_addr_reg0
    );
\sig_next_size_reg_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_push_addr_reg1_out,
      D => sig_aq_fifo_data_out(46),
      Q => m_axi_mm2s_arsize(0),
      R => sig_next_addr_reg0
    );
sig_posted_to_axi_2_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => '1',
      D => \GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO_n_5\,
      Q => sig_posted_to_axi_2,
      R => '0'
    );
sig_posted_to_axi_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => '1',
      D => \GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO_n_5\,
      Q => sig_posted_to_axi,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_datamover_rddata_cntl is
  port (
    FIFO_Full_reg : out STD_LOGIC;
    sig_data2rsc_valid : out STD_LOGIC;
    sig_last_mmap_dbeat_reg_reg_0 : out STD_LOGIC;
    sig_data2addr_stop_req : out STD_LOGIC;
    sig_halt_reg_dly2 : out STD_LOGIC;
    sig_halt_reg_dly3 : out STD_LOGIC;
    sig_data2rsc_decerr : out STD_LOGIC;
    sig_init_done : out STD_LOGIC;
    sig_rd_sts_interr_reg0 : out STD_LOGIC;
    sig_rd_sts_slverr_reg0 : out STD_LOGIC;
    \USE_SRL_FIFO.sig_wr_fifo\ : out STD_LOGIC;
    sig_inhibit_rdy_n : out STD_LOGIC;
    din : out STD_LOGIC_VECTOR ( 17 downto 0 );
    wr_en : out STD_LOGIC;
    m_axi_mm2s_rready : out STD_LOGIC;
    sig_next_calc_error_reg_reg_0 : out STD_LOGIC;
    sig_halt_reg_dly3_reg_0 : out STD_LOGIC;
    \sig_sstrb_stop_mask_reg[15]\ : out STD_LOGIC;
    SS : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_mm2s_aclk : in STD_LOGIC;
    sig_init_done_reg : in STD_LOGIC;
    sig_mmap_rst_reg_n : in STD_LOGIC;
    sig_rd_sts_slverr_reg_reg : in STD_LOGIC_VECTOR ( 1 downto 0 );
    sig_mstr2data_cmd_valid : in STD_LOGIC;
    \sig_addr_posted_cntr_reg[2]_0\ : in STD_LOGIC;
    m_axi_mm2s_rlast : in STD_LOGIC;
    full : in STD_LOGIC;
    m_axi_mm2s_rvalid : in STD_LOGIC;
    sig_rsc2data_ready : in STD_LOGIC;
    sig_rsc2stat_status_valid : in STD_LOGIC;
    sig_stat2rsc_status_ready : in STD_LOGIC;
    sig_stream_rst_reg_n : in STD_LOGIC;
    sig_sstrb_stop_mask : in STD_LOGIC_VECTOR ( 0 to 0 );
    sig_s_ready_dup_reg : in STD_LOGIC;
    m_axi_mm2s_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    \in\ : in STD_LOGIC_VECTOR ( 37 downto 0 );
    sig_rst2all_stop_request : in STD_LOGIC
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_datamover_rddata_cntl;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_datamover_rddata_cntl is
  signal \GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO_n_10\ : STD_LOGIC;
  signal \GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO_n_11\ : STD_LOGIC;
  signal \GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO_n_12\ : STD_LOGIC;
  signal \GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO_n_13\ : STD_LOGIC;
  signal \GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO_n_14\ : STD_LOGIC;
  signal \GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO_n_15\ : STD_LOGIC;
  signal \GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO_n_2\ : STD_LOGIC;
  signal \GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO_n_52\ : STD_LOGIC;
  signal \GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO_n_53\ : STD_LOGIC;
  signal \GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO_n_7\ : STD_LOGIC;
  signal \GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO_n_8\ : STD_LOGIC;
  signal \GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO_n_9\ : STD_LOGIC;
  signal m_axi_mm2s_rready_INST_0_i_1_n_0 : STD_LOGIC;
  signal sig_addr_posted_cntr : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \sig_addr_posted_cntr[0]_i_1_n_0\ : STD_LOGIC;
  signal \sig_addr_posted_cntr[1]_i_1_n_0\ : STD_LOGIC;
  signal \sig_addr_posted_cntr[2]_i_1_n_0\ : STD_LOGIC;
  signal \sig_addr_posted_cntr[2]_i_2_n_0\ : STD_LOGIC;
  signal sig_clr_dqual_reg : STD_LOGIC;
  signal sig_cmd_cmplt_last_dbeat : STD_LOGIC;
  signal sig_cmd_fifo_data_out : STD_LOGIC_VECTOR ( 52 downto 16 );
  signal sig_coelsc_decerr_reg0 : STD_LOGIC;
  signal sig_coelsc_interr_reg0 : STD_LOGIC;
  signal sig_coelsc_slverr_reg0 : STD_LOGIC;
  signal sig_coelsc_tag_reg0 : STD_LOGIC;
  signal \^sig_data2addr_stop_req\ : STD_LOGIC;
  signal sig_data2rsc_calc_err : STD_LOGIC;
  signal \^sig_data2rsc_decerr\ : STD_LOGIC;
  signal sig_data2rsc_slverr : STD_LOGIC;
  signal \^sig_data2rsc_valid\ : STD_LOGIC;
  signal sig_dbeat_cntr : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \sig_dbeat_cntr[5]_i_2_n_0\ : STD_LOGIC;
  signal \sig_dbeat_cntr[7]_i_3_n_0\ : STD_LOGIC;
  signal sig_dqual_reg_empty : STD_LOGIC;
  signal sig_dqual_reg_full : STD_LOGIC;
  signal sig_first_dbeat : STD_LOGIC;
  signal sig_first_dbeat_i_2_n_0 : STD_LOGIC;
  signal sig_halt_reg_dly1 : STD_LOGIC;
  signal \^sig_halt_reg_dly2\ : STD_LOGIC;
  signal \^sig_halt_reg_dly3\ : STD_LOGIC;
  signal sig_halt_reg_i_1_n_0 : STD_LOGIC;
  signal sig_last_dbeat_i_4_n_0 : STD_LOGIC;
  signal sig_last_dbeat_reg_n_0 : STD_LOGIC;
  signal sig_last_mmap_dbeat : STD_LOGIC;
  signal \^sig_last_mmap_dbeat_reg_reg_0\ : STD_LOGIC;
  signal sig_ld_new_cmd_reg : STD_LOGIC;
  signal sig_next_calc_error_reg : STD_LOGIC;
  signal sig_next_cmd_cmplt_reg : STD_LOGIC;
  signal sig_next_cmd_cmplt_reg_i_3_n_0 : STD_LOGIC;
  signal sig_next_eof_reg : STD_LOGIC;
  signal sig_next_last_strb_reg : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal sig_next_sequential_reg : STD_LOGIC;
  signal sig_next_strt_strb_reg : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal sig_push_coelsc_reg : STD_LOGIC;
  signal sig_push_dqual_reg : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \BLK_MEM.I_SYNC_FIFOGEN_FIFO_i_2\ : label is "soft_lutpair117";
  attribute SOFT_HLUTNM of \BLK_MEM.I_SYNC_FIFOGEN_FIFO_i_3\ : label is "soft_lutpair121";
  attribute SOFT_HLUTNM of \BLK_MEM.I_SYNC_FIFOGEN_FIFO_i_4\ : label is "soft_lutpair121";
  attribute SOFT_HLUTNM of m_axi_mm2s_rready_INST_0 : label is "soft_lutpair123";
  attribute SOFT_HLUTNM of m_axi_mm2s_rready_INST_0_i_1 : label is "soft_lutpair118";
  attribute SOFT_HLUTNM of \sig_addr_posted_cntr[1]_i_1\ : label is "soft_lutpair120";
  attribute SOFT_HLUTNM of \sig_addr_posted_cntr[2]_i_2\ : label is "soft_lutpair120";
  attribute SOFT_HLUTNM of sig_coelsc_cmd_cmplt_reg_i_3 : label is "soft_lutpair124";
  attribute SOFT_HLUTNM of sig_coelsc_decerr_reg_i_1 : label is "soft_lutpair122";
  attribute SOFT_HLUTNM of sig_coelsc_interr_reg_i_1 : label is "soft_lutpair124";
  attribute SOFT_HLUTNM of sig_coelsc_slverr_reg_i_1 : label is "soft_lutpair122";
  attribute SOFT_HLUTNM of sig_halt_cmplt_i_3 : label is "soft_lutpair118";
  attribute SOFT_HLUTNM of sig_halt_reg_i_1 : label is "soft_lutpair123";
  attribute SOFT_HLUTNM of sig_next_cmd_cmplt_reg_i_3 : label is "soft_lutpair117";
  attribute SOFT_HLUTNM of sig_s_ready_dup_i_1 : label is "soft_lutpair119";
  attribute SOFT_HLUTNM of \sig_sstrb_stop_mask[15]_i_1\ : label is "soft_lutpair119";
begin
  sig_data2addr_stop_req <= \^sig_data2addr_stop_req\;
  sig_data2rsc_decerr <= \^sig_data2rsc_decerr\;
  sig_data2rsc_valid <= \^sig_data2rsc_valid\;
  sig_halt_reg_dly2 <= \^sig_halt_reg_dly2\;
  sig_halt_reg_dly3 <= \^sig_halt_reg_dly3\;
  sig_last_mmap_dbeat_reg_reg_0 <= \^sig_last_mmap_dbeat_reg_reg_0\;
\BLK_MEM.I_SYNC_FIFOGEN_FIFO_i_10\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFDCCFD"
    )
        port map (
      I0 => sig_last_dbeat_reg_n_0,
      I1 => \^sig_data2addr_stop_req\,
      I2 => sig_next_last_strb_reg(10),
      I3 => sig_first_dbeat,
      I4 => sig_next_strt_strb_reg(10),
      O => din(10)
    );
\BLK_MEM.I_SYNC_FIFOGEN_FIFO_i_11\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFDCCFD"
    )
        port map (
      I0 => sig_last_dbeat_reg_n_0,
      I1 => \^sig_data2addr_stop_req\,
      I2 => sig_next_last_strb_reg(9),
      I3 => sig_first_dbeat,
      I4 => sig_next_strt_strb_reg(9),
      O => din(9)
    );
\BLK_MEM.I_SYNC_FIFOGEN_FIFO_i_12\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFDCCFD"
    )
        port map (
      I0 => sig_last_dbeat_reg_n_0,
      I1 => \^sig_data2addr_stop_req\,
      I2 => sig_next_last_strb_reg(8),
      I3 => sig_first_dbeat,
      I4 => sig_next_strt_strb_reg(8),
      O => din(8)
    );
\BLK_MEM.I_SYNC_FIFOGEN_FIFO_i_13\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFDCCFD"
    )
        port map (
      I0 => sig_last_dbeat_reg_n_0,
      I1 => \^sig_data2addr_stop_req\,
      I2 => sig_next_last_strb_reg(7),
      I3 => sig_first_dbeat,
      I4 => sig_next_strt_strb_reg(7),
      O => din(7)
    );
\BLK_MEM.I_SYNC_FIFOGEN_FIFO_i_14\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFDCCFD"
    )
        port map (
      I0 => sig_last_dbeat_reg_n_0,
      I1 => \^sig_data2addr_stop_req\,
      I2 => sig_next_last_strb_reg(6),
      I3 => sig_first_dbeat,
      I4 => sig_next_strt_strb_reg(6),
      O => din(6)
    );
\BLK_MEM.I_SYNC_FIFOGEN_FIFO_i_15\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFDCCFD"
    )
        port map (
      I0 => sig_last_dbeat_reg_n_0,
      I1 => \^sig_data2addr_stop_req\,
      I2 => sig_next_last_strb_reg(5),
      I3 => sig_first_dbeat,
      I4 => sig_next_strt_strb_reg(5),
      O => din(5)
    );
\BLK_MEM.I_SYNC_FIFOGEN_FIFO_i_16\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFDCCFD"
    )
        port map (
      I0 => sig_last_dbeat_reg_n_0,
      I1 => \^sig_data2addr_stop_req\,
      I2 => sig_next_last_strb_reg(4),
      I3 => sig_first_dbeat,
      I4 => sig_next_strt_strb_reg(4),
      O => din(4)
    );
\BLK_MEM.I_SYNC_FIFOGEN_FIFO_i_17\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFDCCFD"
    )
        port map (
      I0 => sig_last_dbeat_reg_n_0,
      I1 => \^sig_data2addr_stop_req\,
      I2 => sig_next_last_strb_reg(3),
      I3 => sig_first_dbeat,
      I4 => sig_next_strt_strb_reg(3),
      O => din(3)
    );
\BLK_MEM.I_SYNC_FIFOGEN_FIFO_i_18\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFDCCFD"
    )
        port map (
      I0 => sig_last_dbeat_reg_n_0,
      I1 => \^sig_data2addr_stop_req\,
      I2 => sig_next_last_strb_reg(2),
      I3 => sig_first_dbeat,
      I4 => sig_next_strt_strb_reg(2),
      O => din(2)
    );
\BLK_MEM.I_SYNC_FIFOGEN_FIFO_i_19\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFDCCFD"
    )
        port map (
      I0 => sig_last_dbeat_reg_n_0,
      I1 => \^sig_data2addr_stop_req\,
      I2 => sig_next_last_strb_reg(1),
      I3 => sig_first_dbeat,
      I4 => sig_next_strt_strb_reg(1),
      O => din(1)
    );
\BLK_MEM.I_SYNC_FIFOGEN_FIFO_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"55100000"
    )
        port map (
      I0 => full,
      I1 => \^sig_data2rsc_valid\,
      I2 => m_axi_mm2s_rvalid,
      I3 => \^sig_data2addr_stop_req\,
      I4 => m_axi_mm2s_rready_INST_0_i_1_n_0,
      O => wr_en
    );
\BLK_MEM.I_SYNC_FIFOGEN_FIFO_i_20\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFDCCFD"
    )
        port map (
      I0 => sig_last_dbeat_reg_n_0,
      I1 => \^sig_data2addr_stop_req\,
      I2 => sig_next_last_strb_reg(0),
      I3 => sig_first_dbeat,
      I4 => sig_next_strt_strb_reg(0),
      O => din(0)
    );
\BLK_MEM.I_SYNC_FIFOGEN_FIFO_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F888"
    )
        port map (
      I0 => \^sig_data2addr_stop_req\,
      I1 => m_axi_mm2s_rready_INST_0_i_1_n_0,
      I2 => m_axi_mm2s_rlast,
      I3 => sig_next_cmd_cmplt_reg,
      O => din(17)
    );
\BLK_MEM.I_SYNC_FIFOGEN_FIFO_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F888"
    )
        port map (
      I0 => \^sig_data2addr_stop_req\,
      I1 => m_axi_mm2s_rready_INST_0_i_1_n_0,
      I2 => m_axi_mm2s_rlast,
      I3 => sig_next_eof_reg,
      O => din(16)
    );
\BLK_MEM.I_SYNC_FIFOGEN_FIFO_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFDCCFD"
    )
        port map (
      I0 => sig_last_dbeat_reg_n_0,
      I1 => \^sig_data2addr_stop_req\,
      I2 => sig_next_last_strb_reg(15),
      I3 => sig_first_dbeat,
      I4 => sig_next_strt_strb_reg(15),
      O => din(15)
    );
\BLK_MEM.I_SYNC_FIFOGEN_FIFO_i_6\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFDCCFD"
    )
        port map (
      I0 => sig_last_dbeat_reg_n_0,
      I1 => \^sig_data2addr_stop_req\,
      I2 => sig_next_last_strb_reg(14),
      I3 => sig_first_dbeat,
      I4 => sig_next_strt_strb_reg(14),
      O => din(14)
    );
\BLK_MEM.I_SYNC_FIFOGEN_FIFO_i_7\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFDCCFD"
    )
        port map (
      I0 => sig_last_dbeat_reg_n_0,
      I1 => \^sig_data2addr_stop_req\,
      I2 => sig_next_last_strb_reg(13),
      I3 => sig_first_dbeat,
      I4 => sig_next_strt_strb_reg(13),
      O => din(13)
    );
\BLK_MEM.I_SYNC_FIFOGEN_FIFO_i_8\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFDCCFD"
    )
        port map (
      I0 => sig_last_dbeat_reg_n_0,
      I1 => \^sig_data2addr_stop_req\,
      I2 => sig_next_last_strb_reg(12),
      I3 => sig_first_dbeat,
      I4 => sig_next_strt_strb_reg(12),
      O => din(12)
    );
\BLK_MEM.I_SYNC_FIFOGEN_FIFO_i_9\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFDCCFD"
    )
        port map (
      I0 => sig_last_dbeat_reg_n_0,
      I1 => \^sig_data2addr_stop_req\,
      I2 => sig_next_last_strb_reg(11),
      I3 => sig_first_dbeat,
      I4 => sig_next_strt_strb_reg(11),
      O => din(11)
    );
\GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO\: entity work.\decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_datamover_fifo__parameterized2\
     port map (
      D(7) => \GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO_n_8\,
      D(6) => \GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO_n_9\,
      D(5) => \GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO_n_10\,
      D(4) => \GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO_n_11\,
      D(3) => \GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO_n_12\,
      D(2) => \GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO_n_13\,
      D(1) => \GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO_n_14\,
      D(0) => \GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO_n_15\,
      E(0) => \GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO_n_7\,
      FIFO_Full_reg => FIFO_Full_reg,
      Q(7 downto 0) => sig_dbeat_cntr(7 downto 0),
      SR(0) => sig_clr_dqual_reg,
      SS(0) => SS(0),
      full => full,
      \in\(37 downto 0) => \in\(37 downto 0),
      m_axi_mm2s_aclk => m_axi_mm2s_aclk,
      m_axi_mm2s_rlast => m_axi_mm2s_rlast,
      m_axi_mm2s_rvalid => m_axi_mm2s_rvalid,
      \out\(35 downto 32) => sig_cmd_fifo_data_out(52 downto 49),
      \out\(31 downto 0) => sig_cmd_fifo_data_out(47 downto 16),
      sel => \USE_SRL_FIFO.sig_wr_fifo\,
      \sig_dbeat_cntr_reg[0]\ => sig_next_cmd_cmplt_reg_i_3_n_0,
      \sig_dbeat_cntr_reg[5]\ => \sig_dbeat_cntr[5]_i_2_n_0\,
      \sig_dbeat_cntr_reg[6]\ => \sig_dbeat_cntr[7]_i_3_n_0\,
      sig_dqual_reg_empty => sig_dqual_reg_empty,
      sig_dqual_reg_empty_reg => m_axi_mm2s_rready_INST_0_i_1_n_0,
      sig_dqual_reg_empty_reg_0 => \^sig_data2rsc_valid\,
      sig_dqual_reg_empty_reg_1 => \^sig_data2addr_stop_req\,
      sig_dqual_reg_empty_reg_2(2 downto 0) => sig_addr_posted_cntr(2 downto 0),
      sig_first_dbeat => sig_first_dbeat,
      sig_first_dbeat_reg => sig_first_dbeat_i_2_n_0,
      sig_inhibit_rdy_n_reg_0 => sig_inhibit_rdy_n,
      sig_init_done => sig_init_done,
      sig_init_done_reg_0 => sig_init_done_reg,
      sig_last_dbeat_reg => sig_last_dbeat_i_4_n_0,
      sig_last_dbeat_reg_0 => sig_last_dbeat_reg_n_0,
      sig_ld_new_cmd_reg => sig_ld_new_cmd_reg,
      sig_mmap_rst_reg_n => sig_mmap_rst_reg_n,
      sig_mmap_rst_reg_n_reg => \GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO_n_2\,
      sig_mmap_rst_reg_n_reg_0 => \GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO_n_52\,
      sig_mmap_rst_reg_n_reg_1 => \GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO_n_53\,
      sig_mstr2data_cmd_valid => sig_mstr2data_cmd_valid,
      sig_next_calc_error_reg => sig_next_calc_error_reg,
      sig_next_sequential_reg => sig_next_sequential_reg,
      sig_push_dqual_reg => sig_push_dqual_reg,
      sig_rsc2stat_status_valid => sig_rsc2stat_status_valid,
      sig_stat2rsc_status_ready => sig_stat2rsc_status_ready
    );
m_axi_mm2s_rready_INST_0: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4500"
    )
        port map (
      I0 => \^sig_data2rsc_valid\,
      I1 => \^sig_data2addr_stop_req\,
      I2 => full,
      I3 => m_axi_mm2s_rready_INST_0_i_1_n_0,
      O => m_axi_mm2s_rready
    );
m_axi_mm2s_rready_INST_0_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000AAA8"
    )
        port map (
      I0 => sig_dqual_reg_full,
      I1 => sig_addr_posted_cntr(1),
      I2 => sig_addr_posted_cntr(0),
      I3 => sig_addr_posted_cntr(2),
      I4 => sig_next_calc_error_reg,
      O => m_axi_mm2s_rready_INST_0_i_1_n_0
    );
\sig_addr_posted_cntr[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => sig_addr_posted_cntr(0),
      O => \sig_addr_posted_cntr[0]_i_1_n_0\
    );
\sig_addr_posted_cntr[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"EF3030CF"
    )
        port map (
      I0 => sig_addr_posted_cntr(2),
      I1 => \^sig_last_mmap_dbeat_reg_reg_0\,
      I2 => \sig_addr_posted_cntr_reg[2]_0\,
      I3 => sig_addr_posted_cntr(1),
      I4 => sig_addr_posted_cntr(0),
      O => \sig_addr_posted_cntr[1]_i_1_n_0\
    );
\sig_addr_posted_cntr[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"007FFE00"
    )
        port map (
      I0 => sig_addr_posted_cntr(2),
      I1 => sig_addr_posted_cntr(1),
      I2 => sig_addr_posted_cntr(0),
      I3 => \^sig_last_mmap_dbeat_reg_reg_0\,
      I4 => \sig_addr_posted_cntr_reg[2]_0\,
      O => \sig_addr_posted_cntr[2]_i_1_n_0\
    );
\sig_addr_posted_cntr[2]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F2F0F02D"
    )
        port map (
      I0 => \sig_addr_posted_cntr_reg[2]_0\,
      I1 => \^sig_last_mmap_dbeat_reg_reg_0\,
      I2 => sig_addr_posted_cntr(2),
      I3 => sig_addr_posted_cntr(0),
      I4 => sig_addr_posted_cntr(1),
      O => \sig_addr_posted_cntr[2]_i_2_n_0\
    );
\sig_addr_posted_cntr_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => \sig_addr_posted_cntr[2]_i_1_n_0\,
      D => \sig_addr_posted_cntr[0]_i_1_n_0\,
      Q => sig_addr_posted_cntr(0),
      R => SS(0)
    );
\sig_addr_posted_cntr_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => \sig_addr_posted_cntr[2]_i_1_n_0\,
      D => \sig_addr_posted_cntr[1]_i_1_n_0\,
      Q => sig_addr_posted_cntr(1),
      R => SS(0)
    );
\sig_addr_posted_cntr_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => \sig_addr_posted_cntr[2]_i_1_n_0\,
      D => \sig_addr_posted_cntr[2]_i_2_n_0\,
      Q => sig_addr_posted_cntr(2),
      R => SS(0)
    );
sig_coelsc_cmd_cmplt_reg_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00404040FFFFFFFF"
    )
        port map (
      I0 => sig_next_cmd_cmplt_reg_i_3_n_0,
      I1 => \^sig_data2rsc_valid\,
      I2 => sig_rsc2data_ready,
      I3 => sig_next_calc_error_reg,
      I4 => sig_ld_new_cmd_reg,
      I5 => sig_mmap_rst_reg_n,
      O => sig_coelsc_tag_reg0
    );
sig_coelsc_cmd_cmplt_reg_i_2: unisim.vcomponents.LUT3
    generic map(
      INIT => X"EA"
    )
        port map (
      I0 => sig_next_cmd_cmplt_reg_i_3_n_0,
      I1 => sig_next_calc_error_reg,
      I2 => sig_ld_new_cmd_reg,
      O => sig_push_coelsc_reg
    );
sig_coelsc_cmd_cmplt_reg_i_3: unisim.vcomponents.LUT3
    generic map(
      INIT => X"F8"
    )
        port map (
      I0 => sig_next_cmd_cmplt_reg,
      I1 => m_axi_mm2s_rlast,
      I2 => sig_next_calc_error_reg,
      O => sig_cmd_cmplt_last_dbeat
    );
sig_coelsc_cmd_cmplt_reg_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_push_coelsc_reg,
      D => sig_cmd_cmplt_last_dbeat,
      Q => \^sig_data2rsc_valid\,
      R => sig_coelsc_tag_reg0
    );
sig_coelsc_decerr_reg_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FF80"
    )
        port map (
      I0 => m_axi_mm2s_rresp(0),
      I1 => m_axi_mm2s_rresp(1),
      I2 => m_axi_mm2s_rvalid,
      I3 => \^sig_data2rsc_decerr\,
      O => sig_coelsc_decerr_reg0
    );
sig_coelsc_decerr_reg_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_push_coelsc_reg,
      D => sig_coelsc_decerr_reg0,
      Q => \^sig_data2rsc_decerr\,
      R => sig_coelsc_tag_reg0
    );
sig_coelsc_interr_reg_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => sig_data2rsc_calc_err,
      I1 => sig_next_calc_error_reg,
      O => sig_coelsc_interr_reg0
    );
sig_coelsc_interr_reg_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_push_coelsc_reg,
      D => sig_coelsc_interr_reg0,
      Q => sig_data2rsc_calc_err,
      R => sig_coelsc_tag_reg0
    );
sig_coelsc_slverr_reg_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FF40"
    )
        port map (
      I0 => m_axi_mm2s_rresp(0),
      I1 => m_axi_mm2s_rresp(1),
      I2 => m_axi_mm2s_rvalid,
      I3 => sig_data2rsc_slverr,
      O => sig_coelsc_slverr_reg0
    );
sig_coelsc_slverr_reg_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_push_coelsc_reg,
      D => sig_coelsc_slverr_reg0,
      Q => sig_data2rsc_slverr,
      R => sig_coelsc_tag_reg0
    );
\sig_dbeat_cntr[5]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => sig_dbeat_cntr(3),
      I1 => sig_dbeat_cntr(1),
      I2 => sig_dbeat_cntr(0),
      I3 => sig_dbeat_cntr(2),
      I4 => sig_dbeat_cntr(4),
      O => \sig_dbeat_cntr[5]_i_2_n_0\
    );
\sig_dbeat_cntr[7]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => sig_dbeat_cntr(4),
      I1 => sig_dbeat_cntr(2),
      I2 => sig_dbeat_cntr(0),
      I3 => sig_dbeat_cntr(1),
      I4 => sig_dbeat_cntr(3),
      I5 => sig_dbeat_cntr(5),
      O => \sig_dbeat_cntr[7]_i_3_n_0\
    );
\sig_dbeat_cntr_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => \GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO_n_7\,
      D => \GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO_n_15\,
      Q => sig_dbeat_cntr(0),
      R => SS(0)
    );
\sig_dbeat_cntr_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => \GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO_n_7\,
      D => \GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO_n_14\,
      Q => sig_dbeat_cntr(1),
      R => SS(0)
    );
\sig_dbeat_cntr_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => \GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO_n_7\,
      D => \GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO_n_13\,
      Q => sig_dbeat_cntr(2),
      R => SS(0)
    );
\sig_dbeat_cntr_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => \GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO_n_7\,
      D => \GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO_n_12\,
      Q => sig_dbeat_cntr(3),
      R => SS(0)
    );
\sig_dbeat_cntr_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => \GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO_n_7\,
      D => \GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO_n_11\,
      Q => sig_dbeat_cntr(4),
      R => SS(0)
    );
\sig_dbeat_cntr_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => \GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO_n_7\,
      D => \GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO_n_10\,
      Q => sig_dbeat_cntr(5),
      R => SS(0)
    );
\sig_dbeat_cntr_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => \GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO_n_7\,
      D => \GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO_n_9\,
      Q => sig_dbeat_cntr(6),
      R => SS(0)
    );
\sig_dbeat_cntr_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => \GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO_n_7\,
      D => \GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO_n_8\,
      Q => sig_dbeat_cntr(7),
      R => SS(0)
    );
sig_dqual_reg_empty_reg: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_push_dqual_reg,
      D => '0',
      Q => sig_dqual_reg_empty,
      S => sig_clr_dqual_reg
    );
sig_dqual_reg_full_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_push_dqual_reg,
      D => '1',
      Q => sig_dqual_reg_full,
      R => sig_clr_dqual_reg
    );
sig_first_dbeat_i_2: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => sig_dbeat_cntr(6),
      I1 => \sig_dbeat_cntr[7]_i_3_n_0\,
      I2 => sig_dbeat_cntr(7),
      O => sig_first_dbeat_i_2_n_0
    );
sig_first_dbeat_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => '1',
      D => \GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO_n_2\,
      Q => sig_first_dbeat,
      R => '0'
    );
sig_halt_cmplt_i_3: unisim.vcomponents.LUT4
    generic map(
      INIT => X"AAAB"
    )
        port map (
      I0 => sig_next_calc_error_reg,
      I1 => sig_addr_posted_cntr(2),
      I2 => sig_addr_posted_cntr(0),
      I3 => sig_addr_posted_cntr(1),
      O => sig_next_calc_error_reg_reg_0
    );
sig_halt_reg_dly1_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => '1',
      D => \^sig_data2addr_stop_req\,
      Q => sig_halt_reg_dly1,
      R => SS(0)
    );
sig_halt_reg_dly2_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => '1',
      D => sig_halt_reg_dly1,
      Q => \^sig_halt_reg_dly2\,
      R => SS(0)
    );
sig_halt_reg_dly3_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => '1',
      D => \^sig_halt_reg_dly2\,
      Q => \^sig_halt_reg_dly3\,
      R => SS(0)
    );
sig_halt_reg_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => sig_rst2all_stop_request,
      I1 => \^sig_data2addr_stop_req\,
      O => sig_halt_reg_i_1_n_0
    );
sig_halt_reg_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => '1',
      D => sig_halt_reg_i_1_n_0,
      Q => \^sig_data2addr_stop_req\,
      R => SS(0)
    );
sig_last_dbeat_i_4: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
        port map (
      I0 => sig_dbeat_cntr(2),
      I1 => sig_dbeat_cntr(3),
      I2 => sig_dbeat_cntr(4),
      I3 => sig_dbeat_cntr(5),
      I4 => sig_dbeat_cntr(7),
      I5 => sig_dbeat_cntr(6),
      O => sig_last_dbeat_i_4_n_0
    );
sig_last_dbeat_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => '1',
      D => \GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO_n_53\,
      Q => sig_last_dbeat_reg_n_0,
      R => '0'
    );
sig_last_mmap_dbeat_reg_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => m_axi_mm2s_rlast,
      I1 => sig_next_cmd_cmplt_reg_i_3_n_0,
      O => sig_last_mmap_dbeat
    );
sig_last_mmap_dbeat_reg_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => '1',
      D => sig_last_mmap_dbeat,
      Q => \^sig_last_mmap_dbeat_reg_reg_0\,
      R => SS(0)
    );
sig_ld_new_cmd_reg_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => '1',
      D => \GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO_n_52\,
      Q => sig_ld_new_cmd_reg,
      R => '0'
    );
sig_next_calc_error_reg_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_push_dqual_reg,
      D => sig_cmd_fifo_data_out(52),
      Q => sig_next_calc_error_reg,
      R => sig_clr_dqual_reg
    );
sig_next_cmd_cmplt_reg_i_3: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00B00000"
    )
        port map (
      I0 => \^sig_data2addr_stop_req\,
      I1 => full,
      I2 => m_axi_mm2s_rvalid,
      I3 => \^sig_data2rsc_valid\,
      I4 => m_axi_mm2s_rready_INST_0_i_1_n_0,
      O => sig_next_cmd_cmplt_reg_i_3_n_0
    );
sig_next_cmd_cmplt_reg_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_push_dqual_reg,
      D => sig_cmd_fifo_data_out(51),
      Q => sig_next_cmd_cmplt_reg,
      R => sig_clr_dqual_reg
    );
sig_next_eof_reg_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_push_dqual_reg,
      D => sig_cmd_fifo_data_out(49),
      Q => sig_next_eof_reg,
      R => sig_clr_dqual_reg
    );
\sig_next_last_strb_reg_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_push_dqual_reg,
      D => sig_cmd_fifo_data_out(32),
      Q => sig_next_last_strb_reg(0),
      R => sig_clr_dqual_reg
    );
\sig_next_last_strb_reg_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_push_dqual_reg,
      D => sig_cmd_fifo_data_out(42),
      Q => sig_next_last_strb_reg(10),
      R => sig_clr_dqual_reg
    );
\sig_next_last_strb_reg_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_push_dqual_reg,
      D => sig_cmd_fifo_data_out(43),
      Q => sig_next_last_strb_reg(11),
      R => sig_clr_dqual_reg
    );
\sig_next_last_strb_reg_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_push_dqual_reg,
      D => sig_cmd_fifo_data_out(44),
      Q => sig_next_last_strb_reg(12),
      R => sig_clr_dqual_reg
    );
\sig_next_last_strb_reg_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_push_dqual_reg,
      D => sig_cmd_fifo_data_out(45),
      Q => sig_next_last_strb_reg(13),
      R => sig_clr_dqual_reg
    );
\sig_next_last_strb_reg_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_push_dqual_reg,
      D => sig_cmd_fifo_data_out(46),
      Q => sig_next_last_strb_reg(14),
      R => sig_clr_dqual_reg
    );
\sig_next_last_strb_reg_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_push_dqual_reg,
      D => sig_cmd_fifo_data_out(47),
      Q => sig_next_last_strb_reg(15),
      R => sig_clr_dqual_reg
    );
\sig_next_last_strb_reg_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_push_dqual_reg,
      D => sig_cmd_fifo_data_out(33),
      Q => sig_next_last_strb_reg(1),
      R => sig_clr_dqual_reg
    );
\sig_next_last_strb_reg_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_push_dqual_reg,
      D => sig_cmd_fifo_data_out(34),
      Q => sig_next_last_strb_reg(2),
      R => sig_clr_dqual_reg
    );
\sig_next_last_strb_reg_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_push_dqual_reg,
      D => sig_cmd_fifo_data_out(35),
      Q => sig_next_last_strb_reg(3),
      R => sig_clr_dqual_reg
    );
\sig_next_last_strb_reg_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_push_dqual_reg,
      D => sig_cmd_fifo_data_out(36),
      Q => sig_next_last_strb_reg(4),
      R => sig_clr_dqual_reg
    );
\sig_next_last_strb_reg_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_push_dqual_reg,
      D => sig_cmd_fifo_data_out(37),
      Q => sig_next_last_strb_reg(5),
      R => sig_clr_dqual_reg
    );
\sig_next_last_strb_reg_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_push_dqual_reg,
      D => sig_cmd_fifo_data_out(38),
      Q => sig_next_last_strb_reg(6),
      R => sig_clr_dqual_reg
    );
\sig_next_last_strb_reg_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_push_dqual_reg,
      D => sig_cmd_fifo_data_out(39),
      Q => sig_next_last_strb_reg(7),
      R => sig_clr_dqual_reg
    );
\sig_next_last_strb_reg_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_push_dqual_reg,
      D => sig_cmd_fifo_data_out(40),
      Q => sig_next_last_strb_reg(8),
      R => sig_clr_dqual_reg
    );
\sig_next_last_strb_reg_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_push_dqual_reg,
      D => sig_cmd_fifo_data_out(41),
      Q => sig_next_last_strb_reg(9),
      R => sig_clr_dqual_reg
    );
sig_next_sequential_reg_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_push_dqual_reg,
      D => sig_cmd_fifo_data_out(50),
      Q => sig_next_sequential_reg,
      R => sig_clr_dqual_reg
    );
\sig_next_strt_strb_reg_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_push_dqual_reg,
      D => sig_cmd_fifo_data_out(16),
      Q => sig_next_strt_strb_reg(0),
      R => sig_clr_dqual_reg
    );
\sig_next_strt_strb_reg_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_push_dqual_reg,
      D => sig_cmd_fifo_data_out(26),
      Q => sig_next_strt_strb_reg(10),
      R => sig_clr_dqual_reg
    );
\sig_next_strt_strb_reg_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_push_dqual_reg,
      D => sig_cmd_fifo_data_out(27),
      Q => sig_next_strt_strb_reg(11),
      R => sig_clr_dqual_reg
    );
\sig_next_strt_strb_reg_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_push_dqual_reg,
      D => sig_cmd_fifo_data_out(28),
      Q => sig_next_strt_strb_reg(12),
      R => sig_clr_dqual_reg
    );
\sig_next_strt_strb_reg_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_push_dqual_reg,
      D => sig_cmd_fifo_data_out(29),
      Q => sig_next_strt_strb_reg(13),
      R => sig_clr_dqual_reg
    );
\sig_next_strt_strb_reg_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_push_dqual_reg,
      D => sig_cmd_fifo_data_out(30),
      Q => sig_next_strt_strb_reg(14),
      R => sig_clr_dqual_reg
    );
\sig_next_strt_strb_reg_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_push_dqual_reg,
      D => sig_cmd_fifo_data_out(31),
      Q => sig_next_strt_strb_reg(15),
      R => sig_clr_dqual_reg
    );
\sig_next_strt_strb_reg_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_push_dqual_reg,
      D => sig_cmd_fifo_data_out(17),
      Q => sig_next_strt_strb_reg(1),
      R => sig_clr_dqual_reg
    );
\sig_next_strt_strb_reg_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_push_dqual_reg,
      D => sig_cmd_fifo_data_out(18),
      Q => sig_next_strt_strb_reg(2),
      R => sig_clr_dqual_reg
    );
\sig_next_strt_strb_reg_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_push_dqual_reg,
      D => sig_cmd_fifo_data_out(19),
      Q => sig_next_strt_strb_reg(3),
      R => sig_clr_dqual_reg
    );
\sig_next_strt_strb_reg_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_push_dqual_reg,
      D => sig_cmd_fifo_data_out(20),
      Q => sig_next_strt_strb_reg(4),
      R => sig_clr_dqual_reg
    );
\sig_next_strt_strb_reg_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_push_dqual_reg,
      D => sig_cmd_fifo_data_out(21),
      Q => sig_next_strt_strb_reg(5),
      R => sig_clr_dqual_reg
    );
\sig_next_strt_strb_reg_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_push_dqual_reg,
      D => sig_cmd_fifo_data_out(22),
      Q => sig_next_strt_strb_reg(6),
      R => sig_clr_dqual_reg
    );
\sig_next_strt_strb_reg_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_push_dqual_reg,
      D => sig_cmd_fifo_data_out(23),
      Q => sig_next_strt_strb_reg(7),
      R => sig_clr_dqual_reg
    );
\sig_next_strt_strb_reg_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_push_dqual_reg,
      D => sig_cmd_fifo_data_out(24),
      Q => sig_next_strt_strb_reg(8),
      R => sig_clr_dqual_reg
    );
\sig_next_strt_strb_reg_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => sig_push_dqual_reg,
      D => sig_cmd_fifo_data_out(25),
      Q => sig_next_strt_strb_reg(9),
      R => sig_clr_dqual_reg
    );
sig_rd_sts_interr_reg_i_3: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => sig_data2rsc_calc_err,
      I1 => sig_rd_sts_slverr_reg_reg(0),
      O => sig_rd_sts_interr_reg0
    );
sig_rd_sts_slverr_reg_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => sig_data2rsc_slverr,
      I1 => sig_rd_sts_slverr_reg_reg(1),
      O => sig_rd_sts_slverr_reg0
    );
sig_s_ready_dup_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00B00000"
    )
        port map (
      I0 => \^sig_halt_reg_dly3\,
      I1 => \^sig_halt_reg_dly2\,
      I2 => sig_stream_rst_reg_n,
      I3 => sig_sstrb_stop_mask(0),
      I4 => sig_s_ready_dup_reg,
      O => sig_halt_reg_dly3_reg_0
    );
\sig_sstrb_stop_mask[15]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AE"
    )
        port map (
      I0 => sig_sstrb_stop_mask(0),
      I1 => \^sig_halt_reg_dly2\,
      I2 => \^sig_halt_reg_dly3\,
      O => \sig_sstrb_stop_mask_reg[15]\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_sync is
  port (
    sleep : in STD_LOGIC;
    rst : in STD_LOGIC;
    wr_clk : in STD_LOGIC;
    wr_en : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 146 downto 0 );
    full : out STD_LOGIC;
    prog_full : out STD_LOGIC;
    wr_data_count : out STD_LOGIC_VECTOR ( 7 downto 0 );
    overflow : out STD_LOGIC;
    wr_rst_busy : out STD_LOGIC;
    almost_full : out STD_LOGIC;
    wr_ack : out STD_LOGIC;
    rd_en : in STD_LOGIC;
    dout : out STD_LOGIC_VECTOR ( 146 downto 0 );
    empty : out STD_LOGIC;
    prog_empty : out STD_LOGIC;
    rd_data_count : out STD_LOGIC_VECTOR ( 7 downto 0 );
    underflow : out STD_LOGIC;
    rd_rst_busy : out STD_LOGIC;
    almost_empty : out STD_LOGIC;
    data_valid : out STD_LOGIC;
    injectsbiterr : in STD_LOGIC;
    injectdbiterr : in STD_LOGIC;
    sbiterr : out STD_LOGIC;
    dbiterr : out STD_LOGIC
  );
  attribute CASCADE_HEIGHT : integer;
  attribute CASCADE_HEIGHT of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_sync : entity is 0;
  attribute DOUT_RESET_VALUE : string;
  attribute DOUT_RESET_VALUE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_sync : entity is "0";
  attribute ECC_MODE : string;
  attribute ECC_MODE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_sync : entity is "no_ecc";
  attribute EN_ADV_FEATURE_SYNC : string;
  attribute EN_ADV_FEATURE_SYNC of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_sync : entity is "16'b0001111100011111";
  attribute EN_SIM_ASSERT_ERR : string;
  attribute EN_SIM_ASSERT_ERR of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_sync : entity is "warning";
  attribute FIFO_MEMORY_TYPE : string;
  attribute FIFO_MEMORY_TYPE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_sync : entity is "block";
  attribute FIFO_READ_LATENCY : integer;
  attribute FIFO_READ_LATENCY of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_sync : entity is 0;
  attribute FIFO_WRITE_DEPTH : integer;
  attribute FIFO_WRITE_DEPTH of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_sync : entity is 128;
  attribute FULL_RESET_VALUE : integer;
  attribute FULL_RESET_VALUE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_sync : entity is 1;
  attribute PROG_EMPTY_THRESH : integer;
  attribute PROG_EMPTY_THRESH of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_sync : entity is 10;
  attribute PROG_FULL_THRESH : integer;
  attribute PROG_FULL_THRESH of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_sync : entity is 10;
  attribute P_COMMON_CLOCK : integer;
  attribute P_COMMON_CLOCK of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_sync : entity is 1;
  attribute P_ECC_MODE : integer;
  attribute P_ECC_MODE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_sync : entity is 0;
  attribute P_FIFO_MEMORY_TYPE : integer;
  attribute P_FIFO_MEMORY_TYPE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_sync : entity is 2;
  attribute P_READ_MODE : integer;
  attribute P_READ_MODE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_sync : entity is 1;
  attribute P_WAKEUP_TIME : integer;
  attribute P_WAKEUP_TIME of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_sync : entity is 2;
  attribute RD_DATA_COUNT_WIDTH : integer;
  attribute RD_DATA_COUNT_WIDTH of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_sync : entity is 8;
  attribute READ_DATA_WIDTH : integer;
  attribute READ_DATA_WIDTH of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_sync : entity is 147;
  attribute READ_MODE : string;
  attribute READ_MODE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_sync : entity is "fwft";
  attribute SIM_ASSERT_CHK : integer;
  attribute SIM_ASSERT_CHK of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_sync : entity is 0;
  attribute USE_ADV_FEATURES : string;
  attribute USE_ADV_FEATURES of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_sync : entity is "1F1F";
  attribute WAKEUP_TIME : integer;
  attribute WAKEUP_TIME of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_sync : entity is 0;
  attribute WRITE_DATA_WIDTH : integer;
  attribute WRITE_DATA_WIDTH of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_sync : entity is 147;
  attribute WR_DATA_COUNT_WIDTH : integer;
  attribute WR_DATA_COUNT_WIDTH of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_sync : entity is 8;
  attribute XPM_MODULE : string;
  attribute XPM_MODULE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_sync : entity is "TRUE";
  attribute keep_hierarchy : string;
  attribute keep_hierarchy of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_sync : entity is "soft";
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_sync;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_sync is
  signal NLW_xpm_fifo_base_inst_almost_empty_UNCONNECTED : STD_LOGIC;
  signal NLW_xpm_fifo_base_inst_almost_full_UNCONNECTED : STD_LOGIC;
  signal NLW_xpm_fifo_base_inst_data_valid_UNCONNECTED : STD_LOGIC;
  signal NLW_xpm_fifo_base_inst_dbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_xpm_fifo_base_inst_full_n_UNCONNECTED : STD_LOGIC;
  signal NLW_xpm_fifo_base_inst_overflow_UNCONNECTED : STD_LOGIC;
  signal NLW_xpm_fifo_base_inst_prog_empty_UNCONNECTED : STD_LOGIC;
  signal NLW_xpm_fifo_base_inst_prog_full_UNCONNECTED : STD_LOGIC;
  signal NLW_xpm_fifo_base_inst_rd_rst_busy_UNCONNECTED : STD_LOGIC;
  signal NLW_xpm_fifo_base_inst_sbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_xpm_fifo_base_inst_underflow_UNCONNECTED : STD_LOGIC;
  signal NLW_xpm_fifo_base_inst_wr_ack_UNCONNECTED : STD_LOGIC;
  signal NLW_xpm_fifo_base_inst_wr_rst_busy_UNCONNECTED : STD_LOGIC;
  signal NLW_xpm_fifo_base_inst_dout_UNCONNECTED : STD_LOGIC_VECTOR ( 146 to 146 );
  signal NLW_xpm_fifo_base_inst_rd_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_xpm_fifo_base_inst_wr_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute CASCADE_HEIGHT of xpm_fifo_base_inst : label is 0;
  attribute CDC_DEST_SYNC_FF : integer;
  attribute CDC_DEST_SYNC_FF of xpm_fifo_base_inst : label is 2;
  attribute COMMON_CLOCK : integer;
  attribute COMMON_CLOCK of xpm_fifo_base_inst : label is 1;
  attribute DOUT_RESET_VALUE of xpm_fifo_base_inst : label is "0";
  attribute ECC_MODE_integer : integer;
  attribute ECC_MODE_integer of xpm_fifo_base_inst : label is 0;
  attribute ENABLE_ECC : integer;
  attribute ENABLE_ECC of xpm_fifo_base_inst : label is 0;
  attribute EN_ADV_FEATURE : string;
  attribute EN_ADV_FEATURE of xpm_fifo_base_inst : label is "16'b0001111100011111";
  attribute EN_AE : string;
  attribute EN_AE of xpm_fifo_base_inst : label is "1'b1";
  attribute EN_AF : string;
  attribute EN_AF of xpm_fifo_base_inst : label is "1'b1";
  attribute EN_DVLD : string;
  attribute EN_DVLD of xpm_fifo_base_inst : label is "1'b1";
  attribute EN_OF : string;
  attribute EN_OF of xpm_fifo_base_inst : label is "1'b1";
  attribute EN_PE : string;
  attribute EN_PE of xpm_fifo_base_inst : label is "1'b1";
  attribute EN_PF : string;
  attribute EN_PF of xpm_fifo_base_inst : label is "1'b1";
  attribute EN_RDC : string;
  attribute EN_RDC of xpm_fifo_base_inst : label is "1'b1";
  attribute EN_SIM_ASSERT_ERR of xpm_fifo_base_inst : label is "warning";
  attribute EN_UF : string;
  attribute EN_UF of xpm_fifo_base_inst : label is "1'b1";
  attribute EN_WACK : string;
  attribute EN_WACK of xpm_fifo_base_inst : label is "1'b1";
  attribute EN_WDC : string;
  attribute EN_WDC of xpm_fifo_base_inst : label is "1'b1";
  attribute FG_EQ_ASYM_DOUT : string;
  attribute FG_EQ_ASYM_DOUT of xpm_fifo_base_inst : label is "1'b0";
  attribute FIFO_MEMORY_TYPE_integer : integer;
  attribute FIFO_MEMORY_TYPE_integer of xpm_fifo_base_inst : label is 2;
  attribute FIFO_MEM_TYPE : integer;
  attribute FIFO_MEM_TYPE of xpm_fifo_base_inst : label is 2;
  attribute FIFO_READ_DEPTH : integer;
  attribute FIFO_READ_DEPTH of xpm_fifo_base_inst : label is 128;
  attribute FIFO_READ_LATENCY of xpm_fifo_base_inst : label is 0;
  attribute FIFO_SIZE : integer;
  attribute FIFO_SIZE of xpm_fifo_base_inst : label is 18816;
  attribute FIFO_WRITE_DEPTH of xpm_fifo_base_inst : label is 128;
  attribute FULL_RESET_VALUE of xpm_fifo_base_inst : label is 1;
  attribute FULL_RST_VAL : string;
  attribute FULL_RST_VAL of xpm_fifo_base_inst : label is "1'b1";
  attribute KEEP_HIERARCHY of xpm_fifo_base_inst : label is "SOFT";
  attribute PE_THRESH_ADJ : integer;
  attribute PE_THRESH_ADJ of xpm_fifo_base_inst : label is 8;
  attribute PE_THRESH_MAX : integer;
  attribute PE_THRESH_MAX of xpm_fifo_base_inst : label is 123;
  attribute PE_THRESH_MIN : integer;
  attribute PE_THRESH_MIN of xpm_fifo_base_inst : label is 5;
  attribute PF_THRESH_ADJ : integer;
  attribute PF_THRESH_ADJ of xpm_fifo_base_inst : label is 8;
  attribute PF_THRESH_MAX : integer;
  attribute PF_THRESH_MAX of xpm_fifo_base_inst : label is 123;
  attribute PF_THRESH_MIN : integer;
  attribute PF_THRESH_MIN of xpm_fifo_base_inst : label is 5;
  attribute PROG_EMPTY_THRESH of xpm_fifo_base_inst : label is 10;
  attribute PROG_FULL_THRESH of xpm_fifo_base_inst : label is 10;
  attribute RD_DATA_COUNT_WIDTH of xpm_fifo_base_inst : label is 8;
  attribute RD_DC_WIDTH_EXT : integer;
  attribute RD_DC_WIDTH_EXT of xpm_fifo_base_inst : label is 8;
  attribute RD_LATENCY : integer;
  attribute RD_LATENCY of xpm_fifo_base_inst : label is 2;
  attribute RD_MODE : integer;
  attribute RD_MODE of xpm_fifo_base_inst : label is 1;
  attribute RD_PNTR_WIDTH : integer;
  attribute RD_PNTR_WIDTH of xpm_fifo_base_inst : label is 7;
  attribute READ_DATA_WIDTH of xpm_fifo_base_inst : label is 147;
  attribute READ_MODE_integer : integer;
  attribute READ_MODE_integer of xpm_fifo_base_inst : label is 1;
  attribute READ_MODE_LL : integer;
  attribute READ_MODE_LL of xpm_fifo_base_inst : label is 1;
  attribute RELATED_CLOCKS : integer;
  attribute RELATED_CLOCKS of xpm_fifo_base_inst : label is 0;
  attribute REMOVE_WR_RD_PROT_LOGIC : integer;
  attribute REMOVE_WR_RD_PROT_LOGIC of xpm_fifo_base_inst : label is 0;
  attribute SIM_ASSERT_CHK of xpm_fifo_base_inst : label is 0;
  attribute USE_ADV_FEATURES of xpm_fifo_base_inst : label is "1F1F";
  attribute VERSION : integer;
  attribute VERSION of xpm_fifo_base_inst : label is 0;
  attribute WAKEUP_TIME of xpm_fifo_base_inst : label is 0;
  attribute WIDTH_RATIO : integer;
  attribute WIDTH_RATIO of xpm_fifo_base_inst : label is 1;
  attribute WRITE_DATA_WIDTH of xpm_fifo_base_inst : label is 147;
  attribute WR_DATA_COUNT_WIDTH of xpm_fifo_base_inst : label is 8;
  attribute WR_DC_WIDTH_EXT : integer;
  attribute WR_DC_WIDTH_EXT of xpm_fifo_base_inst : label is 8;
  attribute WR_DEPTH_LOG : integer;
  attribute WR_DEPTH_LOG of xpm_fifo_base_inst : label is 7;
  attribute WR_PNTR_WIDTH : integer;
  attribute WR_PNTR_WIDTH of xpm_fifo_base_inst : label is 7;
  attribute WR_RD_RATIO : integer;
  attribute WR_RD_RATIO of xpm_fifo_base_inst : label is 0;
  attribute WR_WIDTH_LOG : integer;
  attribute WR_WIDTH_LOG of xpm_fifo_base_inst : label is 8;
  attribute XPM_MODULE of xpm_fifo_base_inst : label is "TRUE";
  attribute both_stages_valid : integer;
  attribute both_stages_valid of xpm_fifo_base_inst : label is 3;
  attribute invalid : integer;
  attribute invalid of xpm_fifo_base_inst : label is 0;
  attribute stage1_valid : integer;
  attribute stage1_valid of xpm_fifo_base_inst : label is 2;
  attribute stage2_valid : integer;
  attribute stage2_valid of xpm_fifo_base_inst : label is 1;
begin
xpm_fifo_base_inst: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_base
     port map (
      almost_empty => NLW_xpm_fifo_base_inst_almost_empty_UNCONNECTED,
      almost_full => NLW_xpm_fifo_base_inst_almost_full_UNCONNECTED,
      data_valid => NLW_xpm_fifo_base_inst_data_valid_UNCONNECTED,
      dbiterr => NLW_xpm_fifo_base_inst_dbiterr_UNCONNECTED,
      din(146) => '0',
      din(145 downto 0) => din(145 downto 0),
      dout(146) => NLW_xpm_fifo_base_inst_dout_UNCONNECTED(146),
      dout(145 downto 0) => dout(145 downto 0),
      empty => empty,
      full => full,
      full_n => NLW_xpm_fifo_base_inst_full_n_UNCONNECTED,
      injectdbiterr => '0',
      injectsbiterr => '0',
      overflow => NLW_xpm_fifo_base_inst_overflow_UNCONNECTED,
      prog_empty => NLW_xpm_fifo_base_inst_prog_empty_UNCONNECTED,
      prog_full => NLW_xpm_fifo_base_inst_prog_full_UNCONNECTED,
      rd_clk => '0',
      rd_data_count(7 downto 0) => NLW_xpm_fifo_base_inst_rd_data_count_UNCONNECTED(7 downto 0),
      rd_en => rd_en,
      rd_rst_busy => NLW_xpm_fifo_base_inst_rd_rst_busy_UNCONNECTED,
      rst => rst,
      sbiterr => NLW_xpm_fifo_base_inst_sbiterr_UNCONNECTED,
      sleep => sleep,
      underflow => NLW_xpm_fifo_base_inst_underflow_UNCONNECTED,
      wr_ack => NLW_xpm_fifo_base_inst_wr_ack_UNCONNECTED,
      wr_clk => wr_clk,
      wr_data_count(7 downto 2) => wr_data_count(7 downto 2),
      wr_data_count(1 downto 0) => NLW_xpm_fifo_base_inst_wr_data_count_UNCONNECTED(1 downto 0),
      wr_en => wr_en,
      wr_rst_busy => NLW_xpm_fifo_base_inst_wr_rst_busy_UNCONNECTED
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_datamover_sfifo_autord is
  port (
    full : out STD_LOGIC;
    dout : out STD_LOGIC_VECTOR ( 144 downto 0 );
    empty : out STD_LOGIC;
    \OMIT_UNPACKING.lsig_ld_cmd\ : out STD_LOGIC;
    \gwdc.wr_data_count_i_reg[5]\ : out STD_LOGIC;
    sig_slast_with_stop : out STD_LOGIC;
    \gen_fwft.empty_fwft_i_reg\ : out STD_LOGIC;
    SS : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_mm2s_aclk : in STD_LOGIC;
    wr_en : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 145 downto 0 );
    \out\ : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 0 to 0 );
    sig_last_skid_reg_reg : in STD_LOGIC;
    sig_ok_to_post_rd_addr_reg : in STD_LOGIC;
    sig_ok_to_post_rd_addr_reg_0 : in STD_LOGIC_VECTOR ( 5 downto 0 );
    sig_ok_to_post_rd_addr_reg_1 : in STD_LOGIC;
    sig_sstrb_stop_mask : in STD_LOGIC_VECTOR ( 0 to 0 );
    sig_ok_to_post_rd_addr_i_3_0 : in STD_LOGIC;
    sig_mmap_rst_reg_n : in STD_LOGIC
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_datamover_sfifo_autord;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_datamover_sfifo_autord is
  signal \^dout\ : STD_LOGIC_VECTOR ( 144 downto 0 );
  signal \^empty\ : STD_LOGIC;
  signal sig_data_fifo_data_out : STD_LOGIC_VECTOR ( 145 to 145 );
  signal sig_data_fifo_wr_cnt : STD_LOGIC_VECTOR ( 7 downto 2 );
  signal sig_ok_to_post_rd_addr_i_2_n_0 : STD_LOGIC;
  signal sig_ok_to_post_rd_addr_i_3_n_0 : STD_LOGIC;
  signal sig_ok_to_post_rd_addr_i_4_n_0 : STD_LOGIC;
  signal sig_ok_to_post_rd_addr_i_6_n_0 : STD_LOGIC;
  signal sig_pop_data_fifo : STD_LOGIC;
  signal \NLW_BLK_MEM.I_SYNC_FIFOGEN_FIFO_almost_empty_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_BLK_MEM.I_SYNC_FIFOGEN_FIFO_almost_full_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_BLK_MEM.I_SYNC_FIFOGEN_FIFO_data_valid_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_BLK_MEM.I_SYNC_FIFOGEN_FIFO_dbiterr_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_BLK_MEM.I_SYNC_FIFOGEN_FIFO_overflow_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_BLK_MEM.I_SYNC_FIFOGEN_FIFO_prog_empty_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_BLK_MEM.I_SYNC_FIFOGEN_FIFO_prog_full_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_BLK_MEM.I_SYNC_FIFOGEN_FIFO_rd_rst_busy_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_BLK_MEM.I_SYNC_FIFOGEN_FIFO_sbiterr_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_BLK_MEM.I_SYNC_FIFOGEN_FIFO_underflow_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_BLK_MEM.I_SYNC_FIFOGEN_FIFO_wr_ack_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_BLK_MEM.I_SYNC_FIFOGEN_FIFO_wr_rst_busy_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_BLK_MEM.I_SYNC_FIFOGEN_FIFO_dout_UNCONNECTED\ : STD_LOGIC_VECTOR ( 146 to 146 );
  signal \NLW_BLK_MEM.I_SYNC_FIFOGEN_FIFO_rd_data_count_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_BLK_MEM.I_SYNC_FIFOGEN_FIFO_wr_data_count_UNCONNECTED\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute CASCADE_HEIGHT : integer;
  attribute CASCADE_HEIGHT of \BLK_MEM.I_SYNC_FIFOGEN_FIFO\ : label is 0;
  attribute DOUT_RESET_VALUE : string;
  attribute DOUT_RESET_VALUE of \BLK_MEM.I_SYNC_FIFOGEN_FIFO\ : label is "0";
  attribute ECC_MODE : integer;
  attribute ECC_MODE of \BLK_MEM.I_SYNC_FIFOGEN_FIFO\ : label is 0;
  attribute EN_ADV_FEATURE_SYNC : string;
  attribute EN_ADV_FEATURE_SYNC of \BLK_MEM.I_SYNC_FIFOGEN_FIFO\ : label is "16'b0001111100011111";
  attribute EN_SIM_ASSERT_ERR : string;
  attribute EN_SIM_ASSERT_ERR of \BLK_MEM.I_SYNC_FIFOGEN_FIFO\ : label is "warning";
  attribute FIFO_MEMORY_TYPE : integer;
  attribute FIFO_MEMORY_TYPE of \BLK_MEM.I_SYNC_FIFOGEN_FIFO\ : label is 0;
  attribute FIFO_READ_LATENCY : integer;
  attribute FIFO_READ_LATENCY of \BLK_MEM.I_SYNC_FIFOGEN_FIFO\ : label is 0;
  attribute FIFO_WRITE_DEPTH : integer;
  attribute FIFO_WRITE_DEPTH of \BLK_MEM.I_SYNC_FIFOGEN_FIFO\ : label is 128;
  attribute FULL_RESET_VALUE : integer;
  attribute FULL_RESET_VALUE of \BLK_MEM.I_SYNC_FIFOGEN_FIFO\ : label is 1;
  attribute PROG_EMPTY_THRESH : integer;
  attribute PROG_EMPTY_THRESH of \BLK_MEM.I_SYNC_FIFOGEN_FIFO\ : label is 10;
  attribute PROG_FULL_THRESH : integer;
  attribute PROG_FULL_THRESH of \BLK_MEM.I_SYNC_FIFOGEN_FIFO\ : label is 10;
  attribute P_COMMON_CLOCK : integer;
  attribute P_COMMON_CLOCK of \BLK_MEM.I_SYNC_FIFOGEN_FIFO\ : label is 1;
  attribute P_ECC_MODE : integer;
  attribute P_ECC_MODE of \BLK_MEM.I_SYNC_FIFOGEN_FIFO\ : label is 0;
  attribute P_FIFO_MEMORY_TYPE : integer;
  attribute P_FIFO_MEMORY_TYPE of \BLK_MEM.I_SYNC_FIFOGEN_FIFO\ : label is 2;
  attribute P_READ_MODE : integer;
  attribute P_READ_MODE of \BLK_MEM.I_SYNC_FIFOGEN_FIFO\ : label is 1;
  attribute P_WAKEUP_TIME : integer;
  attribute P_WAKEUP_TIME of \BLK_MEM.I_SYNC_FIFOGEN_FIFO\ : label is 2;
  attribute RD_DATA_COUNT_WIDTH : integer;
  attribute RD_DATA_COUNT_WIDTH of \BLK_MEM.I_SYNC_FIFOGEN_FIFO\ : label is 8;
  attribute READ_DATA_WIDTH : integer;
  attribute READ_DATA_WIDTH of \BLK_MEM.I_SYNC_FIFOGEN_FIFO\ : label is 147;
  attribute READ_MODE : integer;
  attribute READ_MODE of \BLK_MEM.I_SYNC_FIFOGEN_FIFO\ : label is 0;
  attribute SIM_ASSERT_CHK : integer;
  attribute SIM_ASSERT_CHK of \BLK_MEM.I_SYNC_FIFOGEN_FIFO\ : label is 0;
  attribute USE_ADV_FEATURES : string;
  attribute USE_ADV_FEATURES of \BLK_MEM.I_SYNC_FIFOGEN_FIFO\ : label is "1F1F";
  attribute WAKEUP_TIME : integer;
  attribute WAKEUP_TIME of \BLK_MEM.I_SYNC_FIFOGEN_FIFO\ : label is 0;
  attribute WRITE_DATA_WIDTH : integer;
  attribute WRITE_DATA_WIDTH of \BLK_MEM.I_SYNC_FIFOGEN_FIFO\ : label is 147;
  attribute WR_DATA_COUNT_WIDTH : integer;
  attribute WR_DATA_COUNT_WIDTH of \BLK_MEM.I_SYNC_FIFOGEN_FIFO\ : label is 8;
  attribute XPM_MODULE : string;
  attribute XPM_MODULE of \BLK_MEM.I_SYNC_FIFOGEN_FIFO\ : label is "TRUE";
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \BLK_MEM.I_SYNC_FIFOGEN_FIFO_i_21\ : label is "soft_lutpair32";
  attribute SOFT_HLUTNM of \OMIT_UNPACKING.lsig_cmd_loaded_i_1\ : label is "soft_lutpair31";
  attribute SOFT_HLUTNM of \addr_i[2]_i_3\ : label is "soft_lutpair31";
  attribute SOFT_HLUTNM of sig_last_skid_reg_i_1 : label is "soft_lutpair32";
begin
  dout(144 downto 0) <= \^dout\(144 downto 0);
  empty <= \^empty\;
\BLK_MEM.I_SYNC_FIFOGEN_FIFO\: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_sync
     port map (
      almost_empty => \NLW_BLK_MEM.I_SYNC_FIFOGEN_FIFO_almost_empty_UNCONNECTED\,
      almost_full => \NLW_BLK_MEM.I_SYNC_FIFOGEN_FIFO_almost_full_UNCONNECTED\,
      data_valid => \NLW_BLK_MEM.I_SYNC_FIFOGEN_FIFO_data_valid_UNCONNECTED\,
      dbiterr => \NLW_BLK_MEM.I_SYNC_FIFOGEN_FIFO_dbiterr_UNCONNECTED\,
      din(146) => '0',
      din(145 downto 0) => din(145 downto 0),
      dout(146) => \NLW_BLK_MEM.I_SYNC_FIFOGEN_FIFO_dout_UNCONNECTED\(146),
      dout(145) => sig_data_fifo_data_out(145),
      dout(144 downto 0) => \^dout\(144 downto 0),
      empty => \^empty\,
      full => full,
      injectdbiterr => '0',
      injectsbiterr => '0',
      overflow => \NLW_BLK_MEM.I_SYNC_FIFOGEN_FIFO_overflow_UNCONNECTED\,
      prog_empty => \NLW_BLK_MEM.I_SYNC_FIFOGEN_FIFO_prog_empty_UNCONNECTED\,
      prog_full => \NLW_BLK_MEM.I_SYNC_FIFOGEN_FIFO_prog_full_UNCONNECTED\,
      rd_data_count(7 downto 0) => \NLW_BLK_MEM.I_SYNC_FIFOGEN_FIFO_rd_data_count_UNCONNECTED\(7 downto 0),
      rd_en => sig_pop_data_fifo,
      rd_rst_busy => \NLW_BLK_MEM.I_SYNC_FIFOGEN_FIFO_rd_rst_busy_UNCONNECTED\,
      rst => SS(0),
      sbiterr => \NLW_BLK_MEM.I_SYNC_FIFOGEN_FIFO_sbiterr_UNCONNECTED\,
      sleep => '0',
      underflow => \NLW_BLK_MEM.I_SYNC_FIFOGEN_FIFO_underflow_UNCONNECTED\,
      wr_ack => \NLW_BLK_MEM.I_SYNC_FIFOGEN_FIFO_wr_ack_UNCONNECTED\,
      wr_clk => m_axi_mm2s_aclk,
      wr_data_count(7 downto 2) => sig_data_fifo_wr_cnt(7 downto 2),
      wr_data_count(1 downto 0) => \NLW_BLK_MEM.I_SYNC_FIFOGEN_FIFO_wr_data_count_UNCONNECTED\(1 downto 0),
      wr_en => wr_en,
      wr_rst_busy => \NLW_BLK_MEM.I_SYNC_FIFOGEN_FIFO_wr_rst_busy_UNCONNECTED\
    );
\BLK_MEM.I_SYNC_FIFOGEN_FIFO_i_21\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => \out\,
      I1 => sig_last_skid_reg_reg,
      I2 => \^empty\,
      O => sig_pop_data_fifo
    );
\OMIT_UNPACKING.lsig_cmd_loaded_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BFFF00FF"
    )
        port map (
      I0 => \^empty\,
      I1 => sig_data_fifo_data_out(145),
      I2 => \out\,
      I3 => Q(0),
      I4 => sig_last_skid_reg_reg,
      O => \gen_fwft.empty_fwft_i_reg\
    );
\addr_i[2]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"002000FF"
    )
        port map (
      I0 => \out\,
      I1 => \^empty\,
      I2 => sig_data_fifo_data_out(145),
      I3 => Q(0),
      I4 => sig_last_skid_reg_reg,
      O => \OMIT_UNPACKING.lsig_ld_cmd\
    );
sig_last_skid_reg_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FF40"
    )
        port map (
      I0 => \^empty\,
      I1 => sig_last_skid_reg_reg,
      I2 => \^dout\(144),
      I3 => sig_sstrb_stop_mask(0),
      O => sig_slast_with_stop
    );
sig_ok_to_post_rd_addr_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"23332223"
    )
        port map (
      I0 => sig_ok_to_post_rd_addr_i_2_n_0,
      I1 => sig_ok_to_post_rd_addr_i_3_n_0,
      I2 => sig_data_fifo_wr_cnt(5),
      I3 => sig_ok_to_post_rd_addr_i_4_n_0,
      I4 => sig_ok_to_post_rd_addr_reg,
      O => \gwdc.wr_data_count_i_reg[5]\
    );
sig_ok_to_post_rd_addr_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000FFFE0001"
    )
        port map (
      I0 => sig_ok_to_post_rd_addr_reg_0(0),
      I1 => sig_ok_to_post_rd_addr_reg_0(1),
      I2 => sig_ok_to_post_rd_addr_reg_0(3),
      I3 => sig_ok_to_post_rd_addr_reg_0(2),
      I4 => sig_ok_to_post_rd_addr_reg_0(4),
      I5 => sig_data_fifo_wr_cnt(6),
      O => sig_ok_to_post_rd_addr_i_2_n_0
    );
sig_ok_to_post_rd_addr_i_3: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FEBFFEAB"
    )
        port map (
      I0 => sig_ok_to_post_rd_addr_i_6_n_0,
      I1 => sig_ok_to_post_rd_addr_reg_0(4),
      I2 => sig_ok_to_post_rd_addr_reg_1,
      I3 => sig_ok_to_post_rd_addr_reg_0(5),
      I4 => sig_data_fifo_wr_cnt(6),
      O => sig_ok_to_post_rd_addr_i_3_n_0
    );
sig_ok_to_post_rd_addr_i_4: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A0FAE0FEF0FFF880"
    )
        port map (
      I0 => sig_data_fifo_wr_cnt(3),
      I1 => sig_data_fifo_wr_cnt(2),
      I2 => sig_data_fifo_wr_cnt(4),
      I3 => sig_ok_to_post_rd_addr_reg_0(2),
      I4 => sig_ok_to_post_rd_addr_reg_0(0),
      I5 => sig_ok_to_post_rd_addr_reg_0(1),
      O => sig_ok_to_post_rd_addr_i_4_n_0
    );
sig_ok_to_post_rd_addr_i_6: unisim.vcomponents.LUT3
    generic map(
      INIT => X"EF"
    )
        port map (
      I0 => sig_data_fifo_wr_cnt(7),
      I1 => sig_ok_to_post_rd_addr_i_3_0,
      I2 => sig_mmap_rst_reg_n,
      O => sig_ok_to_post_rd_addr_i_6_n_0
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_datamover_rd_sf is
  port (
    full : out STD_LOGIC;
    dout : out STD_LOGIC_VECTOR ( 144 downto 0 );
    empty : out STD_LOGIC;
    FIFO_Full_reg : out STD_LOGIC;
    sig_init_done : out STD_LOGIC;
    sig_sf_allow_addr_req : out STD_LOGIC;
    \OMIT_UNPACKING.lsig_cmd_loaded\ : out STD_LOGIC;
    sig_inhibit_rdy_n_reg : out STD_LOGIC;
    sig_inhibit_rdy_n : out STD_LOGIC;
    sig_slast_with_stop : out STD_LOGIC;
    SS : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_mm2s_aclk : in STD_LOGIC;
    wr_en : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 145 downto 0 );
    sig_init_done_reg : in STD_LOGIC;
    sig_mstr2sf_cmd_valid : in STD_LOGIC;
    \out\ : in STD_LOGIC;
    \sig_token_cntr_reg[1]_0\ : in STD_LOGIC;
    \sig_token_cntr_reg[1]_1\ : in STD_LOGIC;
    sig_sstrb_stop_mask : in STD_LOGIC_VECTOR ( 0 to 0 );
    sig_mmap_rst_reg_n : in STD_LOGIC
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_datamover_rd_sf;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_datamover_rd_sf is
  signal I_DATA_FIFO_n_148 : STD_LOGIC;
  signal I_DATA_FIFO_n_150 : STD_LOGIC;
  signal \OMIT_DRE_CNTL.I_DRE_CNTL_FIFO_n_2\ : STD_LOGIC;
  signal \^omit_unpacking.lsig_cmd_loaded\ : STD_LOGIC;
  signal \OMIT_UNPACKING.lsig_ld_cmd\ : STD_LOGIC;
  signal sig_ok_to_post_rd_addr_i_5_n_0 : STD_LOGIC;
  signal sig_ok_to_post_rd_addr_i_7_n_0 : STD_LOGIC;
  signal \sig_token_cntr[0]_i_1_n_0\ : STD_LOGIC;
  signal \sig_token_cntr[1]_i_1_n_0\ : STD_LOGIC;
  signal \sig_token_cntr[2]_i_1_n_0\ : STD_LOGIC;
  signal \sig_token_cntr[3]_i_1_n_0\ : STD_LOGIC;
  signal \sig_token_cntr[4]_i_1_n_0\ : STD_LOGIC;
  signal \sig_token_cntr[4]_i_2_n_0\ : STD_LOGIC;
  signal \sig_token_cntr[5]_i_1_n_0\ : STD_LOGIC;
  signal \sig_token_cntr[5]_i_2_n_0\ : STD_LOGIC;
  signal \sig_token_cntr[5]_i_3_n_0\ : STD_LOGIC;
  signal \sig_token_cntr[5]_i_4_n_0\ : STD_LOGIC;
  signal \sig_token_cntr[5]_i_5_n_0\ : STD_LOGIC;
  signal sig_token_cntr_reg : STD_LOGIC_VECTOR ( 5 downto 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of sig_ok_to_post_rd_addr_i_5 : label is "soft_lutpair36";
  attribute SOFT_HLUTNM of sig_ok_to_post_rd_addr_i_7 : label is "soft_lutpair34";
  attribute SOFT_HLUTNM of \sig_token_cntr[0]_i_1\ : label is "soft_lutpair36";
  attribute SOFT_HLUTNM of \sig_token_cntr[2]_i_1\ : label is "soft_lutpair35";
  attribute SOFT_HLUTNM of \sig_token_cntr[3]_i_1\ : label is "soft_lutpair35";
  attribute SOFT_HLUTNM of \sig_token_cntr[5]_i_3\ : label is "soft_lutpair34";
begin
  \OMIT_UNPACKING.lsig_cmd_loaded\ <= \^omit_unpacking.lsig_cmd_loaded\;
I_DATA_FIFO: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_datamover_sfifo_autord
     port map (
      \OMIT_UNPACKING.lsig_ld_cmd\ => \OMIT_UNPACKING.lsig_ld_cmd\,
      Q(0) => \OMIT_DRE_CNTL.I_DRE_CNTL_FIFO_n_2\,
      SS(0) => SS(0),
      din(145 downto 0) => din(145 downto 0),
      dout(144 downto 0) => dout(144 downto 0),
      empty => empty,
      full => full,
      \gen_fwft.empty_fwft_i_reg\ => I_DATA_FIFO_n_150,
      \gwdc.wr_data_count_i_reg[5]\ => I_DATA_FIFO_n_148,
      m_axi_mm2s_aclk => m_axi_mm2s_aclk,
      \out\ => \out\,
      sig_last_skid_reg_reg => \^omit_unpacking.lsig_cmd_loaded\,
      sig_mmap_rst_reg_n => sig_mmap_rst_reg_n,
      sig_ok_to_post_rd_addr_i_3_0 => \sig_token_cntr_reg[1]_0\,
      sig_ok_to_post_rd_addr_reg => sig_ok_to_post_rd_addr_i_5_n_0,
      sig_ok_to_post_rd_addr_reg_0(5 downto 0) => sig_token_cntr_reg(5 downto 0),
      sig_ok_to_post_rd_addr_reg_1 => sig_ok_to_post_rd_addr_i_7_n_0,
      sig_slast_with_stop => sig_slast_with_stop,
      sig_sstrb_stop_mask(0) => sig_sstrb_stop_mask(0),
      wr_en => wr_en
    );
\OMIT_DRE_CNTL.I_DRE_CNTL_FIFO\: entity work.\decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_datamover_fifo__parameterized3\
     port map (
      FIFO_Full_reg => FIFO_Full_reg,
      \OMIT_UNPACKING.lsig_ld_cmd\ => \OMIT_UNPACKING.lsig_ld_cmd\,
      Q(0) => \OMIT_DRE_CNTL.I_DRE_CNTL_FIFO_n_2\,
      SS(0) => SS(0),
      m_axi_mm2s_aclk => m_axi_mm2s_aclk,
      sig_inhibit_rdy_n_reg_0 => sig_inhibit_rdy_n_reg,
      sig_inhibit_rdy_n_reg_1 => sig_inhibit_rdy_n,
      sig_init_done => sig_init_done,
      sig_init_done_reg_0 => sig_init_done_reg,
      sig_mstr2sf_cmd_valid => sig_mstr2sf_cmd_valid
    );
\OMIT_UNPACKING.lsig_cmd_loaded_reg\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => '1',
      D => I_DATA_FIFO_n_150,
      Q => \^omit_unpacking.lsig_cmd_loaded\,
      R => SS(0)
    );
sig_ok_to_post_rd_addr_i_5: unisim.vcomponents.LUT4
    generic map(
      INIT => X"CCC9"
    )
        port map (
      I0 => sig_token_cntr_reg(2),
      I1 => sig_token_cntr_reg(3),
      I2 => sig_token_cntr_reg(1),
      I3 => sig_token_cntr_reg(0),
      O => sig_ok_to_post_rd_addr_i_5_n_0
    );
sig_ok_to_post_rd_addr_i_7: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => sig_token_cntr_reg(2),
      I1 => sig_token_cntr_reg(3),
      I2 => sig_token_cntr_reg(1),
      I3 => sig_token_cntr_reg(0),
      O => sig_ok_to_post_rd_addr_i_7_n_0
    );
sig_ok_to_post_rd_addr_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => '1',
      D => I_DATA_FIFO_n_148,
      Q => sig_sf_allow_addr_req,
      R => '0'
    );
\sig_token_cntr[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => sig_token_cntr_reg(0),
      O => \sig_token_cntr[0]_i_1_n_0\
    );
\sig_token_cntr[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9969966699999999"
    )
        port map (
      I0 => sig_token_cntr_reg(1),
      I1 => sig_token_cntr_reg(0),
      I2 => \sig_token_cntr[5]_i_3_n_0\,
      I3 => \sig_token_cntr_reg[1]_0\,
      I4 => sig_token_cntr_reg(5),
      I5 => \sig_token_cntr_reg[1]_1\,
      O => \sig_token_cntr[1]_i_1_n_0\
    );
\sig_token_cntr[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"BD42"
    )
        port map (
      I0 => \sig_token_cntr[4]_i_2_n_0\,
      I1 => sig_token_cntr_reg(0),
      I2 => sig_token_cntr_reg(1),
      I3 => sig_token_cntr_reg(2),
      O => \sig_token_cntr[2]_i_1_n_0\
    );
\sig_token_cntr[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AA6AA9AA"
    )
        port map (
      I0 => sig_token_cntr_reg(3),
      I1 => sig_token_cntr_reg(1),
      I2 => sig_token_cntr_reg(0),
      I3 => \sig_token_cntr[4]_i_2_n_0\,
      I4 => sig_token_cntr_reg(2),
      O => \sig_token_cntr[3]_i_1_n_0\
    );
\sig_token_cntr[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"DFFFFFFB20000004"
    )
        port map (
      I0 => sig_token_cntr_reg(2),
      I1 => \sig_token_cntr[4]_i_2_n_0\,
      I2 => sig_token_cntr_reg(0),
      I3 => sig_token_cntr_reg(1),
      I4 => sig_token_cntr_reg(3),
      I5 => sig_token_cntr_reg(4),
      O => \sig_token_cntr[4]_i_1_n_0\
    );
\sig_token_cntr[4]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F5DD"
    )
        port map (
      I0 => \sig_token_cntr_reg[1]_1\,
      I1 => sig_token_cntr_reg(5),
      I2 => \sig_token_cntr_reg[1]_0\,
      I3 => \sig_token_cntr[5]_i_3_n_0\,
      O => \sig_token_cntr[4]_i_2_n_0\
    );
\sig_token_cntr[5]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"3DE0"
    )
        port map (
      I0 => sig_token_cntr_reg(5),
      I1 => \sig_token_cntr[5]_i_3_n_0\,
      I2 => \sig_token_cntr_reg[1]_0\,
      I3 => \sig_token_cntr_reg[1]_1\,
      O => \sig_token_cntr[5]_i_1_n_0\
    );
\sig_token_cntr[5]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"77FFFFFA88000005"
    )
        port map (
      I0 => sig_token_cntr_reg(2),
      I1 => \sig_token_cntr[5]_i_4_n_0\,
      I2 => \sig_token_cntr[5]_i_5_n_0\,
      I3 => sig_token_cntr_reg(3),
      I4 => sig_token_cntr_reg(4),
      I5 => sig_token_cntr_reg(5),
      O => \sig_token_cntr[5]_i_2_n_0\
    );
\sig_token_cntr[5]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => sig_token_cntr_reg(0),
      I1 => sig_token_cntr_reg(1),
      I2 => sig_token_cntr_reg(3),
      I3 => sig_token_cntr_reg(2),
      I4 => sig_token_cntr_reg(4),
      O => \sig_token_cntr[5]_i_3_n_0\
    );
\sig_token_cntr[5]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0080088800000000"
    )
        port map (
      I0 => sig_token_cntr_reg(1),
      I1 => sig_token_cntr_reg(0),
      I2 => \sig_token_cntr[5]_i_3_n_0\,
      I3 => \sig_token_cntr_reg[1]_0\,
      I4 => sig_token_cntr_reg(5),
      I5 => \sig_token_cntr_reg[1]_1\,
      O => \sig_token_cntr[5]_i_4_n_0\
    );
\sig_token_cntr[5]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EEFEEFFFEEEEEEEE"
    )
        port map (
      I0 => sig_token_cntr_reg(1),
      I1 => sig_token_cntr_reg(0),
      I2 => \sig_token_cntr[5]_i_3_n_0\,
      I3 => \sig_token_cntr_reg[1]_0\,
      I4 => sig_token_cntr_reg(5),
      I5 => \sig_token_cntr_reg[1]_1\,
      O => \sig_token_cntr[5]_i_5_n_0\
    );
\sig_token_cntr_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => \sig_token_cntr[5]_i_1_n_0\,
      D => \sig_token_cntr[0]_i_1_n_0\,
      Q => sig_token_cntr_reg(0),
      R => SS(0)
    );
\sig_token_cntr_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => \sig_token_cntr[5]_i_1_n_0\,
      D => \sig_token_cntr[1]_i_1_n_0\,
      Q => sig_token_cntr_reg(1),
      R => SS(0)
    );
\sig_token_cntr_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => \sig_token_cntr[5]_i_1_n_0\,
      D => \sig_token_cntr[2]_i_1_n_0\,
      Q => sig_token_cntr_reg(2),
      R => SS(0)
    );
\sig_token_cntr_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => \sig_token_cntr[5]_i_1_n_0\,
      D => \sig_token_cntr[3]_i_1_n_0\,
      Q => sig_token_cntr_reg(3),
      R => SS(0)
    );
\sig_token_cntr_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => \sig_token_cntr[5]_i_1_n_0\,
      D => \sig_token_cntr[4]_i_1_n_0\,
      Q => sig_token_cntr_reg(4),
      R => SS(0)
    );
\sig_token_cntr_reg[5]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axi_mm2s_aclk,
      CE => \sig_token_cntr[5]_i_1_n_0\,
      D => \sig_token_cntr[5]_i_2_n_0\,
      Q => sig_token_cntr_reg(5),
      S => SS(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_datamover_mm2s_full_wrap is
  port (
    m_axis_mm2s_tvalid : out STD_LOGIC;
    sig_rst2all_stop_request : out STD_LOGIC;
    m_axi_mm2s_arsize : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_mm2s_arburst : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_mm2s_arvalid : out STD_LOGIC;
    m_axis_mm2s_tlast : out STD_LOGIC;
    s_axis_mm2s_cmd_tready : out STD_LOGIC;
    \USE_SINGLE_REG.sig_regfifo_full_reg_reg\ : out STD_LOGIC;
    mm2s_decerr_i : out STD_LOGIC;
    mm2s_interr_i : out STD_LOGIC;
    mm2s_slverr_i : out STD_LOGIC;
    m_axi_mm2s_rready : out STD_LOGIC;
    mm2s_halt_cmplt : out STD_LOGIC;
    m_axi_mm2s_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_mm2s_arlen : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axis_mm2s_tdata : out STD_LOGIC_VECTOR ( 127 downto 0 );
    m_axis_mm2s_tkeep : out STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axi_mm2s_aclk : in STD_LOGIC;
    m_axi_mm2s_rdata : in STD_LOGIC_VECTOR ( 127 downto 0 );
    \out\ : in STD_LOGIC;
    sig_s_h_halt_reg_reg : in STD_LOGIC;
    mm2s_sts_received : in STD_LOGIC;
    m_axis_mm2s_sts_tready : in STD_LOGIC;
    s_axis_mm2s_cmd_tvalid_split : in STD_LOGIC;
    m_axi_mm2s_rlast : in STD_LOGIC;
    m_axi_mm2s_rvalid : in STD_LOGIC;
    m_axi_mm2s_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axis_mm2s_tready : in STD_LOGIC;
    m_axi_mm2s_arready : in STD_LOGIC;
    D : in STD_LOGIC_VECTOR ( 47 downto 0 )
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_datamover_mm2s_full_wrap;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_datamover_mm2s_full_wrap is
  signal \ENABLE_AXIS_SKID.I_MM2S_SKID_BUF_n_4\ : STD_LOGIC;
  signal \GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/sig_inhibit_rdy_n\ : STD_LOGIC;
  signal \GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/USE_SRL_FIFO.sig_wr_fifo\ : STD_LOGIC;
  signal \GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/sig_inhibit_rdy_n\ : STD_LOGIC;
  signal \GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/sig_init_done\ : STD_LOGIC;
  signal \GEN_INCLUDE_MM2S_SF.I_RD_SF_n_146\ : STD_LOGIC;
  signal \GEN_INCLUDE_MM2S_SF.I_RD_SF_n_147\ : STD_LOGIC;
  signal \GEN_INCLUDE_MM2S_SF.I_RD_SF_n_151\ : STD_LOGIC;
  signal I_ADDR_CNTL_n_0 : STD_LOGIC;
  signal I_ADDR_CNTL_n_2 : STD_LOGIC;
  signal I_ADDR_CNTL_n_9 : STD_LOGIC;
  signal \I_CMD_FIFO/USE_SINGLE_REG.sig_push_regfifo\ : STD_LOGIC;
  signal I_CMD_STATUS_n_24 : STD_LOGIC;
  signal I_CMD_STATUS_n_25 : STD_LOGIC;
  signal I_CMD_STATUS_n_26 : STD_LOGIC;
  signal I_CMD_STATUS_n_27 : STD_LOGIC;
  signal I_CMD_STATUS_n_28 : STD_LOGIC;
  signal I_CMD_STATUS_n_29 : STD_LOGIC;
  signal I_CMD_STATUS_n_30 : STD_LOGIC;
  signal I_CMD_STATUS_n_31 : STD_LOGIC;
  signal I_CMD_STATUS_n_32 : STD_LOGIC;
  signal I_CMD_STATUS_n_33 : STD_LOGIC;
  signal I_CMD_STATUS_n_34 : STD_LOGIC;
  signal I_CMD_STATUS_n_35 : STD_LOGIC;
  signal I_CMD_STATUS_n_36 : STD_LOGIC;
  signal I_CMD_STATUS_n_37 : STD_LOGIC;
  signal I_CMD_STATUS_n_38 : STD_LOGIC;
  signal I_CMD_STATUS_n_39 : STD_LOGIC;
  signal I_MSTR_PCC_n_41 : STD_LOGIC;
  signal I_MSTR_PCC_n_42 : STD_LOGIC;
  signal I_MSTR_PCC_n_43 : STD_LOGIC;
  signal I_RD_DATA_CNTL_n_0 : STD_LOGIC;
  signal I_RD_DATA_CNTL_n_2 : STD_LOGIC;
  signal I_RD_DATA_CNTL_n_32 : STD_LOGIC;
  signal I_RD_DATA_CNTL_n_33 : STD_LOGIC;
  signal I_RD_DATA_CNTL_n_34 : STD_LOGIC;
  signal I_RESET_n_5 : STD_LOGIC;
  signal I_RESET_n_6 : STD_LOGIC;
  signal \OMIT_DRE_CNTL.I_DRE_CNTL_FIFO/sig_inhibit_rdy_n\ : STD_LOGIC;
  signal \OMIT_DRE_CNTL.I_DRE_CNTL_FIFO/sig_init_done\ : STD_LOGIC;
  signal \OMIT_DRE_CNTL.I_DRE_CNTL_FIFO/sig_init_reg\ : STD_LOGIC;
  signal \OMIT_DRE_CNTL.I_DRE_CNTL_FIFO/sig_init_reg2\ : STD_LOGIC;
  signal \OMIT_UNPACKING.lsig_cmd_loaded\ : STD_LOGIC;
  signal data : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal sig_addr2data_addr_posted : STD_LOGIC;
  signal sig_addr2rsc_calc_error : STD_LOGIC;
  signal sig_addr_reg_empty : STD_LOGIC;
  signal sig_calc_error_reg : STD_LOGIC;
  signal sig_cmd2mstr_cmd_valid : STD_LOGIC;
  signal sig_cmd2mstr_command : STD_LOGIC_VECTOR ( 13 downto 0 );
  signal sig_cmd_eof_slice : STD_LOGIC;
  signal sig_cmd_stat_rst_int : STD_LOGIC;
  signal sig_cmd_stat_rst_int_reg_n : STD_LOGIC;
  signal sig_cmd_type_slice : STD_LOGIC;
  signal sig_data2addr_stop_req : STD_LOGIC;
  signal sig_data2rsc_decerr : STD_LOGIC;
  signal sig_data2rsc_valid : STD_LOGIC;
  signal sig_data2sf_cmd_cmplt : STD_LOGIC;
  signal sig_data_fifo_data_out : STD_LOGIC_VECTOR ( 144 to 144 );
  signal sig_data_fifo_full : STD_LOGIC;
  signal sig_good_sin_strm_dbeat : STD_LOGIC;
  signal sig_halt_reg_dly2 : STD_LOGIC;
  signal sig_halt_reg_dly3 : STD_LOGIC;
  signal sig_mmap_rst : STD_LOGIC;
  signal sig_mmap_rst_reg_n : STD_LOGIC;
  signal sig_mstr2addr_addr : STD_LOGIC_VECTOR ( 31 downto 5 );
  signal sig_mstr2addr_burst : STD_LOGIC_VECTOR ( 0 to 0 );
  signal sig_mstr2addr_cmd_valid : STD_LOGIC;
  signal sig_mstr2data_cmd_cmplt : STD_LOGIC;
  signal sig_mstr2data_cmd_valid : STD_LOGIC;
  signal sig_mstr2data_eof : STD_LOGIC;
  signal sig_mstr2data_last_strb : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal sig_mstr2data_sequential : STD_LOGIC;
  signal sig_mstr2sf_cmd_valid : STD_LOGIC;
  signal sig_mstr2sf_strt_offset : STD_LOGIC_VECTOR ( 0 to 0 );
  signal sig_rd_sts_interr_reg0 : STD_LOGIC;
  signal sig_rd_sts_slverr_reg0 : STD_LOGIC;
  signal sig_rdc2sf_wlast : STD_LOGIC;
  signal sig_rdc2sf_wstrb : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal sig_rsc2data_ready : STD_LOGIC;
  signal sig_rsc2stat_status : STD_LOGIC_VECTOR ( 6 downto 4 );
  signal sig_rsc2stat_status_valid : STD_LOGIC;
  signal \^sig_rst2all_stop_request\ : STD_LOGIC;
  signal sig_sf2dre_wdata : STD_LOGIC_VECTOR ( 127 downto 0 );
  signal sig_sf2dre_wstrb : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal sig_sf_allow_addr_req : STD_LOGIC;
  signal sig_skid2dre_wready : STD_LOGIC;
  signal sig_slast_with_stop : STD_LOGIC;
  signal sig_sstrb_stop_mask : STD_LOGIC_VECTOR ( 15 to 15 );
  signal sig_stat2rsc_status_ready : STD_LOGIC;
  signal sig_stream_rst : STD_LOGIC;
  signal sig_stream_rst_reg_n : STD_LOGIC;
  signal sig_xfer_addr_reg : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal sig_xfer_len_im2 : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal sig_xfer_strt_strb2use_im3 : STD_LOGIC_VECTOR ( 15 downto 0 );
begin
  sig_rst2all_stop_request <= \^sig_rst2all_stop_request\;
\ENABLE_AXIS_SKID.I_MM2S_SKID_BUF\: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_datamover_skid_buf
     port map (
      \OMIT_UNPACKING.lsig_cmd_loaded\ => \OMIT_UNPACKING.lsig_cmd_loaded\,
      SR(0) => sig_stream_rst,
      dout(144) => sig_data_fifo_data_out(144),
      dout(143 downto 128) => sig_sf2dre_wstrb(15 downto 0),
      dout(127 downto 0) => sig_sf2dre_wdata(127 downto 0),
      empty => \GEN_INCLUDE_MM2S_SF.I_RD_SF_n_146\,
      m_axi_mm2s_aclk => m_axi_mm2s_aclk,
      m_axis_mm2s_tdata(127 downto 0) => m_axis_mm2s_tdata(127 downto 0),
      m_axis_mm2s_tkeep(15 downto 0) => m_axis_mm2s_tkeep(15 downto 0),
      m_axis_mm2s_tlast => m_axis_mm2s_tlast,
      m_axis_mm2s_tready => m_axis_mm2s_tready,
      m_axis_mm2s_tvalid => m_axis_mm2s_tvalid,
      \out\ => sig_skid2dre_wready,
      sig_halt_reg_dly2 => sig_halt_reg_dly2,
      sig_halt_reg_dly3 => sig_halt_reg_dly3,
      sig_s_ready_dup_reg_0 => \ENABLE_AXIS_SKID.I_MM2S_SKID_BUF_n_4\,
      sig_s_ready_dup_reg_1 => I_RD_DATA_CNTL_n_33,
      sig_slast_with_stop => sig_slast_with_stop,
      sig_sstrb_stop_mask(0) => sig_sstrb_stop_mask(15),
      \sig_sstrb_stop_mask_reg[15]_0\ => I_RD_DATA_CNTL_n_34,
      sig_stream_rst_reg_n => sig_stream_rst_reg_n
    );
\GEN_INCLUDE_MM2S_SF.I_RD_SF\: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_datamover_rd_sf
     port map (
      FIFO_Full_reg => \GEN_INCLUDE_MM2S_SF.I_RD_SF_n_147\,
      \OMIT_UNPACKING.lsig_cmd_loaded\ => \OMIT_UNPACKING.lsig_cmd_loaded\,
      SS(0) => sig_mmap_rst,
      din(145) => sig_data2sf_cmd_cmplt,
      din(144) => sig_rdc2sf_wlast,
      din(143 downto 128) => sig_rdc2sf_wstrb(15 downto 0),
      din(127 downto 0) => m_axi_mm2s_rdata(127 downto 0),
      dout(144) => sig_data_fifo_data_out(144),
      dout(143 downto 128) => sig_sf2dre_wstrb(15 downto 0),
      dout(127 downto 0) => sig_sf2dre_wdata(127 downto 0),
      empty => \GEN_INCLUDE_MM2S_SF.I_RD_SF_n_146\,
      full => sig_data_fifo_full,
      m_axi_mm2s_aclk => m_axi_mm2s_aclk,
      \out\ => sig_skid2dre_wready,
      sig_inhibit_rdy_n => \OMIT_DRE_CNTL.I_DRE_CNTL_FIFO/sig_inhibit_rdy_n\,
      sig_inhibit_rdy_n_reg => \GEN_INCLUDE_MM2S_SF.I_RD_SF_n_151\,
      sig_init_done => \OMIT_DRE_CNTL.I_DRE_CNTL_FIFO/sig_init_done\,
      sig_init_done_reg => I_RESET_n_5,
      sig_mmap_rst_reg_n => sig_mmap_rst_reg_n,
      sig_mstr2sf_cmd_valid => sig_mstr2sf_cmd_valid,
      sig_sf_allow_addr_req => sig_sf_allow_addr_req,
      sig_slast_with_stop => sig_slast_with_stop,
      sig_sstrb_stop_mask(0) => sig_sstrb_stop_mask(15),
      \sig_token_cntr_reg[1]_0\ => I_ADDR_CNTL_n_0,
      \sig_token_cntr_reg[1]_1\ => I_RD_DATA_CNTL_n_2,
      wr_en => sig_good_sin_strm_dbeat
    );
I_ADDR_CNTL: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_datamover_addr_cntl
     port map (
      FIFO_Full_reg => I_ADDR_CNTL_n_2,
      FIFO_Full_reg_0 => I_ADDR_CNTL_n_9,
      SS(0) => sig_mmap_rst,
      \USE_SRL_FIFO.sig_wr_fifo\ => \GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/USE_SRL_FIFO.sig_wr_fifo\,
      \in\(35) => sig_calc_error_reg,
      \in\(34) => sig_mstr2addr_burst(0),
      \in\(33 downto 32) => sig_xfer_len_im2(1 downto 0),
      \in\(31 downto 5) => sig_mstr2addr_addr(31 downto 5),
      \in\(4) => sig_mstr2sf_strt_offset(0),
      \in\(3 downto 0) => sig_xfer_addr_reg(3 downto 0),
      m_axi_mm2s_aclk => m_axi_mm2s_aclk,
      m_axi_mm2s_araddr(31 downto 0) => m_axi_mm2s_araddr(31 downto 0),
      m_axi_mm2s_arburst(0) => m_axi_mm2s_arburst(0),
      m_axi_mm2s_arlen(1 downto 0) => m_axi_mm2s_arlen(1 downto 0),
      m_axi_mm2s_arready => m_axi_mm2s_arready,
      m_axi_mm2s_arsize(0) => m_axi_mm2s_arsize(0),
      m_axi_mm2s_arvalid => m_axi_mm2s_arvalid,
      \out\ => I_ADDR_CNTL_n_0,
      sig_addr2rsc_calc_error => sig_addr2rsc_calc_error,
      \sig_addr_cntr_lsh_im0_reg[0]\ => I_MSTR_PCC_n_43,
      \sig_addr_cntr_lsh_im0_reg[0]_0\ => \GEN_INCLUDE_MM2S_SF.I_RD_SF_n_151\,
      sig_addr_reg_empty => sig_addr_reg_empty,
      sig_data2addr_stop_req => sig_data2addr_stop_req,
      sig_inhibit_rdy_n => \GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/sig_inhibit_rdy_n\,
      sig_init_reg => \OMIT_DRE_CNTL.I_DRE_CNTL_FIFO/sig_init_reg\,
      sig_init_reg2 => \OMIT_DRE_CNTL.I_DRE_CNTL_FIFO/sig_init_reg2\,
      sig_mmap_rst_reg_n => sig_mmap_rst_reg_n,
      sig_mstr2addr_cmd_valid => sig_mstr2addr_cmd_valid,
      sig_posted_to_axi_reg_0 => sig_addr2data_addr_posted,
      sig_sf_allow_addr_req => sig_sf_allow_addr_req
    );
I_CMD_STATUS: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_datamover_cmd_status
     port map (
      D(47 downto 0) => D(47 downto 0),
      E(0) => \I_CMD_FIFO/USE_SINGLE_REG.sig_push_regfifo\,
      Q(47 downto 32) => data(15 downto 0),
      Q(31) => I_CMD_STATUS_n_24,
      Q(30) => I_CMD_STATUS_n_25,
      Q(29) => I_CMD_STATUS_n_26,
      Q(28) => I_CMD_STATUS_n_27,
      Q(27) => I_CMD_STATUS_n_28,
      Q(26) => I_CMD_STATUS_n_29,
      Q(25) => I_CMD_STATUS_n_30,
      Q(24) => I_CMD_STATUS_n_31,
      Q(23) => I_CMD_STATUS_n_32,
      Q(22) => I_CMD_STATUS_n_33,
      Q(21) => I_CMD_STATUS_n_34,
      Q(20) => I_CMD_STATUS_n_35,
      Q(19) => I_CMD_STATUS_n_36,
      Q(18) => I_CMD_STATUS_n_37,
      Q(17) => I_CMD_STATUS_n_38,
      Q(16) => I_CMD_STATUS_n_39,
      Q(15) => sig_cmd_eof_slice,
      Q(14) => sig_cmd_type_slice,
      Q(13 downto 0) => sig_cmd2mstr_command(13 downto 0),
      SR(0) => sig_cmd_stat_rst_int,
      \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[6]\(2 downto 0) => sig_rsc2stat_status(6 downto 4),
      \USE_SINGLE_REG.sig_regfifo_empty_reg_reg\ => I_MSTR_PCC_n_42,
      \USE_SINGLE_REG.sig_regfifo_full_reg_reg\ => \USE_SINGLE_REG.sig_regfifo_full_reg_reg\,
      \USE_SINGLE_REG.sig_regfifo_full_reg_reg_0\ => I_MSTR_PCC_n_41,
      m_axi_mm2s_aclk => m_axi_mm2s_aclk,
      m_axis_mm2s_sts_tready => m_axis_mm2s_sts_tready,
      mm2s_decerr_i => mm2s_decerr_i,
      mm2s_interr_i => mm2s_interr_i,
      mm2s_slverr_i => mm2s_slverr_i,
      mm2s_sts_received => mm2s_sts_received,
      s_axis_mm2s_cmd_tready => s_axis_mm2s_cmd_tready,
      s_axis_mm2s_cmd_tvalid_split => s_axis_mm2s_cmd_tvalid_split,
      sig_cmd2mstr_cmd_valid => sig_cmd2mstr_cmd_valid,
      sig_cmd_stat_rst_int_reg_n => sig_cmd_stat_rst_int_reg_n,
      sig_rsc2stat_status_valid => sig_rsc2stat_status_valid,
      sig_stat2rsc_status_ready => sig_stat2rsc_status_ready
    );
I_MSTR_PCC: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_datamover_pcc
     port map (
      E(0) => \I_CMD_FIFO/USE_SINGLE_REG.sig_push_regfifo\,
      Q(47 downto 32) => data(15 downto 0),
      Q(31) => I_CMD_STATUS_n_24,
      Q(30) => I_CMD_STATUS_n_25,
      Q(29) => I_CMD_STATUS_n_26,
      Q(28) => I_CMD_STATUS_n_27,
      Q(27) => I_CMD_STATUS_n_28,
      Q(26) => I_CMD_STATUS_n_29,
      Q(25) => I_CMD_STATUS_n_30,
      Q(24) => I_CMD_STATUS_n_31,
      Q(23) => I_CMD_STATUS_n_32,
      Q(22) => I_CMD_STATUS_n_33,
      Q(21) => I_CMD_STATUS_n_34,
      Q(20) => I_CMD_STATUS_n_35,
      Q(19) => I_CMD_STATUS_n_36,
      Q(18) => I_CMD_STATUS_n_37,
      Q(17) => I_CMD_STATUS_n_38,
      Q(16) => I_CMD_STATUS_n_39,
      Q(15) => sig_cmd_eof_slice,
      Q(14) => sig_cmd_type_slice,
      Q(13 downto 0) => sig_cmd2mstr_command(13 downto 0),
      SS(0) => sig_mmap_rst,
      \in\(35) => sig_calc_error_reg,
      \in\(34) => sig_mstr2addr_burst(0),
      \in\(33 downto 32) => sig_xfer_len_im2(1 downto 0),
      \in\(31 downto 5) => sig_mstr2addr_addr(31 downto 5),
      \in\(4) => sig_mstr2sf_strt_offset(0),
      \in\(3 downto 0) => sig_xfer_addr_reg(3 downto 0),
      m_axi_mm2s_aclk => m_axi_mm2s_aclk,
      \sig_addr_cntr_lsh_im0_reg[0]_0\ => I_ADDR_CNTL_n_9,
      sig_calc_error_reg_reg_0(33) => sig_mstr2data_cmd_cmplt,
      sig_calc_error_reg_reg_0(32) => sig_mstr2data_eof,
      sig_calc_error_reg_reg_0(31 downto 16) => sig_mstr2data_last_strb(15 downto 0),
      sig_calc_error_reg_reg_0(15 downto 0) => sig_xfer_strt_strb2use_im3(15 downto 0),
      sig_cmd2addr_valid_reg_0 => I_ADDR_CNTL_n_2,
      sig_cmd2data_valid_reg_0 => I_MSTR_PCC_n_43,
      sig_cmd2data_valid_reg_1 => I_RD_DATA_CNTL_n_0,
      sig_cmd2dre_valid_reg_0 => \GEN_INCLUDE_MM2S_SF.I_RD_SF_n_147\,
      sig_cmd2mstr_cmd_valid => sig_cmd2mstr_cmd_valid,
      sig_cmd_stat_rst_int_reg_n => sig_cmd_stat_rst_int_reg_n,
      sig_cmd_stat_rst_int_reg_n_reg => I_MSTR_PCC_n_41,
      sig_inhibit_rdy_n => \OMIT_DRE_CNTL.I_DRE_CNTL_FIFO/sig_inhibit_rdy_n\,
      sig_inhibit_rdy_n_0 => \GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/sig_inhibit_rdy_n\,
      sig_inhibit_rdy_n_1 => \GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/sig_inhibit_rdy_n\,
      sig_init_reg => \OMIT_DRE_CNTL.I_DRE_CNTL_FIFO/sig_init_reg\,
      sig_input_reg_empty_reg_0 => I_MSTR_PCC_n_42,
      sig_mstr2addr_cmd_valid => sig_mstr2addr_cmd_valid,
      sig_mstr2data_cmd_valid => sig_mstr2data_cmd_valid,
      sig_mstr2data_sequential => sig_mstr2data_sequential,
      sig_mstr2sf_cmd_valid => sig_mstr2sf_cmd_valid
    );
I_RD_DATA_CNTL: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_datamover_rddata_cntl
     port map (
      FIFO_Full_reg => I_RD_DATA_CNTL_n_0,
      SS(0) => sig_mmap_rst,
      \USE_SRL_FIFO.sig_wr_fifo\ => \GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/USE_SRL_FIFO.sig_wr_fifo\,
      din(17) => sig_data2sf_cmd_cmplt,
      din(16) => sig_rdc2sf_wlast,
      din(15 downto 0) => sig_rdc2sf_wstrb(15 downto 0),
      full => sig_data_fifo_full,
      \in\(37) => sig_calc_error_reg,
      \in\(36) => sig_mstr2data_cmd_cmplt,
      \in\(35) => sig_mstr2data_sequential,
      \in\(34) => sig_mstr2data_eof,
      \in\(33 downto 18) => sig_mstr2data_last_strb(15 downto 0),
      \in\(17 downto 2) => sig_xfer_strt_strb2use_im3(15 downto 0),
      \in\(1 downto 0) => sig_xfer_len_im2(1 downto 0),
      m_axi_mm2s_aclk => m_axi_mm2s_aclk,
      m_axi_mm2s_rlast => m_axi_mm2s_rlast,
      m_axi_mm2s_rready => m_axi_mm2s_rready,
      m_axi_mm2s_rresp(1 downto 0) => m_axi_mm2s_rresp(1 downto 0),
      m_axi_mm2s_rvalid => m_axi_mm2s_rvalid,
      \sig_addr_posted_cntr_reg[2]_0\ => sig_addr2data_addr_posted,
      sig_data2addr_stop_req => sig_data2addr_stop_req,
      sig_data2rsc_decerr => sig_data2rsc_decerr,
      sig_data2rsc_valid => sig_data2rsc_valid,
      sig_halt_reg_dly2 => sig_halt_reg_dly2,
      sig_halt_reg_dly3 => sig_halt_reg_dly3,
      sig_halt_reg_dly3_reg_0 => I_RD_DATA_CNTL_n_33,
      sig_inhibit_rdy_n => \GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/sig_inhibit_rdy_n\,
      sig_init_done => \GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/sig_init_done\,
      sig_init_done_reg => I_RESET_n_6,
      sig_last_mmap_dbeat_reg_reg_0 => I_RD_DATA_CNTL_n_2,
      sig_mmap_rst_reg_n => sig_mmap_rst_reg_n,
      sig_mstr2data_cmd_valid => sig_mstr2data_cmd_valid,
      sig_next_calc_error_reg_reg_0 => I_RD_DATA_CNTL_n_32,
      sig_rd_sts_interr_reg0 => sig_rd_sts_interr_reg0,
      sig_rd_sts_slverr_reg0 => sig_rd_sts_slverr_reg0,
      sig_rd_sts_slverr_reg_reg(1) => sig_rsc2stat_status(6),
      sig_rd_sts_slverr_reg_reg(0) => sig_rsc2stat_status(4),
      sig_rsc2data_ready => sig_rsc2data_ready,
      sig_rsc2stat_status_valid => sig_rsc2stat_status_valid,
      sig_rst2all_stop_request => \^sig_rst2all_stop_request\,
      sig_s_ready_dup_reg => \ENABLE_AXIS_SKID.I_MM2S_SKID_BUF_n_4\,
      sig_sstrb_stop_mask(0) => sig_sstrb_stop_mask(15),
      \sig_sstrb_stop_mask_reg[15]\ => I_RD_DATA_CNTL_n_34,
      sig_stat2rsc_status_ready => sig_stat2rsc_status_ready,
      sig_stream_rst_reg_n => sig_stream_rst_reg_n,
      wr_en => sig_good_sin_strm_dbeat
    );
I_RD_STATUS_CNTLR: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_datamover_rd_status_cntl
     port map (
      m_axi_mm2s_aclk => m_axi_mm2s_aclk,
      sig_data2rsc_decerr => sig_data2rsc_decerr,
      sig_data2rsc_valid => sig_data2rsc_valid,
      sig_mmap_rst_reg_n => sig_mmap_rst_reg_n,
      sig_rd_sts_interr_reg0 => sig_rd_sts_interr_reg0,
      sig_rd_sts_slverr_reg0 => sig_rd_sts_slverr_reg0,
      sig_rd_sts_slverr_reg_reg_0(2 downto 0) => sig_rsc2stat_status(6 downto 4),
      sig_rsc2data_ready => sig_rsc2data_ready,
      sig_rsc2stat_status_valid => sig_rsc2stat_status_valid,
      sig_stat2rsc_status_ready => sig_stat2rsc_status_ready
    );
I_RESET: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_datamover_reset
     port map (
      SR(0) => sig_cmd_stat_rst_int,
      SS(0) => sig_mmap_rst,
      m_axi_mm2s_aclk => m_axi_mm2s_aclk,
      mm2s_halt_cmplt => mm2s_halt_cmplt,
      \out\ => \out\,
      sig_addr2rsc_calc_error => sig_addr2rsc_calc_error,
      sig_addr_reg_empty => sig_addr_reg_empty,
      sig_cmd_stat_rst_int_reg_n => sig_cmd_stat_rst_int_reg_n,
      sig_data2addr_stop_req => sig_data2addr_stop_req,
      sig_halt_cmplt_reg_0 => I_RD_DATA_CNTL_n_32,
      sig_halt_reg_dly3 => sig_halt_reg_dly3,
      sig_init_done => \OMIT_DRE_CNTL.I_DRE_CNTL_FIFO/sig_init_done\,
      sig_init_done_0 => \GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/sig_init_done\,
      sig_init_reg => \OMIT_DRE_CNTL.I_DRE_CNTL_FIFO/sig_init_reg\,
      sig_init_reg2 => \OMIT_DRE_CNTL.I_DRE_CNTL_FIFO/sig_init_reg2\,
      sig_mmap_rst_reg_n => sig_mmap_rst_reg_n,
      sig_mmap_rst_reg_n_reg_0 => I_RESET_n_5,
      sig_mmap_rst_reg_n_reg_1 => I_RESET_n_6,
      sig_rst2all_stop_request => \^sig_rst2all_stop_request\,
      sig_s_h_halt_reg_reg_0 => sig_s_h_halt_reg_reg,
      sig_stream_rst_reg_n => sig_stream_rst_reg_n,
      sig_stream_rst_reg_n_reg_0(0) => sig_stream_rst
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_datamover is
  port (
    m_axis_mm2s_tvalid : out STD_LOGIC;
    sig_rst2all_stop_request : out STD_LOGIC;
    m_axi_mm2s_arsize : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_mm2s_arburst : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_mm2s_arvalid : out STD_LOGIC;
    m_axis_mm2s_tlast : out STD_LOGIC;
    s_axis_mm2s_cmd_tready : out STD_LOGIC;
    m_axis_mm2s_sts_tvalid_int : out STD_LOGIC;
    mm2s_decerr_i : out STD_LOGIC;
    mm2s_interr_i : out STD_LOGIC;
    mm2s_slverr_i : out STD_LOGIC;
    m_axi_mm2s_rready : out STD_LOGIC;
    mm2s_halt_cmplt : out STD_LOGIC;
    m_axi_mm2s_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_mm2s_arlen : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axis_mm2s_tdata : out STD_LOGIC_VECTOR ( 127 downto 0 );
    m_axis_mm2s_tkeep : out STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axi_mm2s_aclk : in STD_LOGIC;
    m_axi_mm2s_rdata : in STD_LOGIC_VECTOR ( 127 downto 0 );
    \out\ : in STD_LOGIC;
    sig_s_h_halt_reg_reg : in STD_LOGIC;
    s_axi_lite_aclk : in STD_LOGIC;
    mm2s_sts_received : in STD_LOGIC;
    m_axis_mm2s_sts_tready : in STD_LOGIC;
    s_axis_mm2s_cmd_tvalid_split : in STD_LOGIC;
    m_axi_mm2s_rlast : in STD_LOGIC;
    m_axi_mm2s_rvalid : in STD_LOGIC;
    m_axi_mm2s_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axis_mm2s_tready : in STD_LOGIC;
    m_axi_mm2s_arready : in STD_LOGIC;
    D : in STD_LOGIC_VECTOR ( 47 downto 0 )
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_datamover;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_datamover is
begin
\GEN_MM2S_FULL.I_MM2S_FULL_WRAPPER\: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_datamover_mm2s_full_wrap
     port map (
      D(47 downto 0) => D(47 downto 0),
      \USE_SINGLE_REG.sig_regfifo_full_reg_reg\ => m_axis_mm2s_sts_tvalid_int,
      m_axi_mm2s_aclk => m_axi_mm2s_aclk,
      m_axi_mm2s_araddr(31 downto 0) => m_axi_mm2s_araddr(31 downto 0),
      m_axi_mm2s_arburst(0) => m_axi_mm2s_arburst(0),
      m_axi_mm2s_arlen(1 downto 0) => m_axi_mm2s_arlen(1 downto 0),
      m_axi_mm2s_arready => m_axi_mm2s_arready,
      m_axi_mm2s_arsize(0) => m_axi_mm2s_arsize(0),
      m_axi_mm2s_arvalid => m_axi_mm2s_arvalid,
      m_axi_mm2s_rdata(127 downto 0) => m_axi_mm2s_rdata(127 downto 0),
      m_axi_mm2s_rlast => m_axi_mm2s_rlast,
      m_axi_mm2s_rready => m_axi_mm2s_rready,
      m_axi_mm2s_rresp(1 downto 0) => m_axi_mm2s_rresp(1 downto 0),
      m_axi_mm2s_rvalid => m_axi_mm2s_rvalid,
      m_axis_mm2s_sts_tready => m_axis_mm2s_sts_tready,
      m_axis_mm2s_tdata(127 downto 0) => m_axis_mm2s_tdata(127 downto 0),
      m_axis_mm2s_tkeep(15 downto 0) => m_axis_mm2s_tkeep(15 downto 0),
      m_axis_mm2s_tlast => m_axis_mm2s_tlast,
      m_axis_mm2s_tready => m_axis_mm2s_tready,
      m_axis_mm2s_tvalid => m_axis_mm2s_tvalid,
      mm2s_decerr_i => mm2s_decerr_i,
      mm2s_halt_cmplt => mm2s_halt_cmplt,
      mm2s_interr_i => mm2s_interr_i,
      mm2s_slverr_i => mm2s_slverr_i,
      mm2s_sts_received => mm2s_sts_received,
      \out\ => \out\,
      s_axis_mm2s_cmd_tready => s_axis_mm2s_cmd_tready,
      s_axis_mm2s_cmd_tvalid_split => s_axis_mm2s_cmd_tvalid_split,
      sig_rst2all_stop_request => sig_rst2all_stop_request,
      sig_s_h_halt_reg_reg => sig_s_h_halt_reg_reg
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_dma is
  port (
    s_axi_lite_aclk : in STD_LOGIC;
    m_axi_sg_aclk : in STD_LOGIC;
    m_axi_mm2s_aclk : in STD_LOGIC;
    m_axi_s2mm_aclk : in STD_LOGIC;
    axi_resetn : in STD_LOGIC;
    s_axi_lite_awvalid : in STD_LOGIC;
    s_axi_lite_awready : out STD_LOGIC;
    s_axi_lite_awaddr : in STD_LOGIC_VECTOR ( 9 downto 0 );
    s_axi_lite_wvalid : in STD_LOGIC;
    s_axi_lite_wready : out STD_LOGIC;
    s_axi_lite_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_lite_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_lite_bvalid : out STD_LOGIC;
    s_axi_lite_bready : in STD_LOGIC;
    s_axi_lite_arvalid : in STD_LOGIC;
    s_axi_lite_arready : out STD_LOGIC;
    s_axi_lite_araddr : in STD_LOGIC_VECTOR ( 9 downto 0 );
    s_axi_lite_rvalid : out STD_LOGIC;
    s_axi_lite_rready : in STD_LOGIC;
    s_axi_lite_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_lite_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_sg_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_sg_awlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_sg_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_sg_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_sg_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_sg_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_sg_awuser : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_sg_awvalid : out STD_LOGIC;
    m_axi_sg_awready : in STD_LOGIC;
    m_axi_sg_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_sg_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_sg_wlast : out STD_LOGIC;
    m_axi_sg_wvalid : out STD_LOGIC;
    m_axi_sg_wready : in STD_LOGIC;
    m_axi_sg_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_sg_bvalid : in STD_LOGIC;
    m_axi_sg_bready : out STD_LOGIC;
    m_axi_sg_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_sg_arlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_sg_arsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_sg_arburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_sg_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_sg_arcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_sg_aruser : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_sg_arvalid : out STD_LOGIC;
    m_axi_sg_arready : in STD_LOGIC;
    m_axi_sg_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_sg_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_sg_rlast : in STD_LOGIC;
    m_axi_sg_rvalid : in STD_LOGIC;
    m_axi_sg_rready : out STD_LOGIC;
    m_axi_mm2s_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_mm2s_arlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_mm2s_arsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_mm2s_arburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_mm2s_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_mm2s_arcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_mm2s_aruser : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_mm2s_arvalid : out STD_LOGIC;
    m_axi_mm2s_arready : in STD_LOGIC;
    m_axi_mm2s_rdata : in STD_LOGIC_VECTOR ( 127 downto 0 );
    m_axi_mm2s_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_mm2s_rlast : in STD_LOGIC;
    m_axi_mm2s_rvalid : in STD_LOGIC;
    m_axi_mm2s_rready : out STD_LOGIC;
    mm2s_prmry_reset_out_n : out STD_LOGIC;
    m_axis_mm2s_tdata : out STD_LOGIC_VECTOR ( 127 downto 0 );
    m_axis_mm2s_tkeep : out STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axis_mm2s_tvalid : out STD_LOGIC;
    m_axis_mm2s_tready : in STD_LOGIC;
    m_axis_mm2s_tlast : out STD_LOGIC;
    m_axis_mm2s_tuser : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axis_mm2s_tid : out STD_LOGIC_VECTOR ( 4 downto 0 );
    m_axis_mm2s_tdest : out STD_LOGIC_VECTOR ( 4 downto 0 );
    mm2s_cntrl_reset_out_n : out STD_LOGIC;
    m_axis_mm2s_cntrl_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axis_mm2s_cntrl_tkeep : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axis_mm2s_cntrl_tvalid : out STD_LOGIC;
    m_axis_mm2s_cntrl_tready : in STD_LOGIC;
    m_axis_mm2s_cntrl_tlast : out STD_LOGIC;
    m_axi_s2mm_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_s2mm_awlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_s2mm_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_s2mm_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_s2mm_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_s2mm_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_s2mm_awuser : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_s2mm_awvalid : out STD_LOGIC;
    m_axi_s2mm_awready : in STD_LOGIC;
    m_axi_s2mm_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_s2mm_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_s2mm_wlast : out STD_LOGIC;
    m_axi_s2mm_wvalid : out STD_LOGIC;
    m_axi_s2mm_wready : in STD_LOGIC;
    m_axi_s2mm_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_s2mm_bvalid : in STD_LOGIC;
    m_axi_s2mm_bready : out STD_LOGIC;
    s2mm_prmry_reset_out_n : out STD_LOGIC;
    s_axis_s2mm_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axis_s2mm_tkeep : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axis_s2mm_tvalid : in STD_LOGIC;
    s_axis_s2mm_tready : out STD_LOGIC;
    s_axis_s2mm_tlast : in STD_LOGIC;
    s_axis_s2mm_tuser : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axis_s2mm_tid : in STD_LOGIC_VECTOR ( 4 downto 0 );
    s_axis_s2mm_tdest : in STD_LOGIC_VECTOR ( 4 downto 0 );
    s2mm_sts_reset_out_n : out STD_LOGIC;
    s_axis_s2mm_sts_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axis_s2mm_sts_tkeep : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axis_s2mm_sts_tvalid : in STD_LOGIC;
    s_axis_s2mm_sts_tready : out STD_LOGIC;
    s_axis_s2mm_sts_tlast : in STD_LOGIC;
    mm2s_introut : out STD_LOGIC;
    s2mm_introut : out STD_LOGIC;
    axi_dma_tstvec : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  attribute C_DLYTMR_RESOLUTION : integer;
  attribute C_DLYTMR_RESOLUTION of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_dma : entity is 125;
  attribute C_ENABLE_MULTI_CHANNEL : integer;
  attribute C_ENABLE_MULTI_CHANNEL of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_dma : entity is 0;
  attribute C_FAMILY : string;
  attribute C_FAMILY of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_dma : entity is "zynquplus";
  attribute C_INCLUDE_MM2S : integer;
  attribute C_INCLUDE_MM2S of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_dma : entity is 1;
  attribute C_INCLUDE_MM2S_DRE : integer;
  attribute C_INCLUDE_MM2S_DRE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_dma : entity is 0;
  attribute C_INCLUDE_MM2S_SF : integer;
  attribute C_INCLUDE_MM2S_SF of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_dma : entity is 1;
  attribute C_INCLUDE_S2MM : integer;
  attribute C_INCLUDE_S2MM of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_dma : entity is 0;
  attribute C_INCLUDE_S2MM_DRE : integer;
  attribute C_INCLUDE_S2MM_DRE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_dma : entity is 0;
  attribute C_INCLUDE_S2MM_SF : integer;
  attribute C_INCLUDE_S2MM_SF of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_dma : entity is 1;
  attribute C_INCLUDE_SG : integer;
  attribute C_INCLUDE_SG of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_dma : entity is 0;
  attribute C_INCREASE_THROUGHPUT : integer;
  attribute C_INCREASE_THROUGHPUT of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_dma : entity is 0;
  attribute C_INSTANCE : string;
  attribute C_INSTANCE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_dma : entity is "axi_dma";
  attribute C_MICRO_DMA : integer;
  attribute C_MICRO_DMA of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_dma : entity is 0;
  attribute C_MM2S_BURST_SIZE : integer;
  attribute C_MM2S_BURST_SIZE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_dma : entity is 4;
  attribute C_M_AXIS_MM2S_CNTRL_TDATA_WIDTH : integer;
  attribute C_M_AXIS_MM2S_CNTRL_TDATA_WIDTH of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_dma : entity is 32;
  attribute C_M_AXIS_MM2S_TDATA_WIDTH : integer;
  attribute C_M_AXIS_MM2S_TDATA_WIDTH of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_dma : entity is 128;
  attribute C_M_AXI_MM2S_ADDR_WIDTH : integer;
  attribute C_M_AXI_MM2S_ADDR_WIDTH of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_dma : entity is 32;
  attribute C_M_AXI_MM2S_DATA_WIDTH : integer;
  attribute C_M_AXI_MM2S_DATA_WIDTH of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_dma : entity is 128;
  attribute C_M_AXI_S2MM_ADDR_WIDTH : integer;
  attribute C_M_AXI_S2MM_ADDR_WIDTH of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_dma : entity is 32;
  attribute C_M_AXI_S2MM_DATA_WIDTH : integer;
  attribute C_M_AXI_S2MM_DATA_WIDTH of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_dma : entity is 32;
  attribute C_M_AXI_SG_ADDR_WIDTH : integer;
  attribute C_M_AXI_SG_ADDR_WIDTH of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_dma : entity is 32;
  attribute C_M_AXI_SG_DATA_WIDTH : integer;
  attribute C_M_AXI_SG_DATA_WIDTH of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_dma : entity is 32;
  attribute C_NUM_MM2S_CHANNELS : integer;
  attribute C_NUM_MM2S_CHANNELS of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_dma : entity is 1;
  attribute C_NUM_S2MM_CHANNELS : integer;
  attribute C_NUM_S2MM_CHANNELS of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_dma : entity is 1;
  attribute C_PRMRY_IS_ACLK_ASYNC : integer;
  attribute C_PRMRY_IS_ACLK_ASYNC of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_dma : entity is 0;
  attribute C_S2MM_BURST_SIZE : integer;
  attribute C_S2MM_BURST_SIZE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_dma : entity is 16;
  attribute C_SG_INCLUDE_STSCNTRL_STRM : integer;
  attribute C_SG_INCLUDE_STSCNTRL_STRM of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_dma : entity is 0;
  attribute C_SG_LENGTH_WIDTH : integer;
  attribute C_SG_LENGTH_WIDTH of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_dma : entity is 14;
  attribute C_SG_USE_STSAPP_LENGTH : integer;
  attribute C_SG_USE_STSAPP_LENGTH of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_dma : entity is 0;
  attribute C_S_AXIS_S2MM_STS_TDATA_WIDTH : integer;
  attribute C_S_AXIS_S2MM_STS_TDATA_WIDTH of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_dma : entity is 32;
  attribute C_S_AXIS_S2MM_TDATA_WIDTH : integer;
  attribute C_S_AXIS_S2MM_TDATA_WIDTH of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_dma : entity is 32;
  attribute C_S_AXI_LITE_ADDR_WIDTH : integer;
  attribute C_S_AXI_LITE_ADDR_WIDTH of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_dma : entity is 10;
  attribute C_S_AXI_LITE_DATA_WIDTH : integer;
  attribute C_S_AXI_LITE_DATA_WIDTH of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_dma : entity is 32;
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_dma : entity is "yes";
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_dma;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_dma is
  signal \GEN_AXI_LITE_IF.AXI_LITE_IF_I/rdy\ : STD_LOGIC;
  signal \GEN_MM2S_DMA_CONTROL.I_MM2S_CMDSTS/mm2s_decerr_i\ : STD_LOGIC;
  signal \GEN_MM2S_DMA_CONTROL.I_MM2S_CMDSTS/mm2s_interr_i\ : STD_LOGIC;
  signal \GEN_MM2S_DMA_CONTROL.I_MM2S_CMDSTS/mm2s_slverr_i\ : STD_LOGIC;
  signal \GEN_MM2S_DMA_CONTROL.I_MM2S_STS_MNGR/mm2s_halted_set0\ : STD_LOGIC;
  signal \GEN_MM2S_FULL.I_MM2S_FULL_WRAPPER/sig_rst2all_stop_request\ : STD_LOGIC;
  signal \GEN_MM2S_REGISTERS.I_MM2S_DMA_REGISTER/halted1\ : STD_LOGIC;
  signal \GEN_RESET_FOR_MM2S.RESET_I/soft_reset_d1\ : STD_LOGIC;
  signal \GEN_RESET_FOR_MM2S.RESET_I/soft_reset_re0\ : STD_LOGIC;
  signal \INCLUDE_MM2S_SOF_EOF_GENERATOR.I_MM2S_DMA_MNGR_n_10\ : STD_LOGIC;
  signal \INCLUDE_MM2S_SOF_EOF_GENERATOR.I_MM2S_DMA_MNGR_n_11\ : STD_LOGIC;
  signal \INCLUDE_MM2S_SOF_EOF_GENERATOR.I_MM2S_DMA_MNGR_n_7\ : STD_LOGIC;
  signal \INCLUDE_MM2S_SOF_EOF_GENERATOR.I_MM2S_DMA_MNGR_n_8\ : STD_LOGIC;
  signal \INCLUDE_MM2S_SOF_EOF_GENERATOR.I_MM2S_DMA_MNGR_n_9\ : STD_LOGIC;
  signal I_AXI_DMA_REG_MODULE_n_11 : STD_LOGIC;
  signal I_AXI_DMA_REG_MODULE_n_3 : STD_LOGIC;
  signal I_AXI_DMA_REG_MODULE_n_4 : STD_LOGIC;
  signal I_AXI_DMA_REG_MODULE_n_5 : STD_LOGIC;
  signal I_AXI_DMA_REG_MODULE_n_62 : STD_LOGIC;
  signal I_RST_MODULE_n_10 : STD_LOGIC;
  signal I_RST_MODULE_n_11 : STD_LOGIC;
  signal I_RST_MODULE_n_9 : STD_LOGIC;
  signal \^axi_dma_tstvec\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_lite_reset_n : STD_LOGIC;
  signal dma_mm2s_error : STD_LOGIC;
  signal m_axi_mm2s_aresetn : STD_LOGIC;
  signal m_axi_sg_aresetn : STD_LOGIC;
  signal m_axis_mm2s_sts_tready : STD_LOGIC;
  signal m_axis_mm2s_sts_tvalid_int : STD_LOGIC;
  signal \^m_axis_mm2s_tlast\ : STD_LOGIC;
  signal \^m_axis_mm2s_tvalid\ : STD_LOGIC;
  signal mm2s_all_idle : STD_LOGIC;
  signal mm2s_dmacr : STD_LOGIC_VECTOR ( 0 to 0 );
  signal mm2s_dmasr : STD_LOGIC_VECTOR ( 0 to 0 );
  signal mm2s_halt_cmplt : STD_LOGIC;
  signal mm2s_length : STD_LOGIC_VECTOR ( 13 downto 0 );
  signal mm2s_length_wren : STD_LOGIC;
  signal mm2s_prmry_resetn : STD_LOGIC;
  signal mm2s_sa : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal mm2s_stop : STD_LOGIC;
  signal mm2s_sts_received : STD_LOGIC;
  signal \^s_axi_lite_wready\ : STD_LOGIC;
  signal s_axis_mm2s_cmd_tdata_split : STD_LOGIC_VECTOR ( 66 downto 0 );
  signal s_axis_mm2s_cmd_tready : STD_LOGIC;
  signal s_axis_mm2s_cmd_tvalid_split : STD_LOGIC;
  signal soft_reset : STD_LOGIC;
  signal soft_reset_clr : STD_LOGIC;
  attribute dont_touch : string;
  attribute dont_touch of s_axi_lite_aclk : signal is "true";
begin
  axi_dma_tstvec(4) <= \^axi_dma_tstvec\(4);
  axi_dma_tstvec(1 downto 0) <= \^axi_dma_tstvec\(1 downto 0);
  m_axis_mm2s_tlast <= \^m_axis_mm2s_tlast\;
  m_axis_mm2s_tvalid <= \^m_axis_mm2s_tvalid\;
  s_axi_lite_awready <= \^s_axi_lite_wready\;
  s_axi_lite_wready <= \^s_axi_lite_wready\;
\INCLUDE_MM2S_SOF_EOF_GENERATOR.I_MM2S_DMA_MNGR\: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_dma_mm2s_mngr
     port map (
      D(47 downto 16) => s_axis_mm2s_cmd_tdata_split(66 downto 35),
      D(15) => s_axis_mm2s_cmd_tdata_split(33),
      D(14) => s_axis_mm2s_cmd_tdata_split(26),
      D(13 downto 0) => s_axis_mm2s_cmd_tdata_split(13 downto 0),
      \GEN_CMD_BTT_LESS_23.cmnd_data_reg[13]\(13 downto 0) => mm2s_length(13 downto 0),
      \GEN_CMD_BTT_LESS_23.cmnd_data_reg[26]\ => I_AXI_DMA_REG_MODULE_n_62,
      \GNE_SYNC_RESET.scndry_resetn_reg\ => \INCLUDE_MM2S_SOF_EOF_GENERATOR.I_MM2S_DMA_MNGR_n_8\,
      Q(31 downto 0) => mm2s_sa(31 downto 0),
      axi_dma_tstvec(0) => \^axi_dma_tstvec\(4),
      dma_decerr_reg => I_AXI_DMA_REG_MODULE_n_5,
      dma_interr_reg => I_AXI_DMA_REG_MODULE_n_3,
      dma_mm2s_error => dma_mm2s_error,
      dma_slverr_reg => I_AXI_DMA_REG_MODULE_n_4,
      halted1 => \GEN_MM2S_REGISTERS.I_MM2S_DMA_REGISTER/halted1\,
      idle_reg => I_AXI_DMA_REG_MODULE_n_11,
      m_axis_mm2s_sts_tready => m_axis_mm2s_sts_tready,
      m_axis_mm2s_sts_tvalid_int => m_axis_mm2s_sts_tvalid_int,
      mm2s_all_idle => mm2s_all_idle,
      mm2s_decerr_i => \GEN_MM2S_DMA_CONTROL.I_MM2S_CMDSTS/mm2s_decerr_i\,
      mm2s_decerr_i_reg => \INCLUDE_MM2S_SOF_EOF_GENERATOR.I_MM2S_DMA_MNGR_n_11\,
      mm2s_dmacr(0) => mm2s_dmacr(0),
      mm2s_dmasr(0) => mm2s_dmasr(0),
      mm2s_halted_set0 => \GEN_MM2S_DMA_CONTROL.I_MM2S_STS_MNGR/mm2s_halted_set0\,
      mm2s_halted_set_reg => \INCLUDE_MM2S_SOF_EOF_GENERATOR.I_MM2S_DMA_MNGR_n_7\,
      mm2s_interr_i => \GEN_MM2S_DMA_CONTROL.I_MM2S_CMDSTS/mm2s_interr_i\,
      mm2s_interr_i_reg => \INCLUDE_MM2S_SOF_EOF_GENERATOR.I_MM2S_DMA_MNGR_n_9\,
      mm2s_length_wren => mm2s_length_wren,
      mm2s_slverr_i => \GEN_MM2S_DMA_CONTROL.I_MM2S_CMDSTS/mm2s_slverr_i\,
      mm2s_slverr_i_reg => \INCLUDE_MM2S_SOF_EOF_GENERATOR.I_MM2S_DMA_MNGR_n_10\,
      mm2s_stop => mm2s_stop,
      mm2s_sts_received => mm2s_sts_received,
      \out\ => m_axi_sg_aresetn,
      s_axi_lite_aclk => s_axi_lite_aclk,
      s_axis_mm2s_cmd_tready => s_axis_mm2s_cmd_tready,
      s_axis_mm2s_cmd_tvalid_split => s_axis_mm2s_cmd_tvalid_split,
      soft_reset => soft_reset
    );
\INCLUDE_MM2S_SOF_EOF_GENERATOR.I_MM2S_SOFEOF_GEN\: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_dma_sofeof_gen
     port map (
      SR(0) => \GEN_MM2S_REGISTERS.I_MM2S_DMA_REGISTER/halted1\,
      axi_dma_tstvec(1 downto 0) => \^axi_dma_tstvec\(1 downto 0),
      m_axis_mm2s_tlast => \^m_axis_mm2s_tlast\,
      m_axis_mm2s_tready => m_axis_mm2s_tready,
      m_axis_mm2s_tvalid => \^m_axis_mm2s_tvalid\,
      \out\ => mm2s_prmry_resetn,
      s_axi_lite_aclk => s_axi_lite_aclk
    );
I_AXI_DMA_REG_MODULE: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_dma_reg_module
     port map (
      \GEN_REG_FOR_SMPL.buffer_length_i_reg[13]\(13 downto 0) => mm2s_length(13 downto 0),
      \GEN_SYNC_READ.s_axi_lite_rvalid_i_reg\ => s_axi_lite_rvalid,
      \GEN_SYNC_WRITE.axi2ip_wrce_reg[10]\ => I_RST_MODULE_n_10,
      \GEN_SYNC_WRITE.rdy_reg\ => axi_lite_reset_n,
      Q(31 downto 0) => mm2s_sa(31 downto 0),
      SR(0) => I_RST_MODULE_n_9,
      axi_dma_tstvec(0) => \^axi_dma_tstvec\(4),
      dma_decerr_reg => I_AXI_DMA_REG_MODULE_n_5,
      dma_decerr_reg_0 => \INCLUDE_MM2S_SOF_EOF_GENERATOR.I_MM2S_DMA_MNGR_n_11\,
      dma_interr_reg => I_AXI_DMA_REG_MODULE_n_3,
      dma_interr_reg_0 => \INCLUDE_MM2S_SOF_EOF_GENERATOR.I_MM2S_DMA_MNGR_n_9\,
      dma_mm2s_error => dma_mm2s_error,
      dma_slverr_reg => I_AXI_DMA_REG_MODULE_n_4,
      dma_slverr_reg_0 => \INCLUDE_MM2S_SOF_EOF_GENERATOR.I_MM2S_DMA_MNGR_n_10\,
      \dmacr_i_reg[0]\(0) => mm2s_dmacr(0),
      \dmacr_i_reg[3]\ => I_AXI_DMA_REG_MODULE_n_62,
      \dmacr_i_reg[4]\(0) => \GEN_MM2S_REGISTERS.I_MM2S_DMA_REGISTER/halted1\,
      halted_reg => \INCLUDE_MM2S_SOF_EOF_GENERATOR.I_MM2S_DMA_MNGR_n_8\,
      idle_reg => I_AXI_DMA_REG_MODULE_n_11,
      idle_reg_0 => \INCLUDE_MM2S_SOF_EOF_GENERATOR.I_MM2S_DMA_MNGR_n_7\,
      mm2s_all_idle => mm2s_all_idle,
      mm2s_dmasr(0) => mm2s_dmasr(0),
      mm2s_halt_cmplt => mm2s_halt_cmplt,
      mm2s_halted_set0 => \GEN_MM2S_DMA_CONTROL.I_MM2S_STS_MNGR/mm2s_halted_set0\,
      mm2s_introut => mm2s_introut,
      mm2s_length_wren => mm2s_length_wren,
      mm2s_stop => mm2s_stop,
      \out\ => m_axi_sg_aresetn,
      rdy => \GEN_AXI_LITE_IF.AXI_LITE_IF_I/rdy\,
      s_axi_lite_aclk => s_axi_lite_aclk,
      s_axi_lite_araddr(9 downto 0) => s_axi_lite_araddr(9 downto 0),
      s_axi_lite_arready => s_axi_lite_arready,
      s_axi_lite_arvalid => s_axi_lite_arvalid,
      s_axi_lite_awaddr(3 downto 0) => s_axi_lite_awaddr(5 downto 2),
      s_axi_lite_awvalid => s_axi_lite_awvalid,
      s_axi_lite_bready => s_axi_lite_bready,
      s_axi_lite_bvalid => s_axi_lite_bvalid,
      s_axi_lite_rdata(31 downto 0) => s_axi_lite_rdata(31 downto 0),
      s_axi_lite_rready => s_axi_lite_rready,
      s_axi_lite_wdata(31 downto 0) => s_axi_lite_wdata(31 downto 0),
      s_axi_lite_wready => \^s_axi_lite_wready\,
      s_axi_lite_wvalid => s_axi_lite_wvalid,
      soft_reset => soft_reset,
      soft_reset_clr => soft_reset_clr,
      soft_reset_d1 => \GEN_RESET_FOR_MM2S.RESET_I/soft_reset_d1\,
      soft_reset_re0 => \GEN_RESET_FOR_MM2S.RESET_I/soft_reset_re0\
    );
I_PRMRY_DATAMOVER: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_datamover
     port map (
      D(47 downto 16) => s_axis_mm2s_cmd_tdata_split(66 downto 35),
      D(15) => s_axis_mm2s_cmd_tdata_split(33),
      D(14) => s_axis_mm2s_cmd_tdata_split(26),
      D(13 downto 0) => s_axis_mm2s_cmd_tdata_split(13 downto 0),
      m_axi_mm2s_aclk => m_axi_mm2s_aclk,
      m_axi_mm2s_araddr(31 downto 0) => m_axi_mm2s_araddr(31 downto 0),
      m_axi_mm2s_arburst(0) => m_axi_mm2s_arburst(0),
      m_axi_mm2s_arlen(1 downto 0) => m_axi_mm2s_arlen(1 downto 0),
      m_axi_mm2s_arready => m_axi_mm2s_arready,
      m_axi_mm2s_arsize(0) => m_axi_mm2s_arsize(2),
      m_axi_mm2s_arvalid => m_axi_mm2s_arvalid,
      m_axi_mm2s_rdata(127 downto 0) => m_axi_mm2s_rdata(127 downto 0),
      m_axi_mm2s_rlast => m_axi_mm2s_rlast,
      m_axi_mm2s_rready => m_axi_mm2s_rready,
      m_axi_mm2s_rresp(1 downto 0) => m_axi_mm2s_rresp(1 downto 0),
      m_axi_mm2s_rvalid => m_axi_mm2s_rvalid,
      m_axis_mm2s_sts_tready => m_axis_mm2s_sts_tready,
      m_axis_mm2s_sts_tvalid_int => m_axis_mm2s_sts_tvalid_int,
      m_axis_mm2s_tdata(127 downto 0) => m_axis_mm2s_tdata(127 downto 0),
      m_axis_mm2s_tkeep(15 downto 0) => m_axis_mm2s_tkeep(15 downto 0),
      m_axis_mm2s_tlast => \^m_axis_mm2s_tlast\,
      m_axis_mm2s_tready => m_axis_mm2s_tready,
      m_axis_mm2s_tvalid => \^m_axis_mm2s_tvalid\,
      mm2s_decerr_i => \GEN_MM2S_DMA_CONTROL.I_MM2S_CMDSTS/mm2s_decerr_i\,
      mm2s_halt_cmplt => mm2s_halt_cmplt,
      mm2s_interr_i => \GEN_MM2S_DMA_CONTROL.I_MM2S_CMDSTS/mm2s_interr_i\,
      mm2s_slverr_i => \GEN_MM2S_DMA_CONTROL.I_MM2S_CMDSTS/mm2s_slverr_i\,
      mm2s_sts_received => mm2s_sts_received,
      \out\ => m_axi_mm2s_aresetn,
      s_axi_lite_aclk => s_axi_lite_aclk,
      s_axis_mm2s_cmd_tready => s_axis_mm2s_cmd_tready,
      s_axis_mm2s_cmd_tvalid_split => s_axis_mm2s_cmd_tvalid_split,
      sig_rst2all_stop_request => \GEN_MM2S_FULL.I_MM2S_FULL_WRAPPER/sig_rst2all_stop_request\,
      sig_s_h_halt_reg_reg => I_RST_MODULE_n_11
    );
I_RST_MODULE: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_dma_rst_module
     port map (
      \GNE_SYNC_RESET.halt_i_reg\ => I_RST_MODULE_n_11,
      \GNE_SYNC_RESET.prmry_resetn_reg\ => mm2s_prmry_resetn,
      \GNE_SYNC_RESET.s_soft_reset_i_reg\ => m_axi_mm2s_aresetn,
      \GNE_SYNC_RESET.scndry_resetn_reg\(0) => \GEN_MM2S_REGISTERS.I_MM2S_DMA_REGISTER/halted1\,
      SR(0) => I_RST_MODULE_n_9,
      axi_resetn => axi_resetn,
      mm2s_all_idle => mm2s_all_idle,
      mm2s_cntrl_reset_out_n => mm2s_cntrl_reset_out_n,
      mm2s_halt_cmplt => mm2s_halt_cmplt,
      mm2s_prmry_reset_out_n => mm2s_prmry_reset_out_n,
      mm2s_stop => mm2s_stop,
      \out\ => m_axi_sg_aresetn,
      rdy => \GEN_AXI_LITE_IF.AXI_LITE_IF_I/rdy\,
      s_axi_lite_aclk => s_axi_lite_aclk,
      s_axi_lite_awaddr(0) => s_axi_lite_awaddr(6),
      \s_axi_lite_awaddr[6]\ => I_RST_MODULE_n_10,
      sig_rst2all_stop_request => \GEN_MM2S_FULL.I_MM2S_FULL_WRAPPER/sig_rst2all_stop_request\,
      soft_reset => soft_reset,
      soft_reset_clr => soft_reset_clr,
      soft_reset_d1 => \GEN_RESET_FOR_MM2S.RESET_I/soft_reset_d1\,
      soft_reset_re0 => \GEN_RESET_FOR_MM2S.RESET_I/soft_reset_re0\,
      \syncstages_ff_reg[3]\ => axi_lite_reset_n
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  port (
    s_axi_lite_aclk : in STD_LOGIC;
    m_axi_mm2s_aclk : in STD_LOGIC;
    axi_resetn : in STD_LOGIC;
    s_axi_lite_awvalid : in STD_LOGIC;
    s_axi_lite_awready : out STD_LOGIC;
    s_axi_lite_awaddr : in STD_LOGIC_VECTOR ( 9 downto 0 );
    s_axi_lite_wvalid : in STD_LOGIC;
    s_axi_lite_wready : out STD_LOGIC;
    s_axi_lite_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_lite_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_lite_bvalid : out STD_LOGIC;
    s_axi_lite_bready : in STD_LOGIC;
    s_axi_lite_arvalid : in STD_LOGIC;
    s_axi_lite_arready : out STD_LOGIC;
    s_axi_lite_araddr : in STD_LOGIC_VECTOR ( 9 downto 0 );
    s_axi_lite_rvalid : out STD_LOGIC;
    s_axi_lite_rready : in STD_LOGIC;
    s_axi_lite_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_lite_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_mm2s_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_mm2s_arlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_mm2s_arsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_mm2s_arburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_mm2s_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_mm2s_arcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_mm2s_arvalid : out STD_LOGIC;
    m_axi_mm2s_arready : in STD_LOGIC;
    m_axi_mm2s_rdata : in STD_LOGIC_VECTOR ( 127 downto 0 );
    m_axi_mm2s_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_mm2s_rlast : in STD_LOGIC;
    m_axi_mm2s_rvalid : in STD_LOGIC;
    m_axi_mm2s_rready : out STD_LOGIC;
    mm2s_prmry_reset_out_n : out STD_LOGIC;
    m_axis_mm2s_tdata : out STD_LOGIC_VECTOR ( 127 downto 0 );
    m_axis_mm2s_tkeep : out STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axis_mm2s_tvalid : out STD_LOGIC;
    m_axis_mm2s_tready : in STD_LOGIC;
    m_axis_mm2s_tlast : out STD_LOGIC;
    mm2s_introut : out STD_LOGIC;
    axi_dma_tstvec : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "gemm_block_v1_axi_dma_1_0,axi_dma,{}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "yes";
  attribute x_core_info : string;
  attribute x_core_info of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "axi_dma,Vivado 2025.2";
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  signal \<const0>\ : STD_LOGIC;
  signal \<const1>\ : STD_LOGIC;
  signal \^axi_dma_tstvec\ : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal \^m_axi_mm2s_arburst\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \^m_axi_mm2s_arlen\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \^m_axi_mm2s_arsize\ : STD_LOGIC_VECTOR ( 2 to 2 );
  signal NLW_U0_m_axi_s2mm_awvalid_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_m_axi_s2mm_bready_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_m_axi_s2mm_wlast_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_m_axi_s2mm_wvalid_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_m_axi_sg_arvalid_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_m_axi_sg_awvalid_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_m_axi_sg_bready_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_m_axi_sg_rready_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_m_axi_sg_wlast_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_m_axi_sg_wvalid_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_m_axis_mm2s_cntrl_tlast_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_m_axis_mm2s_cntrl_tvalid_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_mm2s_cntrl_reset_out_n_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_s2mm_introut_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_s2mm_prmry_reset_out_n_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_s2mm_sts_reset_out_n_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_s_axis_s2mm_sts_tready_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_s_axis_s2mm_tready_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_dma_tstvec_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 2 );
  signal NLW_U0_m_axi_mm2s_arburst_UNCONNECTED : STD_LOGIC_VECTOR ( 1 to 1 );
  signal NLW_U0_m_axi_mm2s_arcache_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_U0_m_axi_mm2s_arlen_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 2 );
  signal NLW_U0_m_axi_mm2s_arprot_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_U0_m_axi_mm2s_arsize_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_U0_m_axi_mm2s_aruser_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_U0_m_axi_s2mm_awaddr_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_U0_m_axi_s2mm_awburst_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_U0_m_axi_s2mm_awcache_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_U0_m_axi_s2mm_awlen_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_U0_m_axi_s2mm_awprot_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_U0_m_axi_s2mm_awsize_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_U0_m_axi_s2mm_awuser_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_U0_m_axi_s2mm_wdata_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_U0_m_axi_s2mm_wstrb_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_U0_m_axi_sg_araddr_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_U0_m_axi_sg_arburst_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_U0_m_axi_sg_arcache_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_U0_m_axi_sg_arlen_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_U0_m_axi_sg_arprot_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_U0_m_axi_sg_arsize_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_U0_m_axi_sg_aruser_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_U0_m_axi_sg_awaddr_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_U0_m_axi_sg_awburst_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_U0_m_axi_sg_awcache_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_U0_m_axi_sg_awlen_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_U0_m_axi_sg_awprot_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_U0_m_axi_sg_awsize_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_U0_m_axi_sg_awuser_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_U0_m_axi_sg_wdata_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_U0_m_axi_sg_wstrb_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_U0_m_axis_mm2s_cntrl_tdata_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_U0_m_axis_mm2s_cntrl_tkeep_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_U0_m_axis_mm2s_tdest_UNCONNECTED : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal NLW_U0_m_axis_mm2s_tid_UNCONNECTED : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal NLW_U0_m_axis_mm2s_tuser_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_U0_s_axi_lite_bresp_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_U0_s_axi_lite_rresp_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute C_DLYTMR_RESOLUTION : integer;
  attribute C_DLYTMR_RESOLUTION of U0 : label is 125;
  attribute C_ENABLE_MULTI_CHANNEL : integer;
  attribute C_ENABLE_MULTI_CHANNEL of U0 : label is 0;
  attribute C_FAMILY : string;
  attribute C_FAMILY of U0 : label is "zynquplus";
  attribute C_INCLUDE_MM2S : integer;
  attribute C_INCLUDE_MM2S of U0 : label is 1;
  attribute C_INCLUDE_MM2S_DRE : integer;
  attribute C_INCLUDE_MM2S_DRE of U0 : label is 0;
  attribute C_INCLUDE_MM2S_SF : integer;
  attribute C_INCLUDE_MM2S_SF of U0 : label is 1;
  attribute C_INCLUDE_S2MM : integer;
  attribute C_INCLUDE_S2MM of U0 : label is 0;
  attribute C_INCLUDE_S2MM_DRE : integer;
  attribute C_INCLUDE_S2MM_DRE of U0 : label is 0;
  attribute C_INCLUDE_S2MM_SF : integer;
  attribute C_INCLUDE_S2MM_SF of U0 : label is 1;
  attribute C_INCLUDE_SG : integer;
  attribute C_INCLUDE_SG of U0 : label is 0;
  attribute C_INCREASE_THROUGHPUT : integer;
  attribute C_INCREASE_THROUGHPUT of U0 : label is 0;
  attribute C_INSTANCE : string;
  attribute C_INSTANCE of U0 : label is "axi_dma";
  attribute C_MICRO_DMA : integer;
  attribute C_MICRO_DMA of U0 : label is 0;
  attribute C_MM2S_BURST_SIZE : integer;
  attribute C_MM2S_BURST_SIZE of U0 : label is 4;
  attribute C_M_AXIS_MM2S_CNTRL_TDATA_WIDTH : integer;
  attribute C_M_AXIS_MM2S_CNTRL_TDATA_WIDTH of U0 : label is 32;
  attribute C_M_AXIS_MM2S_TDATA_WIDTH : integer;
  attribute C_M_AXIS_MM2S_TDATA_WIDTH of U0 : label is 128;
  attribute C_M_AXI_MM2S_ADDR_WIDTH : integer;
  attribute C_M_AXI_MM2S_ADDR_WIDTH of U0 : label is 32;
  attribute C_M_AXI_MM2S_DATA_WIDTH : integer;
  attribute C_M_AXI_MM2S_DATA_WIDTH of U0 : label is 128;
  attribute C_M_AXI_S2MM_ADDR_WIDTH : integer;
  attribute C_M_AXI_S2MM_ADDR_WIDTH of U0 : label is 32;
  attribute C_M_AXI_S2MM_DATA_WIDTH : integer;
  attribute C_M_AXI_S2MM_DATA_WIDTH of U0 : label is 32;
  attribute C_M_AXI_SG_ADDR_WIDTH : integer;
  attribute C_M_AXI_SG_ADDR_WIDTH of U0 : label is 32;
  attribute C_M_AXI_SG_DATA_WIDTH : integer;
  attribute C_M_AXI_SG_DATA_WIDTH of U0 : label is 32;
  attribute C_NUM_MM2S_CHANNELS : integer;
  attribute C_NUM_MM2S_CHANNELS of U0 : label is 1;
  attribute C_NUM_S2MM_CHANNELS : integer;
  attribute C_NUM_S2MM_CHANNELS of U0 : label is 1;
  attribute C_PRMRY_IS_ACLK_ASYNC : integer;
  attribute C_PRMRY_IS_ACLK_ASYNC of U0 : label is 0;
  attribute C_S2MM_BURST_SIZE : integer;
  attribute C_S2MM_BURST_SIZE of U0 : label is 16;
  attribute C_SG_INCLUDE_STSCNTRL_STRM : integer;
  attribute C_SG_INCLUDE_STSCNTRL_STRM of U0 : label is 0;
  attribute C_SG_LENGTH_WIDTH : integer;
  attribute C_SG_LENGTH_WIDTH of U0 : label is 14;
  attribute C_SG_USE_STSAPP_LENGTH : integer;
  attribute C_SG_USE_STSAPP_LENGTH of U0 : label is 0;
  attribute C_S_AXIS_S2MM_STS_TDATA_WIDTH : integer;
  attribute C_S_AXIS_S2MM_STS_TDATA_WIDTH of U0 : label is 32;
  attribute C_S_AXIS_S2MM_TDATA_WIDTH : integer;
  attribute C_S_AXIS_S2MM_TDATA_WIDTH of U0 : label is 32;
  attribute C_S_AXI_LITE_ADDR_WIDTH : integer;
  attribute C_S_AXI_LITE_ADDR_WIDTH of U0 : label is 10;
  attribute C_S_AXI_LITE_DATA_WIDTH : integer;
  attribute C_S_AXI_LITE_DATA_WIDTH of U0 : label is 32;
  attribute downgradeipidentifiedwarnings of U0 : label is "yes";
  attribute x_interface_info : string;
  attribute x_interface_info of axi_resetn : signal is "xilinx.com:signal:reset:1.0 AXI_RESETN RST";
  attribute x_interface_mode : string;
  attribute x_interface_mode of axi_resetn : signal is "slave AXI_RESETN";
  attribute x_interface_parameter : string;
  attribute x_interface_parameter of axi_resetn : signal is "XIL_INTERFACENAME AXI_RESETN, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  attribute x_interface_info of m_axi_mm2s_aclk : signal is "xilinx.com:signal:clock:1.0 M_AXI_MM2S_CLK CLK";
  attribute x_interface_mode of m_axi_mm2s_aclk : signal is "slave M_AXI_MM2S_CLK";
  attribute x_interface_parameter of m_axi_mm2s_aclk : signal is "XIL_INTERFACENAME M_AXI_MM2S_CLK, ASSOCIATED_BUSIF M_AXI_MM2S:M_AXIS_MM2S:M_AXIS_CNTRL, ASSOCIATED_RESET mm2s_prmry_reset_out_n:mm2s_cntrl_reset_out_n, FREQ_HZ 199998001, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN gemm_block_v1_zynq_ultra_ps_e_0_0_pl_clk0, INSERT_VIP 0";
  attribute x_interface_info of m_axi_mm2s_arready : signal is "xilinx.com:interface:aximm:1.0 M_AXI_MM2S ARREADY";
  attribute x_interface_info of m_axi_mm2s_arvalid : signal is "xilinx.com:interface:aximm:1.0 M_AXI_MM2S ARVALID";
  attribute x_interface_info of m_axi_mm2s_rlast : signal is "xilinx.com:interface:aximm:1.0 M_AXI_MM2S RLAST";
  attribute x_interface_info of m_axi_mm2s_rready : signal is "xilinx.com:interface:aximm:1.0 M_AXI_MM2S RREADY";
  attribute x_interface_info of m_axi_mm2s_rvalid : signal is "xilinx.com:interface:aximm:1.0 M_AXI_MM2S RVALID";
  attribute x_interface_info of m_axis_mm2s_tlast : signal is "xilinx.com:interface:axis:1.0 M_AXIS_MM2S TLAST";
  attribute x_interface_info of m_axis_mm2s_tready : signal is "xilinx.com:interface:axis:1.0 M_AXIS_MM2S TREADY";
  attribute x_interface_info of m_axis_mm2s_tvalid : signal is "xilinx.com:interface:axis:1.0 M_AXIS_MM2S TVALID";
  attribute x_interface_info of mm2s_introut : signal is "xilinx.com:signal:interrupt:1.0 MM2S_INTROUT INTERRUPT";
  attribute x_interface_mode of mm2s_introut : signal is "master MM2S_INTROUT";
  attribute x_interface_parameter of mm2s_introut : signal is "XIL_INTERFACENAME MM2S_INTROUT, SENSITIVITY LEVEL_HIGH, PortWidth 1";
  attribute x_interface_info of mm2s_prmry_reset_out_n : signal is "xilinx.com:signal:reset:1.0 MM2S_PRMRY_RESET_OUT_N RST";
  attribute x_interface_mode of mm2s_prmry_reset_out_n : signal is "master MM2S_PRMRY_RESET_OUT_N";
  attribute x_interface_parameter of mm2s_prmry_reset_out_n : signal is "XIL_INTERFACENAME MM2S_PRMRY_RESET_OUT_N, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  attribute x_interface_info of s_axi_lite_aclk : signal is "xilinx.com:signal:clock:1.0 S_AXI_LITE_ACLK CLK";
  attribute x_interface_mode of s_axi_lite_aclk : signal is "slave S_AXI_LITE_ACLK";
  attribute x_interface_parameter of s_axi_lite_aclk : signal is "XIL_INTERFACENAME S_AXI_LITE_ACLK, ASSOCIATED_BUSIF S_AXI_LITE:M_AXI, ASSOCIATED_RESET axi_resetn, FREQ_HZ 199998001, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN gemm_block_v1_zynq_ultra_ps_e_0_0_pl_clk0, INSERT_VIP 0";
  attribute x_interface_info of s_axi_lite_arready : signal is "xilinx.com:interface:aximm:1.0 S_AXI_LITE ARREADY";
  attribute x_interface_info of s_axi_lite_arvalid : signal is "xilinx.com:interface:aximm:1.0 S_AXI_LITE ARVALID";
  attribute x_interface_info of s_axi_lite_awready : signal is "xilinx.com:interface:aximm:1.0 S_AXI_LITE AWREADY";
  attribute x_interface_info of s_axi_lite_awvalid : signal is "xilinx.com:interface:aximm:1.0 S_AXI_LITE AWVALID";
  attribute x_interface_mode of s_axi_lite_awvalid : signal is "slave S_AXI_LITE";
  attribute x_interface_parameter of s_axi_lite_awvalid : signal is "XIL_INTERFACENAME S_AXI_LITE, DATA_WIDTH 32, PROTOCOL AXI4LITE, FREQ_HZ 199998001, ID_WIDTH 0, ADDR_WIDTH 10, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 0, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 0, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 8, NUM_WRITE_OUTSTANDING 8, MAX_BURST_LENGTH 1, PHASE 0.0, CLK_DOMAIN gemm_block_v1_zynq_ultra_ps_e_0_0_pl_clk0, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0";
  attribute x_interface_info of s_axi_lite_bready : signal is "xilinx.com:interface:aximm:1.0 S_AXI_LITE BREADY";
  attribute x_interface_info of s_axi_lite_bvalid : signal is "xilinx.com:interface:aximm:1.0 S_AXI_LITE BVALID";
  attribute x_interface_info of s_axi_lite_rready : signal is "xilinx.com:interface:aximm:1.0 S_AXI_LITE RREADY";
  attribute x_interface_info of s_axi_lite_rvalid : signal is "xilinx.com:interface:aximm:1.0 S_AXI_LITE RVALID";
  attribute x_interface_info of s_axi_lite_wready : signal is "xilinx.com:interface:aximm:1.0 S_AXI_LITE WREADY";
  attribute x_interface_info of s_axi_lite_wvalid : signal is "xilinx.com:interface:aximm:1.0 S_AXI_LITE WVALID";
  attribute x_interface_info of m_axi_mm2s_araddr : signal is "xilinx.com:interface:aximm:1.0 M_AXI_MM2S ARADDR";
  attribute x_interface_mode of m_axi_mm2s_araddr : signal is "master M_AXI_MM2S";
  attribute x_interface_parameter of m_axi_mm2s_araddr : signal is "XIL_INTERFACENAME M_AXI_MM2S, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 16, DATA_WIDTH 128, PROTOCOL AXI4, FREQ_HZ 199998001, ID_WIDTH 0, ADDR_WIDTH 32, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_ONLY, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 1, HAS_CACHE 1, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 0, HAS_BRESP 0, HAS_RRESP 1, NUM_WRITE_OUTSTANDING 2, MAX_BURST_LENGTH 4, PHASE 0.0, CLK_DOMAIN gemm_block_v1_zynq_ultra_ps_e_0_0_pl_clk0, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0";
  attribute x_interface_info of m_axi_mm2s_arburst : signal is "xilinx.com:interface:aximm:1.0 M_AXI_MM2S ARBURST";
  attribute x_interface_info of m_axi_mm2s_arcache : signal is "xilinx.com:interface:aximm:1.0 M_AXI_MM2S ARCACHE";
  attribute x_interface_info of m_axi_mm2s_arlen : signal is "xilinx.com:interface:aximm:1.0 M_AXI_MM2S ARLEN";
  attribute x_interface_info of m_axi_mm2s_arprot : signal is "xilinx.com:interface:aximm:1.0 M_AXI_MM2S ARPROT";
  attribute x_interface_info of m_axi_mm2s_arsize : signal is "xilinx.com:interface:aximm:1.0 M_AXI_MM2S ARSIZE";
  attribute x_interface_info of m_axi_mm2s_rdata : signal is "xilinx.com:interface:aximm:1.0 M_AXI_MM2S RDATA";
  attribute x_interface_info of m_axi_mm2s_rresp : signal is "xilinx.com:interface:aximm:1.0 M_AXI_MM2S RRESP";
  attribute x_interface_info of m_axis_mm2s_tdata : signal is "xilinx.com:interface:axis:1.0 M_AXIS_MM2S TDATA";
  attribute x_interface_mode of m_axis_mm2s_tdata : signal is "master M_AXIS_MM2S";
  attribute x_interface_parameter of m_axis_mm2s_tdata : signal is "XIL_INTERFACENAME M_AXIS_MM2S, TDATA_NUM_BYTES 16, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 1, HAS_TLAST 1, FREQ_HZ 199998001, PHASE 0.0, CLK_DOMAIN gemm_block_v1_zynq_ultra_ps_e_0_0_pl_clk0, LAYERED_METADATA undef, INSERT_VIP 0";
  attribute x_interface_info of m_axis_mm2s_tkeep : signal is "xilinx.com:interface:axis:1.0 M_AXIS_MM2S TKEEP";
  attribute x_interface_info of s_axi_lite_araddr : signal is "xilinx.com:interface:aximm:1.0 S_AXI_LITE ARADDR";
  attribute x_interface_info of s_axi_lite_awaddr : signal is "xilinx.com:interface:aximm:1.0 S_AXI_LITE AWADDR";
  attribute x_interface_info of s_axi_lite_bresp : signal is "xilinx.com:interface:aximm:1.0 S_AXI_LITE BRESP";
  attribute x_interface_info of s_axi_lite_rdata : signal is "xilinx.com:interface:aximm:1.0 S_AXI_LITE RDATA";
  attribute x_interface_info of s_axi_lite_rresp : signal is "xilinx.com:interface:aximm:1.0 S_AXI_LITE RRESP";
  attribute x_interface_info of s_axi_lite_wdata : signal is "xilinx.com:interface:aximm:1.0 S_AXI_LITE WDATA";
begin
  axi_dma_tstvec(31) <= \<const0>\;
  axi_dma_tstvec(30) <= \<const0>\;
  axi_dma_tstvec(29) <= \<const0>\;
  axi_dma_tstvec(28) <= \<const0>\;
  axi_dma_tstvec(27) <= \<const0>\;
  axi_dma_tstvec(26) <= \<const0>\;
  axi_dma_tstvec(25) <= \<const0>\;
  axi_dma_tstvec(24) <= \<const0>\;
  axi_dma_tstvec(23) <= \<const0>\;
  axi_dma_tstvec(22) <= \<const0>\;
  axi_dma_tstvec(21) <= \<const0>\;
  axi_dma_tstvec(20) <= \<const0>\;
  axi_dma_tstvec(19) <= \<const0>\;
  axi_dma_tstvec(18) <= \<const0>\;
  axi_dma_tstvec(17) <= \<const0>\;
  axi_dma_tstvec(16) <= \<const0>\;
  axi_dma_tstvec(15) <= \<const0>\;
  axi_dma_tstvec(14) <= \<const0>\;
  axi_dma_tstvec(13) <= \<const0>\;
  axi_dma_tstvec(12) <= \<const0>\;
  axi_dma_tstvec(11) <= \<const0>\;
  axi_dma_tstvec(10) <= \<const0>\;
  axi_dma_tstvec(9) <= \<const0>\;
  axi_dma_tstvec(8) <= \<const0>\;
  axi_dma_tstvec(7) <= \<const0>\;
  axi_dma_tstvec(6) <= \<const0>\;
  axi_dma_tstvec(5) <= \<const0>\;
  axi_dma_tstvec(4) <= \^axi_dma_tstvec\(4);
  axi_dma_tstvec(3) <= \<const0>\;
  axi_dma_tstvec(2) <= \<const0>\;
  axi_dma_tstvec(1 downto 0) <= \^axi_dma_tstvec\(1 downto 0);
  m_axi_mm2s_arburst(1) <= \<const0>\;
  m_axi_mm2s_arburst(0) <= \^m_axi_mm2s_arburst\(0);
  m_axi_mm2s_arcache(3) <= \<const0>\;
  m_axi_mm2s_arcache(2) <= \<const0>\;
  m_axi_mm2s_arcache(1) <= \<const1>\;
  m_axi_mm2s_arcache(0) <= \<const1>\;
  m_axi_mm2s_arlen(7) <= \<const0>\;
  m_axi_mm2s_arlen(6) <= \<const0>\;
  m_axi_mm2s_arlen(5) <= \<const0>\;
  m_axi_mm2s_arlen(4) <= \<const0>\;
  m_axi_mm2s_arlen(3) <= \<const0>\;
  m_axi_mm2s_arlen(2) <= \<const0>\;
  m_axi_mm2s_arlen(1 downto 0) <= \^m_axi_mm2s_arlen\(1 downto 0);
  m_axi_mm2s_arprot(2) <= \<const0>\;
  m_axi_mm2s_arprot(1) <= \<const0>\;
  m_axi_mm2s_arprot(0) <= \<const0>\;
  m_axi_mm2s_arsize(2) <= \^m_axi_mm2s_arsize\(2);
  m_axi_mm2s_arsize(1) <= \<const0>\;
  m_axi_mm2s_arsize(0) <= \<const0>\;
  s_axi_lite_bresp(1) <= \<const0>\;
  s_axi_lite_bresp(0) <= \<const0>\;
  s_axi_lite_rresp(1) <= \<const0>\;
  s_axi_lite_rresp(0) <= \<const0>\;
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
U0: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_dma
     port map (
      axi_dma_tstvec(31 downto 5) => NLW_U0_axi_dma_tstvec_UNCONNECTED(31 downto 5),
      axi_dma_tstvec(4) => \^axi_dma_tstvec\(4),
      axi_dma_tstvec(3 downto 2) => NLW_U0_axi_dma_tstvec_UNCONNECTED(3 downto 2),
      axi_dma_tstvec(1 downto 0) => \^axi_dma_tstvec\(1 downto 0),
      axi_resetn => axi_resetn,
      m_axi_mm2s_aclk => m_axi_mm2s_aclk,
      m_axi_mm2s_araddr(31 downto 0) => m_axi_mm2s_araddr(31 downto 0),
      m_axi_mm2s_arburst(1) => NLW_U0_m_axi_mm2s_arburst_UNCONNECTED(1),
      m_axi_mm2s_arburst(0) => \^m_axi_mm2s_arburst\(0),
      m_axi_mm2s_arcache(3 downto 0) => NLW_U0_m_axi_mm2s_arcache_UNCONNECTED(3 downto 0),
      m_axi_mm2s_arlen(7 downto 2) => NLW_U0_m_axi_mm2s_arlen_UNCONNECTED(7 downto 2),
      m_axi_mm2s_arlen(1 downto 0) => \^m_axi_mm2s_arlen\(1 downto 0),
      m_axi_mm2s_arprot(2 downto 0) => NLW_U0_m_axi_mm2s_arprot_UNCONNECTED(2 downto 0),
      m_axi_mm2s_arready => m_axi_mm2s_arready,
      m_axi_mm2s_arsize(2) => \^m_axi_mm2s_arsize\(2),
      m_axi_mm2s_arsize(1 downto 0) => NLW_U0_m_axi_mm2s_arsize_UNCONNECTED(1 downto 0),
      m_axi_mm2s_aruser(3 downto 0) => NLW_U0_m_axi_mm2s_aruser_UNCONNECTED(3 downto 0),
      m_axi_mm2s_arvalid => m_axi_mm2s_arvalid,
      m_axi_mm2s_rdata(127 downto 0) => m_axi_mm2s_rdata(127 downto 0),
      m_axi_mm2s_rlast => m_axi_mm2s_rlast,
      m_axi_mm2s_rready => m_axi_mm2s_rready,
      m_axi_mm2s_rresp(1 downto 0) => m_axi_mm2s_rresp(1 downto 0),
      m_axi_mm2s_rvalid => m_axi_mm2s_rvalid,
      m_axi_s2mm_aclk => '0',
      m_axi_s2mm_awaddr(31 downto 0) => NLW_U0_m_axi_s2mm_awaddr_UNCONNECTED(31 downto 0),
      m_axi_s2mm_awburst(1 downto 0) => NLW_U0_m_axi_s2mm_awburst_UNCONNECTED(1 downto 0),
      m_axi_s2mm_awcache(3 downto 0) => NLW_U0_m_axi_s2mm_awcache_UNCONNECTED(3 downto 0),
      m_axi_s2mm_awlen(7 downto 0) => NLW_U0_m_axi_s2mm_awlen_UNCONNECTED(7 downto 0),
      m_axi_s2mm_awprot(2 downto 0) => NLW_U0_m_axi_s2mm_awprot_UNCONNECTED(2 downto 0),
      m_axi_s2mm_awready => '0',
      m_axi_s2mm_awsize(2 downto 0) => NLW_U0_m_axi_s2mm_awsize_UNCONNECTED(2 downto 0),
      m_axi_s2mm_awuser(3 downto 0) => NLW_U0_m_axi_s2mm_awuser_UNCONNECTED(3 downto 0),
      m_axi_s2mm_awvalid => NLW_U0_m_axi_s2mm_awvalid_UNCONNECTED,
      m_axi_s2mm_bready => NLW_U0_m_axi_s2mm_bready_UNCONNECTED,
      m_axi_s2mm_bresp(1 downto 0) => B"00",
      m_axi_s2mm_bvalid => '0',
      m_axi_s2mm_wdata(31 downto 0) => NLW_U0_m_axi_s2mm_wdata_UNCONNECTED(31 downto 0),
      m_axi_s2mm_wlast => NLW_U0_m_axi_s2mm_wlast_UNCONNECTED,
      m_axi_s2mm_wready => '0',
      m_axi_s2mm_wstrb(3 downto 0) => NLW_U0_m_axi_s2mm_wstrb_UNCONNECTED(3 downto 0),
      m_axi_s2mm_wvalid => NLW_U0_m_axi_s2mm_wvalid_UNCONNECTED,
      m_axi_sg_aclk => '0',
      m_axi_sg_araddr(31 downto 0) => NLW_U0_m_axi_sg_araddr_UNCONNECTED(31 downto 0),
      m_axi_sg_arburst(1 downto 0) => NLW_U0_m_axi_sg_arburst_UNCONNECTED(1 downto 0),
      m_axi_sg_arcache(3 downto 0) => NLW_U0_m_axi_sg_arcache_UNCONNECTED(3 downto 0),
      m_axi_sg_arlen(7 downto 0) => NLW_U0_m_axi_sg_arlen_UNCONNECTED(7 downto 0),
      m_axi_sg_arprot(2 downto 0) => NLW_U0_m_axi_sg_arprot_UNCONNECTED(2 downto 0),
      m_axi_sg_arready => '0',
      m_axi_sg_arsize(2 downto 0) => NLW_U0_m_axi_sg_arsize_UNCONNECTED(2 downto 0),
      m_axi_sg_aruser(3 downto 0) => NLW_U0_m_axi_sg_aruser_UNCONNECTED(3 downto 0),
      m_axi_sg_arvalid => NLW_U0_m_axi_sg_arvalid_UNCONNECTED,
      m_axi_sg_awaddr(31 downto 0) => NLW_U0_m_axi_sg_awaddr_UNCONNECTED(31 downto 0),
      m_axi_sg_awburst(1 downto 0) => NLW_U0_m_axi_sg_awburst_UNCONNECTED(1 downto 0),
      m_axi_sg_awcache(3 downto 0) => NLW_U0_m_axi_sg_awcache_UNCONNECTED(3 downto 0),
      m_axi_sg_awlen(7 downto 0) => NLW_U0_m_axi_sg_awlen_UNCONNECTED(7 downto 0),
      m_axi_sg_awprot(2 downto 0) => NLW_U0_m_axi_sg_awprot_UNCONNECTED(2 downto 0),
      m_axi_sg_awready => '0',
      m_axi_sg_awsize(2 downto 0) => NLW_U0_m_axi_sg_awsize_UNCONNECTED(2 downto 0),
      m_axi_sg_awuser(3 downto 0) => NLW_U0_m_axi_sg_awuser_UNCONNECTED(3 downto 0),
      m_axi_sg_awvalid => NLW_U0_m_axi_sg_awvalid_UNCONNECTED,
      m_axi_sg_bready => NLW_U0_m_axi_sg_bready_UNCONNECTED,
      m_axi_sg_bresp(1 downto 0) => B"00",
      m_axi_sg_bvalid => '0',
      m_axi_sg_rdata(31 downto 0) => B"00000000000000000000000000000000",
      m_axi_sg_rlast => '0',
      m_axi_sg_rready => NLW_U0_m_axi_sg_rready_UNCONNECTED,
      m_axi_sg_rresp(1 downto 0) => B"00",
      m_axi_sg_rvalid => '0',
      m_axi_sg_wdata(31 downto 0) => NLW_U0_m_axi_sg_wdata_UNCONNECTED(31 downto 0),
      m_axi_sg_wlast => NLW_U0_m_axi_sg_wlast_UNCONNECTED,
      m_axi_sg_wready => '0',
      m_axi_sg_wstrb(3 downto 0) => NLW_U0_m_axi_sg_wstrb_UNCONNECTED(3 downto 0),
      m_axi_sg_wvalid => NLW_U0_m_axi_sg_wvalid_UNCONNECTED,
      m_axis_mm2s_cntrl_tdata(31 downto 0) => NLW_U0_m_axis_mm2s_cntrl_tdata_UNCONNECTED(31 downto 0),
      m_axis_mm2s_cntrl_tkeep(3 downto 0) => NLW_U0_m_axis_mm2s_cntrl_tkeep_UNCONNECTED(3 downto 0),
      m_axis_mm2s_cntrl_tlast => NLW_U0_m_axis_mm2s_cntrl_tlast_UNCONNECTED,
      m_axis_mm2s_cntrl_tready => '0',
      m_axis_mm2s_cntrl_tvalid => NLW_U0_m_axis_mm2s_cntrl_tvalid_UNCONNECTED,
      m_axis_mm2s_tdata(127 downto 0) => m_axis_mm2s_tdata(127 downto 0),
      m_axis_mm2s_tdest(4 downto 0) => NLW_U0_m_axis_mm2s_tdest_UNCONNECTED(4 downto 0),
      m_axis_mm2s_tid(4 downto 0) => NLW_U0_m_axis_mm2s_tid_UNCONNECTED(4 downto 0),
      m_axis_mm2s_tkeep(15 downto 0) => m_axis_mm2s_tkeep(15 downto 0),
      m_axis_mm2s_tlast => m_axis_mm2s_tlast,
      m_axis_mm2s_tready => m_axis_mm2s_tready,
      m_axis_mm2s_tuser(3 downto 0) => NLW_U0_m_axis_mm2s_tuser_UNCONNECTED(3 downto 0),
      m_axis_mm2s_tvalid => m_axis_mm2s_tvalid,
      mm2s_cntrl_reset_out_n => NLW_U0_mm2s_cntrl_reset_out_n_UNCONNECTED,
      mm2s_introut => mm2s_introut,
      mm2s_prmry_reset_out_n => mm2s_prmry_reset_out_n,
      s2mm_introut => NLW_U0_s2mm_introut_UNCONNECTED,
      s2mm_prmry_reset_out_n => NLW_U0_s2mm_prmry_reset_out_n_UNCONNECTED,
      s2mm_sts_reset_out_n => NLW_U0_s2mm_sts_reset_out_n_UNCONNECTED,
      s_axi_lite_aclk => s_axi_lite_aclk,
      s_axi_lite_araddr(9 downto 0) => s_axi_lite_araddr(9 downto 0),
      s_axi_lite_arready => s_axi_lite_arready,
      s_axi_lite_arvalid => s_axi_lite_arvalid,
      s_axi_lite_awaddr(9 downto 7) => B"000",
      s_axi_lite_awaddr(6 downto 2) => s_axi_lite_awaddr(6 downto 2),
      s_axi_lite_awaddr(1 downto 0) => B"00",
      s_axi_lite_awready => s_axi_lite_awready,
      s_axi_lite_awvalid => s_axi_lite_awvalid,
      s_axi_lite_bready => s_axi_lite_bready,
      s_axi_lite_bresp(1 downto 0) => NLW_U0_s_axi_lite_bresp_UNCONNECTED(1 downto 0),
      s_axi_lite_bvalid => s_axi_lite_bvalid,
      s_axi_lite_rdata(31 downto 0) => s_axi_lite_rdata(31 downto 0),
      s_axi_lite_rready => s_axi_lite_rready,
      s_axi_lite_rresp(1 downto 0) => NLW_U0_s_axi_lite_rresp_UNCONNECTED(1 downto 0),
      s_axi_lite_rvalid => s_axi_lite_rvalid,
      s_axi_lite_wdata(31 downto 0) => s_axi_lite_wdata(31 downto 0),
      s_axi_lite_wready => s_axi_lite_wready,
      s_axi_lite_wvalid => s_axi_lite_wvalid,
      s_axis_s2mm_sts_tdata(31 downto 0) => B"00000000000000000000000000000000",
      s_axis_s2mm_sts_tkeep(3 downto 0) => B"1111",
      s_axis_s2mm_sts_tlast => '0',
      s_axis_s2mm_sts_tready => NLW_U0_s_axis_s2mm_sts_tready_UNCONNECTED,
      s_axis_s2mm_sts_tvalid => '0',
      s_axis_s2mm_tdata(31 downto 0) => B"00000000000000000000000000000000",
      s_axis_s2mm_tdest(4 downto 0) => B"00000",
      s_axis_s2mm_tid(4 downto 0) => B"00000",
      s_axis_s2mm_tkeep(3 downto 0) => B"1111",
      s_axis_s2mm_tlast => '0',
      s_axis_s2mm_tready => NLW_U0_s_axis_s2mm_tready_UNCONNECTED,
      s_axis_s2mm_tuser(3 downto 0) => B"0000",
      s_axis_s2mm_tvalid => '0'
    );
VCC: unisim.vcomponents.VCC
     port map (
      P => \<const1>\
    );
end STRUCTURE;

-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
-- Date        : Tue Mar 31 21:17:10 2026
-- Host        : VuDuong-32 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               d:/HK6/Project1/testing/mul_reg/mul_reg/mul_reg.gen/sources_1/bd/mul_block/ip/mul_block_mul_pu_0_0/mul_block_mul_pu_0_0_sim_netlist.vhdl
-- Design      : mul_block_mul_pu_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xck26-sfvc784-2LV-c
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity mul_block_mul_pu_0_0_mul_reg is
  port (
    res : out STD_LOGIC_VECTOR ( 7 downto 0 );
    b : in STD_LOGIC_VECTOR ( 3 downto 0 );
    a : in STD_LOGIC_VECTOR ( 3 downto 0 );
    clk : in STD_LOGIC;
    rst_n : in STD_LOGIC;
    start : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of mul_block_mul_pu_0_0_mul_reg : entity is "mul_reg";
end mul_block_mul_pu_0_0_mul_reg;

architecture STRUCTURE of mul_block_mul_pu_0_0_mul_reg is
  signal en : STD_LOGIC;
  signal res0 : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \res[3]_i_4_n_0\ : STD_LOGIC;
  signal \res[3]_i_5_n_0\ : STD_LOGIC;
  signal \res[3]_i_6_n_0\ : STD_LOGIC;
  signal \res[3]_i_7_n_0\ : STD_LOGIC;
  signal \res[4]_i_4_n_0\ : STD_LOGIC;
  signal \res[4]_i_5_n_0\ : STD_LOGIC;
  signal \res[4]_i_6_n_0\ : STD_LOGIC;
  signal \res[4]_i_7_n_0\ : STD_LOGIC;
  signal \res[5]_i_4_n_0\ : STD_LOGIC;
  signal \res[5]_i_5_n_0\ : STD_LOGIC;
  signal \res[5]_i_6_n_0\ : STD_LOGIC;
  signal \res[5]_i_7_n_0\ : STD_LOGIC;
  signal \res[6]_i_2_n_0\ : STD_LOGIC;
  signal \res[6]_i_3_n_0\ : STD_LOGIC;
  signal \res[7]_i_3_n_0\ : STD_LOGIC;
  signal \res[7]_i_4_n_0\ : STD_LOGIC;
  signal \res_reg[3]_i_2_n_0\ : STD_LOGIC;
  signal \res_reg[3]_i_3_n_0\ : STD_LOGIC;
  signal \res_reg[4]_i_2_n_0\ : STD_LOGIC;
  signal \res_reg[4]_i_3_n_0\ : STD_LOGIC;
  signal \res_reg[5]_i_2_n_0\ : STD_LOGIC;
  signal \res_reg[5]_i_3_n_0\ : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \res[0]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \res[1]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \res[6]_i_2\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \res[7]_i_4\ : label is "soft_lutpair1";
begin
\res[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => a(0),
      I1 => b(0),
      O => res0(0)
    );
\res[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7888"
    )
        port map (
      I0 => a(1),
      I1 => b(0),
      I2 => b(1),
      I3 => a(0),
      O => res0(1)
    );
\res[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4B77788878887888"
    )
        port map (
      I0 => a(2),
      I1 => b(0),
      I2 => b(2),
      I3 => a(0),
      I4 => a(1),
      I5 => b(1),
      O => res0(2)
    );
\res[3]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"27DF28A06020A0A0"
    )
        port map (
      I0 => a(2),
      I1 => b(0),
      I2 => b(1),
      I3 => a(0),
      I4 => a(1),
      I5 => b(2),
      O => \res[3]_i_4_n_0\
    );
\res[3]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EB13E46CACEC6C6C"
    )
        port map (
      I0 => a(2),
      I1 => b(0),
      I2 => b(1),
      I3 => a(0),
      I4 => a(1),
      I5 => b(2),
      O => \res[3]_i_5_n_0\
    );
\res[3]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"D8DFD7A09F205FA0"
    )
        port map (
      I0 => a(2),
      I1 => b(0),
      I2 => b(1),
      I3 => a(0),
      I4 => a(1),
      I5 => b(2),
      O => \res[3]_i_6_n_0\
    );
\res[3]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"14131B6C53EC936C"
    )
        port map (
      I0 => a(2),
      I1 => b(0),
      I2 => b(1),
      I3 => a(0),
      I4 => a(1),
      I5 => b(2),
      O => \res[3]_i_7_n_0\
    );
\res[4]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B44C80000CCC8000"
    )
        port map (
      I0 => b(0),
      I1 => a(2),
      I2 => b(1),
      I3 => a(1),
      I4 => b(2),
      I5 => a(0),
      O => \res[4]_i_4_n_0\
    );
\res[4]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E1FBF1BBAECCA6CC"
    )
        port map (
      I0 => a(2),
      I1 => b(0),
      I2 => a(1),
      I3 => b(2),
      I4 => a(0),
      I5 => b(1),
      O => \res[4]_i_5_n_0\
    );
\res[4]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"DDC8DD7FFD77AA00"
    )
        port map (
      I0 => a(2),
      I1 => b(1),
      I2 => b(0),
      I3 => b(2),
      I4 => a(0),
      I5 => a(1),
      O => \res[4]_i_6_n_0\
    );
\res[4]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"05041053021B5F6C"
    )
        port map (
      I0 => a(2),
      I1 => b(0),
      I2 => b(2),
      I3 => a(0),
      I4 => b(1),
      I5 => a(1),
      O => \res[4]_i_7_n_0\
    );
\res[5]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E080808000000000"
    )
        port map (
      I0 => b(1),
      I1 => a(1),
      I2 => b(2),
      I3 => b(0),
      I4 => a(0),
      I5 => a(2),
      O => \res[5]_i_4_n_0\
    );
\res[5]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BAAAFBFBFFFFCCCC"
    )
        port map (
      I0 => a(2),
      I1 => b(0),
      I2 => a(1),
      I3 => a(0),
      I4 => b(1),
      I5 => b(2),
      O => \res[5]_i_5_n_0\
    );
\res[5]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0FFFCFFF8FFFF00"
    )
        port map (
      I0 => b(0),
      I1 => b(1),
      I2 => b(2),
      I3 => a(2),
      I4 => a(1),
      I5 => a(0),
      O => \res[5]_i_6_n_0\
    );
\res[5]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000015500015556"
    )
        port map (
      I0 => a(2),
      I1 => b(0),
      I2 => a(0),
      I3 => b(1),
      I4 => b(2),
      I5 => a(1),
      O => \res[5]_i_7_n_0\
    );
\res[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2F20FFFF2F200000"
    )
        port map (
      I0 => \res[6]_i_2_n_0\,
      I1 => a(2),
      I2 => a(3),
      I3 => \res[6]_i_3_n_0\,
      I4 => b(3),
      I5 => \res[7]_i_4_n_0\,
      O => res0(6)
    );
\res[6]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000001"
    )
        port map (
      I0 => a(0),
      I1 => b(2),
      I2 => a(1),
      I3 => b(1),
      I4 => b(0),
      O => \res[6]_i_2_n_0\
    );
\res[6]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => a(0),
      I1 => a(1),
      I2 => a(2),
      O => \res[6]_i_3_n_0\
    );
\res[7]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => start,
      I1 => rst_n,
      O => en
    );
\res[7]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00FEFFFF00FE0000"
    )
        port map (
      I0 => a(2),
      I1 => a(1),
      I2 => a(0),
      I3 => a(3),
      I4 => b(3),
      I5 => \res[7]_i_4_n_0\,
      O => res0(7)
    );
\res[7]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => rst_n,
      O => \res[7]_i_3_n_0\
    );
\res[7]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FE00"
    )
        port map (
      I0 => b(0),
      I1 => b(2),
      I2 => b(1),
      I3 => a(3),
      O => \res[7]_i_4_n_0\
    );
\res_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => en,
      CLR => \res[7]_i_3_n_0\,
      D => res0(0),
      Q => res(0)
    );
\res_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => en,
      CLR => \res[7]_i_3_n_0\,
      D => res0(1),
      Q => res(1)
    );
\res_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => en,
      CLR => \res[7]_i_3_n_0\,
      D => res0(2),
      Q => res(2)
    );
\res_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => en,
      CLR => \res[7]_i_3_n_0\,
      D => res0(3),
      Q => res(3)
    );
\res_reg[3]_i_1\: unisim.vcomponents.MUXF8
     port map (
      I0 => \res_reg[3]_i_2_n_0\,
      I1 => \res_reg[3]_i_3_n_0\,
      O => res0(3),
      S => b(3)
    );
\res_reg[3]_i_2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \res[3]_i_4_n_0\,
      I1 => \res[3]_i_5_n_0\,
      O => \res_reg[3]_i_2_n_0\,
      S => a(3)
    );
\res_reg[3]_i_3\: unisim.vcomponents.MUXF7
     port map (
      I0 => \res[3]_i_6_n_0\,
      I1 => \res[3]_i_7_n_0\,
      O => \res_reg[3]_i_3_n_0\,
      S => a(3)
    );
\res_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => en,
      CLR => \res[7]_i_3_n_0\,
      D => res0(4),
      Q => res(4)
    );
\res_reg[4]_i_1\: unisim.vcomponents.MUXF8
     port map (
      I0 => \res_reg[4]_i_2_n_0\,
      I1 => \res_reg[4]_i_3_n_0\,
      O => res0(4),
      S => b(3)
    );
\res_reg[4]_i_2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \res[4]_i_4_n_0\,
      I1 => \res[4]_i_5_n_0\,
      O => \res_reg[4]_i_2_n_0\,
      S => a(3)
    );
\res_reg[4]_i_3\: unisim.vcomponents.MUXF7
     port map (
      I0 => \res[4]_i_6_n_0\,
      I1 => \res[4]_i_7_n_0\,
      O => \res_reg[4]_i_3_n_0\,
      S => a(3)
    );
\res_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => en,
      CLR => \res[7]_i_3_n_0\,
      D => res0(5),
      Q => res(5)
    );
\res_reg[5]_i_1\: unisim.vcomponents.MUXF8
     port map (
      I0 => \res_reg[5]_i_2_n_0\,
      I1 => \res_reg[5]_i_3_n_0\,
      O => res0(5),
      S => b(3)
    );
\res_reg[5]_i_2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \res[5]_i_4_n_0\,
      I1 => \res[5]_i_5_n_0\,
      O => \res_reg[5]_i_2_n_0\,
      S => a(3)
    );
\res_reg[5]_i_3\: unisim.vcomponents.MUXF7
     port map (
      I0 => \res[5]_i_6_n_0\,
      I1 => \res[5]_i_7_n_0\,
      O => \res_reg[5]_i_3_n_0\,
      S => a(3)
    );
\res_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => en,
      CLR => \res[7]_i_3_n_0\,
      D => res0(6),
      Q => res(6)
    );
\res_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => en,
      CLR => \res[7]_i_3_n_0\,
      D => res0(7),
      Q => res(7)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity mul_block_mul_pu_0_0_mul_pu is
  port (
    res : out STD_LOGIC_VECTOR ( 7 downto 0 );
    b : in STD_LOGIC_VECTOR ( 3 downto 0 );
    a : in STD_LOGIC_VECTOR ( 3 downto 0 );
    clk : in STD_LOGIC;
    rst_n : in STD_LOGIC;
    start : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of mul_block_mul_pu_0_0_mul_pu : entity is "mul_pu";
end mul_block_mul_pu_0_0_mul_pu;

architecture STRUCTURE of mul_block_mul_pu_0_0_mul_pu is
begin
u_path: entity work.mul_block_mul_pu_0_0_mul_reg
     port map (
      a(3 downto 0) => a(3 downto 0),
      b(3 downto 0) => b(3 downto 0),
      clk => clk,
      res(7 downto 0) => res(7 downto 0),
      rst_n => rst_n,
      start => start
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity mul_block_mul_pu_0_0 is
  port (
    start : in STD_LOGIC;
    clk : in STD_LOGIC;
    rst_n : in STD_LOGIC;
    a : in STD_LOGIC_VECTOR ( 3 downto 0 );
    b : in STD_LOGIC_VECTOR ( 3 downto 0 );
    res : out STD_LOGIC_VECTOR ( 7 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of mul_block_mul_pu_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of mul_block_mul_pu_0_0 : entity is "mul_block_mul_pu_0_0,mul_pu,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of mul_block_mul_pu_0_0 : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of mul_block_mul_pu_0_0 : entity is "module_ref";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of mul_block_mul_pu_0_0 : entity is "mul_pu,Vivado 2025.2";
end mul_block_mul_pu_0_0;

architecture STRUCTURE of mul_block_mul_pu_0_0 is
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of clk : signal is "xilinx.com:signal:clock:1.0 clk CLK";
  attribute X_INTERFACE_MODE : string;
  attribute X_INTERFACE_MODE of clk : signal is "slave";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of clk : signal is "XIL_INTERFACENAME clk, FREQ_HZ 99999001, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN mul_block_zynq_ultra_ps_e_0_0_pl_clk0, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of rst_n : signal is "xilinx.com:signal:reset:1.0 rst_n RST";
  attribute X_INTERFACE_MODE of rst_n : signal is "slave";
  attribute X_INTERFACE_PARAMETER of rst_n : signal is "XIL_INTERFACENAME rst_n, POLARITY ACTIVE_LOW, INSERT_VIP 0";
begin
inst: entity work.mul_block_mul_pu_0_0_mul_pu
     port map (
      a(3 downto 0) => a(3 downto 0),
      b(3 downto 0) => b(3 downto 0),
      clk => clk,
      res(7 downto 0) => res(7 downto 0),
      rst_n => rst_n,
      start => start
    );
end STRUCTURE;

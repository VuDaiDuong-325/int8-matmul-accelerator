-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
-- Date        : Wed Mar 25 22:44:12 2026
-- Host        : VuDuong-32 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               d:/HK6/Project1/testing/accumulator/accumulator/accumulator.gen/sources_1/bd/acc_block/ip/acc_block_acc_reg_0_0/acc_block_acc_reg_0_0_sim_netlist.vhdl
-- Design      : acc_block_acc_reg_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xck26-sfvc784-2LV-c
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity acc_block_acc_reg_0_0_acc_ctrl is
  port (
    Q : out STD_LOGIC_VECTOR ( 1 downto 0 );
    start : in STD_LOGIC;
    clk : in STD_LOGIC;
    \FSM_onehot_state_reg[3]_0\ : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of acc_block_acc_reg_0_0_acc_ctrl : entity is "acc_ctrl";
end acc_block_acc_reg_0_0_acc_ctrl;

architecture STRUCTURE of acc_block_acc_reg_0_0_acc_ctrl is
  signal \FSM_onehot_state_reg_n_0_[0]\ : STD_LOGIC;
  signal \FSM_onehot_state_reg_n_0_[3]\ : STD_LOGIC;
  signal \^q\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal next_state_n_0 : STD_LOGIC;
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \FSM_onehot_state_reg[0]\ : label is "MULT:0010,ADD:0100,WAIT_LOW:1000,IDLE:0001";
  attribute FSM_ENCODED_STATES of \FSM_onehot_state_reg[1]\ : label is "MULT:0010,ADD:0100,WAIT_LOW:1000,IDLE:0001";
  attribute FSM_ENCODED_STATES of \FSM_onehot_state_reg[2]\ : label is "MULT:0010,ADD:0100,WAIT_LOW:1000,IDLE:0001";
  attribute FSM_ENCODED_STATES of \FSM_onehot_state_reg[3]\ : label is "MULT:0010,ADD:0100,WAIT_LOW:1000,IDLE:0001";
begin
  Q(1 downto 0) <= \^q\(1 downto 0);
\FSM_onehot_state_reg[0]\: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => next_state_n_0,
      D => \FSM_onehot_state_reg_n_0_[3]\,
      PRE => \FSM_onehot_state_reg[3]_0\,
      Q => \FSM_onehot_state_reg_n_0_[0]\
    );
\FSM_onehot_state_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => next_state_n_0,
      CLR => \FSM_onehot_state_reg[3]_0\,
      D => \FSM_onehot_state_reg_n_0_[0]\,
      Q => \^q\(0)
    );
\FSM_onehot_state_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => next_state_n_0,
      CLR => \FSM_onehot_state_reg[3]_0\,
      D => \^q\(0),
      Q => \^q\(1)
    );
\FSM_onehot_state_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => next_state_n_0,
      CLR => \FSM_onehot_state_reg[3]_0\,
      D => \^q\(1),
      Q => \FSM_onehot_state_reg_n_0_[3]\
    );
next_state: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFEEEFE"
    )
        port map (
      I0 => \^q\(0),
      I1 => \^q\(1),
      I2 => \FSM_onehot_state_reg_n_0_[3]\,
      I3 => start,
      I4 => \FSM_onehot_state_reg_n_0_[0]\,
      O => next_state_n_0
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity acc_block_acc_reg_0_0_acc_stage is
  port (
    psum : out STD_LOGIC_VECTOR ( 15 downto 0 );
    rst_n_0 : out STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 0 to 0 );
    clk : in STD_LOGIC;
    \psum_out_reg[7]_0\ : in STD_LOGIC_VECTOR ( 7 downto 0 );
    rst_n : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of acc_block_acc_reg_0_0_acc_stage : entity is "acc_stage";
end acc_block_acc_reg_0_0_acc_stage;

architecture STRUCTURE of acc_block_acc_reg_0_0_acc_stage is
  signal p_0_in : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \^psum\ : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \psum_out0_carry__0_n_1\ : STD_LOGIC;
  signal \psum_out0_carry__0_n_2\ : STD_LOGIC;
  signal \psum_out0_carry__0_n_3\ : STD_LOGIC;
  signal \psum_out0_carry__0_n_4\ : STD_LOGIC;
  signal \psum_out0_carry__0_n_5\ : STD_LOGIC;
  signal \psum_out0_carry__0_n_6\ : STD_LOGIC;
  signal \psum_out0_carry__0_n_7\ : STD_LOGIC;
  signal psum_out0_carry_i_1_n_0 : STD_LOGIC;
  signal psum_out0_carry_i_2_n_0 : STD_LOGIC;
  signal psum_out0_carry_i_3_n_0 : STD_LOGIC;
  signal psum_out0_carry_i_4_n_0 : STD_LOGIC;
  signal psum_out0_carry_i_5_n_0 : STD_LOGIC;
  signal psum_out0_carry_i_6_n_0 : STD_LOGIC;
  signal psum_out0_carry_i_7_n_0 : STD_LOGIC;
  signal psum_out0_carry_i_8_n_0 : STD_LOGIC;
  signal psum_out0_carry_n_0 : STD_LOGIC;
  signal psum_out0_carry_n_1 : STD_LOGIC;
  signal psum_out0_carry_n_2 : STD_LOGIC;
  signal psum_out0_carry_n_3 : STD_LOGIC;
  signal psum_out0_carry_n_4 : STD_LOGIC;
  signal psum_out0_carry_n_5 : STD_LOGIC;
  signal psum_out0_carry_n_6 : STD_LOGIC;
  signal psum_out0_carry_n_7 : STD_LOGIC;
  signal \^rst_n_0\ : STD_LOGIC;
  signal \NLW_psum_out0_carry__0_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 to 7 );
  attribute ADDER_THRESHOLD : integer;
  attribute ADDER_THRESHOLD of psum_out0_carry : label is 35;
  attribute ADDER_THRESHOLD of \psum_out0_carry__0\ : label is 35;
begin
  psum(15 downto 0) <= \^psum\(15 downto 0);
  rst_n_0 <= \^rst_n_0\;
psum_out0_carry: unisim.vcomponents.CARRY8
     port map (
      CI => '0',
      CI_TOP => '0',
      CO(7) => psum_out0_carry_n_0,
      CO(6) => psum_out0_carry_n_1,
      CO(5) => psum_out0_carry_n_2,
      CO(4) => psum_out0_carry_n_3,
      CO(3) => psum_out0_carry_n_4,
      CO(2) => psum_out0_carry_n_5,
      CO(1) => psum_out0_carry_n_6,
      CO(0) => psum_out0_carry_n_7,
      DI(7 downto 0) => \^psum\(7 downto 0),
      O(7 downto 0) => p_0_in(7 downto 0),
      S(7) => psum_out0_carry_i_1_n_0,
      S(6) => psum_out0_carry_i_2_n_0,
      S(5) => psum_out0_carry_i_3_n_0,
      S(4) => psum_out0_carry_i_4_n_0,
      S(3) => psum_out0_carry_i_5_n_0,
      S(2) => psum_out0_carry_i_6_n_0,
      S(1) => psum_out0_carry_i_7_n_0,
      S(0) => psum_out0_carry_i_8_n_0
    );
\psum_out0_carry__0\: unisim.vcomponents.CARRY8
     port map (
      CI => psum_out0_carry_n_0,
      CI_TOP => '0',
      CO(7) => \NLW_psum_out0_carry__0_CO_UNCONNECTED\(7),
      CO(6) => \psum_out0_carry__0_n_1\,
      CO(5) => \psum_out0_carry__0_n_2\,
      CO(4) => \psum_out0_carry__0_n_3\,
      CO(3) => \psum_out0_carry__0_n_4\,
      CO(2) => \psum_out0_carry__0_n_5\,
      CO(1) => \psum_out0_carry__0_n_6\,
      CO(0) => \psum_out0_carry__0_n_7\,
      DI(7 downto 0) => B"00000000",
      O(7 downto 0) => p_0_in(15 downto 8),
      S(7 downto 0) => \^psum\(15 downto 8)
    );
psum_out0_carry_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \^psum\(7),
      I1 => \psum_out_reg[7]_0\(7),
      O => psum_out0_carry_i_1_n_0
    );
psum_out0_carry_i_2: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \^psum\(6),
      I1 => \psum_out_reg[7]_0\(6),
      O => psum_out0_carry_i_2_n_0
    );
psum_out0_carry_i_3: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \^psum\(5),
      I1 => \psum_out_reg[7]_0\(5),
      O => psum_out0_carry_i_3_n_0
    );
psum_out0_carry_i_4: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \^psum\(4),
      I1 => \psum_out_reg[7]_0\(4),
      O => psum_out0_carry_i_4_n_0
    );
psum_out0_carry_i_5: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \^psum\(3),
      I1 => \psum_out_reg[7]_0\(3),
      O => psum_out0_carry_i_5_n_0
    );
psum_out0_carry_i_6: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \^psum\(2),
      I1 => \psum_out_reg[7]_0\(2),
      O => psum_out0_carry_i_6_n_0
    );
psum_out0_carry_i_7: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \^psum\(1),
      I1 => \psum_out_reg[7]_0\(1),
      O => psum_out0_carry_i_7_n_0
    );
psum_out0_carry_i_8: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \^psum\(0),
      I1 => \psum_out_reg[7]_0\(0),
      O => psum_out0_carry_i_8_n_0
    );
\psum_out[15]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => rst_n,
      O => \^rst_n_0\
    );
\psum_out_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => Q(0),
      CLR => \^rst_n_0\,
      D => p_0_in(0),
      Q => \^psum\(0)
    );
\psum_out_reg[10]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => Q(0),
      CLR => \^rst_n_0\,
      D => p_0_in(10),
      Q => \^psum\(10)
    );
\psum_out_reg[11]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => Q(0),
      CLR => \^rst_n_0\,
      D => p_0_in(11),
      Q => \^psum\(11)
    );
\psum_out_reg[12]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => Q(0),
      CLR => \^rst_n_0\,
      D => p_0_in(12),
      Q => \^psum\(12)
    );
\psum_out_reg[13]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => Q(0),
      CLR => \^rst_n_0\,
      D => p_0_in(13),
      Q => \^psum\(13)
    );
\psum_out_reg[14]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => Q(0),
      CLR => \^rst_n_0\,
      D => p_0_in(14),
      Q => \^psum\(14)
    );
\psum_out_reg[15]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => Q(0),
      CLR => \^rst_n_0\,
      D => p_0_in(15),
      Q => \^psum\(15)
    );
\psum_out_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => Q(0),
      CLR => \^rst_n_0\,
      D => p_0_in(1),
      Q => \^psum\(1)
    );
\psum_out_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => Q(0),
      CLR => \^rst_n_0\,
      D => p_0_in(2),
      Q => \^psum\(2)
    );
\psum_out_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => Q(0),
      CLR => \^rst_n_0\,
      D => p_0_in(3),
      Q => \^psum\(3)
    );
\psum_out_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => Q(0),
      CLR => \^rst_n_0\,
      D => p_0_in(4),
      Q => \^psum\(4)
    );
\psum_out_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => Q(0),
      CLR => \^rst_n_0\,
      D => p_0_in(5),
      Q => \^psum\(5)
    );
\psum_out_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => Q(0),
      CLR => \^rst_n_0\,
      D => p_0_in(6),
      Q => \^psum\(6)
    );
\psum_out_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => Q(0),
      CLR => \^rst_n_0\,
      D => p_0_in(7),
      Q => \^psum\(7)
    );
\psum_out_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => Q(0),
      CLR => \^rst_n_0\,
      D => p_0_in(8),
      Q => \^psum\(8)
    );
\psum_out_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => Q(0),
      CLR => \^rst_n_0\,
      D => p_0_in(9),
      Q => \^psum\(9)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity acc_block_acc_reg_0_0_mul_stage is
  port (
    Q : out STD_LOGIC_VECTOR ( 7 downto 0 );
    a : in STD_LOGIC_VECTOR ( 3 downto 0 );
    b : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \mul_res_reg[7]_0\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    clk : in STD_LOGIC;
    \mul_res_reg[7]_1\ : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of acc_block_acc_reg_0_0_mul_stage : entity is "mul_stage";
end acc_block_acc_reg_0_0_mul_stage;

architecture STRUCTURE of acc_block_acc_reg_0_0_mul_stage is
  signal mul_res0 : STD_LOGIC_VECTOR ( 7 downto 1 );
  signal \mul_res[0]_i_1_n_0\ : STD_LOGIC;
  signal \mul_res[2]_i_1_n_0\ : STD_LOGIC;
  signal \mul_res[4]_i_2_n_0\ : STD_LOGIC;
  signal \mul_res[4]_i_3_n_0\ : STD_LOGIC;
  signal \mul_res[4]_i_4_n_0\ : STD_LOGIC;
  signal \mul_res[4]_i_5_n_0\ : STD_LOGIC;
  signal \mul_res[4]_i_6_n_0\ : STD_LOGIC;
  signal \mul_res[6]_i_1_n_0\ : STD_LOGIC;
  signal \mul_res[7]_i_2_n_0\ : STD_LOGIC;
  signal \mul_res[7]_i_3_n_0\ : STD_LOGIC;
  signal \mul_res[7]_i_4_n_0\ : STD_LOGIC;
  signal \mul_res[7]_i_5_n_0\ : STD_LOGIC;
  signal \mul_res[7]_i_6_n_0\ : STD_LOGIC;
  signal \mul_res[7]_i_7_n_0\ : STD_LOGIC;
  signal \mul_res[7]_i_8_n_0\ : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \mul_res[0]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \mul_res[1]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \mul_res[3]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \mul_res[4]_i_1\ : label is "soft_lutpair0";
begin
\mul_res[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => a(0),
      I1 => b(0),
      O => \mul_res[0]_i_1_n_0\
    );
\mul_res[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7888"
    )
        port map (
      I0 => b(0),
      I1 => a(1),
      I2 => b(1),
      I3 => a(0),
      O => mul_res0(1)
    );
\mul_res[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4777B88878887888"
    )
        port map (
      I0 => a(2),
      I1 => b(0),
      I2 => b(1),
      I3 => a(1),
      I4 => b(2),
      I5 => a(0),
      O => \mul_res[2]_i_1_n_0\
    );
\mul_res[3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"96"
    )
        port map (
      I0 => \mul_res[4]_i_4_n_0\,
      I1 => \mul_res[4]_i_2_n_0\,
      I2 => \mul_res[4]_i_3_n_0\,
      O => mul_res0(3)
    );
\mul_res[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"718E8E71"
    )
        port map (
      I0 => \mul_res[4]_i_2_n_0\,
      I1 => \mul_res[4]_i_3_n_0\,
      I2 => \mul_res[4]_i_4_n_0\,
      I3 => \mul_res[4]_i_5_n_0\,
      I4 => \mul_res[4]_i_6_n_0\,
      O => mul_res0(4)
    );
\mul_res[4]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"80007FFF7FFF7FFF"
    )
        port map (
      I0 => a(1),
      I1 => b(1),
      I2 => a(0),
      I3 => b(2),
      I4 => b(0),
      I5 => a(3),
      O => \mul_res[4]_i_2_n_0\
    );
\mul_res[4]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7888877787778777"
    )
        port map (
      I0 => b(1),
      I1 => a(2),
      I2 => a(0),
      I3 => b(3),
      I4 => a(1),
      I5 => b(2),
      O => \mul_res[4]_i_3_n_0\
    );
\mul_res[4]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"88A8800080008000"
    )
        port map (
      I0 => b(0),
      I1 => a(2),
      I2 => a(0),
      I3 => b(2),
      I4 => a(1),
      I5 => b(1),
      O => \mul_res[4]_i_4_n_0\
    );
\mul_res[4]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F888800080008000"
    )
        port map (
      I0 => b(3),
      I1 => a(0),
      I2 => b(2),
      I3 => a(1),
      I4 => b(1),
      I5 => a(2),
      O => \mul_res[4]_i_5_n_0\
    );
\mul_res[4]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"956A6A956A956A95"
    )
        port map (
      I0 => \mul_res[7]_i_7_n_0\,
      I1 => b(2),
      I2 => a(2),
      I3 => \mul_res[7]_i_8_n_0\,
      I4 => a(3),
      I5 => b(1),
      O => \mul_res[4]_i_6_n_0\
    );
\mul_res[5]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"96"
    )
        port map (
      I0 => \mul_res[7]_i_3_n_0\,
      I1 => \mul_res[7]_i_5_n_0\,
      I2 => \mul_res[7]_i_4_n_0\,
      O => mul_res0(5)
    );
\mul_res[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E817171717E8E8E8"
    )
        port map (
      I0 => \mul_res[7]_i_3_n_0\,
      I1 => \mul_res[7]_i_4_n_0\,
      I2 => \mul_res[7]_i_5_n_0\,
      I3 => a(3),
      I4 => b(3),
      I5 => \mul_res[7]_i_2_n_0\,
      O => \mul_res[6]_i_1_n_0\
    );
\mul_res[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F8F8F880F8808080"
    )
        port map (
      I0 => b(3),
      I1 => a(3),
      I2 => \mul_res[7]_i_2_n_0\,
      I3 => \mul_res[7]_i_3_n_0\,
      I4 => \mul_res[7]_i_4_n_0\,
      I5 => \mul_res[7]_i_5_n_0\,
      O => mul_res0(7)
    );
\mul_res[7]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E8808080C0008000"
    )
        port map (
      I0 => b(3),
      I1 => a(2),
      I2 => b(2),
      I3 => a(3),
      I4 => b(1),
      I5 => a(1),
      O => \mul_res[7]_i_2_n_0\
    );
\mul_res[7]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8282EB82EB82EBEB"
    )
        port map (
      I0 => \mul_res[4]_i_5_n_0\,
      I1 => \mul_res[7]_i_6_n_0\,
      I2 => \mul_res[7]_i_7_n_0\,
      I3 => \mul_res[4]_i_4_n_0\,
      I4 => \mul_res[4]_i_3_n_0\,
      I5 => \mul_res[4]_i_2_n_0\,
      O => \mul_res[7]_i_3_n_0\
    );
\mul_res[7]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2A80802A802A802A"
    )
        port map (
      I0 => \mul_res[7]_i_7_n_0\,
      I1 => b(2),
      I2 => a(2),
      I3 => \mul_res[7]_i_8_n_0\,
      I4 => a(3),
      I5 => b(1),
      O => \mul_res[7]_i_4_n_0\
    );
\mul_res[7]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E75F30007800F000"
    )
        port map (
      I0 => b(1),
      I1 => a(1),
      I2 => a(2),
      I3 => b(3),
      I4 => a(3),
      I5 => b(2),
      O => \mul_res[7]_i_5_n_0\
    );
\mul_res[7]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7888877787778777"
    )
        port map (
      I0 => b(1),
      I1 => a(3),
      I2 => a(1),
      I3 => b(3),
      I4 => a(2),
      I5 => b(2),
      O => \mul_res[7]_i_6_n_0\
    );
\mul_res[7]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => a(1),
      I1 => b(1),
      I2 => a(0),
      I3 => b(2),
      I4 => b(0),
      I5 => a(3),
      O => \mul_res[7]_i_7_n_0\
    );
\mul_res[7]_i_8\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => a(1),
      I1 => b(3),
      O => \mul_res[7]_i_8_n_0\
    );
\mul_res_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \mul_res_reg[7]_0\(0),
      CLR => \mul_res_reg[7]_1\,
      D => \mul_res[0]_i_1_n_0\,
      Q => Q(0)
    );
\mul_res_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \mul_res_reg[7]_0\(0),
      CLR => \mul_res_reg[7]_1\,
      D => mul_res0(1),
      Q => Q(1)
    );
\mul_res_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \mul_res_reg[7]_0\(0),
      CLR => \mul_res_reg[7]_1\,
      D => \mul_res[2]_i_1_n_0\,
      Q => Q(2)
    );
\mul_res_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \mul_res_reg[7]_0\(0),
      CLR => \mul_res_reg[7]_1\,
      D => mul_res0(3),
      Q => Q(3)
    );
\mul_res_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \mul_res_reg[7]_0\(0),
      CLR => \mul_res_reg[7]_1\,
      D => mul_res0(4),
      Q => Q(4)
    );
\mul_res_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \mul_res_reg[7]_0\(0),
      CLR => \mul_res_reg[7]_1\,
      D => mul_res0(5),
      Q => Q(5)
    );
\mul_res_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \mul_res_reg[7]_0\(0),
      CLR => \mul_res_reg[7]_1\,
      D => \mul_res[6]_i_1_n_0\,
      Q => Q(6)
    );
\mul_res_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \mul_res_reg[7]_0\(0),
      CLR => \mul_res_reg[7]_1\,
      D => mul_res0(7),
      Q => Q(7)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity acc_block_acc_reg_0_0_acc_top is
  port (
    psum : out STD_LOGIC_VECTOR ( 15 downto 0 );
    rst_n_0 : out STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 1 downto 0 );
    clk : in STD_LOGIC;
    a : in STD_LOGIC_VECTOR ( 3 downto 0 );
    b : in STD_LOGIC_VECTOR ( 3 downto 0 );
    rst_n : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of acc_block_acc_reg_0_0_acc_top : entity is "acc_top";
end acc_block_acc_reg_0_0_acc_top;

architecture STRUCTURE of acc_block_acc_reg_0_0_acc_top is
  signal \in\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \^rst_n_0\ : STD_LOGIC;
begin
  rst_n_0 <= \^rst_n_0\;
u_acc: entity work.acc_block_acc_reg_0_0_acc_stage
     port map (
      Q(0) => Q(1),
      clk => clk,
      psum(15 downto 0) => psum(15 downto 0),
      \psum_out_reg[7]_0\(7 downto 0) => \in\(7 downto 0),
      rst_n => rst_n,
      rst_n_0 => \^rst_n_0\
    );
u_mul: entity work.acc_block_acc_reg_0_0_mul_stage
     port map (
      Q(7 downto 0) => \in\(7 downto 0),
      a(3 downto 0) => a(3 downto 0),
      b(3 downto 0) => b(3 downto 0),
      clk => clk,
      \mul_res_reg[7]_0\(0) => Q(0),
      \mul_res_reg[7]_1\ => \^rst_n_0\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity acc_block_acc_reg_0_0_acc_reg is
  port (
    psum : out STD_LOGIC_VECTOR ( 15 downto 0 );
    a : in STD_LOGIC_VECTOR ( 3 downto 0 );
    b : in STD_LOGIC_VECTOR ( 3 downto 0 );
    clk : in STD_LOGIC;
    start : in STD_LOGIC;
    rst_n : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of acc_block_acc_reg_0_0_acc_reg : entity is "acc_reg";
end acc_block_acc_reg_0_0_acc_reg;

architecture STRUCTURE of acc_block_acc_reg_0_0_acc_reg is
  signal u_ctrl_n_0 : STD_LOGIC;
  signal u_path_n_16 : STD_LOGIC;
  signal vld_in : STD_LOGIC;
begin
u_ctrl: entity work.acc_block_acc_reg_0_0_acc_ctrl
     port map (
      \FSM_onehot_state_reg[3]_0\ => u_path_n_16,
      Q(1) => u_ctrl_n_0,
      Q(0) => vld_in,
      clk => clk,
      start => start
    );
u_path: entity work.acc_block_acc_reg_0_0_acc_top
     port map (
      Q(1) => u_ctrl_n_0,
      Q(0) => vld_in,
      a(3 downto 0) => a(3 downto 0),
      b(3 downto 0) => b(3 downto 0),
      clk => clk,
      psum(15 downto 0) => psum(15 downto 0),
      rst_n => rst_n,
      rst_n_0 => u_path_n_16
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity acc_block_acc_reg_0_0 is
  port (
    a : in STD_LOGIC_VECTOR ( 3 downto 0 );
    b : in STD_LOGIC_VECTOR ( 3 downto 0 );
    start : in STD_LOGIC;
    clk : in STD_LOGIC;
    rst_n : in STD_LOGIC;
    psum : out STD_LOGIC_VECTOR ( 15 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of acc_block_acc_reg_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of acc_block_acc_reg_0_0 : entity is "acc_block_acc_reg_0_0,acc_reg,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of acc_block_acc_reg_0_0 : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of acc_block_acc_reg_0_0 : entity is "module_ref";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of acc_block_acc_reg_0_0 : entity is "acc_reg,Vivado 2025.2";
end acc_block_acc_reg_0_0;

architecture STRUCTURE of acc_block_acc_reg_0_0 is
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of clk : signal is "xilinx.com:signal:clock:1.0 clk CLK";
  attribute X_INTERFACE_MODE : string;
  attribute X_INTERFACE_MODE of clk : signal is "slave";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of clk : signal is "XIL_INTERFACENAME clk, FREQ_HZ 99999001, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN acc_block_zynq_ultra_ps_e_0_0_pl_clk0, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of rst_n : signal is "xilinx.com:signal:reset:1.0 rst_n RST";
  attribute X_INTERFACE_MODE of rst_n : signal is "slave";
  attribute X_INTERFACE_PARAMETER of rst_n : signal is "XIL_INTERFACENAME rst_n, POLARITY ACTIVE_LOW, INSERT_VIP 0";
begin
inst: entity work.acc_block_acc_reg_0_0_acc_reg
     port map (
      a(3 downto 0) => a(3 downto 0),
      b(3 downto 0) => b(3 downto 0),
      clk => clk,
      psum(15 downto 0) => psum(15 downto 0),
      rst_n => rst_n,
      start => start
    );
end STRUCTURE;

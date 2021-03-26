-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2020.1 (win64) Build 2902540 Wed May 27 19:54:49 MDT 2020
-- Date        : Thu Mar 18 18:29:12 2021
-- Host        : jedla running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
--               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ design_1_axi_stream_wrapper_0_2_sim_netlist.vhdl
-- Design      : design_1_axi_stream_wrapper_0_2
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z020clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_stream_wrapper is
  port (
    ACLK : in STD_LOGIC;
    ARESETN : in STD_LOGIC;
    S_AXIS_READY : out STD_LOGIC;
    S_AXIS_DATA : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXIS_LAST : in STD_LOGIC;
    S_AXIS_VALID : in STD_LOGIC;
    M_AXIS_VALID : out STD_LOGIC;
    M_AXIS_DATA : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXIS_LAST : out STD_LOGIC;
    M_AXIS_READY : in STD_LOGIC
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_stream_wrapper;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_stream_wrapper is
  signal \<const0>\ : STD_LOGIC;
  signal \FSM_sequential_state[0]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state[1]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state[2]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state[2]_i_2_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state[2]_i_3_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state[2]_i_4_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state[2]_i_5_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state[2]_i_6_n_0\ : STD_LOGIC;
  signal counter : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal \counter[1]_i_2_n_0\ : STD_LOGIC;
  signal \counter[4]_i_2_n_0\ : STD_LOGIC;
  signal \counter[5]_i_1_n_0\ : STD_LOGIC;
  signal \counter[5]_i_2_n_0\ : STD_LOGIC;
  signal \counter[5]_i_4_n_0\ : STD_LOGIC;
  signal \counter_reg_n_0_[0]\ : STD_LOGIC;
  signal \counter_reg_n_0_[1]\ : STD_LOGIC;
  signal \counter_reg_n_0_[2]\ : STD_LOGIC;
  signal \counter_reg_n_0_[3]\ : STD_LOGIC;
  signal \counter_reg_n_0_[4]\ : STD_LOGIC;
  signal \counter_reg_n_0_[5]\ : STD_LOGIC;
  signal \state__0\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \FSM_sequential_state[0]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \FSM_sequential_state[1]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \FSM_sequential_state[2]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \FSM_sequential_state[2]_i_3\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \FSM_sequential_state[2]_i_5\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \FSM_sequential_state[2]_i_6\ : label is "soft_lutpair1";
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \FSM_sequential_state_reg[0]\ : label is "idle:000,read_data_in:001,read_key:010,stabilize:011,active:100,write_data_out:101,";
  attribute FSM_ENCODED_STATES of \FSM_sequential_state_reg[1]\ : label is "idle:000,read_data_in:001,read_key:010,stabilize:011,active:100,write_data_out:101,";
  attribute FSM_ENCODED_STATES of \FSM_sequential_state_reg[2]\ : label is "idle:000,read_data_in:001,read_key:010,stabilize:011,active:100,write_data_out:101,";
  attribute SOFT_HLUTNM of S_AXIS_READY_INST_0 : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \counter[3]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \counter[4]_i_2\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \counter[5]_i_4\ : label is "soft_lutpair2";
begin
  M_AXIS_DATA(31) <= \<const0>\;
  M_AXIS_DATA(30) <= \<const0>\;
  M_AXIS_DATA(29) <= \<const0>\;
  M_AXIS_DATA(28) <= \<const0>\;
  M_AXIS_DATA(27) <= \<const0>\;
  M_AXIS_DATA(26) <= \<const0>\;
  M_AXIS_DATA(25) <= \<const0>\;
  M_AXIS_DATA(24) <= \<const0>\;
  M_AXIS_DATA(23) <= \<const0>\;
  M_AXIS_DATA(22) <= \<const0>\;
  M_AXIS_DATA(21) <= \<const0>\;
  M_AXIS_DATA(20) <= \<const0>\;
  M_AXIS_DATA(19) <= \<const0>\;
  M_AXIS_DATA(18) <= \<const0>\;
  M_AXIS_DATA(17) <= \<const0>\;
  M_AXIS_DATA(16) <= \<const0>\;
  M_AXIS_DATA(15) <= \<const0>\;
  M_AXIS_DATA(14) <= \<const0>\;
  M_AXIS_DATA(13) <= \<const0>\;
  M_AXIS_DATA(12) <= \<const0>\;
  M_AXIS_DATA(11) <= \<const0>\;
  M_AXIS_DATA(10) <= \<const0>\;
  M_AXIS_DATA(9) <= \<const0>\;
  M_AXIS_DATA(8) <= \<const0>\;
  M_AXIS_DATA(7) <= \<const0>\;
  M_AXIS_DATA(6) <= \<const0>\;
  M_AXIS_DATA(5) <= \<const0>\;
  M_AXIS_DATA(4) <= \<const0>\;
  M_AXIS_DATA(3) <= \<const0>\;
  M_AXIS_DATA(2) <= \<const0>\;
  M_AXIS_DATA(1) <= \<const0>\;
  M_AXIS_DATA(0) <= \<const0>\;
  M_AXIS_LAST <= \<const0>\;
  M_AXIS_VALID <= \<const0>\;
\FSM_sequential_state[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2600"
    )
        port map (
      I0 => \state__0\(0),
      I1 => \FSM_sequential_state[2]_i_2_n_0\,
      I2 => \state__0\(2),
      I3 => ARESETN,
      O => \FSM_sequential_state[0]_i_1_n_0\
    );
\FSM_sequential_state[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"262A0000"
    )
        port map (
      I0 => \state__0\(1),
      I1 => \FSM_sequential_state[2]_i_2_n_0\,
      I2 => \state__0\(2),
      I3 => \state__0\(0),
      I4 => ARESETN,
      O => \FSM_sequential_state[1]_i_1_n_0\
    );
\FSM_sequential_state[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"62220000"
    )
        port map (
      I0 => \state__0\(2),
      I1 => \FSM_sequential_state[2]_i_2_n_0\,
      I2 => \state__0\(0),
      I3 => \state__0\(1),
      I4 => ARESETN,
      O => \FSM_sequential_state[2]_i_1_n_0\
    );
\FSM_sequential_state[2]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EE22FFFFEE22EEA2"
    )
        port map (
      I0 => \FSM_sequential_state[2]_i_3_n_0\,
      I1 => \state__0\(0),
      I2 => \FSM_sequential_state[2]_i_4_n_0\,
      I3 => \FSM_sequential_state[2]_i_5_n_0\,
      I4 => \counter[1]_i_2_n_0\,
      I5 => \FSM_sequential_state[2]_i_6_n_0\,
      O => \FSM_sequential_state[2]_i_2_n_0\
    );
\FSM_sequential_state[2]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"10"
    )
        port map (
      I0 => \state__0\(2),
      I1 => \state__0\(1),
      I2 => S_AXIS_VALID,
      O => \FSM_sequential_state[2]_i_3_n_0\
    );
\FSM_sequential_state[2]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counter_reg_n_0_[0]\,
      I1 => \counter_reg_n_0_[1]\,
      O => \FSM_sequential_state[2]_i_4_n_0\
    );
\FSM_sequential_state[2]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \state__0\(1),
      I1 => \state__0\(2),
      O => \FSM_sequential_state[2]_i_5_n_0\
    );
\FSM_sequential_state[2]_i_6\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00080000"
    )
        port map (
      I0 => S_AXIS_VALID,
      I1 => \counter_reg_n_0_[1]\,
      I2 => \counter_reg_n_0_[0]\,
      I3 => \state__0\(2),
      I4 => \state__0\(1),
      O => \FSM_sequential_state[2]_i_6_n_0\
    );
\FSM_sequential_state_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => '1',
      D => \FSM_sequential_state[0]_i_1_n_0\,
      Q => \state__0\(0),
      R => '0'
    );
\FSM_sequential_state_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => '1',
      D => \FSM_sequential_state[1]_i_1_n_0\,
      Q => \state__0\(1),
      R => '0'
    );
\FSM_sequential_state_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => '1',
      D => \FSM_sequential_state[2]_i_1_n_0\,
      Q => \state__0\(2),
      R => '0'
    );
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
S_AXIS_READY_INST_0: unisim.vcomponents.LUT3
    generic map(
      INIT => X"06"
    )
        port map (
      I0 => \state__0\(0),
      I1 => \state__0\(1),
      I2 => \state__0\(2),
      O => S_AXIS_READY
    );
\counter[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000333100333300"
    )
        port map (
      I0 => \counter_reg_n_0_[1]\,
      I1 => \counter_reg_n_0_[0]\,
      I2 => \counter[1]_i_2_n_0\,
      I3 => \state__0\(0),
      I4 => \state__0\(2),
      I5 => \state__0\(1),
      O => counter(0)
    );
\counter[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000E5A0F580000"
    )
        port map (
      I0 => \state__0\(0),
      I1 => \counter[1]_i_2_n_0\,
      I2 => \state__0\(2),
      I3 => \state__0\(1),
      I4 => \counter_reg_n_0_[0]\,
      I5 => \counter_reg_n_0_[1]\,
      O => counter(1)
    );
\counter[1]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \counter_reg_n_0_[5]\,
      I1 => \counter_reg_n_0_[4]\,
      I2 => \counter_reg_n_0_[3]\,
      I3 => \counter_reg_n_0_[2]\,
      O => \counter[1]_i_2_n_0\
    );
\counter[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0036363636000000"
    )
        port map (
      I0 => \state__0\(0),
      I1 => \state__0\(2),
      I2 => \state__0\(1),
      I3 => \counter_reg_n_0_[1]\,
      I4 => \counter_reg_n_0_[0]\,
      I5 => \counter_reg_n_0_[2]\,
      O => counter(2)
    );
\counter[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7F008000"
    )
        port map (
      I0 => \counter_reg_n_0_[1]\,
      I1 => \counter_reg_n_0_[0]\,
      I2 => \counter_reg_n_0_[2]\,
      I3 => \counter[4]_i_2_n_0\,
      I4 => \counter_reg_n_0_[3]\,
      O => counter(3)
    );
\counter[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFF000080000000"
    )
        port map (
      I0 => \counter_reg_n_0_[2]\,
      I1 => \counter_reg_n_0_[0]\,
      I2 => \counter_reg_n_0_[1]\,
      I3 => \counter_reg_n_0_[3]\,
      I4 => \counter[4]_i_2_n_0\,
      I5 => \counter_reg_n_0_[4]\,
      O => counter(4)
    );
\counter[4]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"36"
    )
        port map (
      I0 => \state__0\(0),
      I1 => \state__0\(2),
      I2 => \state__0\(1),
      O => \counter[4]_i_2_n_0\
    );
\counter[5]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => ARESETN,
      O => \counter[5]_i_1_n_0\
    );
\counter[5]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1170"
    )
        port map (
      I0 => \state__0\(0),
      I1 => \state__0\(1),
      I2 => S_AXIS_VALID,
      I3 => \state__0\(2),
      O => \counter[5]_i_2_n_0\
    );
\counter[5]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00BB0BB000440440"
    )
        port map (
      I0 => \counter[5]_i_4_n_0\,
      I1 => \counter_reg_n_0_[4]\,
      I2 => \state__0\(1),
      I3 => \state__0\(2),
      I4 => \state__0\(0),
      I5 => \counter_reg_n_0_[5]\,
      O => counter(5)
    );
\counter[5]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7FFF"
    )
        port map (
      I0 => \counter_reg_n_0_[2]\,
      I1 => \counter_reg_n_0_[0]\,
      I2 => \counter_reg_n_0_[1]\,
      I3 => \counter_reg_n_0_[3]\,
      O => \counter[5]_i_4_n_0\
    );
\counter_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => \counter[5]_i_2_n_0\,
      D => counter(0),
      Q => \counter_reg_n_0_[0]\,
      R => \counter[5]_i_1_n_0\
    );
\counter_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => \counter[5]_i_2_n_0\,
      D => counter(1),
      Q => \counter_reg_n_0_[1]\,
      R => \counter[5]_i_1_n_0\
    );
\counter_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => \counter[5]_i_2_n_0\,
      D => counter(2),
      Q => \counter_reg_n_0_[2]\,
      R => \counter[5]_i_1_n_0\
    );
\counter_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => \counter[5]_i_2_n_0\,
      D => counter(3),
      Q => \counter_reg_n_0_[3]\,
      R => \counter[5]_i_1_n_0\
    );
\counter_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => \counter[5]_i_2_n_0\,
      D => counter(4),
      Q => \counter_reg_n_0_[4]\,
      R => \counter[5]_i_1_n_0\
    );
\counter_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => \counter[5]_i_2_n_0\,
      D => counter(5),
      Q => \counter_reg_n_0_[5]\,
      R => \counter[5]_i_1_n_0\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  port (
    ACLK : in STD_LOGIC;
    ARESETN : in STD_LOGIC;
    S_AXIS_READY : out STD_LOGIC;
    S_AXIS_DATA : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXIS_LAST : in STD_LOGIC;
    S_AXIS_VALID : in STD_LOGIC;
    M_AXIS_VALID : out STD_LOGIC;
    M_AXIS_DATA : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXIS_LAST : out STD_LOGIC;
    M_AXIS_READY : in STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "design_1_axi_stream_wrapper_0_2,axi_stream_wrapper,{}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "yes";
  attribute ip_definition_source : string;
  attribute ip_definition_source of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "package_project";
  attribute x_core_info : string;
  attribute x_core_info of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "axi_stream_wrapper,Vivado 2020.1";
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  attribute x_interface_info : string;
  attribute x_interface_info of ACLK : signal is "xilinx.com:signal:clock:1.0 ACLK CLK";
  attribute x_interface_parameter : string;
  attribute x_interface_parameter of ACLK : signal is "XIL_INTERFACENAME ACLK, ASSOCIATED_RESET ARESETN, FREQ_HZ 125000000, FREQ_TOLERANCE_HZ 0, PHASE 0.000, CLK_DOMAIN design_1_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0";
  attribute x_interface_info of ARESETN : signal is "xilinx.com:signal:reset:1.0 ARESETN RST";
  attribute x_interface_parameter of ARESETN : signal is "XIL_INTERFACENAME ARESETN, POLARITY ACTIVE_LOW, INSERT_VIP 0";
begin
U0: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_stream_wrapper
     port map (
      ACLK => ACLK,
      ARESETN => ARESETN,
      M_AXIS_DATA(31 downto 0) => M_AXIS_DATA(31 downto 0),
      M_AXIS_LAST => M_AXIS_LAST,
      M_AXIS_READY => M_AXIS_READY,
      M_AXIS_VALID => M_AXIS_VALID,
      S_AXIS_DATA(31 downto 0) => S_AXIS_DATA(31 downto 0),
      S_AXIS_LAST => S_AXIS_LAST,
      S_AXIS_READY => S_AXIS_READY,
      S_AXIS_VALID => S_AXIS_VALID
    );
end STRUCTURE;

-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2020.1 (win64) Build 2902540 Wed May 27 19:54:49 MDT 2020
-- Date        : Thu Mar 18 18:29:12 2021
-- Host        : jedla running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
--               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ design_1_axi_stream_wrapper_0_2_stub.vhdl
-- Design      : design_1_axi_stream_wrapper_0_2
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z020clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  Port ( 
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

end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix;

architecture stub of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "ACLK,ARESETN,S_AXIS_READY,S_AXIS_DATA[31:0],S_AXIS_LAST,S_AXIS_VALID,M_AXIS_VALID,M_AXIS_DATA[31:0],M_AXIS_LAST,M_AXIS_READY";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "axi_stream_wrapper,Vivado 2020.1";
begin
end;

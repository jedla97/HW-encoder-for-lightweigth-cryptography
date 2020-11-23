----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.11.2020 15:18:34
-- Design Name: 
-- Module Name: Sbox1 - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: conecting all Sboxes
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------
---- switch vectors to variables := https://stackoverflow.com/questions/11927144/what-s-the-difference-between-and-in-vhdl

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity LBlockLoop is
Port ( 
    xLdata_in: in std_logic_vector(31 downto 0);
    xRdata_in: in std_logic_vector(31 downto 0);
    fullKey_in: in std_logic_vector(79 downto 0);
    xLdata_out: out std_logic_vector(31 downto 0);
    xRdata_out: out std_logic_vector(31 downto 0)

    );
end LBlockLoop;

architecture Behavioral of LBlockLoop is

signal xLhelp: std_logic_vector(31 downto 0);
signal xLhelpForSwitch: std_logic_vector(31 downto 0);
signal xRhelp: std_logic_vector(31 downto 0);
signal shifted: std_logic_vector(31 downto 0);
signal dataHelp: std_logic_vector(31 downto 0);

component RoundFunction is
    port( 
        key_in: in std_logic_vector(79 downto 0);
        xL_in: in std_logic_vector(31 downto 0);
        xL_out: out std_logic_vector(31 downto 0)
        
    );
end component;

begin
    
    xLhelpForSwitch <= xLdata_in;
    xRhelp <= xRdata_in;

        RF : RoundFunction 
        port map (
            key_in => fullKey_in,
            xL_in => xLdata_in,
            xL_out => xLhelp
        );

        shifted <= xRhelp(23 downto 0) & xRhelp(31 downto 24);

        dataHelp <= shifted XOR xLhelp;

        xLdata_out <= dataHelp;
        xRdata_out <= xLhelpForSwitch;


end Behavioral;

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
-- Description: merge block of 32 bits to 8 block of 4 bits
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity KeySchedule is
Port ( 
        key_in: in std_logic_vector(79 downto 0);
        round_value: in std_logic_vector(4 downto 0);
        key_out: out std_logic_vector(79 downto 0)

    );
end KeySchedule;

architecture Behavioral of KeySchedule is

signal shifted: std_logic_vector(79 downto 0);

component Sbox8
    port(
    data_in: in  std_logic_VECTOR(3 downto 0);
    data_out: out std_logic_VECTOR(3 downto 0)
    );
end component;

component Sbox9
    port(
    data_in: in  std_logic_VECTOR(3 downto 0);
    data_out: out std_logic_VECTOR(3 downto 0)
    );
end component;

begin
    -- key cicle shift by 29 bits
    switched <= key_in(50 downto 0) & key_in(79 downto 51);
    -- change part of key to Sbox values
    S9 : Sbox9 
        port map (
            data_in => switched(79 downto 76),
            data_out => key_out(79 downto 76)
    );

    S8 : Sbox8
        port map (
            data_in => switched(75 downto 72),
            data_out => key_out(75 downto 72)   
    );
    key_out(71 downto 51) <= switched(71 downto 51);
    key_out(50 downto 46) <= switched(50 downto 46) XOR round_value;
    key_out(45 downto 0) <= switched(45 downto 0);


    
end Behavioral;
0000 1101 0000 1000 1111 0110 1110 0   10111    11 1001 0101010111110000001010110010111011011000
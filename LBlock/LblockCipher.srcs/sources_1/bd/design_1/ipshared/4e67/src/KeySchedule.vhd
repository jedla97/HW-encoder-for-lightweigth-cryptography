----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Jedlička Jakub
-- 
-- Create Date: 10.11.2020 15:18:34
-- Design Name: 
-- Module Name: KeySchedule - Behavioral
-- Project Name: 
-- Target Devices: Zybo Z7
-- Tool Versions: 
-- Description: modified key every round by same standarts
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
        round_value: in std_logic_vector(5 downto 0);
        key_out: out std_logic_vector(79 downto 0)

    );
end KeySchedule;

architecture Behavioral of KeySchedule is

--help signal for circual bit shift
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
    -- key circular shift by 29 bits
    shifted <= key_in(50 downto 0) & key_in(79 downto 51);

    -- change part of key to Sbox values
    S9 : Sbox9 
        port map (
            data_in => shifted(79 downto 76),
            data_out => key_out(79 downto 76)
    );

    S8 : Sbox8
        port map (
            data_in => shifted(75 downto 72),
            data_out => key_out(75 downto 72)   
    );

    -- write new 80bit key to output with bit round value xor on 50 - 46 bit  
    key_out(71 downto 51) <= shifted(71 downto 51);
    key_out(50 downto 46) <= shifted(50 downto 46) 
    XOR round_value(4 downto 0);
    key_out(45 downto 0) <= shifted(45 downto 0);


    
end Behavioral;
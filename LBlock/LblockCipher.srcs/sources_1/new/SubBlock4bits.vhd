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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity SubBlock4bits is
Port ( 
        data_in: in std_logic_vector(31 downto 0);
        block7_out: out std_logic_vector(3 downto 0);
        block6_out: out std_logic_vector(3 downto 0);
        block5_out: out std_logic_vector(3 downto 0);
        block4_out: out std_logic_vector(3 downto 0);
        block3_out: out std_logic_vector(3 downto 0);
        block2_out: out std_logic_vector(3 downto 0);
        block1_out: out std_logic_vector(3 downto 0);
        block0_out: out std_logic_vector(3 downto 0)
    );
end SubBlock4bits;

architecture Behavioral of SubBlock4bits is
    -- 0-3, 4-7, 8-11, 12-15, 16-19, 20-23, 24-27 28-31
begin

    block0_out <= data_in(31 downto 28);
    block1_out <= data_in(27 downto 24);
    block2_out <= data_in(23 downto 20);
    block3_out <= data_in(19 downto 16);
    block4_out <= data_in(15 downto 12);
    block5_out <= data_in(11 downto 8);
    block6_out <= data_in(7 downto 4);
    block7_out <= data_in(3 downto 0);

end Behavioral;

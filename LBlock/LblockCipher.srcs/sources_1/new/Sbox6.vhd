----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Jedlička Jakub
-- 
-- Create Date: 9.11.2020 20:36:57
-- Design Name: 
-- Module Name: Sbox7 - Behavioral
-- Project Name: 
-- Target Devices: Zybo Z7
-- Tool Versions: 
-- Description: implementig sbox6 logic in confusion function
--              basically input is 4 bit number that transform to different 4 bit
--              number defined by table of sboxes 
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

entity Sbox6 is
Port ( 
    data_in: in std_logic_vector(3 downto 0);
    data_out: out std_logic_vector(3 downto 0)
    );
end Sbox6;

architecture Behavioral of Sbox6 is
 -- s6 = 11, 9, 4, 14, 0, 15, 10, 13, 6, 12, 5, 7, 3, 8, 1, 2
begin
process(data_in) is
begin
    case data_in is
        when "0000" => data_out <= "1011";
        when "0001" => data_out <= "1001";
        when "0010" => data_out <= "0100";
        when "0011" => data_out <= "1110";
        when "0100" => data_out <= "0000";
        when "0101" => data_out <= "1111";
        when "0110" => data_out <= "1010";
        when "0111" => data_out <= "1101";
        when "1000" => data_out <= "0110";
        when "1001" => data_out <= "1100";
        when "1010" => data_out <= "0101";
        when "1011" => data_out <= "0111";
        when "1100" => data_out <= "0011";
        when "1101" => data_out <= "1000";
        when "1110" => data_out <= "0001";
        when "1111" => data_out <= "0010";
        when others => null;
    end case;
end process; 
end Behavioral;

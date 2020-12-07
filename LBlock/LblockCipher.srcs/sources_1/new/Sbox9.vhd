----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Jedlička Jakub
-- 
-- Create Date: 10.11.2020 15:18:34
-- Design Name: 
-- Module Name: Sbox9 - Behavioral
-- Project Name: 
-- Target Devices: Zybo Z7
-- Tool Versions: 
-- Description: implementig sbox9 logic in key schedule
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

entity Sbox9 is
Port ( 
    data_in: in std_logic_vector(3 downto 0);
    data_out: out std_logic_vector(3 downto 0)
    );
end Sbox9;

architecture Behavioral of Sbox9 is
 -- s9 = 11, 5, 15, 0, 7, 2, 9, 13, 4, 8, 1, 12, 14, 10, 3, 6 -for key
begin
    data_out <= "1011" when data_in = "0000" else --11
                "0101" when data_in = "0001" else --5
                "1111" when data_in = "0010" else --15
                "0000" when data_in = "0011" else --0
                "0111" when data_in = "0100" else --7
                "0010" when data_in = "0101" else --2
                "1001" when data_in = "0110" else --9
                "1101" when data_in = "0111" else --13
                "0100" when data_in = "1000" else --4
                "1000" when data_in = "1001" else --8
                "0001" when data_in = "1010" else --1
                "1100" when data_in = "1011" else --12
                "1110" when data_in = "1100" else --14
                "1010" when data_in = "1101" else --10
                "0011" when data_in = "1110" else --3
                "0110" when data_in = "1111" ; --6


end Behavioral;

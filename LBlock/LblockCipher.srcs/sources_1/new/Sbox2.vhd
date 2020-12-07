----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Jedlička Jakub
-- 
-- Create Date: 9.11.2020 20:36:57
-- Design Name: 
-- Module Name: Sbox2 - Behavioral
-- Project Name: 
-- Target Devices: Zybo Z7
-- Tool Versions: 
-- Description: implementig sbox2 logic in confusion function
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

entity Sbox2 is
Port ( 
    data_in: in std_logic_vector(3 downto 0);
    data_out: out std_logic_vector(3 downto 0)
    );
end Sbox2;

architecture Behavioral of Sbox2 is
 -- s2 = 1, 14, 7, 12, 15, 13, 0, 6, 11, 5, 9, 3, 2, 4, 8, 10
begin
    data_out <= "0001" when data_in = "0000" else --1
                "1110" when data_in = "0001" else --14
                "0111" when data_in = "0010" else --7
                "1100" when data_in = "0011" else --12
                "1111" when data_in = "0100" else --15
                "1101" when data_in = "0101" else --13
                "0000" when data_in = "0110" else --0
                "0110" when data_in = "0111" else --6
                "1011" when data_in = "1000" else --11
                "0101" when data_in = "1001" else --5
                "1001" when data_in = "1010" else --9
                "0011" when data_in = "1011" else --3
                "0010" when data_in = "1100" else --2
                "0100" when data_in = "1101" else --4
                "1000" when data_in = "1110" else --8
                "1010" when data_in = "1111" ; --10


end Behavioral;

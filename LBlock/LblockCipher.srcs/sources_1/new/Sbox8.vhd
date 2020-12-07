----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Jedlička Jakub
-- 
-- Create Date: 10.11.2020 15:18:34
-- Design Name: 
-- Module Name: Sbox8 - Behavioral
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

entity Sbox8 is
Port ( 
    data_in: in std_logic_vector(3 downto 0);
    data_out: out std_logic_vector(3 downto 0)
    );
end Sbox8;

architecture Behavioral of Sbox8 is
 -- s8 = 8, 7, 14, 5, 15, 13, 0, 6, 11, 12, 9, 10, 2, 4, 1, 3 -for key
begin
    data_out <= "1000" when data_in = "0000" else --8
                "0111" when data_in = "0001" else --7
                "1110" when data_in = "0010" else --14
                "0101" when data_in = "0011" else --5
                "1111" when data_in = "0100" else --15
                "1101" when data_in = "0101" else --13
                "0000" when data_in = "0110" else --0
                "0110" when data_in = "0111" else --6
                "1011" when data_in = "1000" else --11
                "1100" when data_in = "1001" else --12
                "1001" when data_in = "1010" else --9
                "1010" when data_in = "1011" else --10
                "0010" when data_in = "1100" else --2
                "0100" when data_in = "1101" else --4
                "0001" when data_in = "1110" else --1
                "0011" when data_in = "1111" ; --3


end Behavioral;

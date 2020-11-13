----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 9.11.2020 20:36:57
-- Design Name: 
-- Module Name: Sbox1 - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description:
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

entity Sbox7 is
Port ( 
    data_in: in std_logic_vector(3 downto 0);
    data_out: out std_logic_vector(3 downto 0)
    );
end Sbox7;

architecture Behavioral of Sbox7 is
 -- s7 = 13, 10, 15, 0, 14, 4, 9, 11, 2, 1, 8, 3, 7, 5, 12, 6
begin
    data_out <= "1101" when data_in = "0000" else --13
                "1010" when data_in = "0001" else --10
                "1111" when data_in = "0010" else --15
                "0000" when data_in = "0011" else --0
                "1110" when data_in = "0100" else --14
                "0100" when data_in = "0101" else --4
                "1001" when data_in = "0110" else --9
                "1011" when data_in = "0111" else --11
                "0010" when data_in = "1000" else --2
                "0001" when data_in = "1001" else --1
                "1000" when data_in = "1010" else --8
                "0011" when data_in = "1011" else --3
                "0111" when data_in = "1100" else --7
                "0101" when data_in = "1101" else --5
                "1100" when data_in = "1110" else --12
                "0110" when data_in = "1111" ; --6


end Behavioral;

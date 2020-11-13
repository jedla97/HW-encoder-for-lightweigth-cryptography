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

entity Sbox5 is
Port ( 
    data_in: in std_logic_vector(3 downto 0);
    data_out: out std_logic_vector(3 downto 0)
    );
end Sbox5;

architecture Behavioral of Sbox5 is
 -- s5 = 2, 13, 11, 12, 15, 14, 0, 9, 7, 10, 6, 3, 1, 8, 4, 5
begin
    data_out <= "0010" when data_in = "0000" else --2
                "1101" when data_in = "0001" else --13
                "1011" when data_in = "0010" else --11
                "1100" when data_in = "0011" else --12
                "1111" when data_in = "0100" else --15
                "1110" when data_in = "0101" else --14
                "0000" when data_in = "0110" else --0
                "1001" when data_in = "0111" else --9
                "0111" when data_in = "1000" else --7
                "1010" when data_in = "1001" else --10
                "0110" when data_in = "1010" else --6
                "0011" when data_in = "1011" else --3
                "0001" when data_in = "1100" else --1
                "1000" when data_in = "1101" else --8
                "0100" when data_in = "1110" else --4
                "0101" when data_in = "1111" ; --5

end Behavioral;

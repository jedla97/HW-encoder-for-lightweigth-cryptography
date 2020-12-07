----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Jedlička Jakub
-- 
-- Create Date: 9.11.2020 20:36:57
-- Design Name: 
-- Module Name: Sbox0 - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: implementig sbox0 logic in confusion function
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

entity Sbox0 is
Port ( 
    data_in: in std_logic_vector(3 downto 0);
    data_out: out std_logic_vector(3 downto 0)
    );
end Sbox0;

architecture Behavioral of Sbox0 is
 -- s0 = 14,9,15,0,13,4,10,11,1,2,8,3,7,6,12,5
begin
    data_out <= "1110" when data_in = "0000" else --14
                "1001" when data_in = "0001" else --9
                "1111" when data_in = "0010" else --15
                "0000" when data_in = "0011" else --0
                "1101" when data_in = "0100" else --13
                "0100" when data_in = "0101" else --4
                "1010" when data_in = "0110" else --10
                "1011" when data_in = "0111" else --11
                "0001" when data_in = "1000" else --1
                "0010" when data_in = "1001" else --2
                "1000" when data_in = "1010" else --8
                "0011" when data_in = "1011" else --3
                "0111" when data_in = "1100" else --7
                "0110" when data_in = "1101" else --6
                "1100" when data_in = "1110" else --12
                "0101" when data_in = "1111" ; --5


end Behavioral;

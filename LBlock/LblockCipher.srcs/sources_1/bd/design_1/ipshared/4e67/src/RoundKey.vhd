----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Jedlička Jakub
-- 
-- Create Date: 10.11.2020 15:18:34
-- Design Name: 
-- Module Name: RoundKey - Behavioral
-- Project Name: 
-- Target Devices: Zybo Z7
-- Tool Versions: 
-- Description: from 80 bit key do 32 bit key used in round for encryption
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

entity RoundKey is
Port ( 
        key_in: in std_logic_vector(79 downto 0);
        key_out: out std_logic_vector(31 downto 0)
        
    );
end RoundKey;

architecture Behavioral of RoundKey is
begin

	key_out <= key_in(79 downto 48);

end Behavioral;

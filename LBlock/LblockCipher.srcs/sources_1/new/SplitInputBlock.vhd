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

entity SplitInputBlock is
Port ( 
        data_in: in std_logic_vector(31 downto 0);
        xL_out: out std_logic_vector(15 downto 0);
        xR_out: out std_logic_vector(15 downto 0)
        
    );
end SplitInputBlock;

architecture Behavioral of SplitInputBlock is
    -- 0-3, 4-7, 8-11, 12-15, 16-19, 20-23, 24-27 28-31
begin

    xL_out <= data_in(31 downto 16);
    xR_out <= data_in(15 downto 0);

end Behavioral;

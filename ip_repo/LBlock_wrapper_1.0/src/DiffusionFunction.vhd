----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Jedlička Jakub
-- 
-- Create Date: 10.11.2020 15:18:34
-- Design Name: 
-- Module Name: DiffusionFunction - Behavioral
-- Project Name: 
-- Target Devices: Zybo Z7
-- Tool Versions: 
-- Description: implementing diffusion function input is 32 bit block and output 
--              is modified 32 bit block
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

entity DiffusionFunction is
Port ( 
    P_in: in std_logic_vector(31 downto 0);
    P_out: out std_logic_vector(31 downto 0)
    );
end DiffusionFunction;

architecture Behavioral of DiffusionFunction is

begin

    P_out(31 downto 28) <= P_in(27 downto 24);
    P_out(27 downto 24) <= P_in(19 downto 16);
    P_out(23 downto 20) <= P_in(31 downto 28);
    P_out(19 downto 16) <= P_in(23 downto 20);
    P_out(15 downto 12) <= P_in(11 downto 8);
    P_out(11 downto 8) <= P_in(3 downto 0);
    P_out(7 downto 4) <= P_in(15 downto 12);
    P_out(3 downto 0) <= P_in(7 downto 4);


end Behavioral;

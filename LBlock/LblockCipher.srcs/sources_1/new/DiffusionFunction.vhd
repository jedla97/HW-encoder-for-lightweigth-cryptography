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
-- Description: conecting all Sboxes
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
    P7_in: in std_logic_vector(3 downto 0);
    P6_in: in std_logic_vector(3 downto 0);
    P5_in: in std_logic_vector(3 downto 0);
    P4_in: in std_logic_vector(3 downto 0);
    P3_in: in std_logic_vector(3 downto 0);
    P2_in: in std_logic_vector(3 downto 0);
    P1_in: in std_logic_vector(3 downto 0);
    P0_in: in std_logic_vector(3 downto 0);
    P7_out: out std_logic_vector(3 downto 0);
    P6_out: out std_logic_vector(3 downto 0);
    P5_out: out std_logic_vector(3 downto 0);
    P4_out: out std_logic_vector(3 downto 0);
    P3_out: out std_logic_vector(3 downto 0);
    P2_out: out std_logic_vector(3 downto 0);
    P1_out: out std_logic_vector(3 downto 0);
    P0_out: out std_logic_vector(3 downto 0)
    );
end DiffusionFunction;

architecture Behavioral of DiffusionFunction is

begin

    P7_out <= P6_in;
    P6_out <= P4_in;
    P5_out <= P7_in;
    P4_out <= P5_in;
    P3_out <= P2_in;
    P2_out <= P0_in;
    P1_out <= P3_in;
    P0_out <= P1_in;


end Behavioral;

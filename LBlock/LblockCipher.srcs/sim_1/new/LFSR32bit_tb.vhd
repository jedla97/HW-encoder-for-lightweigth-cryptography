----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.03.2021 20:12:23
-- Design Name: 
-- Module Name: LFSR32bit_tb - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity LFSR32bit_tb is
end;

architecture bench of LFSR32bit_tb is

  component LFSR32bit
      port(clk: in std_logic; 
           random_data_out: out std_logic_vector(31 downto 0)
      );
  end component;

  signal clk: std_logic;
  signal random_data_out: std_logic_vector(31 downto 0);

  constant clk_period: time := 2 ns;

begin

  uut: LFSR32bit port map ( clk             => clk,
                            random_data_out => random_data_out );

 clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;

  stimulus: process
  begin
  
  
    -- Put initialisation code here
    

    wait;
  end process;

end;
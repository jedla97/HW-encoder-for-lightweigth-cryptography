----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.03.2021 14:54:25
-- Design Name: 
-- Module Name: axi_stream_wrapper - Behavioral
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

entity LFSR32bit is
    port(clk: in std_logic; 
         reset: in std_logic;
         random_data_out: out std_logic_vector(31 downto 0)
    );
end LFSR32bit;

architecture Behavioral of LFSR32bit is
    signal current_state : std_logic_vector(31 downto 0) := "11001101010101001111100111011011";
    signal next_state : std_logic_vector(31 downto 0);
    signal xnor_tap : std_logic;
    
    begin
         process(clk, reset)
         begin
            if reset = '1' then
                current_state <= "11001101010101001111100111011011";
            elsif CLK'EVENT and clk = '1' then
                current_state <= next_state;
                     --32,22,2,1
            end if;
         
         end process;
    xnor_tap <= current_state(31) xnor current_state(21) xnor current_state(1) xnor current_state(0);
    next_state <= current_state(30 downto 0) & xnor_tap;
    random_data_out <= current_state;
end Behavioral;
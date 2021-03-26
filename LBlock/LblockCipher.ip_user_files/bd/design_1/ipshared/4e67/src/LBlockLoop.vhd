----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Jedlička Jakub
-- 
-- Create Date: 10.11.2020 15:18:34
-- Design Name: 
-- Module Name: LBlockLoop - Behavioral
-- Project Name: 
-- Target Devices: Zybo Z7
-- Tool Versions: 
-- Description: doing all round operation input is 80 bit key and left and right
--              side of fiestel network output is left side changed modified 
--              right side
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

entity LBlockLoop is
Port ( 
    xLdata_in: in std_logic_vector(31 downto 0);
    xRdata_in: in std_logic_vector(31 downto 0);
    full_key_in: in std_logic_vector(79 downto 0);
    xLdata_out: out std_logic_vector(31 downto 0);
    xRdata_out: out std_logic_vector(31 downto 0)

    );
end LBlockLoop;

architecture Behavioral of LBlockLoop is

-- used as output of round function
signal xLhelp: std_logic_vector(31 downto 0);
-- used for shifing bits
signal shifted: std_logic_vector(31 downto 0);
-- result of xor between shifted right side and modified left side
signal data_help: std_logic_vector(31 downto 0);

component RoundFunction is
    port( 
        key_in: in std_logic_vector(79 downto 0);
        xL_in: in std_logic_vector(31 downto 0);
        xL_out: out std_logic_vector(31 downto 0)
        
    );
end component;

begin
    -- round function of LBlock
    RF : RoundFunction 
        port map (
            key_in => full_key_in,
            xL_in => xLdata_in,
            xL_out => xLhelp
        );

        -- shifting right side of 8 bits
        shifted <= xRdata_in(23 downto 0) & xRdata_in(31 downto 24);

        --- xor of both side
        data_help <= shifted XOR xLhelp;

        -- output when modified rigth is new left and new right is 
        -- unmodified left side
        xLdata_out <= data_help;
        xRdata_out <= xLdata_in;


end Behavioral;

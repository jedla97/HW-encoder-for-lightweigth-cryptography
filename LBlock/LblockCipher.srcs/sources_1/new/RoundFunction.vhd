----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Jedlička Jakub
-- 
-- Create Date: 10.11.2020 15:18:34
-- Design Name: 
-- Module Name: RoundFunction - Behavioral
-- Project Name: 
-- Target Devices: Zybo Z7
-- Tool Versions: 
-- Description: implementation of round function which have input key and left 
--              side of fiestel network and output is modified input to right
--              side
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

entity RoundFunction is
Port ( 
        key_in: in std_logic_vector(79 downto 0);
       	xL_in: in std_logic_vector(31 downto 0);
       	xL_out: out std_logic_vector(31 downto 0)
        
    );
end RoundFunction;

architecture Behavioral of RoundFunction is

signal key32bit: std_logic_vector(31 downto 0);
signal result_of_xor: std_logic_vector(31 downto 0);
signal result_of_sbox: std_logic_vector(31 downto 0);

component RoundKey
    port(
    key_in: in  std_logic_VECTOR(79 downto 0);
    key_out: out std_logic_VECTOR(31 downto 0)
    );
end component;

component Sbox
    port(
    S_in: in std_logic_vector(31 downto 0);
    s_out: out std_logic_vector(31 downto 0)
    );
end component;

component DiffusionFunction
    port(
    P_in: in std_logic_vector(31 downto 0);
    P_out: out std_logic_vector(31 downto 0)
    );
end component;


begin
    -- getting 32bit key from 80bit key
	RK : RoundKey 
        port map (
            key_in => key_in,
            key_out => key32bit
    );

    --XOR of 32 bit key and left side of fiestel network
    result_of_xor <= xL_in XOR key32bit;

    -- using confusion layer
    Sb : Sbox 
        port map (
            S_in => result_of_xor(31 downto 0),
    		s_out => result_of_sbox(31 downto 0)
    	);

    -- using difusion layer and output is modified left side
    DF : DiffusionFunction 
        port map (
            P_in => result_of_sbox(31 downto 0),
    		P_out => xL_out(31 downto 0)
    	);

end Behavioral;
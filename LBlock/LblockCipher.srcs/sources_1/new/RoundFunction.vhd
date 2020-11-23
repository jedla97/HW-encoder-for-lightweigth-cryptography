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

entity RoundFunction is
Port ( 
        key_in: in std_logic_vector(79 downto 0);
       	xL_in: in std_logic_vector(31 downto 0);
       	xL_out: out std_logic_vector(31 downto 0)
        
    );
end RoundFunction;

architecture Behavioral of RoundFunction is

signal key32bit: std_logic_vector(31 downto 0);
signal resultOfXOR: std_logic_vector(31 downto 0);
signal resultOfSbox: std_logic_vector(31 downto 0);
signal resultOfPermutation: std_logic_vector(31 downto 0);

component RoundKey
    port(
    key_in: in  std_logic_VECTOR(79 downto 0);
    key_out: out std_logic_VECTOR(31 downto 0)
    );
end component;

component Sbox
    port(
    S7_in: in std_logic_vector(3 downto 0);
    S6_in: in std_logic_vector(3 downto 0);
    S5_in: in std_logic_vector(3 downto 0);
    S4_in: in std_logic_vector(3 downto 0);
    S3_in: in std_logic_vector(3 downto 0);
    S2_in: in std_logic_vector(3 downto 0);
    S1_in: in std_logic_vector(3 downto 0);
    S0_in: in std_logic_vector(3 downto 0);
    s7_out: out std_logic_vector(3 downto 0);
    s6_out: out std_logic_vector(3 downto 0);
    s5_out: out std_logic_vector(3 downto 0);
    s4_out: out std_logic_vector(3 downto 0);
    s3_out: out std_logic_vector(3 downto 0);
    s2_out: out std_logic_vector(3 downto 0);
    s1_out: out std_logic_vector(3 downto 0);
    s0_out: out std_logic_vector(3 downto 0)
    );
end component;

component DiffusionFunction
    port(
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
end component;


begin
	RK : RoundKey 
        port map (
            key_in => key_in,
            key_out => key32bit
    );

    resultOfXOR <= xL_in XOR key32bit;

    Sb : Sbox 
        port map (
            S7_in => resultOfXOR(31 downto 28),
    		S6_in => resultOfXOR(27 downto 24),
    		S5_in => resultOfXOR(23 downto 20),
    		S4_in => resultOfXOR(19 downto 16),
    		S3_in => resultOfXOR(15 downto 12),
    		S2_in => resultOfXOR(11 downto 8),
    		S1_in => resultOfXOR(7 downto 4),
    		S0_in => resultOfXOR(3 downto 0),
    		s7_out => resultOfSbox(31 downto 28),
    		s6_out => resultOfSbox(27 downto 24),
    		s5_out => resultOfSbox(23 downto 20),
    		s4_out => resultOfSbox(19 downto 16),
    		s3_out => resultOfSbox(15 downto 12),
    		s2_out => resultOfSbox(11 downto 8),
    		s1_out => resultOfSbox(7 downto 4),
    		s0_out => resultOfSbox(3 downto 0)
    	);

    DF : DiffusionFunction 
        port map (
            P7_in => resultOfSbox(31 downto 28),
    		P6_in => resultOfSbox(27 downto 24),
    		P5_in => resultOfSbox(23 downto 20),
    		P4_in => resultOfSbox(19 downto 16),
    		P3_in => resultOfSbox(15 downto 12),
    		P2_in => resultOfSbox(11 downto 8),
    		P1_in => resultOfSbox(7 downto 4),
    		P0_in => resultOfSbox(3 downto 0),
    		P7_out => resultOfPermutation(31 downto 28),
    		P6_out => resultOfPermutation(27 downto 24),
    		P5_out => resultOfPermutation(23 downto 20),
    		P4_out => resultOfPermutation(19 downto 16),
    		P3_out => resultOfPermutation(15 downto 12),
    		P2_out => resultOfPermutation(11 downto 8),
    		P1_out => resultOfPermutation(7 downto 4),
    		P0_out => resultOfPermutation(3 downto 0)
    	);

    xL_out <= resultOfPermutation;

end Behavioral;
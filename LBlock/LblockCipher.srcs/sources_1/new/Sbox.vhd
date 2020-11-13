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

entity Sbox is
Port ( 
    S0_in: in std_logic_vector(3 downto 0);
    S1_in: in std_logic_vector(3 downto 0);
    S2_in: in std_logic_vector(3 downto 0);
    S3_in: in std_logic_vector(3 downto 0);
    S4_in: in std_logic_vector(3 downto 0);
    S5_in: in std_logic_vector(3 downto 0);
    S6_in: in std_logic_vector(3 downto 0);
    S7_in: in std_logic_vector(3 downto 0);
    s0_out: out std_logic_vector(3 downto 0);
    s1_out: out std_logic_vector(3 downto 0);
    s2_out: out std_logic_vector(3 downto 0);
    s3_out: out std_logic_vector(3 downto 0);
    s4_out: out std_logic_vector(3 downto 0);
    s5_out: out std_logic_vector(3 downto 0);
    s6_out: out std_logic_vector(3 downto 0);
    s7_out: out std_logic_vector(3 downto 0)
    );
end Sbox;

architecture Behavioral of Sbox is
    
component Sbox0
    port(
    data_in: in  std_logic_VECTOR(3 downto 0);
    data_out: out std_logic_VECTOR(3 downto 0)
    );
end component;  

component Sbox1
    port(
    data_in: in  std_logic_VECTOR(3 downto 0);
    data_out: out std_logic_VECTOR(3 downto 0)
    );
end component; 

component Sbox2
    port(
    data_in: in  std_logic_VECTOR(3 downto 0);
    data_out: out std_logic_VECTOR(3 downto 0)
    );
end component; 

component Sbox3
    port(
    data_in: in  std_logic_VECTOR(3 downto 0);
    data_out: out std_logic_VECTOR(3 downto 0)
    );
end component; 

component Sbox4
    port(
    data_in: in  std_logic_VECTOR(3 downto 0);
    data_out: out std_logic_VECTOR(3 downto 0)
    );
end component; 

component Sbox5
    port(
    data_in: in  std_logic_VECTOR(3 downto 0);
    data_out: out std_logic_VECTOR(3 downto 0)
    );
end component; 

component Sbox6
    port(
    data_in: in  std_logic_VECTOR(3 downto 0);
    data_out: out std_logic_VECTOR(3 downto 0)
    );
end component; 

component Sbox7
    port(
    data_in: in  std_logic_VECTOR(3 downto 0);
    data_out: out std_logic_VECTOR(3 downto 0)
    );
end component;

begin

S0 : Sbox0 
    port map (
        data_in => S0_in,
        data_out => s0_out   
);

S1 : Sbox1 
    port map (
        data_in => S1_in,
        data_out => s1_out   
);

S2 : Sbox2 
    port map (
        data_in => S2_in,
        data_out => s2_out   
);

S3 : Sbox3 
    port map (
        data_in => S3_in,
        data_out => s3_out   
);

S4 : Sbox4 
    port map (
        data_in => S4_in,
        data_out => s4_out   
);

S5 : Sbox5
    port map (
        data_in => S5_in,
        data_out => s5_out   
);

S6 : Sbox6 
    port map (
        data_in => S6_in,
        data_out => s6_out   
);

S7 : Sbox7
    port map (
        data_in => S7_in,
        data_out => s7_out   
);
end Behavioral;

----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Jedlička Jakub
-- 
-- Create Date: 10.11.2020 15:18:34
-- Design Name: 
-- Module Name: Sbox - Behavioral
-- Project Name: 
-- Target Devices: Zybo Z7
-- Tool Versions: 
-- Description: conecting all Sboxes for confusion function
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
    S_in: in std_logic_vector(31 downto 0);
    s_out: out std_logic_vector(31 downto 0)
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
        data_in => S_in(3 downto 0),
        data_out => s_out(3 downto 0)
);

S1 : Sbox1 
    port map (
        data_in => S_in(7 downto 4),
        data_out => s_out(7 downto 4)
);

S2 : Sbox2 
    port map (
        data_in => S_in(11 downto 8),
        data_out => s_out(11 downto 8)
);

S3 : Sbox3 
    port map (
        data_in => S_in(15 downto 12),
        data_out => s_out(15 downto 12)
);

S4 : Sbox4 
    port map (
        data_in => S_in(19 downto 16),
        data_out => s_out(19 downto 16)
);

S5 : Sbox5
    port map (
        data_in => S_in(23 downto 20),
        data_out => s_out(23 downto 20)
);

S6 : Sbox6 
    port map (
        data_in => S_in(27 downto 24),
        data_out => s_out(27 downto 24)
);

S7 : Sbox7
    port map (
        data_in => S_in(31 downto 28),
        data_out => s_out(31 downto 28)
);
end Behavioral;

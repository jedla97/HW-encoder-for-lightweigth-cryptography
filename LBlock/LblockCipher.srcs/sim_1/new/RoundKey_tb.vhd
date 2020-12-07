library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity RoundKey_tb is
end;

architecture bench of RoundKey_tb is

  component RoundKey
  Port ( 
          key_in: in std_logic_vector(79 downto 0);
          key_out: out std_logic_vector(31 downto 0)
      );
  end component;

  signal key_in: std_logic_vector(79 downto 0);
  signal key_out: std_logic_vector(31 downto 0) ;

begin

  uut: RoundKey port map ( key_in  => key_in,
                           key_out => key_out );

  stimulus: process
  begin
  
    -- Put initialisation code here
    key_in <= "10010010001101110011011111111011110111010110010010111100011010111000111110100001";
    wait for 10 ns;
    key_in <= "10101111001011011000101101100100011011100111000011001110001110100001001001011111";
    wait for 10 ns;
    key_in <= "10101111011000111001011010111110100100101001000000011001110101011110111010100000";
    wait for 10 ns;
    -- Put test bench stimulus code here

    wait;
  end process;


end;
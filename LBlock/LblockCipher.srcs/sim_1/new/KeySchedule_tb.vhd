library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity KeySchedule_tb is
end;

architecture bench of KeySchedule_tb is

  component KeySchedule
  Port ( 
          key_in: in std_logic_vector(79 downto 0);
          round_value: in std_logic_vector(4 downto 0);
          key_out: out std_logic_vector(79 downto 0)
      );
  end component;

  signal key_in: std_logic_vector(79 downto 0);
  signal round_value: std_logic_vector(4 downto 0);
  signal key_out: std_logic_vector(79 downto 0) ;

begin

  uut: KeySchedule port map ( key_in       => key_in,
                              round_value  => round_value,
                              key_out      => key_out );

  stimulus: process
  begin
  
    -- Put initialisation code here
      key_in <= "10000001010110010111011011000001101010000100011110110111001011011100101010101111";
      round_value <= "00001";
      wait for 10 ns;
        -- expected value 00001101000010001111011011100101111110010101010111110000001010110010111011011000
    -- Put test bench stimulus code here

    wait;
  end process;


end;
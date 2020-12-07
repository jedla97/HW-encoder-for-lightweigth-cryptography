library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity RoundFunction_tb is
end;

architecture bench of RoundFunction_tb is

  component RoundFunction
  Port ( 
          key_in: in std_logic_vector(79 downto 0);
         	xL_in: in std_logic_vector(31 downto 0);
         	xL_out: out std_logic_vector(31 downto 0)
      );
  end component;

  signal key_in: std_logic_vector(79 downto 0);
  signal xL_in: std_logic_vector(31 downto 0);
  signal xL_out: std_logic_vector(31 downto 0) ;

begin

  uut: RoundFunction port map ( key_in => key_in,
                                xL_in  => xL_in,
                                xL_out => xL_out );

  stimulus: process
  begin
  
    -- Put initialisation code here
       key_in <= "10101111011000111001011010111110100100101001000000011001110101011110111010100000";
       xL_in <= "11011111111110111010000010110010";
       wait for 10 ns;
       key_in <= "01110100100100001010000111001111000011001100000100111100001001011010110110100101";
       xL_in <= "00010101001010000000111001011101";
       wait for 10 ns;
       key_in <= "11111101101110010110101011111011010111010001100111001101111110001011101110100101";
       xL_in <= "10000010001000011100011110001011";
       wait for 10 ns;

    -- Put test bench stimulus code here

    wait;
  end process;


end;
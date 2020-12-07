library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity DiffusionFunction_tb is
end;

architecture bench of DiffusionFunction_tb is

  component DiffusionFunction
  Port ( 
      P_in: in std_logic_vector(31 downto 0);
      P_out: out std_logic_vector(31 downto 0)
      );
  end component;

  signal P_in: std_logic_vector(31 downto 0);
  signal P_out: std_logic_vector(31 downto 0) ;

begin

  uut: DiffusionFunction port map ( P_in  => P_in,
                                    P_out => P_out );

  stimulus: process
  begin
  
    -- Put initialisation code here
    P_in <= "10110110101100000100110000100011";
    wait for 10 ns;
    P_in <= "10010111100001100110010000101000";
    wait for 10 ns;
    P_in <= "01000001010110010101010011101010";
    wait for 10 ns;
    P_in <= "10010011010111110101100100110011";
    wait for 10 ns;
    -- Put test bench stimulus code here

    wait;
  end process;


end;
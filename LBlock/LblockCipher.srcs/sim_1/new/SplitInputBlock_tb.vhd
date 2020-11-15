library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity SplitInputBlock_tb is
end;

architecture bench of SplitInputBlock_tb is

  component SplitInputBlock
  Port ( 
          data_in: in std_logic_vector(31 downto 0);
          xL_out: out std_logic_vector(15 downto 0);
          xR_out: out std_logic_vector(15 downto 0)
      );
  end component;

  signal data_in: std_logic_vector(31 downto 0);
  signal xL_out: std_logic_vector(15 downto 0);
  signal xR_out: std_logic_vector(15 downto 0) ;

begin

  uut: SplitInputBlock port map ( data_in => data_in,
                                  xL_out  => xL_out,
                                  xR_out  => xR_out );

  stimulus: process
  begin
  
    -- Put initialisation code here
     data_in <= "10011100111011101000101101111110";
    wait for 50 ns;
    data_in <= "00101110010110001000110110101111";
    wait for 50 ns;
    data_in <= "10001100001100100010000000101100";
    wait for 50 ns;
    data_in <= "00110001001001011101011110001111";
    wait for 50 ns;
    data_in <= "01110111110101011110100001111110";
    wait for 50 ns;

    -- Put test bench stimulus code here

    wait;
  end process;


end;
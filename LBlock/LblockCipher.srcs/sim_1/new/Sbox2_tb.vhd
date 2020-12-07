library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity Sbox2_tb is
end;

architecture bench of Sbox2_tb is

  component Sbox2
  Port ( 
      data_in: in std_logic_vector(3 downto 0);
      data_out: out std_logic_vector(3 downto 0)
      );
  end component;

  signal data_in: std_logic_vector(3 downto 0);
  signal data_out: std_logic_vector(3 downto 0) ;

begin

  uut: Sbox2 port map ( data_in  => data_in,
                        data_out => data_out );

  stimulus: process
  begin
  
    -- Put initialisation code here
        data_in <= "0000";
        wait for 10 ns;
        data_in <= "0001";
        wait for 10 ns;
        data_in <= "0010";
        wait for 10 ns;
        data_in <= "0011";
        wait for 10 ns;
        data_in <= "0100";
        wait for 10 ns;
        data_in <= "0101";
        wait for 10 ns;
        data_in <= "0110";
        wait for 10 ns;
        data_in <= "0111";
        wait for 10 ns;
        data_in <= "1000";
        wait for 10 ns;
        data_in <= "1001";
        wait for 10 ns;
        data_in <= "1010";
        wait for 10 ns;
        data_in <= "1011";
        wait for 10 ns;
        data_in <= "1100";
        wait for 10 ns;
        data_in <= "1101";
        wait for 10 ns;
        data_in <= "1110";
        wait for 10 ns;
        data_in <= "1111";

    -- Put test bench stimulus code here

    wait;
  end process;


end;
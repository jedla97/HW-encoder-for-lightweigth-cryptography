library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity SubBlock4bits_tb is
end;

architecture bench of SubBlock4bits_tb is

  component SubBlock4bits
  Port ( 
          data_in: in std_logic_vector(31 downto 0);
          block0_out: out std_logic_vector(3 downto 0);
          block1_out: out std_logic_vector(3 downto 0);
          block2_out: out std_logic_vector(3 downto 0);
          block3_out: out std_logic_vector(3 downto 0);
          block4_out: out std_logic_vector(3 downto 0);
          block5_out: out std_logic_vector(3 downto 0);
          block6_out: out std_logic_vector(3 downto 0);
          block7_out: out std_logic_vector(3 downto 0)
      );
  end component;

  signal data_in: std_logic_vector(31 downto 0);
  signal block0_out: std_logic_vector(3 downto 0);
  signal block1_out: std_logic_vector(3 downto 0);
  signal block2_out: std_logic_vector(3 downto 0);
  signal block3_out: std_logic_vector(3 downto 0);
  signal block4_out: std_logic_vector(3 downto 0);
  signal block5_out: std_logic_vector(3 downto 0);
  signal block6_out: std_logic_vector(3 downto 0);
  signal block7_out: std_logic_vector(3 downto 0) ;

begin

  uut: SubBlock4bits port map ( data_in    => data_in,
                                block0_out => block0_out,
                                block1_out => block1_out,
                                block2_out => block2_out,
                                block3_out => block3_out,
                                block4_out => block4_out,
                                block5_out => block5_out,
                                block6_out => block6_out,
                                block7_out => block7_out );

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
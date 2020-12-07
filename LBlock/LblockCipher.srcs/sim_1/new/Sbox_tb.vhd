library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity Sbox_tb is
end;

architecture bench of Sbox_tb is

  component Sbox
  Port ( 
      S_in: in std_logic_vector(31 downto 0);
      s_out: out std_logic_vector(31 downto 0)
      );
  end component;

  signal S_in: std_logic_vector(31 downto 0);
  signal s_out: std_logic_vector(31 downto 0) ;

begin

  uut: Sbox port map ( S_in  => S_in,
                       s_out => s_out );

  stimulus: process
  begin
  
    -- Put initialisation code here
    s_in <= "00000000000000000000000000000000";
    wait for 10ns;
    s_in <= "00010001000100010001000100010001";
    wait for 10ns;
    s_in <= "10001000100010001000100010001000";
    wait for 10ns;
    -- Put test bench stimulus code here

    wait;
  end process;


end;
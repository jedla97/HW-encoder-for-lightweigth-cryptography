library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity LBlockLoop_tb is
end;

architecture bench of LBlockLoop_tb is

  component LBlockLoop
  Port ( 
      xLdata_in: in std_logic_vector(31 downto 0);
      xRdata_in: in std_logic_vector(31 downto 0);
      full_key_in: in std_logic_vector(79 downto 0);
      xLdata_out: out std_logic_vector(31 downto 0);
      xRdata_out: out std_logic_vector(31 downto 0)
      );
  end component;

  signal xLdata_in: std_logic_vector(31 downto 0);
  signal xRdata_in: std_logic_vector(31 downto 0);
  signal full_key_in: std_logic_vector(79 downto 0);
  signal xLdata_out: std_logic_vector(31 downto 0);
  signal xRdata_out: std_logic_vector(31 downto 0) ;

begin

  uut: LBlockLoop port map ( xLdata_in   => xLdata_in,
                             xRdata_in   => xRdata_in,
                             full_key_in => full_key_in,
                             xLdata_out  => xLdata_out,
                             xRdata_out  => xRdata_out );

  stimulus: process
  begin
  
    -- Put initialisation code here
    xLdata_in <= "00000000000000000000000000000000";
    xRdata_in <= "00000000000000000000000000000000";
    full_key_in <= "00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    wait for 10 ns;
    xLdata_in <= "00010001000100010001000100010001";
    xRdata_in <= "00000000000000000000000000000000";
    full_key_in <= "00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    wait for 10 ns;
    xLdata_in <= "10001000100010001000100010001000";
    xRdata_in <= "10001000100010001000100010001000";
    full_key_in <= "00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    wait for 10 ns;
    -- Put test bench stimulus code here

    wait;
  end process;


end;
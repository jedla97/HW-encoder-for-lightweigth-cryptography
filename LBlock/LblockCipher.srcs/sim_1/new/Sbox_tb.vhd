library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity Sbox_tb is
end;

architecture bench of Sbox_tb is

  component Sbox
  Port ( 
      S0_in: in std_logic_vector(3 downto 0);
      S1_in: in std_logic_vector(3 downto 0);
      S2_in: in std_logic_vector(3 downto 0);
      S3_in: in std_logic_vector(3 downto 0);
      S4_in: in std_logic_vector(3 downto 0);
      S5_in: in std_logic_vector(3 downto 0);
      S6_in: in std_logic_vector(3 downto 0);
      S7_in: in std_logic_vector(3 downto 0);
      s0_out: out std_logic_vector(3 downto 0);
      s1_out: out std_logic_vector(3 downto 0);
      s2_out: out std_logic_vector(3 downto 0);
      s3_out: out std_logic_vector(3 downto 0);
      s4_out: out std_logic_vector(3 downto 0);
      s5_out: out std_logic_vector(3 downto 0);
      s6_out: out std_logic_vector(3 downto 0);
      s7_out: out std_logic_vector(3 downto 0)
      );
  end component;

  signal S0_in: std_logic_vector(3 downto 0);
  signal S1_in: std_logic_vector(3 downto 0);
  signal S2_in: std_logic_vector(3 downto 0);
  signal S3_in: std_logic_vector(3 downto 0);
  signal S4_in: std_logic_vector(3 downto 0);
  signal S5_in: std_logic_vector(3 downto 0);
  signal S6_in: std_logic_vector(3 downto 0);
  signal S7_in: std_logic_vector(3 downto 0);
  signal s0_out: std_logic_vector(3 downto 0);
  signal s1_out: std_logic_vector(3 downto 0);
  signal s2_out: std_logic_vector(3 downto 0);
  signal s3_out: std_logic_vector(3 downto 0);
  signal s4_out: std_logic_vector(3 downto 0);
  signal s5_out: std_logic_vector(3 downto 0);
  signal s6_out: std_logic_vector(3 downto 0);
  signal s7_out: std_logic_vector(3 downto 0) ;

begin

  uut: Sbox port map ( S0_in  => S0_in,
                       S1_in  => S1_in,
                       S2_in  => S2_in,
                       S3_in  => S3_in,
                       S4_in  => S4_in,
                       S5_in  => S5_in,
                       S6_in  => S6_in,
                       S7_in  => S7_in,
                       s0_out => s0_out,
                       s1_out => s1_out,
                       s2_out => s2_out,
                       s3_out => s3_out,
                       s4_out => s4_out,
                       s5_out => s5_out,
                       s6_out => s6_out,
                       s7_out => s7_out );

  stimulus: process
  begin
  
    -- Put initialisation code here
    S0_in <= "0000";
    S1_in <= "0000";
    S2_in <= "0000";
    S3_in <= "0000";
    S4_in <= "0000";
    S5_in <= "0000";
    S6_in <= "0000";
    S7_in <= "0000";
    wait for 10 ns;

    -- Put test bench stimulus code here

    wait;
  end process;


end;
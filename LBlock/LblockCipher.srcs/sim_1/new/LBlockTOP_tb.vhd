library IEEE;
use IEEE.Std_logic_1164.all;

entity LBlockTOP_tb is
end;

architecture bench of LBlockTOP_tb is

  component LBlockTOP
  Port ( 
      data_in: in std_logic_vector(63 downto 0);
      key_in: in std_logic_vector(79 downto 0);
      clk: in std_logic;
      reset: in std_logic;
      data_out: out std_logic_vector(63 downto 0);
      busy : out STD_LOGIC;
      dataReady : out STD_LOGIC
      );
  end component;

  signal data_in: std_logic_vector(63 downto 0) := (others => '0');
  signal key_in: std_logic_vector(79 downto 0) := (others => '0');
  signal clk: std_logic := '0';
  signal reset: std_logic := '0';
  signal data_out: std_logic_vector(63 downto 0);
  signal busy: STD_LOGIC;
  signal dataReady: STD_LOGIC;

  constant clk_period: time := 2 ns;

begin

  uut: LBlockTOP port map ( data_in     => data_in,
                         key_in      => key_in,
                         clk         => clk,
                         reset       => reset,
                         data_out    => data_out,
                         busy        => busy,
                         dataReady   => dataReady );

clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;

  stimulus: process
  begin
  
    -- Put initialisation code here
    --wait for clk_period*7;
    
    
    --data_in <= "0000000000000000000000000000000000000000000000000000000000000000";
    --key_in <= "00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    
   --reset <= '0';
   --wait for clk_period*7;
    
    --wait for clk_period*20;
    --reset <= '1';
    
    --wait for clk_period*7;
    
    data_in <="0000000100100011010001010110011110001001101010111100110111101111";
    key_in <= "00000001001000110100010101100111100010011010101111001101111011111111111011011100";
    
    --reset <= '0';
    --wait for clk_period*7;

    -- Put test bench stimulus code here

    wait;
  end process;


end;
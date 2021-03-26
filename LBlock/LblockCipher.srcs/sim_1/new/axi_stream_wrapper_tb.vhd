LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE std.textio.ALL;
USE ieee.std_logic_textio.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;

ENTITY axis_stream_wrapper_tb IS
END axis_stream_wrapper_tb;

ARCHITECTURE behavior OF axis_stream_wrapper_tb IS

    -- Component Declaration for the Unit Under Test (UUT)

    COMPONENT axi_stream_wrapper
    PORT(
         ACLK : IN std_logic;
         ARESET : IN std_logic;
         S_AXIS_READY : OUT std_logic;
         S_AXIS_DATA : IN std_logic_vector(31 downto 0);
         S_AXIS_LAST : IN std_logic;
         S_AXIS_VALID : IN std_logic;
         M_AXIS_VALID : OUT std_logic;
         M_AXIS_DATA : OUT std_logic_vector(31 downto 0);
         M_AXIS_LAST : OUT std_logic;
         M_AXIS_READY : IN std_logic
        );
    END COMPONENT;


   --Inputs
   signal ACLK : std_logic := '0';
   signal ARESET : std_logic := '0';
   signal S_AXIS_DATA : std_logic_vector(31 downto 0) := (others => '0');
   signal S_AXIS_LAST : std_logic := '0';
   signal S_AXIS_VALID : std_logic := '0';
   signal M_AXIS_READY : std_logic := '0';

 	--Outputs
   signal S_AXIS_READY : std_logic;
   signal M_AXIS_VALID : std_logic;
   signal M_AXIS_DATA : std_logic_vector(31 downto 0);
   signal M_AXIS_LAST : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ps;
   
   -- Other signals
   signal ciphertext : std_logic_vector(63 downto 0);

BEGIN

	-- Instantiate the Unit Under Test (UUT)
   uut: axi_stream_wrapper PORT MAP (
          ACLK => ACLK,
          ARESET => ARESET,
          S_AXIS_READY => S_AXIS_READY,
          S_AXIS_DATA => S_AXIS_DATA,
          S_AXIS_LAST => S_AXIS_LAST,
          S_AXIS_VALID => S_AXIS_VALID,
          M_AXIS_VALID => M_AXIS_VALID,
          M_AXIS_DATA => M_AXIS_DATA,
          M_AXIS_LAST => M_AXIS_LAST,
          M_AXIS_READY => M_AXIS_READY
        );

   -- Clock process definitions
   clk_process: process
   begin
		ACLK <= '0';
		wait for clk_period/2;
		ACLK <= '1';
		wait for clk_period/2;
   end process;


   -- Stimulus process
   stim_proc: process
      variable ct: line;
   begin
      -- hold reset state for 100 ns.
      wait for 50 ns;

 -- write plaintext
      ARESET <= '1';
      S_AXIS_VALID <= '1';
      S_AXIS_DATA <= (others => '0');
      
      wait for clk_period*2;
      -- write key
      S_AXIS_DATA <= (others => '0');
      wait for clk_period*3;
      
      wait for clk_period;
      S_AXIS_DATA <= (others => '0');
      S_AXIS_VALID <= '0';
      wait for clk_period;
      
      -- wait for processing
      wait for clk_period*34;
      
      -- read ciphertext
      M_AXIS_READY <= '1';
      wait for clk_period;
      ciphertext(63 downto 32) <= M_AXIS_DATA;
      wait for clk_period;
      ciphertext(31 downto 0) <= M_AXIS_DATA;
      wait for clk_period;
       M_AXIS_READY <= '0';
      
      
      -- print ciphertext
      hwrite(ct, ciphertext);
      report "Ciphertext is " & ct.all & " (expected value: C218185308E75BCD)";
      deallocate(ct);
      
      
      -- write plaintext
      ARESET <= '1';
      S_AXIS_VALID <= '1';
      --S_AXIS_DATA <= (others => '0');
      wait for clk_period;
      S_AXIS_DATA <= "00000001001000110100010101100111";
      wait for clk_period;
      S_AXIS_DATA <= "10001001101010111100110111101111";
      assert (S_AXIS_READY = '1') report "ERROR: axi slave is not ready!" severity error;
      wait for clk_period;
      
      -- write key
      S_AXIS_DATA <= "00000001001000110100010101100111";
      wait for clk_period;
      S_AXIS_DATA <= "10001001101010111100110111101111";
      wait for clk_period;
      S_AXIS_DATA <= "11111110110111000000000000000000";
      wait for clk_period;
      assert (S_AXIS_READY = '0') report "ERROR: axi slave is still ready after reading data!" severity error;
      
      wait for clk_period;
      S_AXIS_DATA <= (others => '0');
      S_AXIS_VALID <= '0';
      wait for clk_period;
      
      -- wait for processing
      wait for clk_period*33;
      
      -- read ciphertext
      M_AXIS_READY <= '1';
      wait for clk_period;
      ciphertext(63 downto 32) <= M_AXIS_DATA;
      wait for clk_period;
      ciphertext(31 downto 0) <= M_AXIS_DATA;
      wait for clk_period;
       M_AXIS_READY <= '0';
      
      
      -- print ciphertext
      hwrite(ct, ciphertext);
      report "Ciphertext is " & ct.all & " (expected value: C218185308E75BCD)";
      deallocate(ct);
      

      wait;
   end process;

END;
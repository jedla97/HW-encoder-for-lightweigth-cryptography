--LBlock_design
----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Jedlička Jakub
-- 
-- Create Date: 10.11.2020 15:18:34
-- Design Name: 
-- Module Name: LBlockTOP - Behavioral
-- Project Name: 
-- Target Devices: Zybo Z7
-- Tool Versions: 
-- Description: control function for each round where input is key and 64 bit 
--              block of data
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity LBlockTOP is
Port ( 
    data_in: in std_logic_vector(63 downto 0);
    key_in: in std_logic_vector(79 downto 0);
    clk: in std_logic;
    reset: in std_logic;
    data_out: out std_logic_vector(63 downto 0)
    );
end LBlockTOP;

architecture Behavioral of LBlockTOP is

component LBlockLoop is
    port( 
        xLdata_in: in std_logic_vector(31 downto 0); 
        xRdata_in: in std_logic_vector(31 downto 0);
        full_key_in: in std_logic_vector(79 downto 0);
        xLdata_out: out std_logic_vector(31 downto 0);
        xRdata_out: out std_logic_vector(31 downto 0)
        
    );
end component;

component KeySchedule is
    port(
    key_in: in std_logic_vector(79 downto 0);
    round_value: in std_logic_vector(5 downto 0);
    key_out: out std_logic_vector(79 downto 0)
    );
end component;
-- type for each state in "cicle" 
-- WAITDATA - waiting for data input
-- ROUND - for every round except last
-- DATAREADY - after last roud encrypted text is ready a ouputed 
type state_type is (WAITDATA, ROUND, DATAREADY);
signal state : state_type;
-- counter of rounds
signal round_counter : STD_LOGIC_VECTOR(5 downto 0);
-- input of left side of fiestel network
signal xLdata_in_intern: std_logic_vector(31 downto 0);
-- input of right side of fiestel network
signal xRdata_in_intern: std_logic_vector(31 downto 0);
-- output of left side of fiestel network
signal xLdata_out_intern: std_logic_vector(31 downto 0);
-- output of right side of fiestel network
signal xRdata_out_intern: std_logic_vector(31 downto 0);
-- key used for actual round
signal round_full_key: std_logic_vector(79 downto 0);
-- generated key for next round
signal round_key_help: std_logic_vector(79 downto 0);
-- bit shifting operation
--signal shifted: std_logic_vector(31 downto 0);

begin
    
    LBL : LBlockLoop port map(
        xLdata_in => xLdata_in_intern,
        xRdata_in => xRdata_in_intern,
        full_key_in => round_full_key,
        xLdata_out =>  xLdata_out_intern,
        xRdata_out =>  xRdata_out_intern
    );

    KS : KeySchedule port map (
        key_in => round_full_key,
        round_value => round_counter,
        key_out => round_key_help
    );

    process(clk, reset)
    begin
        if reset = '1' then
                state <= WAITDATA;
                round_counter <= "000000";
                                
        elsif CLK'EVENT and clk = '1' then
            case state is
                when WAITDATA =>
                    
                    round_full_key <= key_in;

                    xLdata_in_intern <= data_in(63 downto 32);
                    xRdata_in_intern <= data_in(31 downto 0);

                    state <= ROUND;
                    round_counter <= "000001";
                    
                when ROUND =>
                    xLdata_in_intern <= xLdata_out_intern;
                    xRdata_in_intern <= xRdata_out_intern;
                    
                    round_counter <= round_counter + '1';
                    
                   if round_counter = "100000" then
                        data_out <= xRdata_out_intern & xLdata_out_intern;
                        state <= DATAREADY;
                    else
                        state <= ROUND;
                        round_full_key <= round_key_help;
                    end if;
                        
                when DATAREADY =>
                    state <= WAITDATA;
            end case;

        end if;

    end process;

end Behavioral;

--test results
--data_in <= "0000000000000000000000000000000000000000000000000000000000000000";
--key_in <= "00000000000000000000000000000000000000000000000000000000000000000000000000000000";
-- c2 18 18 53 08 e7 5b cd -original
-- c2 18 18 53 08 e7 5b cd -vivado

--data_in <="0000000100100011010001010110011110001001101010111100110111101111";
--key_in <= "00000001001000110100010101100111100010011010101111001101111011111111111011011100";
-- 4b 71 79 d8 eb ee 0c 26 -original
-- 4b 71 79 d8 eb ee 0c 26 -vivado
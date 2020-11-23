----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.11.2020 15:18:34
-- Design Name: 
-- Module Name: Sbox1 - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: conecting all Sboxes
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------
---- switch vectors to variables := https://stackoverflow.com/questions/11927144/what-s-the-difference-between-and-in-vhdl

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

entity LBlock is
Port ( 
    data_in: in std_logic_vector(63 downto 0);
    key_in: in std_logic_vector(79 downto 0);
    clk: in std_logic;
    reset: in std_logic;
    data_out: out std_logic_vector(63 downto 0);
    busy : out STD_LOGIC;
    dataReady : out STD_LOGIC;
    keyTest_out: out std_logic_vector(79 downto 0);
    keyTest_out2: out std_logic_vector(79 downto 0)

    );
end LBlock;

architecture Behavioral of LBlock is

component LBlockLoop is
    port( 
        xLdata_in: in std_logic_vector(31 downto 0); 
        xRdata_in: in std_logic_vector(31 downto 0);
        fullKey_in: in std_logic_vector(79 downto 0);
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

type state is (WAITDATA, ROUND, FINAL);
signal nxState : state;

signal roundCounter : STD_LOGIC_VECTOR(5 downto 0);

signal xLdata_in_intern: std_logic_vector(31 downto 0);
signal xRdata_in_intern: std_logic_vector(31 downto 0);
signal xLdata_out_intern: std_logic_vector(31 downto 0);
signal xRdata_out_intern: std_logic_vector(31 downto 0);
signal roundFullKey: std_logic_vector(79 downto 0);
signal roundKeyHelp: std_logic_vector(79 downto 0);
signal shifted: std_logic_vector(31 downto 0);

begin
    
    LBL : LBlockLoop port map(
        xLdata_in => xLdata_in_intern,
        xRdata_in => xRdata_in_intern,
        fullKey_in => roundFullKey,
        xLdata_out =>  xLdata_out_intern,
        xRdata_out =>  xRdata_out_intern
    );

    KS : KeySchedule port map (
        key_in => RoundFullKey,
        round_value => roundCounter,
        key_out => roundKeyHelp
    );

    process(clk, reset)
    begin
        if reset = '1' then
                nxState <= WAITDATA;
                roundCounter <= "000000";

                busy <= '0';
                dataReady <= '0';
                
        elsif CLK'EVENT and clk = '1' then
            case nxState is
                when WAITDATA =>
                    
                    RoundFullKey <= Key_in;

                    xLdata_in_intern <= data_in(63 downto 32);
                    xRdata_in_intern <= data_in(31 downto 0);

                    busy <= '1';
                    nxState <= ROUND;
                    roundCounter <= "000001";
                    
                when ROUND =>
                    xLdata_in_intern <= xLdata_out_intern;
                    xRdata_in_intern <= xRdata_out_intern;
                    
                    roundCounter <= roundCounter + '1';
                    
                   if roundCounter = "100000" then
                        data_out <= xRdata_out_intern & xLdata_out_intern;
                        keyTest_out <= roundFullKey;
                        keyTest_out2 <= roundKeyHelp;
                        nxState <= FINAL;
                    else
                        nxState <= ROUND;
                        roundFullKey <= roundKeyHelp;
                    end if;
                        
                when FINAL =>
                    busy <= '0';
                    dataReady <= '1';
                    nxState <= WAITDATA;
            end case;

        end if;

    end process;

end Behavioral;
--data_in <= "0000000000000000000000000000000000000000000000000000000000000000";
--key_in <= "00000000000000000000000000000000000000000000000000000000000000000000000000000000";
-- c0 fb 26 f3 93 7c 06 b0
--92e2fdf4208d377f296a
--4f11a6efe52d525c5fbe
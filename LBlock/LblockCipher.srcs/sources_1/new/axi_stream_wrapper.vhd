----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.03.2021 14:54:25
-- Design Name: 
-- Module Name: axi_stream_wrapper - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity axi_stream_wrapper is
    port(ACLK: in std_logic; -- positive edge clock
         ARESETN: in std_logic; -- active-low synchronous reset
         S_AXIS_READY: out std_logic;
         S_AXIS_DATA: in std_logic_vector(31 downto 0);
         S_AXIS_LAST: in std_logic;
         S_AXIS_VALID: in std_logic;
         M_AXIS_VALID: out std_logic;
         M_AXIS_DATA: out std_logic_vector(31 downto 0);
         M_AXIS_LAST: out std_logic;
         M_AXIS_READY: in std_logic
    );
end axi_stream_wrapper;

architecture Behavioral of axi_stream_wrapper is

type state_type is (idle, read_data_in, read_key, stabilize, active, write_data_out);
    type axis_buffer is array(integer range <>) of std_logic_vector(31 downto 0);

    constant data_in_read: natural := 2;
    constant key_read: natural := 3;
    constant active_cycles: natural := 34;
    constant data_out_write: natural := 2;

    signal state: state_type;
    signal counter: natural range 32 downto 0;
    
    signal ip_data_in: std_logic_vector(63 downto 0);
    signal ip_key: std_logic_vector(79 downto 0);
    signal ip_reset: std_logic;
    signal ip_data_out: std_logic_vector(63 downto 0);

    signal ip_data_in_buf: axis_buffer(1 downto 0);
    signal ip_key_buf: axis_buffer(2 downto 0);
    signal ip_data_out_buf: axis_buffer(1 downto 0);

    component LBlockTOP
        port(data_in:    in std_logic_vector(63 downto 0);
             key_in:     in std_logic_vector(79 downto 0);
             clk:        in std_logic;
             reset:      in std_logic;
             data_out: out std_logic_vector(63 downto 0)
        );
    end component;
begin
    IP: LBlockTOP port map(
        data_in => ip_data_in,
        key_in => ip_key,
        clk => ACLK,
        reset => ip_reset,
        data_out => ip_data_out
    );
    
    ip_data_in <= ip_data_in_buf(0) & ip_data_in_buf(1);
    
    ip_key <= ip_key_buf(0) & ip_key_buf(1) & ip_key_buf(2)(31 downto 16);
    
        
    ip_reset <= '0' when state = active else '1';
    
    S_AXIS_READY <= '1' when (state = read_data_in or state = read_key) else '0';
    M_AXIS_VALID <= '1' when state = write_data_out else '0';
    M_AXIS_LAST  <= '1' when (state = write_data_out and counter = data_out_write-1) else '0';

    state_machine: process(ACLK)
    begin
        if rising_edge(ACLK) then
            if ARESETN = '0' then
                state <= idle;
                counter <= 0;
            else
                case state is
                when idle =>
                    ip_data_out_buf(0) <= (others => '0');
                    ip_data_out_buf(1) <= (others => '0');
                    M_AXIS_DATA <= (others => '0');
                    
                    if S_AXIS_VALID = '1' then
                        state <= read_data_in;
                        counter <= 0;
                    end if;

                when read_data_in =>
                    if S_AXIS_VALID = '1' then
                        ip_data_in_buf(counter) <= S_AXIS_DATA;
                        
                        if counter = data_in_read-1 then
                            state <= read_key;
                            counter <= 0;
                        else
                            counter <= counter+1;
                        end if;
                    end if;

                when read_key =>
                    if S_AXIS_VALID = '1' then
                        ip_key_buf(counter) <= S_AXIS_DATA;
                        
                        if counter = key_read-1 then
                            state <= stabilize;
                            counter <= 0;
                        else
                            counter <= counter+1;
                        end if;
                    end if;

                when stabilize =>
                    state <= active;

                when active =>
                    if counter = active_cycles-1 then
                        ip_data_out_buf(0) <= ip_data_out(63 downto 32);
                        ip_data_out_buf(1) <= ip_data_out(31 downto 0);
                        
                        state <= write_data_out;
                        counter <= 0;
                    else
                        counter <= counter+1;
                    end if;

                when write_data_out =>
                    M_AXIS_DATA <= ip_data_out_buf(counter);
                    
                    if M_AXIS_READY = '1' then
                        if counter = data_out_write-1 then
                            state <= idle;
                            counter <= 0;
                        else
                            counter <= counter+1;
                        end if;
                    end if;
                end case;
            end if;
        end if;
    end process;


end Behavioral;

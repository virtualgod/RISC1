library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Testbench_full is
end entity;

architecture Behave of Testbench_full is
	component RISC1 is
        port(clk,rst: in std_logic);
    end component;
    
	signal clk : std_logic := '0';
	signal reset : std_logic := '0';
    signal finished : std_logic := '0';
begin
    dut: RISC1 port map(clk=>clk, rst=>reset);
    clk <= not clk after 10 ns when (finished='0') else '0'; -- assume 20ns clock.

    -- reset process
    process
    begin
        wait until clk = '1';
        reset <= '1';
        wait;
    end process;
    
	process
	begin
	    for i in 1 to 100 loop
	        wait until clk='1';
	    end loop;
	    
	    finished <= '1';
	    wait;
	end process;
	
end Behave;

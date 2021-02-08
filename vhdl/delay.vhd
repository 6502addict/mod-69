library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity delay is
	GENERIC (delay : integer := 16);
	PORT (
		clock				 : in    std_logic;
		signal_in       : in    std_logic;
		signal_out      : out   std_logic
	);
end;

architecture behavioral of delay is
	signal cnt : integer range 0 to delay - 1;
begin
   process (clock, cnt, signal_in)
	begin	
		if signal_in = '0' then
			signal_out <= '0';
			cnt <= delay - 1;
		elsif falling_edge(clock) then
			if cnt /= 0 then
				cnt <= cnt - 1;
			else
				signal_out <= '1';
			end if;			
		end if;	
	end process;
end behavioral;
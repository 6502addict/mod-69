LIBRARY ieee;
	USE ieee.std_logic_1164.all;
	USE ieee.numeric_std.all;

ENTITY clock_divider IS
	GENERIC (divider : integer := 4);
	PORT	(
		clk_in   : in  std_logic;
		clk_out  : out std_logic
	);
END ENTITY;

ARCHITECTURE rtl OF clock_divider IS

SIGNAL cnt : integer RANGE 0 TO divider - 1;
BEGIN
	PROCESS (clk_in)
	BEGIN
		IF (rising_edge(clk_in)) THEN
			IF cnt < (divider / 2) THEN
				clk_out <= '0';
			ELSE	
				clk_out <= '1';
			END IF;
			IF cnt = divider -1 THEN
				cnt <= 0;
			ELSE	
				cnt <= cnt + 1;
			END IF;
		END IF;
	END PROCESS;
END rtl;


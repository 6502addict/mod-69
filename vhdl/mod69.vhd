library ieee;
 use ieee.std_logic_1164.all;
 use ieee.std_logic_arith.all;
 use ieee.std_logic_unsigned.all;

entity mod69 is
	PORT (
		-- main clock
		clock				 : in    std_logic;							  -- pin  43	

		-- config
		opt6809e        : in    std_logic;                      -- pin  8
	   opt6502c        : in    std_logic;                      -- pin  6
      optspare0       : in    std_logic;                      -- pin  5 
      optspare1       : in    std_logic;                 	  -- pin  4	 

		-- sally specific
		sally6502_halt  : in    std_logic;                      -- pin  12
		sally6502_rw    : out   std_logic;                      -- pin  11 

		-- 6502
		mos6502_sync    : out   std_logic;							  -- pin   9
		mos6502_rdy     : in    std_logic;                      -- pin   21 
		mos6502_so      : in    std_logic;                      -- pin   20 
		mos6502_phi2    : out   std_logic;                      -- pin   19 
		mos6502_phi1    : out   std_logic;                      -- pin   18
		mos6502_reset   : in    std_logic;                      -- pin   16 
		mos6502_rw      : out   std_logic;                      -- pin   14 

		-- 6809
		mc6809_pin38    : inout std_logic;                      -- pin   25   
		mc6809_pin33    : inout std_logic;                      -- pin   26   
		mc6809_halt     : out   std_logic;                      -- pin   29
		mc6809_pin39    : out   std_logic;                      -- pin   31   
		mc6809_reset    : out   std_logic;                      -- pin   34  
		mc6809_pin36    : out   std_logic;                      -- pin   36  
		mc6809_q        : inout std_logic;                      -- pin   37   
		mc6809_e        : inout std_logic;                      -- pin   39
		mc6809_rw       : in    std_logic;                      -- pin   40

		-- small delay
		dly0in			 : in    std_logic; 						     -- pin   17
		dly0out			 : out   std_logic;                      -- pin   24
		dly1in          : in    std_logic;                      -- pin   27
		dly1out         : out   std_logic;                      -- pin   28 
		
		-- spare
		spare0			 : in    std_logic; 							  -- pin  33	 wrongly connected to mc6809_lic
		spare1			 : in    std_logic  							  -- pin  41	 wrongly connected to mc6809_busy
		
	);
end;

architecture behavioral of mod69 is
	signal e			     : std_logic;
	signal q			     : std_logic;

	component clock6809e is
	port 	(clock    : in  std_logic;
		    mrdy	    : in  std_logic;
		    e		    : out std_logic;
		    q        : out std_logic);
	end component;
	
	component delay is
	generic (delay : integer := 16);
	port 	(clock      : in  std_logic;
		    signal_in  : in  std_logic;
		    signal_out : out std_logic);
	end component;
	
begin  
   u1 : delay   		PORT MAP (clock => clock, signal_in => mos6502_reset, signal_out => mc6809_reset);
   u2 : clock6809e   PORT MAP (clock => clock, mrdy => mos6502_rdy, e => e, q => q);
	
mc6809_halt  <= '1'          when opt6809e = '0' else '1';           -- HALT not yet supported
mc6809_pin39 <= '0'          when opt6809e = '0' else '0';           -- TSC/XTAL
mc6809_pin38 <= 'Z'          when opt6809e = '0' else clock;         -- LIC/EXTAL
mos6502_sync <= mc6809_pin38 when opt6809e = '0' else '1';           -- SYNC/LIC
mc6809_e     <= e            when opt6809e = '0' else 'Z';           -- E
mc6809_q     <= q            when opt6809e = '0' else 'Z';           -- Q 
mc6809_pin33 <= 'H'          when opt6809e = '0' else '1';           -- AVMA/DMA 
mc6809_pin36 <= 'H'          when opt6809e = '0' else mos6502_rdy;   -- BUSY/MRDY
mos6502_rw   <= mc6809_rw    when opt6809e = '0' else mc6809_rw;     -- RW
mos6502_phi2 <= e            when opt6809e = '0' else mc6809_e;      -- PHI2
mos6502_phi1 <= not e        when opt6809e = '0' else not mc6809_e;  -- PHI1
	
end behavioral;

       


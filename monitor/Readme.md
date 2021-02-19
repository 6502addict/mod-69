# 6809 Monitor for Vince Briel Replica 1 equipped with MOD-69

Eprom Build:

use for example an AT28C256 from Atmel
take an eprom prorammer and but mon6809.hex

after a reset the monitor display:


Commands:
M ADDR1 ADDR2                   display the memory from ADDR1 to ADDR2
F ADDR1 ADDR2 01 02...          fill the memory from ADDR1 to ADDR2 with the pattern 01 02 ... (the pattern is repeated until the area is filled)
C ADDR1 ADDR2 ADDR3             compare the memory block starting at ADDR1 and ending at ADDR2 to the target ADDR3
T ADDR1 ADDR2 ADDE3             move the memory block starting at ADDR1 and ending at ADDR2 to the target ADDR3
H ADDR1 ADDR2 01 02...          hunt the memory from ADDR1 to ADDR2 and list the occurences of the pattern 01 02 ...
: ADDR1 01 02 03...             edit the memory and insert the pattern 01 02 03 ...
X                               leave the monitor if called from another application

Note: for the commands C , H and :the pattern can include strings  example:   01 02 "Hello" 03 04



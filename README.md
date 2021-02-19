# MOD-69
![al-tag](http://netfilters.eu/github/MOD-69.PNG)
<br>

## Description
This module permit to connect a 6809 or a 6809E processor
into a 6502 socket.
<br>
This type of product existed ont the Synertek SYM-1

## Note:
this development is just for fun there is no warranty of any kind
that this mod-69 will work on your machine...
please report the success / failure...
I'll try to improved the mod-69 and support new machines
as well as the 6809 monitor code

## ChangeLog:

1.2  Rework of the silk mask
     2 10k pull up added on IRQ and FIRQ lines

1.1  oscillator replace by a frequency multiplier
     connected to phi0
     dip switch replaced by jumpers
     
1.0  initial version using a 50Mhz oscillator


## JUMPERS
```
OP1     reserved for futur function
OP0     reserved for futur function
SAL     select 65XX socket type
           jumper removed: standard 6502
           jumper set:     6502C (SALLY)
69E     select 6809/6809E processor type
           jumper removed: 6809  (no support for sync) 
           jumper set:     6809E (support for sync)
IRQ     place a jumper on IRQ to map 6502 IRQ to 6809 IRQ       
FIRQ    place a jumper on FIRQ to map 6502 IRQ to 6809 FIRQ
U1      DO NOT USE... (for debug)
U0      DO NOT USE... (for debug)
```

## Note
* Even if SALLY it was planned, it is not yet supported

## PCB
the pcb can be ordered from oshpark<br>
https://oshpark.com/shared_projects/tMBBF8oK

## Bill of Materials
* 1 PLCC 44 socket
* 1 DIP 40 socket 600mil
* 1 Pin Header Strip 1 Row Machined 40Pin Male Round
    break the strip in 2 x 20 pin 
* 1 EPM7064S
* 1 NB3N502DG
* 4 resistors  3.3k  1206
* 2 resistors   10k  1206
* 6 capacitors 100nf 1206
* 1 2.54mm 2x5 male pin header
* 1 2.54mm 2x8 male pin header
* 2 jumpers

## Build of the board
the easiest is to solder the component in the following order<br>
1. NB3N502DG<br>
2. 6 x 100nf capacitors<br>
3. 2 x 10k resistors<br>
4. 4 x 3.3k resistors<br>
5. 2 x 20 pin strips<br>
   install the strips before the 40 pin DIP socket !!!<br>
   use a breadboard or another socket to align correctly the pins<br>
6. PLCC4 sockets<br
7. DIP 40 socket<br>
8. 2.54mm 2x5 male pin header (jtag)
9. 2.54mm 2x8 male pin header (options)
10. insert a jumper on IRQ or FIRQ
11. insert a jumper on 69E if you want to use a 6809E

## CPLD Progamming
The programming files are in vhdl directory<br>
you need Quartus II 13.0sp1 to modify this project<br>
the CPLD type is an EPM7064S PLCC 44<br>
<br>
To import this project in Quartus<br>
create a new project name "mod-69"<br>
and insert the files from github<br>
the top level is "mod69.vhd"<br>
<br>
if you only want to program the CPLD<br>
connect the adapter to a USB Blaster with a flat
cable then use the mod69.pof.<br>

# Futur Enhancement...
Only a half of cpld capacity is used so there is
enough room to support sally or solve conflit 
on some specific machines...

the jumper OP1 et OP2 are there to solve 
specific cases



# Machines tested

## SYNERTEK SYM-1
the SYM-1 worked fine with my first version of MOD-69
but the way the clock is generated on the SYM-1 makes it incompatible with my second MOD-69
I'm preparing a third version to fix the probleme

## REPLICA 1
Works fine with my second version of MOD-69 either with a 6809 or a 6809E as well as with 6309/6309E
![al-tag](https://github.com/6502addict/mod-69/blob/main/Photo/replica1-mod69.PNG)
<br>
REPLICA 1 with MOD-69 plugged in place of the 6502
<br>
<br>
![al-tag](https://github.com/6502addict/mod-69/Photo/replica1-6809.PNG)
<br>
REPLICA 1 Running the 6809 monitor
<br>



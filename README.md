# MOD-69
![al-tag](http://netfilters.eu/github/MOD-69.PNG)
<br>
# Adapter to plug a 6809 or 6809E on a 6502 socket
<br>
## Description
This module permit to connect a 6809 or a 6809E processor
into a 6502 socket.
<br>
This type of product existed ont the Synertek SYM-1

## Note:



## JUMPERS
```
OP1     option for futur expantion
OP0     option for futur expantion
SAL     select 65XX socket type
           jumper removed: SALLY
           jumper set:     standard 6502
69E     select 6809/6809E processor type
           jumper removed: 6809  (no support for sync) 
           jumper set:     6809E (support for sync)
IRQ     place a jumper on IRQ to map 6502 IRQ to 6809 IRQ       
FIRQ    place a jumper on FIRQ to map 6502 IRQ to 6809 FIRQ
U1      DO NOT USE... (for debug)
U0      DO NOT USE... (for debug)
```


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
5. PLCC4 sockets<br
6. DIP 40 socket<br>
7. 2.54mm 2x5 male pin header (jtag)
8. 2.54mm 2x8 male pin header (options)
9. insert a jumper on IRQ or FIRQ
10. insert a jumper on 69E if you want to use a 6809E

# Machines tested

## SYNERTEK SYM-1

## REPLICA 1


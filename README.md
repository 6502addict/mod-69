# mod-69
Adapter to plug a 6809 or 6809E on a 6502 socket
<br>
![al-tag](http://netfilters.eu/github/MOD-69.PNG)
<br>
## Description
this cartridge is compatible with thomson MO5 64k cartridge
it's not a exact copy of the original cartridge<br>
but rather a rebuild from the manual
<br>
the $A7CB register controlling a MO5 64 cartrige is extended
to permit the access to 512k of memory
<br>
without the 3 jumpers the cartridge is behaving as the 
original thomson MEMO5 cartridge
<br>
with the jumpers set the cartridge can address 512k or memory
<br>

## Note:
The first goal of this board was to replace the original thomson board of 64K
<br>
with the use of modern chips it is easier to find a 128k or 512k chip than 64k
<br>
so I designed the 64k compatibility as the main feature and the extension
<br>
to 128k or 512k (dépending on the ram chip used AS6C1008 or AS6C4008) as goody.
<br>
Due to negative comment on forums saying that this extra memory is useless
<br>
I've listened this comments and removed the jumpers permitting to exploit
<br>
the extra memory.
<br>
As a few 512k board exist I let 512k test procedure and manual
but eagle files are now for 64k boards



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
* 1 x socket  dip 32  600mil
* 3 x sockets dip 20  300mil
* 1 74LS273
* 1 RAM Alliance AS6C4008
* 2 GAL Lattice 16v8D
* 1 diode 1N4148
* 5 resistor 10k    1206
* 5 capacitor 100nf 1206
* 1 block of 3 jumpers



## Build of the board
the easiest is to solder the component in the following order<br>
1. 5 100nf capacitor (back of the board)<br>
2. 5 10k resistor (back of the board)<br>
3. 4 sockets<br
4. BC547B<br>
5. 1N4148<br>
6. jumpers<br>

# Machines tested

## SYNERTEK SYM-1

## REPLICA 1


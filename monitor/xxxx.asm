;========================================================================
;- cmdmmov
;========================================================================
; move a block of memory from ADDR1 to ADDR2
;
; syntax:  T SADDR SADDR DADDR
; 
;- entry:
;- X = current input buffer position
;
;- exit:
;- A = trashed
;- X = trashed
;- Y = trashed
;
;- 1st case blocks does not overlap
;-  SSSSSS     DDDDDD 
;- or
;-      DDDDDD    SSSSSS
;- move from begining forward incrementing
;-
;- 2nd case blocks overlap, source starts before the destination
;-     SSSSSS
;-        DDDDDD
;- move from the end backward decrementing
;-
;- 3rd case blocks overlaps source start after the destination
;-        SSSSSS	  			
;-     DDDDDD
;- move from the begining forward incrementing

	.SECTION	HELP
HELPMMOV	#DEFHLP	MMOV,"T SADDR EADDR DADDR", "MOVE MEMORY"
	.SEND	HELP

	#DEFCMD	MMOV, "T"

	.SECTION	VARS
MMOVDIR	.BYTE	?	; 1 byte 0 = upward, $80 = downward
EADDR	.WORD	?	; 2 byte end of block address
	.SEND	JS


	.SECTION	CODE
CMDMMOV:	.PROC
	LDA	#$00	;- set mmovdir to defaut direction
	STA	MMOVDIR
	JSR	GETSRCDST	;- get SRC and DST address
	BCS	_ERR	;- on error exit with carry set
	LDA	DST	;- save DST to EADDR
	STA	EADDR
	LDA	DST+1
	STA	EADDR+1
	JSR	SRCLEN2	;- compute LEN from SRC/DST
	INX		;- increment parser position
	JSR	GETDST	;- get DST addres 3rd argument
	BCS	_ERR	;- on error exit with carry set
	JSR	ISSRCBEFOREDST	;- check if SRC is before DST
	BEQ	_END	;- DST = SRC no need to move
	LDA	DST+1	;- check if msb DST is above msb EADDR
	CMP	EADDR+1
	BNE	_SKIPLSB	;- skip lsb if msb EADDR # msb DST
	LDA	DST	;- check if lsb DST is above lsb EADDR
	CMP	EADDR	
_SKIPLSB	BCS	_MMOVXFER	;- if carry set start the transfer
	JSR	ISSRCBEFOREDST	;- check if src is before dst
	BMI	_MMOVXFER	;- SRC > DST same as not overlapped 	
	LDA	#$80	;- SRC < DST we start from end
	STA	MMOVDIR	;- and decrement
	LDA	EADDR	;- move eaddr to SRC
	STA	SRC
	LDA	EADDR+1
	STA	SRC+1
	JSR	LENDEC	;- fix length
	CLC		;- address of end of DST into DST
	LDA	DST
	ADC	LEN
	STA 	DST
	LDA	DST+1
	ADC	LEN+1
	STA	DST+1
	JSR	LENINC	;- fix length
_MMOVXFER	LDY	#$00	;- perform the real transfer
	LDA	(SRC),Y	;- get the byte from source address
	STA	(DST),Y	;- store the byte into destination address
	JSR	LENDEC	;- decrement length
	JSR	LENISZERO	;- check if length is zero
	BEQ	_END	;- if yes ends the transfer
	BIT	MMOVDIR	;- check transfer direction
	BMI	_DOWN	;- if $80 move down
	JSR	SRCINC	;- increment SRC
	JSR	DSTINC	;- increment DST
	JMP	_MMOVXFER	;- continue the transfer
_DOWN	JSR	SRCDEC	;- decrement SRC
	JSR	DSTDEC	;- decrement DST
	JMP	_MMOVXFER	;- continue the transfer
_END	CLC		;- clear carry to notify no error
_ERR	RTS		;- return
	.PEND
	.SEND	CODE


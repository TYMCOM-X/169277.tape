File 1)	DSKB:KERMIT.MAC[14,10,KERMIT,TOPS10]    	created: 2208 05-Aug-84
File 2)	DSKB:KERMIT.MAC[14,10,KERMIT,TOPS10,CSM]	created: 2309 05-Aug-84

1)1	; Universals
****
2)1		;[CSM] Edits applicable to all TOPS-10 sites
2)	;[CSM] Bug at REDIN0 - GLXLIB aborts on typos if INI:KERMIT but no DSK:KERMIT.INI
2)	;[CSM] Bug at OPNWR0 - FILNAM.000 not created in right SFD.
2)	;[CSM] Bug in XFR%STATUS - SET MESSAGE PACKET output a bunch of zeros.
2)	;[CSM] Clear input buffer of XFR terminal in CONNECT command (bug in SCNSER).
2)	;[CSM] New feature at CN.ESC - Allow ^\^C (accept ^C same as "C").
2)	;[CSM] Make sure XFRTRM+$TTDEV is always consistant.
2)		;[CSM] Minor details
2)	;[CSM] Change .IOPIM!IO.SUP to .IOPIM!IO.LEM since IO.SUP is redundant.
2)	;[CSM]   (if SCNSER is modified, IO.LEM enables XON/XOFF dual processing)
2)	;[xxx] Need to modify BLISS routines to prefix NAK with XON in case
2)	;[xxx]   other KERMIT stop sending because noise on the line looked like
2)	;[xxx]   an XOFF.
2)	  FTCSM==-1 ;[CSM] Modifications specific to the Colorado School of Mines
2)	;[CSM] At FILE%OPEN, make it illegal to create files when not logged in.
2)	;[CSM] Change help FDB to access HLP:KERM10.HLP, KERMIT.HLP is general info.
2)	; Universals
**************
1)1		MITEDT==123			; Edit level
1)		MITWHO==0			; Customer edit
1)		TWOSEG	400K			; Make this a two segment program
****
2)1		MITEDT==126			; Edit level
2)		KEREDT==MITEDT			;[CSM]
2)		MITWHO==2			;[CSM]
2)		TWOSEG	400K			; Make this a two segment program
**************
1)3		Clear the input buffer before we send a message.  This ignores any garbage
1)		which came in on the line since the last message we received.
1)		Modules: KERMIT
1)	113	By: Nick Bush		On: 14-December-1983
1)		Add some more single character commands for use during transfers.
1)		Control-A will type a status line, control-D will toggle debugging, and
1)		carriage return will force a timeout (therefore either a NAK or retransmission).
1)		Modules: KERMIT
****
2)3		Clear the input buffer before we send a message.  This ignores any
2)		garbage which came in on the line since the last message we received.
2)		Modules: KERMIT
2)	113	By: Nick Bush		On: 14-December-1983
2)		Add some more single character commands for use during transfers.
2)		Control-A will type a status line, control-D will toggle debugging, and
2)		carriage return will force a timeout (therefore either a NAK or
2)		retransmission).
2)		Modules: KERMIT
**************
1)3		pointers for the KI10s that use  Kermit.'
1)		Modules: KERMIT
****
2)3		pointers for the KI10s that use Kermit.
2)		Modules: KERMIT
**************
1)3	|
****
File 1)	DSKB:KERMIT.MAC[14,10,KERMIT,TOPS10]    	created: 2208 05-Aug-84
File 2)	DSKB:KERMIT.MAC[14,10,KERMIT,TOPS10,CSM]	created: 2309 05-Aug-84

2)3	124	Released to COLUMBIA and LCG.MARKET
2)	125	Bug fixes from CSM and other places
2)	126	By: Nick Bush		On: 11-July-1984
2)		RECEIVE FOO.BAR would not work correctly.
2)		It thought the extension was wild-carded.
2)	|
**************
1)28	> ; End of TOPS10
****
2)26	; Determine if we are logged in.  (In conditional after START:)
2)		PJOB	S1,			;[125] Get our job number
2)		MOVNS	S1			;[125] Set up for JOBSTS
2)		JOBSTS	S1,			;[125] Get status for us
2)		  MOVX	S1,JB.ULI		;[125]  Old TOPS-10 maybe?
2)		TXNN	S1,JB.ULI		;[125] Logged in?
2)		 SETZ	S1,			;[125] No, remember that
2)		MOVEM	S1,LOGDIN		;[125] Flag file creation time
2)	> ; End of TOPS10
**************
1)29		 $CALL	I%EXIT			; And exit
1)	TOPS10<
****
2)27		 $CALL	C$EXI0			;[125] And exit
2)	TOPS10<
**************
1)33		GETPPN	S1,			; Get our logged in PPN
1)		 JFCL				; Silly return
1)		STORE	S1,INIFD+.FDPPN		; Store for where to find the KERMIT.INI
1)		MOVEI	S1,INIFD		; Get the FD address
1)		SETZ	S2,			; And clear the LOG file FD
1)		$CALL	P$TAKE			; Set it up
1)		$RETIF				; Just punt if none
****
2)31		MOVX	S1,<<SIXBIT |INI|>>	;[125] Try INI:KERMIT.INI first
2)		MOVEM	S1,INIFD+.FDSTR		;[125]  for global defs
2)		MOVEI	S1,INIFD		;[125] Get the FD address
2)		SETZ	S2,			;[125] No log file FD
2)		$CALL	P$TAKE			;[125] Set up the take
2)		JUMPF	REDIN0			;[125] If not there don't worry
2)		MOVEM	S1,INIIFN		;[125] Save the IFN
2)		$CALL	PARL.1			;[125] Parse the file
2)	REDIN0:	MOVSI	S1,'DSK'		;[125] Now we will use
2)		MOVEM	S1,INIFD+.FDSTR		;[125] DSK:KERMIT.INI[,]
2)		GETPPN	S1,			; Get our logged in PPN
2)		 JFCL				; Silly return
2)		STORE	S1,INIFD+.FDPPN		; Store for where to find the KERMIT.INI
2)		MOVEI	S1,INIFD		; Get the FD address
2)		SETZ	S2,			; And clear the LOG file FD
2)	;[CSM] Warning: GLXLIB dies a horrible death when INIIFN is nonzero while
2)	;[CSM] parsing a bad command (such as a typographical error in KERMIT.INI).
2)		$CALL	P$TAKE			; Set it up
2)		SETZM	INIIFN			;[CSM125] Avoid nasty GLXLIB stopcodes
2)		$RETIF				; Just punt if none
**************
1)39		SETZ	S1,			; Break on all characters
****
File 1)	DSKB:KERMIT.MAC[14,10,KERMIT,TOPS10]    	created: 2208 05-Aug-84
File 2)	DSKB:KERMIT.MAC[14,10,KERMIT,TOPS10,CSM]	created: 2309 05-Aug-84

2)37	;[CSM] There is a bug in the TOPS-10 monitor - If a terminal other than
2)	;[CSM] the controlling TTY has characters in its input buffer when it is
2)	;[CSM] INITed in Packed Image Mode, then the count of break characters
2)	;[CSM] wrong.  The Monitor remains N characters behind.  Until SCNSER is
2)	;[CSM] fixed, clear the input buffer when connecting.  At CNCT.0:+4.
2)		MOVX	T1,.TOCIB	;[CSM]	; Clear the input buffer
2)		MOVE	T2,XFRTRM+$TTUDX;[CSM]	; Get the UDX
2)		MOVX	S1,[XWD 2,T1]	;[CSM]	; Point to the argument
2)		TRMOP.	S1,		;[CSM]	; Clear the input buffer
2)		  JFCL			;[CSM]	; Don't care
2)		SETZ	S1,			; Break on all characters
**************
1)39		XMOVEI	S1,MYTERM		; Point to the block
1)		$CALL	T$SBRK			; Set the PIM mode break set
****
2)37		XMOVEI	S2,MYTERM		;[125] Point to the block
2)		$CALL	T$SBRK			; Set the PIM mode break set
**************
1)39		CAIN	P1,"E"			; In escape sequence?
1)		 JRST	CN.ESC			; Yes
1)		CAIN	P1,"C"			; control chr mode?
1)		 JRST	CN.CTL			; yes
1)		CAME	S1,ESCAPE		; Is this escape?
1)		 JRST	CN.SND			; no, just send it
1)		MOVEI	P1,"E"			; Yes, set escape mode
1)		JRST	CN.LP			; and loop
1)	; Previous chr was an escape chr, check for special commands
1)	CN.ESC:	CAIE	S1,"C"			; Is is C
1)		 CAIN	S1,"c"			; or lower case c?
1)		  JRST	CN.END			; Yes done
1)		MOVEI	P1,"S"			; Assume not send control chr
1)		CAMN	S1,ESCAPE		; Another escape?
1)		 JRST	CN.SND			; Yes, send a real one
1)		CAIN	S1,"?"			; want help?
1)		 JRST	CN.HLP			; Yes, do it
1)		CAIE	S1,"S"			; Want status?
1)		 CAIN	S1,"s"			; or lower case "s"
1)		  JRST	CN.STS			; Yes
1)		CAIE	S1,"O"			; Clear buffers?
1)		 CAIN	S1,"o"			;  .  .  .
1)		   JRST	CN.CLR			; Yes, go clear terminal buffers
1)		CAIE	S1,"Q"			; Quit logging?
1)		 CAIN	S1,"q"			;  .  .  .
1)		  JRST	CN.QUT		; Quit logging
1)		CAIE	S1,"R"			; Resume logging
1)		 CAIN	S1,"r"			;  .  .  .
1)		  JRST	CN.RSM			; Yes, do it
1)		CAIE	S1,"^"			; Want control chr?
1)		  JRST	CN.ESE			; No, bad
****
2)37		MOVE	S2,S1			;[125] Copy character
2)		ANDI	S2,177			;[125] Ignore parity bit in the compares
2)		CAIN	P1,"E"			; In escape sequence?
2)		 JRST	CN.ESC			; Yes
2)		CAIN	P1,"C"			; control chr mode?
2)		 JRST	CN.CTL			; yes
File 1)	DSKB:KERMIT.MAC[14,10,KERMIT,TOPS10]    	created: 2208 05-Aug-84
File 2)	DSKB:KERMIT.MAC[14,10,KERMIT,TOPS10,CSM]	created: 2309 05-Aug-84

2)		CAME	S2,ESCAPE		;[125] Is this escape?
2)		 JRST	CN.SND			; no, just send it
2)		MOVEI	P1,"E"			; Yes, set escape mode
2)		JRST	CN.LP			; and loop
2)	; Previous chr was an escape chr, check for special commands
2)	CN.ESC:	CAIN	S2,"C"-100	;[CSM]	; Control-C?
2)		 JRST	CN.END		;[CSM]	; Yes, close connection
2)		CAIE	S2,"C"			; Is is C
2)		 CAIN	S2,"c"			; or lower case c?
2)		  JRST	CN.END			; Yes done
2)		MOVEI	P1,"S"			; Assume not send control chr
2)		CAMN	S2,ESCAPE		; Another escape?
2)		 JRST	CN.SND			; Yes, send a real one
2)		CAIN	S2,"?"			; want help?
2)		 JRST	CN.HLP			; Yes, do it
2)		CAIE	S2,"S"			; Want status?
2)		 CAIN	S2,"s"			; or lower case "s"
2)		  JRST	CN.STS			; Yes
2)		CAIE	S2,"O"			; Clear buffers?
2)		 CAIN	S2,"o"			;  .  .  .
2)		   JRST	CN.CLR			; Yes, go clear terminal buffers
2)		CAIE	S2,"Q"			; Quit logging?
2)		 CAIN	S2,"q"			;  .  .  .
2)		  JRST	CN.QUT			; Quit logging
2)		CAIE	S2,"R"			; Resume logging
2)		 CAIN	S2,"r"			;  .  .  .
2)		  JRST	CN.RSM			; Yes, do it
2)		CAIE	S2,"^"			; Want control chr?
2)		  JRST	CN.ESE			; No, bad
**************
1)39	CN.CTL:	MOVEI	P1,"S"			; Next state
1)		CAIL	S1,"@"			; See if reasonable
1)		 CAILE	S1,"~"			; also allow lower case
1)		  JRST	CN.ESE			; No, ignore it
1)		ANDI	S1,37			; make a control chr
1)		JRST	CN.SND			; and send it
****
2)37	;[CSM] Use S2 instead of S1 in compares
2)	CN.CTL:	MOVEI	P1,"S"			; Next state
2)		CAIL	S2,"@"		;[CSM125]; See if reasonable
2)		 CAILE	S2,"~"		;[CSM125]; also allow lower case
2)		  JRST	CN.ESE			; No, ignore it
2)		CAIL	S2,"`"		;[CSM]	;[125] Lower case range?
2)		 XORI	S1,240			;[125] Toggle parity & case
2)		XORI	S1,300			;[125] Convert to control
2)		JRST	CN.SND			; and send it
**************
1)39	CN.SND:	XMOVEI	S2,XFRTRM		; Get the terminal control block
1)		$CALL	T$CCOT			; Send chr down line
1)		SKIPN	LCLECH			; Check if local echo
1)		 JRST	CN.LP			; No, just get another character
1)		XMOVEI	S2,MYTERM		; Yes, output to our terminal also
****
2)37	CN.SND:	BLSCAL	GEN%PARITY##,<S1>	;[125] Generate correct parity
2)		XMOVEI	S2,XFRTRM		; Get the terminal control block
2)		$CALL	T$CCOT			; Send chr down line
File 1)	DSKB:KERMIT.MAC[14,10,KERMIT,TOPS10]    	created: 2208 05-Aug-84
File 2)	DSKB:KERMIT.MAC[14,10,KERMIT,TOPS10,CSM]	created: 2309 05-Aug-84

2)		SKIPN	LCLECH			; Check if local echo
2)		 JRST	CN.LP			; No, just get another character
2)		$CALL	CN.PAR			;[125] Even parity unless PR%NONE
2)		XMOVEI	S2,MYTERM		; Yes, output to our terminal also
**************
1)39	CN.TYP:	XMOVEI	S2,MYTERM		; Point to the terminal block
1)		$CALL	T$CCOT			; Output the character
1)		$RETT				; and return
1)40		SUBTTL	Command execution -- DEFINE command
****
2)37	CN.TYP:	$CALL	CN.PAR			;[125] Even parity if needed
2)		XMOVEI	S2,MYTERM		; Point to the terminal block
2)		$CALL	T$CCOT			; Output the character
2)		$RETT				; and return
2)	;[125] Here to put even parity on a character.
2)	CN.PAR:	MOVE	S2,PARITY%TYPE##	;[125] Get the parity type
2)		CAIN	S2,PR%NONE##		;[125] No parity?
2)		 $RET				;[125] Yes, leave it alone
2)		ANDI	S1,177			;[125] Keep only 7 bits
2)		MOVEI	S2,(S1)			;[125] Get a copy
2)		LSH	S2,-4			;[125] Shift back 4 bits
2)		XORI	S2,(S1)			;[125] Combine halves
2)		TRCE	S2,14			;[125] Left bits both 0
2)		 TRNN	S2,14			;[125] Or both 1?
2)		  XORI	S1,200			;[125] Yes, change high bit
2)		TRCE	S2,3			;[125] Right bits both zero
2)		 TRNN	S2,3			;[125] Or both one?
2)		  XORI	S1,200			;[125] Yes, change high bit
2)		$RET				;[125] All done
2)38		SUBTTL	Command execution -- DEFINE command
**************
1)41	C$EXI0:	$HALT				; Exit to the monitor
1)		$RETT				; Allow continues
1)42		SUBTTL	Command execution -- BYE command
1)	;+
1)	;.hl1 C$BYE
1)	;This routine will process the BYE command.  It will cause the remote
1)	;server to exit and then will cause the local Kermit to exit.
1)	;.literal
****
2)39	C$EXI0:	SKIPN	LOGDIN			;[125] Are we logged in?
2)		 JRST	[$TEXT	(,<.KJOB^M^J.^A>) ;[125] No, make nice msg
2)			 LOGOUT	1,		;[125] And quit
2)			 JRST	.+1]		;[125] Shouldn't get here...
2)		$HALT				; Exit to the monitor
2)		$RETT				; Allow continues
2)40		SUBTTL	Command execution -- BYE command
2)	;+
2)	;.hl1 C$BYE
2)	;This routine will process the BYE command.  It will cause the remote
2)	;server to LOGOUT and then will cause the local Kermit to exit.
2)	;.literal
**************
1)52		HLLOS	USRFX+.FDEXM		; . . .
1)		SETOM	USRFX+.FDDIM		; . . .
****
File 1)	DSKB:KERMIT.MAC[14,10,KERMIT,TOPS10]    	created: 2208 05-Aug-84
File 2)	DSKB:KERMIT.MAC[14,10,KERMIT,TOPS10,CSM]	created: 2309 05-Aug-84

2)50	;[126];@C$RECEIVE + 9
2)		HRROS	USRFX+.FDEXM		;[126] . . .
2)		SETOM	USRFX+.FDDIM		; . . .
**************
1)57		RELEAS	TTYHLD,			; Give up on terminal we grabbed
1)		$RETT				; Return to the caller
1)	; Here to set the line to use for transfering information
1)	LINSBR:	$CALL	P$NUM			; Get the line number
1)		JUMPF	SETLI0			; Failed, see if other type
****
2)55		MOVE	S1,$TTDEV+MYTERM ;[CSM]	; Set device name if no argument
2)		MOVEM	S1,$TTDEV+XFRTRM ;[CSM]	;  (at SETLIN:+6)
2)		RELEAS	TTYHLD,			; Give up on terminal we grabbed
2)		$RETT				; Return to the caller
2)	; Here to set the line to use for transfering information
2)	LINSBR:	SETZM	XFRTRM+$TTDEV	;[CSM]	; Zero it until validated
2)		$CALL	P$NUM			; Get the line number
2)		JUMPF	SETLI0			; Failed, see if other type
**************
1)57		MOVE	S1,S2			; Save a copy
****
2)55		MOVEM	S2,XFRTRM+$TTDEV ;[CSM]	; Save device name (SETLI2:+2)
2)		MOVE	S1,S2			; Save a copy
**************
1)75		SETO	S1,			; Flag for output
****
2)73	;[CSM] Change in FILE%OPEN to prevent creation of HLP:FUCKME.HLP[2,5]
2)	TOPS10<	IFN FTCSM,< ;Not allowed to create files in [2,5] not logged in
2)		SKIPN	LOGDIN		;[CSM]	; Is job logged in?
2)		 JRST	[KERERR (<Cannot write files without LOGIN first>);[CSM]
2)			BLSRET	RMS32]	;[CSM]
2)	> ;End of IFN FTCSM	> ;End of TOPS10
2)		SETO	S1,			; Flag for output
**************
1)75		MOVE	S1,[XWD .FOMAX-1,FLP]	; Point to the argument block
1)		FILOP.	S1,			; Do the FILOP.
****
2)73	;[CSM] Bug at OPNWR3:-3, files created in UFD instead of SFD when
2)	;[CSM] FILE-WARNING in ON due to path getting lost.
2)		MOVE	S1,[XWD .FOMAX-1,FLP]	; Point to the argument block
2)		MOVE	T4,ELB+.RBPPN	;[CSM]	; Remember SFD pointer
2)		FILOP.	S1,			; Do the FILOP.
**************
1)75	OPNWR4:	MOVE	S1,[XWD .FOMAX-1,FLP]	; Point to the argument block
1)		FILOP.	S1,			; Do it
****
2)73	;[CSM] Reset path pointer before trying next file extension
2)	OPNWR4:	MOVE	S1,[XWD .FOMAX-1,FLP]	; Point to the argument block
2)		MOVEM	T4,ELB+.RBPPN	;[CSM]	; Create in right SFD
2)		FILOP.	S1,			; Do it
**************
1)90		$TEXT	(,< ^T/PKTTXT(S1)/^D/@PKTCNT(S1)/^A>)
****
2)88	;[CSM] The command "SET MESSAGE PACKET" outputs a bunch of zeros in XFR%STATUS
2)		AOS	@PKTCNT(S1)	;[CSM]	; Increment the counter
2)		$TEXT	(,< ^T/PKTTXT(S1)/^D/@PKTCNT(S1)/^A>)
File 1)	DSKB:KERMIT.MAC[14,10,KERMIT,TOPS10]    	created: 2208 05-Aug-84
File 2)	DSKB:KERMIT.MAC[14,10,KERMIT,TOPS10,CSM]	created: 2309 05-Aug-84

**************
1)100		MOVX	S1,.IOPIM!IO.SUP!UU.AIO	; Get the mode and other information
1)		MOVEM	S1,FLP+.FOIOS		; Store the status information
****
2)98	;[CSM] Change at T$OPEN+8 from IO.SUP to IO.LEM to pass XON/XOFF
2)	;[CSM] IO.SUP is redundant and IO.LEM enables a SCNSER modification
2)		MOVX	S1,.IOPIM!IO.LEM!UU.AIO	;[CSM] PIM and async I/O
2)		MOVEM	S1,FLP+.FOIOS		; Store the status information
**************
1)105	;	S1/ Terminal name in sixbit
1)	;
1)	;.end literal
1)	;-
1)	TOPS10<
1)	T$CONN:	$SAVE	<P1>			; Save this registers
1)		MOVE	P1,S1			; Copy the address
1)		MOVX	S1,<XWD .NDTCN,T1>	; Point to the argument block
1)		MOVX	T1,2			; Number of words
1)		MOVE	T2,$TTLIN(P1)		; Get the line number
1)		HRL	T2,$TTNOD(P1)		; Get the node number
1)		NODE.	S1,			; Connect the terminal
1)		 JRST	.+2			; Not a network system
1)		$RET				; Return to the caller
1)		MOVE	S1,$TTLIN(P1)		; Get the line number
1)		ADDX	S1,.UXTRM		; Convert to UDX
1)		DEVNAM	S1,			; Convert to terminal name
1)		 SETO	S1,			; Not a device?
1)		$RET				; Return
****
2)103	;	S1/ Terminal name in sixbit (also returned in $TTDEV)
2)	;
2)	;.end literal
2)	;-
2)	TOPS10<
2)	T$CONN:	$SAVE	<P1>			; Save this register
2)		MOVE	P1,S1			; Copy the address
2)		MOVX	S1,<XWD .NDTCN,T1>	; Point to the argument block
2)		MOVX	T1,2			; Number of words
2)		MOVE	T2,$TTLIN(P1)		; Get the line number
2)		HRL	T2,$TTNOD(P1)		; Get the node number
2)	;[CSM] At T$CONN+6, make sure that $TTDEV(P1) is correct in all cases
2)		NODE.	S1,			; Connect the terminal
2)		 JRST	T$CON0			; Not a network system
2)		MOVEM	S1,$TTDEV(P1)		;[CSM] Store device name
2)		$RET				; Return to the caller
2)	T$CON0:	DMOVE	S1,$TTNOD(P1)		;[CSM] Get node and line number
2)		CAMN	S1,MYTERM+$TTNOD	;[CSM] Going to controlling terminal?
2)		CAME	S2,MYTERM+$TTLIN	;[CSM]
2)		 SKIPA	S1,$TTDEV(P1)		;[CSM] No, get device name
2)		  MOVE	S1,MYTERM+$TTDEV	;[CSM] Yes, use correct name
2)		JUMPN	S1,T$CON1		;[CSM] Use it if nonzero
2)		MOVE	S1,$TTLIN(P1)		; Get the line number
2)		ADDX	S1,.UXTRM		; Convert to UDX
2)		DEVNAM	S1,			; Convert to terminal name
2)		 SETO	S1,			; Not a device?
2)	T$CON1:	MOVEM	S1,$TTDEV(P1)		;[CSM] Remember device name
File 1)	DSKB:KERMIT.MAC[14,10,KERMIT,TOPS10]    	created: 2208 05-Aug-84
File 2)	DSKB:KERMIT.MAC[14,10,KERMIT,TOPS10,CSM]	created: 2309 05-Aug-84

2)		$RET				; Return
**************
1)112	TIMLIM:	BLOCK	1			; Time out time
****
2)110	LOGDIN:	BLOCK	1			;[125] Nonzero if job is logged in
2)	TIMLIM:	BLOCK	1			; Time out time
**************
1)113	HLPFD:	$BUILD	FDMSIZ
1)		 $SET	.FDLEN,FD.LEN,FDMSIZ	; Size of the block
1)		 $SET	.FDLEN,FD.TYP,.FDNAT	; Native file specification
1)		 $SET	.FDSTR,,<SIXBIT /HLP/>	; HLP:
1)		 $SET	.FDNAM,,%%.MOD		; KERMIT
1)		 $SET	.FDEXT,,<SIXBIT /HLP/>	; .HLP
****
2)111	;[CSM] KERMIT.HLP has general info on KERMIT-10, KERMIT-80, and KERMIT-86.
2)	;[CSM] KERM10.HLP is in GLXLIB format for KERMIT-10 on-line help.
2)	;[CSM] This change is specific to Colorado School of Mines only.
2)	HLPFD:	$BUILD	FDMSIZ
2)		 $SET	.FDLEN,FD.LEN,FDMSIZ	; Size of the block
2)		 $SET	.FDLEN,FD.TYP,.FDNAT	; Native file specification
2)		 $SET	.FDSTR,,<SIXBIT /HLP/>	; HLP:
2)	IFE FTCSM,<$SET	.FDNAM,,%%.MOD >	; KERMIT
2)	IFN FTCSM,<$SET	.FDNAM,,<SIXBIT /KERM10/> > ;[CSM] HLP:KERM10.HLP
2)		 $SET	.FDEXT,,<SIXBIT /HLP/>	; .HLP
**************
    
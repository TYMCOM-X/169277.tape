File 1)	DSK:PCOM51.SAI	created: 1747 01-SEP-82
File 2)	DSK:PCOM52.SAI	created: 2331 21-SEP-82

1)1	require (Ifcr PRELIMINARY thenc '101 elsec '1 endc lsh 18) lor '51 version;
1)	require "
****
2)1	require (Ifcr PRELIMINARY thenc '101 elsec '1 endc lsh 18) lor '52 version;
2)	require "
**************
1)1	Library:  PCOINT.SAI [REL]
1)	License:  WC RC SY" message;
****
2)1	Library:  PCOINT.DCL, PCOINT.SAI [REL]
2)	License:  WC RC SY" message;
**************
1)1	external simple procedure IntIni(Itemvar Int;
1)		Integer Port, FileChan, FilePage, FileSize, ParentPrint );
1)	external simple procedure IntCause( Integer Int erruptChannel );
1)	external integer procedure IntFin;
1)	external simple procedure IntZap;
1)	external simple procedure IntLog( Boolean TrueFalseValue );
1)	require "PCOINT" library;
1)	require 25 polling!interval;
****
2)1	require "PCOINT.DCL" source!file;
2)	require 25 polling!interval;
**************
1)3	!	*** S W I T C H E S ***;
****
2)2	Define KQ(x,y) = 		     {	Kequ(x,CvPS(y))
2)	    ifcr length( CvPS(y) ) > 3 thenc or Kequ(x,CvPS(y)[1 for 3]) endc
2)		};
2)3	!	*** S W I T C H E S ***;
**************
1)6	    setbreak(B!Nam_Getbreak,#Chars,      crlf, "RXNF");	! name or token;
1)	    setbreak(B!Usr_Getbreak, ")",        null, "SINK");	! end of username;
****
2)6	    setbreak(B!Nam_Getbreak,#Chars&crlf, crlf, "RXNF");	! name or token;
2)	    setbreak(B!Usr_Getbreak, ")",        null, "SINK");	! end of username;
**************
1)6	    setbreak(B!Wht_Getbreak,#lf & ##Wht, crlf, "RXNK");	! white space;
1)	    setbreak(B!Brk_Getbreak,#lf & ##Brk, #cr,  "RINK");	! all break chars;
****
2)6	    setbreak(B!Wht_Getbreak,##Wht&crlf,  crlf, "RXNK");	! white space;
2)	    setbreak(B!Brk_Getbreak,#lf & ##Brk, #cr,  "RINK");	! all break chars;
**************
1)22		  Print(Cvs(JX+1000)[2 for 3],"PCO.TMP contains then command line.");
1)		  Logout!Child;
****
2)22		  Print(Cvs(JX+1000)[2 for 3],"PCO.TMP contains the command line.");
2)		  Logout!Child;
**************
1)23	Return( BRK = "=" or
1)	       (Kequ(KW,"AFTER") or Kequ(KW,"COM") or Kequ(KW,"CONTINUE") or
1)		Kequ(KW,"DEFINE") or Kequ(KW,"ESCAPE") or Kequ(KW,"FIND") or
1)		Kequ(KW,"GO") or Kequ(KW,"IF") or Kequ(KW,"LOOK") or
1)		Kequ(KW,"PAUSE") or Kequ(KW,"PARAMETERS") or Kequ(KW,"QUIT") or
File 1)	DSK:PCOM51.SAI	created: 1747 01-SEP-82
File 2)	DSK:PCOM52.SAI	created: 2331 21-SEP-82

1)		Kequ(KW,"RESTART") or Kequ(KW,"SEND") or Kequ(KW,"STOP") or
1)		Kequ(KW,"TIME") or Kequ(KW,"UNLESS") or Kequ(KW,"WAIT")
1)		)
****
2)23	Return( BRK = "=" or length( KW ) = 0 or
2)	       (Kq(KW,AFTER) or Kq(KW,COM) or Kq(KW,CONTINUE) or Kq(KW,DEFINE) or
2)		Kq(KW,ESCAPE) or Kq(KW,FIND) or Kq(KW,GO) or Kequ(KW,"GOTO") or
2)		Kq(KW,IF) or Kq(KW,LOOK) or Kq(KW,PAUSE) or Kq(KW,PARAMETERS) or
2)		Kq(KW,QUIT) or Kq(KW,REMARK) or Kq(KW,RESTART) or Kq(KW,SEND) or
2)		Kq(KW,STOP) or Kq(KW,TIME) or Kq(KW,UNLESS) or Kq(KW,WAIT)
2)		)
**************
1)23	    KW _ Get!Token(S);				!   get first token;
1)	    If Kequ(KW,"LOGFILE") then begin		!   see if :LOGFILE;
1)		If Length( Filename ) = 0 then
****
2)23	    KW_ Get!Token(S);				!   get first token;
2)	    If Kq(KW,LOGFILE) then begin		!   see if :LOGFILE;
2)		If Length( Filename ) = 0 then
**************
1)26	    if KW = ":" then			! ignore label here;
1)	    else if BRK = "=" then REASSIGN( KW&BRK&CMD )
1)	    else if Kequ(KW,"AFTER") then				! Perp;
1)	    else if Kequ(KW,"COM") then COM (CMD)			! Pcom only;
1)	    else if Kequ(KW,"CONTINUE") then				! Perp;
1)	    else if Kequ(KW,"DEFINE") then REASSIGN(CMD)		! Perp;
1)	    else if Kequ(KW,"ESCAPE") then ESCAPE			! Perp;
1)	    else if Kequ(KW,"FIND") then				! Perp;
1)	    else if Kequ(KW,"GO") or Kequ(KW,"GOTO") then GOTO(CMD)	! Perp;
1)	    else if Kequ(KW,"IF") then					! Perp;
1)	    else if Kequ(KW,"LOGFILE") then LOGFILE(CMD)		! Pcom only;
1)	    else if Kequ(KW,"LOOK") then				! Perp;
1)	    else if Kequ(KW,"PAUSE") then				! Perp;
1)	    else if Kequ(KW,"PARAMETERS") then PARAMETERS(CMD)		! Pcom only;
1)	    else if Kequ(KW,"QUIT") then QUIT				! Perp;
1)	    else if Kequ(KW,"RESTART") then				! Perp;
1)	    else if Kequ(KW,"SEND") then SEND (CMD)			! Pcom only;
1)	    else if Kequ(KW,"STOP") then STOP				! Perp;
1)	    else if Kequ(KW,"TIME") then TIME (CMD)			! Perp;
1)	    else if Kequ(KW,"UNLESS") then				! Perp;
1)	    else if Kequ(KW,"WAIT") then				! Perp;
1)	    else Fatal("illegal PCOM command "":"&KW&"""");
****
2)26	    if KW = ":" then		! ignore label here;	! Defer;
2)	    else if BRK = "=" then REASSIGN( KW&BRK&CMD )	! Defer;
2)	    else if Length(KW) = 0 then 			! Pcom only;
2)	    else if Kq(KW,COM) then COM (CMD)			! Pcom only;
2)	    else if Kq(KW,DEFINE) then REASSIGN(CMD)		! Defer;
2)	    else if Kq(KW,ESCAPE) then ESCAPE			! Defer;
2)	    else if Kq(KW,GO) or Kequ(KW,"GOTO") then GOTO(CMD)	! Defer;
2)	    else if Kq(KW,LOGFILE) then LOGFILE(CMD)		! Pcom only;
2)	    else if Kq(KW,PARAMETERS) then PARAMETERS(CMD)	! Pcom only;
2)	    else if Kq(KW,QUIT) then QUIT			! Defer;
2)	    else if Kq(KW,REMARK) then				! Pcom only;
File 1)	DSK:PCOM51.SAI	created: 1747 01-SEP-82
File 2)	DSK:PCOM52.SAI	created: 2331 21-SEP-82

2)	    else if Kq(KW,SEND) then SEND (CMD)			! Pcom only;
2)	    else if Kq(KW,STOP) then STOP			! Defer;
2)	    else if Kq(KW,TIME) then TIME (CMD)			! Defer;
2)	    else if Kq(KW,AFTER)   or Kq(KW,CONTINUE) or Kq(KW,FIND)  or
2)		    Kq(KW,IF)      or Kq(KW,LOOK)     or Kq(KW,PAUSE) or
2)		    Kq(KW,RESTART) or Kq(KW,UNLESS)   or Kq(KW,WAIT)
2)		  then	! unimplemented DEFER commands;		! Defer;
2)	    else Fatal("illegal PCOM command "":"&KW&"""");
**************
 
File 1)	DSK:PCOM52.SAI	created: 2331 21-SEP-82
File 2)	DSK:PCOM53.SAI	created: 1925 07-MAR-83

1)1	require (Ifcr PRELIMINARY thenc '101 elsec '1 endc lsh 18) lor '52 version;
1)	require "
****
2)1	require (Ifcr PRELIMINARY thenc '101 elsec '1 endc lsh 18) lor '53 version;
2)	require "
**************
1)2	,	Error!ISA = Error!ISN+1;! Illegal Switch Argument;
1)	Define Complete = {"completed"};! successful completion;
****
2)2	,	Error!ISA = Error!ISN+1	! Illegal Switch Argument;
2)	;
2)	Define Complete = {"completed"};! successful completion;
**************
1)4	Preset!with 0,3,3,6,1,4,6,2,5,0,3,5;
****
2)4	Define FRMC NT=0,FRMPPN=1,FRMPRV=2,FRMAUN=3,FRMUNM=4,FRMUN1=5,FRMLIC=6;
2)	Own integer array frame!block[ FRMCNT : FRMLIC ]; ! new style !FOCFM block;
2)	Preset!with 0,3,3,6,1,4,6,2,5,0,3,5;
**************
1)6	simple procedure SetDetach;
****
2)6	simple procedure InitUser;
2)	begin
2)	    Redefine CF!LIC = !bit(16);		! until UUOSYM.DEF is right;
2)	    Status _ Status!BEGIN;		! tell parent we've started;
2)	    Parent _ calli(0,calli!PJOB);	! remember who we are;
2)	    frame!block[ FrmCNT ]_ (CF!LIC lor 5);
2)	    frame!block[ FrmPPN ]_ calli( !Xwd( -1,!GTPPN ), calli!GETTAB );
2)	    frame!block[ FrmPRV ]_ calli( !Xwd( -1,!GTPRV ), calli!GETTAB );
2)	    frame!block[ FrmAUN ]_ calli( !Xwd( -1,!GTAUN ), calli!GETTAB );
2)	    frame!block[ FrmUNM ]_ calli( !Xwd( -1,!GTUNM ), calli!GETTAB );
2)	    frame!block[ FrmUN1 ]_ calli( !Xwd( -1,!GTUN1 ), calli!GETTAB );
2)	    frame!block[ FrmLIC ]_ calli( !Xwd( -1,!GTLIC ), calli!GETTAB );
2)	    MyName _ cv6str(frame!block[ FrmUNM ]) & cv6str(frame!block[ FrmUN1 ]);
2)	end;
2)	require InitUser initialization;
2)	simple procedure SetDetach;
**************
1)21		    protect!acs 1;
1)		    label frmerr;
1)		    SETOM !skip!;		! skip return;
1)		    HRLI 1,!foCFM;
1)		    uuo!FRMOP 1,[0];		! attempt to bear a child;
1)		      Jrst frmerr;		!   unbearable!;
****
2)21		    protect!acs 1,2;
2)		    label frmxct,frmerr;
2)		    caia;			! skip the next;
2)	frmxct:	    uuo!FRMOP 1,0;		! useful instruction;
2)		    SETOM !skip!;		! skip return;
2)		    MOVE 2,frmxct;		! copy the frmop;
2)		    HRRI 2,access(frame!block[0]);
2)		    HRLI 1,!foCFM;		! function: create frame;
2)		    XCT  2;			! attempt to bear a child;
File 1)	DSK:PCOM52.SAI	created: 2331 21-SEP-82
File 2)	DSK:PCOM53.SAI	created: 1925 07-MAR-83

2)		      Jrst frmerr;		!   unbearable!;
**************
1)21		Ifcr PRELIMINARY thenc
1)		    begin "PRIV CHECK"
1)			integer me,he;
1)			me_Calli( !Xwd(-1,!GTPRV), Calli!GETTAB );
1)			he_Calli( !Xwd(frame!index land '777,!GTPRV), Calli!GETTAB );
1)			If me neq he then print(  "*** Privilage word mismatch: ",
1)			    "Parent = ",Cvos(me)," Child = ",Cvos(he)," ****",crlf);
1)		    end;
1)		    If swLICENSE > 0 then begin "LICSET"
1)			MyLic[0] _ Calli( !Xwd(-1,!GTLIC), Calli!GETTAB );
1)			MyLic[1] _ ( ( Calli(!Xwd(!GTLIC,!GTSLF),Calli!GETTAB)
1)				     land '777777 ) + (frame!index land '777) )
1)				   lor !bit(0);	! Virtual address + frame #;
1)			Calli( Location(MyLic[0]), Calli!POKE );
1)		    end "LICSET";
1)		endc
1)	    end "pregnancy" until !skip! neq 0;
****
2)21	    end "pregnancy" until !skip! neq 0;
**************
1)22	! *SW$OVB*  "/",Print!switch("WATCH"),			! * watch processing;
1)		endc
****
2)22	! *SW$OVB*  "/",Print!switch("PRINT"),			! * print debugging;
2)		endc
**************
1)23	    S _ input(IChan,B!Lin);			! Read first line of file;
1)	    If EOF and Length(S)=0 then Return(False);	! Nothing there? Return;
****
2)23	    S _ null;					! Initially nothing there;
2)	    Do S _ input( IChan, B!Lin )		! Read first line of file;
2)	     until ( BRK = #lf ) or ( EOF );		!  up to first LF;
2)	    If EOF and Length(S)=0 then Return(False);	! Nothing there? Return;
**************
1)26	    string S;
1)	    S _ "::" & Tok( CMD );
1)	    useti(IChan,1); LineNo _ 0;
1)	    do begin
1)		LineNo _ LineNo +1;
1)		if Kequ( S, input(IChan,B!Lin)[1 to inf-1] ) then return;
1)	    end until EOF;
1)	end "GOTO COMMAND";
****
2)26	    string S, ST;
2)	    S _ "::" & Tok( CMD );			! Define label = ::name ;
2)	    useti(IChan,1); LineNo _ 0;			! Reset to beginning of file;
2)	    do begin
2)		LineNo _ LineNo +1;			! Count source file lines;
2)		ST _ null;				! Initially nothing there;
2)		Do ST _ input( IChan, B!Lin )		! Read first line of file;
2)		 until ( BRK = #lf ) or ( EOF );	!  up to first LF;
2)		if Kequ( S, ST[1 to inf-1] )		! Compare S to ST - #cr;
File 1)	DSK:PCOM52.SAI	created: 2331 21-SEP-82
File 2)	DSK:PCOM53.SAI	created: 1925 07-MAR-83

2)		 then return;				! If match, then "found";
2)	     end until EOF;
2)	    Fatal("EOF while scanning for label """&S&"""");
2)	end "GOTO COMMAND";
**************
1)28	Status _ Status!BEGIN;			! tell parent we've started;
1)	MyName _ cv6str(calli(!xwd(-1,!GTUNM),calli!GETTAB)) &
1)		 cv6str(calli(!xwd(-1,!GTUN1),calli!GETTAB));
1)	Parent _ calli(0,calli!PJOB);		! remember who we are;
1)	IChan_S!Chan_Getchan;			! designate initial input channel;
****
2)28	IChan_S!Chan_Getchan;			! designate initial input channel;
**************
1)28	    S _ input(IChan,B!Lin);		! input line from file;
1)	    if EOF then done;			! until done;
1)	    LineNo _ LineNo +1;			! count it;
****
2)28	    S _ null;				! Initially nothing there;
2)	    Do S _ input( IChan, B!Lin )	! Read first line of file;
2)	     until ( BRK = #lf ) or ( EOF );	!  up to first LF;
2)	    if ( EOF ) and ( Length( S ) = 0 )	! End of File? Only if no line;
2)	     then done;				!  until done;
2)	    LineNo _ LineNo +1;			! count it;
**************
  
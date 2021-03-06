File 1)	DSK:PCOM55.SAI	created: 1927 07-MAR-83
File 2)	DSK:PCOM56.SAI	created: 0508 30-MAR-83

1)1	require (Ifcr PRELIMINARY thenc '101 elsec '1 endc lsh 18) lor '55 version;
1)	require "
****
2)1	require (Ifcr PRELIMINARY thenc '101 elsec '1 endc lsh 18) lor '56 version;
2)	require "
**************
1)2	,	Status!EXIT  =  9;	! PCOM normal termination;
1)	Define	Error!LIC = 1		! Not enough license;
****
2)2	,	Status!EXIT  =  9	! PCOM normal termination;
2)	,	Status!WATCH = 10;	! PCOM termination running PEECOM;
2)	Define	Error!LIC = 1		! Not enough license;
**************
1)3		])
****
2)3	    SW!SN (WATCH,0)
2)		]) 
**************
1)4	,	Child!handle, FD	! frame handles to child;
****
2)4	,	WildFrame		! frame number for wildcarding;
2)	,	Child!handle, FD	! frame handles to child;
**************
1)6	    If Msg and Msg neq Status!EXIT	! if an error msg given & not EXIT;
1)	     then begin
****
2)6	    If (Msg) and			! if an error msg given;
2)	       not (( Msg = Status!EXIT ) or	!   and not just a legal Exit;
2)		    ( Msg = Status!WATCH ))	!   i.e. WATCH or EXIT;
2)	     then begin
**************
1)10		    F _ CvS( Parent );
1)		    Nam _ Nam & F[Length(F)-Count to INF];
****
2)10		    F _ CvS( WildFrame );
2)		    Nam _ Nam & F[Length(F)-Count to INF];
**************
1)17	    /TRULIMIT:n - Set a TRU limit  (Default is no limit set)",
1)	Ifcr PRELIMINARY thenc  "
****
2)17	    /TRULIMIT:n - Set a TRU limit  (Default is no limit set)
2)	    /WATCH      - Watch the progress of the detached PCOM process",
2)	Ifcr PRELIMINARY thenc  "
**************
1)17	    APPEND, DETACH, HELP, LICENSE, LOG,
1)	    MAIL, NEWS, SUPERSEDE, TIME, TRULIMIT",
1)	Ifcr PRELIMINARY thenc ",
****
2)17	    APPEND, DETACH, HELP, LICENSE, LOG, MAIL,
2)	    NEWS, SUPERSEDE, TIME, TRULIMIT, WATCH",
2)	Ifcr PRELIMINARY thenc ",
**************
1)17	 o Added /LICENSE switch which passes the current frame
****
File 1)	DSK:PCOM55.SAI	created: 1927 07-MAR-83
File 2)	DSK:PCOM56.SAI	created: 0508 30-MAR-83

2)17	 o Added /WATCH switch to automatically run the PEECOM
2)	   program to watch the progress of a detached PCOM job.
2)	 o Added /LICENSE switch which passes the current frame
**************
1)22	    own integer array RB[0:3];	! run block for PCOM or LOGOUT;
****
2)22	    own integer TmpChn, EoTmp;	! Tempfile channel, eof-flag;
2)	    own integer array PC[0:5];	! run block for PEECOM (normal);
2)	    own integer array RB[0:3];	! run block for PCOM or LOGOUT;
**************
1)22	    HLT[0]_ 2;
****
2)22	    if ( swWATCH ) and ( swLOG )
2)	     then begin "Setup PEECOM info"
2)		MaskWild _ True;    WildFrame _ JX;
2)		LogFileName _ Getfil(S_Odevice&":"&LogFileName,
2)				    Odevice, Ext!Found, File!Error);
2)		if length( LogFileName ) and not Ext!Found
2)		 then LogFileName_ LogFileName & Default!Log
2)		 else LogFileName_ Cvs(1000+JX)[2 to 4]&"PCO.LOG"
2)	     end "Setup PEECOM info";
2)	    HLT[0]_ 2;
**************
1)22	    EXIT( Status!Exit )
****
2)22	    If ( swWATCH ) and ( swLOG )
2)	     then begin "RUN PEECOM"
2)		TMPOUT( "PEC", LogFilename, EoTmp );
2)		If EoTmp
2)		 then begin
2)		    Open( TmpChn_getchan,"DSK",0, 0,1, 0, 0, EoTmp_-1 );
2)		    Enter(TmpChn, Cvs(1000+Parent)[2 to 4]&"PEC.TMP",EoTmp_-1);
2)		    If EoTmp
2)		     then begin
2)			Print("Unable to watch PCOM log file.", Crlf,
2)				"Please run (SYS)PEECOM.", Crlf );
2)			Exit( Status!Exit );
2)		     end;
2)		    Cprint( TmpChn, LogFileName );
2)		    Close( TmpChn ); Release( TmpChn )
2)		 end;
2)		PC[0] _ cvsix("DSK");
2)		PC[1] _ CvSix("PEECOM");
2)		PC[4] _ calli(!xwd(-1,!gtFPN),calli!GETTAB);
2)		Calli( !Xwd( 1,location(PC[0]) ), calli!RUN );
2)	     end "RUN PEECOM";
2)	    EXIT( Status!Exit )
**************
1)23		If Length( Filename ) = 0 then
1)		    FileName _ GetFil(S,ODevice,Ext!Found,File!Error);
1)		Return( True );				!     Yes! - Return;
****
2)23		If Length( Filename ) = 0
2)		 then begin
File 1)	DSK:PCOM55.SAI	created: 1927 07-MAR-83
File 2)	DSK:PCOM56.SAI	created: 0508 30-MAR-83

2)		    MaskWild _ False;
2)		    FileName _ GetFil(S,ODevice,Ext!Found,File!Error)
2)		 end;
2)		Return( True );				!     Yes! - Return;
**************
1)23		    If Length( Filename ) = 0 then
1)			Filename _ GetFil(S,ODevice,Ext!Found,File!Error);
1)		    Ifcr PRELIMINARY thenc
****
2)23		    If Length( Filename ) = 0
2)		     then begin
2)			MaskWild _ False;
2)			Filename _ GetFil(S,ODevice,Ext!Found,File!Error)
2)		     end;
2)		    Ifcr PRELIMINARY thenc
**************
1)24	    CmdFile _ Getfil(S_Idevice&":"&CmdFile, Idevice, Ext!Found, File!Error);
****
2)24	    WildFrame _ Parent;			! use parent for wildcards;
2)	    CmdFile _ Getfil(S_Idevice&":"&CmdFile, Idevice, Ext!Found, File!Error);
**************
1)24	!	"detach" if necessary
****
2)24	!	setup LOG file name
2)	;
2)	    MaskWild _ True;			! convert wildcards in filename;
2)	    Check!Logfile( LogFileName );	! Check for :LOGFILE filename;
2)	!	"detach" if necessary
**************
1)24	!	setup LOG file
1)	;
1)	    MaskWild _ True;			! convert wildcards in filename;
1)	    Check!Logfile( LogFileName );	! Check for :LOGFILE filename;
1)	    LogFileName _ Getfil(S_Odevice&":"&LogFileName,
****
2)24	!	open LOG file
2)	;
2)	    WildFrame _ Parent;			! set parent for wildcard name;
2)	    LogFileName _ Getfil(S_Odevice&":"&LogFileName,
**************
 
File 1)	DSK:PCOM60.SAI	created: 0515 30-MAR-83
File 2)	DSK:PCOM61.SAI	created: 2231 16-APR-83

1)1	require (Ifcr PRELIMINARY thenc '101 elsec '1 endc lsh 18) lor '60 version;
1)	require "
****
2)1	require (Ifcr PRELIMINARY thenc '101 elsec '1 endc lsh 18) lor '61 version;
2)	require "
**************
1)1	License:  WC RC SY HF" message;
1)	require "(SAILIB)SAIL.DEF" source!file;
****
2)1	License:  ALL license bits!!! " message;
2)	require "(SAILIB)SAIL.DEF" source!file;
**************
1)4	,	MyLicense		! initial license - to protect against HF;
1)	,	Parent, Child		! frame numbers of parent & child;
****
2)4	,	FileLic ense, MyLicense	! initial license - to protect against HF;
2)	,	Parent, Child		! frame numbers of parent & child;
**************
1)6	!	Initialization routines;
1)	string procedure EXIT(Integer Msg(0) );	! string so it can be "printed" [ugh];
****
2)6	!	Initialization support routines;
2)	string procedure EXIT(Integer Msg(0) );	! string so it can be "printed" [ugh];
**************
1)6			[Error!LIC] "License WC RC SY HF required",
1)			[Error!CFM] "Create Frame Error # ("&Cvos(!rh(ErrorCondition))&")",
****
2)6			[Error!LIC] "More License required",
2)			[Error!CFM] "Create Frame Error # ("&Cvos(!rh(ErrorCondition))&")",
**************
1)6	simple procedure LicenseCheck;
1)	begin
1)	    integer L;
1)	    L _ calli(!xwd(-1,!GTLIC),calli!GETTAB);
1)	    if (L land LC!WC = 0)
1)	    or (L land LC!RC = 0)
1)	    or (L land LC!SY = 0)
1)	    or (L land LC!HF = 0)
1)	    then EXIT( Error!LIC lsh 18 );
1)	end;
****
2)6	Define PCOM!License = LC!WC lor LC!RC lor LC!SY;
2)	Simple Procedure IncLic;
2)	begin
2)	    Calli( MyLicense, calli!SETLIC );
2)	end;
2)	Simple Procedure DecLic;
2)	begin
2)	    Calli( !Xwd( !rh( MyLicense ), !rh( MyLicense ) )
2)		   lor PCOM!License, calli!SETLIC );
2)	end;
2)7	!	Initialization routines;
2)	simple procedure LicenseCheck;
2)	begin
File 1)	DSK:PCOM60.SAI	created: 0515 30-MAR-83
File 2)	DSK:PCOM61.SAI	created: 2231 16-APR-83

2)	    If ( '777617 neq !lh(calli(!xwd(-1,!GTLIC),calli!GETTAB)) )
2)	     then EXIT( Error!LIC lsh 18 );
2)	end;
**************
1)6	    MyLicense _ frame!block[ FrmLIC ];	! copy license;
1)	    Calli( MyLicense land (lnot LC!HF), calli!SETLIC );	! reduce license;
1)	    MyName _ cv6str(frame!block[ FrmUNM ]) & cv6str(frame!block[ FrmUN1 ]);
1)	end;
****
2)7	    MyName _ cv6str(frame!block[ FrmUNM ]) & cv6str(frame!block[ FrmUN1 ]);
2)	    MyLicense _ frame!block[ FrmLIC ];	! copy license;
2)	    DecLic;				! reduce license;
2)	end;
**************
1)7	    Calli( MyLicense, calli!SETLIC );	! Increase license;
1)	    Name _ CvUser( AUN );		! Convert username;
1)	    Calli( MyLicense land (lnot LC!HF), calli!SETLIC );
1)	    Return( Name );			! Reduce license and return;
1)	end;
****
2)8	    IncLic;				! Increase license;
2)	    Name _ CvUser( AUN );		! Convert username;
2)	    DecLic;				! Reduce license;
2)	    Return( Name );			! Return;
2)	end;
**************
1)21	    loop!count _ 0;			! set clock running;
****
2)22	    IncLic;				! use full license;
2)	    loop!count _ 0;			! set clock running;
**************
1)21		    label frmxct,frmerr;
1)		    caia;			! skip the next;
1)	frmxct:	    uuo!FRMOP 1,0;		! useful instruction;
1)		    SETOM !skip!;		! skip return;
1)		    MOVE 2,frmxct;		! copy the frmop;
1)		    HRRI 2,access(frame!block[0]);
1)		    HRLI 1,!foCFM;		! function: create frame;
1)		    XCT  2;			! attempt to bear a child;
1)		      Jrst frmerr;		!   unbearable!;
****
2)22		    label frmerr;
2)		    SETOM !skip!;		! skip return;
2)		    HRLI 1,!foCFM;		! function: create frame;
2)		    uuo!FRMOP 1,Frame!Block[0];	! attempt to bear a child;
2)		      Jrst frmerr;		!   unbearable!;
**************
1)21	    Return(frame!index);	! Don't forget this;
****
2)22	    DecLic;			! reduce license;
2)	    Return(frame!index);	! Don't forget this;
**************
1)24	    string S;			! a handy string;
1)	    integer Array F[1:6];	! used for file info;
File 1)	DSK:PCOM60.SAI	created: 0515 30-MAR-83
File 2)	DSK:PCOM61.SAI	created: 2231 16-APR-83

1)	    label INPUT.PROMPT;		! goto here for purpose of reprompting;
****
2)25	    integer Array F[1:6], LongF[0:!RBLIC];
2)	    string S;			! a handy string;
2)	    label INPUT.PROMPT;		! goto here for purpose of reprompting;
**************
1)24	    CmdFile _ "(" & CvName(F[4]) & ")" & Cv6str(F[1]) &
****
2)25	    LongF[ !RBCNT ]_ !RBLIC;		! Size of long lookup block;
2)	    LongF[ !RBPPN ]_ F[ 4 ];		! User's PPN ;
2)	    LongF[ !RBNAM ]_ F[ 1 ];		! File Name  ;
2)	    LongF[ !RBEXT ]_ F[ 2 ];		! Extension  ;
2)	    Chnior( IChan, LongF[ !RBCNT ], !CHLK );
2)	    FileLicense_ If ( !SKIP! ) then !rh( LongF[!RBLIC] ) else 0;
2)	    CmdFile _ "(" & CvName(F[4]) & ")" & Cv6str(F[1]) &
**************
1)28	SPROUT;					! create child frame and PTY to it;
****
2)29	If ( FileLicense )			! if file has license on it;
2)	 then					!  then setup child ONLY;
2)	    Frame!Block[ FrmLic ]_ FileLicense;	!    with that license;
2)	SPROUT;					! create child frame and PTY to it;
**************
  
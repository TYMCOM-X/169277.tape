File 1)	DSK:PCOM61.SAI	created: 2231 16-APR-83
File 2)	DSK:PCOM62.SAI	created: 1713 01-JUN-83

1)1	require (Ifcr PRELIMINARY thenc '101 elsec '1 endc lsh 18) lor '61 version;
1)	require "
****
2)1	require (Ifcr PRELIMINARY thenc '101 elsec '1 endc lsh 18) lor '62 version;
2)	require "
**************
1)7	!	Initialization routines;
****
2)6	Simple Integer Procedure NewLic( Integer UserLic, FileLic(0) );
2)	begin
2)	    Integer Read, Write;
2)	    Write_ (UserLic land '3) max (FileLic land '3);
2)	    Read_ (UserLic land '14) max (FileLic land '14);
2)	    Return(((UserLic lor FileLic) land '777617777600) lor Read lor  Write);
2)	end;
2)7	!	Initialization routines;
**************
1)29	If ( FileLicense )			! if file has license on it;
1)	 then					!  then setup child ONLY;
1)	    Frame!Block[ FrmLic ]_ FileLicense;	!    with that license;
1)	SPROUT;					! create child frame and PTY to it;
****
2)29	If ( FileLicense )			! if file has license then use it;
2)	 then Frame!Block[ FrmLic ]_ NewLic( Frame!Block[FrmLic], FileLicense );
2)	SPROUT;					! create child frame and PTY to it;
**************

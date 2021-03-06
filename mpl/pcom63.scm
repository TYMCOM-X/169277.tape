File 1)	DSK:PCOM62.SAI	created: 1713 01-JUN-83
File 2)	DSK:PCOM63.SAI	created: 1923 01-JUL-83

1)1	require (Ifcr PRELIMINARY thenc '101 elsec '1 endc lsh 18) lor '62 version;
1)	require "
****
2)1	require (Ifcr PRELIMINARY thenc '101 elsec '1 endc lsh 18) lor '63 version;
2)	require "
**************
1)5	,	$Date			! Current date dd-mmm-yy;
1)	,	$Day,$Month,$Year	! Current day(dd),month(month),year(yyyy);
1)	,	$Weekday		! Day of week, Sunday---Saturday;
1)	,	$Delimiter;		! Delimiter variable;
****
2)5	,	$Hour,$Minute,$Second	! Current time-of-day pieces;
2)	,	$HH,$SS			! Current time-of-day pieces;
2)	,	$HHMMSS,$HHMM, $MMSS	! Current time-of-day combinations;
2)	,	$Date			! Current date dd-mmm-yy;
2)	,	$Day,$Month,$Year	! Current day(dd),month(month),year(yyyy);
2)	,	$Mon			! Current month(mmm);
2)	,	$DD,$MM,$YY		! Current day(dd),month(mm),year(yy);
2)	,	$Weekday		! Day of week, Sunday---Saturday;
2)	,	$Yesterday,$Tomorrow	! Day of week, Sunday---Saturday;
2)	,	$Delimiter;		! Delimiter variable;
**************
1)8		[else] Null
****
2)8		[5] Weekday[ (R[3]+1) mod 7 ],
2)		[6] Weekday[ (R[3]+6) mod 7 ],
2)		[7] Cvs(101+R[1])[2 for 2]),
2)		[else] Null
**************
1)8	procedure Set!Delimiter( String Character );
****
2)8	procedure ReadTimer( Reference Integer HH, MM, SS );
2)	begin
2)		SS _ Calli(0,calli!timer) div 60;
2)		HH _ SS Div 3600;
2)		SS _ SS Mod 3600;
2)		MM _ SS Div 60;
2)		SS _ SS Mod 60;
2)	end;
2)	procedure Set!Delimiter( String Character );
**************
1)9		T _ Calli(0,calli!timer) div 60;
1)		HH _ T Div 3600;
1)		T  _ T Mod 3600;
1)		MM _ T Div 60;
1)		SS _ T Mod 60;
1)		Getformat(T,D); SetFormat(-2,0);
****
2)9		ReadTimer( HH, MM, SS );
2)		Getformat(T,D); SetFormat(-2,0);
**************
1)9	procedure Logging$( String Itemvar W, R);
****
2)9	procedure Hour$( String Itemvar W, R);		! Read-only * Time of day;
File 1)	DSK:PCOM62.SAI	created: 1713 01-JUN-83
File 2)	DSK:PCOM63.SAI	created: 1923 01-JUL-83

2)	begin
2)	    Integer HH,MM,SS;
2)	    If W neq any then begin
2)		ReadTimer( HH, MM, SS );
2)		Datum(W) _ CvS(HH);
2)	    end;
2)	end;
2)	procedure HH$( String Itemvar W, R);	! Read-only * Time of day;
2)	begin
2)	    Integer T,D,HH,MM,SS;
2)	    If W neq any then begin
2)		ReadTimer( HH, MM, SS );
2)		Getformat(T,D); SetFormat(-2,0);
2)		Datum(W) _ CvS(HH);
2)		SetFormat(T,D);
2)	    end;
2)	end;
2)	procedure HHMM$( String Itemvar W, R);		! Read-only * Time of day;
2)	begin
2)	    Integer T,D,HH,MM,SS;
2)	    If W neq any then begin
2)		ReadTimer( HH, MM, SS );
2)		Getformat(T,D); SetFormat(-2,0);
2)		Datum(W) _ CvS(HH) & CvS(MM);
2)		SetFormat(T,D);
2)	    end;
2)	end;
2)	procedure HHMMSS$( String Itemvar W, R);	! Read-only * Time of day;
2)	begin
2)	    Integer T,D,HH,MM,SS;
2)	    If W neq any then begin
2)		ReadTimer( HH, MM, SS );
2)		Getformat(T,D); SetFormat(-2,0);
2)		Datum(W) _ CvS(HH) & CvS(MM) & Cvs(SS);
2)		SetFormat(T,D);
2)	    end;
2)	end;
2)	procedure Logging$( String Itemvar W, R);
**************
1)9	procedure Month$( String Itemvar W, R);
****
2)9	procedure Minute$( String Itemvar W, R);	! Read-only * Time of day;
2)	begin
2)	    Integer T,D,HH,MM,SS;
2)	    If W neq any then begin
2)		ReadTimer( HH, MM, SS );
2)		Datum(W) _ CvS(MM);
2)	    end;
2)	end;
2)	procedure MMSS$( String Itemvar W, R);		! Read-only * Time of day;
2)	begin
2)	    Integer T,D,HH,MM,SS;
2)	    If W neq any then begin
2)		ReadTimer( HH, MM, SS );
File 1)	DSK:PCOM62.SAI	created: 1713 01-JUN-83
File 2)	DSK:PCOM63.SAI	created: 1923 01-JUL-83

2)		Getformat(T,D); SetFormat(-2,0);
2)		Datum(W) _ CvS(MM) & Cvs(SS);
2)		SetFormat(T,D);
2)	    end;
2)	end;
2)	procedure MM$( String Itemvar W, R);
2)	If W neq any then Datum( W ) _ DateString( 7 );
2)	procedure Mon$( String Itemvar W, R);
2)	If W neq any then Datum( W ) _ DateString( 2 )[1 for 3];
2)	procedure Month$( String Itemvar W, R);
**************
1)9	procedure Substitution$( String Itemvar W, R);
****
2)9	procedure Second$( String Itemvar W, R);	! Read-only * Time of day;
2)	begin
2)	    Integer T,D,HH,MM,SS;
2)	    If W neq any then begin
2)		ReadTimer( HH, MM, SS );
2)		Datum(W) _ CvS(SS);
2)	    end;
2)	end;
2)	procedure SS$( String Itemvar W, R);		! Read-only * Time of day;
2)	begin
2)	    Integer T,D,HH,MM,SS;
2)	    If W neq any then begin
2)		ReadTimer( HH, MM, SS );
2)		Getformat(T,D); SetFormat(-2,0);
2)		Datum(W) _ Cvs(SS);
2)		SetFormat(T,D);
2)	    end;
2)	end;
2)	procedure Substitution$( String Itemvar W, R);
**************
1)9	procedure Weekday$( String Itemvar W, R);
1)	If W neq any then Datum( W ) _ DateString( 4 );
1)	procedure Year$( String Itemvar W, R);
1)	If W neq any then Datum( W ) _ DateString( 3 );
1)	procedure ItemIni;			! Alphabetical;
****
2)9	procedure Tomorrow$( String Itemvar W, R);
2)	If W neq any then Datum( W ) _ DateString( 5 );
2)	procedure Weekday$( String Itemvar W, R);
2)	If W neq any then Datum( W ) _ DateString( 4 );
2)	procedure Yesterday$( String Itemvar W, R);
2)	If W neq any then Datum( W ) _ DateString( 6 );
2)	procedure Year$( String Itemvar W, R);
2)	If W neq any then Datum( W ) _ DateString( 3 );
2)	procedure YY$( String Itemvar W, R);
2)	If W neq any then Datum( W ) _ DateString( 3 )[3 for 2];
2)	procedure ItemIni;			! Alphabetical;
**************
1)9	    Assign( $Delimiter,  Delimiter$);	! Delimiter value;
1)	    Assign( $False,      False$);	! FALSE;
1)	    Assign( $Logging,    Logging$);	! If logging to file;
File 1)	DSK:PCOM62.SAI	created: 1713 01-JUN-83
File 2)	DSK:PCOM63.SAI	created: 1923 01-JUL-83

1)	    Assign( $Mail,       Mail$);	! If mail wanted at end;
1)	    Assign( $Month,      Month$);	! Current Month of year;
1)	    Assign( $Numerics,   Numerics$);	! If booleans are 1/0 or TRUE/FALSE;
1)	    Assign($Substitution,Substitution$);! If parameter substitutions on;
****
2)9	    Assign( $DD,         Day$);		! Current Day of Month;
2)	    Assign( $Delimiter,  Delimiter$);	! Delimiter value;
2)	    Assign( $False,      False$);	! FALSE;
2)	    Assign( $HH,         HH$);		! Current Hour of day 00-23;
2)	    Assign( $HHMM,       HHMM$);	! Current Hour-minutes hhmm;
2)	    Assign( $HHMMSS,     HHMMSS$);	! Current Hour-minutes-seconds;
2)	    Assign( $Hour,       Hour$);	! Current Hour of day 0-23;
2)	    Assign( $Logging,    Logging$);	! If logging to file;
2)	    Assign( $Mail,       Mail$);	! If mail wanted at end;
2)	    Assign( $Minute,     Minute$);	! Current Minutes of hour;
2)	    Assign( $Mon,        Mon$);		! Current Month as Mmm;
2)	    Assign( $Month,      Month$);	! Current Month of year;
2)	    Assign( $MM,         MM$);		! Current Month as numeric;
2)	    Assign( $MMSS,       MMSS$);	! Current Minutes-seconds;
2)	    Assign( $Numerics,   Numerics$);	! If booleans are 1/0 or TRUE/FALSE;
2)	    Assign( $Second      Second$);	! Current seconds of minute;
2)	    Assign( $SS,         SS$);		! Current seconds of minute SS;
2)	    Assign($Substitution,Substitution$);! If parameter substitutions on;
**************
1)9	end;
****
2)9	    Assign( $YY,         YY$);		! Current Year as two digits;
2)	end;
**************
    
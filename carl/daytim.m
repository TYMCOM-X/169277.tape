title daytim
subttl hack

	entry makdat,day,month,year,wday

	T1==13
	T2==14
	T3==15

MAKDAT:	DATE	T1,		; Get date
	IDIVI	T1,^D31		; Divide doing the DEC formula
	MOVEI	CL,1(T2)	; DATE 1-31
	MOVEM	CL,%DAY		; SAVE THE DAY
	IDIVI	T1,^D12		; GET MONTH
	MOVEM	T2,%MONTH	; SAVE MONTH
	MOVEI	CL,^D64(T1)	; GET THE YEAR
	MOVEM	CL,%YEAR	; SAVE YEAR
;NOW, COMPUTE THE DAY
;FORMULA IS:
;       %MONTH = MONTH INDEX (0-11)
;       %DAY   = DAY OF MONTH (1-28,30,31)
;       %YEAR  = YEAR
;	DAY ::= ( ((%YEAR-1) * 365) + Leap-days + Month-offset + %DAY) MOD 7
;...
        MOVE	T1,%YEAR	;GET YEAR
        MOVEI	T1,^D1899(T1)	; year + 1963 , not just '63
        IMULI	T1,^D365	; Convert to days
        MOVE	T2,%YEAR	; Add in LEAP-days
        MOVEI	T2,^D1900(T2)	;  (use right year)
        LSH	T2,-2		;  every 4 years
        ADD	T1,T2
        IDIVI	T2,^D25		;  but not every 100 years
        SUB	T1,T2
        LSH	T2,-2		;  except every 400 years
        ADD	T1,T2
        MOVE    T3,%MONTH       ;GET MONTH INDEX
        ADD	T1,[DEC 0,3,3,6,1,4,6,2,5,0,3,5](T3)
        ADD     T1,%DAY         ; Add in day
        SOJ	T1,		;   -1 (since %DAY is 1-31)
        MOVEI	T2,3		;LEAP-YEAR MASK (works until 2099)
	TDNN	T2,%YEAR	; If Leap year
	 CAIG	T3,1		;  and March-Dec
	  CAIA			;    --no-- skip
	 AOJ	T1,		;  then add an extra day
	IDIVI	T1,7		; MOD 7 leaves day of week in T2
;FORMULA DONE (OPTIMIZED, OF COURSE) .. TYPE OUT DATE
        POP     P,T3            ;GET T3 BACK.
        MOVE    T2,DAYTAB(T2)
        PUSHJ   P,OUTSIX        ;OUTPUT THE DAY
        MOVEI   CL," "
        PUSHJ   P,(T4)
        MOVE    T1,%DAY
        MOVEI   CL,"0"
        CAIG    T1,^D9
        PUSHJ   P,(T4)
        PUSHJ   P,DECPR ;OUTPUT DAY
        MOVEI   CL,"-"
        PUSHJ   P,(T4)
        MOVE    T2,%MONTH
        MOVE    T2,MONTAB(T2)   ;GET MONTH
        PUSHJ   P,OUTSIX
        MOVEI   CL,"-"
        PUSHJ   P,(T4)          ;MONTH OUT
        MOVE    T1,%YEAR
        PUSHJ   P,DECPR
        MOVEI   CL," "
        PUSHJ   P,(T4)
;NOW, OUTPUT THE TIME
  
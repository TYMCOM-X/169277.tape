:LOGFILE TXSMON.LOG
:PARAMETERS MONI=XD01
:$MAIL=$FALSE
RUN (MPL)MASQUE;M33
:COM MONED1 14
:COM MONED1 17
:COM MONED1 32

;The following are unused but reserved host numbers
;24,27,28,29,36,39,55,57,62,63,65,70,72,79,95,F3

R TELECO
REPLACE
(M33)14\MONI\.SAV,(M33:14)
(M33)17\MONI\.SAV,(M33:17)
(M33)32\MONI\.SAV,(M33:32)
QUIT
      
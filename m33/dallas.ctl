:LOGFILE DALLAS.LOG
:PARAMETERS MONI=035E
RUN (MPL)MASQUE;M33
:COM MONED1 23
:COM MONED1 25
:COM MONED1 31
:COM MONED1 34
:COM MONED1 35
:COM MONED1 37
:COM MONED1 54
:COM MONED1 56

R TELECOPY
REPLACE
(M33)23\MONI\.SAV,(M33:23)
(M33)25\MONI\.SAV,(M33:25)
(M33)31\MONI\.SAV,(M33:31)
(M33)34\MONI\.SAV,(M33:34)
(M33)35\MONI\.SAV,(M33:35)
(M33)37\MONI\.SAV,(M33:37)
(M33)54\MONI\.SAV,(M33:54)
(M33)56\MONI\.SAV,(M33:56)
QUIT
    
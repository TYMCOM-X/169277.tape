:LOGFILE PAKCOP.LOG
DAYTIME
DIRECT PAKCOP.MAC,PAKCP5.MAC,PAKCP3.MAC,PAKCPX.MAC
CTEST SETPROC MACRO=(FTSYS)MACRO
COMPILE EDDT=EDDT.MAC+DDT.MAC
LOAD /SAVE:PAKCOP %S            PAKCOP.MAC/COMPILE, %W EDDT.REL
LOAD /SAVE:PAKCP3 %S PAKCP3.MAC+PAKCOP.MAC/COMPILE, %W EDDT.REL
LOAD /SAVE:PAKCPX %S PAKCPX.MAC+PAKCOP.MAC/COMPILE, %W EDDT.REL
LOAD /SAVE:PAKCP5 %S PAKCP5.MAC+PAKCOP.MAC/CREF/COMPILE, %W EDDT.REL
CROSS
DELETE PAKCOP.REL
DIRECT PAKC??.*

   
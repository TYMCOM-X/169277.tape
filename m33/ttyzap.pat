 "\ Patch #6 for P035/D - TTYZAP.PAT  20-Apr-88 JMS \
 "\ Output INFO stopcode TTYZP1 when an unused port is hung, then send \
 "\ zapper without yellow ball.  This is to catch misbehaving programs on 39 \

ERRCON:
WHATJB/WHATJB:  WHATUU/WHATUU:
SCNSER:
PAT+0/PUSHJ P,NODIE
PAT+1/"/TTYZP1/
PAT+2/SETZ TTYZAP+4(S$INFO)
PAT+3/PAT+7
PAT+4/SKIPL T1,LDBLOG(U)
PAT+5/TTYZP1:XCT PAT+0
PAT+6/JRST TTYZAP+2
PAT+7/PUSHJ P,WHATJB
PAT+10/JRST WHATUU
TTYZAP+1/JRST PAT+4
TTYZAP+2/TLNN T1,LLLNLN
 "\ Always free up TTY chunks, especially lines being zapped. \
TSETBI+2/JFCL
PAT+11/PAT:
PATSIZ/PAT
COMMON:
PATMAP[Q+001000000000
   
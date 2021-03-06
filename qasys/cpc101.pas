(*$E+*)
(*******************************************************************
: **                  PROPRIETARY INFORMATION                     **
: **                                                              **
: **  This  source code listing constitutes the proprietary pro-  **
: **  perty of TYMNET.  The recipient, by receiving this program  **
: **  listing, agrees that neither this listing nor the informa-  **
: **  tion disclosed herein nor any part thereof shall be repro-  **
: **  duced or transferred to other documents or used or dis-     **
: **  closed to others for manufacturing or for any other purpose **
: **  except as specifically authorized in writing by TYMNET.     **
: ******************************************************************
: **                   PROGRAM IDENTIFICATION                     **
: **                                                              **
: **  Version Number     : 01.02         Release Date : 12/15/86  **
: **                                                              **
: **  File Name          : cpc101.pas                             **
: **                                                              **
: **  File Description   :                                        **
: **                                                              **
: **     This file contains a routine which reads a character     **
: **     from an ascii file and a routine which writes a          **
: **     character to an ascii file.                              **
: **                                                              **
: **  File Abstract      :                                        **
: **                                                              **
: ******************************************************************
: **                      MAINTENANCE HISTORY                     **
: **                                                              **
: **  Ver   Date    By   PIR/NSR         Reason for Change        **
: ** ----- -------- ---  -------- ------------------------------  **
: ** 01.02 12/15/86 PJH  1162     ADDITION OF PROPRIETARY BANNER  **
: **                                                              **
: ******************************************************************
: **                 SUBROUTINE IDENTIFICATION                    **
: **                                                              **
: **  Routine Abstract   : Rdchar                                 **
: **                                                              **
: **     Rdchar reads in a character (var parameter ch) from an   **
: **     ascii file (parameter f).                                **
: **                                                              **
: **  Parameters         :                                        **
: **                                                              **
: **     f  - pointer to a packed file of ascii                   **
: **                                                              **
: **     ch - ascii character (var parameter)                     **
: **                                                              **
: ******************************************************************
: **                                                              **
: **  Routine Abstract   : Wrchar                                 **
: **                                                              **
: **     Wrchar writes a character (parameter ch) to the ascii    **
: **     file (parameter f).                                      **
: **                                                              **
: **  Parameters         :                                        **
: **                                                              **
: **     f  - pointer to a packed file of ascii                   **
: **                                                              **
: **     ch - ascii character                                     **
: **                                                              **
: *****************************************************************)

(*$E+*)
program textio, rdchar, wrchar;

type
  goodfile = packed file of ascii;

procedure rdchar(var f: goodfile;  var ch: ascii);
begin
  if eof(f)
  then ch := em
  else
    begin
      ch := f^;
      get(f)
    end
end   (* rdchar *) ;

procedure wrchar(var f: goodfile;  ch: ascii);
begin
  f^ := ch; 
  put(f)
end   (* wrchar *) ;

begin end.
   
DAYTIME ;This file make sure that (TYMNET:34)NODES.MAP does not stay deleted
R TELECOPY
REPLACE
UPDATE
(TYMNET:17)NODES.MAP,(TYMNET:*)NODES.MAP
KEEP
(TYMNET:*)NODES.MAP,(TYMNET:34)NODES.MAP
QUIT
DECLAR ALL RD RD NODES.MAP
COPY (JMS)NODE95.CTL,(TYMNET)SAME
DIRECT (TYMNET)NODE##.*
    
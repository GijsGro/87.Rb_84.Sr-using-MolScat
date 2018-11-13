      module efvs
C  Copyright (C) 2018 J. M. Hutson & C. R. Le Sueur
C  Distributed under the GNU General Public License, version 3
      IMPLICIT NONE
      INTEGER, PARAMETER :: MAXEFV=10, LEFVN=20, LEFVU=6

C  DATA FOR EXTERNAL VARIABLES (FIELDS, ETC)
      INTEGER          :: NEFV, ISVEFV, MAPEFV, LISTFV(1:MAXEFV+1),
     1                    NNZRO, IEFVST, NEFVP

      DOUBLE PRECISION :: EFV(0:MAXEFV)

      CHARACTER(LEFVN) :: EFVNAM(0:MAXEFV), SVNAME
      CHARACTER(LEFVU) :: EFVUNT(0:MAXEFV), SVUNIT
C  REPLACES THIS COMMON BLOCK
C     COMMON /EXTNL / NEFV,ISVEFV,EFV,MAPEFV,
C    1                LISTFV,NNZRO,IEFVST,IEFVFN,
C    2                EFVNAM,EFVUNT
      end module efvs

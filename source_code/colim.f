      SUBROUTINE COLIM(A,NLA,NUA,TOL,N)
C  Copyright (C) 2018 J. M. Hutson & C. R. Le Sueur
C  Distributed under the GNU General Public License, version 3
C
C  COMPUTES LIMITS FOR BAND OF SIGNIFICANT ELEMENTS IN COLUMNS OF A
C
C  ON ENTRY: A IS ARRAY DIMENSION (N,N) (BUT INTERNALLY IS N*N);
C            TOL IS THE VALUE USING FOR TESTING ELEMENTS OF A AGAINST.
C  ON EXIT:  NLA IS ARRAY OF ADDRESSES OF FIRST LARGE ELEMENT;
C            NUA IS ARRAY OF ADDRESSES OF LAST LARGE ELEMENT.
      IMPLICIT DOUBLE PRECISION (A-H,O-Z)
      DIMENSION A(1),NLA(1),NUA(1)
C  FIND THE TOLERANCE LIMITS FOR THE TOPS(BEGINNINGS) OF THE
C  COLUMNS OF A
      NP1 = N + 1
      NM1 = N - 1
      LIMLO = 1
C  THIS LOOP IS OVER THE COLUMNS OF A
      DO 40 K=1,N
        LIMHI = LIMLO + NM1
C  THIS LOOP WORKS DOWN THE K-TH COLUMN AND FINDS THE FIRST ELEMENT
C  BIGGER THAN TOL
        DO 10 J=LIMLO,LIMHI
          IF (ABS(A(J)).LE.TOL) GOTO 10
          NLA(K) = J-LIMLO+1
          GOTO 20
10      CONTINUE
C  THIS IS REACHED ONLY IF ALL ELEMENTS IN THE K-TH COLUMN ARE TINY
        NLA(K) = N
        NUA(K) = 1
        GOTO 40
20      CONTINUE

C  FIND LIMITS FOR BOTTOMS OF COLUMNS
C  THIS LOOP WORKS UP THE K-TH COLUMN AND FINDS THE LAST ELEMENT BIGGER
C  THAN TOL
        DO 30 J=1,N
          IF (ABS(A(LIMHI)).LE.TOL) GOTO 30
          NUA(K) = NP1 - J
          GOTO 40
30        LIMHI = LIMHI - 1
40      LIMLO = LIMLO + N
      RETURN
      END
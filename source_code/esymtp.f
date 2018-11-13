      FUNCTION ESYMTP(J1,K1,J2,K2,LM,MU)
C  Copyright (C) 2018 J. M. Hutson & C. R. Le Sueur
C  Distributed under the GNU General Public License, version 3
C
C  THIS FUNCTION CALCULATES THE COUPLING COEFFICIENT FOR THE
C  EFFECTIVE POTENTIAL APPROXIMATION BETWEEN AN ATOM AND A NON-LINEAR
C  ROTOR (ITYP=5/6)
      IMPLICIT DOUBLE PRECISION (A-H,O-Z)
C  THIS IS 1/SQRT(4PI)
      DATA CON15/.282094791773878209D0/

      Z(X)=2.D0*X+1.D0

      ESYMTP=0.D0
      XJ1=J1
      XJ2=J2
      XK1=K1
      XK2=K2
      XLM=LM
      XMU=MU
      E=THRJ(XJ1,XLM,XJ2,-XK1,-XMU,XK2)
      IF (ABS(E).LE.1.D-8) RETURN
      ESYMTP=E*PARSGN((IABS(J2-J1)+J2+J1)/2-MU-K1)*
     &               CON15*SQRT(SQRT(Z(XJ1)*Z(XJ2)))
      RETURN
      END

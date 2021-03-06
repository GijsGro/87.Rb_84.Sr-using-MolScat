      SUBROUTINE PERTRB(R,P,NHAM,IDERIV)
C  Copyright (C) 2020 J. M. Hutson & C. R. Le Sueur
C  Distributed under the GNU General Public License, version 3
C
C  PERTRB IS USED BY BOUND BUT HAS NO SIGNIFICANT FUNCTION IN MOLSCAT
C  IT ADDS A PERTURBATION TO (ONE ELEMENT OF) THE ARRAY OF POTENTIAL
C  COEFFICIENTS, FOR USE IN CALCULATING EXPECTATION VALUES BY FINITE
C  DIFFERENCES (SEE J. M. HUTSON, CHEM. PHYS. LETT. 151, 565 (1988)).
C
C  THIS IS A GENERAL-PURPOSE VERSION OF PERTRB, WHICH CAN HANDLE
C  EXPECTATION VALUES OF ANGULAR TERMS TIMES INVERSE POWERS OF R,
C  AND EXTERNAL FIELD VARIABLES.
C  A USER-SUPPLIED ROUTINE CAN BE SUPPLIED TO HANDLE
C  MORE COMPLICATED PERTURBATIONS.
C
      IMPLICIT DOUBLE PRECISION (A-H,O-Z)
      DIMENSION P(NHAM)
      COMMON /EXPVAL/ I,IPOW,DELTAN

      IF (I.GT.0. AND. I.LE.NHAM) P(I)=P(I)+DELTAN/R**IPOW
C  LINE BELOW ONLY FOR SPECIAL CODE FOR FIELD GRADIENT AT NUCLEUS
C     IF (I.GT.100) P(1)=P(1)+DELTAN*P(I-100)
      RETURN
      END

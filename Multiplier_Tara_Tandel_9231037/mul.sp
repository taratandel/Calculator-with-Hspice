.INCLUDE "mosistsmc180.lib"

*--declaration----------------------------------

.param SUPPLY = 1.8, gnd = 0
.options post node 
.param lambada=180n

.global vdd gnd 

VDD Vdd Gnd 'SUPPLY'
*--circuits:------------------------------------------- 
.subckt and a b out3 
mp1 out3! a VDD VDD PMOS L='lambada' W='2*lambada'
mp2 out3! b VDD VDD PMOS L='lambada' W='2*lambada'

mn1 out3! a s s NMOS L='lambada' W='2*lambada'
mn2 s b gnd gnd NMOS L='lambada' W='2*lambada'

mp3 out3 out3! VDD VDD PMOS L='lambada' W='2*lambada'
mn3 out3 out3! gnd gnd NMOS L='lambada' W='2*lambada'
.ends


.subckt FA a b ci	s co
M1 x1 a vdd vdd pmos w=360n l=180n
M2 x1 b vdd vdd pmos w=360n l=180n
M3 x3 b vdd vdd pmos w=360n l=180n
M4 co! a x3 x3 pmos w=360n l=180n
M5 co! ci x1 x1 pmos w=360n l=180n


M6 co! ci x2 x2 nmos w=360n l=180n
M7 x2 a gnd gnd nmos w=360n l=180n
M8 x2 b gnd gnd nmos w=360n l=180n
M9 co! a x4 x4 nmos w=360n l=180n
M10 x4 b gnd gnd nmos  w=360n l=180n 


M11 x5 a vdd vdd pmos w=360n l=180n
M12 x5 b vdd vdd pmos w=360n l=180n
M13 x5 ci vdd vdd pmos w=360n l=180n
M14 s! co! x5 x5 pmos w=360n l=180n


M15 s! co! x6 x6 nmos w=360n l=180n
M16 x6 a gnd gnd nmos w=360n l=180n
M17 x6 b gnd gnd nmos w=360n l=180n
M18 x6 ci gnd gnd nmos w=360n l=180n


M19 co co! vdd vdd pmos w=360n l=180n


M20 co co! gnd gnd nmos w=360n l=180n


M21 x7 a vdd vdd pmos w=360n l=180n
M22 x8 b x7 x7 pmos w=360n l=180n
M23 s! ci x8 x8 pmos w=360n l=180n


M24 s! ci x9 x9 nmos w=360n l=180n
M25 x9 a x10 x10 nmos w=360n l=180n
M26 x10 b gnd gnd nmos w=360n l=180n


M27 s s! vdd vdd pmos w=360n l=180n


M28 s s! gnd gnd nmos w=360n l=180n


.ends

.subckt multiplier a0 a1 a2 a3 a4 x0 x1 x2 x3 x4 p0 p1 p2 p3 p4 p5 p6 p7 p8 p9
xand0 a0 x0 p0 and
xand1 a4 x0 n1 and
xand2 a3 x0 n2 and
xand3 a2 x0 n3 and
xand4 a1 x0 n4 and
xand5 a3 x1 n5 and
xand6 a2 x1 n6 and
xand7 a1 x1 n7 and
xand8 a0 x1 n8 and
xand9 a4 x1 n9 and
xand10 a3 x2 n10 and
xand11 a2 x2 n11 and
xand12 a1 x2 n12 and
xand13 a0 x2 n13 and
xand14 a4 x2 n14 and
xand15 a3 x3 n15 and
xand16 a2 x3 n16 and
xand17 a1 x3 n17 and
xand18 a0 x3 n18 and
xand19 a4 x3 n19 and
xand20 a3 x4 n20 and
xand21 a2 x4 n21 and
xand22 a1 x4 n22 and
xand23 a0 x4 n23 and
xand24 a4 x4 n24 and

XFA1 n5 n1 gnd s1 m1 FA
XFA2 n6 n2 gnd s2 m2 FA
XFA3 n7 n3 gnd s3 m3 FA
XFA4 n8 n4 gnd p1 m4 FA
XFA5 n10 n9 m1 s4 m5 FA
XFA6 n11 s1 m2 s5 m6 FA
XFA7 n12 s2 m3 s6 m7 FA
XFA8 n13 s3 m4 p2 m8 FA
XFA9 n15 n14 m5 s7 m9 FA
XFA10 n16 s4 m6 s8 m10 FA
XFA11 n17 s5 m7 s9 m11 FA
XFA12 n18 s6 m8 p3 m12 FA
XFA13 n20 n19 m9 s10 m13 FA
XFA14 n21 s7 m10 s11 m14 FA
XFA15 n22 s8 m11 s12 m15 FA
XFA16 n23 s9 m12 p4 m16 FA
XFA17 s12 m16 gnd p5 n25 FA
XFA18 s11 m15 n25 p6 n26 FA
XFA19 s10 m14 n26 p7 n27 FA
XFA20 n24 m13 n27 p8 p9 FA
.ends

***********************************************************************************
xmultiplier a0 a1 a2 a3 a4 x0 x1 x2 x3 x4 p0 p1 p2 p3 p4 p5 p6 p7 p8 p9 multiplier
***********************************************************************************

*------input-----------------
VA0 a0 gnd 0
VA1 a1 gnd 0
VA2 a2 gnd PULSE('SUPPLY' 0 0ps 100ps 8ns 16ns)
VA3 a3 gnd 0
VA4 a4 gnd 0

VX0 x0 gnd PULSE('SUPPLY' 0 0ps 100ps 8ns 16ns)
VX1 x1 gnd PULSE('SUPPLY' 0 0ps 100ps 8ns 16ns)
VX2 x2 gnd PULSE('SUPPLY' 0 0ps 100ps 8ns 16ns)
VX3 x3 gnd 0
VX4 x4 gnd 0
*--------------------------------------------

*********output************
.tran 10ps 64ns



.tran	10ps	16ns
.measure tpdr 		* rising propagation delay		
+ TRIG v(a4) VAL=0.9V RISE=1	
+ TARG v(p9) VAL=0.9V RISE=1
.measure tpdf		* falling propagation delay		
+ TRIG v(a4) VAL=0.9V FALL=1	
+ TARG v(p9) VAL=0.9V FALL=1
.measure tpd param='(tpdr+tpdf)/2'	 * average propagation delay	
.measure trise 		* rise time						
+ TRIG v(p9) VAL=0.36V RISE=1
+ TARG v(p9) VAL=1.44V RISE=1
.measure tfall 		* fall time						
+ TRIG v(p9) VAL=1.44V FALL=1
+ TARG v(p9) VAL=0.36V FALL=1
.measure charge INTEGRAL I(VDD) FROM=0ns TO=16ns
.measure energy param='-charge * 1.8'

************library***********

* T28M SPICE BSIM3 VERSION 3.1 PARAMETERS

*SPICE 3f5 Level 8, Star-HSPICE Level 49, UTMOST Level 8

* DATE: Oct  4/02
* LOT: T28M                  WAF: 6001
* Temperature_parameters=Default
.MODEL NMOS NMOS (                                LEVEL   = 49
+VERSION = 3.1            TNOM    = 27             TOX     = 4.1E-9
+XJ      = 1E-7           NCH     = 2.3549E17      VTH0    = 0.3832823
+K1      = 0.5915709      K2      = 2.432705E-3    K3      = 1E-3
+K3B     = 2.881708       W0      = 1E-7           NLX     = 1.556472E-7
+DVT0W   = 0              DVT1W   = 0              DVT2W   = 0
+DVT0    = 1.8671789      DVT1    = 0.5070952      DVT2    = -0.0135063
+U0      = 275.5555875    UA      = -1.150238E-9   UB      = 2.014145E-18
+UC      = 4.217107E-11   VSAT    = 1.002265E5     A0      = 1.900204
+AGS     = 0.4125379      B0      = -1.06835E-8    B1      = -1E-7
+KETA    = 2.505893E-4    A1      = 4.377095E-4    A2      = 0.9584318
+RDSW    = 105            PRWG    = 0.5            PRWB    = -0.2
+WR      = 1              WINT    = 9.458635E-9    LINT    = 1.257015E-8
+XL      = -2E-8          XW      = -1E-8          DWG     = -1.204617E-9
+DWB     = 9.664221E-9    VOFF    = -0.0946268     NFACTOR = 2.3761356
+CIT     = 0              CDSC    = 2.4E-4         CDSCD   = 0
+CDSCB   = 0              ETA0    = 1.375861E-3    ETAB    = 1.376595E-4
+DSUB    = 2.75603E-3     PCLM    = 0.8650201      PDIBLC1 = 0.2388154
+PDIBLC2 = 3.957307E-3    PDIBLCB = -0.1           DROUT   = 0.7285083
+PSCBE1  = 6.140394E10    PSCBE2  = 5.822994E-8    PVAG    = 0.1710916
+DELTA   = 0.01           RSH     = 6.7            MOBMOD  = 1
+PRT     = 0              UTE     = -1.5           KT1     = -0.11
+KT1L    = 0              KT2     = 0.022          UA1     = 4.31E-9
+UB1     = -7.61E-18      UC1     = -5.6E-11       AT      = 3.3E4
+WL      = 0              WLN     = 1              WW      = 0
+WWN     = 1              WWL     = 0              LL      = 0
+LLN     = 1              LW      = 0              LWN     = 1
+LWL     = 0              CAPMOD  = 2              XPART   = 0.5
+CGDO    = 7.32E-10       CGSO    = 7.32E-10       CGBO    = 1E-12
+CJ      = 9.775464E-4    PB      = 0.7224132      MJ      = 0.3611113
+CJSW    = 2.244809E-10   PBSW    = 0.7522727      MJSW    = 0.1
+CJSWG   = 3.3E-10        PBSWG   = 0.7522727      MJSWG   = 0.1
+CF      = 0              PVTH0   = -1.4684E-3     PRDSW   = -0.6888789
+PK2     = 8.530602E-4    WKETA   = 1.029979E-3    LKETA   = -9.473178E-3
+PU0     = -0.2034778     PUA     = -2.37215E-11   PUB     = 4.74506E-25
+PVSAT   = 901.6731904    PETA0   = 1E-4           PKETA   = 1.329782E-3     )
*
.MODEL PMOS PMOS (                                LEVEL   = 49
+VERSION = 3.1            TNOM    = 27             TOX     = 4.1E-9
+XJ      = 1E-7           NCH     = 4.1589E17      VTH0    = -0.4077986
+K1      = 0.581505       K2      = 0.0273445      K3      = 0
+K3B     = 10.7066855     W0      = 1E-6           NLX     = 7.085816E-8
+DVT0W   = 0              DVT1W   = 0              DVT2W   = 0
+DVT0    = 0.5427394      DVT1    = 0.3493763      DVT2    = 0.08174
+U0      = 116.6094811    UA      = 1.563897E-9    UB      = 1E-21
+UC      = -1E-10         VSAT    = 1.826166E5     A0      = 1.6423237
+AGS     = 0.3934878      B0      = 1.149554E-6    B1      = 3.508687E-6
+KETA    = 0.0146913      A1      = 0.4749659      A2      = 0.31182
+RDSW    = 309.921929     PRWG    = 0.5            PRWB    = -0.5
+WR      = 1              WINT    = 0              LINT    = 2.558214E-8
+XL      = -2E-8          XW      = -1E-8          DWG     = -2.004125E-8
+DWB     = 1.039815E-8    VOFF    = -0.1025445     NFACTOR = 1.9238833
+CIT     = 0              CDSC    = 2.4E-4         CDSCD   = 0
+CDSCB   = 0              ETA0    = 0.0276906      ETAB    = -0.0693376
+DSUB    = 0.6302703      PCLM    = 1.3245935      PDIBLC1 = 0
+PDIBLC2 = 0.0136588      PDIBLCB = -1E-3          DROUT   = 7.780261E-4
+PSCBE1  = 1.005282E10    PSCBE2  = 2.90349E-9     PVAG    = 3.2027144
+DELTA   = 0.01           RSH     = 7.5            MOBMOD  = 1
+PRT     = 0              UTE     = -1.5           KT1     = -0.11
+KT1L    = 0              KT2     = 0.022          UA1     = 4.31E-9
+UB1     = -7.61E-18      UC1     = -5.6E-11       AT      = 3.3E4
+WL      = 0              WLN     = 1              WW      = 0
+WWN     = 1              WWL     = 0              LL      = 0
+LLN     = 1              LW      = 0              LWN     = 1
+LWL     = 0              CAPMOD  = 2              XPART   = 0.5
+CGDO    = 6.57E-10       CGSO    = 6.57E-10       CGBO    = 1E-12
+CJ      = 1.18422E-3     PB      = 0.8552517      MJ      = 0.4131208
+CJSW    = 1.696634E-10   PBSW    = 0.6336557      MJSW    = 0.2424658
+CJSWG   = 4.22E-10       PBSWG   = 0.6336557      MJSWG   = 0.2424658
+CF      = 0              PVTH0   = 8.414026E-4    PRDSW   = 9.9222413
+PK2     = 1.47551E-3     WKETA   = 2.494855E-3    LKETA   = 5.87759E-3
+PU0     = -1.8432469     PUA     = -6.92569E-11   PUB     = 1E-21
+PVSAT   = 50             PETA0   = 1E-4           PKETA   = 2.230497E-3     )

*
.END
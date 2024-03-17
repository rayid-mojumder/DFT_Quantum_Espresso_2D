#!/bin/bash

NPP=4          #use -1 for no mpi

CRE_RLX=0
CRE_SCF=0
CRE_BAND_NSCF=0
CRE_BAND=0
CRE_DOS_NSCF=0
CRE_DOS=0
CRE_PROJWFC=0
CRE_PP_SCF=0
CRE_PP=0
CRE_VB_CB=0
CRE_PH=0
CRE_MD=1

PREFIX="Si+ZnI2_I_Phonon"
D_PREF="Si+ZnI2_I_Phonon"

D_INN="/home/nano3/Desktop/SAKIB/$D_PREF"
D_PSEUDO="/home/nano3/Desktop/SAKIB/Pseudo/ONCVPSP"
D_QEE="/home/nano3/Desktop/SAKIB/qe-6.5/bin"

# D_INN="/media/sakib05/D/MaTerials/WS/My_Rig_6/$D_PREF"
# D_INN="/home/a/$D_PREF"
# # D_INN="/media/sakib05/D/$D_PREF"
# D_PSEUDO="/media/sakib05/D/MaTerials/UbuntuFiles/Pseudo/ONCVPSP"
# D_QEE="/media/sakib05/D/MaTerials/Deb/qe-6.5/bin"

if [ ! -d "$PWD/$D_PREF" ]; then
    mkdir $PWD/$D_PREF
    mkdir $PWD/$D_PREF/OUT
fi

A=4.07556486
C=25
NAT=5
NTYP=3
ECUTW=45
ECUTRHO=250


ATOM_SPE="\
Si     28.0855     Si_ONCV_PBE_sr.upf
Zn     65.38       Zn_ONCV_PBE_sr.upf
I     126.9044     I_ONCV_PBE_sr.upf
"
ATOM_POS="\
I     2.0377824300   1.1765142400   -1.6330440584
Zn    0.0000000000   0.0000000000   -0.0005515448
I     0.0000000000   2.3530284700    1.6337755827
Si    0.0000000000   0.0000000000    5.4313200168
Si    0.0000000000   2.3530284690    5.7703672653
"
COORDINATE_TYPE="angstrom"       #angstrom or crystal

K_SCF="12  12  1  0 0 0"
K_BANDS="\
4
gG 20
M  20
K  20
gG 20
"
K_DOS="24  24  1  0 0 0"

#FOR CHARGE DENSITY CALCULATIONS ONLY

PP_A=8.15112972

NAT_h=20
NTYP_h=3

ATOM_POS_heter="\
I        2.0377824300    1.1765142400    8.6284203430
Zn       0.0000000000    0.0000000000   10.2555697110
I        0.0000000000    2.3530284700   11.8982258140
I        0.0000000000    4.7060569440    8.6284203430
Zn      -2.0377824300    3.5295427040   10.2555697110
I       -2.0377824300    5.8825711740   11.8982258140
I        6.1133472900    1.1765142400    8.6284203430
Zn       4.0755648600    0.0000000000   10.2555697110
I        4.0755648600    2.3530284700   11.8982258140
I        4.0755648600    4.7060569440    8.6284203430
Zn       2.0377824300    3.5295427040   10.2555697110
I        2.0377824300    5.8825711740   11.8982258140
Si       0.0000000000    0.0000000000   15.0231722480
Si       2.0377824300    1.1765142350   15.3964791460
Si      -2.0377824300    3.5295427040   15.0231722480
Si       0.0000000000    4.7060569390   15.3964791460
Si       4.0755648600    0.0000000000   15.0231722480
Si       6.1133472900    1.1765142350   15.3964791460
Si       2.0377824300    3.5295427040   15.0231722480
Si       4.0755648600    4.7060569390   15.3964791460
"
ATOM_SPE_heter="\
Zn     65.38       Zn_ONCV_PBE_sr.upf
I     126.9044     I_ONCV_PBE_sr.upf
Si     28.0855     Si_ONCV_PBE_sr.upf
"


PREFIX_1=Si_I
NAT_1=8
NTYP_1=1
ATOM_SPE_1="\
Si     28.0855     Si_ONCV_PBE_sr.upf
"
ATOM_POS_1="\
Si    0.0000000000    0.0000000000   15.4313200170
Si    0.0000000000    2.3530284690   15.7703672650
Si   -2.0377824300    3.5295427040   15.4313200170
Si   -2.0377824300    5.8825711730   15.7703672650
Si    4.0755648600    0.0000000000   15.4313200170
Si    4.0755648600    2.3530284690   15.7703672650
Si    2.0377824300    3.5295427040   15.4313200170
Si    2.0377824300    5.8825711730   15.7703672650
"

PREFIX_2=ZnI2_I
NAT_2=12
NTYP_2=2
ATOM_SPE_2="\
Zn     65.38       Zn_ONCV_PBE_sr.upf
I     126.9044     I_ONCV_PBE_sr.upf
"
ATOM_POS_2="\
I     2.0377824300    1.1765142400    8.3669559420
Zn    0.0000000000    0.0000000000    9.9994484550
I     0.0000000000    2.3530284700   11.6337755830
I     0.0000000000    4.7060569440    8.3669559420
Zn   -2.0377824300    3.5295427040    9.9994484550
I    -2.0377824300    5.8825711740   11.6337755830
I     6.1133472900    1.1765142400    8.3669559420
Zn    4.0755648600    0.0000000000    9.9994484550
I     4.0755648600    2.3530284700   11.6337755830
I     4.0755648600    4.7060569440    8.3669559420
Zn    2.0377824300    3.5295427040    9.9994484550
I     2.0377824300    5.8825711740   11.6337755830
"

KBAND_VB=
KBAND_CB=

# FOR PHONON ONLY

NQ1=4
NQ2=4
NQ3=1

Q_POINTS="\
4
 0.00000    0.00000    0.00000   20
 0.00000    0.50000    0.00000   20
 0.33333    0.33333    0.00000   20
 0.00000    0.00000    0.00000   20
"

# FOR MOLECULAR DYNAMICS ONLY

DT=20
NSTEP=100

##################################--STARTING--#########################################
#Script file creation
touch $PWD/$D_PREF/$PREFIX.script
cat > $PWD/$D_PREF/$PREFIX.script << EOF
#!/bin/sh
F_PREFIX=$PREFIX
F_PREFIX_1=$PREFIX_1
F_PREFIX_2=$PREFIX_2
D_IN="$D_INN"
D_OUT="$D_INN/OUT"
D_QE="$D_QEE"
NP="$NPP"

if [ ! -d "\$D_OUT" ]; then
    mkdir \$D_OUT
fi

echo "Started Simulation";
date
EOF

#SCF file creation
if [ $CRE_SCF == 1 ];then
touch $PWD/$D_PREF/$PREFIX.scf.in
cat > $PWD/$D_PREF/$PREFIX.scf.in <<EOF
&CONTROL
    calculation   = "scf"
    outdir        = "$D_INN/work/"
    prefix        = "$PREFIX"
    pseudo_dir    = "$D_PSEUDO"
    restart_mode  = "from_scratch"
    verbosity     = 'high'
/

&SYSTEM
    ibrav       =  4
    a           =  $A
    c           =  $C
    nat         =  $NAT
    ntyp        =  $NTYP
    input_dft   = 'PBE'
    ecutwfc     =  $ECUTW
    ecutrho     =  $ECUTRHO
    occupations = 'smearing'
    smearing    = 'mp'
    degauss     =  0.005
    vdw_corr	= 'DFT-D'
/

&ELECTRONS
    conv_thr         =  1.00000e-8
    mixing_beta      =  0.7
/

ATOMIC_SPECIES
$ATOM_SPE
ATOMIC_POSITIONS (angstrom)
$ATOM_POS
K_POINTS {automatic}
$K_SCF

EOF
if [ $NPP == -1 ];then
cat >> $PWD/$D_PREF/$PREFIX.script << EOF
\$D_QE/pw.x -i \$D_IN/\$F_PREFIX.scf.in > \$D_OUT/\$F_PREFIX.scf.out;
echo "SCF Completed";
date
EOF
else
cat >> $PWD/$D_PREF/$PREFIX.script << EOF
mpirun -np \$NP \$D_QE/pw.x -i \$D_IN/\$F_PREFIX.scf.in > \$D_OUT/\$F_PREFIX.scf.out;
echo "SCF Completed";
date
EOF
fi
fi

########################################################################################
#Band_nscf file creation
if [ $CRE_BAND_NSCF == 1 ];then
touch $PWD/$D_PREF/$PREFIX.band_nscf.in
cat > $PWD/$D_PREF/$PREFIX.band_nscf.in <<EOF
&CONTROL
    calculation   = "bands"
    outdir        = "$D_INN/work/"
    prefix        = "$PREFIX"
    pseudo_dir    = "$D_PSEUDO"
    restart_mode  = "from_scratch"
    verbosity     = "high"
/

&SYSTEM
    ibrav       =  4
    a           =  $A
    c           =  $C
    nat         =  $NAT
    ntyp        =  $NTYP
    input_dft   = 'PBE'
    ecutwfc     =  $ECUTW
    ecutrho     =  $ECUTRHO
    occupations = 'smearing'
    smearing    = 'mp'
    degauss     =  0.005
    vdw_corr	= 'DFT-D'
/

&ELECTRONS
    conv_thr         =  1.00000e-8
    mixing_beta      =  0.7
/

ATOMIC_SPECIES
$ATOM_SPE
ATOMIC_POSITIONS (angstrom)
$ATOM_POS
K_POINTS crystal_b
$K_BANDS

EOF
if [ $NPP == -1 ];then
cat >> $PWD/$D_PREF/$PREFIX.script << EOF
\$D_QE/pw.x -i \$D_IN/\$F_PREFIX.band_nscf.in > \$D_OUT/\$F_PREFIX.band_nscf.out;
echo "BAND_NSCF Completed";
date
EOF
else
cat >> $PWD/$D_PREF/$PREFIX.script << EOF
mpirun -np \$NP \$D_QE/pw.x -i \$D_IN/\$F_PREFIX.band_nscf.in > \$D_OUT/\$F_PREFIX.band_nscf.out;
echo "BAND_NSCF Completed";
date
EOF
fi
fi

########################################################################################
#Band file creation
if [ $CRE_BAND == 1 ];then
touch $PWD/$D_PREF/$PREFIX.band.in
cat > $PWD/$D_PREF/$PREFIX.band.in <<EOF
&BANDS
    outdir	= "$D_INN/work/",
    prefix	= "$PREFIX",
    filband	= "$D_INN/OUT/$PREFIX.band",
    lsym	= .true.
/
EOF
if [ $NPP == -1 ];then
cat >> $PWD/$D_PREF/$PREFIX.script << EOF
\$D_QE/bands.x -i \$D_IN/\$F_PREFIX.band.in > \$D_OUT/\$F_PREFIX.band.out;
echo "BAND Completed";
date
EOF
else
cat >> $PWD/$D_PREF/$PREFIX.script << EOF
mpirun -np \$NP \$D_QE/bands.x -i \$D_IN/\$F_PREFIX.band.in > \$D_OUT/\$F_PREFIX.band.out;
echo "BAND Completed";
date
EOF
fi
fi

########################################################################################
#DOS_nscf file creation
if [ $CRE_DOS_NSCF == 1 ];then
touch $PWD/$D_PREF/$PREFIX.dos_nscf.in
cat > $PWD/$D_PREF/$PREFIX.dos_nscf.in <<EOF
&CONTROL
    calculation   = "nscf"
    outdir        = "$D_INN/work/"
    prefix        = "$PREFIX"
    pseudo_dir    = "$D_PSEUDO"
    restart_mode  = "from_scratch"
    verbosity     = "high"
/

&SYSTEM
    ibrav       =  4
    a           =  $A
    c           =  $C
    nat         =  $NAT
    ntyp        =  $NTYP
    input_dft   = 'PBE'
    ecutwfc     =  $ECUTW
    ecutrho     =  $ECUTRHO
    occupations = 'tetrahedra'
    vdw_corr	= 'DFT-D'
/

&ELECTRONS
    conv_thr         =  1.00000e-8
    mixing_beta      =  0.7
/

ATOMIC_SPECIES
$ATOM_SPE
ATOMIC_POSITIONS (angstrom)
$ATOM_POS
K_POINTS {automatic}
$K_DOS

EOF
if [ $NPP == -1 ];then
cat >> $PWD/$D_PREF/$PREFIX.script << EOF
\$D_QE/pw.x -i \$D_IN/\$F_PREFIX.dos_nscf.in > \$D_OUT/\$F_PREFIX.dos_nscf.out;
echo "DOS_NSCF Completed";
date
EOF
else
cat >> $PWD/$D_PREF/$PREFIX.script << EOF
mpirun -np \$NP \$D_QE/pw.x -i \$D_IN/\$F_PREFIX.dos_nscf.in > \$D_OUT/\$F_PREFIX.dos_nscf.out;
echo "DOS_NSCF Completed";
date
EOF
fi
fi

########################################################################################
#DOS file creation
if [ $CRE_DOS == 1 ];then
touch $PWD/$D_PREF/$PREFIX.dos.in
cat > $PWD/$D_PREF/$PREFIX.dos.in <<EOF
&DOS
    outdir = "$D_INN/work/"
    prefix = "$PREFIX"
    fildos = "$D_INN/OUT/$PREFIX.dos"
/
EOF
if [ $NPP == -1 ];then
cat >> $PWD/$D_PREF/$PREFIX.script << EOF
\$D_QE/dos.x -i \$D_IN/\$F_PREFIX.dos.in > \$D_OUT/\$F_PREFIX.dos.out;
echo "DOS Completed";
date
EOF
else
cat >> $PWD/$D_PREF/$PREFIX.script << EOF
mpirun -np \$NP \$D_QE/dos.x -i \$D_IN/\$F_PREFIX.dos.in > \$D_OUT/\$F_PREFIX.dos.out;
echo "DOS Completed";
date
EOF
fi
fi

########################################################################################
#PROJWFC file creation
if [ $CRE_PROJWFC == 1 ];then
touch $PWD/$D_PREF/$PREFIX.projwfc.in
cat > $PWD/$D_PREF/$PREFIX.projwfc.in <<EOF
&PROJWFC
    outdir = "$D_INN/work/"
    prefix = "$PREFIX"
    filpdos = "$D_INN/OUT/$PREFIX"
/
EOF
if [ $NPP == -1 ];then
cat >> $PWD/$D_PREF/$PREFIX.script << EOF
\$D_QE/projwfc.x -i \$D_IN/\$F_PREFIX.projwfc.in > \$D_OUT/\$F_PREFIX.projwfc.out;
echo "PDOS Completed";
date
EOF
else
cat >> $PWD/$D_PREF/$PREFIX.script << EOF
mpirun -np \$NP \$D_QE/projwfc.x -i \$D_IN/\$F_PREFIX.projwfc.in > \$D_OUT/\$F_PREFIX.projwfc.out;
echo "PDOS Completed";
date
EOF
fi
fi

########################################################################################
#PP_scf file creation

if [[ $CRE_PP_SCF == 1 || $CRE_VB_CB == 1 ]];then
touch $PWD/$D_PREF/$PREFIX.pp_scf.in
cat > $PWD/$D_PREF/$PREFIX.pp_scf.in <<EOF
&CONTROL
    calculation   = "scf"
    outdir        = "$D_INN/work/"
    prefix        = "$PREFIX"
    pseudo_dir    = "$D_PSEUDO"
    restart_mode  = "from_scratch"
    verbosity     = 'high'
/

&SYSTEM
    ibrav       =  4
    a           =  $PP_A
    c           =  $C
    nat         =  $NAT_h
    ntyp        =  $NTYP_h
    input_dft   = 'PBE'
    ecutwfc     =  $ECUTW
    ecutrho     =  $ECUTRHO
    occupations = 'smearing'
    smearing    = 'mp'
    degauss     =  0.005
    vdw_corr    = 'DFT-D'
/

&ELECTRONS
    conv_thr         =  1.00000e-8
    mixing_beta      =  0.7
/

ATOMIC_SPECIES
$ATOM_SPE_heter
ATOMIC_POSITIONS (angstrom)
$ATOM_POS_heter
K_POINTS {automatic}
$K_SCF

EOF
if [ $NPP == -1 ];then
cat >> $PWD/$D_PREF/$PREFIX.script << EOF
\$D_QE/pw.x -i \$D_IN/\$F_PREFIX.pp_scf.in > \$D_OUT/\$F_PREFIX.pp_scf.out;
echo "PP SCF $PREFIX Completed";
date
EOF
else
cat >> $PWD/$D_PREF/$PREFIX.script << EOF
mpirun -np \$NP \$D_QE/pw.x -i \$D_IN/\$F_PREFIX.pp_scf.in > \$D_OUT/\$F_PREFIX.pp_scf.out;
echo "PP SCF $PREFIX Completed";
date
EOF
fi
fi

########################################################################################
#PP_scf_1 file creation

if [ $CRE_PP_SCF == 1 ];then
touch $PWD/$D_PREF/$PREFIX_1.pp_scf.in
cat > $PWD/$D_PREF/$PREFIX_1.pp_scf.in <<EOF
&CONTROL
    calculation   = "scf"
    outdir        = "$D_INN/work/"
    prefix        = "$PREFIX_1"
    pseudo_dir    = "$D_PSEUDO"
    restart_mode  = "from_scratch"
    verbosity     = 'high'
/

&SYSTEM
    ibrav       =  4
    a           =  $PP_A
    c           =  $C
    nat         =  $NAT_1
    ntyp        =  $NTYP_1
    input_dft   = 'PBE'
    ecutwfc     =  $ECUTW
    ecutrho     =  $ECUTRHO
    occupations = 'smearing'
    smearing    = 'mp'
    degauss     =  0.005
    vdw_corr    = 'DFT-D'
/

&ELECTRONS
    conv_thr         =  1.00000e-8
    mixing_beta      =  0.7
/

ATOMIC_SPECIES
$ATOM_SPE_1
ATOMIC_POSITIONS (angstrom)
$ATOM_POS_1
K_POINTS {automatic}
$K_SCF

EOF
if [ $NPP == -1 ];then
cat >> $PWD/$D_PREF/$PREFIX.script << EOF
\$D_QE/pw.x -i \$D_IN/\$F_PREFIX_1.pp_scf.in > \$D_OUT/\$F_PREFIX_1.pp_scf.out;
echo "PP SCF$PREFIX_1 Completed";
date
EOF
else
cat >> $PWD/$D_PREF/$PREFIX.script << EOF
mpirun -np \$NP \$D_QE/pw.x -i \$D_IN/\$F_PREFIX_1.pp_scf.in > \$D_OUT/\$F_PREFIX_1.pp_scf.out;
echo "PP SCF$PREFIX_1 Completed";
date
EOF
fi
fi

########################################################################################
#PP_scf_2 file creation

if [ $CRE_PP_SCF == 1 ];then
touch $PWD/$D_PREF/$PREFIX_2.pp_scf.in
cat > $PWD/$D_PREF/$PREFIX_2.pp_scf.in <<EOF
&CONTROL
    calculation   = "scf"
    outdir        = "$D_INN/work/"
    prefix        = "$PREFIX_2"
    pseudo_dir    = "$D_PSEUDO"
    restart_mode  = "from_scratch"
    verbosity     = 'high'
/

&SYSTEM
    ibrav       =  4
    a           =  $PP_A
    c           =  $C
    nat         =  $NAT_2
    ntyp        =  $NTYP_2
    input_dft   = 'PBE'
    ecutwfc     =  $ECUTW
    ecutrho     =  $ECUTRHO
    occupations = 'smearing'
    smearing    = 'mp'
    degauss     =  0.005
    vdw_corr    = 'DFT-D'
/

&ELECTRONS
    conv_thr         =  1.00000e-8
    mixing_beta      =  0.7
/

ATOMIC_SPECIES
$ATOM_SPE_2
ATOMIC_POSITIONS (angstrom)
$ATOM_POS_2
K_POINTS {automatic}
$K_SCF

EOF
if [ $NPP == -1 ];then
cat >> $PWD/$D_PREF/$PREFIX.script << EOF
\$D_QE/pw.x -i \$D_IN/\$F_PREFIX_2.pp_scf.in > \$D_OUT/\$F_PREFIX_2.pp_scf.out;
echo "PP SCF $PREFIX_2 Completed";
date
EOF
else
cat >> $PWD/$D_PREF/$PREFIX.script << EOF
mpirun -np \$NP \$D_QE/pw.x -i \$D_IN/\$F_PREFIX_2.pp_scf.in > \$D_OUT/\$F_PREFIX_2.pp_scf.out;
echo "PP SCF $PREFIX_2 Completed";
date
EOF
fi
fi

########################################################################################
#PP file creation

if [ $CRE_PP == 1 ];then
touch $PWD/$D_PREF/$PREFIX.pp.in
cat > $PWD/$D_PREF/$PREFIX.pp.in <<EOF
&INPUTPP
    prefix      = "$PREFIX"
    outdir      = "$D_INN/work/"
    plot_num    = 0
    filplot     = "$D_INN/OUT/$PREFIX.charge"
/
&PLOT
    iflag       = 3
    output_format = 6
    fileout     = "$D_INN/OUT/$PREFIX.cube"
/

EOF
if [ $NPP == -1 ];then
cat >> $PWD/$D_PREF/$PREFIX.script << EOF
\$D_QE/pp.x -i \$D_IN/\$F_PREFIX.pp.in > \$D_OUT/\$F_PREFIX.pp.out;
echo "$PREFIX PP Completed";
date
EOF
else
cat >> $PWD/$D_PREF/$PREFIX.script << EOF
mpirun -np \$NP \$D_QE/pp.x -i \$D_IN/\$F_PREFIX.pp.in > \$D_OUT/\$F_PREFIX.pp.out;
echo "$PREFIX PP Completed";
date
EOF
fi
fi


########################################################################################
#PP file creation 1

if [ $CRE_PP == 1 ];then
touch $PWD/$D_PREF/$PREFIX_1.pp.in
cat > $PWD/$D_PREF/$PREFIX_1.pp.in <<EOF
&INPUTPP
    prefix      = "$PREFIX_1"
    outdir      = "$D_INN/work/"
    plot_num    = 0
    filplot     = "$D_INN/OUT/$PREFIX_1.charge"
/
&PLOT
    iflag       = 3
    output_format = 6
    fileout     = "$D_INN/OUT/$PREFIX_1.cube"
/

EOF
if [ $NPP == -1 ];then
cat >> $PWD/$D_PREF/$PREFIX.script << EOF
\$D_QE/pp.x -i \$D_IN/\$F_PREFIX_1.pp.in > \$D_OUT/\$F_PREFIX_1.pp.out;
echo "$PREFIX_1 PP Completed";
date
EOF
else
cat >> $PWD/$D_PREF/$PREFIX.script << EOF
mpirun -np \$NP \$D_QE/pp.x -i \$D_IN/\$F_PREFIX_1.pp.in > \$D_OUT/\$F_PREFIX_1.pp.out;
echo "$PREFIX_1 PP Completed";
date
EOF
fi
fi


########################################################################################
#PP file creation 2

if [ $CRE_PP == 1 ];then
touch $PWD/$D_PREF/$PREFIX_2.pp.in
cat > $PWD/$D_PREF/$PREFIX_2.pp.in <<EOF
&INPUTPP
    prefix      = "$PREFIX_2"
    outdir      = "$D_INN/work/"
    plot_num    = 0
    filplot     = "$D_INN/OUT/$PREFIX_2.charge"
/
&PLOT
    iflag       = 3
    output_format = 6
    fileout     = "$D_INN/OUT/$PREFIX_2.cube"
/

EOF
if [ $NPP == -1 ];then
cat >> $PWD/$D_PREF/$PREFIX.script << EOF
\$D_QE/pp.x -i \$D_IN/\$F_PREFIX_2.pp.in > \$D_OUT/\$F_PREFIX_2.pp.out;
echo "$PREFIX_2 PP Completed";
date
EOF
else
cat >> $PWD/$D_PREF/$PREFIX.script << EOF
mpirun -np \$NP \$D_QE/pp.x -i \$D_IN/\$F_PREFIX_2.pp.in > \$D_OUT/\$F_PREFIX_2.pp.out;
echo "$PREFIX_2 PP Completed";
date
EOF
fi
fi

########################################################################################
#ChargeDiff file creation

if [ $CRE_PP == 1 ];then
touch $PWD/$D_PREF/$PREFIX.chdiff.in
cat > $PWD/$D_PREF/$PREFIX.chdiff.in <<EOF
&INPUTPP
/
&PLOT
    nfile       = 3
    filepp(1)   = "$D_INN/OUT/$PREFIX.charge", 
    filepp(2)   = "$D_INN/OUT/$PREFIX_1.charge", 
    filepp(3)   = "$D_INN/OUT/$PREFIX_2.charge", 
    weight(1)   = 1
    weight(2)   =-1
    weight(3)   =-1
    iflag       = 3
    output_format= 6
    fileout     = "$D_INN/OUT/${PREFIX}_chargediff.cube"
/

EOF
if [ $NPP == -1 ];then
cat >> $PWD/$D_PREF/$PREFIX.script << EOF
\$D_QE/pp.x -i \$D_IN/\$F_PREFIX.chdiff.in > \$D_OUT/\$F_PREFIX.chdiff.out;
echo "ChargeDiff Completed";
date
EOF
else
cat >> $PWD/$D_PREF/$PREFIX.script << EOF
mpirun -np \$NP \$D_QE/pp.x -i \$D_IN/\$F_PREFIX.chdiff.in > \$D_OUT/\$F_PREFIX.chdiff.out;
echo "ChargeDiff Completed";
date
EOF
fi
fi

########################################################################################
#VB CD file creation

if [ $CRE_VB_CB == 1 ];then
touch $PWD/$D_PREF/$PREFIX.vb_pp.in
cat > $PWD/$D_PREF/$PREFIX.vb_pp.in <<EOF
&INPUTPP
    prefix      = "$PREFIX"
    outdir      = "$D_INN/work/"
    plot_num    = 7
    kpoint      = 1
    kband       = $KBAND_VB
    filplot     = "$D_INN/OUT/${PREFIX}_VB.charge"
/
&PLOT
    iflag       = 3
    output_format = 6
    fileout     = "$D_INN/OUT/${PREFIX}_VB.cube"
/

EOF
if [ $NPP == -1 ];then
cat >> $PWD/$D_PREF/$PREFIX.script << EOF
\$D_QE/pp.x -i \$D_IN/\$F_PREFIX.vb_pp.in > \$D_OUT/\$F_PREFIX.vb_pp.out;
echo "$PREFIX VB CD Completed";
date
EOF
else
cat >> $PWD/$D_PREF/$PREFIX.script << EOF
mpirun -np \$NP \$D_QE/pp.x -i \$D_IN/\$F_PREFIX.vb_pp.in > \$D_OUT/\$F_PREFIX.vb_pp.out;
echo "$PREFIX VB CD Completed";
date
EOF
fi
fi

########################################################################################
#CB CD file creation

if [ $CRE_VB_CB == 1 ];then
touch $PWD/$D_PREF/$PREFIX.cb_pp.in
cat > $PWD/$D_PREF/$PREFIX.cb_pp.in <<EOF
&INPUTPP
    prefix      = "$PREFIX"
    outdir      = "$D_INN/work/"
    plot_num    = 7
    kpoint      = 1
    kband       = $KBAND_CB
    filplot     = "$D_INN/OUT/${PREFIX}_CB.charge"
/
&PLOT
    iflag       = 3
    output_format = 6
    fileout     = "$D_INN/OUT/${PREFIX}_CB.cube"
/

EOF
if [ $NPP == -1 ];then
cat >> $PWD/$D_PREF/$PREFIX.script << EOF
\$D_QE/pp.x -i \$D_IN/\$F_PREFIX.cb_pp.in > \$D_OUT/\$F_PREFIX.cb_pp.out;
echo "$PREFIX CB CD Completed";
date
EOF
else
cat >> $PWD/$D_PREF/$PREFIX.script << EOF
mpirun -np \$NP \$D_QE/pp.x -i \$D_IN/\$F_PREFIX.cb_pp.in > \$D_OUT/\$F_PREFIX.cb_pp.out;
echo "$PREFIX CB CD Completed";
date
EOF
fi
fi

########################################################################################
#RELAX file creation
if [ $CRE_RLX == 1 ];then
touch $PWD/$D_PREF/$PREFIX.relax.in
cat > $PWD/$D_PREF/$PREFIX.relax.in <<EOF
&CONTROL
    calculation   = "relax"
    outdir        = "$D_INN/work/"
    prefix        = "$PREFIX"
    pseudo_dir    = "$D_PSEUDO"
    restart_mode  = "from_scratch"
    verbosity     = 'high'
    nstep         =  500
/

&SYSTEM
    ibrav       =  4
    a           =  $A
    c           =  $C
    nat         =  $NAT
    ntyp        =  $NTYP
    input_dft   = 'PBE'
    ecutwfc     =  $ECUTW
    ecutrho     =  $ECUTRHO
    occupations = 'smearing'
    smearing    = 'mp'
    degauss     =  0.005
    vdw_corr    = 'DFT-D'
/

&ELECTRONS
    conv_thr         =  1.00000e-8
    mixing_beta      =  0.7
/

&IONS

/

ATOMIC_SPECIES
$ATOM_SPE
ATOMIC_POSITIONS ($COORDINATE_TYPE)
$ATOM_POS
K_POINTS {automatic}
$K_SCF

EOF
if [ $NPP == -1 ];then
cat >> $PWD/$D_PREF/$PREFIX.script << EOF
\$D_QE/pw.x -i \$D_IN/\$F_PREFIX.relax.in > \$D_OUT/\$F_PREFIX.relax.out;
echo "RELAX Completed";
date
EOF
else
cat >> $PWD/$D_PREF/$PREFIX.script << EOF
mpirun -np \$NP \$D_QE/pw.x -i \$D_IN/\$F_PREFIX.relax.in > \$D_OUT/\$F_PREFIX.relax.out;
echo "RELAX Completed";
date
EOF
fi
fi

########################################################################################
#PHONON DISPERSION file creation
if [ $CRE_PH == 1 ];then
touch $PWD/$D_PREF/$PREFIX.ph.disp.in
cat > $PWD/$D_PREF/$PREFIX.ph.disp.in <<EOF
&inputph
    prefix      = '$PREFIX'
    verbosity   = 'high'
    outdir      = '$D_INN/work/'
    fildyn      = '$D_INN/OUT/$PREFIX.disp.dyn'
    tr2_ph      =  1.0d-12
    ldisp       = .true.
    nq1         =  $NQ1
    nq2         =  $NQ2
    nq3         =  $NQ3
/
EOF

touch $PWD/$D_PREF/$PREFIX.q2r.in
cat > $PWD/$D_PREF/$PREFIX.q2r.in <<EOF
&input
    zasr    = 'simple'
    fildyn  = '$D_INN/OUT/$PREFIX.disp.dyn'
    flfrc   = '$D_INN/OUT/$PREFIX.fc'
    loto_2d = .true.
/
EOF


touch $PWD/$D_PREF/$PREFIX.matdyn.in
cat > $PWD/$D_PREF/$PREFIX.matdyn.in <<EOF
&input
    asr     = 'simple'
    flfrc   = '$D_INN/OUT/$PREFIX.fc'
    flfrq   = '$D_INN/OUT/$PREFIX.freq'
    loto_2d = .true.
    q_in_band_form   = .true.
    q_in_cryst_coord = .true.
/
$Q_POINTS

EOF
touch $PWD/$D_PREF/$PREFIX.plotband.in
cat > $PWD/$D_PREF/$PREFIX.plotband.in <<EOF
$D_INN/OUT/$PREFIX.freq
0 1650
$D_INN/OUT/$PREFIX.freq.disp.plot
$D_INN/OUT/$PREFIX.freq.disp.ps
0.0
50.0 0.0

EOF

if [ $NPP == -1 ];then
cat >> $PWD/$D_PREF/$PREFIX.script << EOF
\$D_QE/ph.x -i \$D_IN/\$F_PREFIX.ph.disp.in > \$D_OUT/\$F_PREFIX.ph.disp.out;
echo "PHONON Completed";
date
\$D_QE/q2r.x -i \$D_IN/\$F_PREFIX.q2r.in > \$D_OUT/\$F_PREFIX.q2r.out;
echo "Q2R Completed";
date
\$D_QE/matdyn.x -i \$D_IN/\$F_PREFIX.matdyn.in > \$D_OUT/\$F_PREFIX.matdyn.out;
echo "MATDYN Completed";
date
\$D_QE/plotband.x < \$D_IN/\$F_PREFIX.plotband.in > \$D_OUT/\$F_PREFIX.plotband.out;
echo "PLOT Completed";
date
EOF
else
cat >> $PWD/$D_PREF/$PREFIX.script << EOF
mpirun -np \$NP \$D_QE/ph.x -i \$D_IN/\$F_PREFIX.ph.disp.in > \$D_OUT/\$F_PREFIX.ph.disp.out;
echo "PHONON Completed";
date
mpirun -np \$NP \$D_QE/q2r.x -i \$D_IN/\$F_PREFIX.q2r.in > \$D_OUT/\$F_PREFIX.q2r.out;
echo "Q2R Completed";
date
\$D_QE/matdyn.x -i \$D_IN/\$F_PREFIX.matdyn.in > \$D_OUT/\$F_PREFIX.matdyn.out;
echo "MATDYN Completed";
date
\$D_QE/plotband.x < \$D_IN/\$F_PREFIX.plotband.in > \$D_OUT/\$F_PREFIX.plotband.out;
echo "PLOT Completed";
date
EOF
fi

fi

if [ $CRE_MD == 1 ];then
touch $PWD/$D_PREF/$PREFIX.md.in
cat > $PWD/$D_PREF/$PREFIX.md.in <<EOF
&CONTROL
    calculation   = "md"
    outdir        = "$D_INN/work/"
    prefix        = "$PREFIX"
    pseudo_dir    = "$D_PSEUDO"
    restart_mode  = "from_scratch"
    verbosity     = 'high'
    dt            =  $DT
    nstep         =  $NSTEP
/

&SYSTEM
    ibrav       =  4
    a           =  $A
    c           =  $C
    nat         =  $NAT
    ntyp        =  $NTYP
    input_dft   = 'PBE'
    ecutwfc     =  $ECUTW
    ecutrho     =  $ECUTRHO
    occupations = 'smearing'
    smearing    = 'mp'
    degauss     =  0.005
    vdw_corr    = 'DFT-D'
/

&ELECTRONS
    conv_thr         =  1.00000e-8
    mixing_beta      =  0.7
/

&IONS
    pot_extrapolation = 'second-order'
    wfc_extrapolation = 'second-order'
    ion_temperature   = 'initial'
    tempw             =  300
/

ATOMIC_SPECIES
$ATOM_SPE
ATOMIC_POSITIONS (angstrom)
$ATOM_POS
K_POINTS {automatic}
$K_SCF

EOF
if [ $NPP == -1 ];then
cat >> $PWD/$D_PREF/$PREFIX.script << EOF
\$D_QE/pw.x -i \$D_IN/\$F_PREFIX.md.in > \$D_OUT/\$F_PREFIX.md.out;
echo "MD Completed";
date
EOF
else
cat >> $PWD/$D_PREF/$PREFIX.script << EOF
mpirun -np \$NP \$D_QE/pw.x -i \$D_IN/\$F_PREFIX.md.in > \$D_OUT/\$F_PREFIX.md.out;
echo "MD Completed";
date
EOF
fi
fi

###################################--THE_END--##########################################


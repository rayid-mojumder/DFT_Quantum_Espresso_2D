#!/bin/bash

NPP=-1

PREFIX="gec+aln"
D_PREF="scf+band+dos+pdos+optic"

A=3.12
C=20
NAT=4
NTYP=4
ECUTW=50
ECUTRHO=500

ATOM_SPE="\
Al 26.982  Al_ONCV_PBE_sr.upf
N  14.0067  N_ONCV_PBE_sr.upf
Ge 72.6400  Ge_ONCV_PBE_sr.upf
C  12.0107  C_ONCV_PBE_sr.upf
"

K_SCF="12  12  1  0 0 0"
K_BANDS="\
4
0.50000000 0.00000000 0.00000000 20 !M
0.00000000 0.00000000 0.00000000 20 !G
0.33333333 0.33333333 0.00000000 20 !K
0.50000000 0.00000000 0.00000000 20 !M
"

D_INN="/media/rayid/thesis-mount/A-Sheraj-Sir/Solar-cell-materials/GeC+AlN/$D_PREF"
D_PSEUDO="/media/rayid/thesis-mount/q-e-qe-6.5/bin/pseudo-oncv/"
D_QEE="/media/rayid/thesis-mount/q-e-qe-6.5/bin/"

# D_INN="/mnt/h/SAKIB/store/$D_PREF"
# D_PSEUDO="/mnt/h/SAKIB/pseudo/"
# D_QEE="/media/sakib_05/G4M35/MaTerials/UbuntuFiles/qe-6.3/bin"

if [ ! -d "$PWD/$D_PREF" ]; then
    mkdir $PWD/$D_PREF
    mkdir $PWD/$D_PREF/OUT
fi

touch $PWD/$D_PREF/${PREFIX}.script
cat > $PWD/$D_PREF/${PREFIX}.script << EOF
#!/bin/sh
F_PREFIX=${PREFIX}
D_IN="$D_INN"
D_OUT="$D_INN/OUT"
D_QE="$D_QEE"
NP="$NPP"

if [ ! -d "\$D_OUT" ]; then
    mkdir \$D_OUT
fi

echo "Started scf+band+dos+pdos+optic"

EOF

#SCF file creation

ATOM_POS="\
Al            0.0000000000        0.0000000000        0.0003358672
N             0.0000000000        1.8013328400       -0.0003483485
Ge            0.0000000000        0.0000000000        4.0594483773
C             0.0000000000        1.8013328400        4.0605641040
"
# YOU CAN COPY FROM HERE
#   $Z_VAL_1
#   $Z_VAL_2

##################################--STARTING--#########################################
#make the script file
if [ $NPP == -1 ];then
cat >> $PWD/$D_PREF/${PREFIX}.script << EOF
\$D_QE/pw.x -i \$D_IN/${PREFIX}.scf.in > \$D_OUT/${PREFIX}.scf.out;
echo "Completed >> ${PREFIX} scf";
\$D_QE/pw.x -i \$D_IN/${PREFIX}.b-nscf.in > \$D_OUT/${PREFIX}.b-nscf.out;
echo "Completed >> ${PREFIX} b-nscf";
\$D_QE/bands.x -i \$D_IN/${PREFIX}.band.in > \$D_OUT/${PREFIX}.band.out;
echo "Completed >> ${PREFIX} band";
\$D_QE/plotband.x -i \$D_IN/OUT/${PREFIX}.plotband.in > \$D_OUT/OUT/${PREFIX}.plotband.out;
echo "Completed >> ${PREFIX} band";
\$D_QE/pw.x -i \$D_IN/${PREFIX}.d-nscf.in > \$D_OUT/${PREFIX}.d-nscf.out;
echo "Completed >> ${PREFIX} d-nscf";
\$D_QE/dos.x -i \$D_IN/${PREFIX}.dos.in > \$D_OUT/${PREFIX}.dos.out;
echo "Completed >> ${PREFIX} dos";
\$D_QE/projwfc.x -i \$D_IN/${PREFIX}.pdos.in > \$D_OUT/${PREFIX}.pdos.out;
echo "Completed >> ${PREFIX} projwfc";
\$D_QE/pw.x -i \$D_IN/${PREFIX}.scf-o.in > \$D_OUT/${PREFIX}.scf-o.out;
echo "Completed >> ${PREFIX} scf";
\$D_QE/epsilon.x -i \$D_IN/${PREFIX}.jdos.in > \$D_OUT/${PREFIX}.jdos.out;
echo "Completed >> ${PREFIX} jdos";
\$D_QE/epsilon.x -i \$D_IN/${PREFIX}.spectra.in > \$D_OUT/${PREFIX}.spectra.out;
echo "Completed >> ${PREFIX} spectra";
EOF
else
cat >> $PWD/$D_PREF/${PREFIX}.script << EOF
mpirun -np \$NP \$D_QE/pw.x -i \$D_IN/${PREFIX}.scf.in > \$D_OUT/${PREFIX}.scf.out;
echo "Completed >> $Z_VAL Ang";
EOF
fi

#######################
#scf
touch $PWD/$D_PREF/${PREFIX}.scf.in
cat > $PWD/$D_PREF/${PREFIX}.scf.in <<EOF
&CONTROL
    calculation   = "scf"
    outdir        = "$D_INN/work/"
    prefix        = "${PREFIX}"
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
    smearing    = 'm-p'
    degauss     =  0.0005
    vdw_corr    = 'grimme-d3'
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

#######################
#band=nscf
touch $PWD/$D_PREF/${PREFIX}.b-nscf.in
cat > $PWD/$D_PREF/${PREFIX}.b-nscf.in <<EOF
&CONTROL
    calculation   = "bands"
    outdir        = "$D_INN/work/"
    prefix        = "${PREFIX}"
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
    smearing    = 'm-p'
    degauss     =  0.0005
    vdw_corr    = 'grimme-d3'
/

&ELECTRONS
    conv_thr         =  1.00000e-8
    mixing_beta      =  0.7
/

ATOMIC_SPECIES
$ATOM_SPE
ATOMIC_POSITIONS (angstrom)
$ATOM_POS
K_POINTS {crystal_b}
4
0.50000000 0.00000000 0.00000000 20 !M
0.00000000 0.00000000 0.00000000 20 !G
0.33333333 0.33333333 0.00000000 20 !K
0.50000000 0.00000000 0.00000000 20 !M

EOF

#######################
#band
touch $PWD/$D_PREF/${PREFIX}.band.in
cat > $PWD/$D_PREF/${PREFIX}.band.in <<EOF
&bands
    outdir        = "$D_INN/work/"
    prefix        = "${PREFIX}"
	filband		  = '${PREFIX}.band'
	lsym		  =.true.
/

EOF

#######################
#plotband
touch $PWD/$D_PREF/OUT/${PREFIX}.plotband.in
cat > $PWD/$D_PREF/OUT/${PREFIX}.plotband.in <<EOF
$D_INN/OUT/${PREFIX}.band
-5.0 0.0
$D_INN/OUT/${PREFIX}.band.dat
$D_INN/OUT/${PREFIX}.band.ps
-3.0246
1.0  -3.0246
 

EOF

#######################
#######################
#d-mscf
touch $PWD/$D_PREF/${PREFIX}.d-nscf.in
cat > $PWD/$D_PREF/${PREFIX}.d-nscf.in <<EOF
&CONTROL
    calculation   = "nscf"
    outdir        = "$D_INN/work/"
    prefix        = "${PREFIX}"
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
    occupations = 'tetrahedra'
    smearing    = 'm-p'
    degauss     =  0.0005
    vdw_corr    = 'grimme-d3'
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
22  22  1  0 0 0

EOF

#######################
#dos
touch $PWD/$D_PREF/${PREFIX}.dos.in
cat > $PWD/$D_PREF/${PREFIX}.dos.in <<EOF
&dos
    outdir        = "$D_INN/work/"
    prefix        = "${PREFIX}"
	fildos        ='${PREFIX}.dos',
/
EOF

#######################
#pdos
touch $PWD/$D_PREF/${PREFIX}.pdos.in
cat > $PWD/$D_PREF/${PREFIX}.pdos.in <<EOF
&projwfc
    outdir        = "$D_INN/work/"
    prefix        = "${PREFIX}"
    ngauss 		  = 1
/

EOF

#######################
#scf
touch $PWD/$D_PREF/${PREFIX}.scf-o.in
cat > $PWD/$D_PREF/${PREFIX}.scf-o.in <<EOF
&CONTROL
    calculation   = "scf"
    outdir        = "$D_INN/work/"
    prefix        = "${PREFIX}"
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
    smearing    = 'm-p'
    degauss     =  0.0005
    vdw_corr    = 'grimme-d3'
/

&ELECTRONS
    conv_thr         =  1.00000e-8
    mixing_beta      =  0.7
/

ATOMIC_SPECIES
$ATOM_SPE
ATOMIC_POSITIONS (angstrom)
$ATOM_POS
K_POINTS {crystal_b}
4
0.50000000 0.00000000 0.00000000 20 !M
0.00000000 0.00000000 0.00000000 20 !G
0.33333333 0.33333333 0.00000000 20 !K
0.50000000 0.00000000 0.00000000 20 !M

EOF

#######################

#######################
#jdos
touch $PWD/$D_PREF/${PREFIX}.jdos.in
cat > $PWD/$D_PREF/${PREFIX}.jdos.in <<EOF
&INPUTPP
    calculation   = 'jdos'
    outdir        = "$D_INN/work/"
    prefix        = "${PREFIX}"
/
&ENERGY_GRID
smeartype     = 'gauss'
intersmear    = 0.15
intrasmear    = 0.0 
wmax          = 50
wmin          = 0
nw            = 600
shift         = 0
/

EOF

#######################
#epsilon
touch $PWD/$D_PREF/${PREFIX}.spectra.in
cat > $PWD/$D_PREF/${PREFIX}.spectra.in <<EOF
&INPUTPP
    calculation   = 'eps'
    outdir        = "$D_INN/work/"
    prefix        = "${PREFIX}"
/
&ENERGY_GRID
smeartype     = 'gauss'
intersmear    = 0.15
intrasmear    = 0.0 
wmax          = 50
wmin          = 0
nw            = 600
shift         = 0
/

EOF
############################
########################################################################################
#Band_nscf file creation

# NEW_VAL=\$(grep ! $D_INN/OUT/${PREFIX}_$Z_VAL.scf.out)
# OLD_VAL=\$(grep ! $D_INN/OUT/${PREFIX}_$Z_VAL_OLD.scf.out)
# if [[ \$NEW_VAL < \$OLD_VAL ]]; then
#     exit
# fi

# EOF

 

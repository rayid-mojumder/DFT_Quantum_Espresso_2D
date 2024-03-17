#!/bin/bash

NPP=-1

PREFIX="gapalp_"
D_PREF="gapalp_I"
Z_START_VAL=4.29
Z_STOP_VAL=4.31
INCREM=0.02
BUCKLING=0.392

A=3.95
C=20
NAT=4
NTYP=3
ECUTW=50
ECUTRHO=500

ATOM_SPE="\
Al 26.982  Al_ONCV_PBE_sr.upf
P  30.974  P_ONCV_PBE_sr.upf
Ga 69.723  Ga_ONCV_PBE_sr.upf
"

K_SCF="12  12  1  0 0 0"
K_BANDS="\
4
0.50000000 0.00000000 0.00000000 20 !M
0.00000000 0.00000000 0.00000000 20 !G
0.33333333 0.33333333 0.00000000 20 !K
0.50000000 0.00000000 0.00000000 20 !M
"

Z_VAL_1=$Z_START_VAL
Z_VAL_2=$(calc $Z_START_VAL+$BUCKLING)

D_INN="/media/rayid/thesis-mount/A-Sheraj-Sir/Solar-cell-materials/GaP+AlP/$D_PREF"
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

echo "Started Band vs ID Calculation for ${PREFIX}"

EOF

#SCF file creation
for Z_VAL in $(seq $Z_START_VAL $INCREM $Z_STOP_VAL)
do
Z_VAL_1=$Z_VAL
Z_VAL_2=$(calc $Z_VAL+$BUCKLING | awk {'print $1'})

ATOM_POS="\
Al            0.0000000000        0.0000000000        0.000000
P             0.0000000000        2.2805335630        0.000000
Ga            0.0000000000        0.0000000000        $Z_VAL_1
P             0.0000000000        2.2805335630        $Z_VAL_2
"
# YOU CAN COPY FROM HERE
#   $Z_VAL_1
#   $Z_VAL_2


##################################--STARTING--#########################################
touch $PWD/$D_PREF/${PREFIX}_$Z_VAL.scf.in
cat > $PWD/$D_PREF/${PREFIX}_$Z_VAL.scf.in <<EOF
&CONTROL
    calculation   = "scf"
    outdir        = "$D_INN/work/"
    prefix        = "${PREFIX}_$Z_VAL"
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

Z_VAL_OLD=$(calc $Z_VAL-$INCREM)

if [ $NPP == -1 ];then
cat >> $PWD/$D_PREF/${PREFIX}.script << EOF
\$D_QE/pw.x -i \$D_IN/${PREFIX}_$Z_VAL.scf.in > \$D_OUT/${PREFIX}_$Z_VAL.scf.out;
echo "Completed >> $Z_VAL Ang";
EOF
else
cat >> $PWD/$D_PREF/${PREFIX}.script << EOF
mpirun -np \$NP \$D_QE/pw.x -i \$D_IN/${PREFIX}_$Z_VAL.scf.in > \$D_OUT/${PREFIX}_$Z_VAL.scf.out;
echo "Completed >> $Z_VAL Ang";
EOF
fi

########################################################################################
#Band_nscf file creation

# NEW_VAL=\$(grep ! $D_INN/OUT/${PREFIX}_$Z_VAL.scf.out)
# OLD_VAL=\$(grep ! $D_INN/OUT/${PREFIX}_$Z_VAL_OLD.scf.out)
# if [[ \$NEW_VAL < \$OLD_VAL ]]; then
#     exit
# fi

# EOF
done

 

# self-consistent calculation
cat > h2.scf.in << EOF
&control
calculation = 'scf'
prefix='h2',
tstress = .true.
tprnfor = .true.
pseudo_dir = './pseudo/',
outdir='./work/'
/
&system
ibrav = 4,
a=12.24,
c=20,
nat = 50,
ntyp = 3,
ecutwfc = 30.0,
ecutrho = 120.0,
occupations = 'smearing'
smearing = 'm-p'
degauss = 0.006
input_dft='pbe'
vdw_corr='grimme-d2'
/
&electrons
mixing_beta = 0.7
conv_thr = 1.0d-4
/
ATOMIC_SPECIES
Ge 72.59  Ge.pbe-mt_fhi.UPF
C 12.0107 C.pbe-mt_fhi.UPF
Si 28.0855 Si.pbe-mt_fhi.UPF
ATOMIC_POSITIONS {angstrom}
Ge      0.000000000   0.000000000   3.225
Ge      0.000000000   2.355600000   3.897
Ge     -2.040000000   3.533383647   3.225
Ge     -2.040000000   5.888983647   3.897
Ge     -4.080000000   7.066767294   3.225
Ge     -4.080000000   9.422367294   3.897
Ge      4.080000000   0.000000000   3.225
Ge      4.080000000   2.355600000   3.897
Ge      2.040000000   3.533383647   3.225
Ge      2.040000000   5.888983647   3.897
Ge      0.000000000   7.066767294   3.225
Ge      0.000000000   9.422367294   3.897
Ge      8.160000000   0.000000000   3.225
Ge      8.160000000   2.355600000   3.897
Ge      6.120000000   3.533383647   3.225
Ge      6.120000000   5.888983647   3.897
Ge      4.080000000   7.066767294   3.225
Ge      4.080000000   9.422367294   3.897
C       0.000000000   0.000000000   0.000000000
Si      0.000000000   1.766700000   0.000000000
C      -1.530000000   2.650037736   0.000000000
Si     -1.530000000   4.416737736   0.000000000
C      -3.060000000   5.300075472   0.000000000
Si     -3.060000000   7.066775472   0.000000000
C      -4.590000000   7.950113208   0.000000000
Si     -4.590000000   9.716813208   0.000000000
C       3.060000000   0.000000000   0.000000000
Si      3.060000000   1.766700000   0.000000000
C       1.530000000   2.650037736   0.000000000
Si      1.530000000   4.416737736   0.000000000
C       0.000000000   5.300075472   0.000000000
Si      0.000000000   7.066775472   0.000000000
C      -1.530000000   7.950113208   0.000000000
Si     -1.530000000   9.716813208   0.000000000
C       6.120000000   0.000000000   0.000000000
Si      6.120000000   1.766700000   0.000000000
C       4.590000000   2.650037736   0.000000000
Si      4.590000000   4.416737736   0.000000000
C       3.060000000   5.300075472   0.000000000
Si      3.060000000   7.066775472   0.000000000
C       1.530000000   7.950113208   0.000000000
Si      1.530000000   9.716813208   0.000000000
C       9.180000000   0.000000000   0.000000000
Si      9.180000000   1.766700000   0.000000000
C       7.650000000   2.650037736   0.000000000
Si      7.650000000   4.416737736   0.000000000
C       6.120000000   5.300075472   0.000000000
Si      6.120000000   7.066775472   0.000000000
C       4.590000000   7.950113208   0.000000000
Si      4.590000000   9.716813208   0.000000000

K_POINTS {automatic}
3 3 1 0 0 0

EOF
echo "  running the scf calculation for gesic stuc2..."
#$PW_COMMAND < gealp.scf.in > gealp.scf.out
./pw.x< h2.scf.in > h2.scf.out
#check_failure $?
echo " done"


# band structure calculation (Gamma-M-K-Gamma in the 2D Brillouin zone)
cat > h2.b-nscf.in << EOF
&control
calculation = 'bands'
prefix='h2',
tstress = .true.
tprnfor = .true.
pseudo_dir = './pseudo/',
outdir='./work/'
/
&system
ibrav = 4,
a=12.24,
c=20,
nat = 50,
ntyp = 3,
ecutwfc = 30.0,
ecutrho = 120.0,
occupations = 'smearing'
smearing = 'm-p'
degauss = 0.006
input_dft='pbe'
vdw_corr='grimme-d2'
/
&electrons
mixing_beta = 0.7
conv_thr = 1.0d-4
/
ATOMIC_SPECIES
Ge 72.59  Ge.pbe-mt_fhi.UPF
C 12.0107 C.pbe-mt_fhi.UPF
Si 28.0855 Si.pbe-mt_fhi.UPF
ATOMIC_POSITIONS {angstrom}
Ge      0.000000000   0.000000000   3.225
Ge      0.000000000   2.355600000   3.897
Ge     -2.040000000   3.533383647   3.225
Ge     -2.040000000   5.888983647   3.897
Ge     -4.080000000   7.066767294   3.225
Ge     -4.080000000   9.422367294   3.897
Ge      4.080000000   0.000000000   3.225
Ge      4.080000000   2.355600000   3.897
Ge      2.040000000   3.533383647   3.225
Ge      2.040000000   5.888983647   3.897
Ge      0.000000000   7.066767294   3.225
Ge      0.000000000   9.422367294   3.897
Ge      8.160000000   0.000000000   3.225
Ge      8.160000000   2.355600000   3.897
Ge      6.120000000   3.533383647   3.225
Ge      6.120000000   5.888983647   3.897
Ge      4.080000000   7.066767294   3.225
Ge      4.080000000   9.422367294   3.897
C       0.000000000   0.000000000   0.000000000
Si      0.000000000   1.766700000   0.000000000
C      -1.530000000   2.650037736   0.000000000
Si     -1.530000000   4.416737736   0.000000000
C      -3.060000000   5.300075472   0.000000000
Si     -3.060000000   7.066775472   0.000000000
C      -4.590000000   7.950113208   0.000000000
Si     -4.590000000   9.716813208   0.000000000
C       3.060000000   0.000000000   0.000000000
Si      3.060000000   1.766700000   0.000000000
C       1.530000000   2.650037736   0.000000000
Si      1.530000000   4.416737736   0.000000000
C       0.000000000   5.300075472   0.000000000
Si      0.000000000   7.066775472   0.000000000
C      -1.530000000   7.950113208   0.000000000
Si     -1.530000000   9.716813208   0.000000000
C       6.120000000   0.000000000   0.000000000
Si      6.120000000   1.766700000   0.000000000
C       4.590000000   2.650037736   0.000000000
Si      4.590000000   4.416737736   0.000000000
C       3.060000000   5.300075472   0.000000000
Si      3.060000000   7.066775472   0.000000000
C       1.530000000   7.950113208   0.000000000
Si      1.530000000   9.716813208   0.000000000
C       9.180000000   0.000000000   0.000000000
Si      9.180000000   1.766700000   0.000000000
C       7.650000000   2.650037736   0.000000000
Si      7.650000000   4.416737736   0.000000000
C       6.120000000   5.300075472   0.000000000
Si      6.120000000   7.066775472   0.000000000
C       4.590000000   7.950113208   0.000000000
Si      4.590000000   9.716813208   0.000000000

K_POINTS {crystal_b}
4
  0.0000000  0.5000000  0.0000000  20 !M
  0.3333333  0.3333333  0.0000000  20 !k
  0.0000000  0.0000000  0.0000000  20 !G
  0.0000000  0.5000000  0.0000000  20 !M

EOF
echo "  running the band-structure calculation for gesic stuc2..."
./pw.x < h2.b-nscf.in > h2.b-nscf.out
#check_failure $?
echo " done"

# K-resolved PDOS calculation (Gamma-M-K-Gamma computed above)
cat > h2.kpdos.in << EOF
 &projwfc
    outdir="./work/"
    prefix='h2'
    ngauss=0, degauss=0.006
    DeltaE=0.01
    kresolveddos=.true.
    filpdos='h2.k'
 /
EOF
echo "  running k-resolved PDOS calculation for gesic stuc2..."
#$PROJWFC_COMMAND < gealp.kpdos.in > gealp.kpdos.out
./projwfc.x < h2.kpdos.in > h2.kpdos.out
#check_failure $?
echo " done"

# Extract the projected bands from the stdout of projwfc.x
# Including atomic states from 1-4 (s,pz,px,py of Si atom#1)
awk -v firststate=1 -v laststate=4 -v ef=-0.6821 -f ./projwfc_to_bands.awk h2.kpdos.out > h2.projbands

#
#  if gnuplot was found, the results are plotted
#
#if [ "$GP_COMMAND" = "" ]; then
#    break
#else
cat > h2.gnuplot <<EOF
#!$GP_COMMAND
#
set term png enh size 700,500
set out 'h2.projbands.png'
set xtics ("M" 0.0000,"{/Symbol G}" 0.5774,"K" 1.2440,"M" 1.5774)
set grid xtics
set xra [0:1.57735]
set yra [-12:5]
set ylabel "E - E_F (eV)"
set xzeroaxis
set key opaque box width 1.0
set style fill solid noborder
#radius(proj)=sqrt(proj)/40.
radius(proj)=proj/30.
p 'h2.projbands'  u 2:3:(radius($5+$7+$8)) w circles lc rgb "green" t "{/Symbol s}", 'h2.projbands' u 2:3:(radius($6)) w circles lc rgb "orange" t "{/Symbol p}"

EOF
#$echo
#$echo "  plotting projected band structure ...\c"
#$GP_COMMAND < gealp.gnuplot
#$echo " done"
#fi


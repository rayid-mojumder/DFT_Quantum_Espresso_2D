###########################
# 
name="'GeCAlN'"
nam1="'GeCAlN.dyn'"
nam2="'GeCAlN.fc'"
nam3="'GeCAlN.freq'"
nam4="GeCAlN.freq"
input_1="GeCAlN.scf.in"
input_2="GeCAlN.ph.in"
input_3="GeCAlN.q2r.in"
input_4="GeCAlN.matdyn.in"
input_5="GeCAlN.plotband.in"
output_1="GeCAlN.scf.out"
output_2="GeCAlN.ph.out"
output_3="GeCAlN.q2r.out"
output_4="GeCAlN.matdyn.out"
output_5="GeCAlN.plotband.out"
cut_wfc=50
cut_rho=500
scf_thres=1.0d-10
phn_thres=1.0d-18
mass1=26.982 
mass2=14.0067
mass3=72.6400
mass4=12.0107
n=4
q=4
out="'./work-solar/'"
pseudo_pot="C.pbe-mt_fhi.UPF"
dir="/media/rayid/thesis-mount/THESIS_SOFTs/q-e-qe-6.5/bin/"
#############################################
# scf file preparation

cat >> ${input_1} << EOF
&CONTROL
    calculation   = "scf"
    outdir        = $out
    prefix        = "GeCAlN",
    pseudo_dir    = "./pseudo-oncv/",
    restart_mode  = "from_scratch",
    verbosity     = 'high',
!   wf_collect    = .false.
/

&SYSTEM
    ibrav       =  4
    a           =  3.12
    c           =  20
    nat         =  4
    ntyp        =  4
    input_dft   = 'PBE'
    ecutwfc     =  $cut_wfc
    ecutwfc     =  $cut_rho
	occupations ='fixed'
    smearing    = 'mp'
    degauss     =  0.0005
    vdw_corr    = 'grimme-d2'
!	assume_isolated = '2D',
/

&ELECTRONS
    conv_thr         =  $scf_thres
    mixing_beta      =  0.7
/

ATOMIC_SPECIES
Al 26.982  Al_ONCV_PBE_sr.upf
N  14.0067  N_ONCV_PBE_sr.upf
Ge 72.6400  Ge_ONCV_PBE_sr.upf
C  12.0107  C_ONCV_PBE_sr.upf

ATOMIC_POSITIONS (angstrom)
Al            0.0000000000        0.0000000000        0.0003358672
N             0.0000000000        1.8013328400       -0.0003483485
Ge            0.0000000000        0.0000000000        4.0594483773
C             0.0000000000        1.8013328400        4.0605641040

K_POINTS {automatic}
$n $n 1  0 0 0

EOF

$dir/pw.x < ${input_1} > ${output_1}
################################################
# phonon input file
cat >> ${input_2} << EOF
phonons on a Gid
&inputph
    outdir    = $out   
    prefix    = $name
    verbosity = 'high'
    ldisp     = .true.
    fildyn    = $nam1
    nq1       = $q
    nq2       = $q
    nq3       = 1
    tr2_ph    = $phn_thres
/

EOF

$dir/ph.x < ${input_2} > ${output_2}
################################################
# q2r input file

cat >> ${input_3} << EOF
&input
    fildyn    = $nam1
    zasr      = 'simple'
    flfrc     = $nam2
!	loto_2d	  = .true.
/

EOF
$dir/q2r.x < ${input_3} > ${output_3}
################################################
# matdyn input file
cat >> ${input_4} << EOF
&input
    asr       = 'simple'
!   amass(1)  = $mass1
    flfrc     = $nam2
    flfrq     = $nam3
    q_in_band_form   = .true.
    q_in_cryst_coord = .true.
!   loto_2d = .true.
/
4
 0.00000    0.00000    0.00000   20
 0.00000    0.50000    0.00000   20
 0.33333    0.33333    0.00000   20
 0.00000    0.00000    0.00000   20

EOF
$dir/matdyn.x < ${input_4} > ${output_4}
################################################
# matdyn input file
cat >> ${input_5} << EOF
$nam4
-30 1630
$nam4.disp.plot
$nam4.disp.ps
-2.6761
50.0 0.0

EOF

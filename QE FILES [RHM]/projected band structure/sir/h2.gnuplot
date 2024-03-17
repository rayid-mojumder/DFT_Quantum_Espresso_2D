#!
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
p 'h2.projbands'  u 2:3:(radius(++)) w circles lc rgb "green" t "{/Symbol s}", 'h2.projbands' u 2:3:(radius()) w circles lc rgb "orange" t "{/Symbol p}"


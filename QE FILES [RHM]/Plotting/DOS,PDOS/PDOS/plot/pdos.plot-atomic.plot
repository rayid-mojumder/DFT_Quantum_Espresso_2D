#!/usr/bin/gnuplot -persist

reset
set term pngcairo
set output "struc-2-pdos-atomic.png"
set terminal png enhanced size 800,600   font 'Times-Bold,25'
set ylabel 'PDOS (Electrons/eV)' offset 2
set xrange [-1:1]
set yrange [0:100]
f=-0.689
set key at -0.0,95 font 'Times-Bold,20' #outside #left top
plot 'gesic2.pdos_tot' using ($1-f):2 w l lw 1.4 lc 'black' title 'Pattern-II','ge_tot' w l lw 3 lc 'red' title 'Ge','c_tot' w l lw 1.6 title 'C','si_tot' w l lw 1.5 title 'Si','fermi' w l lw 2 lt 0 lc "dark-green" title 'Fermi level'





 

#!/usr/bin/gnuplot -persist

reset
set term pngcairo
set output "struc-2-pdos-orbital.png"
set terminal png enhanced size 800,600   font 'Times-Bold,25'
set ylabel 'PDOS (Electrons/eV)' offset 2
set xrange [-1:1]
set yrange [0:100]
set key at -0.0,95 font 'Times-Bold,20' #outside #left top
plot 'total_gesic' using 1:2 w l lw 2 title 'Total','ge_s' w l lw 2.5 lc 0 title 'Ge-S','ge_p' w l lw 3 lc 'red' title 'Ge-P','ge_d' w l lw 2 title 'Ge-D','c_s' w l lw 2 title 'C-S','c_p' w l lw 2 title 'C-P','c_d' w l lw 2 lt 0 lc 10 title 'C-D','si_s' w l lw 2 title 'Si-S','si_p' w l lw 2 lt 0 lc 'violet'title 'Si-P','si_d' w l lw 2 lt 0 lc 'green' title 'Si-D','fermi' w l lw 2 lt 0 lc "dark-green" title 'Fermi Level'





 

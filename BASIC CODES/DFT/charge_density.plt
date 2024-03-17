#!/usr/local/bin/gnuplot -persist

# Last modified: 2014/02/20 20:33

set terminal postscript eps enhanced color 28 lw 2
set output "charge.eps"

set pm3d map
set size square 
unset xtics 
unset ytics 

set cbtics 0.1 
set cbrange [0:0.35]
set palette rgbformulae 33,13,10

splot 'charge.xsf'
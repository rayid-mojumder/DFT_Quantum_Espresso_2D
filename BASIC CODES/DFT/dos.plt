
#!/usr/local/bin/gnuplot -persist

# Last modified: 2014/01/03 02:33

set terminal postscript eps enhanced 28 lw 2
set output "dos.eps"

set ylabel 'DOS (states/spin/eV)'
set y2label 'Integrated DOS'
set xlabel 'Energy (eV)'

xmin = -5
xmax = 5
set xrange [xmin:xmax]
set yrange [0.0:1.2]
set y2range [6.0:10]
set y2tics 6.0,0.5,10

unset key

set arrow 1 head from -3.0,0.8 to -4.0,0.8 lt 2 lc 1
set arrow 2 head from 3.0,0.8 to 4.0,0.8 lt 2 lc 2

plot 'graphene.dos' using ($1+0.174):2 w l lc 1, 'graphene.dos' using 1:3 axes x1y2 w l lc 2
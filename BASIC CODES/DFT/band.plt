
#!/usr/local/bin/gnuplot -persist

# Last modified: 2014/01/03 02:33

set terminal postscript eps enhanced 28 lw 2
set output "band.eps"

set ylabel 'Energy (eV)'
set xtics ("{/Symbol G}" 0, "K" 0.666666, "M" 1, "{/Symbol G}" 1.5773)

set ytics 5
ymin=-20
ymax=6
set xrange [0:1.5773]
set yrange [ymin:ymax]

unset key

set arrow 1 nohead from 0.66666,ymin to 0.66666,ymax lt 2
set arrow 2 nohead from 1,ymin to 1,ymax lt 2
 
plot 'graphene.band.gnu' using 1:2 w l
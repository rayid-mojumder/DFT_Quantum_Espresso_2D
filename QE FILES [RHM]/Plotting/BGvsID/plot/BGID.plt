reset
set term pngcairo 
set output 'BGvsId-3.6.png'
set terminal png enhanced size 800,600   font 'Times-Bold,25'
set xrange [2.8:3.6] 
set yrange [0:130] 
set ytics 0,30,130
set xtics 2.8,0.2,3.6
set xlabel 'Interlayer Distance (A^o)' offset 0,-0.1 font 'Times-Bold,25'
set ylabel 'Band Gap (meV)' offset 1 font 'Times-Bold,25'
set key at 3.6,120 #outside #left top
plot 'struc-1-plot' w lp lw 2 pt 7 ps 3 lc 7 title 'Pattern-I','eff.hole-1' w p pt 7 ps 2 lc 7 notitle,'struc-2-plot' w lp lw 2 pt 7 ps 3 lc 14 title 'Pattern-II','struc-2-plot' w p pt 7 ps 2 lc 14 notitle,'struc-3-plot' w lp lw 2 pt 7 ps 3 lc 1 title 'Pattern-III','struc-3-plot' w p pt 7 ps 2 lc 1 notitle


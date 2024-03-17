reset
set term pngcairo 
set output 'BGvsId-3.6-hole.png'
set terminal png enhanced size 800,600   font 'Times-Bold,25'
set xrange [3.0:3.6] 
set yrange [-0.04:-0.0045] 
set xlabel 'Interlayer Distance (A^o)' offset 0,-0.1 font 'Times-Bold,25'
set ylabel 'Effective Mass, m_h^*(m_0)' offset 1 font 'Times-Bold,25'
set ytics -0.035,0.01,-0.005
set xtics 2.8,0.2,3.6
set title font 'Times,25'
set key at 3.58,-0.015 #outside #left top
plot 'eff.hole-1' w lp lw 2 pt 7 ps 3 lc 7 title 'Pattern-I','eff.hole-1' w p pt 7 ps 2 lc 7 notitle,'eff.hole-2' w lp lw 2 pt 7 ps 3 lc 14 title 'Pattern-II','eff.hole-2' w p pt 7 ps 2 lc 14 notitle,'eff.hole-3' w lp lw 2 pt 7 ps 3 lc 1 title 'Pattern-III','eff.hole-3' w p pt 7 ps 2 lc 1 notitle
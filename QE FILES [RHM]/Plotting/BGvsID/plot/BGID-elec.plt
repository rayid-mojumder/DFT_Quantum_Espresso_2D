reset
set term pngcairo 
set output 'BGvsId-3.6-elec.png'
set terminal png enhanced size 800,600   font 'Times-Bold,25'
set xrange [3.0:3.6] 
set yrange [0.008:0.018] 
set xlabel 'Interlayer Distance (A^o)' offset 0,-0.1 font 'Times-Bold,25'
set ylabel 'Effective Mass, m_e^*(m_0)' offset 1 font 'Times-Bold,24'
set ytics 0.008,0.003,0.018
set xtics 2.8,0.2,3.6
set title font 'Times,25'
set key at 3.6,0.0155 #outside #left top
plot 'eff.electron-1' w lp lw 2 pt 7 ps 3 lc 7 title 'Pattern-I','eff.electron-1' w p pt 7 ps 2 lc 7 notitle,'eff.electron-2' w lp lw 2 pt 7 ps 3 lc 14 title 'Pattern-II','eff.electron-2' w p pt 7 ps 2 lc 14 notitle,'eff.electron-3' w lp lw 2 pt 7 ps 3 lc 1 title 'Pattern-III','eff.electron-3' w p pt 7 ps 2 lc 1 notitle
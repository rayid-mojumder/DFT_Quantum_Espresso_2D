

#unset ztics
#unset key
#unset colorbox

set xzeroaxis
set key opaque box width 1.0 font 'Times-Bold,18'

######################################################################################################################


#!/usr/bin/gnuplot -persist
reset
set term pngcairo
#set output 'gealp-proj-band.png'
set output 'total.png'
set terminal png enhanced size 800,700    
#
set arrow from 0.5774,-2 to 0.5774,2 nohead lt 1 lc 'light-gray' lw 1
set arrow from 1.2440,-2 to 1.2440,2 nohead lt 1 lc 'light-gray' lw 1
set arrow from 0,0 to 1.5774,0 nohead lt 0 lc 'dark-gray' lw 2
#
set xrange[1:61] 
set xtics ("M" 1,"G" 21,"K" 41,"M" 61) offset 0,-0.5 font 'Times-Bold,25'

set yrange[-2:2]
set ytics (-2,-1,0,1,2) offset 0,-0.1 font 'Times-Bold,25'
set ylabel "E - E_F (eV)" offset 0,-0.1 font 'Times-Bold,25'
##############################################################################
#!/usr/bin/gnuplot -persist
reset
set term pngcairo
#set output 'gealp-proj-band.png'
set output 'total.png'
set terminal png enhanced size 800,700   
set yrange[-2:2]
set xrange[1:61] 
radius(proj)=sqrt(proj)/50.
#radius(proj)=proj/25.
unset xtics
unset ytics
set arrow from 21,-2 to 21,2 nohead lt 1 lc 'light-gray' lw 1
set arrow from 41,-2 to 41,2 nohead lt 1 lc 'light-gray' lw 1
set arrow from 0,0 to 61,0 nohead lt 0 lc 'dark-gray' lw 2
ef = -0.6821
set key font 'Times-Bold,18'
set pm3d
set view 0,0
#f(z)=z**(0.5) 
radius(proj)=sqrt(proj)/40.
splot 'h2.k.pdos_atm#50(Si)_wfc#2(p)' u 1:($2-ef):(radius($3)) w pm3d t "Si-p"

##########################################################################################

'h2.k.pdos_atm#1(Ge)_wfc#2(p)' u 1:($2-ef):(radius($3)) w pm3d t "Ge-p"

,
'h2.k.pdos_atm#19(C)_wfc#1(s)' u 1:($2-ef):(radius($3)) w pm3d t "C-s", 
, 'gealp.k.pdos_atm#3(Ge)_wfc#2(s)' u 1:($2-ef):(radius($3)) w circles lc rgb "orange" notitle, 'gealp.k.pdos_atm#4(Ge)_wfc#3(p)' u 1:($2-ef):(radius($3)) w circles lc rgb "red" t "Ge-p", 'gealp.k.pdos_atm#3(Ge)_wfc#3(p)' u 1:($2-ef):(radius($3)) w circles lc rgb "red" notitle

, 'gealp.k.pdos_atm#4(Ge)_wfc#1(d)' u 1:($2-ef):(radius($3)) w circles lc rgb "pink" t "Ge-d", 'gealp.k.pdos_atm#3(Ge)_wfc#1(d)' u 1:($2-ef):(radius($3)) w circles lc rgb "pink" notitle, 'gealp.k.pdos_atm#2(Al)_wfc#1(s)' u 1:($2-ef):(radius($3)) w circles lc rgb "brown" t 'Al-s', 'gealp.k.pdos_atm#2(Al)_wfc#2(p)' u 1:($2-ef):(radius($3)) w circles lc rgb "blue" t 'Al-p', 
'gealp.k.pdos_atm#1(P)_wfc#1(s)' u 1:($2-ef):(radius($3)) w circles lc rgb "green" t 'P-s', 'gealp.k.pdos_atm#1(P)_wfc#2(p)' u 1:($2-ef):(radius($3)) w circles lc rgb "violet" t 'P-p'


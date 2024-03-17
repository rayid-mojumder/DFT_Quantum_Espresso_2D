#!/usr/bin/gnuplot -persist

reset
set term pngcairo
set output "gesic2-6.pdos.png"
set yrange [0 :  10]
set xrange [-5 : 2]
set ylabel lw 3  'States (States/eV)'
set xlabel lw 3  'Energy E-E_F (eV)'
set arrow from 0,0 to 0,25 nohead dt "-" lc 0 lw 1.5
FE = -0.6631
plot \
'./gesic2.pdos_atm#1(Ge)_wfc#1(s)' using ($1-FE):2 w l lw 3  lc "green" title "Ge-s",\
'./gesic2.pdos_atm#1(Ge)_wfc#2(p)' using ($1-FE):2 w l lw 3  lc "red" title "Ge-p",\
'./gesic2.pdos_atm#1(Ge)_wfc#3(d)' using ($1-FE):2 w l lw 3  lc "khaki" title "Ge-d",\
'./gesic2.pdos_atm#1(Ge)_wfc#4(f)' using ($1-FE):2 w l lw 3  lc "violet" title "Ge-f",\
'./gesic2.pdos_atm#2(Ge)_wfc#1(s)' using ($1-FE):2 w l lw 3  lc "green" notitle,\
'./gesic2.pdos_atm#2(Ge)_wfc#2(p)' using ($1-FE):2 w l lw 3  lc "red" notitle,\
'./gesic2.pdos_atm#2(Ge)_wfc#3(d)' using ($1-FE):2 w l lw 3  lc "khaki" notitle,\
'./gesic2.pdos_atm#2(Ge)_wfc#4(f)' using ($1-FE):2 w l lw 3  lc "violet" notitle,\
'./gesic2.pdos_atm#3(Ge)_wfc#1(s)' using ($1-FE):2 w l lw 3  lc "green" notitle,\
'./gesic2.pdos_atm#3(Ge)_wfc#2(p)' using ($1-FE):2 w l lw 3  lc "red" notitle,\
'./gesic2.pdos_atm#3(Ge)_wfc#3(d)' using ($1-FE):2 w l lw 3  lc "khaki" notitle,\
'./gesic2.pdos_atm#3(Ge)_wfc#4(f)' using ($1-FE):2 w l lw 3  lc "violet" notitle,\
'./gesic2.pdos_atm#4(Ge)_wfc#1(s)' using ($1-FE):2 w l lw 3  lc "green" notitle,\
'./gesic2.pdos_atm#4(Ge)_wfc#2(p)' using ($1-FE):2 w l lw 3  lc "red" notitle,\
'./gesic2.pdos_atm#4(Ge)_wfc#3(d)' using ($1-FE):2 w l lw 3  lc "khaki" notitle,\
'./gesic2.pdos_atm#4(Ge)_wfc#4(f)' using ($1-FE):2 w l lw 3  lc "violet" notitle,\
'./gesic2.pdos_atm#5(Ge)_wfc#1(s)' using ($1-FE):2 w l lw 3  lc "green" notitle,\
'./gesic2.pdos_atm#5(Ge)_wfc#2(p)' using ($1-FE):2 w l lw 3  lc "red" notitle,\
'./gesic2.pdos_atm#5(Ge)_wfc#3(d)' using ($1-FE):2 w l lw 3  lc "khaki" notitle,\
'./gesic2.pdos_atm#5(Ge)_wfc#4(f)' using ($1-FE):2 w l lw 3  lc "violet" notitle,\
'./gesic2.pdos_atm#6(Ge)_wfc#1(s)' using ($1-FE):2 w l lw 3  lc "green" notitle,\
'./gesic2.pdos_atm#6(Ge)_wfc#2(p)' using ($1-FE):2 w l lw 3  lc "red" notitle,\
'./gesic2.pdos_atm#6(Ge)_wfc#3(d)' using ($1-FE):2 w l lw 3  lc "khaki" notitle,\
'./gesic2.pdos_atm#6(Ge)_wfc#4(f)' using ($1-FE):2 w l lw 3  lc "violet" notitle,\
'./gesic2.pdos_atm#7(Ge)_wfc#1(s)' using ($1-FE):2 w l lw 3  lc "green" notitle,\
'./gesic2.pdos_atm#7(Ge)_wfc#2(p)' using ($1-FE):2 w l lw 3  lc "red" notitle,\
'./gesic2.pdos_atm#7(Ge)_wfc#3(d)' using ($1-FE):2 w l lw 3  lc "khaki" notitle,\
'./gesic2.pdos_atm#7(Ge)_wfc#4(f)' using ($1-FE):2 w l lw 3  lc "violet" notitle,\
'./gesic2.pdos_atm#8(Ge)_wfc#1(s)' using ($1-FE):2 w l lw 3  lc "green" notitle,\
'./gesic2.pdos_atm#8(Ge)_wfc#2(p)' using ($1-FE):2 w l lw 3  lc "red" notitle,\
'./gesic2.pdos_atm#8(Ge)_wfc#3(d)' using ($1-FE):2 w l lw 3  lc "khaki" notitle,\
'./gesic2.pdos_atm#8(Ge)_wfc#4(f)' using ($1-FE):2 w l lw 3  lc "violet" notitle,\
'./gesic2.pdos_atm#9(Ge)_wfc#1(s)' using ($1-FE):2 w l lw 3  lc "green" notitle,\
'./gesic2.pdos_atm#9(Ge)_wfc#2(p)' using ($1-FE):2 w l lw 3  lc "red" notitle,\
'./gesic2.pdos_atm#9(Ge)_wfc#3(d)' using ($1-FE):2 w l lw 3  lc "khaki" notitle,\
'./gesic2.pdos_atm#9(Ge)_wfc#4(f)' using ($1-FE):2 w l lw 3  lc "violet" notitle,\
'./gesic2.pdos_atm#10(Ge)_wfc#1(s)' using ($1-FE):2 w l lw 3  lc "green" notitle,\
'./gesic2.pdos_atm#10(Ge)_wfc#2(p)' using ($1-FE):2 w l lw 3  lc "red" notitle,\
'./gesic2.pdos_atm#10(Ge)_wfc#3(d)' using ($1-FE):2 w l lw 3  lc "khaki" notitle,\
'./gesic2.pdos_atm#10(Ge)_wfc#4(f)' using ($1-FE):2 w l lw 3  lc "violet" notitle,\
'./gesic2.pdos_atm#11(Ge)_wfc#1(s)' using ($1-FE):2 w l lw 3  lc "green" notitle,\
'./gesic2.pdos_atm#11(Ge)_wfc#2(p)' using ($1-FE):2 w l lw 3  lc "red" notitle,\
'./gesic2.pdos_atm#11(Ge)_wfc#3(d)' using ($1-FE):2 w l lw 3  lc "khaki" notitle,\
'./gesic2.pdos_atm#11(Ge)_wfc#4(f)' using ($1-FE):2 w l lw 3  lc "violet" notitle,\
'./gesic2.pdos_atm#12(Ge)_wfc#1(s)' using ($1-FE):2 w l lw 3  lc "green" notitle,\
'./gesic2.pdos_atm#12(Ge)_wfc#2(p)' using ($1-FE):2 w l lw 3  lc "red" notitle,\
'./gesic2.pdos_atm#12(Ge)_wfc#3(d)' using ($1-FE):2 w l lw 3  lc "khaki" notitle,\
'./gesic2.pdos_atm#12(Ge)_wfc#4(f)' using ($1-FE):2 w l lw 3  lc "violet" notitle,\
'./gesic2.pdos_atm#13(Ge)_wfc#1(s)' using ($1-FE):2 w l lw 3  lc "green" notitle,\
'./gesic2.pdos_atm#13(Ge)_wfc#2(p)' using ($1-FE):2 w l lw 3  lc "red" notitle,\
'./gesic2.pdos_atm#13(Ge)_wfc#3(d)' using ($1-FE):2 w l lw 3  lc "khaki" notitle,\
'./gesic2.pdos_atm#13(Ge)_wfc#4(f)' using ($1-FE):2 w l lw 3  lc "violet" notitle,\
'./gesic2.pdos_atm#14(Ge)_wfc#1(s)' using ($1-FE):2 w l lw 3  lc "green" notitle,\
'./gesic2.pdos_atm#14(Ge)_wfc#2(p)' using ($1-FE):2 w l lw 3  lc "red" notitle,\
'./gesic2.pdos_atm#14(Ge)_wfc#3(d)' using ($1-FE):2 w l lw 3  lc "khaki" notitle,\
'./gesic2.pdos_atm#14(Ge)_wfc#4(f)' using ($1-FE):2 w l lw 3  lc "violet" notitle,\
'./gesic2.pdos_atm#15(Ge)_wfc#1(s)' using ($1-FE):2 w l lw 3  lc "green" notitle,\
'./gesic2.pdos_atm#15(Ge)_wfc#2(p)' using ($1-FE):2 w l lw 3  lc "red" notitle,\
'./gesic2.pdos_atm#15(Ge)_wfc#3(d)' using ($1-FE):2 w l lw 3  lc "khaki" notitle,\
'./gesic2.pdos_atm#15(Ge)_wfc#4(f)' using ($1-FE):2 w l lw 3  lc "violet" notitle,\
'./gesic2.pdos_atm#16(Ge)_wfc#1(s)' using ($1-FE):2 w l lw 3  lc "green" notitle,\
'./gesic2.pdos_atm#16(Ge)_wfc#2(p)' using ($1-FE):2 w l lw 3  lc "red" notitle,\
'./gesic2.pdos_atm#16(Ge)_wfc#3(d)' using ($1-FE):2 w l lw 3  lc "khaki" notitle,\
'./gesic2.pdos_atm#16(Ge)_wfc#4(f)' using ($1-FE):2 w l lw 3  lc "violet" notitle,\
'./gesic2.pdos_atm#17(Ge)_wfc#1(s)' using ($1-FE):2 w l lw 3  lc "green" notitle,\
'./gesic2.pdos_atm#17(Ge)_wfc#2(p)' using ($1-FE):2 w l lw 3  lc "red" notitle,\
'./gesic2.pdos_atm#17(Ge)_wfc#3(d)' using ($1-FE):2 w l lw 3  lc "khaki" notitle,\
'./gesic2.pdos_atm#17(Ge)_wfc#4(f)' using ($1-FE):2 w l lw 3  lc "violet" notitle,\
'./gesic2.pdos_atm#18(Ge)_wfc#1(s)' using ($1-FE):2 w l lw 3  lc "green" notitle,\
'./gesic2.pdos_atm#18(Ge)_wfc#2(p)' using ($1-FE):2 w l lw 3  lc "red" notitle,\
'./gesic2.pdos_atm#18(Ge)_wfc#3(d)' using ($1-FE):2 w l lw 3  lc "khaki" notitle,\
'./gesic2.pdos_atm#18(Ge)_wfc#4(f)' using ($1-FE):2 w l lw 3  lc "violet" notitle,\
'./gesic2.pdos_atm#19(C)_wfc#1(s)' using ($1-FE):2 w l lw 3  lc 1 title "C-s",\
'./gesic2.pdos_atm#19(C)_wfc#2(p)' using ($1-FE):2 w l lw 3  lc 2 title "C-p",\
'./gesic2.pdos_atm#19(C)_wfc#3(d)' using ($1-FE):2 w l lw 3  lc 3 title "C-d",\
'./gesic2.pdos_atm#19(C)_wfc#4(f)' using ($1-FE):2 w l lw 3  lc 4 title "C-f",\
'./gesic2.pdos_atm#20(Si)_wfc#1(s)' using ($1-FE):2 w l lw 3  lc 5 title "Si-s",\
'./gesic2.pdos_atm#20(Si)_wfc#2(p)' using ($1-FE):2 w l lw 3  lc 6 title "Si-p",\
'./gesic2.pdos_atm#20(Si)_wfc#3(d)' using ($1-FE):2 w l lw 3  lc 7 title "Si-d",\
'./gesic2.pdos_atm#20(Si)_wfc#4(f)' using ($1-FE):2 w l lw 3  lc 8 title "Si-f",\
'./gesic2.pdos_atm#21(C)_wfc#1(s)' using ($1-FE):2 w l lw 3  lc 1 notitle,\
'./gesic2.pdos_atm#21(C)_wfc#2(p)' using ($1-FE):2 w l lw 3  lc 2 notitle,\
'./gesic2.pdos_atm#21(C)_wfc#3(d)' using ($1-FE):2 w l lw 3  lc 3 notitle,\
'./gesic2.pdos_atm#21(C)_wfc#4(f)' using ($1-FE):2 w l lw 3  lc 4 notitle,\
'./gesic2.pdos_atm#22(Si)_wfc#1(s)' using ($1-FE):2 w l lw 3  lc 5 notitle,\
'./gesic2.pdos_atm#22(Si)_wfc#2(p)' using ($1-FE):2 w l lw 3  lc 6 notitle,\
'./gesic2.pdos_atm#22(Si)_wfc#3(d)' using ($1-FE):2 w l lw 3  lc 7 notitle,\
'./gesic2.pdos_atm#22(Si)_wfc#4(f)' using ($1-FE):2 w l lw 3  lc 8 notitle,\
'./gesic2.pdos_atm#23(C)_wfc#1(s)' using ($1-FE):2 w l lw 3  lc 1 notitle,\
'./gesic2.pdos_atm#23(C)_wfc#2(p)' using ($1-FE):2 w l lw 3  lc 2 notitle,\
'./gesic2.pdos_atm#23(C)_wfc#3(d)' using ($1-FE):2 w l lw 3  lc 3 notitle,\
'./gesic2.pdos_atm#23(C)_wfc#4(f)' using ($1-FE):2 w l lw 3  lc 4 notitle,\
'./gesic2.pdos_atm#24(Si)_wfc#1(s)' using ($1-FE):2 w l lw 3  lc 5 notitle,\
'./gesic2.pdos_atm#24(Si)_wfc#2(p)' using ($1-FE):2 w l lw 3  lc 6 notitle,\
'./gesic2.pdos_atm#24(Si)_wfc#3(d)' using ($1-FE):2 w l lw 3  lc 7 notitle,\
'./gesic2.pdos_atm#24(Si)_wfc#4(f)' using ($1-FE):2 w l lw 3  lc 8 notitle,\
'./gesic2.pdos_atm#25(C)_wfc#1(s)' using ($1-FE):2 w l lw 3  lc 1 notitle,\
'./gesic2.pdos_atm#25(C)_wfc#2(p)' using ($1-FE):2 w l lw 3  lc 2 notitle,\
'./gesic2.pdos_atm#25(C)_wfc#3(d)' using ($1-FE):2 w l lw 3  lc 3 notitle,\
'./gesic2.pdos_atm#25(C)_wfc#4(f)' using ($1-FE):2 w l lw 3  lc 4 notitle,\
'./gesic2.pdos_atm#26(Si)_wfc#1(s)' using ($1-FE):2 w l lw 3  lc 5 notitle,\
'./gesic2.pdos_atm#26(Si)_wfc#2(p)' using ($1-FE):2 w l lw 3  lc 6 notitle,\
'./gesic2.pdos_atm#26(Si)_wfc#3(d)' using ($1-FE):2 w l lw 3  lc 7 notitle,\
'./gesic2.pdos_atm#26(Si)_wfc#4(f)' using ($1-FE):2 w l lw 3  lc 8 notitle,\
'./gesic2.pdos_atm#27(C)_wfc#1(s)' using ($1-FE):2 w l lw 3  lc 1 notitle,\
'./gesic2.pdos_atm#27(C)_wfc#2(p)' using ($1-FE):2 w l lw 3  lc 2 notitle,\
'./gesic2.pdos_atm#27(C)_wfc#3(d)' using ($1-FE):2 w l lw 3  lc 3 notitle,\
'./gesic2.pdos_atm#27(C)_wfc#4(f)' using ($1-FE):2 w l lw 3  lc 4 notitle,\
'./gesic2.pdos_atm#28(Si)_wfc#1(s)' using ($1-FE):2 w l lw 3  lc 5 notitle,\
'./gesic2.pdos_atm#28(Si)_wfc#2(p)' using ($1-FE):2 w l lw 3  lc 6 notitle,\
'./gesic2.pdos_atm#28(Si)_wfc#3(d)' using ($1-FE):2 w l lw 3  lc 7 notitle,\
'./gesic2.pdos_atm#28(Si)_wfc#4(f)' using ($1-FE):2 w l lw 3  lc 8 notitle,\
'./gesic2.pdos_atm#29(C)_wfc#1(s)' using ($1-FE):2 w l lw 3  lc 1 notitle,\
'./gesic2.pdos_atm#29(C)_wfc#2(p)' using ($1-FE):2 w l lw 3  lc 2 notitle,\
'./gesic2.pdos_atm#29(C)_wfc#3(d)' using ($1-FE):2 w l lw 3  lc 3 notitle,\
'./gesic2.pdos_atm#29(C)_wfc#4(f)' using ($1-FE):2 w l lw 3  lc 4 notitle,\
'./gesic2.pdos_atm#30(Si)_wfc#1(s)' using ($1-FE):2 w l lw 3  lc 5 notitle,\
'./gesic2.pdos_atm#30(Si)_wfc#2(p)' using ($1-FE):2 w l lw 3  lc 6 notitle,\
'./gesic2.pdos_atm#30(Si)_wfc#3(d)' using ($1-FE):2 w l lw 3  lc 7 notitle,\
'./gesic2.pdos_atm#30(Si)_wfc#4(f)' using ($1-FE):2 w l lw 3  lc 8 notitle,\
'./gesic2.pdos_atm#31(C)_wfc#1(s)' using ($1-FE):2 w l lw 3  lc 1 notitle,\
'./gesic2.pdos_atm#31(C)_wfc#2(p)' using ($1-FE):2 w l lw 3  lc 2 notitle,\
'./gesic2.pdos_atm#31(C)_wfc#3(d)' using ($1-FE):2 w l lw 3  lc 3 notitle,\
'./gesic2.pdos_atm#31(C)_wfc#4(f)' using ($1-FE):2 w l lw 3  lc 4 notitle,\
'./gesic2.pdos_atm#32(Si)_wfc#1(s)' using ($1-FE):2 w l lw 3  lc 5 notitle,\
'./gesic2.pdos_atm#32(Si)_wfc#2(p)' using ($1-FE):2 w l lw 3  lc 6 notitle,\
'./gesic2.pdos_atm#32(Si)_wfc#3(d)' using ($1-FE):2 w l lw 3  lc 7 notitle,\
'./gesic2.pdos_atm#32(Si)_wfc#4(f)' using ($1-FE):2 w l lw 3  lc 8 notitle,\
'./gesic2.pdos_atm#33(C)_wfc#1(s)' using ($1-FE):2 w l lw 3  lc 1 notitle,\
'./gesic2.pdos_atm#33(C)_wfc#2(p)' using ($1-FE):2 w l lw 3  lc 2 notitle,\
'./gesic2.pdos_atm#33(C)_wfc#3(d)' using ($1-FE):2 w l lw 3  lc 3 notitle,\
'./gesic2.pdos_atm#33(C)_wfc#4(f)' using ($1-FE):2 w l lw 3  lc 4 notitle,\
'./gesic2.pdos_atm#34(Si)_wfc#1(s)' using ($1-FE):2 w l lw 3  lc 5 notitle,\
'./gesic2.pdos_atm#34(Si)_wfc#2(p)' using ($1-FE):2 w l lw 3  lc 6 notitle,\
'./gesic2.pdos_atm#34(Si)_wfc#3(d)' using ($1-FE):2 w l lw 3  lc 7 notitle,\
'./gesic2.pdos_atm#34(Si)_wfc#4(f)' using ($1-FE):2 w l lw 3  lc 8 notitle,\
'./gesic2.pdos_atm#35(C)_wfc#1(s)' using ($1-FE):2 w l lw 3  lc 1 notitle,\
'./gesic2.pdos_atm#35(C)_wfc#2(p)' using ($1-FE):2 w l lw 3  lc 2 notitle,\
'./gesic2.pdos_atm#35(C)_wfc#3(d)' using ($1-FE):2 w l lw 3  lc 3 notitle,\
'./gesic2.pdos_atm#35(C)_wfc#4(f)' using ($1-FE):2 w l lw 3  lc 4 notitle,\
'./gesic2.pdos_atm#36(Si)_wfc#1(s)' using ($1-FE):2 w l lw 3  lc 5 notitle,\
'./gesic2.pdos_atm#36(Si)_wfc#2(p)' using ($1-FE):2 w l lw 3  lc 6 notitle,\
'./gesic2.pdos_atm#36(Si)_wfc#3(d)' using ($1-FE):2 w l lw 3  lc 7 notitle,\
'./gesic2.pdos_atm#36(Si)_wfc#4(f)' using ($1-FE):2 w l lw 3  lc 8 notitle,\
'./gesic2.pdos_atm#37(C)_wfc#1(s)' using ($1-FE):2 w l lw 3  lc 1 notitle,\
'./gesic2.pdos_atm#37(C)_wfc#2(p)' using ($1-FE):2 w l lw 3  lc 2 notitle,\
'./gesic2.pdos_atm#37(C)_wfc#3(d)' using ($1-FE):2 w l lw 3  lc 3 notitle,\
'./gesic2.pdos_atm#37(C)_wfc#4(f)' using ($1-FE):2 w l lw 3  lc 4 notitle,\
'./gesic2.pdos_atm#38(Si)_wfc#1(s)' using ($1-FE):2 w l lw 3  lc 5 notitle,\
'./gesic2.pdos_atm#38(Si)_wfc#2(p)' using ($1-FE):2 w l lw 3  lc 6 notitle,\
'./gesic2.pdos_atm#38(Si)_wfc#3(d)' using ($1-FE):2 w l lw 3  lc 7 notitle,\
'./gesic2.pdos_atm#38(Si)_wfc#4(f)' using ($1-FE):2 w l lw 3  lc 8 notitle,\
'./gesic2.pdos_atm#39(C)_wfc#1(s)' using ($1-FE):2 w l lw 3  lc 1 notitle,\
'./gesic2.pdos_atm#39(C)_wfc#2(p)' using ($1-FE):2 w l lw 3  lc 2 notitle,\
'./gesic2.pdos_atm#39(C)_wfc#3(d)' using ($1-FE):2 w l lw 3  lc 3 notitle,\
'./gesic2.pdos_atm#39(C)_wfc#4(f)' using ($1-FE):2 w l lw 3  lc 4 notitle,\
'./gesic2.pdos_atm#40(Si)_wfc#1(s)' using ($1-FE):2 w l lw 3  lc 5 notitle,\
'./gesic2.pdos_atm#40(Si)_wfc#2(p)' using ($1-FE):2 w l lw 3  lc 6 notitle,\
'./gesic2.pdos_atm#40(Si)_wfc#3(d)' using ($1-FE):2 w l lw 3  lc 7 notitle,\
'./gesic2.pdos_atm#40(Si)_wfc#4(f)' using ($1-FE):2 w l lw 3  lc 8 notitle,\
'./gesic2.pdos_atm#41(C)_wfc#1(s)' using ($1-FE):2 w l lw 3  lc 1 notitle,\
'./gesic2.pdos_atm#41(C)_wfc#2(p)' using ($1-FE):2 w l lw 3  lc 2 notitle,\
'./gesic2.pdos_atm#41(C)_wfc#3(d)' using ($1-FE):2 w l lw 3  lc 3 notitle,\
'./gesic2.pdos_atm#41(C)_wfc#4(f)' using ($1-FE):2 w l lw 3  lc 4 notitle,\
'./gesic2.pdos_atm#42(Si)_wfc#1(s)' using ($1-FE):2 w l lw 3  lc 5 notitle,\
'./gesic2.pdos_atm#42(Si)_wfc#2(p)' using ($1-FE):2 w l lw 3  lc 6 notitle,\
'./gesic2.pdos_atm#42(Si)_wfc#3(d)' using ($1-FE):2 w l lw 3  lc 7 notitle,\
'./gesic2.pdos_atm#42(Si)_wfc#4(f)' using ($1-FE):2 w l lw 3  lc 8 notitle,\
'./gesic2.pdos_atm#43(C)_wfc#1(s)' using ($1-FE):2 w l lw 3  lc 1 notitle,\
'./gesic2.pdos_atm#43(C)_wfc#2(p)' using ($1-FE):2 w l lw 3  lc 2 notitle,\
'./gesic2.pdos_atm#43(C)_wfc#3(d)' using ($1-FE):2 w l lw 3  lc 3 notitle,\
'./gesic2.pdos_atm#43(C)_wfc#4(f)' using ($1-FE):2 w l lw 3  lc 4 notitle,\
'./gesic2.pdos_atm#44(Si)_wfc#1(s)' using ($1-FE):2 w l lw 3  lc 5 notitle,\
'./gesic2.pdos_atm#44(Si)_wfc#2(p)' using ($1-FE):2 w l lw 3  lc 6 notitle,\
'./gesic2.pdos_atm#44(Si)_wfc#3(d)' using ($1-FE):2 w l lw 3  lc 7 notitle,\
'./gesic2.pdos_atm#44(Si)_wfc#4(f)' using ($1-FE):2 w l lw 3  lc 8 notitle,\
'./gesic2.pdos_atm#45(C)_wfc#1(s)' using ($1-FE):2 w l lw 3  lc 1 notitle,\
'./gesic2.pdos_atm#45(C)_wfc#2(p)' using ($1-FE):2 w l lw 3  lc 2 notitle,\
'./gesic2.pdos_atm#45(C)_wfc#3(d)' using ($1-FE):2 w l lw 3  lc 3 notitle,\
'./gesic2.pdos_atm#45(C)_wfc#4(f)' using ($1-FE):2 w l lw 3  lc 4 notitle,\
'./gesic2.pdos_atm#46(Si)_wfc#1(s)' using ($1-FE):2 w l lw 3  lc 5 notitle,\
'./gesic2.pdos_atm#46(Si)_wfc#2(p)' using ($1-FE):2 w l lw 3  lc 6 notitle,\
'./gesic2.pdos_atm#46(Si)_wfc#3(d)' using ($1-FE):2 w l lw 3  lc 7 notitle,\
'./gesic2.pdos_atm#46(Si)_wfc#4(f)' using ($1-FE):2 w l lw 3  lc 8 notitle,\
'./gesic2.pdos_atm#47(C)_wfc#1(s)' using ($1-FE):2 w l lw 3  lc 1 notitle,\
'./gesic2.pdos_atm#47(C)_wfc#2(p)' using ($1-FE):2 w l lw 3  lc 2 notitle,\
'./gesic2.pdos_atm#47(C)_wfc#3(d)' using ($1-FE):2 w l lw 3  lc 3 notitle,\
'./gesic2.pdos_atm#47(C)_wfc#4(f)' using ($1-FE):2 w l lw 3  lc 4 notitle,\
'./gesic2.pdos_atm#48(Si)_wfc#1(s)' using ($1-FE):2 w l lw 3  lc 5 notitle,\
'./gesic2.pdos_atm#48(Si)_wfc#2(p)' using ($1-FE):2 w l lw 3  lc 6 notitle,\
'./gesic2.pdos_atm#48(Si)_wfc#3(d)' using ($1-FE):2 w l lw 3  lc 7 notitle,\
'./gesic2.pdos_atm#48(Si)_wfc#4(f)' using ($1-FE):2 w l lw 3  lc 8 notitle,\
'./gesic2.pdos_atm#49(C)_wfc#1(s)' using ($1-FE):2 w l lw 3  lc 1 notitle,\
'./gesic2.pdos_atm#49(C)_wfc#2(p)' using ($1-FE):2 w l lw 3  lc 2 notitle,\
'./gesic2.pdos_atm#49(C)_wfc#3(d)' using ($1-FE):2 w l lw 3  lc 3 notitle,\
'./gesic2.pdos_atm#49(C)_wfc#4(f)' using ($1-FE):2 w l lw 3  lc 4 notitle,\
'./gesic2.pdos_atm#50(Si)_wfc#1(s)' using ($1-FE):2 w l lw 3  lc 5 notitle,\
'./gesic2.pdos_atm#50(Si)_wfc#2(p)' using ($1-FE):2 w l lw 3  lc 6 notitle,\
'./gesic2.pdos_atm#50(Si)_wfc#3(d)' using ($1-FE):2 w l lw 3  lc 7 notitle,\
'./gesic2.pdos_atm#50(Si)_wfc#4(f)' using ($1-FE):2 w l lw 3  lc 8 notitle,\
'./gesic2.pdos_tot' using ($1-FE):2 w l lw 3  lc "gray" title "Hetrobilayer"



# NO LEGEND 
notitle # ADDED TO EACH 'plot' COMMAND
##

# FLIP Y-AXIS
set yrange [] reverse
# OR (IF WE CAN PROVIDE DATA RANGE)
set yrange [20:0] # INSTEAD OF [O:20]
##

# PLOT 2ND COLUMN, OMITTING 1ST LINE 
plot '< tail -n +2 testsurf2-FreeSurfaceIBFD.pgy' using 2
##

#
plot 'B904_RFR_mean.txt', 'B904_RFR_stdm.txt', 'B904_RFR_stdp.txt'
##

#
plot 'Ra_kryt.txt' u 1:2:(1000000) smooth acsplines notitle lt 7 dashtype 2, 'Ra_kryt.txt' w p ps 1.2 pt 7 notitle
##

#!/bin/bash
name1=fd00$1.picka
name2=ray00$1.timesa
gnuplot -persist <<EOF

set term png
set output "obs$1.png"
set xlabel "distance along profile [km]"
set ylabel "first arrival time [s]"
set yrange [0:20] reverse
set key inside center bottom
plot "$name1" using 1:4:5 with yerrorbars title "picked", "$name2" using 1:4 with lines title "modeled"
EOF
##

#
set term png
set output 'nazwa_pliku.png'
plot ...
set output

# (OPTIONAL) BACK TO DEFAULT TERMINAL
set term wxt
##
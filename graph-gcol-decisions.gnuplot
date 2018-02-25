# vim: set et ft=gnuplot sw=4 :

set terminal tikz standalone color size 10.5cm,6.5cm font '\scriptsize' preamble '\usepackage{microtype}'
set output "gen-graph-gcol-decisions.tex"

load "common.gnuplot"

set xlabel "Number of Colours"
set ylabel "Runtime (s)"

set boxwidth 0.5
set style fill solid
set xrange [2:80]
plot \
    "code/colDec-g80-k.txt" using (strcol(3) eq "0" ? $1 : NaN):($2/1000) with boxes notitle lc '#b30c00', \
    "code/colDec-g80-k.txt" using (strcol(3) eq "1" ? $1 : NaN):($2/1000) with boxes notitle lc '#009dec'


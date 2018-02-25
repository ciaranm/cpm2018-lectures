# vim: set et ft=gnuplot sw=4 :

set terminal tikz standalone color size 9.5cm,7.5cm font '\scriptsize' preamble '\usepackage{microtype}'
set output "gen-graph-value-ordering-heuristics-unsat.tex"

load "common.gnuplot"

set xlabel "Runtime (ms)"
set ylabel "Number of Unsat Instances Solved"
set xrange [1e2:1e6]
set logscale x
set format x '$10^{%T}$'
set key off

plot \
    "runtimes.data" u (cumx(norestarts)):(cumunsaty(norestarts)) smooth cumulative w l ti 'All' at end ls 1, \
    "runtimes.data" u (cumx(random)):(cumunsaty(random)) smooth cumulative w l notitle ls 4 dt (2,3), \
    "runtimes.data" u (cumx(anti)):(cumunsaty(anti)) smooth cumulative w l notitle ls 7 dt (1,3)


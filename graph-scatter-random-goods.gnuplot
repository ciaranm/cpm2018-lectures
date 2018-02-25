# vim: set et ft=gnuplot sw=4 :

set terminal tikz standalone color size 9.5cm,7.5cm font '\scriptsize' preamble '\usepackage{microtype}'
set output "gen-graph-scatter-random-goods.tex"

load "common.gnuplot"

set xlabel "Degree Search Time (ms)"
set ylabel "Random + Restarts Search Time (ms)"
set logscale x
set logscale y
set format x '$10^{%T}$'
set format y '$10^{%T}$'
set key horiz rmargin maxcols 1
set size square

plotfile="searchtimes.data"
satcol="sat"
famcol="family"
xcol=norestarts
ycol=randomrestartsgoods

load "scatter.gnuplot"


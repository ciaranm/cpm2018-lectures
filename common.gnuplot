# vim: set et ft=gnuplot sw=4 :

load "glasgow.pal"

set style line 102 lc rgb '#a0a0a0' lt 1 lw 1
set border ls 102
set colorbox border 102
set key textcolor rgb "black"
set tics textcolor rgb "black"
set label textcolor rgb "black"

set border 3
set grid x y
set xtics nomirror
set ytics nomirror

timeout=1e6
isfail(x)=(stringcolumn(x) eq "NaN" || column(x) >= timeout)
cumx(x)=(isfail(x) ? 1e6 : column(x))
cumy(x)=(isfail(x) ? 1e-10 : 1)
cumsaty(x)=(stringcolumn("sat") eq "1" ? cumy(x) : 1e-10)
cumunsaty(x)=(stringcolumn("sat") eq "0" ? cumy(x) : 1e-10)

norestarts="sequential14"
softmax="sequentialinputordersoftmax14"
random="sequentialshuffle14"
randomrestarts="sequentialrestartsshuffle14"
anti="sequentialantiheuristic14"
final="sequentialinputordersoftmaxrestarts14"
randomrestartsgoods="sequentialinputordershufflerestartsgoods14"
constant="sequentialinputordersoftmaxrestartsconstant14"
dds="sequentialdds14"
lubypar="parallelinputordersoftmaxrestarts14"
constantpar="parallelinputordersoftmaxrestartsconstant14"

mcsplitdown="mcsplitdown14"
mcsplitdownbiasedrestarts="mcsplitdownbiasedrestarts14"
kdown="sequentialixinduced14"
kdownbiasedrestarts="sequentialixinducedrestarts14"

glasgow2="glasgow2"
glasgow3="glasgow3"
pathlad="pathlad"
vf2="vf2"


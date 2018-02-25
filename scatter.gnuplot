# vim: set et ft=gnuplot sw=4 :

set xtics add ('~~~~t/o' 2e6)
set ytics left offset character -3
set ytics add ('\,t/o' 2e6)

set xrange [1:2e6]
set yrange [1:2e6]

clamp(c)=stringcolumn(c)eq"NaN"?timeout*2:column(c)>=timeout?2*timeout:column(c)==0?1:column(c)
c(x)=stringcolumn(x)eq"NaN"?timeout:column(x)

plot \
    plotfile u (c(xcol)==0&&c(ycol)==0?NaN:column(satcol)==0||column(famcol)!=13?NaN:clamp(xcol)):(clamp(ycol)) ls 2 pt 1 ps 0.7 ti 'Mesh sat', \
    plotfile u (c(xcol)==0&&c(ycol)==0?NaN:column(satcol)==0||(column(famcol)!=2&&column(famcol)!=11)?NaN:clamp(xcol)):(clamp(ycol)) w p ls 4 pt 2 ps 0.7 ti 'LV sat', \
    plotfile u (c(xcol)==0&&c(ycol)==0?NaN:column(satcol)==0||column(famcol)!=12?NaN:clamp(xcol)):(clamp(ycol)) ls 6 pt 3 ps 0.7 ti 'Phase sat', \
    plotfile u (c(xcol)==0&&c(ycol)==0?NaN:column(satcol)==0||column(famcol)!=7?NaN:clamp(xcol)):(clamp(ycol)) ls 1 pt 4 ps 0.7 ti 'Rand sat', \
    plotfile u (c(xcol)==0&&c(ycol)==0?NaN:column(satcol)==0||column(famcol)==13||column(famcol)==2||column(famcol)==11||column(famcol)==12||column(famcol)==7||column(famcol)==15?NaN:clamp(xcol)):(clamp(ycol)) ls 3 pt 8 ps 0.7 ti 'Other sat', \
    plotfile u (c(xcol)==0&&c(ycol)==0?NaN:column(satcol)==1?NaN:clamp(xcol)):(clamp(ycol)) ls 7 pt 7 ps 0.5 ti 'Any unsat', \
    x w l ls 0 notitle


reset
set terminal epslatex input color
set output "gnuplot.tex"
set datafile separator ","
set xdata time
set timefmt "%Y/%m"
set format x "%Y/%m"
set xtics rotate by -90
set mxtics 12
set xrange ["2001/04":"2009/08"]
set yrange [0:400]
set xlabel "$BG/7n(B"
set ylabel "$BEE5$;HMQNL(B [kWh]"
set y2range [0:50]
set y2label "$B%,%9!&?eF;;HMQNL(B [$BN)J}%a!<%H%k(B]"
set ytics nomirror
set y2tics
plot "konetsu.csv" using 1:3 axes x1y1 title "$BEE5$(B" with line,\
     "" using 1:8 axes x1y2 title "$B%,%9(B" with line,\
     "" using 1:13 axes x1y2 title "$B?eF;(B" with line

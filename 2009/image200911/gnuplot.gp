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
set xlabel "年月"
set ylabel "電気使用量 [kWh]"
set y2range [0:50]
set y2label "ガス・水道使用量 [立方メートル]"
set ytics nomirror
set y2tics
plot "konetsu.csv" using 1:3 axes x1y1 title "電気" with line,\
     "" using 1:8 axes x1y2 title "ガス" with line,\
     "" using 1:13 axes x1y2 title "水道" with line

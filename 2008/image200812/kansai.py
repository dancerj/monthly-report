#!/usr/bin/python
# http://home.gna.org/pychart/doc/index.html
# apt-get install python-pychart

import csv
from pychart import *

theme.use_color=True
theme.default_font_size=26
theme.default_line_width=2
theme.reinitialize()
 
csv_reader = csv.reader(file('kansai.csv'))
data = []
halfyear = [] # half-year moving average.
i = 0
for row in csv_reader:
    halfyear.append(int(row[2]))
    if len(halfyear) > 12:
        halfyear = halfyear[1:]
    data.append((i,
                 int(row[0]),
                 int(row[1]),
                 int(row[2]), 
                 sum(halfyear) / len(halfyear),
                 ))
    i = i + 1

xaxis = axis.X(tic_interval = 6, label="Year Month", 
               format=lambda x: 
               "%i-%i" % (data[x][1], data[x][2]))
yaxis = axis.Y(tic_interval = 10, label="Attendees")
chart_object.set_defaults(area.T, size = (480, 300))
ar = area.T(x_axis=xaxis, y_axis=yaxis, x_range=(0,len(data)-1), y_range=(0,None))
plot = line_plot.T(label="n. of attendees", data=data, ycol=3)
plot2 = line_plot.T(label="1 year average", data=data, ycol=4)

ar.add_plot(plot, plot2)
can = canvas.init("kansai.png")
ar.draw(can)

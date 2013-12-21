#!/usr/bin/python
"""
Generates graph for attendance and pre/post work.
Processes the output of:

.mode csv
.output attend.csv
select year, month, sum(type='attendance'), sum(type='prework'), sum(type='postwork') from attend group by year,month order by year, month ;

"""

from pychart import *
import csv

NUM_YEARS = 7

theme.use_color=True
theme.default_font_size=16
theme.default_line_width=2
theme.reinitialize()

csv_reader = csv.reader(file('kansai.csv'))

data = []
halfyear = [] # half-year moving average.
halfyear2 = []
halfyear3 = []
i = 1
for row in csv_reader:
    halfyear.append(int(row[2]))
    if len(halfyear) > 12:
        halfyear = halfyear[1:]

    data.append((i,
                 int(row[2]),
                 sum(halfyear) / len(halfyear),
                 int(row[3]),
                 ))
    i = i + 1

xaxis = axis.X(tic_interval = 12, label="Year Month",
               format=lambda x:
               "%i-%i" % ((x-1)/12+2007, (x-1)%12+1))
yaxis = axis.Y(tic_interval = 10, label="Number of people")
chart_object.set_defaults(area.T, size = (480, 300))
ar = area.T(x_axis=xaxis, y_axis=yaxis, x_range=(1,12*NUM_YEARS),
            y_range=(0,None), legend = legend.T(loc=(20,240)))
plot1 = line_plot.T(label="n. of attendees", data=data, ycol=1)
plot2 = line_plot.T(label="n. of attendees(0.5 yr avg)", data=data, ycol=2)
plot3 = line_plot.T(label="n. of respondents", data=data, ycol=3)

ar.add_plot(plot1, plot2, plot3)
can = canvas.init("kansai.png")
ar.draw(can)

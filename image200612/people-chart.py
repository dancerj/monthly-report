#!/usr/bin/python
# http://home.gna.org/pychart/doc/index.html

from pychart import *

data=[(1,21,8),
(2,10,7),
(3,8,30),
(4,6,15),
(5,8,6),
(6,12,16),
(7,12,40),
(8,7),
(9,14),
(10,9),
(11,8),
(12,8)
]

xaxis = axis.X(tic_interval = 1, label="Time")
yaxis = axis.Y(tic_interval = 10, label="Attendees")
chart_object.set_defaults(area.T, size = (480, 300))
ar = area.T(x_axis=xaxis, y_axis=yaxis, x_range=(1,12), y_range=(0,None))
plot2005 = line_plot.T(label="year 2005", data=data, ycol=1, tick_mark=tick_mark.circle)
plot2006 = line_plot.T(label="year 2006", data=data, ycol=2, tick_mark=tick_mark.square)
ar.add_plot(plot2005, plot2006)
can = canvas.init("people-chart.png")
ar.draw(can)

#!/usr/bin/python
# http://home.gna.org/pychart/doc/index.html
# apt-get install python-pychart

from pychart import *

theme.use_color=True
theme.default_font_size=26
theme.default_line_width=2
theme.reinitialize()

data = chart_data.read_csv('people.csv')
xaxis = axis.X(tic_interval = 1, label="Month")
yaxis = axis.Y(tic_interval = 10, label="Attendees")
chart_object.set_defaults(area.T, size = (480, 300))
ar = area.T(x_axis=xaxis, y_axis=yaxis, x_range=(1,12), y_range=(0,None))
plot2005 = line_plot.T(label="year 2005", data=data, ycol=1)
plot2006 = line_plot.T(label="year 2006", data=data, ycol=2)
plot2007 = line_plot.T(label="year 2007", data=data, ycol=3)
ar.add_plot(plot2005, plot2006, plot2007)
can = canvas.init("people-chart.png")
ar.draw(can)

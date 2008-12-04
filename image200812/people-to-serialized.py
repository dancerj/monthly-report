#!/usr/bin/python
# make number of people serial.
# generate serialized.csv from people.csv

import csv
csv_reader = csv.reader(file('people.csv','r'))
data=[[],[],[],[]]
for row in csv_reader:
    for num in (1,2,3,4):
        data[num-1].append(row[num])

outrows = []
year=2005
for eachdata in data:
    for num in (1,2,3,4,5,6,7,8,9,10,11,12):
        outrows.append([year, num, eachdata[num-1]])
    year = year + 1

csv_writer = csv.writer(file('serialized.csv','w'))
csv_writer.writerows(outrows)

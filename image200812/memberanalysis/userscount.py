#!/usr/bin/python2.5

import csv

member={}
csv_reader = csv.reader(file('memberls.csv','r'))
for row in csv_reader:
    for items in row[2:]:
        name = items.decode('utf-8')
        if member.has_key(name):
            member[name] = member[name] + 1
        else:
            member[name] = 1

numrank={}
# create a reverse table to sort by number of attendance
for key, value in member.iteritems():
    if numrank.has_key(value):
        numrank[value].append(key)
    else:
        numrank[value]=[ key ]

# print out the list of people
for f in sorted(numrank.keys(), reverse=True):
    for item in numrank[f]:
        print "%s,%i" % (item, f)

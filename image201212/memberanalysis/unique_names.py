#!/usr/bin/python
# dump unique names count.
# use: 
#  ./unique_names.py < memberls.csv 

import csv
import sys
csv_reader = csv.reader(sys.stdin)
usernames = {}
for row in csv_reader:
    for column in row[2:]:
        # each column is a username.
        name = column.decode('utf-8')
        usernames[name] = usernames.get(name, 0) + 1

#print usernames.encode('utf-8')
for user, count in sorted(usernames.viewitems(),
                          key=lambda k: -k[1]):
    print user, count

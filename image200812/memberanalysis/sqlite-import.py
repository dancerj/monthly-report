#!/usr/bin/python2.5

"""
Create a DB to play with.
Requires python-pysqlite2 package.

Example operation against this table:

sqlite3 /tmp/debmtg.db

# see attendance for each month
 select year, month, count(name) from attend where type='attendance' group by year,month 
"""

from pysqlite2 import dbapi2
import csv

con = dbapi2.connect('/tmp/debmtg.db')
cur = con.cursor()

# read members

try:
    cur.execute('drop table attend')
except dbapi2.Error, e:
    print "An error occurred:", e.args[0]

cur.execute('create table attend(year text, month text, name text, type text)')

for rows in csv.reader(file('memberls.csv')):
    for name in rows[2:]:
        cur.execute('insert into attend(year, month, name, type) values(?,?,?,?)', 
                    (rows[0],rows[1],name.decode('utf-8'),'attendance'))
                   
for rows in csv.reader(file('prework.csv')):
    for name in rows[2:]:
        cur.execute('insert into attend(year, month, name, type) values(?,?,?,?)', 
                    (rows[0],rows[1],name.decode('utf-8'),'prework'))

for rows in csv.reader(file('postwork.csv')):
    for name in rows[2:]:
        cur.execute('insert into attend(year, month, name, type) values(?,?,?,?)', 
                    (rows[0],rows[1],name.decode('utf-8'),'postwork'))

con.commit()
con.close()


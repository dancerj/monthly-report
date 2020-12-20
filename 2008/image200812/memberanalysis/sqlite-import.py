#!/usr/bin/python2.5

"""
Create a DB to play with.
Requires python-pysqlite2 package.

Example operation against this table:

sqlite3 /tmp/debmtg.db

# see attendance for each month
 select year, month, count(name) from attend where type='attendance' group by year,month 


# see what kind of activities people are doing.
select name, sum(type = 'attendance'), sum(type = 'prework'), sum(type = 'postwork') from attend group by name order by count(name); 

# see what are the attendance / prework / postwork
 select year, month, sum(type='attendance'), sum(type='prework'), sum(type='postwork') from attend group by year,month order by year, month ;

# rank the attendance with pre-work and post-work percentage.
select name,  sum(type = 'attendance'), sum(type = 'prework'),  sum(type = 'postwork'), sum(type = 'prework') * 1.0 / sum(type = 'attendance') as preworkpct, sum(type = 'postwork') * 1.0 / sum(type = 'attendance') as postworkpct from attend  group by name order by postworkpct, preworkpct; 
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

cur.execute('create table attend(year number, month number, name text, type text)')

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


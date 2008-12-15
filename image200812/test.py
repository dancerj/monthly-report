#!/usr/bin/python2.5

""" test program to import minimalistic csv file to sqlite database.
Creates debmtg.db
"""
from pysqlite2 import dbapi2
import csv

con = dbapi2.connect('debmtg.db')
cur = con.cursor()

cur.execute('create table test(name text, score number)')

for rows in csv.reader(file('test.csv')):
    cur.execute('insert into test(name, score) values(?,?)', 
                    (rows[0].decode('utf-8'),int(rows[1])))

con.commit()
con.close()

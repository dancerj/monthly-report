#!/bin/bash

sqlite3 debmtg.db <<EOF
.mode csv
.output attend.csv
.headers on
select
  year, 
  month, 
  sum(type='attendance') as attendance, 
  sum(type='prework') as prework,
  sum(type='postwork') as postwork 
from attend 
group by year, month 
order by year, month;
EOF

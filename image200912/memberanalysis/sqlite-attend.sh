#!/bin/bash

sqlite3 debmtg.db <<EOF
.mode csv
.output attend.csv
select year, month, sum(type='attendance'), sum(type='prework'), sum(type='postwork') from attend group by year,month order by year, month ;
EOF

all: attend.png

debmtg.db: memberls.csv postwork.csv prework.csv
	./sqlite-import.py

attend.csv: debmtg.db
	./sqlite-attend.sh

attend.png: attend.csv
	./attend.py
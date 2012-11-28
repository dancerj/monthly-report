all: attend.eps

debmtg.db: memberls.csv postwork.csv prework.csv
	./sqlite-import.py

attend.csv: debmtg.db sqlite-attend.sh
	./sqlite-attend.sh

attend.eps: attend.csv tokyograph.R
	./tokyograph.R

kansai.png: kansai.csv attend-kansai.py
	./attend-kansai.py

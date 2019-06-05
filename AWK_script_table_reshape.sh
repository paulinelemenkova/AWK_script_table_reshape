#!/bin/sh
# Unix prog: awk, rm, echo
# AWK script to reshape initial long table.
# Purpose: remove unnecessary rows, only select necessary columns, reshape columns => rows
# Initial table: 12726 rows 5 columns; Output table:  201  rows  11 columns.
#
# cd /Users/pauline/Documents/Octave
# awk: reshaped initial GMT table of 62 profiles (select two necessary columns; FS as space).
awk 'BEGIN{FS=" "; OFS=" "} {print $3, $5}' table2.txt > table_10p.csv
# select only profile 1, save as table as 'table_10pr' with X and Y (location and depths):
awk '/profile -L0-00/,/profile -L0-01/' table_10p.csv > table_10pr.csv
#
# remove auxiliary files
rm -f table_10p.csv
#
# awk: delete header and tail
awk '!/-L0-/' table_10pr.csv > table_10k.csv
#
# remove auxiliary files
rm -f table_10pr.csv
#
# awk: only take Y column (field 5) from the initial tables (depths for all profiles)
awk '{print $5}' table2.txt > table_Y.csv
#
# awk: select profile i from the initial table by awk (print section of file between two regex).
# i: 1, 7, 14, 21, 28, 35, 42, 49, 56, 62.
awk '/-L0-07/,/-L0-08/' table_Y.csv > table_p07.csv
awk '/-L0-14/,/-L0-15/' table_Y.csv > table_p14.csv
awk '/-L0-21/,/-L0-22/' table_Y.csv > table_p21.csv
awk '/-L0-28/,/-L0-29/' table_Y.csv > table_p28.csv
awk '/-L0-35/,/-L0-36/' table_Y.csv > table_p35.csv
awk '/-L0-42/,/-L0-43/' table_Y.csv > table_p42.csv
awk '/-L0-49/,/-L0-50/' table_Y.csv > table_p49.csv
awk '/-L0-56/,/-L0-57/' table_Y.csv > table_p56.csv
awk '/-L0-62/,EOF' table_Y.csv > table_p62.csv
#
# awk: delete header and tail (print only lines which do NOT match regex)
awk '!/-L0-/' table_p07.csv > table_Y07.csv
awk '!/-L0-/' table_p14.csv > table_Y14.csv
awk '!/-L0-/' table_p21.csv > table_Y21.csv
awk '!/-L0-/' table_p28.csv > table_Y28.csv
awk '!/-L0-/' table_p35.csv > table_Y35.csv
awk '!/-L0-/' table_p42.csv > table_Y42.csv
awk '!/-L0-/' table_p49.csv > table_Y49.csv
awk '!/-L0-/' table_p56.csv > table_Y56.csv
awk '!/-L0-/' table_p62.csv > table_Y62.csv
#
# remove auxiliary files
rm -f table_Y.csv table_p07.csv table_p14.csv table_p21.csv table_p28.csv table_p35.csv table_p42.csv table_p49.csv table_p56.csv table_p62.csv
#
# awk: add single Y column of the profile i to the table 'table_10p.csv'; save output to 'table_10i.csv'
awk '{print $0}' < table_Y07.csv | paste table_10k.csv - > table_10h.csv
awk '{print $0}' < table_Y14.csv | paste table_10h.csv - > table_10a.csv
awk '{print $0}' < table_Y21.csv | paste table_10a.csv - > table_10b.csv
awk '{print $0}' < table_Y28.csv | paste table_10b.csv - > table_10c.csv
awk '{print $0}' < table_Y35.csv | paste table_10c.csv - > table_10d.csv
awk '{print $0}' < table_Y42.csv | paste table_10d.csv - > table_10e.csv
awk '{print $0}' < table_Y49.csv | paste table_10e.csv - > table_10f.csv
awk '{print $0}' < table_Y56.csv | paste table_10f.csv - > table_10g.csv
awk '{print $0}' < table_Y62.csv | paste table_10g.csv - > table_10FIN.csv
#
# remove auxiliary files
rm -f table_Y07.csv table_Y14.csv table_Y21.csv table_Y28.csv table_Y35.csv table_Y42.csv table_Y49.csv table_Y56.csv table_Y62.csv
# remove auxiliary files
rm -f table_10k.csv table_10h.csv table_10a.csv table_10b.csv table_10c.csv table_10d.csv table_10e.csv table_10f.csv table_10g.csv
#
# count number of lines
awk 'END{print NR}' table2.csv
# ans: 12726
awk 'END{print NR}' table_10FIN.csv
# ans: 201
#
# RESULT: table reshaped. Initial: 12726 rows 5 columns; Output:  201  rows  11 columns.
# Column 1: cross-section line 400 km long (-200:200 km). Columns 2-11: profiles.

#!/bin/sh
# Unix prog: awk, rm
# AWK script to reshape initial long table.
# Purpose: remove unnecessary columns and only select necessary columns and rows
# Initial table: 12726 rows 5 columns; Output table:  201  rows  11 columns.
#
# awk: reshaped initial GMT table of 62 profiles (select two necessary columns; FS as space).
awk 'BEGIN{FS=" "; OFS=" "} {print $3, $5}' table2.txt > table_10p.txt
# select only profile 1, save as table as 'table_10profiles' with X and Y (location and depths):
awk '/profile -L0-00/,/profile -L0-01/' table_10p.txt > table_10pr.txt
#
# remove auxiliary files
rm -f table_10p.txt
#
# awk: delete header and tail
awk '!/-L0-/' table_10pr.txt > table_10profiles.txt
#
# remove auxiliary files
rm -f table_10pr.txt
#
# awk: select profile i from the initial table by awk (print section of file between two regex).
# i: 1, 7, 14, 21, 28, 35, 42, 49, 56, 62.
awk '/-L0-07/,/-L0-08/' table2.txt > table_p07.txt
awk '/-L0-14/,/-L0-15/' table2.txt > table_p14.txt
awk '/-L0-21/,/-L0-22/' table2.txt > table_p21.txt
awk '/-L0-28/,/-L0-29/' table2.txt > table_p28.txt
awk '/-L0-35/,/-L0-36/' table2.txt > table_p35.txt
awk '/-L0-42/,/-L0-43/' table2.txt > table_p42.txt
awk '/-L0-49/,/-L0-50/' table2.txt > table_p49.txt
awk '/-L0-56/,/-L0-57/' table2.txt > table_p56.txt
awk '/-L0-62/,EOF' table2.txt > table_p62.txt
#
# awk: only take Y column (field 5) from the profile i
awk '{print $5}' table_p07.txt > table_Y07.txt
awk '{print $5}' table_p14.txt > table_Y14.txt
awk '{print $5}' table_p21.txt > table_Y21.txt
awk '{print $5}' table_p28.txt > table_Y28.txt
awk '{print $5}' table_p35.txt > table_Y35.txt
awk '{print $5}' table_p42.txt > table_Y42.txt
awk '{print $5}' table_p49.txt > table_Y49.txt
awk '{print $5}' table_p56.txt > table_Y56.txt
awk '{print $5}' table_p62.txt > table_Y62.txt
#
# remove auxiliary files
rm -f table_p07.txt table_p14.txt table_p21.txt table_p28.txt table_p35.txt table_p42.txt table_p49.txt table_p56.txt table_p62.txt
#
# awk: delete header and tail (print only lines which do NOT match regex)
awk '!/-L0-/' table_Y07.txt > table_Y07n.txt
awk '!/-L0-/' table_Y14.txt > table_Y14n.txt
awk '!/-L0-/' table_Y07.txt > table_Y21n.txt
awk '!/-L0-/' table_Y14.txt > table_Y28n.txt
awk '!/-L0-/' table_Y07.txt > table_Y35n.txt
awk '!/-L0-/' table_Y14.txt > table_Y42n.txt
awk '!/-L0-/' table_Y07.txt > table_Y49n.txt
awk '!/-L0-/' table_Y14.txt > table_Y56n.txt
awk '!/-L0-/' table_Y14.txt > table_Y62n.txt
#
# remove auxiliary files
rm -f table_Y07.txt table_Y14.txt table_Y21.txt table_Y28.txt table_Y35.txt table_Y42.txt table_Y49.txt table_Y56.txt table_Y62.txt
#
# awk: add single Y column of the profile i to the table 'table_10p.txt'; save output to 'table_10i.txt'
awk '{print $0}' < table_Y07n.txt | paste table_10profiles.txt - > table_10.txt
awk '{print $0}' < table_Y14n.txt | paste table_10.txt - > table_10a.txt
awk '{print $0}' < table_Y21n.txt | paste table_10a.txt - > table_10b.txt
awk '{print $0}' < table_Y28n.txt | paste table_10b.txt - > table_10c.txt
awk '{print $0}' < table_Y35n.txt | paste table_10c.txt - > table_10d.txt
awk '{print $0}' < table_Y42n.txt | paste table_10d.txt - > table_10e.txt
awk '{print $0}' < table_Y49n.txt | paste table_10e.txt - > table_10f.txt
awk '{print $0}' < table_Y56n.txt | paste table_10f.txt - > table_10g.txt
awk '{print $0}' < table_Y62n.txt | paste table_10g.txt - > table_10h.txt
#
# remove auxiliary files
rm -f table_Y07n.txt table_Y14n.txt table_Y21n.txt table_Y28n.txt table_Y35n.txt table_Y42n.txt table_Y49n.txt table_Y56n.txt table_Y62n.txt
# remove auxiliary files
rm -f table_10profiles.txt table_10.txt table_10a.txt table_10b.txt table_10c.txt table_10d.txt table_10e.txt table_10f.txt table_10g.txt
#
# count number of lines
awk 'END{print NR}' table2.txt
# ans: 12726
awk 'END{print NR}' table_10h.txt
# ans: 201
#
# RESULT: table reshaped. Initial: 12726 rows 5 columns; Output:  201  rows  11 columns. Column 1: cross-section line 400 km long (-200:200 km). Columns 2-11: profiles. 

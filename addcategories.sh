#!/bin/bash 

awk -F',' '
{ sub(/\r$/, "") }
NR == FNR { category[$1] = $3; next }
FNR == 1 { print $0 ",category"; next }
{ print $0 "," category[$1] }
' categories.csv combined.csv > combined_with_category.csv

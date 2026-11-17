#!/bin/bash

# count drawings and recognized drawings for each word + country
# output goes to summary.csv

awk -F',' '
NR > 1 {
  key = $1 "," $2 "," $4  #use word and country as the unique features
  total[key] = total[key] + 1 #count repeats
  if ($3 == "True") {
    yes[key] = yes[key] + 1 #count number recognized
  }
}
END {
  print "word,countrycode,category,n_drawings,n_recognized"
  for (key in total) { #loop through all unique features
    print key "," total[key] "," yes[key] + 0
  }
}
' combined_with_category.csv > summary.csv #create summary csv

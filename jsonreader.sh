#!/bin/bash

word="$1"

#convert underscore to %20 to be able ot work in a csv 
word="${word//_/%20}" 

#make a new directory for our otuputs 
mkdir -p csv_outputs 

#downloading the quickdraw data 
wget https://storage.googleapis.com/quickdraw_dataset/full/simplified/$word.ndjson 

#pull out word, countrycode, recognized using python

python3 -c '
import json, csv, sys
writer = csv.writer(sys.stdout)  #creates object 
writer.writerow(["word", "countrycode", "recognized"]) #makes the header 
for line in open(sys.argv[1]): #need index 1 because of python passing the script as index 0 so actual file is 1
d = json.loads(line) #turn json text into dictionary so you can call names 
writer.writerow([d["word"], d["countrycode"], d["recognized"]]) #pulls out the three needed cols from json and puts them into the csv
' \
"${word}.ndjson" > "csv_output/${word}.csv" #reads input as json converts to csv and redirects into new directory



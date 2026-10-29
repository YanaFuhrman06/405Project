#!/bin/bash

#this will combine the 345 job outputs into one file with a category column

# run this after all jobs finish using: ./combine.sh

# make sure to check that all 345 summary_*.csv files came back

# write a header line to results/all.csv: word,country,recognized,category

#loop over each summary_*.csv files to get word,country,recognized and then use categories.csv to match the word to the category

#!/bin/bash

#loops through csv files combines into 1 csv using python 

python3 -c '
#import necessary packages 
import os 
import pandas as pd 

#establish directory and path 
csv_dir = "csv_outputs"
out_path = "combined.csv" #this is where everything is goign 

frames = [] #each of the csv will end up as tables inside here 
for name in sorted(os.listdir(csv_dir)): #going through each csv file in the directory 
  if name.endswith(".csv"): #error check -- make sure its a csv 
    frames.append(pd.read_csv(os.path.join(csv_dir, name))) #adds table to the big csv 

combined = pd.concat(frames, ignore_index=True) #shrink all the tables into one 
combined.to_csv(out_path, index=False) #save result but get rid of extra row numbers '


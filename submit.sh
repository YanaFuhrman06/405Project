#!/bin/bash
#Establish 345 indvidual jobs 
#SBATCH --array=1-345  
#write outputs of each result to the results folder and name each file job + id number 
#SBATCH --output=results/job$a.out

#loop through words.txt and send each word as parameter to jsonreader.sh
word=$(sed -n "${SLURM_ARRAY_TASK_ID}p" words.txt)
./jsonreader.sh "$word"

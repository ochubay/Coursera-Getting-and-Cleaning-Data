Tidy data preparation from the Human Activity Recognition Using Smartphones datasets
========================
This repo contains the files (scripts and tidy dataset) for the final project assignment at "Getting and Cleaning Data" Coursera course:
####
1. run_analysis.R
2. tidy_data_summary.txt
3. codebook.md

### run_analysis.R
1. This script implements run_analysis function which prepares tidy dataset based on several input datasets with raw data obtained from the [Human Activity Recognition Using Smartphones experiment](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)
2. Download [zip archive with datasets] (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) and unpack it. The unpacked directory will contain 4 text files and 2 subdirectories (test and train)
3. Put run_analysis.R from this repo into the unpacked directory
4. Make sure that your working directory in R points to this unpacked directory
5. Source run_analysis.R and call run_analysis() 
6. Once the function finishes execution it will save tidy dataset into tidy_data_summary.txt file located in the same directory 

### tidy_data_summary.txt
1. This tidy data set is a result of running run_analysis function
2. It contains 180 rows summarizing means of 79 variables for each "activity" and "subject" (so in total it contains 81 columns)
3. Please refer to the codebook.md located in this repo for more details.

### codebook.md
* This file describes the variables, the data, and any transformations or work performed to clean up the data

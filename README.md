# Getting_and_Cleaning_Data
Submission of final project for Coursera Course, Getting and Cleaning Data
This script takes data from the Human Activity Recognition Dataset and merges the test and train data to make a tidy dataset
To begin Download the data from: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
Download the R script: "Getting and Cleaning Data"
Load the packages: xlsx and dplyr in R
set your workng directory to where you downloaded the Human Activity Recogniation Data
Run the R script, line 7 and 8 will read in the train data
line 11 will combine those datasets
line 14 and 15 reads in the test data
line 17 will combine the test data
line 20 will combine the raw test and train data
line 22 through 26 will read in the column names and create a name for the column "activity"
line 29 will find which columns deal with mean and st. deviation
line 31 will select just the columns with mean and st. deviation
line 38 through 44 will create descriptive names to the activities
line 46 will rearrange the descriptive name to be the first column
line 49 will write the final data called Final_Data.txt

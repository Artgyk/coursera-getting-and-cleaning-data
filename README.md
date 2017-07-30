### Introduction

This is programming assignment for ""Getting and Cleaning Data" course.

### Description

Repository contains two files
run_anilytics.R and result.txt

result.txt - is a result of execution run_anilytics.R script saved in txt format.

run_anilytics.R - script which calculate the average of each variable for each activity and each subject from UCI HAR Dataset.

Before running this script you need to download original data set from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
and unpack it to your working folder

run_anilytics.R contains three functions
load_raw_df - load raw data from original dataset
load_df - merge test and train data set. and tidy data
run_anilytics - function for calculation average the average of each variable for each activity and each subject

## Dependency
For run this script you need to install this package:
dplyr

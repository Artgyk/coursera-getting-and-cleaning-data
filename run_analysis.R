library(dplyr)

## These functions calculate average value of variables for each subject and activity in "UCI HAR Dataset".. 

 
## Define functions for loading raw data from data set

load_raw_df <- function(set_name){
  x_df <- read.fwf(file.path("UCI HAR Dataset", set_name,paste("X_",set_name,".txt", sep = '')), c(-1,rep(16, 561)))
  y_df <- read.delim(file.path("UCI HAR Dataset", set_name,paste("y_" , set_name ,".txt", sep = '')), header = FALSE)
  
  subject_df <- read.delim(file.path("UCI HAR Dataset", set_name, paste("subject_" , set_name ,".txt", sep = '')), header = FALSE)
  
  bind_cols(subject_df, y_df, x_df)
  
}

## Define functions for merging train and test datasets.
## Makes dataset tidy


load_df <- function(){
  
  train_set<-load_raw_df("train")
  test_set<-load_raw_df("test")
  
  combined_set <- bind_rows(train_set, test_set)
  
  feauters<-read.delim("UCI HAR Dataset/features.txt", header = FALSE, sep = ' ', stringsAsFactors = FALSE)
  names(combined_set)<-c('subject', 'activity_label', feauters$V2)
  
  activity_lables<-read.delim("UCI HAR Dataset/activity_labels.txt", header =FALSE, sep = ' ', stringsAsFactors = FALSE)
  names(activity_lables)<-c('activity_label','activity')
  combined_set<-merge(x, activity_lables, by='activity_label')
  
  valid_column_names <- make.names(names=names(xx), unique=TRUE, allow_ = TRUE)
  valid_column_names<-gsub('\\.+','.', valid_column_names)
  valid_column_names<-gsub('\\.$', '', valid_column_names)
  names(combined_set)<-valid_column_names
  
  combined_set<-tbl_df(combined_set)
  
  combined_set
}

## Define functions for calculation average of each variable for each activity and each subject.

run_analytics<-function(){
  set <- load_df()
  
  set %>% 
    select(subject, activity, contains('mean'), contains('std')) %>%
    group_by(subject, activity) %>%
    summarise_all(c('mean'))
}
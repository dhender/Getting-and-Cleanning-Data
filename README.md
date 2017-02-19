#  Coursera Getting and Cleaning Data - Course Project
Demonstrate capability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis 

Website Links: Descripton & input data for project 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
### Repo Contents
* CodeBook.md
* run_analysis.R
* ReadMe.md

### Requirements for R-Script (run_analysis.R)
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
### Output Deliverable
```
write.table(FinalTidySet, file = "tidydata.txt",row.name=FALSE,quote = FALSE, sep = '\t')
write.csv(FinalTidySet, "tidydata.csv", row.names=FALSE)
```
### Additional Information
Refer to CodeBook.md for information about the variables, data and transformations.
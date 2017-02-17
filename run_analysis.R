## Coursera Getting and Cleaning Data Course Project
##
## Website Links: Descripton & input data for project 
## http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
## https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
##
## REQUIREMENTS for R-Script: run_analysis.R
## -------------------------------------------------------------------------
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for 
## each measurement. 
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive variable names. 
## 5. From the data set in step 4, creates a second, independent tidy data 
## set with the average of each variable for each activity and each subject.
## -------------------------------------------------------------------------
#
# Verify working directory is set
WD <- getwd() 
if (!is.null(WD)) setwd(WD)
#
# Clear workspace
rm(list=ls())
#
# ------------------------------------------------------------------------------
# 0. Dataset Gathering - download .zip file into working directory folder 'data'
# ------------------------------------------------------------------------------
# 
# 'data' directory verification - if folder doesn't exist it will get created
if(!file.exists("./data")){
  
  dir.create("./data")

}
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

# Verify if .zip file exists in 'data' folder, otherwise download

if(!file.exists("./data/Dataset.zip")){
  
  download.file(url,destfile="./data/Dataset.zip",mode = "wb")
  
}

# Verify if dataset is unzipped, otherwise execute extraction 
path <- file.path("./data" , "UCI HAR Dataset")
if(!file.exists(path)){

  unzip(zipfile="./data/Dataset.zip",exdir="./data")
  
}
# Read in dataset files:
activityLabels <- read.table(file.path(path,"activity_labels.txt"),header=FALSE)
features       <- read.table(file.path(path,"features.txt"),header=FALSE)
#
subjectTrain   <- read.table(file.path(path,"train","subject_train.txt"),header=FALSE)
featureTrain   <- read.table(file.path(path,"train","X_train.txt"),header=FALSE)
activityTrain  <- read.table(file.path(path,"train","y_train.txt"),header=FALSE)
#
subjectTest    <- read.table(file.path(path,"test","subject_test.txt"),header=FALSE)
featureTest    <- read.table(file.path(path,"test","X_test.txt"),header=FALSE)
activityTest   <- read.table(file.path(path,"test","y_test.txt"),header=FALSE)
#
# ------------------------------------------------------------------------------
# 1. Merge Training & Test dataset
# ------------------------------------------------------------------------------
#
subjectData            <- rbind(subjectTrain,subjectTest) # combine rows
colnames(subjectData)  <- "subjectID" # assign column name
#
featureData            <- rbind(featureTrain,featureTest) # combine rows
colnames(featureData)  <- features[,2] # assign column names according to features.txt
#
activityData           <- rbind(activityTrain,activityTest) # combine rows
colnames(activityData) <- "activityID" # assign column name
#
mergeData              <- cbind(featureData,subjectData,activityData) # combine cols
# Remove remaining files to conserve memory space 
rm(subjectTrain, subjectTest, featureTrain)
rm(featureTest,activityTrain, activityTest)
#
# ------------------------------------------------------------------------------
# 2. Column Extraction - subjectID, activityID, mean, std 
# ------------------------------------------------------------------------------
#
columnsToKeep   <- grepl("subjectID|activityID|mean|std", colnames(mergeData))
subsetMergeData <- mergeData[, columnsToKeep]
#
# ------------------------------------------------------------------------------
# 3. Apply descriptive activity names to the activities in the data set
# ------------------------------------------------------------------------------
#
subsetMergeData$activityID <- factor(subsetMergeData$activityID,labels=activityLabels[,2])
#
# ------------------------------------------------------------------------------
# 4. Update abbreviated column names with appropriate descriptions
# ------------------------------------------------------------------------------
#
names(subsetMergeData)<-gsub("^t", "time", names(subsetMergeData))
names(subsetMergeData)<-gsub("^f", "frequency", names(subsetMergeData))
names(subsetMergeData)<-gsub("Acc", "Accelerometer", names(subsetMergeData))
names(subsetMergeData)<-gsub("Gyro", "Gyroscope", names(subsetMergeData))
names(subsetMergeData)<-gsub("Mag", "Magnitude", names(subsetMergeData))
names(subsetMergeData)<-gsub("BodyBody", "Body", names(subsetMergeData))
# ------------------------------------------------------------------------------
# 5. Creates independent tidy set with the average/mean of each variable for each 
# activity and each subject.
# ------------------------------------------------------------------------------
#
IndependentSet <- aggregate(. ~subjectID + activityID, subsetMergeData, mean)
# Orders the columns subjectID & activityID in the independent dataset
FinalTidySet <- IndependentSet[order(IndependentSet$subjectID, IndependentSet$activityID),]
#
# Write output to .txt & .cvs file
write.table(FinalTidySet, file = "tidydata.txt",row.name=FALSE,quote = FALSE, sep = '\t')
write.cvs(FinalTidySet, file = "tidydata.cvs",row.name=FALSE)
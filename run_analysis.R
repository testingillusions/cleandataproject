## run_analysis.R
## Developed by Joe Wood
## For: Clean Data, Week 4 Project Assignment

## Purpose of Script:
## 1) Merges the training and the test sets to create one data set.
## 2) Extracts only the measurements on the mean and standard deviation for each 
##    measurement.
## 3) Uses descriptive activity names to name the activities in the data set
## 4) Appropriately labels the data set with descriptive variable names.
## 5) From the data set in step 4, creates a second, independent tidy data set  
##    with the average of each variable for each activity and each subject.

## Data set that will be utilized:
## Data collected from the accelerometers from the Samsung Galaxy S smartphone. 
## 
## A full description is available at the site where the data was obtained:
## http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
## 
## Dataset Utilized in this script is located here:
## https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## This script will produce two datasets:
##
## fullgalaxyactivity_df - Contains the means of all features for each
##                              observation in the original dataset 
##
## groupedgalaxyactivity_df - Contains a summarized version of the 
##                                 fullgalaxyactivity_df dataset with the 
##                                 average of each variable for each activity
##                                 and each subject. 


##Load Packages
library(readr)
library(dplyr)

## Acquire Data from source and load data elements:
fileurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileurl, "ucidataset.zip")
unzip("ucidataset.zip", exdir= "./rawdata")
## Now all files are in ./rawdata/UCI HAR Dataset/

## Remove unneeded variables
rm(fileurl)


## Read in Activity Labels
activitylabels_df <-read.delim("./rawdata/UCI HAR Dataset/activity_labels.txt", sep = " ", header = FALSE)
colnames(activitylabels_df) <- c("activityid", "activityname")

## Reading Feature Labels
featurelabels_df <-read.delim("./rawdata/UCI HAR Dataset/features.txt", sep = " ", header = FALSE)
colnames(featurelabels_df) <- c("id", "colname")

## Processing the Training Dataset
##
## Load in the Subjects data:
trainingsubjects_df <-read.delim("./rawdata/UCI HAR Dataset/train/subject_train.txt", sep = " ", header = FALSE)
colnames(trainingsubjects_df) <- c("subjectid")
trainingsubjects_df$dataset <- "train"

## Load in the Activity data:
trainingactivities_df <-read.delim("./rawdata/UCI HAR Dataset/train/Y_train.txt", sep = " ", header = FALSE)
colnames(trainingactivities_df) <- c("activityid")

## Load in the Feature measurements:
trainingx_df <-
        read_fwf(
                file="./rawdata/UCI HAR Dataset/train/X_train.txt",
                fwf_widths(rep(c(16), times=561),col_names = as.character(featurelabels_df$colname)),
                n_max=-1,
                progress = interactive())

## Combine the Subject, Activities, and Feature Measurements into one data frame                
trainingset_df <- cbind(trainingsubjects_df,trainingactivities_df,trainingx_df)        

## Remove dataframes we don't need anymore
rm(trainingsubjects_df)
rm(trainingactivities_df)
rm(trainingx_df)

## Processing the Test Dataset
##
## Load in the Subjects data:
testsubjects_df <-read.delim("./rawdata/UCI HAR Dataset/test/subject_test.txt", sep = " ", header = FALSE)
colnames(testsubjects_df) <- c("subjectid")
testsubjects_df$dataset <- "test"


## Load in the Activity data:
testactivities_df <-read.delim("./rawdata/UCI HAR Dataset/test/Y_test.txt", sep = " ", header = FALSE)
colnames(testactivities_df) <- c("activityid")

## Load in the Feature measurements:
testx_df <-
        read_fwf(
                file="./rawdata/UCI HAR Dataset/test/X_test.txt",
                fwf_widths(rep(c(16), times=561),col_names = as.character(featurelabels_df$colname)),
                n_max=-1,
                progress = interactive())
## Combine the Subject, Activities, and Feature Measurements into one data frame                
testset_df <- cbind(testsubjects_df,testactivities_df,testx_df)

## Remove dataframes we don't need anymore
rm(testsubjects_df)
rm(testactivities_df)
rm(testx_df)

##Merges the training and the test sets to create one data set.
totalSet_df <- rbind(trainingset_df, testset_df)

## Remove dataframes we don't need anymore
rm(featurelabels_df)
rm(trainingset_df)
rm(testset_df)

## 2) Extracts only the measurements on the mean and standard deviation for each 
##    measurement.
activityid_col_idx <- grep("activityid", names(totalSet_df))
dataset_col_idx <- grep("dataset", names(totalSet_df))
subjectid_col_idx <- grep("subjectid", names(totalSet_df))

reducedtotalset_df <- totalSet_df[,c(subjectid_col_idx,
                                     dataset_col_idx,
                                     activityid_col_idx,
                                     grep(".*(mean\\(\\)|std\\(\\)).*",
                                          colnames(totalSet_df)))]
## Remove dataframes and variables we don't need anymore
rm(totalSet_df)
rm(dataset_col_idx)
rm(subjectid_col_idx)
rm(activityid_col_idx)

## 3) Uses descriptive activity names to name the activities in the data set

#Add Descriptive column for activities 
fullgalaxyactivity_df <- inner_join(reducedtotalset_df, 
                               activitylabels_df)

#Move columns around to make the dataset more readable
activityname_col_idx <- grep("activityname", names(fullgalaxyactivity_df))
fullgalaxyactivity_df <- fullgalaxyactivity_df[, c(activityname_col_idx, (1:ncol(fullgalaxyactivity_df))[-activityname_col_idx])]

activityid_col_idx <- grep("activityid", names(fullgalaxyactivity_df))
fullgalaxyactivity_df <- fullgalaxyactivity_df[, c(activityid_col_idx, (1:ncol(fullgalaxyactivity_df))[-activityid_col_idx])]

dataset_col_idx <- grep("dataset", names(fullgalaxyactivity_df))
fullgalaxyactivity_df <- fullgalaxyactivity_df[, c(dataset_col_idx, (1:ncol(fullgalaxyactivity_df))[-dataset_col_idx])]

subjectid_col_idx <- grep("subjectid", names(fullgalaxyactivity_df))
fullgalaxyactivity_df <- fullgalaxyactivity_df[, c(subjectid_col_idx, (1:ncol(fullgalaxyactivity_df))[-subjectid_col_idx])]

## Remove dataframes we don't need anymore
rm(activitylabels_df)
rm(reducedtotalset_df)
rm(dataset_col_idx)
rm(subjectid_col_idx)
rm(activityid_col_idx)
rm(activityname_col_idx)

## 4) Appropriately labels the data set with descriptive variable names.

## remove all "()"
colnames(fullgalaxyactivity_df) <- sub("\\(\\)","",names(fullgalaxyactivity_df))
## remove all "-"
colnames(fullgalaxyactivity_df) <- gsub("-","",names(fullgalaxyactivity_df))
##lowercase all
colnames(fullgalaxyactivity_df) <- tolower(names(fullgalaxyactivity_df))

## 5) From the data set in step 4, creates a second, independent tidy data set  
##    with the average of each variable for each activity and each subject.

## Group the data by SubjectID and then ActivityName, then run the mean() 
## function on all the columns

groupedgalaxyactivity_df <- fullgalaxyactivity_df %.%
        group_by(subjectid, activityname) %.%
        summarise_each(funs(mean))

## Remove the "dataset" column, as it is now not applicable in this dataset. 
groupedgalaxyactivity_df <- select(groupedgalaxyactivity_df,-dataset)



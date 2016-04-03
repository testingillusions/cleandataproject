# Getting and Cleaning Data Course Project

Developed by Joe Wood

**Purpose of Script:**

The purpose of this script is to take the raw data collected by UCI from the accelerometers from the Samsung Galaxy S smartphone and create two data sets for use in further analysis.

**Steps taken to create this dataset:**

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

**Data set that will be utilized:**

Data collected from the accelerometers from the Samsung Galaxy S smartphone. 

A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Dataset Utilized in this script is located here:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

**What this script produces:**

This script will produce two datasets:

**fullgalaxyactivity_df** - Contains the means of all features for each
                        observation in the original dataset 

**groupedgalaxyactivity_df** - Contains a summarized version of the 
                           fulldescriptiveactivity_df dataset with the 
                           average of each variable for each activity
                           and each subject. 

Full descriptions of the data set can be found in codeBook.md
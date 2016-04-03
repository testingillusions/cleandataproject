# Code Book for UCI Samsung Galaxy Dataset

Developed by Joe Wood

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
                           
                           
##fullgalaxyactivity_df

This is a dataframe with the following four indetification columns and sixty-six feature observation. 

The four identification columns are:

* subjectid - Subject Identification Code
        + numeric
        + integer between 1 and 30
* dataset - Indication of origination from the original Datasets
        + character
        + values:
                ++ test - Originated from the Test Dataset
                ++ train - Originated from the Training Dataset
* activityid - Activity Identification Code
        + numeric
        + integer between 1 and 6
        + values:
                ++ 1 WALKING
                ++ 2 WALKING_UPSTAIRS
                ++ 3 WALKING_DOWNSTAIRS
                ++ 4 SITTING
                ++ 5 STANDING
* activityname - Descriptive Activity Name
        + character
        + values:
                ++ 1 WALKING
                ++ 2 WALKING_UPSTAIRS
                ++ 3 WALKING_DOWNSTAIRS
                ++ 4 SITTING
                ++ 5 STANDING


The sixty-six feature columns contain the mean and standard deviation columns of the original data set for all the unique features. 

The features originate from the original data sets columns for mean, denoted as mean() and standard deviation, denoted as std(). All of the data comes from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

The columns available in this data set are as follows. All are numeric, containing exactly one entry per row. 

*tbodyaccmeanx
*tbodyaccmeany           
*tbodyaccmeanz

*tbodyaccstdx
*tbodyaccstdy            
*tbodyaccstdz 

*tgravityaccmeanx 
*tgravityaccmeany        
*tgravityaccmeanz

*tgravityaccstdx
*tgravityaccstdy         
*tgravityaccstdz

*tbodyaccjerkmeanx
*tbodyaccjerkmeany       
*tbodyaccjerkmeanz

*tbodyaccjerkstdx
*tbodyaccjerkstdy        
*tbodyaccjerkstdz

*tbodygyromeanx
*tbodygyromeany          
*tbodygyromeanz

*tbodygyrostdx
*tbodygyrostdy           
*tbodygyrostdz

*tbodygyrojerkmeanx
*tbodygyrojerkmeany      
*tbodygyrojerkmeanz 

*tbodygyrojerkstdx
*tbodygyrojerkstdy       
*tbodygyrojerkstdz 

*tbodyaccmagmean
*tbodyaccmagstd          

*tgravityaccmagmean
*tgravityaccmagstd

*tbodyaccjerkmagmean     
*tbodyaccjerkmagstd       

*tbodygyromagmean         
*tbodygyromagstd   

*tbodygyrojerkmagmean     
*tbodygyrojerkmagstd      

*fbodyaccmeanx           
*fbodyaccmeany
*fbodyaccmeanz 

*fbodyaccstdx            
*fbodyaccstdy
*fbodyaccstdz

*fbodyaccjerkmeanx       
*fbodyaccjerkmeany
*fbodyaccjerkmeanz    

*fbodyaccjerkstdx        
*fbodyaccjerkstdy
*fbodyaccjerkstdz

*fbodygyromeanx          
*fbodygyromeany
*fbodygyromeanz 

*fbodygyrostdx           
*fbodygyrostdy 
*fbodygyrostdz  

*fbodyaccmagmean         
*fbodyaccmagstd
*fbodybodyaccjerkmagmean  
*fbodybodyaccjerkmagstd  

*fbodybodygyromagmean
*fbodybodygyromagstd      

*fbodybodygyrojerkmagmean
*fbodybodygyrojerkmagstd 

##groupedgalaxyactivity_df

This is a dataframe with the following three indetification columns and sixty-six feature observation that is an average of the fullgalaxyactivity_df dataframe for each subject and each activity. 

The three identification columns are:

* subjectid - Subject Identification Code
        + numeric
        + integer between 1 and 30

* activityid - Activity Identification Code
        + numeric
        + integer between 1 and 6
        + values:
                ++ 1 WALKING
                ++ 2 WALKING_UPSTAIRS
                ++ 3 WALKING_DOWNSTAIRS
                ++ 4 SITTING
                ++ 5 STANDING

* activityname - Descriptive Activity Name
        + character
        + values:
                ++ 1 WALKING
                ++ 2 WALKING_UPSTAIRS
                ++ 3 WALKING_DOWNSTAIRS
                ++ 4 SITTING
                ++ 5 STANDING

All sixty-six feature columns are the mean of the sub groups Subject->Activity calcualted by using the summeans() function. 

All columns has the same defination as the originating fullgalaxyactivities_df dataframe from above. 
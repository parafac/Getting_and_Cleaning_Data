---
title: "CodeBook"
output: html_document
---

## Introduction

This document describes the data, the variables, and R code and analysis for getting and cleaning up the data. It is the class project for the DataScience track's "Getting and Cleaning Data" course at Coursera.

## Data Source

The data was collected from the accelerometers from the Samsung Galaxy S smartphone. The experiments were carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, the researchers captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments were video-recorded to label the data manually. The obtained dataset was randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The data for the project can be downloaded from

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

A full description is available at the site where the data was originally obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 


## Data Set

After unzipping the source data file, one will see the following files under the "./UCI HAR Dataset/" directory:

#### Data Files


The following data files are read in by the R script run_analysis.R for analysis.

* 'features.txt' - list of all features
* 'activity_labels.txt' - index the activities with their activity name
* 'train/X_train.txt'- training set with all measurements
* 'train/y_train.txt' - training set with activity indices
* 'train/subject_train.txt' - each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
* 'test/X_test.txt'- test set with all measurements
* 'test/y_test.txt' - test set with activity indices
* 'test/subject_test.txt' - each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

Additional files are included in the data set, but were not used by run_analysis.R. 

* 'features_info.txt' - contains some information about the variables used on the feature vector.
* 'train/Inertial Signals/body_acc_x_train.txt' - the body acceleration signal obtained by subtracting the gravity from the total acceleration. 
* 'train/Inertial Signals/body_gyro_x_train.txt' - the angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. Data in this directory were not used in analysis
* 'train/Inertial Signals/total_acc_x_train.txt' - the acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. Data in this directory were not used in analysis
* Other files in 'train/Inertial Signals/' and 'test/Inertial Signals/'

#### Activities

The subjects in this experiment performed the following six activities

* WALKING 
* WALKING_UPSTAIRS 
* WALKING_DOWNSTAIRS 
* SITTING 
* STANDING 
* LAYING

The activities are listed in the file "./UCI HAR Dataset/activity_labels.txt".

#### Features and Variables

The features selected for this experiment come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz.

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals).

These signals were used to estimate variables of the feature vector for each pattern: '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

There are 561 features or variables in the data obtained from the experiment. They are listed in the file "./UCI HAR Dataset/features.txt". In the analysis, we will extract only the measurements on the mean and standard deviation for each measurement. This results 66 varaibles for further manipulation. They are

* tBodyAcc-mean()-X           
* tBodyAcc-mean()-Y          
* tBodyAcc-mean()-Z           
* tBodyAcc-std()-X           
* tBodyAcc-std()-Y            
* tBodyAcc-std()-Z           
* tGravityAcc-mean()-X        
* tGravityAcc-mean()-Y       
* tGravityAcc-mean()-Z        
* tGravityAcc-std()-X        
* tGravityAcc-std()-Y         
* tGravityAcc-std()-Z        
* tBodyAccJerk-mean()-X       
* tBodyAccJerk-mean()-Y      
* tBodyAccJerk-mean()-Z       
* tBodyAccJerk-std()-X       
* tBodyAccJerk-std()-Y        
* tBodyAccJerk-std()-Z       
* tBodyGyro-mean()-X          
* tBodyGyro-mean()-Y         
* tBodyGyro-mean()-Z          
* tBodyGyro-std()-X          
* tBodyGyro-std()-Y           
* tBodyGyro-std()-Z          
* tBodyGyroJerk-mean()-X      
* tBodyGyroJerk-mean()-Y     
* tBodyGyroJerk-mean()-Z      
* tBodyGyroJerk-std()-X      
* tBodyGyroJerk-std()-Y       
* tBodyGyroJerk-std()-Z      
* tBodyAccMag-mean()          
* tBodyAccMag-std()          
* tGravityAccMag-mean()       
* tGravityAccMag-std()       
* tBodyAccJerkMag-mean()      
* tBodyAccJerkMag-std()      
* tBodyGyroMag-mean()         
* tBodyGyroMag-std()         
* tBodyGyroJerkMag-mean()     
* tBodyGyroJerkMag-std()     
* fBodyAcc-mean()-X           
* fBodyAcc-mean()-Y          
* fBodyAcc-mean()-Z           
* fBodyAcc-std()-X           
* fBodyAcc-std()-Y            
* fBodyAcc-std()-Z           
* fBodyAccJerk-mean()-X       
* fBodyAccJerk-mean()-Y      
* fBodyAccJerk-mean()-Z       
* fBodyAccJerk-std()-X       
* fBodyAccJerk-std()-Y        
* fBodyAccJerk-std()-Z       
* fBodyGyro-mean()-X          
* fBodyGyro-mean()-Y         
* fBodyGyro-mean()-Z          
* fBodyGyro-std()-X          
* fBodyGyro-std()-Y          
* fBodyGyro-std()-Z          
* fBodyAccMag-mean()          
* fBodyAccMag-std()          
* fBodyBodyAccJerkMag-mean()  
* fBodyBodyAccJerkMag-std()  
* fBodyBodyGyroMag-mean()     
* fBodyBodyGyroMag-std()     
* fBodyBodyGyroJerkMag-mean() 
* fBodyBodyGyroJerkMag-std() 

## Work Flow and Analysis

R script called run_analysis.R that does the following. 

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

In addition, the script downloads and unzips the data, and write out the tidy data set at the end. Each step is decribed in details in the following sections.

#### Download and Unzip the Data

The following R code was used to download and unzip the data set from the data source URL.

```
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
localFile <- "projectData.zip"
download.file(fileURL, destfile = localFile)
unzip(localFile)
```
This part of code should be executed once, and comment out if one want to change and experiment with the code.

#### Read In Data

The unzipped data resides in the './UCI HAR Dataset/'. directory. The following code piece reads in all data needed for analysis.

```
trainDataFile     <- "./UCI HAR Dataset/train/X_train.txt"
trainSubjectFile  <- "./UCI HAR Dataset/train/subject_train.txt"
trainActivityFile <- "./UCI HAR Dataset/train/y_train.txt"   

trainData     <- read.table(trainDataFile, header = FALSE)
trainSubject  <- read.table(trainSubjectFile, header = FALSE)
trainActivity <- read.table(trainActivityFile, header = FALSE)

numTraining <- nrow(trainData)

testDataFile     <- "./UCI HAR Dataset/test/X_test.txt"
testSubjectFile  <- "./UCI HAR Dataset/test/subject_test.txt"
testActivityFile <- "./UCI HAR Dataset/test/y_test.txt"

testData     <- read.table(testDataFile, header = FALSE)
testSubject  <- read.table(testSubjectFile, header = FALSE)
testActivity <- read.table(testActivityFile, header = FALSE)

numTest <- nrow(testData)

labelFile  <- "./UCI HAR Dataset/activity_labels.txt"
activities <- read.table(labelFile, header = FALSE)

featureFile <- "./UCI HAR Dataset/features.txt"
features    <- read.table(featureFile, header = FALSE)

```

#### Merges the Training and the Test Sets

Training data and test data can be merged with rbind function.

```
allData     <- rbind(trainData, testData)
allSubject  <- rbind(trainSubject, testSubject)
allActivity <- rbind(trainActivity, testActivity)
```

Subject and Activity are not appended into measurement data at this point but at later step.

#### Extract a Subset of Data

Next we extracts only the measurements on the mean and standard deviation for each measurement. This can be done using grep function with proper pattern and subseting the measurement.

```
selectColumns <- grep(".*-mean[()].*|.*-std[()].*", features[,2])
selectData    <- allData[,selectColumns]
```

#### Apply Descriptive Activity Names

We use the activity description from the activity_labels.txt and the factor function to assign descriptive names to activities.

```
allActivity$V1 <- factor(allActivity$V1, levels=activities$V1, labels=activities$V2)
```

#### Label the Variables

Subset select variable names from the feature list and assign them to the measure data using the colnames function. Now we can put all subjects, activities, and subselected measurement data into one table using the cbind function.  

```
varNames <- features[selectColumns, 2]

colnames(selectData)  <- varNames
colnames(allSubject)  <- "Subject"
colnames(allActivity) <- "Activity"

selectData <- cbind(allSubject, allActivity, selectData)
```

#### Create a Tidy Data Set

From the data set in the previous, we create a tidy data set with the average of each variable for each activity and each subject. This can be done with one line using the the aggregate function.

```
tidyData <- aggregate(. ~ Subject+Activity, data=selectData, FUN=mean)
```

#### Output Tidy Data Set

The tidy data set with the average of each variable for each activity and each subject is written to a file named tidy_data.txt at the same directory as the script using the write.table function with row.name=FALSE.

```
outputFile = "./tidy_data.txt"
write.table(tidyData, file = outputFile, sep = "\t", row.name = FALSE)
```

#### How to Read In the Tidy Data Set 

The tidy data set can be read in by the R function read.table.

```
read.table("./tidy_data.txt", header=TRUE)
```

library(data.table)

# download zip data file from the source URL
# store it in local disk and unzip the data file
# this part only run once, should be commented out after first run

fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
localFile <- "projectData.zip"
download.file(fileURL, destfile = localFile)
unzip(localFile)

# specify data files and load data into tables

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

#
# 1. Merges the training and the test sets to create one data set.
#    But don't put them all together yet, will do that at step 4.
#

allData     <- rbind(trainData, testData)
allSubject  <- rbind(trainSubject, testSubject)
allActivity <- rbind(trainActivity, testActivity)

#
# 2. Extracts only the measurements on the mean and standard deviation 
#    for each measurement. 
#

selectColumns <- grep(".*-mean[()].*|.*-std[()].*", features[,2])
selectData    <- allData[,selectColumns]

#
# 3. Uses descriptive activity names to name the activities in the data set
#

allActivity$V1 <- factor(allActivity$V1, levels=activities$V1, labels=activities$V2)

# 
# 4. Appropriately labels the data set with descriptive variable names. 
# 

varNames <- features[selectColumns, 2]

colnames(selectData)  <- varNames
colnames(allSubject)  <- "Subject"
colnames(allActivity) <- "Activity"

selectData <- cbind(allSubject, allActivity, selectData)

#
# 5. From the data set in step 4, creates a second, independent tidy 
#    data set with the average of each variable for each activity and 
#    each subject.
#

tidyData <- aggregate(. ~ Subject+Activity, data=selectData, FUN=mean)

#
# output tidy data set
#

outputFile = "./tidy_data.txt"
write.table(tidyData, file = outputFile, sep = "\t", row.name = FALSE)

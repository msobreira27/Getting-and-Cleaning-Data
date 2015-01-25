#Libraries Needed
library(dplyr)

#Load Labels and features- or variable names - into tables
#THis assumes unzipping the Samsung Data to the working directory - keeping the same structure

activityLabels <- read.table("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/activity_labels.txt")
features <- read.table("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/features.txt")

#Load Training Data into tables
subjectTrain <- read.table("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/subject_train.txt")
xTrain <- read.table("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/X_train.txt")
yTrain <- read.table("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/y_train.txt")


#Load Test Data into tables
subjectTest <- read.table("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/subject_test.txt")
xTest <- read.table("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/X_test.txt")
yTest <- read.table("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/y_test.txt")

## Step 1 - Merges the training and the test sets to create one data set.
superSetTrain <- cbind(subjectTrain, yTrain, xTrain)
superSetTest <- cbind(subjectTest, yTest, xTest)
superSet <- rbind(superSetTrain,superSetTest)
variableColumn <- select(features, V2) #select only the second column of features dataframe 
fixedVariables <- data.frame(c("subject", "activity")) #names to the two merged columns
names(fixedVariables) = c("V2")
variableNames <- rbind(fixedVariables,variableColumn) #Creates a dataframe with all the variables
vectorVariableNames <- as.character(variableNames[,"V2"]) #transform the dataframe in vector for values to be passed
names(superSet) <- vectorVariableNames

## Step 2 - Extracts only the measurements on the mean and standard deviation for each measurement.
## Note that I opted to take only means that pair with standard Deviation, eliminating date on angle
## and freqMean becuase these did not comply on havind std deviation for measure.

vectorMean <- grep("-mean()",names(superSet), fixed=TRUE) #filters the means
vectorStd <- grep("-std()", names(superSet), fixed=TRUE) #filters the standard Deviations
vectorTotal = c(c(1,2),vectorMean, vectorStd)
vectorTotalOrdered <- sort(vectorTotal)
meanStdSet <- superSet[, vectorTotalOrdered]

## Step 3 - Uses descriptive activity names to name the activities in the data set
meanStdSet$activity <- as.character(meanStdSet$activity)
meanStdSet$activity[meanStdSet$activity==1] <- "WALKING"
meanStdSet$activity[meanStdSet$activity==2] <- "WALKING_UPSTAIRS"
meanStdSet$activity[meanStdSet$activity==3] <- "WALKING_DOWNSTAIRS"
meanStdSet$activity[meanStdSet$activity==4] <- "SITTING"
meanStdSet$activity[meanStdSet$activity==5] <- "STANDING"
meanStdSet$activity[meanStdSet$activity==6] <- "LAYING"

## Step 4 - Appropriately labels the data set with descriptive variable names. 
names(meanStdSet) <- c(
        "subject",
        "activity",
        "timeDomainBodyAccelerometerMeanX",
        "timeDomainBodyAccelerometerMeanY",
        "timeDomainBodyAccelerometerMeanZ",
        "timeDomainBodyAccelerometerStandardDeviationX",
        "timeDomainBodyAccelerometerStandardDeviationY",
        "timeDomainBodyAccelerometerStandardDeviationZ",
        "timeDomainGravityAccelarationMeanX",
        "timeDomainGravityAccelarationMeanY",
        "timeDomainGravityAccelarationMeanZ",
        "timeDomainGravityAccelarationStandardDeviationX",
        "timeDomainGravityAccelarationStandardDeviationY",
        "timeDomainGravityAccelarationStandardDeviationZ",
        "timeDomainBodyAccelerationJerkMeanX",
        "timeDomainBodyAccelerationJerkMeanY",
        "timeDomainBodyAccelerationJerkMeanZ",
        "timeDomainBodyAccelerationJerkStandardDeviationX",
        "timeDomainBodyAccelerationJerkStandardDeviationY",
        "timeDomainBodyAccelerationJerkStandardDeviationZ",
        "timeDomainBodyGyroscopeMeanX",
        "timeDomainBodyGyroscopeMeanY",
        "timeDomainBodyGyroscopeMeanZ",
        "timeDomainBodyGyroscopeStandardDeviationX",
        "timeDomainBodyGyroscopeStandardDeviationY",
        "timeDomainBodyGyroscopeStandardDeviationZ",
        "timeDomainBodyGyroscopeJerkMeanX",
        "timeDomainBodyGyroscopeJerkMeanY",
        "timeDomainBodyGyroscopeJerkMeanZ",
        "timeDomainBodyGyroscopeJerkStandardDeviationX",
        "timeDomainBodyGyroscopeJerkStandardDeviationY",
        "timeDomainBodyGyroscopeJerkStandardDeviationZ",
        "timeDomainAccelerationMagnitudeMean",
        "timeDomainAccelerationMagnitudeStandardDeviation",
        "timeDomainGravityAccelerationMagnitudeMean",
        "timeDomainGravityAccelerationMagnitudeStandardDeviation",
        "timeDomainAccelerationJerkMagnitudeMean",
        "timeDomainAccelerationJerkMagnitudeStandardDeviation",
        "timeDomainGyroscopeMagnitudeMean",
        "timeDomainGyroscopeMagnitudeStandardDeviation",
        "timeDomainGyroscopeJerkMagnitudeMean",
        "timeDomainGyroscopeJerkMagnitudeStandardDeviation",        
        "frequencyDomainBodyAccelerometerMeanX",
        "frequencyDomainBodyAccelerometerMeanY",
        "frequencyDomainBodyAccelerometerMeanZ",
        "frequencyDomainBodyAccelerometerStandardDeviationX",
        "frequencyDomainBodyAccelerometerStandardDeviationY",
        "frequencyDomainBodyAccelerometerStandardDeviationZ",
        "frequencyDomainBodyAccelerationJerkMeanX",
        "frequencyDomainBodyAccelerationJerkMeanY",
        "frequencyDomainBodyAccelerationJerkMeanZ",
        "frequencyDomainBodyAccelerationJerkStandardDeviationX",
        "frequencyDomainBodyAccelerationJerkStandardDeviationY",
        "frequencyDomainBodyAccelerationJerkStandardDeviationZ",
        "frequencyDomainBodyGyroscopeMeanX",
        "frequencyDomainBodyGyroscopeMeanY",
        "frequencyDomainBodyGyroscopeMeanZ",
        "frequencyDomainBodyGyroscopeStandardDeviationX",
        "frequencyDomainBodyGyroscopeStandardDeviationY",
        "frequencyDomainBodyGyroscopeStandardDeviationZ",
        "frequencyDomainAccelerationMagnitudeMean",
        "frequencyDomainAccelerationMagnitudeStandardDeviation",
        "frequencyDomainAccelerationJerkMagnitudeMean",
        "frequencyDomainAccelerationJerkMagnitudeStandardDeviation",
        "frequencyDomainGyroscopeMagnitudeMean",
        "frequencyDomainGyroscopeMagnitudeStandardDeviation",
        "frequencyDomainGyroscopeJerkMagnitudeMean",
        "frequencyDomainGyroscopeJerkMagnitudeStandardDeviation")

## Step 5 - From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
groupMeanStdSet<-group_by(meanStdSet,subject,activity)
tidyData <- summarise_each(groupMeanStdSet,funs(mean))
write.table(tidyData,file="tidyData.txt",row.names=FALSE)



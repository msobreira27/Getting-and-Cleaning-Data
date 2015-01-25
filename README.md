# Getting-and-Cleaning-Data
Getting and Cleaning Data - getdata-010 - Course Project

###COURSE PROJECT###

How the script run_analysis work and assumptions:

The comments on the script break the code in an introduction where the library needed and files are loaded and the the 5 steps requested by the course:

####Merges the training and the test sets to create one data set.####

Used function read.table to read all files and store in dataframes. Inertial Signals were not loaded as they are not needed in this exercise.

2. Extracts only the measurements on the mean and standard deviation for each measurement. 

I used cbind and rbind functions to assemble the data - making sure the dimmensions were correct. Using the dim code the following dimensions were verified:
dim(subjectTrain)
[1] 7352    1

dim(xTrain)
[1] 7352  561

dim(yTrain)
[1] 7352    1

dim(activityLabels)
[1] 6 2

dim(features)
[1] 561   2

dim(xTest)
[1] 2947  561

dim(yTest)
[1] 2947    1

dim(subjectTest)
[1] 2947    1

So merging the Train and Test sets would add 2 extra variables that were passed as the data frame fixedVariables. The complete dataframe was transformed to a vector then the entire vector was passed to the complete dataframe (superSet) through the function names.

dim(superSet)
1]  10299   563

3. Uses descriptive activity names to name the activities in the data set

I converted the activity variable to character and replaced the values conditionally directly to the variable. 


4. Appropriately labels the data set with descriptive variable names. 

5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

##CODE BOOK##
subject
1 to 30

activity

1."WALKING"
2."WALKING_UPSTAIRS"
3."WALKING_DOWNSTAIRS"
4."SITTING"
5."STANDING"
2."LAYING"






timeDomainBodyAccelerometerMeanX

timeDomainBodyAccelerometerMeanY

timeDomainBodyAccelerometerMeanZ

timeDomainBodyAccelerometerStandardDeviationX

timeDomainBodyAccelerometerStandardDeviationY

timeDomainBodyAccelerometerStandardDeviationZ

timeDomainGravityAccelarationMeanX

timeDomainGravityAccelarationMeanY

timeDomainGravityAccelarationMeanZ

timeDomainGravityAccelarationStandardDeviationX

timeDomainGravityAccelarationStandardDeviationY

timeDomainGravityAccelarationStandardDeviationZ

timeDomainBodyAccelerationJerkMeanX

timeDomainBodyAccelerationJerkMeanY

timeDomainBodyAccelerationJerkMeanZ

timeDomainBodyAccelerationJerkStandardDeviationX

timeDomainBodyAccelerationJerkStandardDeviationY

timeDomainBodyAccelerationJerkStandardDeviationZ

timeDomainBodyGyroscopeMeanX

timeDomainBodyGyroscopeMeanY

timeDomainBodyGyroscopeMeanZ

timeDomainBodyGyroscopeStandardDeviationX

timeDomainBodyGyroscopeStandardDeviationY

timeDomainBodyGyroscopeStandardDeviationZ

timeDomainBodyGyroscopeJerkMeanX

timeDomainBodyGyroscopeJerkMeanY

timeDomainBodyGyroscopeJerkMeanZ

timeDomainBodyGyroscopeJerkStandardDeviationX

timeDomainBodyGyroscopeJerkStandardDeviationY

timeDomainBodyGyroscopeJerkStandardDeviationZ

timeDomainAccelerationMagnitudeMean

timeDomainAccelerationMagnitudeStandardDeviation

timeDomainGravityAccelerationMagnitudeMean

timeDomainGravityAccelerationMagnitudeStandardDeviation

timeDomainAccelerationJerkMagnitudeMean

timeDomainAccelerationJerkMagnitudeStandardDeviation

timeDomainGyroscopeMagnitudeMean

timeDomainGyroscopeMagnitudeStandardDeviation

timeDomainGyroscopeJerkMagnitudeMean

timeDomainGyroscopeJerkMagnitudeStandardDeviation

frequencyDomainBodyAccelerometerMeanX

frequencyDomainBodyAccelerometerMeanY

frequencyDomainBodyAccelerometerMeanZ

frequencyDomainBodyAccelerometerStandardDeviationX

frequencyDomainBodyAccelerometerStandardDeviationY

frequencyDomainBodyAccelerometerStandardDeviationZ

frequencyDomainBodyAccelerationJerkMeanX

frequencyDomainBodyAccelerationJerkMeanY

frequencyDomainBodyAccelerationJerkMeanZ

frequencyDomainBodyAccelerationJerkStandardDeviationX

frequencyDomainBodyAccelerationJerkStandardDeviationY

frequencyDomainBodyAccelerationJerkStandardDeviationZ

frequencyDomainBodyGyroscopeMeanX

frequencyDomainBodyGyroscopeMeanY

frequencyDomainBodyGyroscopeMeanZ

frequencyDomainBodyGyroscopeStandardDeviationX

frequencyDomainBodyGyroscopeStandardDeviationY

frequencyDomainBodyGyroscopeStandardDeviationZ

frequencyDomainAccelerationMagnitudeMean

frequencyDomainAccelerationMagnitudeStandardDeviation

frequencyDomainAccelerationJerkMagnitudeMean

frequencyDomainAccelerationJerkMagnitudeStandardDeviation

frequencyDomainGyroscopeMagnitudeMean

frequencyDomainGyroscopeMagnitudeStandardDeviation

frequencyDomainGyroscopeJerkMagnitudeMean

frequencyDomainGyroscopeJerkMagnitudeStandardDeviation


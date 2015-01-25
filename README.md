# Getting-and-Cleaning-Data
Getting and Cleaning Data - getdata-010 - Course Project

###COURSE PROJECT - Comments on the code logic###

Assumption:
The main assumption is that we consider valid measurements only if they come in pairs mean, standard deviation.

The comments on the script break the code in an introduction where the library needed and files are loaded and the the 5 steps requested by the course:

####Merges the training and the test sets to create one data set.####

Used function read.table to read all files and store in dataframes. Inertial Signals were not loaded as they are not needed in this exercise.

####Extracts only the measurements on the mean and standard deviation for each measurement.####

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
   1] 10299   563

####Uses descriptive activity names to name the activities in the data set####

Straight forward - I converted the activity variable to character and replaced the values conditionally directly to the variable. 

####Appropriately labels the data set with descriptive variable names.####

Also straight forward (and brute force) - I used the function names() to change the names of the variables. The idea was to use camelCase and print, for each variable, the full description of the variable. 

####From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.####

Using group_by I separated the varibles of interest - subject and activity. As I had to apply mean to each column, I used summarise_each to perform the task. Finally I wrote the final result to a file that is uploaded on the submission page.



##CODE BOOK##

#####subject#####

Number identifying each participant

Type - Integer Number

1..30 

_____________________________________________________________________________________________________________________________

#####activity#####

Type of activity(from a total of 6) performed by each participant.

Type - Character

1."WALKING"

2."WALKING_UPSTAIRS"

3."WALKING_DOWNSTAIRS"

4."SITTING"

5."STANDING"

6."LAYING"

_______________________________________________________________________________________________________________________

#####timeDomainBodyAccelerometerMeanX#####

Mean of accelerometer primary raw data - X axys

Type - Double Number

-1..1

_____________________________________________________________________________________________________________________________

#####timeDomainBodyAccelerometerMeanY#####

Mean of accelerometer primary raw data - Y axys

Type - Double Number

-1..1

_____________________________________________________________________________________________________________________________

#####timeDomainBodyAccelerometerMeanZ#####

Mean of accelerometer primary raw data - Z axys

Type - Double Number

-1..1


_____________________________________________________________________________________________________________________________

#####timeDomainBodyAccelerometerStandardDeviationX#####

Standard Deviation of accelerometer primary raw data - X axys

Type - Double Number

-1..1

_____________________________________________________________________________________________________________________________

#####timeDomainBodyAccelerometerStandardDeviationY##########

Standard Deviation of accelerometer primary raw data - Y axys

Type - Double Number

-1..1

_____________________________________________________________________________________________________________________________

#####timeDomainBodyAccelerometerStandardDeviationZ##########

Standard Deviation of accelerometer primary raw data - Z axys

Type - Double Number

-1..1

_____________________________________________________________________________________________________________________________


#####timeDomainGravityAccelarationMeanX#####

Mean of Gravity Acceleration (calculated from raw) - X axys

Type - Double Number

-1..1
_____________________________________________________________________________________________________________________________
#####timeDomainGravityAccelarationMeanY#####

Mean of Gravity Acceleration (calculated from raw) - Y axys

Type - Double Number

-1..1
_____________________________________________________________________________________________________________________________
#####timeDomainGravityAccelarationMeanZ#####
Mean of Gravity Acceleration (calculated from raw) - Z axys
Type - Double Number
-1..1
_____________________________________________________________________________________________________________________________
#####timeDomainGravityAccelarationStandardDeviationX#####
Mean of accelerometer primary raw data - Y axys
Type - Double Number
-1..1
_____________________________________________________________________________________________________________________________
#####timeDomainGravityAccelarationStandardDeviationY#####
Mean of accelerometer primary raw data - Y axys
Type - Double Number
-1..1
_____________________________________________________________________________________________________________________________
#####timeDomainGravityAccelarationStandardDeviationZ#####
Mean of accelerometer primary raw data - Y axys
Type - Double Number
-1..1
_____________________________________________________________________________________________________________________________
#####timeDomainBodyAccelerationJerkMeanX#####
Mean of accelerometer primary raw data - Y axys
Type - Double Number
-1..1
_____________________________________________________________________________________________________________________________
#####timeDomainBodyAccelerationJerkMeanY#####
Mean of accelerometer primary raw data - Y axys

Type - Double Number

-1..1
_____________________________________________________________________________________________________________________________
timeDomainBodyAccelerationJerkMeanZ
Mean of accelerometer primary raw data - Y axys
Type - Double Number
-1..1
_____________________________________________________________________________________________________________________________
timeDomainBodyAccelerationJerkStandardDeviationX
Mean of accelerometer primary raw data - Y axys
Type - Double Number
-1..1
_____________________________________________________________________________________________________________________________
timeDomainBodyAccelerationJerkStandardDeviationY
Mean of accelerometer primary raw data - Y axys
Type - Double Number
-1..1
_____________________________________________________________________________________________________________________________
timeDomainBodyAccelerationJerkStandardDeviationZ
Mean of accelerometer primary raw data - Y axys
Type - Double Number
-1..1
_____________________________________________________________________________________________________________________________
timeDomainBodyGyroscopeMeanX
Mean of accelerometer primary raw data - Y axys
Type - Double Number
-1..1
_____________________________________________________________________________________________________________________________
timeDomainBodyGyroscopeMeanY
Mean of accelerometer primary raw data - Y axys
Type - Double Number
-1..1
_____________________________________________________________________________________________________________________________
timeDomainBodyGyroscopeMeanZ
Mean of accelerometer primary raw data - Y axys
Type - Double Number
-1..1
_____________________________________________________________________________________________________________________________
timeDomainBodyGyroscopeStandardDeviationX
Mean of accelerometer primary raw data - Y axys
Type - Double Number
-1..1
_____________________________________________________________________________________________________________________________
timeDomainBodyGyroscopeStandardDeviationY
Mean of accelerometer primary raw data - Y axys
Type - Double Number
-1..1
_____________________________________________________________________________________________________________________________
timeDomainBodyGyroscopeStandardDeviationZ
Mean of accelerometer primary raw data - Y axys
Type - Double Number
-1..1
_____________________________________________________________________________________________________________________________
timeDomainBodyGyroscopeJerkMeanX
Mean of accelerometer primary raw data - Y axys
Type - Double Number
-1..1
_____________________________________________________________________________________________________________________________
timeDomainBodyGyroscopeJerkMeanY
Mean of accelerometer primary raw data - Y axys
Type - Double Number
-1..1
_____________________________________________________________________________________________________________________________
timeDomainBodyGyroscopeJerkMeanZ
Mean of accelerometer primary raw data - Y axys
Type - Double Number
-1..1
_____________________________________________________________________________________________________________________________
timeDomainBodyGyroscopeJerkStandardDeviationX
Mean of accelerometer primary raw data - Y axys
Type - Double Number
-1..1
_____________________________________________________________________________________________________________________________
timeDomainBodyGyroscopeJerkStandardDeviationY
Mean of accelerometer primary raw data - Y axys
Type - Double Number
-1..1
_____________________________________________________________________________________________________________________________
timeDomainBodyGyroscopeJerkStandardDeviationZ
Mean of accelerometer primary raw data - Y axys
Type - Double Number
-1..1
_____________________________________________________________________________________________________________________________
timeDomainAccelerationMagnitudeMean
Mean of accelerometer primary raw data - Y axys
Type - Double Number
-1..1
_____________________________________________________________________________________________________________________________
timeDomainAccelerationMagnitudeStandardDeviation
Mean of accelerometer primary raw data - Y axys
Type - Double Number
-1..1
_____________________________________________________________________________________________________________________________
timeDomainGravityAccelerationMagnitudeMean
Mean of accelerometer primary raw data - Y axys
Type - Double Number
-1..1
_____________________________________________________________________________________________________________________________
timeDomainGravityAccelerationMagnitudeStandardDeviation
Mean of accelerometer primary raw data - Y axys
Type - Double Number
-1..1
_____________________________________________________________________________________________________________________________
timeDomainAccelerationJerkMagnitudeMean
Mean of accelerometer primary raw data - Y axys
Type - Double Number
-1..1
_____________________________________________________________________________________________________________________________
timeDomainAccelerationJerkMagnitudeStandardDeviation
Mean of accelerometer primary raw data - Y axys
Type - Double Number
-1..1
_____________________________________________________________________________________________________________________________
timeDomainGyroscopeMagnitudeMean
Mean of accelerometer primary raw data - Y axys
Type - Double Number
-1..1
_____________________________________________________________________________________________________________________________
timeDomainGyroscopeMagnitudeStandardDeviation
Mean of accelerometer primary raw data - Y axys
Type - Double Number
-1..1
_____________________________________________________________________________________________________________________________
timeDomainGyroscopeJerkMagnitudeMean
Mean of accelerometer primary raw data - Y axys
Type - Double Number
-1..1
_____________________________________________________________________________________________________________________________
timeDomainGyroscopeJerkMagnitudeStandardDeviation
Mean of accelerometer primary raw data - Y axys
Type - Double Number
-1..1
_____________________________________________________________________________________________________________________________
frequencyDomainBodyAccelerometerMeanX
Mean of accelerometer primary raw data - Y axys
Type - Double Number
-1..1
_____________________________________________________________________________________________________________________________
frequencyDomainBodyAccelerometerMeanY
Mean of accelerometer primary raw data - Y axys
Type - Double Number
-1..1
_____________________________________________________________________________________________________________________________
frequencyDomainBodyAccelerometerMeanZ
Mean of accelerometer primary raw data - Y axys
Type - Double Number
-1..1
_____________________________________________________________________________________________________________________________
frequencyDomainBodyAccelerometerStandardDeviationX
Mean of accelerometer primary raw data - Y axys
Type - Double Number
-1..1
_____________________________________________________________________________________________________________________________
frequencyDomainBodyAccelerometerStandardDeviationY
Mean of accelerometer primary raw data - Y axys
Type - Double Number
-1..1
_____________________________________________________________________________________________________________________________
frequencyDomainBodyAccelerometerStandardDeviationZ
Mean of accelerometer primary raw data - Y axys
Type - Double Number
-1..1
_____________________________________________________________________________________________________________________________
frequencyDomainBodyAccelerationJerkMeanX
Mean of accelerometer primary raw data - Y axys
Type - Double Number
-1..1
_____________________________________________________________________________________________________________________________
frequencyDomainBodyAccelerationJerkMeanY
Mean of accelerometer primary raw data - Y axys
Type - Double Number
-1..1
_____________________________________________________________________________________________________________________________
frequencyDomainBodyAccelerationJerkMeanZ
Mean of accelerometer primary raw data - Y axys
Type - Double Number
-1..1
_____________________________________________________________________________________________________________________________
frequencyDomainBodyAccelerationJerkStandardDeviationX
Mean of accelerometer primary raw data - Y axys
Type - Double Number
-1..1
_____________________________________________________________________________________________________________________________
frequencyDomainBodyAccelerationJerkStandardDeviationY
Mean of accelerometer primary raw data - Y axys
Type - Double Number
-1..1
_____________________________________________________________________________________________________________________________
frequencyDomainBodyAccelerationJerkStandardDeviationZ
Mean of accelerometer primary raw data - Y axys
Type - Double Number
-1..1
_____________________________________________________________________________________________________________________________
frequencyDomainBodyGyroscopeMeanX
Mean of accelerometer primary raw data - Y axys
Type - Double Number
-1..1
_____________________________________________________________________________________________________________________________
frequencyDomainBodyGyroscopeMeanY
Mean of accelerometer primary raw data - Y axys
Type - Double Number
-1..1
_____________________________________________________________________________________________________________________________
frequencyDomainBodyGyroscopeMeanZ
Mean of accelerometer primary raw data - Y axys
Type - Double Number
-1..1
_____________________________________________________________________________________________________________________________
frequencyDomainBodyGyroscopeStandardDeviationX
Mean of accelerometer primary raw data - Y axys
Type - Double Number
-1..1
_____________________________________________________________________________________________________________________________
frequencyDomainBodyGyroscopeStandardDeviationY
Mean of accelerometer primary raw data - Y axys
Type - Double Number
-1..1
_____________________________________________________________________________________________________________________________
frequencyDomainBodyGyroscopeStandardDeviationZ
Mean of accelerometer primary raw data - Y axys
Type - Double Number
-1..1
_____________________________________________________________________________________________________________________________
frequencyDomainAccelerationMagnitudeMean
Mean of accelerometer primary raw data - Y axys
Type - Double Number
-1..1
_____________________________________________________________________________________________________________________________
frequencyDomainAccelerationMagnitudeStandardDeviation
Mean of accelerometer primary raw data - Y axys
Type - Double Number
-1..1
_____________________________________________________________________________________________________________________________
frequencyDomainAccelerationJerkMagnitudeMean
Mean of accelerometer primary raw data - Y axys
Type - Double Number
-1..1
_____________________________________________________________________________________________________________________________
frequencyDomainAccelerationJerkMagnitudeStandardDeviation
Mean of accelerometer primary raw data - Y axys
Type - Double Number
-1..1
_____________________________________________________________________________________________________________________________
frequencyDomainGyroscopeMagnitudeMean
Mean of accelerometer primary raw data - Y axys
Type - Double Number
-1..1
_____________________________________________________________________________________________________________________________
frequencyDomainGyroscopeMagnitudeStandardDeviation
Mean of accelerometer primary raw data - Y axys
Type - Double Number
-1..1
_____________________________________________________________________________________________________________________________
frequencyDomainGyroscopeJerkMagnitudeMean
Mean of accelerometer primary raw data - Y axys
Type - Double Number
-1..1
_____________________________________________________________________________________________________________________________
frequencyDomainGyroscopeJerkMagnitudeStandardDeviation
Mean of accelerometer primary raw data - Y axys
Type - Double Number
-1..1
_____________________________________________________________________________________________________________________________

# Getting-and-Cleaning-Data
Getting and Cleaning Data - getdata-010 - Course Project

###COURSE PROJECT - Comments on the code logic###

Assumption:
The main assumption is that we consider valid measurements only if they come in pairs mean, standard deviation.

The comments on the script break the code in an introduction where the library needed and files are loaded and the the 5 steps requested by the course:

Used function read.table to read all files and store in dataframes. Inertial Signals were not loaded as they are not needed in this exercise.

####Merges the training and the test sets to create one data set.####

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

####Extracts only the measurements on the mean and standard deviation for each measurement.####

In this section choice was made to select only measurements that had pairs mean/Standard Deviation. To accomplish that we used the grep funtion:
vectorMean <- grep("-mean()",names(superSet), fixed=TRUE) #filters the means
vectorStd <- grep("-std()", names(superSet), fixed=TRUE) #filters the standard Deviations

Note that fixed=TRUE requires exact matches, to avoid to capture other measurements that present the characteres required, but separated in the entire name.

####Uses descriptive activity names to name the activities in the data set####

Straight forward - I converted the activity variable to character and replaced the values conditionally directly to the variable. 

####Appropriately labels the data set with descriptive variable names.####

Also straight forward (and brute force) - I used the function names() to change the names of the variables. The idea was to use camelCase and print, for each variable, the full description of the variable. 

####From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.####

Using group_by I separated the varibles of interest - subject and activity. As I had to apply mean to each column, I used summarise_each to perform the task. Finally I wrote the final result to a file that is uploaded on the submission page.



##CODE BOOK## 

###General(Extracted from feature_info.txt file)###

Feature Selection 
=================

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ.

These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered 

using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. 

Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and 

tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ 
and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm 

(tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, 

fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  

'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.


tBodyAcc-XYZ

tGravityAcc-XYZ

tBodyAccJerk-XYZ

tBodyGyro-XYZ

tBodyGyroJerk-XYZ

tBodyAccMag

tGravityAccMag

tBodyAccJerkMag

tBodyGyroMag

tBodyGyroJerkMag

fBodyAcc-XYZ

fBodyAccJerk-XYZ

fBodyGyro-XYZ

fBodyAccMag

fBodyAccJerkMag

fBodyGyroMag

fBodyGyroJerkMag

_____________________________________________________________________________________________________________________________
###Variables(in bold)###

____________________________________________________________________________________________________________________________

#####subject#####

Number identifying each participant

Type - Integer Number

range [1..30] 

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

range [-1..1]

_____________________________________________________________________________________________________________________________

#####timeDomainBodyAccelerometerMeanY#####

Mean of accelerometer primary raw data - Y axys

Type - Double Number

range [-1..1]

_____________________________________________________________________________________________________________________________

#####timeDomainBodyAccelerometerMeanZ#####

Mean of accelerometer primary raw data - Z axys

Type - Double Number

range [-1..1]


_____________________________________________________________________________________________________________________________

#####timeDomainBodyAccelerometerStandardDeviationX#####

Standard Deviation of accelerometer primary raw data - X axys

Type - Double Number

range [-1..1]

_____________________________________________________________________________________________________________________________

#####timeDomainBodyAccelerometerStandardDeviationY##########

Standard Deviation of accelerometer primary raw data - Y axys

Type - Double Number

range [-1..1]

_____________________________________________________________________________________________________________________________

#####timeDomainBodyAccelerometerStandardDeviationZ##########

Standard Deviation of accelerometer primary raw data - Z axys

Type - Double Number

range [-1..1]

_____________________________________________________________________________________________________________________________


#####timeDomainGravityAccelarationMeanX#####

Mean of Gravity Acceleration (calculated) - X axys

Type - Double Number

range [-1..1]
_____________________________________________________________________________________________________________________________
#####timeDomainGravityAccelarationMeanY#####

Mean of Gravity Acceleration (calculated) - Y axys

Type - Double Number

range [-1..1]
_____________________________________________________________________________________________________________________________
#####timeDomainGravityAccelarationMeanZ#####

Mean of Gravity Acceleration (calculated) - Z axys

Type - Double Number

range [-1..1]
_____________________________________________________________________________________________________________________________
#####timeDomainGravityAccelarationStandardDeviationX#####

Standard Deviation of Gravity Acceleration (calculated) - X axys

Type - Double Number

range [-1..1]
_____________________________________________________________________________________________________________________________
#####timeDomainGravityAccelarationStandardDeviationY#####

Standard Deviation of Gravity Acceleration (calculated) - Y axys

Type - Double Number

range [-1..1]
_____________________________________________________________________________________________________________________________
#####timeDomainGravityAccelarationStandardDeviationZ#####

Standard Deviation of Gravity Acceleration (calculated) - Z axys

Type - Double Number

range [-1..1]
_____________________________________________________________________________________________________________________________
#####timeDomainBodyAccelerationJerkMeanX#####

Mean of Jerk Body Acceleration (calculated) - X axys

Type - Double Number

range [-1..1]
_____________________________________________________________________________________________________________________________
#####timeDomainBodyAccelerationJerkMeanY#####

Mean of Jerk Body Acceleration (calculated) - Y axys

Type - Double Number

range [-1..1]
_____________________________________________________________________________________________________________________________
#####timeDomainBodyAccelerationJerkMeanZ#####

Mean of Jerk Body Acceleration (calculated) - Z axys

Type - Double Number

range [-1..1]
_____________________________________________________________________________________________________________________________
#####timeDomainBodyAccelerationJerkStandardDeviationX#####

Standard Deviation of Jerk Body Acceleration (calculated) - X axys

Type - Double Number

range [-1..1]
_____________________________________________________________________________________________________________________________
#####timeDomainBodyAccelerationJerkStandardDeviationY#####

Standard Deviation of Jerk Body Acceleration (calculated) - Y axys

Type - Double Number

range [-1..1]
_____________________________________________________________________________________________________________________________
#####timeDomainBodyAccelerationJerkStandardDeviationZ#####

Standard Deviation of Jerk Body Acceleration (calculated) - Z axys

Type - Double Number

range [-1..1]
_____________________________________________________________________________________________________________________________
#####timeDomainBodyGyroscopeMeanX#####

Mean Gyroscope primary raw data - X axys

Type - Double Number

range [-1..1]
_____________________________________________________________________________________________________________________________
#####timeDomainBodyGyroscopeMeanY#####

Mean Gyroscope primary raw data - Y axys

Type - Double Number

range [-1..1]
_____________________________________________________________________________________________________________________________
#####timeDomainBodyGyroscopeMeanZ#####

Mean Gyroscope primary raw data - Z axys

Type - Double Number

range [-1..1]
_____________________________________________________________________________________________________________________________
#####timeDomainBodyGyroscopeStandardDeviationX#####

Standard Deviation Gyroscope primary raw data - X axys

Type - Double Number

range [-1..1]
_____________________________________________________________________________________________________________________________
#####timeDomainBodyGyroscopeStandardDeviationY#####

Standard Deviation Gyroscope primary raw data - Y axys

Type - Double Number

range [-1..1]
_____________________________________________________________________________________________________________________________
#####timeDomainBodyGyroscopeStandardDeviationZ#####

Standard Deviation Gyroscope primary raw data - Z axys

Type - Double Number

range [-1..1]
_____________________________________________________________________________________________________________________________
#####timeDomainBodyGyroscopeJerkMeanX#####

Mean Gyroscope Jerk (calculated) - X axys

Type - Double Number

range [-1..1]
_____________________________________________________________________________________________________________________________
#####timeDomainBodyGyroscopeJerkMeanY#####

Mean Gyroscope Jerk (calculated) - Y axys

Type - Double Number

range [-1..1]
_____________________________________________________________________________________________________________________________
#####timeDomainBodyGyroscopeJerkMeanZ#####

Mean Gyroscope Jerk (calculated) - Z axys

Type - Double Number

range [-1..1]
_____________________________________________________________________________________________________________________________
#####timeDomainBodyGyroscopeJerkStandardDeviationX#####

Standard Deviation Gyroscope Jerk (calculated) - X axys

Type - Double Number

range [-1..1]
_____________________________________________________________________________________________________________________________
#####timeDomainBodyGyroscopeJerkStandardDeviationY#####

Standard Deviation Gyroscope Jerk (calculated) - Y axys

Type - Double Number

range [-1..1]
_____________________________________________________________________________________________________________________________
#####timeDomainBodyGyroscopeJerkStandardDeviationZ#####

Standard Deviation Gyroscope Jerk (calculated) - Z axys
Type - Double Number

range [-1..1]
_____________________________________________________________________________________________________________________________
#####timeDomainAccelerationMagnitudeMean#####

Mean of Acceleration Magnitude (calculated)

Type - Double Number

range [-1..1]
_____________________________________________________________________________________________________________________________
#####timeDomainAccelerationMagnitudeStandardDeviation#####

Standard Deviation of Acceleration Magnitude (calculated)

Type - Double Number

range [-1..1]
_____________________________________________________________________________________________________________________________
#####timeDomainGravityAccelerationMagnitudeMean#####

Mean of Gravity Acceleration Magnitude (calculated)

Type - Double Number

range [-1..1]
_____________________________________________________________________________________________________________________________
#####timeDomainGravityAccelerationMagnitudeStandardDeviation#####

Standard Deviation of Gravity Acceleration Magnitude (calculated)

Type - Double Number

range [-1..1]
_____________________________________________________________________________________________________________________________
#####timeDomainAccelerationJerkMagnitudeMean#####

Mean of Acceleration Jerk Magnitude (Calculated) 

Type - Double Number

range [-1..1]
_____________________________________________________________________________________________________________________________
#####timeDomainAccelerationJerkMagnitudeStandardDeviation#####

Standard Deviation of Acceleration Jerk Magnitude (Calculated) 

Type - Double Number

range [-1..1]
_____________________________________________________________________________________________________________________________
#####timeDomainGyroscopeMagnitudeMean#####

Mean of Gyroscope Maghitude (Calculated)

Type - Double Number

range [-1..1]
_____________________________________________________________________________________________________________________________
#####timeDomainGyroscopeMagnitudeStandardDeviation#####

Standard Deviation of Gyroscope Maghitude (Calculated)

Type - Double Number

range [-1..1]
_____________________________________________________________________________________________________________________________
#####timeDomainGyroscopeJerkMagnitudeMean#####

Mean of Gyroscope Jerk Maghitude (Calculated)

Type - Double Number

range [-1..1]
_____________________________________________________________________________________________________________________________
#####timeDomainGyroscopeJerkMagnitudeStandardDeviation#####

Standard Deviation of Gyroscope Jerk Maghitude (Calculated)

Type - Double Number

range [-1..1]
_____________________________________________________________________________________________________________________________
#####frequencyDomainBodyAccelerometerMeanX#####

Frequency Domain (FFT) of Mean Accelerometer - X Axis

Type - Double Number

range [-1..1]
_____________________________________________________________________________________________________________________________
#####frequencyDomainBodyAccelerometerMeanY#####

Frequency Domain (FFT) of Mean Accelerometer - Y Axis

Type - Double Number

range [-1..1]
_____________________________________________________________________________________________________________________________
#####frequencyDomainBodyAccelerometerMeanZ#####

Frequency Domain (FFT) of Mean Accelerometer - Z Axis

Type - Double Number

range [-1..1]
_____________________________________________________________________________________________________________________________
#####frequencyDomainBodyAccelerometerStandardDeviationX#####

Frequency Domain (FFT) of Standard Deviation Accelerometer - X Axis

Type - Double Number

range [-1..1]
_____________________________________________________________________________________________________________________________
#####frequencyDomainBodyAccelerometerStandardDeviationY#####

Frequency Domain (FFT) of Standard Deviation Accelerometer - Y Axis

Type - Double Number

range [-1..1]
_____________________________________________________________________________________________________________________________
#####frequencyDomainBodyAccelerometerStandardDeviationZ#####

Frequency Domain (FFT) of Standard Deviation Accelerometer - Z Axis

Type - Double Number

range [-1..1]

_____________________________________________________________________________________________________________________________
#####frequencyDomainBodyAccelerationJerkMeanX#####

Frequency Domain (FFT) of Mean Jerk Acceleration - X Axis

Type - Double Number

range [-1..1]
_____________________________________________________________________________________________________________________________
#####frequencyDomainBodyAccelerationJerkMeanY#####

Frequency Domain (FFT) of Mean Jerk Acceleration - Y Axis

Type - Double Number

range [-1..1]
_____________________________________________________________________________________________________________________________
#####frequencyDomainBodyAccelerationJerkMeanZ#####

Frequency Domain (FFT) of Mean Jerk Acceleration - Z Axis

Type - Double Number

range [-1..1]
_____________________________________________________________________________________________________________________________
#####frequencyDomainBodyAccelerationJerkStandardDeviationX#####

Frequency Domain (FFT) of Standard Deviation Jerk Acceleration - X Axis

Type - Double Number

range [-1..1]
_____________________________________________________________________________________________________________________________
#####frequencyDomainBodyAccelerationJerkStandardDeviationY#####

Frequency Domain (FFT) of Standard Deviation Jerk Acceleration - Y Axis

Type - Double Number

range [-1..1]
_____________________________________________________________________________________________________________________________
#####frequencyDomainBodyAccelerationJerkStandardDeviationZ#####

Frequency Domain (FFT) of Standard Deviation Jerk Acceleration - Z Axis

Type - Double Number

range [-1..1]
_____________________________________________________________________________________________________________________________
#####frequencyDomainBodyGyroscopeMeanX#####

Frequency Domain (FFT) of Mean Gyroscope - X Axis

Type - Double Number

range [-1..1]
_____________________________________________________________________________________________________________________________
#####frequencyDomainBodyGyroscopeMeanY#####

Frequency Domain (FFT) of Mean Gyroscope - Y Axis

Type - Double Number

range [-1..1]
_____________________________________________________________________________________________________________________________
#####frequencyDomainBodyGyroscopeMeanZ#####

Frequency Domain (FFT) of Mean Gyroscope - Z Axis

Type - Double Number

range [-1..1]
_____________________________________________________________________________________________________________________________
#####frequencyDomainBodyGyroscopeStandardDeviationX#####

Frequency Domain (FFT) of Standard Deviation Gyroscope - X Axis

Type - Double Number

range [-1..1]
_____________________________________________________________________________________________________________________________
#####frequencyDomainBodyGyroscopeStandardDeviationY#####

Frequency Domain (FFT) of Standard Deviation Gyroscope - Y Axis

Type - Double Number

range [-1..1]
_____________________________________________________________________________________________________________________________
#####frequencyDomainBodyGyroscopeStandardDeviationZ#####

Frequency Domain (FFT) of Standard Deviation Gyroscope - Z Axis

Type - Double Number

range [-1..1]
_____________________________________________________________________________________________________________________________
#####frequencyDomainAccelerationMagnitudeMean#####

Frequency Domain (FFT) of Mean Acceleration Magnitude

Type - Double Number

range [-1..1]
_____________________________________________________________________________________________________________________________
#####frequencyDomainAccelerationMagnitudeStandardDeviation#####

Frequency Domain (FFT) of Standard Deviation Acceleration Magnitude

Type - Double Number

range [-1..1]
_____________________________________________________________________________________________________________________________
#####frequencyDomainAccelerationJerkMagnitudeMean#####

Frequency Domain (FFT) of Mean Jerk Acceleration Magnitude

Type - Double Number

range [-1..1]
_____________________________________________________________________________________________________________________________
#####frequencyDomainAccelerationJerkMagnitudeStandardDeviation#####

Frequency Domain (FFT) of Standard Deviation Jerk Acceleration Magnitude

Type - Double Number

range [-1..1]
_____________________________________________________________________________________________________________________________
#####frequencyDomainGyroscopeMagnitudeMean#####

Frequency Domain (FFT) of Mean Gyroscope Magnitude

Type - Double Number

range [-1..1]
_____________________________________________________________________________________________________________________________
#####frequencyDomainGyroscopeMagnitudeStandardDeviation#####

Frequency Domain (FFT) of Standard Deviation Gyroscope Magnitude

Type - Double Number

range [-1..1]
_____________________________________________________________________________________________________________________________
#####frequencyDomainGyroscopeJerkMagnitudeMean#####

Frequency Domain (FFT) of Mean Gyroscope Jerk Magnitude

Type - Double Number

range [-1..1]
_____________________________________________________________________________________________________________________________
#####frequencyDomainGyroscopeJerkMagnitudeStandardDeviation#####

Frequency Domain (FFT) of Standard Deviation Gyroscope Jerk Magnitude

Type - Double Number

range [-1..1]
_____________________________________________________________________________________________________________________________

# Code Book

## Variables in run_analysis.R

1. activity_labels - data frame with activity codes and description
2. features - data frame with features index and description
	* This data frame is modified to hold only the features that have either mean or std
3. subject_test - data frame with the test subjectIds
4. subject_train - data frame with the train subjectIds
5. test_data - data frame with all the measurements 
	* This data frame is modified to hold only the measurents of features that have either mean or std
6. train_data - data frame with all the measurements 
	* This data frame is modified to hold only the measurents of features that have either mean or std
7. test_activity - data frame with test activity codes
8. train_activity - data frame with train activity codes
9. data - test and train data combined using 'rbind'
	* Modified to merge with activity_labels so that ActivityDesc is included
	* Modified to reorder the columns so that subjectId appears first
	* Modified to sort based on subjectId 
	* Modified to melt using subjectId and activityDesc
	* Modified using 'ddply' to find the average values of all measurements
	* Modified to melt to create 'variable2' to describe that it is a 'mean' value
	* Modified using dcast so that the column names are appended with '_mean'


## Columns in data frame 'data'

SubjectId - numeric value 
* The ID of the subject involved in the data collection
* Possible values: 1 - 30
				 
ActivityDesc - character 
* The description of the activity performed by the subject
* Possible values: 
	* LAYING 
	* SITTING 
	* STANDING 
	* WALKING 
	* WALKING_UPSTAIRS 
	* WALKING_DOWNSTAIRS

All the measurements mentioned below	(numeric) Range -1 to +1

* tBodyAcc-mean()-X_mean
* tBodyAcc-mean()-Y_mean
* tBodyAcc-mean()-Z_mean
* tBodyAcc-std()-X_mean
* tBodyAcc-std()-Y_mean
* tBodyAcc-std()-Z_mean
* tGravityAcc-mean()-X_mean
* tGravityAcc-mean()-Y_mean
* tGravityAcc-mean()-Z_mean
* tGravityAcc-std()-X_mean
* tGravityAcc-std()-Y_mean
* tGravityAcc-std()-Z_mean
* tBodyAccJerk-mean()-X_mean
* tBodyAccJerk-mean()-Y_mean
* tBodyAccJerk-mean()-Z_mean
* tBodyAccJerk-std()-X_mean
* tBodyAccJerk-std()-Y_mean
* tBodyAccJerk-std()-Z_mean
* tBodyGyro-mean()-X_mean
* tBodyGyro-mean()-Y_mean
* tBodyGyro-mean()-Z_mean
* tBodyGyro-std()-X_mean
* tBodyGyro-std()-Y_mean
* tBodyGyro-std()-Z_mean
* tBodyGyroJerk-mean()-X_mean
* tBodyGyroJerk-mean()-Y_mean
* tBodyGyroJerk-mean()-Z_mean
* tBodyGyroJerk-std()-X_mean
* tBodyGyroJerk-std()-Y_mean
* tBodyGyroJerk-std()-Z_mean
* tBodyAccMag-mean()_mean
* tBodyAccMag-std()_mean
* tGravityAccMag-mean()_mean
* tGravityAccMag-std()_mean
* tBodyAccJerkMag-mean()_mean
* tBodyAccJerkMag-std()_mean
* tBodyGyroMag-mean()_mean
* tBodyGyroMag-std()_mean
* tBodyGyroJerkMag-mean()_mean
* tBodyGyroJerkMag-std()_mean
* fBodyAcc-mean()-X_mean
* fBodyAcc-mean()-Y_mean
* fBodyAcc-mean()-Z_mean
* fBodyAcc-std()-X_mean
* fBodyAcc-std()-Y_mean
* fBodyAcc-std()-Z_mean
* fBodyAcc-meanFreq()-X_mean
* fBodyAcc-meanFreq()-Y_mean
* fBodyAcc-meanFreq()-Z_mean
* fBodyAccJerk-mean()-X_mean
* fBodyAccJerk-mean()-Y_mean
* fBodyAccJerk-mean()-Z_mean
* fBodyAccJerk-std()-X_mean
* fBodyAccJerk-std()-Y_mean
* fBodyAccJerk-std()-Z_mean
* fBodyAccJerk-meanFreq()-X_mean
* fBodyAccJerk-meanFreq()-Y_mean
* fBodyAccJerk-meanFreq()-Z_mean
* fBodyGyro-mean()-X_mean
* fBodyGyro-mean()-Y_mean
* fBodyGyro-mean()-Z_mean
* fBodyGyro-std()-X_mean
* fBodyGyro-std()-Y_mean
* fBodyGyro-std()-Z_mean
* fBodyGyro-meanFreq()-X_mean
* fBodyGyro-meanFreq()-Y_mean
* fBodyGyro-meanFreq()-Z_mean
* fBodyAccMag-mean()_mean
* fBodyAccMag-std()_mean
* fBodyAccMag-meanFreq()_mean
* fBodyBodyAccJerkMag-mean()_mean
* fBodyBodyAccJerkMag-std()_mean
* fBodyBodyAccJerkMag-meanFreq()_mean
* fBodyBodyGyroMag-mean()_mean
* fBodyBodyGyroMag-std()_mean
* fBodyBodyGyroMag-meanFreq()_mean
* fBodyBodyGyroJerkMag-mean()_mean
* fBodyBodyGyroJerkMag-std()_mean
* fBodyBodyGyroJerkMag-meanFreq()_mean

Note: Features are normalized and bounded within [-1,1]

The features come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

The set of variables that were estimated from these signals are: 

* mean(): Mean value
* std(): Standard deviation

The names of the measurements in the tidy_data result set follow the pattern 'features-variable()_mean'. All the measurements are appended with '_mean' to indicate that they are all average values


				

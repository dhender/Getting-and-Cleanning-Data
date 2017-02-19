# Codebook - UCI HAR Data

## Introduction
(_referenced verbatim from README.txt_)

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities wearing a smartphone (Samsung Galaxy S II) on the waist;
*   WALKING,
*   WALKING_UPSTAIRS,
*   WALKING_DOWNSTAIRS,
*   SITTING,
*   STANDING,
*   LAYING.

Using its embedded accelerometer and gyroscope, 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz was captured. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

For each record the following is provided:

*   Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration
*   Triaxial Angular velocity from the gyroscope
*   A 561-feature vector with time and frequency domain variables
*   Its activity label
*   An identifier of the subject who carried out the experiment

## Dataset
(_referenced verbatim from README.txt_)

The dataset includes:

* README.txt
* features_info.txt - _Shows information about the variables used on the feature vector._
* features.txt - _List of all features._
* activity_labels.txt - _Links the class labels with their activity name._
* train/X_train.txt - _Training set._
* train/y_train.txt - _Training labels._
* test/X_test.txt - _Test set._
* test/y_test.txt - _Test labels._

The following files are available for the train and test data. Their descriptions are equivalent. 
* train/subject_train.txt - _Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30._ 
* train/Inertial Signals/total_acc_x_train.txt - _The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis._ 
* train/Inertial Signals/body_acc_x_train.txt - _The body acceleration signal obtained by subtracting the gravity from the total acceleration._ 
* train/Inertial Signals/body_gyro_x_train.txt - _The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second._ 

##### Notes: 
* Features are normalized and bounded within [-1,1].
* Each feature vector is a row on the text file.

## Dataset Variables
(_referenced verbatim from features_info.txt_)

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:
(_'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions_)
* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 
* mean() - _Mean value_
* std() - _Standard deviation_
* mad() - _Median absolute deviation_ 
* max() - _Largest value in array_
* min() - _Smallest value in array_
* sma() - _Signal magnitude area_
* energy() - _Energy measure. Sum of the squares divided by the number of values_ 
* iqr() - _Interquartile range_ 
* entropy() - _Signal entropy_
* arCoeff() - _Autorregresion coefficients with Burg order equal to 4_
* correlation() - _correlation coefficient between two signals_
* maxInds() - _index of the frequency component with largest magnitude_
* meanFreq() - _Weighted average of the frequency components to obtain a mean frequency_
* skewness() - _skewness of the frequency domain signal_ 
* kurtosis() - _kurtosis of the frequency domain signal_ 
* bandsEnergy() - _Energy of a frequency interval within the 64 bins of the FFT of each window_
* angle() - _Angle between to vectors_

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

* gravityMean
* tBodyAccMean
* tBodyAccJerkMean
* tBodyGyroMean
* tBodyGyroJerkMean

The complete list of variables of each feature vector is available in 'features.txt'
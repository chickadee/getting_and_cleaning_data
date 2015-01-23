Code Book: Getting and Cleaning Data
=========================================

Overview
------------
This document contains description of data data used in the course "Getting and Cleaning Data" hosted by the Coursera. 

Original data
------------------
The code uses UCI HAR Dataset made available by Samsung corporation. It contains data collected from the accelerometers from the Samsung Galaxy S smartphone. The dataset can be downloaded at https://d396qusza40orc.cloudfront.net/getdata/projectfiles/UCI HAR Dataset.zip.

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

Attribute Information:

For each record in the dataset it is provided:
* Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
* Triaxial Angular velocity from the gyroscope.
* A 561-feature vector with time and frequency domain variables.
* Its activity label.
* An identifier of the subject who carried out the experiment. 

For more information please visit UCI Machine Learning Repository at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#.

Data processing steps
-------------------------------------
The script executes following steps:

0. Retrieves and extracts UCI HAR Dataset from the web: https://d396qusza40orc.cloudfront.net/getdata/projectfiles/UCI HAR Dataset.zip
1. Merges the training and the test sets to create one data set. Following data files are merged: train/X_train.txt and test/X_test.txt, train/y_train.txt and test/y_test.txt, train/subject_train.txt and test/subject_test.txt.
2. Extracts only the measurements on the mean and standard deviation for each measurement. This is performed by matching variable names from file features.txt to the columns in the data tables and extracting only the columns that represent mean or standard deviation measurments. 
3. Uses descriptive activity names from file activity_labels.txt to name the activities in the data set.
4. Appropriately labels the data set with descriptive variable names from the file features.txt. Labels are further improved by removing unnecessary characters like dashes and replacing "f" and "t" characters with more meaningful "Frequency" and "Time" strings. The resulting tidy data set in stored to the file data_tidy.txt. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject. The resulting dataset in stored to the file data_means.txt. 

Output files
-------------------------------------
Tidy dataset is stored in the file data_tidy.txt, with space character used as a value delimiter and string values embraced in quotes. The first line in the file is used for variable names. The first two columns represent activity name and subject identifier. Following 66 columns represent mean and standard deviation measurments extracted from the original dataset. 

Tidy means dataset is stored in the file data_means.txt, with space character used as a value delimiter and string values embraced in quotes. The first line in the file is used for variable names. The first two columns represent activity name and subject identifier. Following 66 columns represent calculated averages of the mean and standard deviation measurments for each subject and activity. 

Output file format
-------------------------------------

Both output files have similar structure and values. Both contain following fields:

* Activity - labels the activity represented by the measurments
* Subject - uniquely identifies each subject

And following variables that represent means and standard deviations of the measurments from the original dataset:
* TimeBodyAccMeanX
* TimeBodyAccMeanY
* TimeBodyAccMeanZ
* TimeBodyAccStdDevX
* TimeBodyAccStdDevY
* TimeBodyAccStdDevZ
* TimeGravityAccMeanX
* TimeGravityAccMeanY
* TimeGravityAccMeanZ
* TimeGravityAccStdDevX
* TimeGravityAccStdDevY
* TimeGravityAccStdDevZ
* TimeBodyAccJerkMeanX
* TimeBodyAccJerkMeanY
* TimeBodyAccJerkMeanZ
* TimeBodyAccJerkStdDevX
* TimeBodyAccJerkStdDevY
* TimeBodyAccJerkStdDevZ
* TimeBodyGyroMeanX
* TimeBodyGyroMeanY
* TimeBodyGyroMeanZ
* TimeBodyGyroStdDevX
* TimeBodyGyroStdDevY
* TimeBodyGyroStdDevZ
* TimeBodyGyroJerkMeanX
* TimeBodyGyroJerkMeanY
* TimeBodyGyroJerkMeanZ
* TimeBodyGyroJerkStdDevX
* TimeBodyGyroJerkStdDevY
* TimeBodyGyroJerkStdDevZ
* TimeBodyAccMagMean
* TimeBodyAccMagStdDev
* TimeGravityAccMagMean
* TimeGravityAccMagStdDev
* TimeBodyAccJerkMagMean
* TimeBodyAccJerkMagStdDev
* TimeBodyGyroMagMean
* TimeBodyGyroMagStdDev
* TimeBodyGyroJerkMagMean
* TimeBodyGyroJerkMagStdDev
* FrequencyBodyAccMeanX
* FrequencyBodyAccMeanY
* FrequencyBodyAccMeanZ
* FrequencyBodyAccStdDevX
* FrequencyBodyAccStdDevY
* FrequencyBodyAccStdDevZ
* FrequencyBodyAccJerkMeanX
* FrequencyBodyAccJerkMeanY
* FrequencyBodyAccJerkMeanZ
* FrequencyBodyAccJerkStdDevX
* FrequencyBodyAccJerkStdDevY
* FrequencyBodyAccJerkStdDevZ
* FrequencyBodyGyroMeanX
* FrequencyBodyGyroMeanY
* FrequencyBodyGyroMeanZ
* FrequencyBodyGyroStdDevX
* FrequencyBodyGyroStdDevY
* FrequencyBodyGyroStdDevZ
* FrequencyBodyAccMagMean
* FrequencyBodyAccMagStdDev
* FrequencyBodyAccJerkMagMean
* FrequencyBodyAccJerkMagStdDev
* FrequencyBodyGyroMagMean
* FrequencyBodyGyroMagStdDev
* FrequencyBodyGyroJerkMagMean
* FrequencyBodyGyroJerkMagStdDev
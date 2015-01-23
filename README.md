Course Project: Getting and Cleaning Data
=========================================

Overview
------------
This repository contains code for the course "Getting and Cleaning Data" hosted by the Coursera. 

Data used
------------------
The code uses UCI HAR Dataset made available by Samsung corporation. It contains data collected from the accelerometers from the Samsung Galaxy S smartphone. The dataset can be downloaded at https://d396qusza40orc.cloudfront.net/getdata/projectfiles/UCI HAR Dataset.zip. 

Dataset is split into training and testing subsets. There are 561 features, each representing a single measured variable. Every instance is associated with a subject and labeled with an activity identifier.

Processing steps
-------------------------------------
The script run_analysis.R executes following steps:

0. Retrieves and extracts UCI HAR Dataset from the web.
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names from file activity_labels.txt to name the activities in the data set.
4. Appropriately labels the data set with descriptive variable names from the file features.txt. The resulting tidy data set in stored to the file data_tidy.csv. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject. The resulting dataset in stored to the file data_means.csv. 

Additional information
-------------------
The CodeBook.md file describes resulting data and variables.

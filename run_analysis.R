# Check if data exists
if(!file.exists('UCI HAR Dataset')) {
        message('Downloading data, please wait...')
        # Download and extract the data
        url<-'https://d396qusza40orc.cloudfront.net/getdata/projectfiles/UCI HAR Dataset.zip'
        download.file(url, destfile='UCI HAR Dataset.zip', mode='wb')
        unzip('UCI HAR Dataset.zip')
        unlink('UCI HAR Dataset.zip')}

#------------------------------------------------------------------------------
# STEP 1: Merge the training and the test sets to create one data set.
#------------------------------------------------------------------------------

# Read training dataset
x_train<-read.table('UCI HAR Dataset/train/X_train.txt')
y_train<-read.table('UCI HAR Dataset/train/y_train.txt')
subject_train<-read.table('UCI HAR Dataset/train/subject_train.txt')

# Read test dataset
x_test<-read.table('UCI HAR Dataset/test/X_test.txt')
y_test<-read.table('UCI HAR Dataset/test/y_test.txt')
subject_test<-read.table('UCI HAR Dataset/test/subject_test.txt')

# Join training and test rows
x<-rbind(x_train, x_test)
y<-rbind(y_train, y_test)
subject<-rbind(subject_train, subject_test)

#------------------------------------------------------------------------------
# STEP 2: Extract only the measurements on the mean and standard deviation for
# each measurement. 
#------------------------------------------------------------------------------

# Read feature names
features<-read.table("UCI HAR Dataset/features.txt")[, 2]

# Name the columns in the measurments data table
names(x)<-features

# Extract only feature names for mean and std standard measurments
features_mean_std<-grep("(mean|std)\\(\\)", features)

# Extract feature and standard deviation measurments
x_mean_std<-x[, features_mean_std]

#------------------------------------------------------------------------------
# STEP 3: Use descriptive activity names to name the activities in the data 
# set. 
#------------------------------------------------------------------------------

# Read the activity labels
activities<-read.table("UCI HAR Dataset/activity_labels.txt")

# Name the activities in the dataset
y[, 1]<-activities[y[, 1], 2]

#------------------------------------------------------------------------------
# STEP 4: Appropriately label the data set with descriptive variable names.
#------------------------------------------------------------------------------

# Label the measurement data. Improve feature naming by removing unnecessary
# characters.
names(x_mean_std)<-gsub("-mean\\(\\)", "Mean", names(x_mean_std))
names(x_mean_std)<-gsub("-std\\(\\)", "StdDev", names(x_mean_std))
names(x_mean_std)<-gsub("^(t)","Time", names(x_mean_std))
names(x_mean_std)<-gsub("^(f)","Frequency", names(x_mean_std))
names(x_mean_std)<-gsub("BodyBody","Body", names(x_mean_std))
names(x_mean_std)<-gsub("-", "", names(x_mean_std))

# Label subject data
names(subject)<-"Subject"

# Label activity data
names(y)<-"Activity"

# Join measurment, subject and activity data into one dataset with appropriate
# column labels
data<-cbind(y, subject, x_mean_std)

# Write the data to the file
write.table(data, "data_tidy.txt", row.name=FALSE) 

#------------------------------------------------------------------------------
# STEP 5: From the data set in step 4, create a second, independent tidy data
# set with the average of each variable for each activity and each subject.
#------------------------------------------------------------------------------

# Aggregate the data by activity and subject and calculate means for each 
# measurment
result<-aggregate(
        data[, 3:length(names(data))], 
        by=list(Activity=data$Activity, Subject=data$Subject), 
        mean
);

# Write the data to the file
write.table(result, "data_means.txt", row.name=FALSE) 

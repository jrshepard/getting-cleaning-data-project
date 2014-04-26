## Merges the training and the test sets to create one data set.
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
names(activity_labels) <- c("activity_id","activity_label")

features <- read.table("UCI HAR Dataset/features.txt") ## x column labels

x_test <- read.table("UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")

x_train <- read.table("UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")

names(x_test) <- features[,2]
names(y_test) <- "activity_id"
names(x_train) <- features[,2]
names(y_train) <- "activity_id"
names(subject_test) <- "subject"
names(subject_train) <- "subject"

##  
test_with_subject_and_activity <- cbind(subject_test,y_test,x_test)
train_with_subject_and_activity <- cbind(subject_train,y_train,x_train)

## Uses descriptive activity names to name the activities 
## in the data set
merged_test_data <- merge(test_with_subject_and_activity,activity_labels,
                          by.x="activity_id",by.y="activity_id",all=T)
merged_train_data <- merge(train_with_subject_and_activity,activity_labels,
                           by.x="activity_id",by.y="activity_id",all=T)

## Extracts only the measurements on the mean and standard 
## deviation for each measurement. 
train_extract <- merged_train_data[,grep("mean()|std()",names(merged_train_data),value=F)]
test_extract <- merged_test_data[,grep("mean()|std()",names(merged_test_data),value=F)]

## Creates a second, independent tidy data set with the 
## average of each variable for each activity and each subject. 



c## Merges the training and the test sets to create one data set.

##read in activity labels and define column names
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
names(activity_labels) <- c("activity_id","activity")

##read in features table
features <- read.table("UCI HAR Dataset/features.txt") ## x column labels

## read in test data
x_test <- read.table("UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")


## read in training data
x_train <- read.table("UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")

## Define proper column names
names(x_test) <- features[,2]
names(y_test) <- "activity_id"
names(x_train) <- features[,2]
names(y_train) <- "activity_id"
names(subject_test) <- "subject"
names(subject_train) <- "subject"

## combine subjects, test, and activities
test_with_subject_and_activity <- cbind(subject_test,y_test,x_test)
train_with_subject_and_activity <- cbind(subject_train,y_train,x_train)

## merges test and train data with descriptive labels
merged_test_data <- merge(test_with_subject_and_activity,activity_labels,
                          by.x="activity_id",by.y="activity_id",all=T)
merged_train_data <- merge(train_with_subject_and_activity,activity_labels,
                          by.x="activity_id",by.y="activity_id",all=T)

## Extracts only the measurements on the mean and standard 
## deviation for each measurement. 
train_extract <- merged_train_data[,grep("mean()|std()|activity|subject",names(merged_train_data),value=F)]
test_extract <- merged_test_data[,grep("mean()|std()|activity|subject",names(merged_test_data),value=F)]

## Bind train and test data sets
test_train_Bind <- rbind(train_extract, test_extract)

## Extract necessary columns for analysis
extract <- test_train_Bind[,2:82]

## Creates a second, independent tidy data set with the 
## average of each variable for each activity and each subject. 
## subject, activity, variable, average
melted <- melt(extract,id=c("subject","activity"),
               measure.vars=names(extract)[c(-1,-81)])
casted <- dcast(melted, subject + activity ~ variable, mean)

## output second independent tidy data set
write.table(casted, "HAR Data - Mean by Subject and Activity.txt")



Codebook - Getting and Cleaning Data Project
========================================================

### Variables
For the purposes of this analysis, the variables were defined as the following:

1.  Subject (each subject identified with number 1 through 30)
2.  Activity (categorical)
    * WALKING
    * WALKING_UPSTAIRS
    * WALKING_DOWNSTAIRS
    * SITTING
    * STANDING
    * LAYING
3. Variables
    * The measurement variables extracted from the original dataset (see "UCI HAR Dataset/features.txt") were all those that contained the "mean" or "std" (standard deviation) measurements.
    * Each X, Y, and Z measurement recorded from the smartphones is shown in standard gravity units 'g'
    * The body acceleration signal was found by subtracting the gravity from the total acceleration
    * The angular velocity measurements ("gyro") are measured in radians per second

### Transformations

1. Read in data sets and label column names
2. Combine the subject, x and y data sets for both the test and train data 
3. Combine with descriptive activity labels
4. Extract measurements on the mean and standard deviation for each measurement
5. Combine the test and train data sets into one data set
6. Eliminate numeric descriptive data columns
7. Melt data into format for easy casting
8. Cast the data by subject and activity and return the mean for each measurement
9. Write the resulting tidy data set to a text file

### Analysis Environment

* Intel Mac OS X 10.9.2
* RStudio Version 0.98.501
* Packages in addition to base: "reshape2" (melt, dcast)
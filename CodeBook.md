---
Code book for Coursera Getting and Cleaning Data course project
---
Raw data was obtained from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

It was generated according to the follow methodology: 
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

Unziped files were store on saem dir (called "allfiles").

## Details on each file from raw data set

- X_train.txt : 
  - 7352 observations of 561 variables.
  - 561-feature vector with time and frequency domain variables for train data set
  
- subject_train.txt : 
  - 7352 observations of 1 variable;
  - Each row identifies the subject who performed the activity for each window sample. Its range      is from 1 to 30;
  
- y_train.txt: 
  - 7352 observations of 1 variable;
  - Activity labels for observation and subject.

- X_test.txt: 
  - 2947 observations of 561 variables;
  - 561-feature vector with time and frequency domain variables for test data set;

- subject_test.txt : 
  - 2947 observations of 1 variables;
  - Each row identifies the subject who performed the activity for each window sample. Its range      is from 1 to 30;
  
- y_test.txt : 
  - 2947 observations of 1 variables;
  - Activity labels for observation and subject;

- features.txt : 
  - 561 observations of 2 variables;
  - Shows information about the variables used on the feature vector;
  
- activity_labels.txt
  - 6 boservations of 2 variables
  - Shows information on the folowing activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)
 
## Details on each variable

- features: output from reading "features.txt". Raw data does not have headers.
- featurelabels: readable variables information from features.
- actlabels: output from reading "activity_labels.txt". Raw data does not have headers.
- sbj_test: output from reading "subject_test.txt". Raw data does not have headers.
- sbj_train: output from reading "subject_train.txt". Raw data does not have headers.
- y_test/ x_test: output from reading [y/x]_test.txt. Raw data does not have headers.
- y_train/ x_train: output from reading [y/x]_train.txt. Raw data does not have headers.
- test_data: Merging all test data (x_test,y_test,sbj_test) by binding columns. They all have same number of rows.
- train_data: Merging all train (x_train,y_train,sbj_train) by binding columns. They all have same number of rows.
- total_data: Merges all data (test_data,train_data) by binding rows. They all have same number of columns.
- extracted_data <- data frame with columns from  total_data info on subejct, activity and columns with mean and std infomration.
- sbj_act_mean: tidy data set with the average of each variable for each activity and each subject.

## Output
- tidy_data.txt: txt file containing sbj_act_mean information.
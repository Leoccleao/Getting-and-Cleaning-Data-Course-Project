
# Files were downloaded and stored at folder ./allfiles. Setting working directory accordingly.
setwd("/Users/leonardoleao/R/Getting-and-Cleaning-Data-Course-Project/allfiles")

# Organizing features
features <- read.table("features.txt", header = FALSE)
    # get column names
    featurelabels <- features$V2
    
    # descriptive activity names to name the activities in the data set
    featurelabels <- gsub("^f", "frequencyDomain", featurelabels)
    featurelabels <- gsub("^t", "timeDomain", featurelabels)
    featurelabels <- gsub("BodyBody", "Body", featurelabels)
    featurelabels <- sub("\\(\\)","",featurelabels) #removing "( )"
    
    



# Organizing activities 
actlabels <- read.table("activity_labels.txt", header = FALSE)

# An identifier of the subject who carried out the experiment.
sbj_test <- read.table("subject_test.txt", col.names = "subject", header = FALSE)
sbj_train <- read.table("subject_train.txt", col.names = "subject", header = FALSE)

#- Merging labels and activity info, securing that "merge" does not reorder info. 
  # Selecting only descriptive activity names - activity_label
y_test <- read.table("y_test.txt", header = FALSE)
y_test <- merge(y_test,actlabels, sort = FALSE)
colnames(y_test) <- c("activity","activity_label")
y_test <- select(y_test,2)


y_train <- read.table("y_train.txt", header = FALSE)
y_train <- merge(y_train,actlabels, sort = FALSE)
colnames(y_train) <- c("activity","activity_label")
y_train <- select(y_train,2)

#A 561-feature vector with time and frequency domain variables.
# Appropriately labels the data set with descriptive variable names.
x_test <- read.table("X_test.txt", header = FALSE,col.names = featurelabels)
x_train <- read.table("X_train.txt", header = FALSE,col.names = featurelabels)


# Merges the training and the test sets to create one data set.
test_data <- cbind(x_test,y_test,sbj_test)
train_data <- cbind(x_train,y_train,sbj_train)
total_data <- rbind(test_data,train_data)

# Extracts only the measurements on the mean and standard deviation for each measurement.
extracted_data <- select(total_data,subject,activity_label, contains("mean")|contains("std"))

# independent tidy data set with the average of each variable for each activity and each subject.
  # group by subject and activity
sbj_act_mean <- extracted_data %>% 
                group_by(subject, activity_label) %>% 
                summarise(across(1:86, mean)) #summarizing variable columns using mean


# output to file "tidy_data.txt"
write.table(sbj_act_mean, file = "tidy_data.txt", quote = FALSE, row.names = FALSE)

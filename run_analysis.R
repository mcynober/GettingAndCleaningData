library(plyr)

## Check if the Samsung data is in the working directory

check.data <- function() {
  if(!file.exists("getdata-projectfiles-UCI HAR Dataset.zip")) {
    message("Error - No Dataset Found in Working Directory")
  }
  unzip("getdata-projectfiles-UCI HAR Dataset.zip", overwrite=TRUE, exdir=".")
}

## Read then merges the training and the test sets to create one data set.

merge.data <- function() {
  training.x <- read.table("./UCI HAR Dataset/train/X_train.txt")
  test.x <- read.table("./UCI HAR Dataset/test/X_test.txt")
  merged.x <- rbind(training.x, test.x)

  training.y <- read.table("./UCI HAR Dataset/train/Y_train.txt")
  test.y <- read.table("./UCI HAR Dataset/test/y_test.txt")
  merged.y <- rbind(training.y, test.y)
  
  training.subject <- read.table("./UCI HAR Dataset/train/subject_train.txt")
  test.subject <- read.table("./UCI HAR Dataset/test/subject_test.txt")
  merged.subject <- rbind(training.subject, test.subject)
  
  list(x=merged.x, y=merged.y, subject=merged.subject)
}

## Extracts only the measurements on the mean and standard deviation for each measurement. 

extract.measures <- function(df) {
  features <- read.table("./UCI HAR Dataset/features.txt")
  
  data.mean <- sapply(features[,2], function(x) grepl("mean()", x, fixed=TRUE))
  data.sd <- sapply(features[,2], function(x) grepl("std()", x, fixed=TRUE))
  extracted.measures <- df[, (data.mean | data.sd)]
  colnames(extracted.measures) <- features[(data.mean | data.sd), 2]
  extracted.measures
}

## Uses descriptive activity names to name the activities in the data set

name.activities <- function(df) {
  activities <- read.table("./UCI HAR Dataset/activity_labels.txt")
  colnames(df) <- "activity"
  for (i in 1:6) {
    df$activity[df$activity == i] = activities[,2][i]
  }
  df
}

## This is the overall function calling the previously presented ones.
## It includes a passage to appropriately label the data set with descriptive variable names. 
## It also creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

run_analysis <- function () {  
  check.data()
  merged.data <- merge.data()
  x <- extract.measures(merged.data$x)
  y <- name.activities(merged.data$y)
  colnames(merged.data$subject) <- c("subject")
  combined.data <- cbind(x, y, merged.data$subject)
  write.csv(combined.data, "./UCI HAR Dataset/Clean_dataset.csv", row.names=FALSE)
  tidy.dataset <- ddply(combined.data, .(subject, activity), function(x) colMeans(x[,1:60]))
  write.csv(tidy.dataset, "./UCI HAR Dataset/Tidy_dataset.csv", row.names=FALSE)
}


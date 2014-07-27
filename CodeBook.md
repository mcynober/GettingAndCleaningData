Getting And Cleaning Data - Peer Assessment - CodeBook
======================
The code run_analysis.R :
- Checks if the Samsung data is in the working directory. You can read the README.md file to have more information about this dataset
- Reads then merges the training and the test sets to create one data set.
- Extracts only the measurements on the mean and standard deviation for each measurement.
- Uses descriptive activity names to name the activities in the data set and appropriately labels the data set with descriptive variable names.
- Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The code first merges a 2947x561 dataframe and its two corresponding 2947x1 dataframes (this is the test dataset) with a 7352x561 dataframe and its two corresponding 7352x1 dataframes (this is the training dataset), resulting in a dataframe with 10299 instances and 561 attributes (for 30 subjects and 6 activities).

Additional information about the original dataset can be found at
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The code is structured into different functions called into the run_analysis() function. It produces a tidy dataset with averages for each of the attributes (i.e. 68 columns including subject ID, activity names and measurements) for 180 groups of activity and subject.
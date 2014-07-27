Getting And Cleaning Data - Peer Assessment - Readme
======================
This repository contains:

- the current README.md file describing how the script works
- a CodeBook.md file describing the variables of the output file
- a run_analysis.R file containing the code for performing the analysis
- a tidy dataset produced according to these instructions

The data on which the run_analysis.R code was used to generate the tidy dataset was downloaded on July, 25th 2014 from
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The system used to conduct this analysis was:
MAC OS X Version 10.9.4
Darwin Kernel Version 13.3.0 x86_64
R 3.1.0 GUI 1.64 Mavericks build (6734)
R Studio Version 0.98.953

The code requires the plyr() package to operate.

The run_analysis.R file can only be run if the Samsung data is in your working directory as a Zip file. Due to the size of the dataset, it is recommended, to prevent long processing time, to download it directly through the link provided above rather than through R.

The dataset merging step may take some time, depending on your system's characteristics. Please be patient while it is being processed.

External sources where used when writting the code such as R question and answer elements available on Stack Overflow or other Github users.
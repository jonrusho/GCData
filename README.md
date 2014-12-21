GCData
======

course project for Coursera Getting and Cleaning Data

run_analysis.R

Reads in data from the UCI HAR dataset.   The data files should be located in the same directory as run_analysis.R

#subject_test.txt   subject number, test set
#subject_train.txt  subject number, training set
#X_test.txt         activity data, test set
#X_train.txt        activity data, training set
#y_test.txt         activity code, test set
#y_train.txt        activity code, training set

Additionally, the activity and feature names need to be in the same directory as well.
activity_labels.txt
features.txt


To use run_analysis.R, make sure everything is in the same directory, then invoke R.
Once started, source the routine

> source("run_analysis.R")


This will create a file called tidydata.txt that contains averages of the mean & standard deviation for the measurements grouped by activity and subject.

###CODEBOOK
Please refer to the CodeBook.md for the codebook details.

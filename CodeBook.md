
### CodeBook.md

Here is a description of the columns in the output from run_analysis.R   Transformations & program notes follow this list.

Subject    -- Test subject indentity number
Activity   -- Activity  one of ( WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)

The following columns are the mean values of their respective columns in the original data set.  Refer to the original data for more information on what each column originally meant:

Mean of  tBodyAcc.mean...X
Mean of  tBodyAcc.mean...Y
Mean of  tBodyAcc.mean...Z
Mean of  tBodyAcc.std...X
Mean of  tBodyAcc.std...Y
Mean of  tBodyAcc.std...Z
Mean of  tGravityAcc.mean...X
Mean of  tGravityAcc.mean...Y
Mean of  tGravityAcc.mean...Z
Mean of  tGravityAcc.std...X
Mean of  tGravityAcc.std...Y
Mean of  tGravityAcc.std...Z
Mean of  tBodyAccJerk.mean...X
Mean of  tBodyAccJerk.mean...Y
Mean of  tBodyAccJerk.mean...Z
Mean of  tBodyAccJerk.std...X
Mean of  tBodyAccJerk.std...Y
Mean of  tBodyAccJerk.std...Z
Mean of  tBodyGyro.mean...X
Mean of  tBodyGyro.mean...Y
Mean of  tBodyGyro.mean...Z
Mean of  tBodyGyro.std...X
Mean of  tBodyGyro.std...Y
Mean of  tBodyGyro.std...Z
Mean of  tBodyGyroJerk.mean...X
Mean of  tBodyGyroJerk.mean...Y
Mean of  tBodyGyroJerk.mean...Z
Mean of  tBodyGyroJerk.std...X
Mean of  tBodyGyroJerk.std...Y
Mean of  tBodyGyroJerk.std...Z
Mean of  tBodyAccMag.mean..
Mean of  tBodyAccMag.std..
Mean of  tGravityAccMag.mean..
Mean of  tGravityAccMag.std..
Mean of  tBodyAccJerkMag.mean..
Mean of  tBodyAccJerkMag.std..
Mean of  tBodyGyroMag.mean..
Mean of  tBodyGyroMag.std..
Mean of  tBodyGyroJerkMag.mean..
Mean of  tBodyGyroJerkMag.std..
Mean of  fBodyAcc.mean...X
Mean of  fBodyAcc.mean...Y
Mean of  fBodyAcc.mean...Z
Mean of  fBodyAcc.std...X
Mean of  fBodyAcc.std...Y
Mean of  fBodyAcc.std...Z
Mean of  fBodyAcc.meanFreq...X
Mean of  fBodyAcc.meanFreq...Y
Mean of  fBodyAcc.meanFreq...Z
Mean of  fBodyAccJerk.mean...X
Mean of  fBodyAccJerk.mean...Y
Mean of  fBodyAccJerk.mean...Z
Mean of  fBodyAccJerk.std...X
Mean of  fBodyAccJerk.std...Y
Mean of  fBodyAccJerk.std...Z
Mean of  fBodyAccJerk.meanFreq...X
Mean of  fBodyAccJerk.meanFreq...Y
Mean of  fBodyAccJerk.meanFreq...Z
Mean of  fBodyGyro.mean...X
Mean of  fBodyGyro.mean...Y
Mean of  fBodyGyro.mean...Z
Mean of  fBodyGyro.std...X
Mean of  fBodyGyro.std...Y
Mean of  fBodyGyro.std...Z
Mean of  fBodyGyro.meanFreq...X
Mean of  fBodyGyro.meanFreq...Y
Mean of  fBodyGyro.meanFreq...Z
Mean of  fBodyAccMag.mean..
Mean of  fBodyAccMag.std..
Mean of  fBodyAccMag.meanFreq..
Mean of  fBodyBodyAccJerkMag.mean..
Mean of  fBodyBodyAccJerkMag.std..
Mean of  fBodyBodyAccJerkMag.meanFreq..
Mean of  fBodyBodyGyroMag.mean..
Mean of  fBodyBodyGyroMag.std..
Mean of  fBodyBodyGyroMag.meanFreq..
Mean of  fBodyBodyGyroJerkMag.mean..
Mean of  fBodyBodyGyroJerkMag.std..
Mean of  fBodyBodyGyroJerkMag.meanFreq..
Mean of  angle.tBodyAccMean.gravity.
Mean of  angle.tBodyAccJerkMean..gravityMean.
Mean of  angle.tBodyGyroMean.gravityMean.
Mean of  angle.tBodyGyroJerkMean.gravityMean.
Mean of  angle.X.gravityMean.
Mean of  angle.Y.gravityMean.
Mean of  angle.Z.gravityMean.


### Transformations

run_analysis.R does the following:

* read in the original data files, activity labels and data column names
* Creates valid column names (i.e., avoids converting them into functions due to their added parenthesis) and prepends "Mean of"
* Creates valid column names for Subject and Activity code
* Creates relevant activity name data frame
* Selects from the original data anything that was a mean or standard deviation
* Splices the data together to form a dataframe that includes the subject identity, activity and mean/std data selected above
* Finally, uses aggregate to apply mean() to the data to compute means
* An artifact of using aggregate created two new columns in the dataframe.  These are renamed appropriately to Subject and Activity.   The original Subject & Activity columns are removed
* The file is written out as "tidydata.txt" into the current directory

# analyze sensor data from the UCI HAR Dataset
# all data files should be in the same directory as this script


# turn off warnings
options(warn=-1)
# read in the following files
#subject_test.txt   subject number, test set
#subject_train.txt  subject number, training set
#X_test.txt         activity data, test set
#X_train.txt        activity data, training set
#y_test.txt         activity code, test set
#y_train.txt        activity code, training set
#activity_labels.txt names of the activities
#features.txt       column names for the data in the activity data files

testsubj <- read.table("subject_test.txt")
trainsubj <- read.table("subject_train.txt")
data_test <- read.table("X_test.txt")
data_train <- read.table("X_train.txt")
test_act <- read.table("y_test.txt")
train_act <- read.table("y_train.txt")

# read in activity names
act_names <- read.table("activity_labels.txt")

# read in data column names
col_names <- read.table("features.txt")
# add names to data
names(data_test) <- paste("Mean of ", as.vector(make.names(col_names$V2)))
names(data_train) <- paste("Mean of ", as.vector(make.names(col_names$V2)))

#provide better names for columns
names(testsubj) <- c("Subject")
names(trainsubj) <- c("Subject")
names(test_act) <- c("ActivityCode")
names(train_act) <- c("ActivityCode")

#use descriptive activity names
test_act_names <- as.data.frame(act_names$V2[test_act$ActivityCode])
train_act_names <- as.data.frame(act_names$V2[train_act$ActivityCode])

names(test_act_names) <- c("Activity")
names(train_act_names) <- c("Activity")

# develop list of columns that are mean or std deviation
y <- as.vector(col_names$V2)
n <- grep("mean",y,ignore.case=TRUE)
m <- grep("std",y,ignore.case=TRUE)
mean_std_cols <- sort(append(n,m))

#extract just mean/std data from data_test and data_train
test_data <- data_test[,mean_std_cols]
train_data <- data_train[,mean_std_cols]

#merge the three tables into one
testset <- cbind(testsubj,test_act_names,test_data)
trainset <- cbind(trainsubj,train_act_names,train_data)

# bind it all together

alldata <- rbind(testset,trainset)

# compute means with aggregate.   This throws warnings based on the activity name
 blub <- aggregate(alldata,by=list(alldata$Subject,alldata$Activity), mean) 
# subset to remove two columns
bsub <-blub[,c(1:2,5:90)]
#rename columns
colnames(bsub)[1] <-"Subject"
colnames(bsub)[2] <-"Activity"

# dump it out
write.table(bsub, file="tidydata.txt", row.name=FALSE)

##The packages required for this file are installed and loaded
install.packages("dplyr")
library(dplyr)

install.packages("plyr")
library(plyr)

install.packages("reshape2")
library(reshape2)


##The dataset is downloaded into a temporary file in the working directory and unzipped under
##the folder 'UCI HAR Dataset'
if(!file.exists("UCI HAR Dataset"))
{
        dir.create("UCI HAR Dataset")
}

download.file(
        "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",
        destfile = "temp.file", method="curl",
        )

unzip("temp.file")

dateDownloaded <- date()
dateDownloaded

##Read the activity labels file
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")

##Name the columns in the activity labels data frame
names(activity_labels) <- c("activityCode", "activityDesc")

##Read the features file
features <- read.table("UCI HAR Dataset/features.txt")

##Name the columns in the features data frame
names(features) <- c("index", "desc")

##Modify the data frame to hold only the features that have either mean or standard deviation 'std'
features <- features[grepl("mean|std", features$desc),]

##Read the test subjects data
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
##Read the train subjects data
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")

##Name the vectors in both subject_test and subject_train data
names(subject_test) <- "subjectId"
names(subject_train) <- "subjectId"

##Read the test data
test_data <- read.table("UCI HAR Dataset/test/X_test.txt")
##Read only the desired columns (features containing mean/std)
test_data <- test_data[, features$index]

##Read the test data
train_data <- read.table("UCI HAR Dataset/train/X_train.txt")
##Read only the desired columns (features containing mean/std)
train_data <- train_data[, features$index]

##Read the test activity codes
test_activity <- read.table("UCI HAR Dataset/test/Y_test.txt")
##Read the train activity codes
train_activity <- read.table("UCI HAR Dataset/train/Y_train.txt")

##Name the test_activity and train_activity vectors
names(test_activity) <- "activityCode"
names(train_activity) <- "activityCode"

##Name the test_data and train_data columns using the features$desc values
colnames(test_data) <- features$desc
colnames(train_data) <- features$desc

##Bind the subjectId, activityCode and test_data columns together
test_data <- cbind(subject_test, test_activity, test_data)
##Bind the subjectId, activityCode and train_data columns together
train_data <- cbind(subject_train, train_activity, train_data)

##Row bind the test_data and train_data into a single dataset
data <- rbind(test_data, train_data)

##Merge activity_labels and data by activityCode and keep only the activityDesc
data <- merge(activity_labels, data, by="activityCode", all.x=TRUE)
data <- data[c(3,2,4:82)]

##Sort the data frame by subjectId
data <- arrange(data, subjectId)
 
##Melt the data frame so that all the column values are grouped by subjectId and activityDesc
##and use the summarize function to find the mean and sd values for each measurement
##and rearrange the summarized data into columns again
data <- melt(data, c("subjectId", "activityDesc"))
data <- ddply(data, .(subjectId, activityDesc, variable), summarize, mean = mean(value), sd = sd(value))
data <- melt(data, c("subjectId", "activityDesc", "variable"), variable.name="variable2")
data <- dcast(data, subjectId + activityDesc ~ variable + variable2)

##Solution 2 using data.table - This one works too but is not easily readable
##install.packages("data.table")
##library(data.table)
##data <- as.data.table(data)
##data <- setnames(data[, c(mean = lapply(.SD, mean), sd = lapply(.SD, sd)), by = list(subjectId, activityDesc)], 
##c("subjectId", "activityDesc", sapply(names(data)[-c(1,2)], paste0, c(".Mean", ".SD"))))

##Write the data frame into a text file
write.table(data, file = "tidy_data.txt", sep = " ", row.names = FALSE, col.names = TRUE)


# Getting And Cleaning Data - Course Project

The purpose of this project is to demonstrate one's ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. 

This repo contains three files

1. README.md 
       This file explains the project and how the script works
2. run_analysis.R
       This file contains the complete R code to create a text file with tidy data from the initial data
3. CodeBook.md
       This file describes the variables, the data, and any transformations or work performed to clean up the data

## Initial data

The initial data for the project can be downloaded from the following link

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The initial data is a zip file that contains the required data scattered in many different files as follows
1. Activity labels and description - activity_labels.txt
2. Features index and their description - features.txt
3. Information on all the measurements - features
4. Test files
        * Test subject data in subject_test.txt
        * All the measurements in X_test.txt
        * Activity codes in y_test.txt
5. Train files
        * Train subject data in subject_train.txt
        * All the measurements in X_train.txt
        * Activity codes in y_train.txt
6. Both the test and train data contain 'Inertial signal' files for the individual measurements of different features. Since the data is available in X_test.txt, X_train.txt, y_test.txt and y_train.txt, these files can be safely ignored.

## Expected result

The goal of the project is to create one tidy dataset that has the following data
1. Subject ID
2. Activity Description
3. Average values of only Mean and Standard Deviation measurements

## Preliminary steps involved in the project

1. R (Version 3.1.3) was installed in the system
2. R Studio (Version 0.98.1103) was installed in the system
3. The working directory was set using the setwd() command

## Steps involved in run_analysis.R

1. The script first installs and loads the packages dplyr, plyr, reshape2 as they are needed for the work performed to clean up the data
2. The script checks if the folder "UCI HAR Dataset" is already downloaded. If not, it creates a new directory, downloads and unzips the files
3. The activity and features txt files are read and their columns named appropriately. 
4. The features data frame is subsetted to contain only the mean and standard deviation measurements using 'grepl' command
5. The following steps are performed on both the train and test data files
       * The subject data, activity data, measurements etc are read and the columns named appropriately
       * Using the features index, only the relevant measurements (mean and std) for the project are extracted and stored
       * The columns read from different files are bound together using 'cbind' into a single data frame
6. Both the train and test data are combined together as a single data frame using 'rbind'
7. The data frame 'data' is merged with 'activity_labels' so that the activity description is a part of the data frame
8. The columns of the data frame are reordered and sorted by subjectId so that subjectId appears as the first column and activity description appears as the second 
9. Using 'melt', all the measurement names and their values for each subjectID and activityDesc are brought into columns 'variable' and 'value'
10. Using 'ddply', the means of all the measurements for each subject, activity, and measurement are calculated - This is the narrow form of tidy data
11. Using 'melt' and 'dcast', the wide form of tidy data is obtained and the measurement names appended with the text '_mean' to indicate average value
12. The resulting tidy data frame is written in tidy_data.txt file


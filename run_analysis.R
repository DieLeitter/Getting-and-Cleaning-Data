library(reshape2)

## If folder data doesn't exist create it (to store the files)
if(!file.exists("./data")){dir.create("./data")}

########################################
##### Download and unzip file ##########

fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileURL, destfile = "./data/dataset.zip")
unzip("./data/dataset.zip", exdir = "./data")


####################################### 
#### Features and activity labels #####

## Read features (measurments) 
features <- read.table("./data/UCI HAR Dataset/features.txt")
head(features); class(features)
features_names <- as.character(features[,2])

## Find features of the mean and standard deviation
features_wanted <- grepl(".*[Mm]ean.*|.*std.*", features_names) ; table(features_wanted)
features_names <- features_names[features_wanted]

## Read activity labels
activity <- read.table("./data/UCI HAR Dataset/activity_labels.txt")
head(activity)


####################################### 
#### Training and Test Data sets #######

## 1. Read the train dataset
train <- read.table("./data/UCI HAR Dataset/train/X_train.txt")

## Extract only wanted features (measurments on mean and standard deviation)
train <- train[,features_wanted]

## Create data frame with activity labels
train_activity <- read.table("./data/UCI HAR Dataset/train/y_train.txt")

## Create data frame with subject
train_subject <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")

## bind the subject, activity labels, and training dataset
train <- cbind(train_subject, train_activity, train)


## 2. Read the test dataset
test <- read.table("./data/UCI HAR Dataset/test/X_test.txt")

## Extract only wanted features (measurments on mean and standard deviation)
test <- test[,features_wanted]

## Create data frame with activity labels
test_activity <- read.table("./data/UCI HAR Dataset/test/y_test.txt")
test_subject <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")

## bind the subject, activity labels, and training dataset
test <- cbind(test_subject, test_activity, test)


######################################
#### Merge training and test sets, and activity labeles

## Merge training and test sets
all_data <- rbind(train, test)
colnames(all_data) <- c("subject", "activity", features_names)

## Assign activity levels to activity lebels (1-WALKING, 2-WALKING_UPSTAIRS, etc)
all_data$activity = factor(all_data$activity, levels = activity[,1], labels = activity[,2])

## convert subject variable to factor
all_data$subject = factor(all_data$subject)


########################################
#### Create a tidy data set with the average of each variable 
#### for each activity and each subject.
all_data_melted <- melt(all_data, id = c("subject", "activity"))
all_data_mean <- dcast(all_data_melted, subject + activity ~ variable, mean)


#######################################
### Save data
write.table(all_data_mean, file = "tidyData.txt", row.names = FALSE)




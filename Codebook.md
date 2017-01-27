## Codebook for Assignment: Getting and Cleaning Data Course Project

### The data sets

The raw data for this assigment is data collected from the accelerometers from the Samsung Galaxy S smartphone
Data are avaliable at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Description at: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones


For the purpose of this project we use the folowing files:


* 'features.txt': List of all features.
* 'activity_labels.txt': Links the class labels with their activity name.
* 'train/X_train.txt': Training set.
* 'train/y_train.txt': Training labels.
* 'test/X_test.txt': Test set.
* 'test/y_test.txt': Test labels.
* 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 


### Variables 
* features : data.frame loaded form 'features.txt'
* features_wanted : index of features of interest, i.e. measurments on means and standard deviations
* features_names : character vector cotaining features names

* activity : data.frame loaded from 'activity_labels.txt'. first column contains 
* a number from 1-6 and the second column corresponding activity. 

* train : data.frame, contains measurments of training set 
(merged data from X_train.txt, y_train.txt, subject_train.txt)
* test : data.frame, contains measurments of test set 
(merged data from X_test.txt, y_test.txt, subject_test.txt)

* train/test_activity : loaded from y_train/test.txt
* train/test_subject : subject_train/test.txt

* all_data : merged train and test data sets
* all_data_melted : reshaped all_data date set according, each variable according to subject and activity 
* all_data_mean : data set with the average of each variable for each activity and each subject.

### Transformations

The train and test data are subseted to only include features of interest - measurments
on mean and standard deviation. The data containing subject and activity information are 
column binded (cbind) with train and test data sets. 

The all_data is created by row  binding (rbind) train and test data sets.

The all_data_melt is created by melting the all_data according to subject and activity (melt). 
The all_data_mean is created by averaging each variable for each subject and each activity (dcast and mean)

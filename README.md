# Getting-and-Cleaning-Data

Script run_analysis.R creates a tidy data set of data collected from the accelerometers from the Samsung Galaxy S smartphone
Data are avaliable at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.

### Part 1.
* Check if folder data exist. In not a folder data is created. The analyzed data sets will be stored in folder data.
* Download and unzip the file containing data.

### Part 2.
* Create variable that stores features (measurements) names
* Choose features only with means and standard deviation
* Create variable that stores activity levels and labels.

### Part 3.
* Read the training data set.
* Bind subject, activity and measurements.

### Part 4.
* Read test data set.
* Bind subject, activity and measurements.

### Part 5.
* Merge the training and test set. Set activity and subject variables as factors

### Part 6.
* Create a data set with average of each variable  for each activity and each subject (melt and dcast)

### Part 7.
* Save data as “tidyData.txt”.

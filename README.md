#How does "run_analysis.R" work

Xiang Li

The run_analysis.R conducts data cleaning for the samsung dataset 
(access the dataset here: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip). 
The goal of this script is to create two tidy datasets: "data" and "data_final". 

Dataset Dimensions:
====================
1. data: 10299 observations, 478 variables
2. data_final: 6 observations, 478 variables

Explanation for steps: 
======================
1.  read the training/testing dataset ("X_train.txt", "X_test.txt")
2.  read the activity column ("y_train.txt", "y_test.txt")
3.  add the activity column into the training/testing dataset with cbind()
4.  read the column names with read.table()
5.  assign the column names to both training and testing datasets
6.  merge training and testing dataset with rbind()
7.  remove duplicate columns with the same column names
8.  use regular expression to extract the column names that contain mean and standard deviation; extract any column name with "mean()" or "std()" but exclude those with "meanFreq()"
9.  read the activity label with read.table()
10. replace the number 1-6 with names of activity
11. replace the "-" in column names to make them look nicer
12. check the column names with colnames() in order to decide which column names need to be changed and how to changed them
13. replace "t" with "time" and "f" with "freq" so it's more self-explanatory
14. replace "Jerk" with "JerkSignal" and "Mag" with "Magnitude" so it's more self-explanatory
15. remove the () in the column names so it looks more tidy
16. changed the way that some variables lay out with gsub() so that they are more readable 
17. create another tidy dataset with the dplyr package, which calculates the column means
18. export the table and save it as a txt file with "write.table" 

For each record it is provided:
======================================
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 478-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The dataset includes the following files:
=========================================
- 'README.txt'
- 'result.txt': Shows information about the variable mean group by different activities.
 
License:
========
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.

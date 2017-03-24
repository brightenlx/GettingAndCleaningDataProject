Code Book
=========

This code book describes the variables, the data, and the transformations or work the author performed to clean up the data. 

Descriptions of variables and the data:
=======================================
All the variables are column means from the tidy dataset "data". The features selected for this dataset come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 'time' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (time-BodyAcc-XYZ and time-GravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (time-BodyAcc-JerkSignal-XYZ and time-BodyGyro-JerkSignal-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (time-BodyAcc-Magnitude, time-GravityAcc-Maganitude, time-BodyAcc-JerkSignal-Magnitude, time-BodyGyro-Magnitude, time-BodyGyro-JerkSignal-Magnitude). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing freq-BodyAcc-XYZ, freq-BodyAccJerk-XYZ, freq-BodyGyro-XYZ, freq-BodyAcc-JerkSignal-Magnitude, freq-BodyGyro-Magnitude, freq-BodyGyro-JerkSignal-Magnitude. (Note the 'freq' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  

'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

time-BodyAcc-XYZ
time-GravityAcc-XYZ
time-BodyAcc-JerkSignal-XYZ
time-BodyGyro-XYZ
time-BodyGyro-JerkSignal-XYZ
time-BodyAcc-Magnitude
time-GravityAcc-Magnitude
time-BodyAcc-JerkSignal-Magnitude
time-BodyGyro-Magnitude
time-BodyGyro-JerkSignal-Magnitude
freq-BodyAcc-XYZ
freq-BodyAcc-JerkSignal-XYZ
freq-BodyGyro-XYZ
freq-BodyAcc-Magnitude
freq-BodyAcc-JerkSignal-Magnitude
freq-BodyGyro-Magnitude
freq-BodyGyro-JerkSignal-Magnitude

The set of variables that were estimated from these signals are: 

mean: Mean value
std: Standard deviation
mad: Median absolute deviation 
max: Largest value in array
min: Smallest value in array
sma: Signal magnitude area
energy: Energy measure. Sum of the squares divided by the number of values. 
iqr: Interquartile range 
entropy: Signal entropy
arCoeff: Autorregresion coefficients with Burg order equal to 4
correlation: correlation coefficient between two signals
maxInds: index of the frequency component with largest magnitude
meanFreq: Weighted average of the frequency components to obtain a mean frequency
skewness: skewness of the frequency domain signal 
kurtosis: kurtosis of the frequency domain signal 
bandsEnergy: Energy of a frequency interval within the 64 bins of the FFT of each window.
angle: Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
time-BodyAccMean
time-BodyAcc-JerkSignalMean
time-BodyGyroMean
time-BodyGyro-JerkSignalMean

How to obtain the variable names:
=================================
1. read the activity label with read.table()
2. replace the number 1-6 with names of activity
3. replace the "-" in column names to make them look nicer
4. check the column names with colnames() in order to decide which column names need to be changed and how to changed them
5. replace "t" with "time" and "f" with "freq" so it's more self-explanatory
6. replace "Jerk" with "JerkSignal" and "Mag" with "Magnitude" so it's more self-explanatory
7. remove the () in the column names so it looks more tidy
8. changed the way that some variables lay out with gsub() so that they are more readable 
9. create a tidy dataset with the dplyr package, which calculates the column means

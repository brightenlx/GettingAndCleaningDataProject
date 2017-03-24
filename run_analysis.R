
################################################################
# Merges the training and the test sets to create one data set #
################################################################
# read the training set + the activity column
train = read.table("UCI HAR Dataset/train/X_train.txt", sep = "", header = FALSE)
train_label = read.table("UCI HAR Dataset/train/y_train.txt", sep="", header = FALSE)
train = cbind(train_label, train)

# read the testing set + the activity column
test = read.table("UCI HAR Dataset/test/X_test.txt", sep = "", header = FALSE)
test_label = read.table("UCI HAR Dataset/test/y_test.txt", sep="", header = FALSE)
test = cbind(test_label, test)

# read and assign the column names to both data sets
feature_label = read.table("UCI HAR Dataset/features.txt", sep = "", header = FALSE)
feature_label$V2
colnames(train) = c("activity", as.character(feature_label$V2))
colnames(test) = c("activity", as.character(feature_label$V2))

# merge training set and testing set
data = rbind(train, test)

# remove duplicate columns with the same col name
data = data[, !duplicated(colnames(data))]
dim(data) # becomes 478 columns

##########################################################################################
# Extracts only the measurements on the mean and standard deviation for each measurement #
##########################################################################################
regx = intersect(grep("mean()|std()", names(data)), grep("Freq()", names(data), invert = TRUE))
subdata = data[, regx]

##########################################################################
# Uses descriptive activity names to name the activities in the data set #
##########################################################################

# read the label as a table
activity_label = read.table("UCI HAR Dataset/activity_labels.txt", sep = "", header = FALSE)

# replace the numbers with activity names
for (i in activity_label$V1) {
        data$activity = gsub(i, activity_label$V2[i], data$activity)   
}

# replace the "_" with space
data$activity = gsub("_", " ", data$activity)   

#####################################################################
# Appropriately labels the data set with descriptive variable names #
#####################################################################

# check the label names
colnames(data)
# replace t/f 
colnames(data) = gsub("^t", "time-", colnames(data))   
colnames(data) = gsub("^f", "freq-", colnames(data))
colnames(data) = gsub("Jerk", "-JerkSignal", colnames(data))
colnames(data) = gsub("Mag", "-Magnitude", colnames(data))
colnames(data) = gsub("[()]", "", colnames(data))

# deal with the angle() variable name
colnames(data) = gsub("^anglet", "angle(time-", colnames(data))
colnames(data) = gsub("^angleX,", "angle(X,", colnames(data))
colnames(data) = gsub("^angleY,", "angle(Y,", colnames(data))
colnames(data) = gsub("^angleZ,", "angle(Z,", colnames(data))
colnames(data) = gsub("gravity$", "gravity)", colnames(data))
colnames(data) = gsub("gravityMean$", "gravityMean)", colnames(data))

################################################################
# creates a second, independent tidy data set with the average #
#  of each variable for each activity and each subject         #
################################################################
data = as.data.frame(data)

library(dplyr)
data_final = data %>%
        group_by(activity) %>%
        summarise_each(funs(mean(., na.rm=TRUE)))

dim(data_final) #6 478
write.table(data_final, file = "UCI HAR Dataset/result.txt", sep=" ", row.name=FALSE, quote = FALSE)



## run_analysis function prepares tidy data based on raw data sets that were provided
## as a result of Human Activity Recognition experient with Samsung smartphone.
## The function implements the following:
## 1. Merges the training and the test sets to create one data set
## 2. Extracts only the measurements on the mean and std deviation for each measurement
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive variable names
## 5. From the data set in step 4, it creates a second, independent tidy data set
##    with the average of each variable for each activity and each subject

require(plyr)
require(dplyr)

run_analysis <- function() {

## load all input datasets and dictionaries into their respective data frames
  feature <- tbl_df(read.table(file="features.txt", col.names = c("id", "name")))
  activity <- tbl_df(read.table(file="activity_labels.txt", col.names = c("activity_id", "activity_name")))
  
  X_train <- tbl_df(read.table(file="train/X_train.txt"))
  y_train <- tbl_df(read.table(file="train/y_train.txt"))
  subj_train <- tbl_df(read.table(file="train/subject_train.txt"))
  
  X_test <- tbl_df(read.table(file="test/X_test.txt"))
  y_test <- tbl_df(read.table(file="test/y_test.txt"))
  subj_test <- tbl_df(read.table(file="test/subject_test.txt"))
  
## using descriptive names having eliminated '(' and ')' symbols from original names
  names(X_train) <- names(X_test) <- gsub("\\(|\\)", replacement = "", x = feature$name)
  names(y_train) <- names(y_test) <- "activity_id"
  names(subj_test) <- names(subj_train) <- "subject_id"
  
## merging train and test datasets
  X <- rbind(X_train, X_test)
  y <- rbind(y_train, y_test)
  subj <- rbind(subj_train, subj_test)
  
## adding descriptive activity names to the labeled dataset
  y <- left_join(y, activity, by = c("activity_id")) %>% 
       select(activity_name)

## selecting only mean and std columns
  X <- X[ , grep("mean|std", names(X), value = FALSE)]
  
## combining all datasets together into a single tidy dataset
  tidydata <- cbind(X, y, subj)

## creating summary dataset with means for each variable by subject and activity
  df_summary <- ddply(tidydata, c("subject_id","activity_name"), numcolwise(mean))

## adding .mean suffix to measurement variables in summarized data , skip subject & activity
  names(df_summary)[-(1:2)] <- sapply(names(df_summary), function (x) paste(x, ".mean", sep=""), 
                                   USE.NAMES = FALSE)[-(1:2)]

## save the result without row numbers in the output file
  write.table(df_summary, file = "tidy_data_summary.txt", row.names = FALSE)
}
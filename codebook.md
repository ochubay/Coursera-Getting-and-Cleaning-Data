Code book for preparation of tidy data from the Human Activity Recognition Using Smartphones datasets [1]
========================
The scope of this code book covers tidy data preparation implemented in run_analysis.R

#### **Input data set ([download here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip))**
1. The input data set is provided in several files and contains the following info:
  * Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
  * Triaxial Angular velocity from the gyroscope. 
  * A 561-feature vector with time and frequency domain variables. 
  * Its activity label. 
  * An identifier of the subject who carried out the experiment.
2. The dataset includes the following files:
  * 'features.txt': List of all features (561 features)
  * 'activity_labels.txt': Links the class labels with their activity name (6 activities in the dictionary like walking, sitting, etc)
  * 'train/X_train.txt': Training set
  * 'train/y_train.txt': Training labels
  * 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
  * 'test/X_test.txt': Test set.
  * 'test/y_test.txt': Test labels.
  * 'test/subject_test.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
3. There are 33 basic primary variables (8 per each of 3D axis and 9 axis-agnostic) and 17 statistics computed per most of the variables. Additinally there are 5 angle() variable statistics computed.
4. These 8 primary variables (8*3 => 24 columns in the dataset since each variable is tripledmeasured in X, Y, Z axis projections) are:
  * tBodyAcc-XYZ
  * tGravityAcc-XYZ
  * tBodyAccJerk-XYZ
  * tBodyGyro-XYZ
  * tBodyGyroJerk-XYZ
  * fBodyAcc-XYZ
  * fBodyAccJerk-XYZ
  * fBodyGyro-XYZ
5. 9 axis-agnostic variables are listed below:
  * tBodyAccMag
  * tGravityAccMag
  * tBodyAccJerkMag
  * tBodyGyroMag
  * tBodyGyroJerkMag
  * fBodyAccMag
  * fBodyAccJerkMag
  * fBodyGyroMag
  * fBodyGyroJerkMag
6. List of statistics computed per each variable in the input datasets (train and test):
  * mean(): Mean value
  * std(): Standard deviation
  * mad(): Median absolute deviation 
  * max(): Largest value in array
  * min(): Smallest value in array
  * sma(): Signal magnitude area
  * energy(): Energy measure. Sum of the squares divided by the number of values. 
  * iqr(): Interquartile range 
  * entropy(): Signal entropy
  * arCoeff(): Autorregresion coefficients with Burg order equal to 4
  * correlation(): correlation coefficient between two signals
  * maxInds(): index of the frequency component with largest magnitude
  * meanFreq(): Weighted average of the frequency components to obtain a mean frequency
  * skewness(): skewness of the frequency domain signal 
  * kurtosis(): kurtosis of the frequency domain signal 
  * bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
  * angle(): Angle between to vectors.

#### **Preparing Tidy Data**
run_analysis.R script contains run_analysis() function which performs the following data processing:
###
1. reads all input datasets from "train" and "test" subdirectories (X_test, X_train, y_test, y_train, subj_test, subj_train) and dictionaries into their respective data frames
2. assigns descriptive names to the dataframes based on names located in *feature* dataframe which was loaded from feature.txt having eliminated '(' and ')' symbols from original names
3. merges train and test datasets into a consolidated datasets X, y, subj containing train and test data respectively 
4. removes all columns from the X dataframe which are not  'mean' or 'std' columns
5. combines all datasets X, y, subj together into a single dataframe *tidydataset*
6. creates summary dataset *df_summary* with means for each variable by subject and activity
7. adds .mean suffix to measurement variables in summarized data skiping grouping variables subject and activity
8. saves the result without row numbers in the output file 'tidy_data_summary.txt' in the working directory

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

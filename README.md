Run Analysis Info
=======================

This file details the steps and the explanations for those steps in the execution of my run_analysis.R script. 

First, I checked for the existence of a file "RunAnalysisData", and created it if it was nonexistent. Then set the working directory to "RunAnalysisData". Using the download.file() function, I downloaded the zipfile of all data and stored in the file "UCI_Files.zip". In order to properly link each variable to it's proper measurement, I stored the data from 'features.txt' in an object that I called features. 

After unzipping the files, stored data from 'test/X_test.txt' in object test_dat and 'train/X_train.txt, with col.names=features[,2]
so that the variables were matched with their proper measurements. I then extracted only the measurements that related to mean and put them in a data table called meandata, and the measurements that related to standard deviation and put them into a data table called stddata. I then rbinded meandata and stddata into a data table that included first the measurements of meandata, then those of stdata, and called the resulting data table meanstd.

I then rbinded the test_dat and the train_dat to form a data table with 10299 observations of 561 variables, which I called merged_dat. I then extracted only the columns of merged_dat that matched the values in meanstd, which resulted in a data table of 10299 obs. of 66 variables, which I called tidy.

Then read y_test.txt and y_train.txt files into separate tables called testactivity_dat and trainactivity_dat. Then rbinded those tables to form activity_dat data frame. I converted activity_dat to factors using the as.factor() function.

I then created a data frame from activity_labels.txt file, using the read.table() function and the data.frame function, and subsetted the resulting data frame to get only the names of the activities, and called the resulting vector activity. Passing activity_dat to the levels function, I substituted the values in activity_dat with the attributed activity labels using the values in activity. This created the descriptive activity names (Standing, Walking, etc.). I then created a data frame from the values in the object activity, which I called activities.

I then read the subject_test and subject_train files into separate data frames called testsubject_dat and trainsubject_dat, respectively. After rbinding those data frames into a data frame called subject_dat, I cbinded the subject_dat and activities data frames, creating a new data frame called subject_activity.

Lastly, I created my final tidy data table by cbinding the subject_activity data frame and the tidy data table, calling the resulting data table Final_Tidy. I wrote the Final_Tidy data table into a csv file using the write.table() function, and called that file "FinalTidy.txt".

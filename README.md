Getting and Cleaning Data Course Project
================================


The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. 

1. R script called run_analysis.R that does the following. 
2. Merges the training and the test sets to create one data set.
3. Extracts only the measurements on the mean and standard deviation for each measurement. 
4. Uses descriptive activity names to name the activities in the data set
5. Appropriately labels the data set with descriptive variable names. 

#######################################

This steps of R script of the course project

1. Determine Main Directory : UCI HAR Dataset

2. Create function mergecol : Function to load data list with pattern *.txt and combine all column as a alphabet

3. Create dttrain : Load training folder and create dttest : Load test folder, join dttrain & dttest (rbind) -> dtallfeatures

4. Read table activity and featuresname

5. Create label character class featuresname in Column V2

6. Create labelx class with cleaning label from "[-|(|)|,]" using gsub 

7. Join Subject, labelx and activity label (namesallfeatures)

8. Naming dtallfeatures with namesallfeatures

9. Search column with mean and std labels (labelmean, labelstd)

10. Select dtallfeatures only with numfeatures (labelmean, labelstd)

11. Create dtmeanstdsubact data frame for dtmeanstd, subject and activity factors

12. Average of each variable dtmeanstdsubact for each activity and each subject.

13. Cleaning NA column

14. Write tidy data to indendepentidy.txt

15. OK

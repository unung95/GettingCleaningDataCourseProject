## Code Book 

1. Main Directory : UCI HAR Dataset
2. mergecol : Function to load data list with pattern *.txt and combine all column as a alphabet
3. dttrain : Load training folder
4. dttest : Load test folder
5. dtallfeatures : join dttrain & dttest (rbind)
6. label : character class featuresname in Column V2
7. labelx : cleaning label from "[-|(|)|,]" using gsub 
8. namesallfeatures : join Subject, labelx and activity label
9. dtmeanstd : data only with mean and std labels
10. dtmeanstdsubact : data frame for dtmeanstd, subject and activity factors
11. res : average of each variable dtmeanstdsubact for each activity and each subject.
12. independentidy : data res with cleaning NA column


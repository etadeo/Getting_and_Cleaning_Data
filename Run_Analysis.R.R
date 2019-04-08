library(xlsx)
library(dplyr)

setwd("//chico-2012/FldrRedir$/etadeo/Desktop/Data Science/Coursera/Clean Data/UCI HAR Dataset")

#Read and merge data - subjects and volunteers
x_train <- read.table("train/X_train.txt") # Training Set
y_train <- read.table("train/y_train.txt") # Training labels

#combine test and train 
train_data <- cbind(y_train, x_train)

###Test Data
y_test <- read.table("test/y_test.txt")
x_test <- read.table("test/X_test.txt")

test_data <- cbind(x_test, y_test)#combine

#Test and Trian merge
Final <- rbind(test_data, train_data)

# names of columns
features <- read.table("features.txt")
features <- features[,2]
colnames(Final) <- features
colnames(Final)[562] <- "Activity" # rename the activity column that is not included in features 

#Pull mean and st. deviation
Mean_And_Dev <- grep("-mean\\(\\)|-std\\(\\)",features)

Final_Data <- Final[c(1:6,41:46,81:86,121:126,161:166,201:202,214:215,227:228,240:241,
                        253:254,266:271,345:350,424:429,503:504,516:517,529:530,542:543,562)]#Filter columns

#Names of the activities
Activity_names <- read.table("activity_labels.txt")

#Dataframe with descriptive activity names
Final_Data <- Final_Data %>%
  mutate(Activity_Name = if_else(Final_Data$Activity =="1", "WALKING", 
                                          if_else(Final_Data$Activity == "2", "WALKING_UPSTAIRS",
                                          if_else(Final_Data$Activity == "3", "WALKING_DOWNSTAIRS",
                                          if_else(Final_Data$Activity == "4", "SITTING",
                                          if_else(Final_Data$Activity == "5", "STANDING",
                                          if_else(Final_Data$Activity == "6", "LAYING","0")))))))

Final_Data <- Final_Data %>% select(Activity_Name,everything())                 

# Export the Final Data set 
write.table(Final_Data, './Final_Data.txt',row.names=TRUE,sep='\t')


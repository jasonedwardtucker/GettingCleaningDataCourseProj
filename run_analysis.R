fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile="alldata.zip")
unzip("alldata.zip")
features <- read.table("./UCI HAR Dataset/features.txt") ## features.txt will provide the variable names for the header.
activityLabels <- read.table("./UCI HAR Dataset/activity_labels.txt") ## activity_labels.txt will allow for the conversion of numbered labels to activity descriptions.
testdat <- read.table("./UCI HAR Dataset/test/X_test.txt") ## Reading in Data and Activity Labels for Test Group.
testact <- read.table("./UCI HAR Dataset/test/y_test.txt") 
traindat <- read.table("./UCI HAR Dataset/train/X_train.txt") ## Reading in Data and Activity Labels for Training Group
trainact <- read.table("./UCI HAR Dataset/train/y_train.txt")
testsubj <- read.table("./UCI HAR Dataset/test/subject_test.txt") ## Reading in Subject Labels for each group.
trainsubj <- read.table("./UCI HAR Dataset/train/subject_train.txt")
alldat <- rbind(testdat,traindat) ## Combine Testing and Training Data in one data.frame
names(alldat) <- features$V2 ## Add Variable Names to Combined Data Set.
meancol <- grep("*mean()*",names(alldat),) ## Extract columns for Mean Variables
stdcol <- grep("*std()*",names(alldat),) ## Extract columns for Standard Deviation Variables
meanstddat <- alldat[,c(meancol,stdcol)] ## Combine only mean and standard deviation columns for new data.frame.

allact <- rbind(testact,trainact) ## Create combined vector of test and training data.
library(dplyr)
allact <- full_join(allact,activityLabels) ## Assign Descriptions to each numbered activity label.
allact <- data.frame(allact$V2) ## Extract only Descriptions from joined activity label data.frame.
names(allact) <- "activity"
completedat1 <- cbind(allact,meanstddat)## Add activity descriptions column to Combined Data Set.

allsubj <- rbind(testsubj,trainsubj) ## Combine Subject Labels and add that column to Combined Data Set.
names(allsubj) <- "subject"
completedat1 <- cbind(allsubj,allact,meanstddat)

completedat1$activity <- gsub("_","",completedat1$activity) ## Clean up activity level strings
completedat1$activity <- factor(tolower(completedat1$activity))

names(completedat1) <- tolower(names(completedat1)) ## Clean up variable names
names(completedat1) <- gsub("-","", names(completedat1))
names(completedat1) <- gsub( "()", "", names(completedat1), fixed = TRUE)
names(completedat1) <- gsub( "bodybody", "body", names(completedat1))
names(completedat1) <- gsub("^f", "freq",names(completedat1))
names(completedat1) <- gsub("^t", "time",names(completedat1))
names(completedat1) <- gsub("acc", "accel", names(completedat1))

byactbysubj <- group_by(completedat1, activity, subject) ## Group Combined Data Set by Activity and Subject.
tidydat <- byactbysubj %>% summarise_each(funs(mean)) ## Produce new data set of means of all measurements by activity, by subject.
write.table(tidydat, file = "summarisedmeanandstdmeasurements.txt", row.name = FALSE)
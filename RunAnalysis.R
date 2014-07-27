setwd("./Desktop")
if(!file.exists("RunAnalysisData")) {
  dir.create("RunAnalysisData")
}
setwd("./RunAnalysisData")
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileURL, destfile="UCI_Files.zip", method="curl")
  unzip("UCI_Files.zip")
features <- read.table("UCI HAR Dataset/features.txt", header=FALSE, col.names=c("id", "measurement"))
  meandata <- features[c(1:3,41:43,81:83,121:123,161:163,201,214,227,240,253,
                         266:268,345:347,424:426,503,516,529,542),]
  stddata <- features[c(4:6,44:46,84:86,124:126,164:166,202,215,228,241,254,
                        269:271,348:350,427:429,504,517,530,543),]
    meanstd <- as.vector(rbind(meandata, stddata))
test_dat <- read.table("UCI HAR Dataset/test/X_test.txt", header=FALSE, col.names=features[,2])
train_dat <- read.table("UCI HAR Dataset/train/X_train.txt", header=FALSE, col.names=features[,2])
  merged_dat <- rbind(test_dat, train_dat)
  tidy <- merged_dat[meanstd[,"id"]]
testactivity_dat <- read.table("UCI HAR Dataset/test/y_test.txt", col.names="activity")
trainactivity_dat <- read.table("UCI HAR Dataset/train/y_train.txt", col.names="activity")
  activity_dat <- rbind(testactivity_dat, trainactivity_dat)
  activity_dat <- as.factor(activity_dat[,"activity"])
activity_labels <- data.frame(read.table("UCI HAR Dataset/activity_labels.txt"))
activity <- activity_labels$V2
  levels(activity_dat) <- activity
  activities <- data.frame(activity_dat)
testsubject_dat <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names="subject")
trainsubject_dat <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names="subject")
  subject_dat <- rbind(testsubject_dat, trainsubject_dat)
subject_activity <- cbind(subject_dat, activities)
  Final_Tidy <- cbind(subject_activity, tidy)
write.table(Final_Tidy, file="FinalTidy.txt")

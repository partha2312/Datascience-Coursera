#Constants to store data URL, zip and the folder
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "
zipFolder <- "getdata_dataset.zip"
folder <- "UCI HAR Dataset"
activityLabelsFile <- paste(folder,"activity_labels.txt", sep = "/")
activityFeaturesFile <- paste(folder, "features.txt", sep = "/")
trainingDataFolder <- paste(folder, "train", sep = "/")
testingDataFolder <- paste(folder, "test", sep = "/")

#Check if data folder exists. If not download the zip folder from URL.
#Unzip to get the actual folder. Delete the zip folder.
if(!file.exists(folder)){
  download.file(fileURL, zipFolder, method="curl")
  if(!file.exists(zipFolder)){
    print("Error Downloading Data.")
    quit("yes")
  }
  unzip(zipfile = filename)
  unlink(zipFileName)
}

if(!file.exists(trainingDataFolder) || !file.exists(testingDataFolder)){
  print("Error Downloading Data.")
  quit("yes")
}

#Read activity and feature table
dfActivity <- read.table(activityLabelsFile)
dfActivity[,2] <- as.character(dfActivity[,2])
dfFeatures <- read.table(activityFeaturesFile)
dfFeatures[,2] <- as.character(dfFeatures[,2])

#Extract the column names which has mean or std in them.
featureIdx <- grep(".*mean*.|.*std*.", dfFeatures[,2])
featureNames <- dfFeatures[featureIdx, 2]
featureNames <- gsub('[-()]', '', featureNames)
featureNames = gsub('mean', 'Mean', featureNames)
featureNames = gsub('std', 'Std', featureNames)

trainingData <- read.table(paste(trainingDataFolder, "X_train.txt", sep = "/"))[featureIdx]
trainActivitiesData <- read.table(paste(trainingDataFolder, "Y_train.txt", sep = "/"))
trainSubjectsData <- read.table(paste(trainingDataFolder, "subject_train.txt", sep="/"))
trainingDataComplete <- cbind(trainSubjectsData, trainActivitiesData, trainingData)

testingData <- read.table(paste(testingDataFolder, "X_test.txt", sep = "/"))[featureIdx]
testActivitiesData <- read.table(paste(testingDataFolder, "Y_test.txt", sep = "/"))
testSubjectsData <- read.table(paste(testingDataFolder, "subject_test.txt", sep = "/"))
testingDataComplete <- cbind(testSubjectsData, testActivitiesData, testingData)

data<-rbind(trainingDataComplete, testingDataComplete)
colnames(data) = c("Subject", "Activity", featureNames)
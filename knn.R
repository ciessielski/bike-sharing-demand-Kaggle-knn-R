rm(list=ls())
setwd("working/directory/path")

#Loading training file as well as test file
train <- read.csv("train.csv")
test <- read.csv("test.csv")

#install required libraries
library(class)
# install.packages("lubridate", dependencies = TRUE)
library(lubridate)

#make working copy
trainW <- train
testW <- test

#extract data from datetime
trainW$hour <- hour(ymd_hms(trainW$datetime))
trainW$weekday <- wday(ymd_hms(trainW$datetime))
testW$hour <- hour(ymd_hms(testW$datetime))
testW$weekday <- wday(ymd_hms(testW$datetime))

# create new columns for each hour
for (i in 1:24)
{
  testW[,paste0("is",i-1,"oclock")] <- 0
  trainW[,paste0("is",i-1,"oclock")] <- 0
}

weekdays <- c("Monday", "Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday")

#create new columns for each weekday
for (i in 1:length(weekdays))
{
  trainW[ ,paste0("is", weekdays[i])] = 0
  testW[ ,paste0("is", weekdays[i])] = 0
}

for (i in 1:nrow(testW))
{
  for (h in 1:24)
  {
    if (testW$hour[i] == h-1)
    {
      testW[i, paste0("is",h-1,"oclock")] <- 1
    }
  }
  
  for (d in 1:length(weekdays))
  {
    if (testW$weekday[i] == d)
    {
      testW[i, paste0("is", weekdays[d])] <- 1
    }
  }
}

for (i in 1:nrow(trainW))
{
  for (h in 1:24)
  {
    if (trainW$hour[i] == h-1)
    {
      trainW[i, paste0("is",h-1,"oclock")] <- 1
    }
  }

  for (d in 1:length(weekdays))
  {
    if(trainW$weekday[i] == d)
    {
      trainW[i, paste0("is", weekdays[d])] <- 1
    }
  }
}

#normalize dataframes
normalize <- function(x) {
     return ((x -min(x))/(max(x)-min(x))) }

testW_n <- as.data.frame(lapply(testW[,c(2:42)],normalize))
trainW_n <- as.data.frame(lapply(trainW[,c(2:9,13:45)],normalize))

#delete unwanted columns before knn
testW_n$temp <- NULL
trainW_n$temp <- NULL
testW_n$windspeed <- NULL
trainW_n$windspeed <- NULL
testW_n$weekday <- NULL
trainW_n$weekday <- NULL
testW_n$hour <- NULL
trainW_n$hour <- NULL
testW_n$month <- NULL
trainW_n$month <- NULL

#set target
trainW_target <- train[,12]

#predict count values for test data
M1 <- knn(train = trainW_n,test = testW_n, cl=trainW_target, k=4, l=2)
subM <- data.frame(test[,1],M1)
names(subM)[1] <- "datetime"
names(subM)[2] <- "count"
write.csv(subM,file="subKNN5",row.names=FALSE)


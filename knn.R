setwd("pathToDirection")

#Loading training file as well as test file
train <- read.csv("train.csv")
test <- read.csv("test.csv")

#install required libraries
library(class)
library(lubridate)

#make working copy
trainW <- train
testW <- test

#extract data from datetime
trainW$hour <- hour(ymd_hms(trainW$datetime))
trainW$weekday <- wday(ymd_hms(trainW$datetime))
testW$hour <- hour(ymd_hms(testW$datetime))
testW$weekday <- wday(ymd_hms(testW$datetime))

#create new columns for each hour in testW
testW$is0oclock <- 0
testW$is1oclock <- 0
testW$is2oclock <- 0
testW$is3oclock <- 0
testW$is4oclock <- 0
testW$is5oclock <- 0
testW$is6oclock <- 0
testW$is7oclock <- 0
testW$is8oclock <- 0
testW$is9oclock <- 0
testW$is10oclock <- 0
testW$is11oclock <- 0
testW$is12oclock <- 0
testW$is13oclock <- 0
testW$is14oclock <- 0
testW$is15oclock <- 0
testW$is16oclock <- 0
testW$is17oclock <- 0
testW$is18oclock <- 0
testW$is19oclock <- 0
testW$is20oclock <- 0
testW$is21oclock <- 0
testW$is22oclock <- 0
testW$is23oclock <- 0

#create new columns for each hour in trainW
trainW$is0oclock <- 0
trainW$is1oclock <- 0
trainW$is2oclock <- 0
trainW$is3oclock <- 0
trainW$is4oclock <- 0
trainW$is5oclock <- 0
trainW$is6oclock <- 0
trainW$is7oclock <- 0
trainW$is8oclock <- 0
trainW$is9oclock <- 0
trainW$is10oclock <- 0
trainW$is11oclock <- 0
trainW$is12oclock <- 0
trainW$is13oclock <- 0
trainW$is14oclock <- 0
trainW$is15oclock <- 0
trainW$is16oclock <- 0
trainW$is17oclock <- 0
trainW$is18oclock <- 0
trainW$is19oclock <- 0
trainW$is20oclock <- 0
trainW$is21oclock <- 0
trainW$is22oclock <- 0
trainW$is23oclock <- 0

#assign correct values to hours' columns in testW
for (i in 1:nrow(testW))
{
	if (testW$hour[i] == 0)
     {
         testW$is0oclock[i] <- 1
     }

     	if (testW$hour[i] == 1)
     {
         testW$is1oclock[i] <- 1
     }

     	if (testW$hour[i] == 2)
     {
         testW$is2oclock[i] <- 1
     }

     	if (testW$hour[i] == 3)
     {
         testW$is3oclock[i] <- 1
     }

     	if (testW$hour[i] == 4)
     {
         testW$is4oclock[i] <- 1
     }

     	if (testW$hour[i] == 5)
     {
         testW$is5oclock[i] <- 1
     }

     	if (testW$hour[i] == 6)
     {
         testW$is6oclock[i] <- 1
     }

     	if (testW$hour[i] == 7)
     {
         testW$is7oclock[i] <- 1
     }

     if (testW$hour[i] == 8)
     {
         testW$is8oclock[i] <- 1
     }

     if (testW$hour[i] == 9)
     {
         testW$is9oclock[i] <- 1
     }

     if (testW$hour[i] == 10)
     {
         testW$is10oclock[i] <- 1
     }

     if (testW$hour[i] == 11)
     {
         testW$is11oclock[i] <- 1
     }

     if (testW$hour[i] == 12)
     {
         testW$is12oclock[i] <- 1
     }

     if (testW$hour[i] == 13)
     {
         testW$is13oclock[i] <- 1
     }

     if (testW$hour[i] == 14)
     {
         testW$is14oclock[i] <- 1
     }

     if (testW$hour[i] == 15)
     {
         testW$is15oclock[i] <- 1
     }

     if (testW$hour[i] == 16)
     {
         testW$is16oclock[i] <- 1
     }

     if (testW$hour[i] == 17)
     {
         testW$is17oclock[i] <- 1
     }

     if (testW$hour[i] == 18)
     {
         testW$is18oclock[i] <- 1
     }

     if (testW$hour[i] == 19)
     {
         testW$is19oclock[i] <- 1
     }

     if (testW$hour[i] == 20)
     {
         testW$is20oclock[i] <- 1
     }

     if (testW$hour[i] == 21)
     {
         testW$is21oclock[i] <- 1
     }

     if (testW$hour[i] == 22)
     {
         testW$is22oclock[i] <- 1
     }

     if (testW$hour[i] == 23)
     {
         testW$is23oclock[i] <- 1
     }
  
}

#assign correct values to hours' columns in trainW
for (i in 1:nrow(trainW))
{
	if (trainW$hour[i] == 0)
     {
         trainW$is0oclock[i] <- 1
     }

     	if (trainW$hour[i] == 1)
     {
         trainW$is1oclock[i] <- 1
     }

     	if (trainW$hour[i] == 2)
     {
         trainW$is2oclock[i] <- 1
     }

     	if (trainW$hour[i] == 3)
     {
         trainW$is3oclock[i] <- 1
     }

     	if (trainW$hour[i] == 4)
     {
         trainW$is4oclock[i] <- 1
     }

     	if (trainW$hour[i] == 5)
     {
         trainW$is5oclock[i] <- 1
     }

     	if (trainW$hour[i] == 6)
     {
         trainW$is6oclock[i] <- 1
     }

     	if (trainW$hour[i] == 7)
     {
         trainW$is7oclock[i] <- 1
     }

     if (trainW$hour[i] == 8)
     {
         trainW$is8oclock[i] <- 1
     }

     if (trainW$hour[i] == 9)
     {
         trainW$is9oclock[i] <- 1
     }

     if (trainW$hour[i] == 10)
     {
         trainW$is10oclock[i] <- 1
     }

     if (trainW$hour[i] == 11)
     {
         trainW$is11oclock[i] <- 1
     }

     if (trainW$hour[i] == 12)
     {
         trainW$is12oclock[i] <- 1
     }

     if (trainW$hour[i] == 13)
     {
         trainW$is13oclock[i] <- 1
     }

     if (trainW$hour[i] == 14)
     {
         trainW$is14oclock[i] <- 1
     }

     if (trainW$hour[i] == 15)
     {
         trainW$is15oclock[i] <- 1
     }

     if (trainW$hour[i] == 16)
     {
         trainW$is16oclock[i] <- 1
     }

     if (trainW$hour[i] == 17)
     {
         trainW$is17oclock[i] <- 1
     }

     if (trainW$hour[i] == 18)
     {
         trainW$is18oclock[i] <- 1
     }

     if (trainW$hour[i] == 19)
     {
         trainW$is19oclock[i] <- 1
     }

     if (trainW$hour[i] == 20)
     {
         trainW$is20oclock[i] <- 1
     }

     if (trainW$hour[i] == 21)
     {
         trainW$is21oclock[i] <- 1
     }

     if (trainW$hour[i] == 22)
     {
         trainW$is22oclock[i] <- 1
     }

     if (trainW$hour[i] == 23)
     {
         trainW$is23oclock[i] <- 1
     }
  
}

#create new columns for each weekday in trainW
trainW$isSaturday <- 0
trainW$isFriday <- 0
trainW$isThursday <- 0
trainW$isWednesday <- 0
trainW$isTuesday <- 0
trainW$isMonday <- 0
trainW$isSunday <- 0

#assign correct values to weekdays' columns in trainW
for (i in 1:nrow(trainW))
{
    if (trainW$weekday[i] == 7)
     {
         trainW$isSaturday[i] <- 1
     }
    else if (trainW$weekday[i] == 6)
     {
         trainW$isFriday[i] <- 1
     }
    else if (trainW$weekday[i] == 5)
     {
         trainW$isThursday[i] <- 1
     }
     else if (trainW$weekday[i] == 4)
     {
         trainW$isWednesday[i] <- 1
     }
     else if (trainW$weekday[i] == 3)
     {
         trainW$isTuesday[i] <- 1
     }
     else if (trainW$weekday[i] == 2)
     {
         trainW$isMonday[i] <- 1
     }
     else if (trainW$weekday[i] == 1)
     {
         trainW$isSunday[i] <- 1
     }
}

#create new columns for each weekday in testW
testW$isSaturday <- 0
testW$isFriday <- 0
testW$isThursday <- 0
testW$isWednesday <- 0
testW$isTuesday <- 0
testW$isMonday <- 0
testW$isSunday <- 0

#assign correct values to weekdays' columns in testW
for (i in 1:nrow(testW))
{
    if (testW$weekday[i] == 7)
     {
         testW$isSaturday[i] <- 1
     }
    else if (testW$weekday[i] == 6)
     {
         testW$isFriday[i] <- 1
     }
    else if (testW$weekday[i] == 5)
     {
         testW$isThursday[i] <- 1
     }
     else if (testW$weekday[i] == 4)
     {
         testW$isWednesday[i] <- 1
     }
     else if (testW$weekday[i] == 3)
     {
         testW$isTuesday[i] <- 1
     }
     else if (testW$weekday[i] == 2)
     {
         testW$isMonday[i] <- 1
     }
     else if (testW$weekday[i] == 1)
     {
         testW$isSunday[i] <- 1
     }
}

#normalize dataframes
normalize <- function(x) {
     return ((x -min(x))/(max(x)-min(x))) }

testW_n <- as.data.frame(lapply(testW[,c(2:43)],normalize))
trainW_n <- as.data.frame(lapply(trainW[,c(2:9,13:46)],normalize))

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
M1 <- knn(train = trainW_n,test = testW_n, cl=train_target,k=10)
subM <- data.frame(test[,1],M1)
names(subM)[1] <- "datetime"
names(subM)[2] <- "count"
write.csv(subM,file="subKNN5",row.names=FALSE)


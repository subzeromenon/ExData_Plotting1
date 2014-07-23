---
title: "Readme"
author: "Vinu"
date: "22.07.2014"  
output: word_document
---
Introduction:

This is an R markdown on r_analysis.R as part of the course project of Getting and Cleaning data. The objective of this was to ensure our ability to collect and clean the data in a way we see fit. The data available was collected from accelerometers from Samsung Galaxy S smartphone. 

Objectives:

The objective of the analysis is to merge the training and test set into one big set, extract the mean and standard deviation measurements of frequency domain and time domain measurements for different subjects while doing different activities. Label the activities properly and name the variables as per the tidy data principles. Finally, create a wide/long tidy second set of data which gives the average measurement of variables for each subject while performing different activities, which is enclosed in the data frame tidy. 

The only additional library that was used in addition to base was plyr to reshape data.     

Loading the Data:

First concern with respect to loading the data is that the training set, training labels are in ".GCDdata/UCI HAR Dataset/train/" and similarly, the test sets and labels in "./GCDdata/UCI HAR Dataset/test/". Hence, it is important to retrieve all the necessary data frames first before performing the culling and cleaning of data. I am using the read.table() function. The working directory in this case is the folder "./Rstudio". To run analysis, you have to place it in the folder "./UCI HAR Dataset", make it the working directory and remove the prefix to it from all the read.table(). 

To run:
```{r}
x_train<-read.table("./UCI HAR Dataset/train/X_train.txt",colClasses = "numeric")
```

Manipulation of Data:

There are two manipulations done to the read in data, test and training sets are bound row wise, under the name
"train_test_data", and then column bound with rest of data like "subject(subject_test/train)", and "activity(y_test/train)" which likewise are row bound. 


```{r}
train_test_data <- rbind(x_test,x_train)
train_test_data1<-cbind(train_test_data1,activity,subject)
```

We are required to take out the mean and standard deviation of measurements specifically. Hence, we use pattern matching function grep()/grepl() to subset the columns which measure the same.  
Note: not meanFreq() just, mean() and std().

```{r}
train_test_data1<-train_test_data[,grepl("mean()|std()",colnames(train_test_data))]
```

Furthermore, using replacing techniques such as gsub(), column names can be made to comply with tidy data principle. For instance:

```{r}
colnames(train_test_data1)<-gsub("*-std\\()-*|*-std\\()","St.dev",colnames(train_test_data1))
```

Finally, we utilise ddply to retrieve the tidy data that we seek, on the basis of activity and subject, where SubjNo. is the volunteer number(of type factor) and Activity is the type of Activity(type factor) being performed.

```{r}
tidy<-(ddply(train_test_data1,.(SubjNo.,Activity),numcolwise(mean)))
```


Finally, the variables which are not in use are removed from the global environment to save memory.

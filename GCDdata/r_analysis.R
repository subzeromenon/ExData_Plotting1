#setwd("/media/vinu/8AE9C2BDE9C1215/Rstudio/GCDdata/UCI HAR Dataset/train")
x_train<-read.table("./GCDdata/UCI HAR Dataset/train/X_train.txt",colClasses = "numeric")
y_train<-read.table("./GCDdata/UCI HAR Dataset/train/y_train.txt",colClasses = "factor")
subject_train<-read.table("./GCDdata/UCI HAR Dataset/train/subject_train.txt",colClasses = "factor")

#setwd("/media/vinu/8ADE9C2BE9C1215/Rstudio/GCDdata/UCI HAR Dataset/test/")
x_test<-read.table("./GCDdata/UCI HAR Dataset/test/X_test.txt", colClasses = "numeric")
y_test<-read.table("./GCDdata/UCI HAR Dataset/test/y_test.txt",colClasses = "factor")
subject_test<-read.table("./GCDdata/UCI HAR Dataset/test/subject_test.txt",colClasses = "factor")

#setwd("/media/vinu/8ADE9C2BDE9C1215/Rstudio/GCDdata/UCI HAR Dataset/")
features<-read.table("./GCDdata/UCI HAR Dataset/features.txt",colClasses = "character")
features<-features$V2
activity_label<-read.table("./GCDdata/UCI HAR Dataset/activity_labels.txt",colClasses = "character")
label<-activity_label$V2

#setwd("/media/vinu/8ADE9C2BDE9C1215/Rstudio/")
#Training set is y_train.txt+y_test
#Step 1
subject<-rbind(subject_test,subject_train)
colnames(subject)<- "SubjNo."
subject$SubjNo.<-factor(subject$SubjNo.,levels = c(1:30))
#train_data<- cbind(subject_train,x_train,y_train)
#train_data <- cbind(x_train,y_train)
#test_data<-cbind(subject_test,x_test,y_test)
#test_data <- cbind(x_test,y_test)
train_test_data <- rbind(x_test,x_train)
colnames(train_test_data)<-c(features)
#Done merging the two sets


#Step 2
train_test_data1<-train_test_data[,grepl("mean()|std()",colnames(train_test_data))]
train_test_data1<-train_test_data1[,!grepl("*meanFreq*",colnames(train_test_data1))]

#Step 3
#setwd("./Rstudio/GCDdata/UCI HAR Dataset/train")
#y_train<-read.table("y_train.txt",colClasses = "factor")
#setwd("/media/vinu/8ADE9C2BDE9C1215/Rstudio/GCDdata/UCI HAR Dataset/test/")
#y_test<-read.table("y_test.txt",colClasses = "factor")
activity<-rbind(y_test,y_train)
#setwd("/media/vinu/8ADE9C2BDE9C1215/Rstudio/")
activity$V1<-factor(activity$V1,levels = levels(activity$V1),labels = label)
colnames(activity)<-"Activity"
train_test_data1<-cbind(train_test_data1,activity,subject)
rm(activity);rm(activity_label);rm(subject);rm(subject_test);rm(subject_train)
rm(train_test_data);rm(x_test);rm(x_train);rm(y_test);rm(y_train)
rm(features);rm(label)

#Step 4
colnames(train_test_data1)<-gsub("^t","TimeDomain",colnames(train_test_data1))
colnames(train_test_data1)<-gsub("^f","FreqDomain",colnames(train_test_data1))
colnames(train_test_data1)<-gsub("*BodyBody*","Body",colnames(train_test_data1))
colnames(train_test_data1)<-gsub("*-std\\()-*|*-std\\()","St.dev",colnames(train_test_data1))
colnames(train_test_data1)<-gsub("*-mean\\()-*|*-mean\\()","Mean",colnames(train_test_data1))
colnames(train_test_data1)<-gsub("Y$","Yaxis",colnames(train_test_data1))
colnames(train_test_data1)<-gsub("X$","Xaxis",colnames(train_test_data1))
colnames(train_test_data1)<-gsub("Z$","Zaxis",colnames(train_test_data1))
#Any easier way to solve this?


#Step 5\
tidy<-(ddply(train_test_data1,.(SubjNo.,Activity),numcolwise(mean)))
write.table(tidy,"./tidydata.txt",sep = "\t")

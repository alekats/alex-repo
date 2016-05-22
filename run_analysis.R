

data_test<-read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/X_test.txt") 
activities_test<-read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/y_test.txt")
subject_test<-read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/subject_test.txt")
  
data_train<-read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/X_train.txt") 
activities_train<-read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/y_train.txt")
subject_train<-read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/subject_train.txt")  

activities_train[grep("1",activities_train$V1),]<-"walking"
activities_train[grep("2",activities_train$V1),]<-"walking_upstairs"
activities_train[grep("3",activities_train$V1),]<-"walking_downstairs"
activities_train[grep("4",activities_train$V1),]<-"sitting"
activities_train[grep("5",activities_train$V1),]<-"standing"
activities_train[grep("6",activities_train$V1),]<-"laying"

activities_test[grep("1",activities_test$V1),]<-"walking"
activities_test[grep("2",activities_test$V1),]<-"walking_upstairs"
activities_test[grep("3",activities_test$V1),]<-"walking_downstairs"
activities_test[grep("4",activities_test$V1),]<-"sitting"
activities_test[grep("5",activities_test$V1),]<-"standing"
activities_test[grep("6",activities_test$V1),]<-"laying"

data_train[["activity"]]<-activities_train$V1
data_test[["activity"]]<-activities_test$V1
data_train[["subject"]]<-subject_train$V1
data_test[["subject"]]<-subject_test$V1

total_data<-merge(data_train,data_test,all=TRUE)


feat<-read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/features.txt")

data_comp<-total_data[,c(grep("mean()",feat$V2,fixed=TRUE),grep("std()",feat$V2,fixed=TRUE))]

names(data_comp)<-feat$V2[c(grep("mean()",feat$V2,fixed=TRUE),grep("std()",feat$V2,fixed=TRUE))]

data_comp$activity<-total_data$activity
data_comp$subject<-total_data$subject

data_mean=data_comp[1,]
check=c("walking","walking_upstairs","walking_downstairs","sitting","standing","laying")
cc=0
for (i in 1:max(data_comp$subject)){
  for (j in 1:6){
    cc=cc+1
    sub_vec<-data_comp$subject==i
    act_vec<-data_comp$activity==check[j]
    
    positions<-as.logical(sub_vec*act_vec)
    
    for (l in 1:(length(names(data_comp))-2)){
      
      data_mean[cc,l]<-mean(data_comp[[names(data_comp)[l]]][positions])
      
      
    }
    
    data_mean[cc,67]<-check[j]
    data_mean[cc,68]<-i
  }
  
}



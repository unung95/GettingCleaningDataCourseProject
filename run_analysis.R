###############################
## Course Project           ###
## Getting & Cleaning Data  ###
## Sept 10, 2014            ###
## unung95@yahoo.com        ###
###############################

maindir = 'UCI HAR Dataset'
mergecol <- function(directory) {

  list.files(directory,pattern='*.txt') -> filelist 
  paste(directory,'/',filelist,sep='') -> filenames
  do.call("cbind", lapply(filenames, read.table, header = FALSE)) -> res
  res
}

mergecol(paste(maindir,'/train',sep='')) -> dttrain
mergecol(paste(maindir,'/test',sep='')) -> dttest

rbind(dttrain,dttest) -> dtallfeatures

read.table(paste(maindir,'/activity_labels.txt',sep='')) -> activitylabel
read.table(paste(maindir,'/features.txt',sep='')) -> featuresname
as.character(featuresname$V2) -> label

gsub("[-|(|)|,]","",label) -> labelx
c('Subject',labelx,'Activity') -> namesallfeatures
namesallfeatures -> names(dtallfeatures)

grep(".*mean.*|.*Mean.*",namesallfeatures) -> labelmean
grep(".*std.*|.*Std.*",namesallfeatures) -> labelstd

sort(c(labelmean,labelstd)) -> numfeatures

dtallfeatures[,numfeatures] -> dtmeanstd

as.factor(dtallfeatures[,1]) -> subjectf
as.factor(dtallfeatures[,563]) -> activityf

levels(activityf) <- as.character(activitylabel$V2)

data.frame(dtmeanstd,subjectf,activityf) -> dtmeanstdsubact

aggregate(dtmeanstdsubact,by=list(subject=subjectf,activity=activityf),mean) -> dtres

dtres[,-c(89,90)] -> res

write.table(res,paste(maindir,'/independenttidy.txt',sep=''),sep="\t",row.names=FALSE)



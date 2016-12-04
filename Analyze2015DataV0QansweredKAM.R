# Opens up the raw files
# Do NOT use the Survey2015Raw, i.e. does not read well into R
# Use instead the Survey2015RawHead (not cleaned) or the ZipDist2015Data (cleaned)
#


#--- Clear workspace
rm(list=ls())

#========================================================#
#---------------------USER INPUT-------------------------#
#========================================================#

#---Assign Path & Working Directory
dir <- "C:/Users/Owner/Google Drive/Peloton/Research_BikeTranspo/2015 Data Analysis"

#---Specify the data set
file <- "Survey2015RawHead.csv"

#---Specify name of output file
#output <- "Summary2015Data.csv"


#========================================================#
#------------------END USER INPUT------------------------#
#========================================================#

setwd(dir)

# read file
mydata <- read.csv(file, header=TRUE)

colnames(mydata)


constraint <- mydata$I.live.close.to.campus != "" | 
              mydata$I.do.not.own.a.car != "" |
              mydata$I.am.an.avid.bicyclist != "" |
              mydata$Concern.for.the.environment != "" |
              mydata$A.friend.someone.introduced.me.to.bicycling.and.I.liked.it != ""
              
focus <- mydata[constraint,]



# write file
output <- "focusbike.txt"
write.table(focus,file=output,col.names=TRUE,row.names=FALSE,sep='\t')
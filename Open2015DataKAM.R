# Opens up the raw files
#
#
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
mydata <- read.csv(file, header=TRUE, sep=',')





# write file
#write.table(myfinaldata,file=output,col.names=TRUE,row.names=FALSE,sep='\t')
# Opens up the raw files
# Do NOT use the Survey2015Raw, i.e. does not read well into R
# Use instead the Survey2015RawHead (not cleaned) or the ZipDist2015Data (cleaned)
#
# This script cuts the data set into those that have the target questions answered
#


#--- Clear workspace
rm(list=ls())

#========================================================#
#---------------------USER INPUT-------------------------#
#========================================================#

#---Assign Path & Working Directory
dir <- "C:/Users/Owner/Google Drive/Peloton/Research_BikeTranspo/2015 Data Analysis"

#---Specify the data set
file <- "ZipDist2015Data.txt"

#---Specify name of output file
#output <- "Summary2015Data.csv"


#========================================================#
#------------------END USER INPUT------------------------#
#========================================================#

setwd(dir)

# read file
mydata <- read.table(file, header=TRUE, sep="\t")

colnames(mydata)

# this is where the number of the column of interest starts
constraint <- mydata[,170] != ""

# this is where the columns of interest continue to
targetcols <- c(171:187)

# this compiles the logic of the rows to keep,
# i.e. ones that answer the questions on the columns defined in 'constraint' and 'targetcols'
for (i in targetcols){
  constraint <- constraint | mydata[,i] != ""
}

# this cuts the dataset to only the ones that answer the target questions
focus <- mydata[constraint,]

nrow(mydata)
nrow(focus)


# write file
output <- "focusincentivesanswered.txt"
write.table(focus,file=output,col.names=TRUE,row.names=FALSE,sep='\t')
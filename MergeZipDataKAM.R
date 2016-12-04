# Merges the files that were cleaned up in the "Clean2015DataV..." files
#i.e. Gives a distance away from campus for each of the respondents
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
zipsfile <- "ZipDistMason.txt"
rawdatafile <- "Data2015CleanZips.txt"

#---Specify name of output file
output <- "ZipDist2015Data.txt"


#========================================================#
#------------------END USER INPUT------------------------#
#========================================================#

setwd(dir)

# read file
zips <- read.table(zipsfile, header=TRUE, sep=",")
rawdata <- read.table(rawdatafile, header=TRUE, sep='\t')

joined <- merge(y = zips, x = rawdata, by.y = "ZIP_CODE", by.x = "Open.Ended.Response", all.x = FALSE)

colnames(joined)

myfinaldata <- joined[, c(1:256,268)]

colnames(myfinaldata)

# write file
write.table(myfinaldata,file=output,col.names=TRUE,row.names=FALSE,sep='\t')
## this script
##      plots the histogram of global active power dataset from household power consumption data
## dependency:
##      data_loader.R (in same path as this script)
## source of data:
##      https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
setwd("./")
## find current script directory
cur_dir <- dirname(sys.frame(1)$ofile)
message('script is running from ',cur_dir)
loader_script <- paste0(cur_dir,'/data_loader.R')
message('sourcing data loader script ', loader_script)
## load required data for plotting
source(paste0(cur_dir,'/data_loader.R'))
## plot histogram and store as .png file
png(file="plot1.png")
with(fd, hist(as.numeric(as.vector(Global_active_power)), col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)") )
dev.off()
rm(fd)
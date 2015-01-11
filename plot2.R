## this script
##      plots the graph between time (x-axis) and global active power (y-axis) from household power consumption data
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
pd <- data.frame(
    datetime=strptime(paste(fd[['Date']], fd[['Time']]), format="%d/%m/%Y %H:%M:%S"), 
    Global_active_power=as.numeric(as.vector(fd[['Global_active_power']]))
)
rm(fd)
## plot the graph and store as .png file
png(file="plot2.png")
with(pd,{
    plot(datetime, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
})
dev.off()
rm(pd)
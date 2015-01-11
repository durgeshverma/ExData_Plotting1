## this script
##      plots the graph between time (x-axis) and sub meterings (y-axis) from household power consumption data
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
    Sub_metering_1=as.numeric(as.vector(fd[['Sub_metering_1']])), 
    Sub_metering_2=as.numeric(as.vector(fd[['Sub_metering_2']])), 
    Sub_metering_3=as.numeric(as.vector(fd[['Sub_metering_3']]))
)
rm(fd)
## plot the graph and store as .png file
png(file="plot3.png")
with(pd,{
    plot(datetime, Sub_metering_1, xlab = "", ylab="Energy sub metering", type="n")
    lines(datetime, Sub_metering_1, col="black")
    lines(datetime, Sub_metering_2, col="red")
    lines(datetime, Sub_metering_3, col="blue")
    legend("topright", lty=1, col=c("black","red","blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), border="")
})
dev.off()
rm(pd)
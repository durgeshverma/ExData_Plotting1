## this script
##      plots 4 graphs (in 2 x 2 grid) using household power consumption data.
##      The graphs are between time (x-axis) and 
##          global active power (y-axis)
##          voltage (y-axis)
##          sub meterings (y-axis)
##          global reactive power (y-axis)
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
    Global_active_power=as.numeric(as.vector(fd[['Global_active_power']])),
    Global_reactive_power=as.numeric(as.vector(fd[['Global_reactive_power']])),
    Voltage=as.numeric(as.vector(fd[['Voltage']])),
    Sub_metering_1=as.numeric(as.vector(fd[['Sub_metering_1']])), 
    Sub_metering_2=as.numeric(as.vector(fd[['Sub_metering_2']])), 
    Sub_metering_3=as.numeric(as.vector(fd[['Sub_metering_3']]))
)
rm(fd)
## plot the graph and store as .png file
png(file="plot4.png")
par(mfrow=c(2,2))
with(pd,{
    plot(datetime, Global_active_power, type="l", xlab="", ylab="Global Active Power") ## row 1, col 1
    plot(datetime, Voltage, type="l")  ## row 1, col 2
    plot(datetime, Sub_metering_1, xlab = "", ylab="Energy sub metering", type="n") ## row 2, col 1
    lines(datetime, Sub_metering_1, col="black")
    lines(datetime, Sub_metering_2, col="red")
    lines(datetime, Sub_metering_3, col="blue")
    legend("topright", lty=1, col=c("black","red","blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), border="")
    plot(datetime, Global_reactive_power, type="l", ylab="Global Reactive Power") ## row 2, col 2
})
dev.off()
rm(pd)
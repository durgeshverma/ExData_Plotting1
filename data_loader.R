## this script
##      load household power consumption data
##      support other ploting script
## dependency:
##      dplyr package
## source of data:
##      https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
filename <- 'household_power_consumption.zip'
if (!file.exists(filename)) {
    message("downloading file...")
    download.file('https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip', filename, method='curl')
    unzip(filename, exdir="./")
}
data = read.table("./household_power_consumption.txt", sep=";", header=TRUE)
start <- strptime('01/02/2007 00:00:00', format="%d/%m/%Y %H:%M:%S")
end <- strptime('02/02/2007 23:59:59', format="%d/%m/%Y %H:%M:%S")
library(dplyr)
## fetch data between start of Feb 1, 2007 and end of Feb 2, 2007
fd <- filter(data, strptime(paste(Date, Time), format="%d/%m/%Y %H:%M:%S")>=start, strptime(paste(Date, Time), format="%d/%m/%Y %H:%M:%S")<=end)
## clean up memory
rm(data,start,end,filename)
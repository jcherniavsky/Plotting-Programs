setwd("/Users/johncherniavsky/Desktop/RProgramming/Data Explore")
## I am using the Data.Table package for increased speed
install.packages("data.table")
library(data.table)
## Read in Data
dt <- fread("household_power_consumption.txt",na.strings ="?")
t1 <- as.Date("2007-02-01")
t2 <- as.Date("2007-02-02")
## Subset to the dates February 1, 2007 to Feberuary 2, 2007
st <- dt[(as.Date(Date,"%d/%m/%Y") == t1 | as.Date(Date,"%d/%m/%Y") == t2),]
## Set the time vector as a Posix Date and Time structure
time <- strptime(paste(st[,Date],st[,Time]),"%d / %m / %Y %H : %M : %S")
## Set Submetering vectors for plotting
sub1 <- st[,Sub_metering_1]
sub2 <- st[,Sub_metering_2]
sub3 <- st[,Sub_metering_3]
## Open Device for PNG  plotting
png(filename = "plot3.png", width = 480, height = 480)
## Setting up the overlay plots for the sub metering
plot(time,sub1,type="n",ylab ="Energy sub metering") 
lines(time,sub1)
lines(time,sub2,col = "red")
lines(time,sub3, col = "green")
## Legend incorporation
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty = c(1,1,1), lwd=c(2.5,2.5,2.5), col = c("black","red","green") )
dev.off()
## Done!

 
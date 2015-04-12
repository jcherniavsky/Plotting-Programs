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
## Set Global_active_power vector for plotting
y <- as.numeric(st[,Global_active_power])
## Open Device for PNG  plotting
png(filename = "plot2.png", width = 480, height = 480)
plot(time,y,type="l", ylab = "Global Active Power (kilowatts")
dev.off()
## Done!

 
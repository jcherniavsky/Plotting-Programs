setwd("/Users/johncherniavsky/Desktop/RProgramming/Data Explore")
install.packages("data.table")
library(data.table)
## Read in Data
dt <- fread("household_power_consumption.txt",na.strings ="?")
## Subset dates from 2007-02-01 to 2007-02-02
t1 <- as.Date("2007-02-01")
t2 <- as.Date("2007-02-02")
st <- dt[(as.Date(Date,"%d/%m/%Y") == t1 | as.Date(Date,"%d/%m/%Y") == t2),]
y <- as.numeric(st[,Global_active_power])
png(filename = "plot1.png", width = 480, height = 480)
hist(y,col="red",main = "Global Active Power",xlab="Global Active Power (kilowatts")
dev.off()
 


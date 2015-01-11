library(plyr)
setAs("character","myDate", function(from) as.Date(from, format="%d/%m/%Y"))
df <- read.table("household.txt", header=TRUE, sep=";", na.strings = 'NULL', 
                colClasses=c("myDate","character","character","character","character","character","character","character","character"))
png(filename="plot1.png", width=480, height=480)
with(subset(df, Date == "2007-02-01" | Date == "2007-02-02"), 
     hist(as.numeric(Global_active_power), main="Global Active Power", 
         xlab="Global Active Power (kilowatts)", 
         ylab="Frequency",
         breaks=12,
         col="Red"))
dev.off()
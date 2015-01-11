library(plyr)
setAs("character","myDate", function(from) as.Date(from, format="%d/%m/%Y"))
df <- read.table("household.txt", header=TRUE, sep=";", na.strings = 'NULL', 
     colClasses=c("myDate","character","character","character","character","character","character","character","character"))
print(nrow(df))
str(df)
print(nrow(subset(df, Date == "2007-02-01" | Date == "2007-02-02")))
png(filename="plot1.png", width=480, height=480)
with(subset(df, Date == "2007-02-01" | Date == "2007-02-02"), 
     hist(counts, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", 
     ylab="Frequency",
     breaks=12,
     col="Red"))
dev.off()
# Before running the following code, save the "Electric Power Consumption" database
# to your working directory

# Import and subset dataset
hpc <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
hpc$Date <- as.Date(hpc$Date, format = "%d/%m/%Y")
data <- hpc[hpc$Date >= "2007-02-01" & hpc$Date <= "2007-02-02",]
data$datetime <- strptime(paste(data$Date, data$Time), format = "%Y-%m-%d %H:%M:%S")
   
# Create histogram
hist(data$Global_active_power, col = "red", 
     main = "Global Active Power", 
     xlab = "Global Active Power (killowatts)")

# Copy histogram to .png file with 480x480 pixels
dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()
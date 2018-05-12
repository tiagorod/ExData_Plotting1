# Before running the following code, save the "Electric Power Consumption" database
# to your working directory

# Import and subset dataset
hpc <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
hpc$Date <- as.Date(hpc$Date, format = "%d/%m/%Y")
data <- hpc[hpc$Date >= "2007-02-01" & hpc$Date <= "2007-02-02",]
data$datetime <- strptime(paste(data$Date, data$Time), format = "%Y-%m-%d %H:%M:%S")

# Create the line plots
with(data, plot(datetime, 
                Sub_metering_1, 
                col = "black", # Black is the default; specified it here for clarity
                type = "l", 
                xlab = "", 
                ylab = "Energy sub meetering"))
with(data, lines(datetime, 
                 Sub_metering_2, 
                 col = "red"))
with(data, lines(datetime, 
                 Sub_metering_3, 
                 col = "blue"))
legend("topright", 
       lty = 1,
       col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Copy plot to .png file with 480x480 pixels
dev.copy(png, file = "plot3.png", width = 480, height = 480)
dev.off()

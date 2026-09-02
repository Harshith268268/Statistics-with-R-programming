# Scenario: IoT CSV
# Task: Read daily CSV files, combine them, remove missing values and detect anomalies

# Step 1: Create Sample IoT Data

day1 <- data.frame(
  Device_ID = c(101,102,103),
  Temperature = c(28,30,29)
)

day2 <- data.frame(
  Device_ID = c(101,102,103),
  Temperature = c(27,NA,31)
)

day3 <- data.frame(
  Device_ID = c(101,102,103),
  Temperature = c(29,32,55)   # 55 is an anomaly
)

# Step 2: Save as CSV Files

write.csv(day1, "day1.csv", row.names = FALSE)
write.csv(day2, "day2.csv", row.names = FALSE)
write.csv(day3, "day3.csv", row.names = FALSE)

# Step 3: Read Only These CSV Files

files <- c("day1.csv", "day2.csv", "day3.csv")

data_list <- lapply(files, read.csv)

# Step 4: Combine All Data

iot_data <- do.call(rbind, data_list)

cat("Combined IoT Data\n")
print(iot_data)

# Step 5: Remove Missing Values

iot_data <- na.omit(iot_data)

cat("\nAfter Removing Missing Values\n")
print(iot_data)

# Step 6: Detect Anomalies (Temperature > 40)

anomalies <- subset(iot_data, Temperature > 40)

cat("\nAnomalies Detected\n")
print(anomalies)
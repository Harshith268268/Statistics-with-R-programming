# Smart Manufacturing - Sensor Data Analysis

# Step 1: Create Sensor Data Frame
sensor_data <- data.frame(
  Machine_ID = c("M1","M1","M2","M2","M3","M3","M4","M4","M5","M5"),
  Batch_ID = c("B101","B102","B103","B104","B105","B106","B107","B108","B109","B110"),
  Temperature = c(75,82,78,85,80,90,76,88,79,92),
  Defective = c("No","Yes","No","Yes","No","Yes","No","Yes","No","Yes")
)

# Step 2: Create Maintenance Log Data Frame
maintenance_log <- data.frame(
  Machine_ID = c("M1","M2","M3","M4","M5"),
  Last_Service = c("2026-01-10","2026-01-15","2026-01-20","2026-01-18","2026-01-25"),
  Technician = c("John","David","Alice","Mark","James")
)

# Display Sensor Data
cat("Sensor Data\n")
print(sensor_data)

# Display Maintenance Log
cat("\nMaintenance Log\n")
print(maintenance_log)

# Step 3: Merge Data Frames
merged_data <- merge(sensor_data, maintenance_log, by = "Machine_ID")

cat("\nMerged Data\n")
print(merged_data)

# Step 4: Filter Defective Batches
defective_batches <- subset(merged_data, Defective == "Yes")

cat("\nDefective Batches\n")
print(defective_batches)

# Step 5: Count Defective Batches for Each Machine
defect_count <- aggregate(Defective ~ Machine_ID,
                          data = defective_batches,
                          FUN = length)

colnames(defect_count)[2] <- "Defect_Count"

cat("\nDefect Count by Machine\n")
print(defect_count)

# Step 6: Identify Machine with Highest Defect Rate
highest_defect <- defect_count[which.max(defect_count$Defect_Count), ]

cat("\nMachine with Highest Defect Rate\n")
print(highest_defect)
# Scenario: Smart City
# Task: Export analyzed pollution report for management

# Step 1: Create Pollution Data
pollution <- data.frame(
  Area = c("Zone A", "Zone B", "Zone C", "Zone D", "Zone E"),
  PM2.5 = c(45, 80, 55, 95, 60),
  AQI = c(90, 180, 120, 220, 140)
)

cat("Original Pollution Data\n")
print(pollution)

# Step 2: Analyze Pollution Levels
pollution$Status <- ifelse(pollution$AQI > 150,
                           "High Pollution",
                           "Normal")

cat("\nAnalyzed Pollution Data\n")
print(pollution)

# Step 3: Display Summary
cat("\nSummary of Pollution Data\n")
summary(pollution)

# Step 4: Export Final Report to CSV
write.csv(pollution,
          "pollution_report.csv",
          row.names = FALSE)

cat("\nFinal pollution report exported as 'pollution_report.csv'\n")

# Step 5: Verify the Report
report <- read.csv("pollution_report.csv")

cat("\nExported Report\n")
print(report)
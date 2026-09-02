# Hospital Scenario - Merge Patient Admissions and Lab Data

# Step 1: Create Patient Admissions Data Frame
admissions <- data.frame(
  Patient_ID = c(101, 102, 103, 104, 105),
  Patient_Name = c("Arun", "Priya", "Rahul", "Sneha", "Kiran"),
  Admission_Date = as.Date(c("2026-07-01", "2026-07-02",
                             "2026-07-03", "2026-07-04",
                             "2026-07-05"))
)

# Step 2: Create Lab Data Frame
lab_data <- data.frame(
  Patient_ID = c(101, 102, 104, 105),
  Diagnosis_Date = as.Date(c("2026-07-02", "2026-07-06",
                             "2026-07-05", "2026-07-10"))
)

# Display Admissions Data
cat("Admissions Data\n")
print(admissions)

# Display Lab Data
cat("\nLab Data\n")
print(lab_data)

# Step 3: Merge Data Frames
hospital_data <- merge(admissions, lab_data,
                       by = "Patient_ID",
                       all.x = TRUE)

cat("\nMerged Data\n")
print(hospital_data)

# Step 4: Handle Missing Values (NA)
hospital_data$Diagnosis_Date[is.na(hospital_data$Diagnosis_Date)] <- Sys.Date()

# Step 5: Calculate Diagnosis Delay
hospital_data$Delay_Days <-
  as.numeric(hospital_data$Diagnosis_Date -
               hospital_data$Admission_Date)

cat("\nDiagnosis Delays\n")
print(hospital_data)

# Step 6: Find Delayed Diagnoses (Delay > 3 days)
delayed_cases <- subset(hospital_data, Delay_Days > 3)

cat("\nDelayed Diagnosis Cases\n")
print(delayed_cases)

# Step 7: Summarize Average Delay
average_delay <- aggregate(Delay_Days ~ Patient_ID,
                           data = hospital_data,
                           FUN = mean)

cat("\nDelay Summary\n")
print(average_delay)
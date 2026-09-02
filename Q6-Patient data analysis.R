patient <- data.frame(
  ID = c(101, 102, 103, 104, 105),
  Age = c(45, 67, 72, 58, 65),
  Gender = c("Male", "Female", "Male", "Female", "Male"),
  TreatmentCost = c(25000, 40000, 35000, 28000, 45000)
)

cat("Patient Details:\n")
print(patient)

avgCost <- mean(patient$TreatmentCost)
cat("\nAverage Treatment Cost:", avgCost, "\n")

cat("\nPatients Above 60 Years of Age:\n")
print(patient[patient$Age > 60, ])

cat("\nStatistical Summary:\n")
print(summary(patient))
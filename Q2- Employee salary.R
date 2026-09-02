emp <- data.frame(
  ID = c(101, 102, 103, 104, 105),
  Name = c("Arun", "Meena", "Kiran", "Priya", "Rahul"),
  Basic = c(30000, 45000, 38000, 50000, 42000),
  Allowance = c(8000, 12000, 9000, 15000, 10000)
)

emp$GrossSalary <- emp$Basic + emp$Allowance

cat("Employee Details:\n")
print(emp)

cat("\nEmployees Earning Above ₹50000:\n")
print(emp[emp$GrossSalary > 50000, ])

highest <- emp[which.max(emp$GrossSalary), ]

cat("\nEmployee with Highest Salary:\n")
print(highest)

cat("\nSummary Report:\n")
cat("Total Employees:", nrow(emp), "\n")
cat("Average Salary:", mean(emp$GrossSalary), "\n")
cat("Highest Salary:", max(emp$GrossSalary), "\n")
cat("Lowest Salary:", min(emp$GrossSalary), "\n")
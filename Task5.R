# Scenario: University
# Task: Evaluate Student Performance by Merging Attendance and Marks

# Step 1: Create Attendance Data Frame
attendance <- data.frame(
  Student_ID = c(101,102,103,104,105),
  Name = c("Arun","Priya","Rahul","Sneha","Kiran"),
  Attendance = c(90,85,95,80,88)
)

# Step 2: Create Marks Data Frame
marks <- data.frame(
  Student_ID = c(101,102,103,104,105),
  Marks = c(82,75,91,68,85)
)

cat("Attendance Data\n")
print(attendance)

cat("\nMarks Data\n")
print(marks)

# Step 3: Merge Attendance and Marks
student_data <- merge(attendance, marks, by = "Student_ID")

cat("\nMerged Student Data\n")
print(student_data)

# Step 4: Compute Weighted Score
# Weight: Attendance = 30%, Marks = 70%
student_data$Weighted_Score <-
  (student_data$Attendance * 0.30) +
  (student_data$Marks * 0.70)

cat("\nStudent Data with Weighted Score\n")
print(student_data)

# Step 5: Rank Students
student_data <- student_data[order(-student_data$Weighted_Score), ]
student_data$Rank <- 1:nrow(student_data)

cat("\nStudent Ranking\n")
print(student_data)

# Step 6: Display Top Performer
cat("\nTop Performing Student\n")
print(student_data[1, ])
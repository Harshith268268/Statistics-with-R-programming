marks <- matrix(c(
  85, 78, 90,
  76, 88, 80,
  92, 81, 85,
  65, 70, 72,
  88, 90, 91,
  75, 68, 70,
  95, 94, 96,
  82, 79, 84,
  70, 72, 68,
  89, 85, 87
), nrow = 10, byrow = TRUE)

colnames(marks) <- c("Mathematics", "Physics", "Chemistry")
rownames(marks) <- paste("Student", 1:10)

print("Marks Matrix:")
print(marks)

avg <- colMeans(marks)
cat("\nSubject-wise Averages:\n")
print(avg)

cat("\nHighest Scorer in Each Subject:\n")
for(i in 1:ncol(marks)) {
  cat(colnames(marks)[i], ":", rownames(marks)[which.max(marks[, i])], "-", max(marks[, i]), "\n")
}

cat("\nLowest Scorer in Each Subject:\n")
for(i in 1:ncol(marks)) {
  cat(colnames(marks)[i], ":", rownames(marks)[which.min(marks[, i])], "-", min(marks[, i]), "\n")
}

overall_avg <- mean(marks)
cat("\nOverall Average:", overall_avg, "\n")

student_avg <- rowMeans(marks)

cat("\nStudents Scoring Above Overall Average:\n")
print(rownames(marks)[student_avg > overall_avg])
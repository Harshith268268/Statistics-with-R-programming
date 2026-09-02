student <- function(id, name, marks) {
  structure(list(id = id, name = name, marks = marks), class = "Student")
}

total <- function(x) {
  sum(x$marks)
}

average <- function(x) {
  mean(x$marks)
}

grade <- function(x) {
  a <- average(x)
  if (a >= 90)
    "A"
  else if (a >= 75)
    "B"
  else if (a >= 60)
    "C"
  else if (a >= 50)
    "D"
  else
    "F"
}

result <- function(x) {
  list(
    Total = total(x),
    Average = average(x),
    Grade = grade(x)
  )
}

print.Student <- function(x) {
  cat("ID:", x$id, "\n")
  cat("Name:", x$name, "\n")
  cat("Marks:", x$marks, "\n")
  
  r <- result(x)
  
  cat("Total:", r$Total, "\n")
  cat("Average:", r$Average, "\n")
  cat("Grade:", r$Grade, "\n")
}

marks <- c(88, 92, 81, 75, 90)

s1 <- student(101, "Anu", marks)

print(s1)

highest <- max(s1$marks)
lowest <- min(s1$marks)

cat("Highest:", highest, "\n")
cat("Lowest:", lowest, "\n")

subjects <- c("R", "DS", "AI", "ML", "DBMS")

df <- data.frame(subjects, marks)
print(df)

cat("Passed:", all(marks >= 50), "\n")
cat("Rank Score:", average(s1), "\n")
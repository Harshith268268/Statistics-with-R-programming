StudentRC <- setRefClass(
  "StudentRC",
  fields = list(
    id = "numeric",
    name = "character",
    marks = "numeric"
  ),
  methods = list(
    total = function() sum(marks),
    average = function() mean(marks),
    grade = function() {
      a <- average()
      if (a >= 90) "A"
      else if (a >= 75) "B"
      else if (a >= 60) "C"
      else "F"
    },
    display = function() {
      cat("ID:", id, "\n")
      cat("Name:", name, "\n")
      cat("Marks:", marks, "\n")
      cat("Total:", total(), "\n")
      cat("Average:", average(), "\n")
      cat("Grade:", grade(), "\n")
    }
  )
)

obj <- StudentRC$new(
  id = 11,
  name = "Priya",
  marks = c(91, 82, 77, 88, 95)
)

obj$display()
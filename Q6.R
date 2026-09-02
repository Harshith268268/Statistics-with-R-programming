setClass(
  "Student",
  slots = list(
    id = "numeric",
    name = "character",
    marks = "numeric"
  )
)

setGeneric(
  "report",
  function(object) standardGeneric("report")
)

setMethod(
  "report",
  "Student",
  function(object) {
    
    t <- sum(object@marks)
    a <- mean(object@marks)
    
    g <- if (a >= 90)
      "A"
    else if (a >= 75)
      "B"
    else if (a >= 60)
      "C"
    else
      "F"
    
    cat("ID:", object@id, "\n")
    cat("Name:", object@name, "\n")
    cat("Marks:", object@marks, "\n")
    cat("Total:", t, "\n")
    cat("Average:", a, "\n")
    cat("Grade:", g, "\n")
    cat("Highest:", max(object@marks), "\n")
    cat("Lowest:", min(object@marks), "\n")
  }
)

m <- c(85, 78, 92, 88, 80)

s <- new(
  "Student",
  id = 1,
  name = "Kiran",
  marks = m
)

report(s)

df <- data.frame(
  Sub = c("R", "AI", "ML", "DBMS", "OS"),
  Marks = m
)

print(df)

cat("Pass:", all(m >= 50), "\n")
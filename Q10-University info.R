setClass(
  "Student",
  slots = list(
    rollNo = "numeric",
    name = "character",
    cgpa = "numeric"
  )
)

University <- setRefClass(
  "University",
  fields = list(
    students = "list"
  ),
  methods = list(
    
    addStudent = function(student) {
      students <<- c(students, list(student))
    },
    
    modifyCGPA = function(roll, newCGPA) {
      for (i in seq_along(students)) {
        if (students[[i]]@rollNo == roll) {
          students[[i]]@cgpa <- newCGPA
        }
      }
    },
    
    displayStudents = function() {
      for (s in students) {
        cat("Roll No:", s@rollNo, "\n")
        cat("Name:", s@name, "\n")
        cat("CGPA:", s@cgpa, "\n\n")
      }
    },
    
    findTopStudents = function() {
      cat("Students with CGPA > 8.0\n")
      for (s in students) {
        if (s@cgpa > 8.0) {
          cat(s@rollNo, s@name, s@cgpa, "\n")
        }
      }
    }
  )
)

s1 <- new("Student", rollNo = 101, name = "Arun", cgpa = 8.5)
s2 <- new("Student", rollNo = 102, name = "Meena", cgpa = 7.8)
s3 <- new("Student", rollNo = 103, name = "Kiran", cgpa = 9.1)

u <- University$new(students = list())

u$addStudent(s1)
u$addStudent(s2)
u$addStudent(s3)

u$modifyCGPA(102, 8.3)

cat("Student Details:\n")
u$displayStudents()

u$findTopStudents()
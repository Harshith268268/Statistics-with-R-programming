# Create sample student dataset
student_df <- data.frame(
  Student_ID = c(101,102,103,104,102),
  Name = c("Arun","Bala","Chitra","David","Bala"),
  Department = c("CSE","ECE","CSE","MECH","ECE"),
  Year = c(3,2,3,4,2),
  Marks = c(85,90,88,75,90)
)

# Detect duplicate records
duplicate_rows <- duplicated(student_df)

# Display duplicate entries
duplicates <- student_df[duplicate_rows, ]

print(duplicates)

# Count total duplicates
duplicate_count <- sum(duplicate_rows)

cat("Number of duplicate records:", duplicate_count)
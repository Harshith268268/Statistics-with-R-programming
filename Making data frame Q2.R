# Numeric column handling
student_df$Marks[is.na(student_df$Marks)] <-
  mean(student_df$Marks, na.rm = TRUE)

student_df$Attendance[is.na(student_df$Attendance)] <-
  median(student_df$Attendance, na.rm = TRUE)


# Categorical column handling
student_df$Grade[is.na(student_df$Grade)] <-
  names(sort(table(student_df$Grade),
             decreasing = TRUE))[1]


print(student_df)
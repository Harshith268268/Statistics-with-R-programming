# Error Propagation Analysis in Data Frame Transformation Workflow

# Step 1: Create Initial Data Frame

df <- data.frame(
  ID = c(1,2,3,4,5),
  Age = c("20","25","30","35","40"),      # Incorrect data type
  Marks = c(85,90,NA,75,95),              # Missing value
  Department = c("CSE","ECE","CSE","MECH","CSE"),
  stringsAsFactors = FALSE
)

cat("Initial Data Frame:\n")
print(df)


# Step 2: Validate Initial Structure

cat("\nInitial Structure:\n")
str(df)


# Step 3: Correct Data Type Error

df$Age <- as.numeric(df$Age)

cat("\nAfter Age Conversion:\n")
str(df)


# Step 4: Detect and Handle Missing Values

cat("\nMissing Value Report:\n")
print(colSums(is.na(df)))

df$Marks[is.na(df$Marks)] <- 
  mean(df$Marks, na.rm = TRUE)


# Step 5: Filter Data

filtered_df <- subset(df, Age >= 25)

cat("\nFiltered Data:\n")
print(filtered_df)


# Step 6: Apply Transformation

filtered_df$Performance <- 
  ifelse(filtered_df$Marks >= 85,
         "Good",
         "Average")


# Step 7: Check Duplicate Records

cat("\nDuplicate Records:\n")
duplicates <- filtered_df[duplicated(filtered_df), ]

if(nrow(duplicates) == 0){
  print("No duplicate records found")
} else {
  print(duplicates)
}


# Step 8: Final Validation

cat("\nFinal Data Frame:\n")
print(filtered_df)

cat("\nFinal Structure:\n")
str(filtered_df)


cat("\nFinal Summary:\n")
summary(filtered_df)


# Error Propagation Prevention Report

cat("\nValidation Report:\n")
cat("1. Data types checked and corrected\n")
cat("2. Missing values identified and handled\n")
cat("3. Filtering applied after data cleaning\n")
cat("4. Duplicate records verified\n")
cat("5. Final dataset validated successfully\n")
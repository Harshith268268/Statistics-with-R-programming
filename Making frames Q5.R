# Create sample data frame

df <- data.frame(
  ID = 1:6,
  Sales = c(500,700,NA,900,700,500),
  Region = c("A","B","A","B","A","B")
)


# 1. Check data structure

cat("Data Structure:\n")
str(df)


# 2. Check dimensions

cat("\nNumber of Rows and Columns:\n")
print(dim(df))


# 3. Check missing values

cat("\nMissing Value Report:\n")
print(colSums(is.na(df)))


# 4. Detect duplicate records

cat("\nDuplicate Records:\n")
duplicates <- df[duplicated(df), ]
print(duplicates)


# 5. Validate data types

cat("\nData Types:\n")
print(sapply(df, class))


# 6. Generate summary statistics

cat("\nSummary Report:\n")
print(summary(df))


# 7. Check unique values

cat("\nUnique Values:\n")
print(lapply(df, unique))


# 8. Compare analysis with validation rules

sales_mean <- mean(df$Sales, na.rm = TRUE)

cat("\nValidated Mean Sales:",
    sales_mean)


# 9. Data consistency check

if(any(is.na(df$Sales))){
  cat("\nWarning: Missing sales values detected")
}

if(any(duplicated(df))){
  cat("\nWarning: Duplicate records detected")
}

cat("\nValidation Completed")
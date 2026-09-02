# Create sample large data frame

customer_df <- data.frame(
  ID = 1:10,
  Age = c("25","30","35"," 40","45","30",
          "25",NA,"50","35"),
  Status = c("Active","Inactive","Active",
             " Active ","Active","Inactive",
             "Active",NA,"Inactive","Active"),
  Sales = c(500,700,900,600,800,750,500,400,950,900),
  stringsAsFactors = FALSE
)


# 1. Check data structure

cat("Data Structure:\n")
str(customer_df)


# 2. Check missing values

cat("\nMissing Values:\n")
print(colSums(is.na(customer_df)))


# 3. Check unique values for filtering column

cat("\nUnique Status Values:\n")
print(unique(customer_df$Status))


# 4. Detect extra spaces

customer_df$Status <- trimws(customer_df$Status)


# 5. Convert incorrect data types

customer_df$Age <- as.numeric(customer_df$Age)


# 6. Perform correct filtering

filtered_data <- customer_df[
  customer_df$Age >= 30 &
    customer_df$Status == "Active",
]


# Display filtered records

cat("\nFiltered Records:\n")
print(filtered_data)


# 7. Check duplicate records

cat("\nDuplicate Records:\n")
print(customer_df[duplicated(customer_df), ])


# 8. Final validation

cat("\nFinal Data Structure:\n")
str(customer_df)

summary(customer_df)
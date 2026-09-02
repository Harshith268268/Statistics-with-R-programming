# Create sample transaction data frames

df1 <- data.frame(
  Transaction_ID = c(101,102,103,104,105),
  Customer_ID = c("C1","C2","C3","C4","C5"),
  Amount = c(500,700,300,900,450)
)

df2 <- data.frame(
  Transaction_ID = c(101,102,103,106,105),
  Customer_ID = c("C1","C2","C3","C6","C5"),
  Amount = c(500,750,300,1000,450)
)


# Check structure and data types

str(df1)
str(df2)


# Identify missing transactions

missing_in_df2 <- setdiff(df1$Transaction_ID,
                          df2$Transaction_ID)

missing_in_df1 <- setdiff(df2$Transaction_ID,
                          df1$Transaction_ID)

cat("Transactions missing in df2:\n")
print(missing_in_df2)

cat("Transactions missing in df1:\n")
print(missing_in_df1)


# Merge both data frames for comparison

comparison <- merge(
  df1,
  df2,
  by = "Transaction_ID",
  all = TRUE,
  suffixes = c("_df1","_df2")
)

print(comparison)


# Detect amount mismatches

amount_mismatch <- comparison[
  !is.na(comparison$Amount_df1) &
    !is.na(comparison$Amount_df2) &
    comparison$Amount_df1 != comparison$Amount_df2,
]

cat("\nAmount Mismatches:\n")
print(amount_mismatch)


# Detect duplicate transactions

duplicate_df1 <- df1[duplicated(df1$Transaction_ID), ]

duplicate_df2 <- df2[duplicated(df2$Transaction_ID), ]

cat("\nDuplicates in df1:\n")
print(duplicate_df1)

cat("\nDuplicates in df2:\n")
print(duplicate_df2)


# Check missing values

cat("\nMissing Values in df1:\n")
print(colSums(is.na(df1)))

cat("\nMissing Values in df2:\n")
print(colSums(is.na(df2)))
# Compare Indexing and Logical Subsetting Techniques in R

# Create a large data frame

df <- data.frame(
  ID = 1:1000000,
  Temperature = runif(1000000, 20, 40),
  Pressure = runif(1000000, 900, 1100),
  Status = sample(c("Normal", "Alert"),
                  1000000,
                  replace = TRUE)
)

cat("Original Data Frame:\n")
print(head(df))


# -------------------------------------------------
# Method 1: Indexing Technique
# -------------------------------------------------

cat("\nIndexing Method:\n")

# Extract first 100 records using row indexing

time_indexing <- system.time({
  
  indexed_data <- df[1:100, ]
  
})

print(time_indexing)

print(head(indexed_data))


# -------------------------------------------------
# Method 2: Logical Subsetting Technique
# -------------------------------------------------

cat("\nLogical Subsetting Method:\n")

# Extract records where temperature is greater than 35

time_logical <- system.time({
  
  logical_data <- df[df$Temperature > 35, ]
  
})

print(time_logical)

print(head(logical_data))


# -------------------------------------------------
# Method 3: Column Indexing
# -------------------------------------------------

cat("\nColumn Indexing:\n")

time_column <- system.time({
  
  selected_columns <- df[, c("ID", "Temperature")]
  
})

print(time_column)

print(head(selected_columns))


# -------------------------------------------------
# Performance Comparison
# -------------------------------------------------

comparison <- data.frame(
  Method = c(
    "Row Indexing",
    "Logical Subsetting",
    "Column Indexing"
  ),
  Usage = c(
    "Direct position-based extraction",
    "Condition-based filtering",
    "Selecting required attributes"
  ),
  Advantage = c(
    "Fast when row positions are known",
    "Flexible for data filtering",
    "Reduces memory usage by selecting columns"
  )
)

cat("\nPerformance Comparison:\n")
print(comparison)


# -------------------------------------------------
# Memory Usage Comparison
# -------------------------------------------------

cat("\nMemory Usage:\n")

cat("Original Data Frame:\n")
print(object.size(df))

cat("\nIndexed Data:\n")
print(object.size(indexed_data))

cat("\nLogical Subset Data:\n")
print(object.size(logical_data))


# -------------------------------------------------
# Conclusion
# -------------------------------------------------

cat("\nConclusion:\n")
cat("Indexing is faster for direct row or column access when positions are known.\n")
cat("Logical subsetting is more flexible for condition-based extraction but requires\n")
cat("additional computation for evaluating conditions on large datasets.\n")
cat("For large analytical datasets, logical subsetting is preferred for filtering,\n")
cat("while indexing is efficient for direct data retrieval.\n")
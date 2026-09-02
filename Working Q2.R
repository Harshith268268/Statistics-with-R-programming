# Evaluate Different Sorting Methods for a Million-Row Data Frame

# Create a large data frame with 1 million rows

df <- data.frame(
  ID = 1:1000000,
  Temperature = runif(1000000, 20, 40),
  Pressure = runif(1000000, 900, 1100)
)

cat("Original Data Frame:\n")
print(head(df))


# -------------------------------
# Method 1: Base R order()
# -------------------------------

cat("\nSorting using Base R order():\n")

time_order <- system.time({
  
  sorted_order_df <- df[order(df$Temperature), ]
  
})

print(time_order)

print(head(sorted_order_df))


# -------------------------------
# Method 2: dplyr arrange()
# -------------------------------

library(dplyr)

cat("\nSorting using dplyr arrange():\n")

time_arrange <- system.time({
  
  sorted_arrange_df <- df %>%
    arrange(Temperature)
  
})

print(time_arrange)

print(head(sorted_arrange_df))


# -------------------------------
# Method 3: data.table setorder()
# -------------------------------

library(data.table)

cat("\nSorting using data.table setorder():\n")

# Convert data frame to data.table

dt <- as.data.table(df)


time_setorder <- system.time({
  
  setorder(dt, Temperature)
  
})

print(time_setorder)

print(head(dt))


# -------------------------------
# Memory Usage Comparison
# -------------------------------

cat("\nMemory Usage:\n")

cat("Original Data Frame Size:\n")
print(object.size(df))

cat("\nSorted order() Data Frame Size:\n")
print(object.size(sorted_order_df))

cat("\nData Table Size:\n")
print(object.size(dt))


# -------------------------------
# Final Comparison
# -------------------------------

cat("\nSorting Method Comparison:\n")

comparison <- data.frame(
  Method = c("Base R order()",
             "dplyr arrange()",
             "data.table setorder()"),
  Description = c(
    "Simple but requires additional memory",
    "Readable syntax but creates new object",
    "Fast and memory efficient in-place sorting"
  )
)

print(comparison)


cat("\nConclusion:\n")
cat("For million-row data frames, data.table::setorder() is the most efficient\n")
cat("because it performs fast in-place sorting with lower memory consumption.\n")
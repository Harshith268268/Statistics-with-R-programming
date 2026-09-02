# Sales Data Frame with Inconsistent Data Types

# Create sample dataset
sales_df <- data.frame(
  Product_ID = c(101,102,103,104),
  Product = c("Laptop","Phone","Tablet","Monitor"),
  Quantity = c("10","15","8","20"),
  Price = c(500,700,"450",300),
  Sale_Date = c("2026-01-10",
                "2026-01-15",
                "Invalid_Date",
                "2026-01-20"),
  stringsAsFactors = FALSE
)

# Display original structure
print(sales_df)
str(sales_df)


# Convert Quantity and Price into numeric data type
sales_df$Quantity <- as.numeric(sales_df$Quantity)
sales_df$Price <- as.numeric(sales_df$Price)


# Identify and handle missing numeric values after conversion
sales_df$Quantity[is.na(sales_df$Quantity)] <-
  mean(sales_df$Quantity, na.rm = TRUE)

sales_df$Price[is.na(sales_df$Price)] <-
  mean(sales_df$Price, na.rm = TRUE)


# Convert Sale_Date into Date format
sales_df$Sale_Date <- as.Date(
  sales_df$Sale_Date,
  format = "%Y-%m-%d"
)


# Identify invalid dates
invalid_dates <- which(is.na(sales_df$Sale_Date))

cat("Invalid Date Rows:\n")
print(invalid_dates)


# Perform statistical calculations after correction
total_sales <- sum(sales_df$Quantity * sales_df$Price)

average_price <- mean(sales_df$Price)

average_quantity <- mean(sales_df$Quantity)


# Display cleaned dataset
cat("\nCleaned Sales Data:\n")
print(sales_df)


# Display results
cat("\nTotal Sales:", total_sales)
cat("\nAverage Price:", average_price)
cat("\nAverage Quantity:", average_quantity)


# Verify final data types
cat("\n\nFinal Data Structure:\n")
str(sales_df)
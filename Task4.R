# Scenario: Retail
# Task: Detect inconsistent sales records after combining branch data frames

# Step 1: Create Branch 1 Sales Data
branch1 <- data.frame(
  Sale_ID = c(101,102,103,104),
  Product = c("Laptop","Mouse","Keyboard","Monitor"),
  Amount = c(50000,500,1200,10000)
)

# Step 2: Create Branch 2 Sales Data
branch2 <- data.frame(
  Sale_ID = c(104,105,106,107),
  Product = c("Monitor","Printer","Scanner","Laptop"),
  Amount = c(10000,8000,6000,52000)
)

cat("Branch 1 Data\n")
print(branch1)

cat("\nBranch 2 Data\n")
print(branch2)

# Step 3: Merge (Combine) Both Branch Data
sales_data <- rbind(branch1, branch2)

cat("\nCombined Sales Data\n")
print(sales_data)

# Step 4: Detect Duplicate Records
duplicates <- sales_data[duplicated(sales_data$Sale_ID), ]

cat("\nDuplicate Sales Records\n")
print(duplicates)

# Step 5: Remove Duplicate Records
sales_data <- sales_data[!duplicated(sales_data$Sale_ID), ]

cat("\nSales Data After Removing Duplicates\n")
print(sales_data)
|> 
# Step 6: Validate Total Sales
total_sales <- sum(sales_data$Amount)

cat("\nTotal Sales Amount = ", total_sales, "\n")

# Step 7: Summary of Sales
sales_summary <- aggregate(Amount ~ Product,
                           data = sales_data,
                           FUN = sum)

cat("\nSales Summary by Product\n")
print(sales_summary)
product <- list(
  ID = c(101, 102, 103, 104, 105),
  Name = c("Laptop", "Mouse", "Keyboard", "Monitor", "Printer"),
  Quantity = c(10, 50, 20, 8, 15),
  Price = c(50000, 500, 1500, 12000, 8000)
)

inventory <- product$Quantity * product$Price

cat("Inventory Value for Each Product:\n")
data <- data.frame(
  ID = product$ID,
  Name = product$Name,
  Quantity = product$Quantity,
  Price = product$Price,
  InventoryValue = inventory
)
print(data)

threshold <- 10

cat("\nProducts with Stock Below Threshold:\n")
print(data[data$Quantity < threshold, ])

cat("\nStock Summary Report:\n")
cat("Total Products:", length(product$ID), "\n")
cat("Total Inventory Value:", sum(inventory), "\n")
cat("Highest Inventory Value:", max(inventory), "\n")
cat("Lowest Inventory Value:", min(inventory), "\n")
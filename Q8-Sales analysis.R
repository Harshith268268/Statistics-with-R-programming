sales <- matrix(c(
  120, 150, 180,
  200, 170, 190,
  160, 140, 180,
  210, 220, 230
), nrow = 4, byrow = TRUE)

rownames(sales) <- c("Product1", "Product2", "Product3", "Product4")
colnames(sales) <- c("Region1", "Region2", "Region3")

cat("Sales Matrix:\n")
print(sales)

productTotal <- rowSums(sales)
cat("\nProduct-wise Sales Totals:\n")
print(productTotal)

regionTotal <- colSums(sales)
cat("\nRegion-wise Sales Totals:\n")
print(regionTotal)

bestProduct <- rownames(sales)[which.max(productTotal)]
cat("\nBest Performing Product:", bestProduct, "\n")

bestRegion <- colnames(sales)[which.max(regionTotal)]
cat("Region with Maximum Sales:", bestRegion, "\n")
temp <- array(c(
  30,31,29,32,33,31,30,
  28,29,30,31,30,29,28,
  35,36,34,37,38,36,35
), dim = c(7, 3, 1))

dimnames(temp) <- list(
  Day = paste("Day", 1:7),
  City = c("Chennai", "Coimbatore", "Madurai"),
  Week = "Week1"
)

print(temp)

avg <- apply(temp, 2, mean)
cat("\nAverage Temperature of Each City:\n")
print(avg)

cat("\nHottest Day:\n")
max_temp <- max(temp)
loc <- which(temp == max_temp, arr.ind = TRUE)
cat("Day:", rownames(temp[, , 1])[loc[1]], "\n")
cat("City:", colnames(temp[, , 1])[loc[2]], "\n")
cat("Temperature:", max_temp, "\n")

cat("\nCity-wise Temperature Variation:\n")
variation <- apply(temp, 2, function(x) max(x) - min(x))
print(variation)
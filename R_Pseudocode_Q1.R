num1 <- 25
num2 <- 15
name <- "Sharmila"
status <- TRUE

sum <- num1 + num2
difference <- num1 - num2
product <- num1 * num2
division <- num1 / num2

logicalResult1 <- (num1 > num2)
logicalResult2 <- (status & logicalResult1)

cat("Numeric 1 =", num1, "\n")
cat("Numeric 2 =", num2, "\n")
cat("Character =", name, "\n")
cat("Logical =", status, "\n")

cat("Addition =", sum, "\n")
cat("Subtraction =", difference, "\n")
cat("Multiplication =", product, "\n")
cat("Division =", division, "\n")

cat("num1 > num2 =", logicalResult1, "\n")
cat("status AND (num1 > num2) =", logicalResult2, "\n")
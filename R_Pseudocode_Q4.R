calculateSum <- function(a, b) {
  return(a + b)
}

num1 <- 15
num2 <- 25

result <- calculateSum(num1, num2)

logicalVector1 <- c(TRUE, FALSE, TRUE, FALSE)
logicalVector2 <- c(TRUE, TRUE, FALSE, FALSE)

andResult <- logicalVector1 & logicalVector2
orResult <- logicalVector1 | logicalVector2
notResult <- !logicalVector1

print(paste("Sum =", result))
print("Logical Vector 1")
print(logicalVector1)

print("Logical Vector 2")
print(logicalVector2)

print("AND Operation")
print(andResult)

print("OR Operation")
print(orResult)

print("NOT Operation")
print(notResult)

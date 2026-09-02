vector1 <- c(10, 20, 30, 40, 50)
list1 <- list("Sharmila", 21, TRUE)
matrix1 <- matrix(c(1, 2, 3, 4, 5, 6), nrow = 2, ncol = 3)

print(vector1)
print(list1)
print(matrix1)

print(vector1[3])
print(list1[[2]])
print(matrix1[2,3])

vector1[2] <- 25
list1[[1]] <- "Student"
matrix1[1,2] <- 10

print(vector1)
print(list1)
print(matrix1)

print(sum(vector1))
print(mean(vector1))
print(sum(matrix1))
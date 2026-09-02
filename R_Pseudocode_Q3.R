matrix1 <- matrix(c(1, 2, 3, 4), nrow = 2)
matrix2 <- matrix(c(5, 6, 7, 8), nrow = 2)

array1 <- array(1:8, dim = c(2, 2, 2))
array2 <- array(9:16, dim = c(2, 2, 2))

matrix_add <- matrix1 + matrix2
matrix_mul <- matrix1 %*% matrix2
matrix_element <- matrix1 * matrix2

array_add <- array1 + array2
array_element <- array1 * array2

print("Matrix 1")
print(matrix1)

print("Matrix 2")
print(matrix2)

print("3D Array 1")
print(array1)

print("3D Array 2")
print(array2)

print("Matrix Addition")
print(matrix_add)

print("Matrix Multiplication")
print(matrix_mul)

print("Matrix Element-wise Multiplication")
print(matrix_element)

print("Array Addition")
print(array_add)

print("Array Element-wise Multiplication")
print(array_element)

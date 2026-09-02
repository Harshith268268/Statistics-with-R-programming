# Assessment of Creating Data Frame from Large Vectors vs Importing from Files

# Method 1: Creating Data Frame from Large Vectors

# Generate large vectors
ID <- 1:100000
Temperature <- runif(100000, 20, 40)
Pressure <- runif(100000, 900, 1100)

# Create data frame from vectors
vector_df <- data.frame(
  ID = ID,
  Temperature = Temperature,
  Pressure = Pressure
)

cat("Data Frame Created from Large Vectors:\n")
print(head(vector_df))

# Check memory size
cat("\nMemory Usage of Vector Data Frame:\n")
print(object.size(vector_df))


# Method 2: Importing Data Directly from File

# Write vector data frame to CSV file
write.csv(vector_df, "sensor_data.csv", row.names = FALSE)

# Import data from CSV file
file_df <- read.csv("sensor_data.csv")

cat("\nData Frame Imported from CSV File:\n")
print(head(file_df))

# Check memory size
cat("\nMemory Usage of Imported Data Frame:\n")
print(object.size(file_df))


# Compare execution time

cat("\nTime Required for Creating Data Frame from Vectors:\n")
print(system.time({
  temp_df <- data.frame(
    ID = 1:100000,
    Temperature = runif(100000,20,40),
    Pressure = runif(100000,900,1100)
  )
}))


cat("\nTime Required for Importing Data from File:\n")
print(system.time({
  imported_df <- read.csv("sensor_data.csv")
}))


# Validate both data frames

cat("\nStructure of Vector Created Data Frame:\n")
str(vector_df)

cat("\nStructure of Imported Data Frame:\n")
str(file_df)


# Summary Comparison

cat("\nSummary of Vector Data Frame:\n")
summary(vector_df)

cat("\nSummary of Imported Data Frame:\n")
summary(file_df)


# Conclusion
cat("\nConclusion:\n")
cat("Creating data frames from vectors is faster for generated datasets but requires high memory usage.\n")
cat("Importing from files is more scalable and suitable for large real-world datasets.")
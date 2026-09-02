# Create sample telemetry dataset
df <- data.frame(
  Sensor_ID = 1:10,
  Temperature = c("25.5", "26.1", "ERR_99", "27.4",
                  "28.0", "ERR_99", "29.2",
                  "30.1", "31.5", "ERR_99")
)

# Display original structure
str(df)


# Identify non-numeric tokens
invalid_rows <- which(!grepl("^[-+]?[0-9]*\\.?[0-9]+$", 
                             df$Temperature))

# Extract invalid tokens
invalid_tokens <- df$Temperature[invalid_rows]


# Generate diagnostic report
cat("Telemetry Error Report\n")
cat("----------------------\n")

cat("Invalid Row Positions:\n")
print(invalid_rows)

cat("\nDetected Error Tokens:\n")
print(invalid_tokens)

cat("\nToken Frequency:\n")
print(table(invalid_tokens))


# Replace non-numeric values with NA
df$Temperature[invalid_rows] <- NA


# Convert column back to numeric double precision
df$Temperature <- as.numeric(df$Temperature)


# Verify corrected structure
cat("\nCorrected Data Structure:\n")
str(df)


# Perform safe statistical analysis
cat("\nMean Temperature:\n")
print(mean(df$Temperature, na.rm = TRUE))
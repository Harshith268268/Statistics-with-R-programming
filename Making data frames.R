# Sample sensor vectors
sensor_id <- paste0("S", 1:120)        # Character vector (120)
voltage <- runif(119, 3.0, 5.0)        # Numeric vector (119)
status <- sample(c(TRUE, FALSE), 120, replace = TRUE)   # Logical vector (120)

# Store vectors in a list
sensor_data <- list(
  sensor_id = sensor_id,
  voltage = voltage,
  status = status
)

# Find vector lengths
lengths_vec <- sapply(sensor_data, length)

cat("Vector Length Report:\n")
print(lengths_vec)

# Maximum length
max_len <- max(lengths_vec)

# Diagnostic report
cat("\nDiscrepancy Report:\n")

for(name in names(sensor_data)) {
  len <- length(sensor_data[[name]])
  
  if(len < max_len) {
    missing_idx <- (len + 1):max_len
    
    cat("\nVector:", name, "\n")
    cat("Current Length:", len, "\n")
    cat("Expected Length:", max_len, "\n")
    cat("Missing Index Position(s):",
        paste(missing_idx, collapse = ", "), "\n")
    
    # Pad with NA
    sensor_data[[name]] <- c(sensor_data[[name]],
                             rep(NA, max_len - len))
  }
}

# Create corrected data frame
sensor_df <- data.frame(sensor_data)

cat("\nCorrected Data Frame:\n")
print(sensor_df)

cat("\nSummary:\n")
summary(sensor_df)
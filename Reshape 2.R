# Load package


# Example multi-sensor performance data
performance <- data.frame(
  Sensor = c("A","A","A","B","B","B"),
  Timestamp = c("T1","T1","T1","T1","T1","T2"),
  Bitrate = c("Low","Low","High","Low","Low","High"),
  Performance = c(95,97,92,88,90,94)
)

# Convert wide data to molten format
melted_data <- melt(
  performance,
  id.vars = c("Sensor", "Timestamp", "Bitrate"),
  measure.vars = "Performance"
)

print(melted_data)


# Convert back to wide format with mean and variance aggregation

wide_result <- dcast(
  melted_data,
  Sensor + Timestamp ~ Bitrate,
  value.var = "value",
  fun.aggregate = list(mean = mean, variance = var)
)

print(wide_result)
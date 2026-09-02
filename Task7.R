# Scenario: Network Logs
# Task: Import multiple log files and identify failed login patterns

# Step 1: Create Sample Network Log Files

log1 <- data.frame(
  User = c("Alice","Bob","Charlie"),
  Status = c("Success","Failed","Success")
)

log2 <- data.frame(
  User = c("David","Emma","Frank"),
  Status = c("Failed","Failed","Success")
)

log3 <- data.frame(
  User = c("Alice","George","Henry"),
  Status = c("Failed","Success","Failed")
)

# Step 2: Save Log Files as CSV

write.csv(log1, "log1.csv", row.names = FALSE)
write.csv(log2, "log2.csv", row.names = FALSE)
write.csv(log3, "log3.csv", row.names = FALSE)

# Step 3: Read Only the Log Files

files <- c("log1.csv", "log2.csv", "log3.csv")

data_list <- lapply(files, read.csv)

# Step 4: Combine All Log Files

network_logs <- do.call(rbind, data_list)

cat("Combined Network Logs\n")
print(network_logs)

# Step 5: Filter Failed Login Attempts

failed_logins <- subset(network_logs, Status == "Failed")

cat("\nFailed Login Attempts\n")
print(failed_logins)

# Step 6: Count Failed Logins by User

failure_count <- aggregate(Status ~ User,
                           data = failed_logins,
                           FUN = length)

colnames(failure_count)[2] <- "Failed_Attempts"

cat("\nFailed Login Count by User\n")
print(failure_count)
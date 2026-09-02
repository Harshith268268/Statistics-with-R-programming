# Workflow to Monitor and Validate Modifications
# Made to a Shared Data Frame by Multiple Users

# Step 1: Create Original Shared Data Frame

shared_df <- data.frame(
  Record_ID = c(1,2,3,4,5),
  User = c("Admin","User1","User2","User1","User3"),
  Status = c("Approved","Pending","Approved","Pending","Rejected"),
  Value = c(100,200,300,150,250),
  Last_Modified = Sys.time()
)

cat("Original Shared Data Frame:\n")
print(shared_df)


# Step 2: Create Audit Log Function

audit_log <- data.frame(
  Record_ID = integer(),
  Modified_By = character(),
  Old_Value = character(),
  New_Value = character(),
  Time = character()
)


log_change <- function(id, user, old, new){
  
  audit_log <<- rbind(
    audit_log,
    data.frame(
      Record_ID = id,
      Modified_By = user,
      Old_Value = old,
      New_Value = new,
      Time = as.character(Sys.time())
    )
  )
}


# Step 3: User Modification Simulation

# User1 modifies record 2

old_status <- shared_df$Status[2]

shared_df$Status[2] <- "Approved"

log_change(
  2,
  "User1",
  old_status,
  "Approved"
)


# User2 modifies record 5

old_status <- shared_df$Status[5]

shared_df$Status[5] <- "Approved"

log_change(
  5,
  "User2",
  old_status,
  "Approved"
)


# Step 4: Validate Data Integrity

cat("\nModified Shared Data Frame:\n")
print(shared_df)


# Check duplicate records

cat("\nDuplicate Record Check:\n")

duplicates <- shared_df[duplicated(shared_df$Record_ID), ]

if(nrow(duplicates) == 0){
  print("No duplicate records found")
}else{
  print(duplicates)
}


# Check missing values

cat("\nMissing Value Check:\n")
print(colSums(is.na(shared_df)))


# Validate allowed status values

valid_status <- c("Approved","Pending","Rejected")

invalid_records <- shared_df[
  !(shared_df$Status %in% valid_status),
]

cat("\nInvalid Status Records:\n")
print(invalid_records)


# Step 5: Display Audit History

cat("\nModification Audit Log:\n")
print(audit_log)


# Step 6: Final Validation Report

cat("\nFinal Validation Report:\n")

if(nrow(duplicates) == 0 &&
   sum(is.na(shared_df)) == 0 &&
   nrow(invalid_records) == 0){
  
  cat("Data frame validated successfully.\n")
  
}else{
  
  cat("Validation errors detected. Review audit log.\n")
}


# Conclusion

cat("\nWorkflow Summary:\n")
cat("1. Original data snapshot created.\n")
cat("2. User modifications recorded in audit log.\n")
cat("3. Data integrity checks performed.\n")
cat("4. Invalid changes and conflicts can be traced using logs.\n")
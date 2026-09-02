# Source 1: Customer database

source1 <- data.frame(
  ID = c(1,2,3),
  Name = c("John","Mary","David"),
  Age = c("25","30","35"),
  stringsAsFactors = FALSE
)


# Source 2: Sensor system

source2 <- data.frame(
  Customer_ID = c(1,2,4),
  Name = c("John","Mary","Alex"),
  Age = c(25,30,40)
)


# Step 1: Standardize column names

names(source2)[names(source2) == "Customer_ID"] <- "ID"


# Step 2: Convert data types

source1$Age <- as.numeric(source1$Age)
source2$Age <- as.numeric(source2$Age)


# Step 3: Combine data sources

combined_df <- merge(
  source1,
  source2,
  by = "ID",
  all = TRUE,
  suffixes = c("_source1","_source2")
)


# Step 4: Handle missing values

combined_df[is.na(combined_df)] <- "Unknown"


# Step 5: Validate final data frame

print(combined_df)

str(combined_df)

summary(combined_df)
# Determine Suitable Data Structure for Machine Learning
# Compare Wide and Long Format Reshaping

# Step 1: Create Original Dataset (Wide Format)

data_wide <- data.frame(
  Student_ID = c(1,2,3,4),
  Math = c(85,90,78,88),
  Science = c(80,92,75,85),
  English = c(82,88,80,90),
  Result = c("Pass","Pass","Fail","Pass")
)

cat("Original Wide Format Dataset:\n")
print(data_wide)


# Check structure

cat("\nWide Format Structure:\n")
str(data_wide)


# ------------------------------------------------
# Step 2: Reshape Wide Format to Long Format
# ------------------------------------------------

library(reshape2)

data_long <- melt(
  data_wide,
  id.vars = c("Student_ID","Result"),
  variable.name = "Subject",
  value.name = "Marks"
)

cat("\nLong Format Dataset:\n")
print(data_long)


# Check long format structure

cat("\nLong Format Structure:\n")
str(data_long)


# ------------------------------------------------
# Step 3: Analyze Both Structures
# ------------------------------------------------

cat("\nWide Format Summary:\n")
summary(data_wide)


cat("\nLong Format Summary:\n")
summary(data_long)


# ------------------------------------------------
# Step 4: Compare Suitability for Machine Learning
# ------------------------------------------------

comparison <- data.frame(
  Structure = c("Wide Format",
                "Long Format"),
  
  Advantages = c(
    "Each feature is stored as a separate column; suitable for many ML algorithms",
    "Suitable for time-series, grouping, and deep learning models requiring sequential data"
  ),
  
  Limitations = c(
    "Less flexible when new features are added",
    "Requires additional encoding before many ML algorithms"
  )
)

cat("\nStructure Comparison:\n")
print(comparison)


# ------------------------------------------------
# Step 5: Final Recommendation
# ------------------------------------------------

cat("\nRecommendation:\n")

cat("Wide format is preferred for most machine learning models because\n")
cat("each attribute becomes an independent feature column and each row\n")
cat("represents one training observation.\n")

cat("\nLong format is preferred for time-series and sequential models where\n")
cat("multiple observations per entity are required.\n")
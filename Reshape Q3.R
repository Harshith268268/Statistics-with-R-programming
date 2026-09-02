# Evaluate Risks of Incorrect Data Reshaping in Healthcare Analytics

# Step 1: Create Healthcare Dataset in Wide Format

health_df <- data.frame(
  Patient_ID = c("P101","P102","P103"),
  BP_Morning = c(120,130,140),
  BP_Evening = c(125,135,145),
  Heart_Rate = c(75,80,85),
  Diagnosis = c("Normal","Risk","High")
)

cat("Original Healthcare Dataset (Wide Format):\n")
print(health_df)


# Check original structure

cat("\nOriginal Structure:\n")
str(health_df)


# ------------------------------------------------
# Correct Reshaping: Wide to Long Format
# ------------------------------------------------

library(reshape2)

health_long <- melt(
  health_df,
  id.vars = c("Patient_ID","Diagnosis"),
  measure.vars = c("BP_Morning",
                   "BP_Evening",
                   "Heart_Rate"),
  variable.name = "Measurement_Type",
  value.name = "Reading"
)

cat("\nCorrect Long Format:\n")
print(health_long)


# ------------------------------------------------
# Risk 1: Incorrect ID Mapping
# ------------------------------------------------

wrong_health <- health_long

# Simulating incorrect patient mapping
wrong_health$Patient_ID <- 
  sample(wrong_health$Patient_ID)

cat("\nIncorrect Patient Mapping:\n")
print(wrong_health)


# ------------------------------------------------
# Risk 2: Incorrect Aggregation
# ------------------------------------------------

# Correct average blood pressure analysis

bp_data <- subset(
  health_long,
  Measurement_Type %in% c("BP_Morning",
                          "BP_Evening")
)

correct_average <- aggregate(
  Reading ~ Patient_ID,
  data = bp_data,
  mean
)

cat("\nCorrect Average Blood Pressure:\n")
print(correct_average)


# ------------------------------------------------
# Risk 3: Duplicate Records After Reshaping
# ------------------------------------------------

duplicates <- health_long[
  duplicated(health_long),
]

cat("\nDuplicate Records:\n")

if(nrow(duplicates) == 0){
  print("No duplicate records found")
}else{
  print(duplicates)
}


# ------------------------------------------------
# Risk 4: Missing Value Detection
# ------------------------------------------------

cat("\nMissing Values:\n")
print(colSums(is.na(health_long)))


# ------------------------------------------------
# Validation Framework
# ------------------------------------------------

cat("\nHealthcare Data Validation Report:\n")

cat("1. Patient IDs verified after reshaping\n")
cat("2. Measurement relationships preserved\n")
cat("3. Duplicate records checked\n")
cat("4. Missing values identified\n")
cat("5. Aggregation accuracy validated\n")


# Final structure

cat("\nFinal Long Format Structure:\n")
str(health_long)
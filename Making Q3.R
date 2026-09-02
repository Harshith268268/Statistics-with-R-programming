id="9p3x7m"
health_df <- data.frame(
  Patient_ID = c("P101","P102","P103"),
  Age = c("45","50","60"),              # Incorrectly stored as character
  Blood_Pressure = c("120","140","130"), # Incorrectly stored as character
  Diabetes_Status = c(1,0,1),            # Should be logical/categorical
  Visit_Date = c("2026-01-10",
                 "2026-02-15",
                 "2026-03-20")          # Should be Date type
)

str(health_df)
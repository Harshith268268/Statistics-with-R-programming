# Scenario: Weather Data
# Task: Read text and CSV formats and compare averages

# Step 1: Create Weather Data

weather <- data.frame(
  City = c("Chennai", "Delhi", "Mumbai", "Kolkata", "Bangalore"),
  Temperature = c(35, 38, 32, 34, 29),
  Rainfall = c(12, 5, 20, 15, 18)
)

# Step 2: Save as CSV and Text Files

write.csv(weather, "weather.csv", row.names = FALSE)

write.table(weather,
            "weather.txt",
            sep = "\t",
            row.names = FALSE)

# Step 3: Read CSV File

weather_csv <- read.csv("weather.csv")

cat("Weather Data from CSV\n")
print(weather_csv)

# Step 4: Read Text File

weather_txt <- read.table("weather.txt",
                          header = TRUE,
                          sep = "\t")

cat("\nWeather Data from Text File\n")
print(weather_txt)

# Step 5: Compare Averages

cat("\nAverage Temperature (CSV): ",
    mean(weather_csv$Temperature), "\n")

cat("Average Temperature (Text): ",
    mean(weather_txt$Temperature), "\n")

cat("\nAverage Rainfall (CSV): ",
    mean(weather_csv$Rainfall), "\n")

cat("Average Rainfall (Text): ",
    mean(weather_txt$Rainfall), "\n")

# Step 6: Summary Statistics

cat("\nSummary of CSV Data\n")
summary(weather_csv)

cat("\nSummary of Text Data\n")
summary(weather_txt)
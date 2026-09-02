# Smart-city traffic monitoring data frame

traffic_df <- data.frame(
  Sensor_ID = c("S101","S102","S103","S104"),
  Location = c("Main_Road","Highway","Junction_A","Bridge"),
  Timestamp = as.POSIXct(c(
    "2026-07-29 08:00:00",
    "2026-07-29 08:05:00",
    "2026-07-29 08:10:00",
    "2026-07-29 08:15:00"
  )),
  Vehicle_Count = c(120,250,180,90),
  Average_Speed = c(45,35,40,55),
  Traffic_Density = c("Medium","High","Medium","Low"),
  Air_Quality_Index = c(45,80,60,35),
  Accident_Status = c(FALSE,TRUE,FALSE,FALSE),
  Signal_Status = c("Green","Red","Yellow","Green")
)

# Display data frame
print(traffic_df)

# View structure
str(traffic_df)

# Summary analysis
summary(traffic_df)
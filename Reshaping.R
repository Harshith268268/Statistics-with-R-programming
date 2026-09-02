# Structural strain matrix in wide format

strain <- data.frame(
  Time = c("T1", "T2", "T3"),
  SensorA_X = c(1.2, 1.4, 1.6),
  SensorA_Y = c(2.1, 2.3, 2.5),
  SensorB_X = c(1.5, 1.7, 1.9),
  SensorB_Y = c(2.4, 2.6, 2.8)
)

print(strain)


# Convert wide matrix into long format

long_strain <- reshape(
  strain,
  varying = names(strain)[-1],
  v.names = "Strain_Value",
  timevar = "Sensor_Coordinate",
  times = names(strain)[-1],
  direction = "long"
)


# Reset row names
long_strain <- long_strain[order(long_strain$Time), ]

rownames(long_strain) <- NULL


# Display transformed dataset
print(long_strain)
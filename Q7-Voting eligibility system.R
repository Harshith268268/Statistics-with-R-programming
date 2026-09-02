citizens <- data.frame(
  Name = c("Arun", "Meena", "Kiran", "Priya", "Rahul", "Anu"),
  Age = c(17, 22, 18, 16, 25, 20)
)

eligible <- citizens$Age >= 18

citizens$Eligible <- eligible

cat("Citizen Details:\n")
print(citizens)

eligibleCount <- sum(eligible)
ineligibleCount <- sum(!eligible)

cat("\nEligible Voters:", eligibleCount, "\n")
cat("Ineligible Voters:", ineligibleCount, "\n")

percentage <- (eligibleCount / nrow(citizens)) * 100

cat("Percentage of Eligible Voters:", percentage, "%\n")
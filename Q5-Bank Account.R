balance <- 10000
history <- c()

deposit <- function(amount) {
  balance <<- balance + amount
  history <<- c(history, paste("Deposited:", amount))
}

withdraw <- function(amount) {
  if (balance >= amount) {
    balance <<- balance - amount
    history <<- c(history, paste("Withdrawn:", amount))
  } else {
    cat("Insufficient Balance\n")
  }
}

checkBalance <- function() {
  cat("Current Balance:", balance, "\n")
}

transactionHistory <- function() {
  cat("Transaction History:\n")
  print(history)
}

deposit(5000)
withdraw(2000)
deposit(3000)

checkBalance()
transactionHistory()
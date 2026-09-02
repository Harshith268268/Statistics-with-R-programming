bank <- function(acc, name, balance) {
  structure(list(acc = acc, name = name, balance = balance), class = "Bank")
}

deposit <- function(x, amt) {
  x$balance <- x$balance + amt
  x
}

withdraw <- function(x, amt) {
  if (x$balance >= amt) {
    x$balance <- x$balance - amt
  }
  x
}

print.Bank <- function(x) {
  cat(x$acc, x$name, x$balance, "\n")
}

b <- bank(101, "Arun", 5000)
b <- deposit(b, 1000)
b <- withdraw(b, 2000)
print(b)
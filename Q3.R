Bank <- setRefClass(
  "Bank",
  fields = list(
    acc = "numeric",
    name = "character",
    balance = "numeric"
  ),
  methods = list(
    deposit = function(a) {
      balance <<- balance + a
    },
    withdraw = function(a) {
      if (balance >= a) {
        balance <<- balance - a
      }
    },
    display = function() {
      cat(acc, name, balance, "\n")
    }
  )
)

b <- Bank$new(acc = 101, name = "Kumar", balance = 10000)

b$deposit(5000)
b$withdraw(3000)
b$display()
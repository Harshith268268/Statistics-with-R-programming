Payroll <- setRefClass(
  "Payroll",
  fields = list(
    id = "numeric",
    name = "character",
    basic = "numeric"
  ),
  methods = list(
    gross = function() {
      basic + 0.2 * basic + 0.1 * basic
    },
    display = function() {
      cat(id, name, gross(), "\n")
    }
  )
)

p <- Payroll$new(
  id = 1,
  name = "Meena",
  basic = 40000
)

p$display()
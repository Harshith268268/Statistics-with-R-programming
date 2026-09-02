setClass("Employee",
         slots = list(
           id = "numeric",
           name = "character",
           basic = "numeric"
         ))

setGeneric("gross",
           function(object) standardGeneric("gross"))

setMethod("gross", "Employee",
          function(object) {
            object@basic + 0.2 * object@basic + 0.1 * object@basic
          })

e <- new("Employee",
         id = 1,
         name = "Anu",
         basic = 30000)

show(e)
gross(e)
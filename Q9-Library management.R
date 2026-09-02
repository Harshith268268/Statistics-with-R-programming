Book <- function(id, title, author, copies) {
  structure(
    list(
      id = id,
      title = title,
      author = author,
      copies = copies
    ),
    class = "Book"
  )
}

print.Book <- function(x) {
  cat("Book ID:", x$id, "\n")
  cat("Title:", x$title, "\n")
  cat("Author:", x$author, "\n")
  cat("Copies:", x$copies, "\n")
}

updateCopies <- function(x, n) {
  x$copies <- n
  x
}

searchBook <- function(x, title) {
  if (x$title == title)
    print(x)
  else
    cat("Book Not Found\n")
}

b <- Book(101, "R Programming", "John", 10)

print(b)

b <- updateCopies(b, 15)

cat("\nAfter Updating Copies:\n")
print(b)

cat("\nSearch Result:\n")
searchBook(b, "R Programming")
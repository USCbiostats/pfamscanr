split_fasta <- function(x) {
  x <- paste(x, collapse = "\n")
  x <- gsub("\\s*\\n\\s*", "\n", x, perl = TRUE)
  x <- strsplit(x, split = "(\\n|^)(>|;)", perl = TRUE)[[1L]][-1L]
  paste0(">",x)
}

if (FALSE) {
x <- c(
  ">ikjasdoijasd HUMAN:x
  kajsdijasdjaslkd
  lkasdkljas*
  >
  jkasdkasdkjakjlasdjkasdkljasas
  ;
  klajsdlkj",
  ">ikjasdoijasd
  kajsdijasdjaslkd
  lkasdkljas*",
  ">
  jkasdkasdkjakjlasdjkasdkljasas",
  ";
  klajsdlkj"
  )

}

#' Queries performed during the current R Session
#'
#' This environment keeps track of the query ids successfully submitted
#' and whether they were marked as "done" or not.
#'
#' @details The [print] method prints a data.frame with the information.
#' The data is stored directly in the `dat` slot.
#'
#' @export
pfamscanr_queries <- new.env(parent = emptyenv())
pfamscanr_queries[["dat"]] <- NULL

class(pfamscanr_queries) <- c("pfamscanr_queries", class(pfamscanr_queries))

pfamscanr_queries[["add"]] <- function(str) {

  pfamscanr_queries[["dat"]] <- rbind(
    pfamscanr_queries[["dat"]],
    data.frame(
      id          = str,
      done        = FALSE,
      retrieved   = FALSE,
      time_posted = Sys.time()
      )
  )

  invisible()
}

pfamscanr_queries[["update_done"]] <- function(str = NULL) {
  if (is.null(str))
    str <- tail(pfamscanr_queries[["dat"]]$id, 1)

  id <- which(pfamscanr_queries[["dat"]]$id == str)
  pfamscanr_queries[["dat"]][id, "done"] <- TRUE
  invisible()
}

pfamscanr_queries[["update_retrieved"]] <- function(str = NULL) {
  if (is.null(str))
    str <- tail(pfamscanr_queries[["dat"]]$id, 1)

  id <- which(pfamscanr_queries[["dat"]]$id == str)
  pfamscanr_queries[["dat"]][id, "retrieved"] <- TRUE
  invisible()
}

#' @export
print.pfamscanr_queries <- function(x,...) {
  if (is.null(x[["dat"]]))
    cat("No queries yet.\n")
  else {
    print(x[["dat"]])
    cat(rep("-", getOption("width", 80)), sep = "")
    cat("\nNote: You can access the data directly by typing $dat.\n")
  }
  invisible(x)
}

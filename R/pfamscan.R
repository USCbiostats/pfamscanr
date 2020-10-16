#' Process pfamscan result
#' @param x A string as that returned by EBI pfamscan's API.
#' @references https://www.ebi.ac.uk/Tools/pfa/pfamscan/
#' @return A data.frame with the following columns:
#' - `seq_id`
#' - `alignment_start`
#' - `alignment_end`
#' - `envelope_start`
#' - `envelope_end`
#' - `hmm_acc`
#' - `hmm_name`
#' - `type`
#' - `hmm_start`
#' - `hmm_end`
#' - `hmm_length`
#' - `bit_score`
#' - `E.value`
#' - `significance`
#' - `clan`
#' @details
#' Internal use only
#' @export
#' @importFrom utils read.table
pfamscan_process <- function(x) {

  x <- strsplit(x, "\\n")[[1]]

  # Processing the header
  headers <- x[which(grepl("^\\s*$", x)) - 1]
  headers <- strsplit(headers, ">\\s*<")[[1]]
  headers <- gsub("^#\\s*<|>\\s*$", "", headers)
  headers <- gsub("\\s+", "_", headers)

  x <- x[!grepl("^(#.+|\\s*)$", x)]

  tmp <- tempfile(fileext = ".txt")
  cat(x, file=tmp, sep = "\n", append=TRUE)
  utils::read.table(
    tmp, header = FALSE, col.names = headers,
    stringsAsFactors = FALSE
  )
}

#' @param query_id Character scalar. Id of the query to retrieve, e.g.,
#' `"pfamscan-R20191015-22133-0197-415408-p2m"`
#' @rdname pfamscan
#' @details
#' The function `pfamscan_retrieve` can be used to retrieve the results of
#' an specific query. This is useful if, for example, the query was correctly
#' posted but the function ran out of time waiting for it to be completed.
#' You can check the list of posted queries during the session using
#' [pfamscanr_queries]
#' @export
pfamscan_retrieve <- function(
  query_id,
  ...,
  api_url       = "https://www.ebi.ac.uk/",
  path          = "Tools/services/rest/pfamscan",
  errorfun      = message,
  verb          = TRUE,
  json_args     = list()
) {

  # Checking json defaults
  if (!("simplifyVector" %in% names(json_args))) {
    json_args$simplifyVector <- TRUE
  }

  if (!("simplifyDataFrame" %in% names(json_args))) {
    json_args$simplifyDataFrame <- TRUE
  }

  if (!("simplifyMatrix" %in% names(json_args))) {
    json_args$simplifyMatrix <- TRUE
  }

  msg <- if (verb) message
  else function(...) return(invisible())

  msg("Retrieving the results for query ", query_id, "...", appendLF = FALSE)
  query <- httr::GET(
    url = api_url,
    path = c("Tools/services/rest/pfamscan", "result", query_id, "out"),
    httr::add_headers(
      Accept = "text/plain"
    ),
    ...
  )

  if (httr::status_code(query) != 200) {
    errorfun(
      sprintf(
        "Retrieving the query id %s did not worked: %s",
        query_id,
        httr::content(query)
      )
    )
    return(NULL)
  }

  msg("Done!")

  do.call(
    jsonlite::fromJSON,
    c(
      list(txt = httr::content(query)),
      json_args
    )
  )
}

#' Query the online service PfamScan
#'
#' This uses the EBI API. Details here:
#' https://www.ebi.ac.uk/Tools/common/tools/help/index.html
#'
#' @param fasta_str A string representing a single sequence in fasta format (details)
#' @param email,evalue,asp Query parameters, see [here](https://www.ebi.ac.uk/seqdb/confluence/display/THD/PfamScan).
#' @param api_url,path URL path to the API.
#' @param maxchecktime Max wait time for the results (seconds).
#' @param wait Time, in seconds, to wait between checks.
#' @param errorfun A function to either print error or message.
#' @param query_size Maximum number of sequences per query (limit 100).
#' @param verb Logical scalar. When `TRUE` the function will print informative
#' messages.
#' @param ... Further arguments passed to [httr::POST()] and [httr::GET()].
#' @param json_args Arguments passed to [jsonlite::fromJSON()] (see details).
#' @details
#' If `fasta_str` is a vector including multiple sequences to submit, the
#' function will make either a single call to the API or multiple depending
#' on `query_size`. As of now, the API limits 100 sequences per query.
#'
#' The function returns the response (in JSON format) parsed using the function
#' [jsonlite::fromJSON()].
#'
#' @references
#' Madeira F, Park YM, Lee J, et al. The EMBL-EBI search and sequence analysis
#' tools APIs in 2019. Nucleic Acids Research. 2019 Jul;47(W1):W636-W641.
#' \doi{10.1093/nar/gkz268}.
#' @export
#' @importFrom httr POST GET add_headers status_code content
#' @importFrom jsonlite fromJSON
#' @examples
#' \dontrun{
#' # This is an example extracted directly from the website
#' # https://www.ebi.ac.uk/Tools/pfa/pfamscan/
#' ans <- pfamscan(
#'   fasta_str = ">sp|P35858|ALS_HUMAN Insulin-like growth factor-binding protein complex acid labile subunit OS=Homo sapiens GN=IGFALS PE=1 SV=1
#' MALRKGGLALALLLLSWVALGPRSLEGADPGTPGEAEGPACPAACVCSYDD
#' DADELSVFCSSRNLTRLPDGVPGGTQALWLDGNNLSSVPPAAFQNLSSLGF
#' LNLQGGQLGSLEPQALLGLENLCHLHLERNQLRSLALGTFAHTPALASLGL
#' SNNRLSRLEDGLFEGLGSLWDLNLGWNSLAVLPDAAFRGLGSLRELVLAGN
#' RLAYLQPALFSGLAELRELDLSRNALRAIKANVFVQLPRLQKLYLDRNLIA
#' AVAPGAFLGLKALRWLDLSHNRVAGLLEDTFPGLLGLRVLRLSHNAIASLR
#' PRTFKDLHFLEELQLGHNRIRQLAERSFEGLGQLEVLTLDHNQLQEVKAGA
#' FLGLTNVAVMNLSGNCLRNLPEQVFRGLGKLHSLHLEGSCLGRIRPHTFTG
#' LSGLRRLFLKDNGLVGIEEQSLWGLAELLELDLTSNQLTHLPHRLFQGLGK
#' LEYLLLSRNRLAELPADALGPLQRAFWLDVSHNRLEALPNSLLAPLGRLRY
#' LSLRNNSLRTFTPQPPGLERLWLEGNPWDCGCPLKALRDFALQNPSAVPRF
#' VQAICEGDDCQPPAYTYNNITCASPPEVVGLDLRDLSEAHFAPC",
#'   email     = "your@email.com",
#'   httr::config(connecttimeout=60)
#' )
#' }
pfamscan <- function(
  fasta_str,
  email,
  ...,
  evalue        = 10,
  asp           = "false",
  api_url       = "https://www.ebi.ac.uk/",
  path          = "Tools/services/rest/pfamscan",
  maxchecktime  = 120,
  wait          = 1,
  errorfun      = message,
  query_size    = 100L,
  verb          = TRUE,
  json_args     = list()
) {

  # Processing fasta
  fasta_str <- split_fasta(fasta_str)

  # Checking lengths
  if (length(fasta_str) > query_size) {

    # Learning the size of the sequences
    sizes <- 1:length(fasta_str) %/% (query_size)

    # Making the splits
    sizes <- split(fasta_str, sizes)
    sizes <- sapply(sizes, paste0, collapse = "\n")

    ans <- lapply(
      X             = sizes,
      FUN           = pfamscan,
      email         = email,
      evalue        = evalue,
      asp           = asp,
      ...,
      path          = path,
      maxchecktime  = maxchecktime,
      wait          = wait,
      errorfun      = errorfun,
      query_size    = query_size,
      verb          = verb,
      json_args     = json_args
    )

    # Adding different rownames
    j <- 1L
    for (i in seq_along(ans)) {
      if (!is.null(ans[[i]]) && (nrow(ans[[i]]) > 0L)) {
        rownames(ans[[i]]) <- j:(j + nrow(ans[[i]]) - 1L)

        # Renaming data.frames nested (it is an issue)
        for (k in which(sapply(ans[[i]], inherits, what = "data.frame")))
          rownames(ans[[i]][[k]]) <- rownames(ans[[i]])
        j <- j + nrow(ans[[i]])
      } else {

      }
    }

    return(do.call(rbind, ans))

  }
  fasta_str <- paste(fasta_str, collapse="\n")

  # Posting the data to the EBI server
  sequences <- gsub("\\n[[:upper:]\\n*]+", "", fasta_str)
  sequences <- strsplit(sequences, "\\n?>")[[1L]][-1]
  sequences <- sub("(;|>)", "", sequences)
  sequences <- sub("\\s+.+", "", sequences, perl = TRUE)

  msg <- if (verb) message
  else function(...) return(invisible())

  msg(
    paste(rep("-", 80), collapse = ""),
    sprintf(
      "\nPosting the query for %i sequences:\n %s...",
      length(sequences),
      paste0(sequences, collapse = ", ")
    ),
    appendLF = TRUE
  )

  query1 <- httr::POST(
    url    = api_url,
    path   = c("Tools/services/rest/pfamscan", "run"),
    config = httr::add_headers(
      "Content-Type" = "application/x-www-form-urlencoded",
      Accept         = "text/plain"
    ),
    encode ="form",
    body = list(
      email    = email,
      database = "pfam-a",
      format   = "json",
      asp      = asp,
      evalue   = evalue,
      sequence = fasta_str
    ),
    ...
  )

  # Checking status
  if (httr::status_code(query1) != 200) {
    errorfun("Query did not worked: ", httr::content(query1))
    return(NULL)
  }

  # Retrieving the id
  query_id <- httr::content(query1)

  # Adding the query to the list of queries
  pfamscanr_queries$add(query_id)

  # Checking if it is done
  time0 <- Sys.time()
  msg("Waiting for the query: ", query_id, " to finalize...", appendLF = FALSE)
  while (difftime(Sys.time(), time0, units="secs") < maxchecktime) {

    query2 <- httr::GET(
      url = api_url,
      path = c("Tools/services/rest/pfamscan", "status", query_id),
      httr::add_headers(
        Accept = "text/plain"
      ),
      ...
    )

    # Checking the status
    if (httr::status_code(query2) != 200) {
      errorfun(
        sprintf(
          "Querying the id %s did not worked: %s",
          query_id,
          httr::content(query2)
        )
      )

      return(NULL)
    }

    # Checking whether it is done or not
    if (httr::content(query2) == "FINISHED")
      break

    msg(".", appendLF = FALSE)

    Sys.sleep(wait)

  }

  if (difftime(Sys.time(), time0, units="secs") >= maxchecktime) {
    errorfun("\nChecking query ", query_id, " went out-of-time.")
    return(NULL)
  }

  pfamscanr_queries$update_done()

  msg("Success!")

  pfamscan_retrieve(
    query_id  = query_id,
    ...,
    api_url   = api_url,
    path      = path,
    errorfun  = errorfun,
    verb      = verb,
    json_args = json_args
  )

}

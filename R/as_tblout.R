# <seq id> <alignment start> <alignment end> <envelope start> <envelope end> <hmm acc> <hmm name> <type> <hmm start> <hmm end> <hmm length>
# <bit score> <E-value> <significance> <clan>
#
# JBW_0001     95    268     66    271 PF01435.13  Peptidase_M48     Family    31   223   226     40.2   2.7e-10   1 CL0126
# JBW_0003     33    305     31    340 PF12889.2   DUF3829           Family     3   242   277     85.8   2.6e-24   1 No_clan
# JBW_0003     98    188     65    191 PF05823.7   Gp-FAR-1          Family    50   138   154     11.1      0.27   0 No_clan
#

pfamscan_txt_names <- c(
  "<seq id>",
  "<alignment start>",
  "<alignment end>",
  "<envelope start>",
  "<envelope end>",
  "<hmm acc>",
  "<hmm name>",
  "<type>",
  "<hmm start>",
  "<hmm end>",
  "<hmm length>",
  "<bit score>",
  "<E-value>",
  "<significance>",
  "<clan>"
)

#' Tabular output format for a scan
#'
#' This resembles the behavior of HMM when the option `--tblout` is passed.
#' The resulting file is space separated with varying widths, so the user
#' should not rely on the file to be a fixed-width-file.
#'
#' @param x A [data.frame] as returned by [pfamscan()].
#' @param output Character scalar. Output file where to write the table
#' @param append Passed to [cat()].
#' @return
#' Prints the file on screen and returns the tabular format as a [data.frame]
#' invisible.
#' @examples
#' data("P35858", package = "pfamscanr")
#' as_tblout(P35858)
#' @export
as_tblout <- function(x, output = "", append = FALSE) {

  ptab <- with(
    x,
    data.frame(
      seq_id          = seq$name,
      alignment_start = seq$from,
      alignment_end   = seq$to,
      envelope_start  = env$from,
      envelope_end    = env$to,
      hmm_acc         = acc,
      hmm_name        = name,
      type            = type,
      hmm_start       = hmm$from,
      hmm_end         = hmm$to,
      hmm_length      = model_length,
      bit_score       = bits,
      E_value         = evalue,
      significance    = sig,
      clan            = clan
    )
    )

  cat(
    "# This is a simulated scan file. The original call used the json output\n",
    file   = output,
    append = append
    )

  cat(
    "# which holds more information. This is just an attempt to get the same output.\n",
    file   = output,
    append = TRUE
    )

  # Printing the title
  cat(
    paste("#", paste(pfamscan_txt_names, collapse = " ")), "\n\n",
    file   = output,
    append = TRUE
  )

  # Printing the data
  utils::write.table(
    ptab, file = output,
    append     = TRUE,
    sep        = "\t",
    row.names  = FALSE,
    quote      = FALSE,
    col.names  = FALSE
    )

  invisible(ptab)


}

% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/pfamscan.R
\name{pfamscan_process}
\alias{pfamscan_process}
\title{Process pfamscan result}
\usage{
pfamscan_process(x)
}
\arguments{
\item{x}{A string as that returned by EBI pfamscan's API.}
}
\value{
A data.frame with the following columns:
\itemize{
\item \code{seq_id}
\item \code{alignment_start}
\item \code{alignment_end}
\item \code{envelope_start}
\item \code{envelope_end}
\item \code{hmm_acc}
\item \code{hmm_name}
\item \code{type}
\item \code{hmm_start}
\item \code{hmm_end}
\item \code{hmm_length}
\item \code{bit_score}
\item \code{E.value}
\item \code{significance}
\item \code{clan}
}
}
\description{
Process pfamscan result
}
\details{
Internal use only
}
\references{
https://www.ebi.ac.uk/Tools/pfa/pfamscan/
}

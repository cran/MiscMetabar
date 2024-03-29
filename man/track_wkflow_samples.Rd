% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/dada_phyloseq.R
\name{track_wkflow_samples}
\alias{track_wkflow_samples}
\title{Track the number of reads (= sequences), samples and cluster (e.g. ASV)
for each samples.}
\usage{
track_wkflow_samples(list_pq_obj, ...)
}
\arguments{
\item{list_pq_obj}{(required): a list of object passed on to \code{\link[=track_wkflow]{track_wkflow()}}
Only phyloseq object will return value because information of sample is needed}

\item{...}{: other args passed on to \code{\link[=track_wkflow]{track_wkflow()}}}
}
\value{
A list of dataframe. cf \code{\link[=track_wkflow]{track_wkflow()}} for more information
}
\description{
\ifelse{html}{\href{https://lifecycle.r-lib.org/articles/stages.html#experimental}{\figure{lifecycle-experimental.svg}{options: alt='[Experimental]'}}}{\strong{[Experimental]}}

Contrary to \code{\link[=track_wkflow]{track_wkflow()}}, only phyloseq object are possible.
More information are available in the manual of the function \code{\link[=track_wkflow]{track_wkflow()}}
}
\examples{
\dontshow{if (tolower(Sys.info()[["sysname"]]) != "windows") (if (getRversion() >= "3.4") withAutoprint else force)(\{ # examplesIf}
tree_A10_005 <- subset_samples(data_fungi, Tree_name == "A10-005")
track_wkflow_samples(tree_A10_005)
\dontshow{\}) # examplesIf}
}
\author{
Adrien Taudière
}

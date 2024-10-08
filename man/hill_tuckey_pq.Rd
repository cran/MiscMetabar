% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/alpha_div_test.R
\name{hill_tuckey_pq}
\alias{hill_tuckey_pq}
\title{Calculate hill number and compute Tuckey post-hoc test}
\usage{
hill_tuckey_pq(
  physeq,
  modality,
  hill_scales = c(0, 1, 2),
  silent = TRUE,
  correction_for_sample_size = TRUE
)
}
\arguments{
\item{physeq}{(required): a \code{\link[phyloseq]{phyloseq-class}} object obtained
using the \code{phyloseq} package.}

\item{modality}{(required) the variable to test}

\item{hill_scales}{(a vector of integer) The list of q values to compute
the hill number H^q. If Null, no hill number are computed. Default value
compute the Hill number 0 (Species richness), the Hill number 1
(exponential of Shannon Index) and the Hill number 2 (inverse of Simpson
Index).}

\item{silent}{(logical) If TRUE, no message are printing.}

\item{correction_for_sample_size}{(logical, default TRUE) This function
use a sqrt of the read numbers in the linear model in order to
correct for uneven sampling depth.}
}
\value{
A ggplot2 object
}
\description{
\if{html}{\out{
<a href="https://adrientaudiere.github.io/MiscMetabar/articles/Rules.html#lifecycle">
<img src="https://img.shields.io/badge/lifecycle-maturing-blue" alt="lifecycle-maturing"></a>
}}


Note that, by default, this function use a sqrt of the read numbers in the linear
model in order to correct for uneven sampling depth.
}
\examples{
data("GlobalPatterns", package = "phyloseq")
GlobalPatterns@sam_data[, "Soil_logical"] <-
  ifelse(GlobalPatterns@sam_data[, "SampleType"] == "Soil", "Soil", "Not Soil")
hill_tuckey_pq(GlobalPatterns, "Soil_logical")
hill_tuckey_pq(GlobalPatterns, "Soil_logical", hill_scales = 1:2)
}
\author{
Adrien Taudière
}

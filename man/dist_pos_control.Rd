% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/controls.R
\name{dist_pos_control}
\alias{dist_pos_control}
\title{Calculate ecological distance among positive controls vs
distance for all samples}
\usage{
dist_pos_control(physeq, samples_names, method = "bray")
}
\arguments{
\item{physeq}{(required): a \code{\link[phyloseq]{phyloseq-class}} object obtained
using the \code{phyloseq} package.}

\item{samples_names}{(required) a vector of names for samples with
positives controls of the same samples having the same name}

\item{method}{(default: "bray") a method to calculate
the distance, parsed to \code{\link[vegan:vegdist]{vegan::vegdist()}}. See ?vegdist for a list
of possible values.}
}
\value{
A list of two data-frames with
(i) the distance among positive controls and
(ii) the distance among all samples
}
\description{
\if{html}{\out{
<a href="https://adrientaudiere.github.io/MiscMetabar/articles/Rules.html#lifecycle">
<img src="https://img.shields.io/badge/lifecycle-experimental-orange" alt="lifecycle-experimental"></a>
}}


Compute distance among positive controls,
i.e. samples which are duplicated
to test for variation, for example in
(i) a step in the sampling,
(ii) a step in the extraction,
(iii) a step in the sequencing.
}
\examples{
data("enterotype")
sam_name_factice <- gsub("TS1_V2", "TS10_V2", sample_names(enterotype))
res_dist_cont <- dist_pos_control(enterotype, sam_name_factice)
hist(unlist(res_dist_cont$distAllSamples))
abline(
  v = mean(unlist(res_dist_cont$dist_controlontrolSamples), na.rm = TRUE),
  col = "red", lwd = 3
)
}
\author{
Adrien Taudière
}

% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/speedyseq_functions.R
\name{merge_samples2}
\alias{merge_samples2}
\alias{merge_samples2,phyloseq-method}
\alias{merge_samples2,otu_table-method}
\alias{merge_samples2,sample_data-method}
\title{Merge samples by a sample variable or factor}
\usage{
merge_samples2(
  x,
  group,
  fun_otu = sum,
  funs = list(),
  reorder = FALSE,
  default_fun = unique_or_na
)

\S4method{merge_samples2}{phyloseq}(
  x,
  group,
  fun_otu = sum,
  funs = list(),
  reorder = FALSE,
  default_fun = unique_or_na
)

\S4method{merge_samples2}{otu_table}(
  x,
  group,
  fun_otu = sum,
  reorder = FALSE,
  default_fun = unique_or_na
)

\S4method{merge_samples2}{sample_data}(
  x,
  group,
  funs = list(),
  reorder = FALSE,
  default_fun = unique_or_na
)
}
\arguments{
\item{x}{A \code{phyloseq}, \code{otu_table}, or \code{sample_data} object}

\item{group}{A sample variable or a vector of length \code{nsamples(x)} defining
the sample grouping. A vector must be supplied if x is an otu_table}

\item{fun_otu}{Function for combining abundances in the otu_table; default
is \code{sum}. Can be a formula to be converted to a function by
\code{\link[purrr:as_mapper]{purrr::as_mapper()}}}

\item{funs}{Named list of merge functions for sample variables; default is
\code{unique_or_na}}

\item{reorder}{Logical specifying whether to reorder the new (merged)
samples by name}

\item{default_fun}{Default functions if funs is not set. Per default
the function unique_or_na is used. See \code{diff_fct_diff_class()} for
a useful alternative.}
}
\value{
A new phyloseq-class, otu_table or sam_data object depending on
the class of the x param
}
\description{
\if{html}{\out{
<a href="https://adrientaudiere.github.io/MiscMetabar/articles/Rules.html#lifecycle">
<img src="https://img.shields.io/badge/lifecycle-stable-green" alt="lifecycle-stable"></a>
}}


Firstly release in the \href{https://github.com/mikemc/speedyseq/}{speedyseq} R
package by Michael R. McLaren.

This function provides an alternative to \code{phyloseq::merge_samples()} that
better handles sample variables of different types, especially categorical
sample variables. It combines the samples in \code{x} defined by the sample
variable or factor \code{group} by summing the abundances in \code{otu_table(x)} and
combines sample variables by the summary functions in \code{funs}. The default
summary function, \code{unique_or_na()}, collapses the values within a group to a
single unique value if it exists and otherwise returns NA. The new (merged)
samples are named by the values in \code{group}.
}
\examples{
data(enterotype)

# Merge samples with the same project and clinical status
ps <- enterotype
sample_data(ps) <- sample_data(ps) \%>\%
  transform(Project.ClinicalStatus = Project:ClinicalStatus)
sample_data(ps) \%>\% head()
ps0 <- merge_samples2(ps, "Project.ClinicalStatus",
  fun_otu = mean,
  funs = list(Age = mean)
)
sample_data(ps0) \%>\% head()
}
\author{
Michael R. McLaren (orcid: \href{https://orcid.org/0000-0003-1575-473X}{0000-0003-1575-473X}) modified by Adrien Taudiere
}

% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/dada_phyloseq.R
\name{filt_taxa_pq}
\alias{filt_taxa_pq}
\title{Filter taxa of a phyloseq object based on the minimum number of
sequences/samples}
\usage{
filt_taxa_pq(
  physeq,
  min_nb_seq = NULL,
  min_occurence = NULL,
  combination = "AND",
  clean_pq = TRUE
)
}
\arguments{
\item{physeq}{(required): a \code{\link[phyloseq]{phyloseq-class}} object obtained
using the \code{phyloseq} package.}

\item{min_nb_seq}{(int default NULL) minimum number of sequences by taxa.}

\item{min_occurence}{(int default NULL) minimum number of sample by taxa.}

\item{combination}{Either "AND" (default) or "OR". If set to "AND" and both
min_nb_seq and min_occurence are not NULL, the taxa must match the two
condition to passe the filter. If set to "OR", taxa matching only one
condition are kept.}

\item{clean_pq}{(logical)
If set to TRUE, empty samples and empty taxa (ASV, OTU) are discarded
after filtering.}
}
\value{
a new phyloseq object
}
\description{
\if{html}{\out{
<a href="https://adrientaudiere.github.io/MiscMetabar/articles/Rules.html#lifecycle">
<img src="https://img.shields.io/badge/lifecycle-experimental-orange" alt="lifecycle-experimental"></a>
}}


Basically a wraper of \code{\link[=subset_taxa_pq]{subset_taxa_pq()}}.
}
\examples{
filt_taxa_pq(data_fungi, min_nb_seq = 20)
filt_taxa_pq(data_fungi, min_occurence = 2)
filt_taxa_pq(data_fungi,
  min_occurence = 2,
  min_nb_seq = 10, clean_pq = FALSE
)
filt_taxa_pq(data_fungi,
  min_occurence = 2,
  min_nb_seq = 10,
  combination = "OR"
)
}
\author{
Adrien Taudière
}

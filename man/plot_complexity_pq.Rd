% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plot_functions.R
\name{plot_complexity_pq}
\alias{plot_complexity_pq}
\title{Plot kmer complexity of references sequences of a phyloseq object}
\usage{
plot_complexity_pq(
  physeq,
  kmer_size = 2,
  window = NULL,
  by = 5,
  bins = 100,
  aggregate = FALSE,
  vline_random_kmer = TRUE,
  ...
)
}
\arguments{
\item{physeq}{(required): a \code{\link[phyloseq]{phyloseq-class}} object obtained
using the \code{phyloseq} package.}

\item{kmer_size}{int (default 2) The size of the kmers
(or "oligonucleotides" or "words") to use.}

\item{window}{(int, default NULL) The width in nucleotides of the moving
window. If NULL the whole sequence is used.}

\item{by}{(int, default 5) The step size in nucleotides between each moving
window tested.}

\item{bins}{(int, default 100). The number of bins to use for the histogram.}

\item{aggregate}{(logical, default FALSE) If TRUE, compute an aggregate quality profile
for all samples}

\item{vline_random_kmer}{(logical, default TRUE) If TRUE, add a vertical line
at the value for random kmer (equal to 4^kmerSize))}

\item{...}{Arguments passed on to geom_histogram.}
}
\value{
A ggplot2 object
}
\description{
\if{html}{\out{
<a href="https://adrientaudiere.github.io/MiscMetabar/articles/Rules.html#lifecycle">
<img src="https://img.shields.io/badge/lifecycle-experimental-orange" alt="lifecycle-experimental"></a>
}}


Basically a wrapper of \code{\link[dada2:seqComplexity]{dada2::seqComplexity()}}
}
\details{
This function is mainly a wrapper of the work of others.
Please make a reference to \code{\link[dada2:seqComplexity]{dada2::seqComplexity()}}
}
\examples{
plot_complexity_pq(subset_samples(data_fungi_mini, Height == "High"),
  vline_random_kmer = FALSE
)
# plot_complexity_pq(subset_samples(data_fungi_mini, Height == "Low"),
#  aggregate = FALSE, kmer_size = 4
# )
# plot_complexity_pq(subset_samples(data_fungi, Height == "Low"),
#  kmer_size = 4)

}
\seealso{
\code{\link[dada2:seqComplexity]{dada2::seqComplexity()}}, \code{\link[dada2:plotComplexity]{dada2::plotComplexity()}}
}
\author{
Adrien Taudière
}

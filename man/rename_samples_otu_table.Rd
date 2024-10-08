% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/targets_misc.R
\name{rename_samples_otu_table}
\alias{rename_samples_otu_table}
\title{Rename samples of an otu_table}
\usage{
rename_samples_otu_table(physeq, names_of_samples)
}
\arguments{
\item{physeq}{(required): a \code{\link[phyloseq]{phyloseq-class}} object obtained
using the \code{phyloseq} package.}

\item{names_of_samples}{(required) The new names of the samples}
}
\value{
the matrix with new colnames (or rownames if \code{taxa_are_rows} is true)
}
\description{
\if{html}{\out{
<a href="https://adrientaudiere.github.io/MiscMetabar/articles/Rules.html#lifecycle">
<img src="https://img.shields.io/badge/lifecycle-experimental-orange" alt="lifecycle-experimental"></a>
}}


Useful for targets bioinformatic pipeline.
}
\examples{

rename_samples_otu_table(data_fungi, as.character(seq_along(sample_names(data_fungi))))

}
\author{
Adrien Taudière
}

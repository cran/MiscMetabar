% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/dada_phyloseq.R
\name{subset_samples_pq}
\alias{subset_samples_pq}
\title{Subset samples using a conditional boolean vector.}
\usage{
subset_samples_pq(physeq, condition)
}
\arguments{
\item{physeq}{(required): a \code{\link[phyloseq]{phyloseq-class}} object obtained
using the \code{phyloseq} package.}

\item{condition}{A boolean vector to subset samples. Length must fit
the number of samples}
}
\value{
a new phyloseq object
}
\description{
\if{html}{\out{
<a href="https://adrientaudiere.github.io/MiscMetabar/articles/Rules.html#lifecycle">
<img src="https://img.shields.io/badge/lifecycle-experimental-orange" alt="lifecycle-experimental"></a>
}}


The main objective of this function is to complete the
\code{\link[phyloseq:subset_samples-methods]{phyloseq::subset_samples()}} function by propose a more easy
(but more prone to error) way of subset_samples.
It replace the subsetting expression which used the name of the variable
in the sam_data by a boolean vector.

Warnings: you must verify the result of this function as the
boolean condition must match the order of samples in the \code{sam_data}
slot.

This function is robust when you use the sam_data slot of the phyloseq object
used in physeq (see examples)
}
\examples{

cond_samp <- grepl("A1", data_fungi@sam_data[["Sample_names"]])
subset_samples_pq(data_fungi, cond_samp)

subset_samples_pq(data_fungi, data_fungi@sam_data[["Height"]] == "Low")

}
\author{
Adrien Taudière
}

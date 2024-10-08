% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/miscellanous.R
\name{simplify_taxo}
\alias{simplify_taxo}
\title{Simplify taxonomy by removing some unused characters such as "k__"}
\usage{
simplify_taxo(physeq, remove_space = TRUE)
}
\arguments{
\item{physeq}{(required): a \code{\link[phyloseq]{phyloseq-class}} object obtained
using the \code{phyloseq} package.}

\item{remove_space}{(logical; default TRUE): do we remove space?}
}
\value{
A  \code{\link[phyloseq]{phyloseq-class}} object with simplified taxonomy
}
\description{
\if{html}{\out{
<a href="https://adrientaudiere.github.io/MiscMetabar/articles/Rules.html#lifecycle">
<img src="https://img.shields.io/badge/lifecycle-maturing-blue" alt="lifecycle-maturing"></a>
}}


Internally used in \code{\link[=clean_pq]{clean_pq()}}
}
\author{
Adrien Taudière
}

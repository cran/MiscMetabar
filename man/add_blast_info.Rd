% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/blast.R
\name{add_blast_info}
\alias{add_blast_info}
\title{Add information from \code{\link[=blast_pq]{blast_pq()}} to the \code{tax_table} slot of a \emph{phyloseq} object}
\usage{
add_blast_info(physeq, fasta_for_db, silent = FALSE, ...)
}
\arguments{
\item{physeq}{(required): a \code{\link[phyloseq]{phyloseq-class}} object obtained
using the \code{phyloseq} package.}

\item{fasta_for_db}{path to a fasta file to make the blast database}

\item{silent}{(logical) If true, no message are printing.}

\item{...}{Other arguments passed on to \code{\link[=blast_pq]{blast_pq()}} function.}
}
\value{
A new \code{\link[phyloseq]{phyloseq-class}} object with more information in tax_table based on a
blast on a given database
}
\description{
\if{html}{\out{
<a href="https://adrientaudiere.github.io/MiscMetabar/articles/Rules.html#lifecycle">
<img src="https://img.shields.io/badge/lifecycle-experimental-orange" alt="lifecycle-experimental"></a>
}}


Basically a wrapper of \code{\link[=blast_pq]{blast_pq()}} with option \code{unique_per_seq = TRUE} and
\code{score_filter = FALSE}.

Add the information to the taxtable
}
\author{
Adrien Taudière
}

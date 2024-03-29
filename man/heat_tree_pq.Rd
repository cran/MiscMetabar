% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plot_functions.R
\name{heat_tree_pq}
\alias{heat_tree_pq}
\title{Heat tree from \code{metacoder} package using \code{tax_table} slot}
\usage{
heat_tree_pq(physeq, taxonomic_level = NULL, ...)
}
\arguments{
\item{physeq}{(required): a \code{\link{phyloseq-class}} object obtained
using the \code{phyloseq} package.}

\item{taxonomic_level}{(default: NULL): a vector of selected
taxonomic level using
their column numbers (e.g. taxonomic_level = 1:7)}

\item{...}{Arguments passed on to \code{\link[metacoder]{heat_tree}}}
}
\value{
A plot
}
\description{
\ifelse{html}{\href{https://lifecycle.r-lib.org/articles/stages.html#maturing}{\figure{lifecycle-maturing.svg}{options: alt='[Maturing]'}}}{\strong{[Maturing]}}

Note that the number of ASV is store under the name \code{n_obs}
and the number of sequences under the name \code{nb_sequences}
}
\examples{
\donttest{
if (!requireNamespace("metacoder")) {
  data("GlobalPatterns", package = "phyloseq")

  GPsubset <- subset_taxa(
    GlobalPatterns,
    GlobalPatterns@tax_table[, 1] == "Bacteria"
  )

  GPsubset <- subset_taxa(
    GPsubset,
    rowSums(GPsubset@otu_table) > 5000
  )

  GPsubset <- subset_taxa(
    GPsubset,
    rowSums(is.na(GPsubset@tax_table)) == 0
  )

  heat_tree_pq(GPsubset,
    node_size = n_obs,
    node_color = n_obs,
    node_label = taxon_names,
    tree_label = taxon_names,
    node_size_trans = "log10 area"
  )

  heat_tree_pq(GPsubset,
    node_size = nb_sequences,
    node_color = n_obs,
    node_label = taxon_names,
    tree_label = taxon_names,
    node_size_trans = "log10 area"
  )
}
}
}
\author{
Adrien Taudière
}

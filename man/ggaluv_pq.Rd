% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plot_functions.R
\name{ggaluv_pq}
\alias{ggaluv_pq}
\title{Alluvial plot for taxonomy and samples factor vizualisation}
\usage{
ggaluv_pq(
  physeq,
  taxa_ranks = c("Phylum", "Class", "Order", "Family"),
  wrap_factor = NULL,
  by_sample = FALSE,
  rarefy_by_sample = FALSE,
  fact = NULL,
  type = "nb_seq",
  width = 1.2,
  min.size = 3,
  na_remove = FALSE,
  use_ggfittext = FALSE,
  use_geom_label = FALSE,
  size_lab = 2,
  ...
)
}
\arguments{
\item{physeq}{(required): a \code{\link[phyloseq]{phyloseq-class}} object obtained
using the \code{phyloseq} package.}

\item{taxa_ranks}{A vector of taxonomic ranks. For examples c("Family","Genus").
If taxa ranks is not set
(default value = c("Phylum", "Class", "Order", "Family")).}

\item{wrap_factor}{A name to determine
which samples to merge using \code{\link[=merge_samples2]{merge_samples2()}} function.
Need to be in \code{physeq@sam_data}.
Need to be use when you want to wrap by factor the final plot
with the number of taxa (type="nb_taxa")}

\item{by_sample}{(logical) If FALSE (default), sample information is not taking
into account, so the taxonomy is studied globally. If fact is not NULL, by_sample
is automatically set to TRUE.}

\item{rarefy_by_sample}{(logical, default FALSE) If TRUE, rarefy
samples using \code{\link[phyloseq:rarefy_even_depth]{phyloseq::rarefy_even_depth()}} function.}

\item{fact}{(required) Name of the factor in \code{physeq@sam_data} used to plot  the last column}

\item{type}{If "nb_seq" (default), the number of sequences is
used in plot. If "nb_taxa", the number of ASV is plotted.}

\item{width}{(passed on to \code{\link[ggalluvial:geom_flow]{ggalluvial::geom_flow()}}) the width of each stratum,
as a proportion of the distance between axes. Defaults to 1/3.}

\item{min.size}{(passed on to \code{\link[ggfittext:geom_fit_text]{ggfittext::geom_fit_text()}}) Minimum font size,
in points. Text that would need to be shrunk below this size to fit the box will
be hidden. Defaults to 4 pt.}

\item{na_remove}{(logical, default FALSE) If set to TRUE, remove samples with
NA in the variables set in formula.}

\item{use_ggfittext}{(logical, default FALSE) Do we use ggfittext to plot labels?}

\item{use_geom_label}{(logical, default FALSE) Do we use geom_label to plot labels?}

\item{size_lab}{Size for label if use_ggfittext is FALSE}

\item{...}{Other arguments passed on to \code{\link[ggalluvial:geom_flow]{ggalluvial::geom_flow()}} function.}
}
\value{
A ggplot object
}
\description{
\if{html}{\out{
<a href="https://adrientaudiere.github.io/MiscMetabar/articles/Rules.html#lifecycle">
<img src="https://img.shields.io/badge/lifecycle-experimental-orange" alt="lifecycle-experimental"></a>
}}


Basically a wrapper of \href{https://corybrunson.github.io/ggalluvial/index.html}{ggalluvial}
package
}
\details{
This function is mainly a wrapper of the work of others.
Please make a reference to \code{ggalluvial} package if you
use this function.
}
\examples{
if (requireNamespace("ggalluvial")) {
  ggaluv_pq(data_fungi_mini)
}
\donttest{
if (requireNamespace("ggalluvial")) {
  ggaluv_pq(data_fungi_mini, type = "nb_taxa")

  ggaluv_pq(data_fungi_mini, wrap_factor = "Height", by_sample = TRUE, type = "nb_taxa") +
    facet_wrap("Height")

  ggaluv_pq(data_fungi_mini,
    width = 0.9, min.size = 10,
    type = "nb_taxa", taxa_ranks = c("Phylum", "Class", "Order", "Family", "Genus")
  ) +
    coord_flip() + scale_x_discrete(limits = rev)
}
}
}
\seealso{
\code{\link[=sankey_pq]{sankey_pq()}}
}
\author{
Adrien Taudière
}

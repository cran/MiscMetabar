% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plot_functions.R
\name{circle_pq}
\alias{circle_pq}
\title{Plot OTU circle for \code{\link[phyloseq]{phyloseq-class}} object}
\usage{
circle_pq(
  physeq = NULL,
  fact = NULL,
  taxa = "Order",
  nproc = 1,
  add_nb_seq = TRUE,
  rarefy = FALSE,
  min_prop_tax = 0.01,
  min_prop_mod = 0.1,
  gap_degree = NULL,
  start_degree = NULL,
  row_col = NULL,
  grid_col = NULL,
  log10trans = FALSE,
  ...
)
}
\arguments{
\item{physeq}{(required): a \code{\link[phyloseq]{phyloseq-class}} object obtained
using the \code{phyloseq} package.}

\item{fact}{(required) Name of the factor to cluster samples by modalities.
Need to be in \code{physeq@sam_data}.}

\item{taxa}{(default: 'Order') Name of the taxonomic rank of interest}

\item{nproc}{(default 1)
Set to number of cpus/processors to use for parallelization}

\item{add_nb_seq}{(default: TRUE) Represent the number of sequences or the
number of OTUs (add_nb_seq = FALSE)}

\item{rarefy}{(logical) Does each samples modalities need to be rarefy in
order to compare them with the same amount of sequences?}

\item{min_prop_tax}{(default: 0.01) The minimum proportion for taxa to be
plotted}

\item{min_prop_mod}{(default: 0.1) The minimum proportion for modalities
to be plotted}

\item{gap_degree}{Gap between two neighbour sectors.
It can be a single value or a vector. If it is a vector,
the first value corresponds to the gap after the first
sector.}

\item{start_degree}{The starting degree from which the circle begins to
draw. Note this degree is measured in the standard polar coordinate
which means it is always reverse-clockwise.}

\item{row_col}{Color vector for row}

\item{grid_col}{Grid colors which correspond to sectors. The length of the
vector should be either 1 or the number of sectors.
It's preferred that grid_col is a named vector of which names
correspond to sectors. If it is not a named vector, the
order of grid_col corresponds to order of sectors.}

\item{log10trans}{(logical) Should sequence be log10 transformed
(more precisely by log10(1+x))?}

\item{...}{Additional arguments passed on to
\code{\link[circlize]{chordDiagram}} or \code{\link[circlize]{circos.par}}}
}
\value{
A \code{\link[circlize]{chordDiagram}} plot representing the
distribution of OTUs or sequences in the different modalities of the factor
fact
}
\description{
\if{html}{\out{
<a href="https://adrientaudiere.github.io/MiscMetabar/articles/Rules.html#lifecycle">
<img src="https://img.shields.io/badge/lifecycle-maturing-blue" alt="lifecycle-maturing"></a>
}}


Graphical representation of distribution of taxa across a factor.
}
\examples{
\donttest{
if (requireNamespace("pbapply")) {
  data("GlobalPatterns", package = "phyloseq")
  GP <- subset_taxa(GlobalPatterns, GlobalPatterns@tax_table[, 1] == "Archaea")
  circle_pq(GP, "SampleType")
  circle_pq(GP, "SampleType", add_nb_seq = FALSE)
  circle_pq(GP, "SampleType", taxa = "Class")
}
}
}
\seealso{
\code{\link[circlize]{chordDiagram}}

\code{\link[circlize]{circos.par}}
}
\author{
Adrien Taudière
}

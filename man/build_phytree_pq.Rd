% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/dada_phyloseq.R
\name{build_phytree_pq}
\alias{build_phytree_pq}
\title{Build phylogenetic trees from refseq slot of a phyloseq object}
\usage{
build_phytree_pq(
  physeq,
  nb_bootstrap = 0,
  model = "GTR",
  optInv = TRUE,
  optGamma = TRUE,
  rearrangement = "NNI",
  control = phangorn::pml.control(trace = 0),
  optNni = TRUE,
  multicore = FALSE,
  ...
)
}
\arguments{
\item{physeq}{(required): a \code{\link[phyloseq]{phyloseq-class}} object obtained
using the \code{phyloseq} package.}

\item{nb_bootstrap}{(default 0): If a positive number is set,
the function also build 3 bootstrapped trees using \code{nb_bootstrap}
bootstrap samples}

\item{model}{allows to choose an amino acid models or nucleotide model,
see \code{\link[phangorn:pml]{phangorn::optim.pml()}} for more details}

\item{optInv}{Logical value indicating whether topology gets optimized
(NNI). See \code{\link[phangorn:pml]{phangorn::optim.pml()}} for more details}

\item{optGamma}{Logical value indicating whether gamma rate parameter gets
optimized. See \code{\link[phangorn:pml]{phangorn::optim.pml()}} for more details}

\item{rearrangement}{type of tree tree rearrangements to perform, one of
"NNI", "stochastic" or "ratchet"
see \code{\link[phangorn:pml]{phangorn::optim.pml()}} for more details}

\item{control}{A list of parameters for controlling the fitting process.
see \code{\link[phangorn:pml]{phangorn::optim.pml()}} for more details}

\item{optNni}{Logical value indicating whether topology gets optimized (NNI).
see \code{\link[phangorn:pml]{phangorn::optim.pml()}} for more details}

\item{multicore}{(logical) whether models should estimated in parallel.
see \code{\link[phangorn:bootstrap.pml]{phangorn::bootstrap.pml()}} for more details}

\item{...}{Other params for be passed on to
\code{\link[phangorn:pml]{phangorn::optim.pml()}} function}
}
\value{
A list of phylogenetic tree
}
\description{
\if{html}{\out{
<a href="https://adrientaudiere.github.io/MiscMetabar/articles/Rules.html#lifecycle">
<img src="https://img.shields.io/badge/lifecycle-experimental-orange" alt="lifecycle-experimental"></a>
}}


This function build tree phylogenetic tree and if nb_bootstrap is
set, it build also the 3 corresponding bootstrapped tree.

Default parameters are based on \doi{doi:10.12688/f1000research.8986.2}
and phangorn vignette \href{https://klausvigo.github.io/phangorn/articles/Trees.html}{Estimating phylogenetic trees with phangorn}. You should understand your data, especially the markers,
before using this function.

Note that phylogenetic reconstruction with markers used for metabarcoding are
not robust. You must verify the robustness of your phylogenetic tree using
taxonomic classification (see vignette \href{https://adrientaudiere.github.io/MiscMetabar/articles/tree_visualization.html}{Tree visualization}) and bootstrap or multi-tree visualization
}
\details{
This function is mainly a wrapper of the work of others.
Please make a reference to \code{phangorn} package if you
use this function.
}
\examples{
\dontshow{if (tolower(Sys.info()[["sysname"]]) != "windows") (if (getRversion() >= "3.4") withAutoprint else force)(\{ # examplesIf}
\donttest{
if (requireNamespace("phangorn")) {
  set.seed(22)
  df <- subset_taxa_pq(data_fungi_mini, taxa_sums(data_fungi_mini) > 9000)
  df_tree <- build_phytree_pq(df, nb_bootstrap = 2)
  plot(df_tree$UPGMA)
  phangorn::plotBS(df_tree$UPGMA, df_tree$UPGMA_bs, main = "UPGMA")
  plot(df_tree$NJ, "unrooted")
  plot(df_tree$ML)

  phangorn::plotBS(df_tree$ML$tree, df_tree$ML_bs, p = 20, frame = "circle")
  phangorn::plotBS(
    df_tree$ML$tree,
    df_tree$ML_bs,
    p = 20,
    frame = "circle",
    method = "TBE"
  )
  plot(phangorn::consensusNet(df_tree$ML_bs))
  plot(phangorn::consensusNet(df_tree$NJ_bs))
  ps_tree <- merge_phyloseq(df, df_tree$ML$tree)
}
}
\dontshow{\}) # examplesIf}
}
\author{
Adrien Taudière
}

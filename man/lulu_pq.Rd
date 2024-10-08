% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/dada_phyloseq.R
\name{lulu_pq}
\alias{lulu_pq}
\title{Lulu reclustering of class \code{physeq}}
\usage{
lulu_pq(
  physeq,
  nproc = 1,
  id = 0.84,
  vsearchpath = "vsearch",
  verbose = FALSE,
  clean_pq = FALSE,
  keep_temporary_files = FALSE,
  ...
)
}
\arguments{
\item{physeq}{(required): a \code{\link[phyloseq]{phyloseq-class}} object obtained
using the \code{phyloseq} package.}

\item{nproc}{(default 1)
Set to number of cpus/processors to use for the clustering}

\item{id}{(default: 0.84) id for --usearch_global.}

\item{vsearchpath}{(default: vsearch) path to vsearch.}

\item{verbose}{(logical) if true, print some additional messages.}

\item{clean_pq}{(logical) if true, empty samples and empty ASV are discarded
before clustering.}

\item{keep_temporary_files}{(logical, default: FALSE) Do we keep temporary files}

\item{...}{Others args for function \code{\link[=lulu]{lulu()}}}
}
\value{
a list of for object
\itemize{
\item "new_physeq": The new phyloseq object (class physeq)
\item "discrepancy_vector": A vector of discrepancy showing for each taxonomic
level the proportion of identic value before and after lulu reclustering.
A value of 0.6 stands for 60\% of ASV before re-clustering have
identical value after re-clustering. In other word, 40\% of ASV are assigned
to a different taxonomic
value. NA value are not counted as discrepancy.
\item "res_lulu": A list of the result from the lulu function
\item "merged_ASV": the data.frame used to merged ASV
}
}
\description{
\if{html}{\out{
<a href="https://adrientaudiere.github.io/MiscMetabar/articles/Rules.html#lifecycle">
<img src="https://img.shields.io/badge/lifecycle-experimental-orange" alt="lifecycle-experimental"></a>
}}


See https://www.nature.com/articles/s41467-017-01312-x for more information
on the method.
}
\details{
The version of LULU is a fork of Adrien Taudière (\url{https://github.com/adrientaudiere/lulu})
from \url{https://github.com/tobiasgf/lulu}
}
\examples{
\dontshow{if (MiscMetabar::is_vsearch_installed()) (if (getRversion() >= "3.4") withAutoprint else force)(\{ # examplesIf}
\donttest{
lulu_pq(data_fungi_sp_known)
}
\dontshow{\}) # examplesIf}
}
\references{
\itemize{
\item LULU : \url{https://github.com/adrientaudiere/lulu}
forked from \url{https://github.com/tobiasgf/lulu}.
\item VSEARCH can be downloaded from
\url{https://github.com/torognes/vsearch}.
}
}
\seealso{
\code{\link[=mumu_pq]{mumu_pq()}}
}
\author{
Tobias Guldberg Frøslev \email{tobiasgf@snm.ku.dk}
& Adrien Taudière \email{adrien.taudiere@zaclys.net}
}

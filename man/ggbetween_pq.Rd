% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plot_functions.R
\name{ggbetween_pq}
\alias{ggbetween_pq}
\title{Box/Violin plots for between-subjects comparisons of Hill Number}
\usage{
ggbetween_pq(physeq, variable, one_plot = FALSE, rarefy_by_sample = FALSE, ...)
}
\arguments{
\item{physeq}{(required): a \code{\link{phyloseq-class}} object obtained
using the \code{phyloseq} package.}

\item{variable}{(required): The variable to test. Must be present in
the \code{sam_data} slot of the physeq object.}

\item{one_plot}{(logical, default FALSE) If TRUE, return a unique
plot with the three plot inside using the patchwork package.}

\item{rarefy_by_sample}{(logical, default FALSE) If TRUE, rarefy
samples using \code{\link[phyloseq:rarefy_even_depth]{phyloseq::rarefy_even_depth()}} function}

\item{...}{Other arguments passed on to \code{\link[ggstatsplot:ggbetweenstats]{ggstatsplot::ggbetweenstats()}} function.}
}
\value{
Either an unique ggplot2 object (if one_plot is TRUE) or
a list of 3 ggplot2 plot:
\itemize{
\item plot_Hill_0 : the ggbetweenstats of Hill number 0 (= species richness)
against the variable
\item plot_Hill_1 : the ggbetweenstats of Hill number 1 (= Shannon index)
against the variable
\item plot_Hill_2 : the ggbetweenstats of Hill number 2 (= Simpson index)
against the variable
}
}
\description{
\ifelse{html}{\href{https://lifecycle.r-lib.org/articles/stages.html#experimental}{\figure{lifecycle-experimental.svg}{options: alt='[Experimental]'}}}{\strong{[Experimental]}}

Note that contrary to \code{\link[=hill_pq]{hill_pq()}}, this function does not take into
account for difference in the number of sequences per samples/modalities.
You may use rarefy_by_sample = TRUE if the mean number of sequences per
samples differs among modalities.

Basically a wrapper of function \code{\link[ggstatsplot:ggbetweenstats]{ggstatsplot::ggbetweenstats()}} for
object of class phyloseq
}
\details{
This function is mainly a wrapper of the work of others.
Please make a reference to \code{ggstatsplot::ggbetweenstats()} if you
use this function.
}
\examples{
\donttest{
p <- ggbetween_pq(data_fungi, variable = "Time", p.adjust.method = "BH")
p[[1]]
ggbetween_pq(data_fungi, variable = "Height", one_plot = TRUE)
ggbetween_pq(data_fungi, variable = "Height", one_plot = TRUE, rarefy_by_sample = TRUE)
}
}
\author{
Adrien Taudière
}

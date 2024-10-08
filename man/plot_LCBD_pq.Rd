% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/beta_div_test.R
\name{plot_LCBD_pq}
\alias{plot_LCBD_pq}
\title{Plot and test local contributions to beta diversity (LCBD) of samples}
\usage{
plot_LCBD_pq(
  physeq,
  p_adjust_method = "BH",
  pval = 0.05,
  sam_variables = NULL,
  only_plot_significant = TRUE,
  ...
)
}
\arguments{
\item{physeq}{(required): a \code{\link[phyloseq]{phyloseq-class}} object obtained
using the \code{phyloseq} package.}

\item{p_adjust_method}{(chr, default "BH"): the method used to adjust p-value}

\item{pval}{(int, default 0.05): the value to determine the significance of
LCBD}

\item{sam_variables}{A vector of variable names present in the \code{sam_data}
slot to plot alongside the LCBD value}

\item{only_plot_significant}{(logical, default TRUE) Do we plot all LCBD
values or only the significant ones}

\item{...}{Other arguments passed on to \code{\link[adespatial:beta.div]{adespatial::beta.div()}} function}
}
\value{
A ggplot2 object build with the package patchwork
}
\description{
\if{html}{\out{
<a href="https://adrientaudiere.github.io/MiscMetabar/articles/Rules.html#lifecycle">
<img src="https://img.shields.io/badge/lifecycle-experimental-orange" alt="lifecycle-experimental"></a>
}}


A wrapper for the \code{\link[adespatial:beta.div]{adespatial::beta.div()}} function in the case of \code{physeq}
object.
}
\details{
This function is mainly a wrapper of the work of others.
Please make a reference to \code{vegan::beta.div()} if you
use this function.
}
\examples{
data(data_fungi)
if (requireNamespace("adespatial")) {
  plot_LCBD_pq(data_fungi_mini,
    nperm = 100, only_plot_significant = FALSE,
    pval = 0.2
  )
}
\donttest{
if (requireNamespace("adespatial")) {
  plot_LCBD_pq(data_fungi_mini,
    nperm = 100, only_plot_significant = TRUE,
    pval = 0.2
  )
  if (requireNamespace("patchwork")) {
    plot_LCBD_pq(data_fungi_mini,
      nperm = 100, only_plot_significant = FALSE,
      sam_variables = c("Time", "Height")
    )
    plot_LCBD_pq(data_fungi_mini,
      nperm = 100, only_plot_significant = TRUE, pval = 0.2,
      sam_variables = c("Time", "Height", "Tree_name")
    ) &
      theme(
        legend.key.size = unit(0.4, "cm"),
        legend.text = element_text(size = 10),
        axis.title.x = element_text(size = 6)
      )
  }
}
}
}
\seealso{
\link{LCBD_pq}, \code{\link[adespatial:beta.div]{adespatial::beta.div()}}
}
\author{
Adrien Taudière
}

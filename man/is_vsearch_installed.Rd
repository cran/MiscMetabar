% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/miscellanous.R
\name{is_vsearch_installed}
\alias{is_vsearch_installed}
\title{Test if vsearch is installed.}
\usage{
is_vsearch_installed(path = "vsearch")
}
\arguments{
\item{path}{(default: vsearch) Path to vsearch}
}
\value{
A logical that say if vsearch is install in
}
\description{
\ifelse{html}{\href{https://lifecycle.r-lib.org/articles/stages.html#maturing}{\figure{lifecycle-maturing.svg}{options: alt='[Maturing]'}}}{\strong{[Maturing]}}

Useful for testthat and examples compilation for R CMD CHECK and
test coverage
}
\examples{
MiscMetabar::is_vsearch_installed()
}
\author{
Adrien Taudière
}

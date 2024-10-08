% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/funguild.R
\name{get_funguild_db}
\alias{get_funguild_db}
\title{Retrieve the FUNGuild database}
\usage{
get_funguild_db(db_url = "http://www.stbates.org/funguild_db_2.php")
}
\arguments{
\item{db_url}{a length 1 character string giving the URL to retrieve the database
from}
}
\value{
a \code{\link[tibble:tibble]{tibble::tibble}} containing the database, which can be passed
to the \code{db} argument of \code{\link[=funguild_assign]{funguild_assign()}}
}
\description{
\if{html}{\out{
<a href="https://adrientaudiere.github.io/MiscMetabar/articles/Rules.html#lifecycle">
<img src="https://img.shields.io/badge/lifecycle-stable-green" alt="lifecycle-stable"></a>
}}


The original function and documentation was written by Brendan Furneaux
in the \href{https://github.com/brendanf/FUNGuildR/}{FUNGuildR} package.

Please cite this publication (\doi{10.1016/j.funeco.2015.06.006}).
}
\references{
Nguyen NH, Song Z, Bates ST, Branco S, Tedersoo L, Menke J,
Schilling JS, Kennedy PG. 2016. \emph{FUNGuild: An open annotation tool for
parsing fungal community datasets by ecological guild}. Fungal Ecology
20:241-248.
}
\author{
Brendan Furneaux (orcid: \href{https://orcid.org/0000-0003-3522-7363}{0000-0003-3522-7363}),
modified by Adrien Taudière
}

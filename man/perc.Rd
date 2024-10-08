% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/miscellanous.R
\name{perc}
\alias{perc}
\title{Convert a value (or a fraction x/y) in percentage}
\usage{
perc(x, y = NULL, accuracy = 0, add_symbol = FALSE)
}
\arguments{
\item{x}{(required): value}

\item{y}{if y is set, compute the division of x by y}

\item{accuracy}{number of digits (number of digits after zero)}

\item{add_symbol}{if set to TRUE add the \% symbol to the value}
}
\value{
The percentage value (number or character if add_symbol
is set to TRUE)
}
\description{
\if{html}{\out{
<a href="https://adrientaudiere.github.io/MiscMetabar/articles/Rules.html#lifecycle">
<img src="https://img.shields.io/badge/lifecycle-maturing-blue" alt="lifecycle-maturing"></a>
}}


Mostly for internal use.
}
\author{
Adrien Taudière
}

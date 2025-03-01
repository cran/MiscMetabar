% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/vsearch.R
\name{assign_vsearch_lca}
\alias{assign_vsearch_lca}
\title{Assign taxonomy using LCA \emph{à la} \href{https://github.com/frederic-mahe/stampa}{stampa}}
\usage{
assign_vsearch_lca(
  physeq = NULL,
  ref_fasta = NULL,
  seq2search = NULL,
  behavior = c("return_matrix", "add_to_phyloseq", "return_cmd"),
  vsearchpath = "vsearch",
  clean_pq = TRUE,
  taxa_ranks = c("Kingdom", "Phylum", "Class", "Order", "Family", "Genus", "Species"),
  nproc = 1,
  suffix = "",
  id = 0.5,
  lca_cutoff = 1,
  maxrejects = 32,
  top_hits_only = TRUE,
  maxaccepts = 0,
  keep_temporary_files = FALSE,
  verbose = TRUE,
  temporary_fasta_file = "temp.fasta",
  cmd_args = "",
  too_few = "align_start"
)
}
\arguments{
\item{physeq}{(required): a \code{\link[phyloseq]{phyloseq-class}} object obtained
using the \code{phyloseq} package.}

\item{ref_fasta}{(required) A link to a database in vsearch format
The reference database must contain taxonomic information in the header of
each sequence in the form of a string starting with ";tax=" and followed
by a comma-separated list of up to nine taxonomic identifiers. Each taxonomic
identifier must start with an indication of the rank by one of the letters d
(for domain) k (kingdom), p (phylum), c (class), o (order), f (family),
g (genus), s (species), or t (strain). The letter is followed by a colon
(:) and the name of that rank. Commas and semicolons are not allowed in
the name of the rank. Non-ascii characters should be avoided in the names.

Example:

\>X80725_S000004313;tax=d:Bacteria,p:Proteobacteria,c:Gammaproteobacteria,o:Enterobacteriales,f:Enterobacteriaceae,g:Escherichia/Shigella,s:Escherichia_coli,t:str._K-12_substr._MG1655}

\item{seq2search}{A DNAStringSet object of sequences to search for. Replace
the physeq object.}

\item{behavior}{Either "return_matrix" (default), "return_cmd",
or "add_to_phyloseq":
\itemize{
\item "return_matrix" return a list of two matrix with taxonomic value in the
first element of the list and bootstrap value in the second one.
\item "return_cmd" return the command to run without running it.
\item "add_to_phyloseq" return a phyloseq object with amended slot \verb{@taxtable}.
Only available if using physeq input and not seq2search input.
}}

\item{vsearchpath}{(default: "vsearch") path to vsearch}

\item{clean_pq}{(logical, default TRUE)
If set to TRUE, empty samples and empty ASV are discarded
before clustering.}

\item{taxa_ranks}{A list with the name of the taxonomic rank present in
ref_fasta}

\item{nproc}{(int, default: 1)
Set to number of cpus/processors to use}

\item{suffix}{(character) The suffix to name the new columns.
If set to "" (the default), the taxa_ranks algorithm is used
without suffix.}

\item{id}{(Float [0:1] default 0.5). Default value is based on
\href{https://github.com/frederic-mahe/stampa}{stampa}.
See Vsearch Manual for parameter \code{--id}}

\item{lca_cutoff}{(int, default 1). Fraction of matching hits
required for the last common ancestor (LCA) output. For example, a value
of 0.9 imply that if less than 10\% of assigned species are not congruent
the taxonomy is filled.
Default value is based on \href{https://github.com/frederic-mahe/stampa}{stampa}.
See Vsearch Manual for parameter \code{--lca_cutoff}

Text from vsearch manual :
"Adjust the fraction of matching hits required for the last
common ancestor (LCA) output with the --lcaout option during searches.
The default value is 1.0 which requires all hits to match at each taxonomic
rank for that rank to be included. If a lower cutoff value is used,
e.g. 0.95, a small fraction of non-matching hits are allowed while that
rank will still be reported. The argument to this option must be larger
than 0.5, but not larger than 1.0"}

\item{maxrejects}{(int, default: 32)
Maximum number of non-matching target sequences to consider before
stopping the search for a given query.
Default value is based on \href{https://github.com/frederic-mahe/stampa}{stampa}
See Vsearch Manual for parameter \code{--maxrejects}.}

\item{top_hits_only}{(Logical, default TRUE)
Only the top hits with an equally high percentage of identity between the query and
database sequence sets are written to the output. If you set top_hits_only
you may need to set a lower \code{maxaccepts} and/or \code{lca_cutoof}.
Default value is based on \href{https://github.com/frederic-mahe/stampa}{stampa}
See Vsearch Manual for parameter \code{--top_hits_only}}

\item{maxaccepts}{(int, default: 0)
Default value is based on \href{https://github.com/frederic-mahe/stampa}{stampa}.
Maximum number of matching target sequences to accept before stopping the search
for a given query.
See Vsearch Manual for parameter \code{--maxaccepts}}

\item{keep_temporary_files}{(logical, default: FALSE) Do we keep temporary files?
\itemize{
\item temporary_fasta_file (default "temp.fasta") : the fasta file from physeq or
seq2search
\item "out_lca.txt" : see Vsearch Manual for parameter --lcaout
\item "userout.txt" : see Vsearch Manual for parameter --userout
}}

\item{verbose}{(logical). If TRUE, print additional information.}

\item{temporary_fasta_file}{Name of the temporary fasta file. Only useful
with keep_temporary_files = TRUE.}

\item{cmd_args}{Additional arguments passed on to vsearch usearch_global cmd.}

\item{too_few}{(default value "align_start") see \code{\link[tidyr:separate_wider_delim]{tidyr::separate_wider_delim()}}}
}
\value{
See param behavior
}
\description{
\if{html}{\out{
<a href="https://adrientaudiere.github.io/MiscMetabar/articles/Rules.html#lifecycle">
<img src="https://img.shields.io/badge/lifecycle-experimental-orange" alt="lifecycle-experimental"></a>
}}


Please cite \href{https://github.com/torognes/vsearch}{Vsearch} and
\href{https://github.com/frederic-mahe/stampa}{stampa} if you use this function
to assign taxonomy.
}
\details{
This function is mainly a wrapper of the work of others.
Please cite \href{https://github.com/torognes/vsearch}{vsearch} and
\href{https://github.com/frederic-mahe/stampa}{stampa}
}
\examples{
\dontshow{if (MiscMetabar::is_vsearch_installed()) (if (getRversion() >= "3.4") withAutoprint else force)(\{ # examplesIf}
\donttest{
data_fungi_mini_new <- assign_vsearch_lca(data_fungi_mini,
  ref_fasta = system.file("extdata", "mini_UNITE_fungi.fasta.gz", package = "MiscMetabar"),
  lca_cutoff = 0.9
)
}
\dontshow{\}) # examplesIf}
}
\seealso{
\code{\link[=assign_sintax]{assign_sintax()}}, \code{\link[=add_new_taxonomy_pq]{add_new_taxonomy_pq()}}
}
\author{
Adrien Taudière
}

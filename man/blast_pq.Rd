% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/blast.R
\name{blast_pq}
\alias{blast_pq}
\title{Blast all sequence of \code{refseq} slot of a \code{\link[phyloseq]{phyloseq-class}}
object against a custom database.}
\usage{
blast_pq(
  physeq,
  fasta_for_db = NULL,
  database = NULL,
  blastpath = NULL,
  id_cut = 90,
  bit_score_cut = 50,
  min_cover_cut = 50,
  e_value_cut = 1e-30,
  unique_per_seq = FALSE,
  score_filter = TRUE,
  nproc = 1,
  args_makedb = NULL,
  args_blastn = NULL,
  keep_temporary_files = FALSE
)
}
\arguments{
\item{physeq}{(required): a \code{\link[phyloseq]{phyloseq-class}} object obtained
using the \code{phyloseq} package.}

\item{fasta_for_db}{Either a DNAStringSet object or a path to a fasta
file to make the blast database.}

\item{database}{path to a blast database}

\item{blastpath}{path to blast program}

\item{id_cut}{(default: 90) cut of in identity percent to keep result}

\item{bit_score_cut}{(default: 50) cut of in bit score to keep result
The higher the bit-score, the better the sequence similarity.
The bit-score is the requires size of a sequence database in which the current
match could be found just by chance. The bit-score is a log2 scaled and
normalized raw-score. Each increase by one doubles the required database size
(2bit-score).}

\item{min_cover_cut}{(default: 50) cut of in query cover (\%) to keep result}

\item{e_value_cut}{(default: 1e-30)  cut of in e-value (\%) to keep result
The BLAST E-value is the number of expected hits of similar quality (score)
that could be found just by chance.}

\item{unique_per_seq}{(logical, default FALSE) if TRUE only return the better match
(higher \strong{bit score}) for each sequence}

\item{score_filter}{(logical, default TRUE) does results are filter by score? If
FALSE, \code{id_cut},\code{bit_score_cut}, \code{e_value_cut} and \code{min_cover_cut} are ignored}

\item{nproc}{(default: 1)
Set to number of cpus/processors to use for blast (args -num_threads
for blastn command)}

\item{args_makedb}{Additional arguments passed on to makeblastdb command}

\item{args_blastn}{Additional arguments passed on to blastn command}

\item{keep_temporary_files}{(logical, default: FALSE) Do we keep temporary files
\itemize{
\item db.fasta (refseq transformed into a database)
\item dbase list of files (output of blastn)
\item blast_result.txt the summary result of blastn using
\verb{-outfmt "6 qseqid qlen sseqid slen length pident evalue bitscore qcovs"}
\item temp.fasta if fasta_for_db was a DNAStringSet object.
}}
}
\value{
a blast table
}
\description{
\if{html}{\out{
<a href="https://adrientaudiere.github.io/MiscMetabar/articles/Rules.html#lifecycle">
<img src="https://img.shields.io/badge/lifecycle-experimental-orange" alt="lifecycle-experimental"></a>
}}


Use the blast software.
}
\seealso{
\code{\link[=blast_to_phyloseq]{blast_to_phyloseq()}} to use \code{refseq}
slot as a database
}

% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plot_functions.R
\name{ggvenn_pq}
\alias{ggvenn_pq}
\title{Venn diagram of \code{\link[phyloseq]{phyloseq-class}} object using
\code{ggVennDiagram::ggVennDiagram} function}
\usage{
ggvenn_pq(
  physeq = NULL,
  fact = NULL,
  min_nb_seq = 0,
  taxonomic_rank = NULL,
  split_by = NULL,
  add_nb_samples = TRUE,
  add_nb_seq = FALSE,
  rarefy_before_merging = FALSE,
  rarefy_after_merging = FALSE,
  return_data_for_venn = FALSE,
  ...
)
}
\arguments{
\item{physeq}{(required): a \code{\link[phyloseq]{phyloseq-class}} object obtained
using the \code{phyloseq} package.}

\item{fact}{(required): Name of the factor to cluster samples by modalities.
Need to be in \code{physeq@sam_data}.}

\item{min_nb_seq}{minimum number of sequences by OTUs by
samples to take into count this OTUs in this sample. For example,
if min_nb_seq=2,each value of 2 or less in the OTU table
will not count in the venn diagram}

\item{taxonomic_rank}{Name (or number) of a taxonomic rank
to count. If set to Null (the default) the number of OTUs is counted.}

\item{split_by}{Split into multiple plot using variable split_by.
The name of a variable must be present in \code{sam_data} slot
of the physeq object.}

\item{add_nb_samples}{(logical, default TRUE) Add the number of samples to
levels names}

\item{add_nb_seq}{(logical, default FALSE) Add the number of sequences to
levels names}

\item{rarefy_before_merging}{Rarefy each sample before merging by the
modalities of args \code{fact}. Use \code{phyloseq::rarefy_even_depth()} function}

\item{rarefy_after_merging}{Rarefy each sample after merging by the
modalities of args \code{fact}.}

\item{return_data_for_venn}{(logical, default FALSE) If TRUE, the plot is
not returned, but the resulting dataframe to plot with ggVennDiagram package
is returned.}

\item{...}{Other arguments for the \code{ggVennDiagram::ggVennDiagram} function
for ex. \code{category.names}.}
}
\value{
A \code{\link[ggplot2]{ggplot}}2 plot representing Venn diagram of
modalities of the argument \code{factor} or if split_by is set a list
of plots.
}
\description{
\if{html}{\out{
<a href="https://adrientaudiere.github.io/MiscMetabar/articles/Rules.html#lifecycle">
<img src="https://img.shields.io/badge/lifecycle-maturing-blue" alt="lifecycle-maturing"></a>
}}


Note that you can use ggplot2 function to customize the plot
for ex. \code{+ scale_fill_distiller(palette = "BuPu", direction = 1)}
and \code{+ scale_x_continuous(expand = expansion(mult = 0.5))}. See
examples.
}
\examples{
if (requireNamespace("ggVennDiagram")) {
  ggvenn_pq(data_fungi, fact = "Height")
}
\donttest{
if (requireNamespace("ggVennDiagram")) {
  ggvenn_pq(data_fungi, fact = "Height") +
    ggplot2::scale_fill_distiller(palette = "BuPu", direction = 1)
  pl <- ggvenn_pq(data_fungi, fact = "Height", split_by = "Time")
  for (i in seq_along(pl)) {
    p <- pl[[i]] +
      scale_fill_distiller(palette = "BuPu", direction = 1) +
      theme(plot.title = element_text(hjust = 0.5, size = 22))
    print(p)
  }

  data_fungi2 <- subset_samples(data_fungi, data_fungi@sam_data$Tree_name == "A10-005" |
    data_fungi@sam_data$Height \%in\% c("Low", "High"))
  ggvenn_pq(data_fungi2, fact = "Height")

  ggvenn_pq(data_fungi, fact = "Height", add_nb_seq = TRUE, set_size = 4)
  ggvenn_pq(data_fungi, fact = "Height", rarefy_before_merging = TRUE)
  ggvenn_pq(data_fungi, fact = "Height", rarefy_after_merging = TRUE) +
    scale_x_continuous(expand = expansion(mult = 0.5))

  # For more flexibility, you can save the dataset for more precise construction
  # with ggplot2 and ggVennDiagramm
  # (https://gaospecial.github.io/ggVennDiagram/articles/fully-customed.html)
  res_venn <- ggvenn_pq(data_fungi, fact = "Height", return_data_for_venn = TRUE)

  ggplot() +
    # 1. region count layer
    geom_polygon(aes(X, Y, group = id, fill = name),
      data = ggVennDiagram::venn_regionedge(res_venn)
    ) +
    # 2. set edge layer
    geom_path(aes(X, Y, color = id, group = id),
      data = ggVennDiagram::venn_setedge(res_venn),
      show.legend = FALSE, linewidth = 3
    ) +
    # 3. set label layer
    geom_text(aes(X, Y, label = name),
      data = ggVennDiagram::venn_setlabel(res_venn)
    ) +
    # 4. region label layer
    geom_label(
      aes(X, Y, label = paste0(
        count, " (",
        scales::percent(count / sum(count), accuracy = 2), ")"
      )),
      data = ggVennDiagram::venn_regionlabel(res_venn)
    ) +
    theme_void()
}
}
}
\seealso{
\code{\link[=upset_pq]{upset_pq()}}
}
\author{
Adrien Taudière
}

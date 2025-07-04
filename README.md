
![R](https://img.shields.io/badge/r-%23276DC3.svg?style=for-the-badge&logo=r&logoColor=white)
<a href="https://zenodo.org/badge/latestdoi/268765075"><img src="https://zenodo.org/badge/268765075.svg" alt="DOI"></a>
[![codecov](https://codecov.io/gh/adrientaudiere/MiscMetabar/graph/badge.svg?token=NXFRSIKYC0)](https://app.codecov.io/gh/adrientaudiere/MiscMetabar)
[![Contributor
Covenant](https://img.shields.io/badge/Contributor%20Covenant-2.1-4baaaa.svg)](https://github.com/adrientaudiere/MiscMetabar/blob/master/CODE_OF_CONDUCT.md)
[![License: GPL
v3](https://img.shields.io/badge/License-GPL%20v3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)
[![CodeFactor](https://www.codefactor.io/repository/github/adrientaudiere/miscmetabar/badge/master)](https://www.codefactor.io/repository/github/adrientaudiere/miscmetabar/overview/master)
[![R-CMD-check](https://github.com/adrientaudiere/MiscMetabar/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/adrientaudiere/MiscMetabar/actions/workflows/R-CMD-check.yaml)
[![DOI](https://joss.theoj.org/papers/10.21105/joss.06038/status.svg)](https://doi.org/10.21105/joss.06038)

<!-- README.md is generated from README.Rmd. Please edit that file -->

<!-- devtools::build_readme() -->

<!-- <img src="https://repobeats.axiom.co/api/embed/82c4ce7bcc414cd0ddfeefecb32bc1fb0d51b45b.svg" title="Repobeats analytics image" alt="A panel showing some github statistics of the repositories using repobeats.axiom">-->

# MiscMetabar <a href="https://adrientaudiere.github.io/MiscMetabar/"><img src="https://adrientaudiere.github.io/MiscMetabar/reference/figures/logo.png" align="right" height="138" alt="MiscMetabar website" /></a>

See the pkgdown documentation site
[here](https://adrientaudiere.github.io/MiscMetabar/) and the [package
paper](https://doi.org/10.21105/joss.06038) in the Journal Of Open
Softwares.

Biological studies, especially in ecology, health sciences and taxonomy,
need to describe the biological composition of samples. Over the last
twenty years, (i) the development of DNA sequencing, (ii) reference
databases, (iii) high-throughput sequencing (HTS), and (iv)
bioinformatics resources have enabled the description of biological
communities through metabarcoding. Metabarcoding involves the sequencing
of millions (*meta*-) of short regions of specific DNA (*-barcoding*,
Valentini, Pompanon, and Taberlet (2009)) often from environmental
samples (eDNA, Taberlet et al. (2012)) such as human stomach contents,
lake water, soil, and air.

`MiscMetabar` aims to facilitate the **description**,
**transformation**, **exploration** and **reproducibility** of
metabarcoding analyses using R. The development of `MiscMetabar` relies
heavily on the R packages
[`dada2`](https://benjjneb.github.io/dada2/index.html) (Callahan et al.
2016), [`phyloseq`](https://joey711.github.io/phyloseq/) (McMurdie and
Holmes 2013) and [`targets`](https://books.ropensci.org/targets/)
(Landau 2021).

## Installation

A CRAN version of MiscMetabar is available.

``` r
install.packages("MiscMetabar")
```

You may need to install required bioconductor packages (dada2 and
phyloseq) first. See their installation pages. One other solution is to
use the package [pak](https://pak.r-lib.org/) to install MiscMetabar. It
comes with the benefit to check for uninstalled dependencies on your
computer (system requirements), thank you [pak](https://pak.r-lib.org/)!

``` r
pak::pkg_install("MiscMetabar")
```

You can also install the stable development version from
[GitHub](https://github.com/) with:

``` r
if (!require("devtools", quietly = TRUE)) {
  install.packages("devtools")
}
devtools::install_github("adrientaudiere/MiscMetabar")
```

You can install the unstable development version from
[GitHub](https://github.com/) with:

``` r
if (!require("devtools", quietly = TRUE)) {
  install.packages("devtools")
}
devtools::install_github("adrientaudiere/MiscMetabar", ref = "dev")
```

## Some use of MiscMetabar

See articles in the
[MiscMetabar](https://adrientaudiere.github.io/MiscMetabar/) website for
more examples.

For an introduction to metabarcoding in R, see the [state of the
field](https://adrientaudiere.github.io/MiscMetabar/articles/states_of_fields_in_R.html)
article. The [import, export and
tracking](https://adrientaudiere.github.io/MiscMetabar/articles/import_export_track.html)
article explains how to import and export `phyloseq` objects. It also
shows how to summarize useful information (number of sequences, samples
and clusters) across bioinformatic pipelines. The article [explore
data](https://adrientaudiere.github.io/MiscMetabar/articles/explore_data.html)
takes a closer look at different ways to explore samples and taxonomic
data from `phyloseq` object.

If you are interested in ecological metrics, see the articles describing
[alpha-diversity](https://adrientaudiere.github.io/MiscMetabar/articles/alpha-div.html)
and
[beta-diversity](https://adrientaudiere.github.io/MiscMetabar/articles/beta-div.html)
analysis. The article [filter taxa and
samples](https://adrientaudiere.github.io/MiscMetabar/articles/filter.html)
describes some data filtering processes using MiscMetabar and the
[reclustering](https://adrientaudiere.github.io/MiscMetabar/articles/Reclustering.html)
tutorial introduces the different way of clustering already-clustered
OTU/ASV. The article
[tengeler](https://adrientaudiere.github.io/MiscMetabar/articles/tengeler.html)
explore the dataset from Tengeler et al. (2020) using some MiscMetabar
functions.

For developers, I also wrote an article describing some [rules of
codes](https://adrientaudiere.github.io/MiscMetabar/articles/Rules.html).

### Summarize a physeq object

``` r
library("MiscMetabar")
library("phyloseq")
library("magrittr")
data("data_fungi")
summary_plot_pq(data_fungi)
```

<img src="man/figures/README-example-1.png" alt="Four rectangles represent the four component of an example phyloseq dataset. In each rectangle, some informations about the component are shown." width="100%" />

### Alpha-diversity analysis

``` r
p <- MiscMetabar::hill_pq(data_fungi, fact = "Height")
p$plot_Hill_0
#> NULL
```

``` r
p$plot_tuckey
#> NULL
```

### Beta-diversity analysis

``` r
if (!require("ggVennDiagram", quietly = TRUE)) {
  install.packages("ggVennDiagram")
}
ggvenn_pq(data_fungi, fact = "Height") +
  ggplot2::scale_fill_distiller(palette = "BuPu", direction = 1) +
  labs(title = "Share number of ASV among Height in tree")
```

<img src="man/figures/README-unnamed-chunk-8-1.png" alt="A venn diagram showing the number of shared ASV and the percentage of shared ASV between the three modality of Height (low, middle and high)." width="100%" />

### Note for non-Linux users

Some functions may not work on Windows (*e.g.* `track_wkflow()`,
`cutadapt_remove_primers()`, `krona()`, `vsearch_clustering()`, …). A
solution is to exploit docker container, for example the using the great
[rocker project](https://rocker-project.org/).

Here is a list of functions with some limitations or not working at all
on Windows OS:

- `build_phytree_pq()`
- `count_seq()`
- `cutadapt_remove_primers()`
- `krona()`
- `merge_krona()`
- `multipatt_pq()`
- `plot_tsne_pq()`
- `rotl_pq()`
- `save_pq()`
- `tax_datatable()`
- `track_wkflow()`
- `track_wkflow_samples()`
- `tsne_pq()`
- `venn_pq()`

MiscMetabar is developed under Linux and the vast majority of functions
may works on Unix system, but its functionning is not tested under iOS.

### Installation of other softwares for Debian Linux distributions

If you encounter any errors or have any questions about the installation
of these softwares, please visit their dedicated websites.

#### [blast+](https://blast.ncbi.nlm.nih.gov/doc/blast-help/downloadblastdata.html#downloadblastdata)

``` sh
sudo apt-get install ncbi-blast+
```

#### [vsearch](https://github.com/torognes/vsearch)

``` sh
sudo apt-get install vsearch
```

An other possibilities is to [install
vsearch](https://bioconda.github.io/recipes/vsearch/README.html?highlight=vsearch#package-package%20'vsearch')
with `conda`.

#### [swarm](https://github.com/torognes/swarm)

``` sh
git clone https://github.com/torognes/swarm.git
cd swarm/
make
```

An other possibilities is to [install
swarm](https://bioconda.github.io/recipes/swarm/README.html?highlight=swarm#package-package%20'swarm')
with `conda`.

#### [Mumu](https://github.com/frederic-mahe/mumu)

``` sh
git clone https://github.com/frederic-mahe/mumu.git
cd ./mumu/
make
make check
make install  # as root or sudo
```

#### [cutadapt](https://cutadapt.readthedocs.io/en/stable/)

``` sh
conda create -n cutadaptenv cutadapt
```

<div id="refs" class="references csl-bib-body hanging-indent"
entry-spacing="0">

<div id="ref-callahan2016" class="csl-entry">

Callahan, Benjamin J, Paul J McMurdie, Michael J Rosen, Andrew W Han,
Amy Jo A Johnson, and Susan P Holmes. 2016. “DADA2: High-Resolution
Sample Inference from Illumina Amplicon Data.” *Nature Methods* 13 (7):
581–83. <https://doi.org/10.1038/nmeth.3869>.

</div>

<div id="ref-landau2021" class="csl-entry">

Landau, William Michael. 2021. “The Targets r Package: A Dynamic
Make-Like Function-Oriented Pipeline Toolkit for Reproducibility and
High-Performance Computing.” *Journal of Open Source Software* 6 (57):
2959. <https://doi.org/10.21105/joss.02959>.

</div>

<div id="ref-mcmurdie2013" class="csl-entry">

McMurdie, Paul J., and Susan Holmes. 2013. “Phyloseq: An r Package for
Reproducible Interactive Analysis and Graphics of Microbiome Census
Data.” *PLoS ONE* 8 (4): e61217.
<https://doi.org/10.1371/journal.pone.0061217>.

</div>

<div id="ref-taberlet2012" class="csl-entry">

Taberlet, Pierre, Eric Coissac, Mehrdad Hajibabaei, and Loren H
Rieseberg. 2012. “Environmental Dna.” *Molecular Ecology*. Wiley Online
Library. <https://doi.org/10.1002/(issn)2637-4943>.

</div>

<div id="ref-valentini2009" class="csl-entry">

Valentini, Alice, François Pompanon, and Pierre Taberlet. 2009. “DNA
Barcoding for Ecologists.” *Trends in Ecology & Evolution* 24 (2):
110–17. <https://doi.org/10.1016/j.tree.2008.09.011>.

</div>

</div>

#' Fungal OTU in phyloseq format
#'
#' @format A physeq object containing 1420 taxa with references sequences
#' described by 14 taxonomic ranks and 185 samples described by 7 sample variables:
#' - *X*: the name of the fastq-file
#' - *Sample_names*: the names of ... the samples
#' - *Treename*: the name of an tree
#' - *Sample_id*: identifier for each sample
#' - *Height*: height of the sample in the tree
#' - *Diameter*: diameter of the trunk
#' - *Time*: time since the dead of the tree
#' @usage data(data_fungi)
"data_fungi"

#' Fungal OTU in phyloseq format
#'
#' It is a subset of the data_fungi dataset including only taxa with information
#' at the species level
#'
#' Obtain using `data_fungi_sp_known <- subset_taxa(data_fungi,
#'   !is.na(data_fungi@tax_table[,"Species"]))`
#'
#' @format A physeq object containing 651 taxa with references sequences
#' described by 14 taxonomic ranks and 185 samples described by 7 sample variables:
#' - *X*: the name of the fastq-file
#' - *Sample_names*: the names of ... the samples
#' - *Treename*: the name of an tree
#' - *Sample_id*: identifier for each sample
#' - *Height*: height of the sample in the tree
#' - *Diameter*: diameter of the trunk
#' - *Time*: time since the dead of the tree
#' @usage data(data_fungi_sp_known)
"data_fungi_sp_known"


#' Fungal OTU in phyloseq format
#'
#' It is a subset of the data_fungi dataset including only Basidiomycota
#'   with more than 5000 sequences.
#'
#' Obtain using `data_fungi_mini <- subset_taxa(data_fungi, Phylum == "Basidiomycota")`
#' and then `data_fungi_mini <-   subset_taxa_pq(data_fungi_mini, colSums(data_fungi_mini@otu_table) > 5000)`
#'
#' @format A physeq object containing 45 taxa with references sequences
#' described by 14 taxonomic ranks and 137 samples described by 7 sample variables:
#' - *X*: the name of the fastq-file
#' - *Sample_names*: the names of ... the samples
#' - *Treename*: the name of an tree
#' - *Sample_id*: identifier for each sample
#' - *Height*: height of the sample in the tree
#' - *Diameter*: diameter of the trunk
#' - *Time*: time since the dead of the tree
#' @usage data(data_fungi_mini)
#' @format A physeq object containing 45 taxa with references sequences
#' described by 14 taxonomic ranks and 137 samples described by 7 sample variables:
#' - *X*: the name of the fastq-file
#' - *Sample_names*: the names of ... the samples
#' - *Treename*: the name of an tree
#' - *Sample_id*: identifier for each sample
#' - *Height*: height of the sample in the tree
#' - *Diameter*: diameter of the trunk
#' - *Time*: time since the dead of the tree
#' @usage data(data_fungi_mini)
"data_fungi_mini"


#' This tutorial explores the dataset from Tengeler et al. (2020) available in the `mia` package.
#' obtained using `mia::makePhyloseqFromTreeSE(Tengeler2020)`
#'
#' This is a phyloseq version of the Tengeler2020 dataset.
#'
#' Tengeler2020 includes gut microbiota profiles of 27 persons with ADHD.
#' A standard bioinformatic and statistical analysis done to demonstrate that altered microbial
#' composition could be a driver of altered brain structure and function and concomitant changes
#' in the animals behavior. This was investigated by colonizing young, male,
#' germ-free C57BL/6JOlaHsd mice with microbiota from individuals with and without ADHD.
#'
#' Tengeler, A.C., Dam, S.A., Wiesmann, M. et al. Gut microbiota from persons with
#' attention-deficit/hyperactivity disorder affects the brain in mice. Microbiome 8, 44 (2020).
#' https://microbiomejournal.biomedcentral.com/articles/10.1186/s40168-020-00816-x
#' @format
#' A phyloseq object
#' @usage data(Tengeler2020_pq)
"Tengeler2020_pq"

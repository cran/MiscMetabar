skip_on_cran()
data("GlobalPatterns", package = "phyloseq")
data("enterotype")

data_fungi_low_high <- subset_samples(
  data_fungi_mini,
  Height %in% c("Low", "High")
)
data_basidio <- subset_taxa(data_fungi, Phylum == "Basidiomycota")
data_fungi_2trees <-
  subset_samples(
    data_fungi,
    data_fungi@sam_data$Tree_name %in% c("A10-005", "AD30-abm-X")
  )

GlobalPatterns@sam_data[, "Soil_logical"] <- ifelse(GlobalPatterns@sam_data[, "SampleType"] == "Soil", "Soil", "Not Soil")
GP_archae <- subset_taxa(
  GlobalPatterns,
  GlobalPatterns@tax_table[, 1] == "Archaea"
)
GP <- subset_samples_pq(
  GP_archae,
  GP_archae@sam_data$SampleType %in% c("Soil", "Skin")
)

test_that("Test one case for each deprecated functions", {
  res_deseq <- DESeq2::DESeq(phyloseq_to_deseq2(GP, ~SampleType), test = "Wald", fitType = "local")
  expect_warning(physeq_graph_test(data_fungi_mini, fact = "Tree_name"), "deprecated")
  expect_s3_class(suppressWarnings(adonis_phyloseq(data_fungi_mini, "Tree_name")), "anova")
  expect_s4_class(suppressWarnings(clean_pq(data_fungi_mini)), "phyloseq")
  expect_message(expect_warning(otu_circle(data_fungi_2trees, fact = "Tree_name", nproc = 1, add_nb_seq = FALSE), "deprecated"))
  expect_message(expect_warning(biplot_physeq(data_fungi_2trees, merge_sample_by = "Tree_name"), "deprecated"))

  testFolder <- tempdir()
  unlink(list.files(testFolder, full.names = TRUE), recursive = TRUE)
  expect_warning(write_phyloseq(enterotype, path = testFolder, silent = TRUE), "deprecated")
  expect_s4_class(suppressWarnings(read_phyloseq(testFolder, taxa_are_rows = TRUE)), "phyloseq")

  expect_warning(sankey_phyloseq(data_fungi_mini), "deprecated")
  expect_s3_class(suppressWarnings(summary_plot_phyloseq(data_fungi_mini)), "ggplot")
  expect_message(expect_warning(plot_edgeR_phyloseq(GlobalPatterns, c("SampleType", "Soil", "Feces"), color_tax = "Kingdom"), "deprecated"), "Perform edgeR binary test")
  expect_warning(plot_deseq2_phyloseq(res_deseq, c("SampleType", "Soil", "Skin"), tax_table = GP@tax_table, color_tax = "Kingdom"), "deprecated")
  expect_warning(venn_phyloseq(data_fungi_mini, "Height"), "deprecated")
  expect_warning(ggVenn_phyloseq(data_fungi_mini, "Height"), "deprecated")
  expect_warning(hill_tuckey_phyloseq(GlobalPatterns, "Soil_logical"), "deprecated")
  expect_silent(suppressMessages(expect_warning(hill_phyloseq(GP, "SampleType"), "deprecated")))

  # library(metacoder)
  # expect_warning(suppressMessages(ht <- physeq_heat_tree(data_basidio)), "deprecated")
  expect_s3_class(suppressWarnings(multiple_share_bisamples(data_fungi_low_high, bifactor = "Height", merge_sample_by = "Height")), "tbl_df")
})


suppressWarnings(vsearch_error_or_not <- try(system("vsearch 2>&1", intern = TRUE), silent = TRUE))
if (class(vsearch_error_or_not) == "try-error") {
  message("lulu_phyloseq() can't be tested when vsearch is not installed")
} else {
  test_that("lulu_phyloseq works fine", {
    expect_s4_class(suppressWarnings(lulu_phyloseq(data_fungi_sp_known)$new_physeq), "phyloseq")
  })
}

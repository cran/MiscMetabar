data("data_fungi")
cond_taxa <- grepl("Endophyte", data_fungi@tax_table[, "Guild"])
names(cond_taxa) <- taxa_names(data_fungi)

test_that("subset_taxa_pq works fine", {
  expect_s4_class(subset_taxa_pq(data_fungi, data_fungi@tax_table[, "Phylum"] == "Ascomycota"), "phyloseq")
  skip_on_cran()
  expect_equal(ntaxa(subset_taxa_pq(data_fungi, data_fungi@tax_table[, "Phylum"] == "Ascomycota")), 1066)
  expect_s4_class(subset_taxa_pq(data_fungi, cond_taxa), "phyloseq")
  expect_equal(ntaxa(subset_taxa_pq(data_fungi, cond_taxa)), 128)
  expect_equal(ntaxa(subset_taxa_pq(data_fungi, cond_taxa, taxa_names_from_physeq = TRUE)), 128)
  expect_error(subset_taxa_pq(data_fungi, data_fungi@sam_data[["Height"]] == "Low"))
})

cond_samp <- grepl("A1", data_fungi@sam_data[["Sample_names"]])
test_that("subset_samples_pq works fine", {
  expect_s4_class(subset_samples_pq(data_fungi, data_fungi@sam_data[["Height"]] == "Low"), "phyloseq")
  skip_on_cran()
  expect_s4_class(subset_samples_pq(data_fungi, cond_samp), "phyloseq")
  expect_error(subset_samples_pq(data_fungi, data_fungi@tax_table[, "Phylum"] == "Ascomycota"))
  data_fungi2 <- data_fungi
  data_fungi2@sam_data <- NULL
  expect_message(subset_samples_pq(data_fungi2, cond_samp))
  expect_s4_class(suppressMessages(subset_samples_pq(data_fungi2, cond_samp)), "phyloseq")
})

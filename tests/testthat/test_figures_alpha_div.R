data("GlobalPatterns", package = "phyloseq")
data("enterotype", package = "phyloseq")

GP <- GlobalPatterns
data_fungi_2trees <-
  subset_samples(
    data_fungi,
    data_fungi@sam_data$Tree_name %in% c("A10-005", "AD30-abm-X")
  )
GP_archae <-
  subset_taxa(GlobalPatterns, GlobalPatterns@tax_table[, 1] == "Archaea")
GP_archae <- clean_pq(rarefy_even_depth(subset_samples_pq(GP_archae, sample_sums(GP_archae) > 1000)))
data_basidio <- subset_taxa(data_fungi, Phylum == "Basidiomycota")

test_that("hill_pq works with data_fungi dataset", {
  expect_silent(suppressMessages(hill_pq(data_fungi_mini, "Height")))
  skip_on_cran()
  expect_silent(suppressMessages(hill_pq(data_fungi_mini, "Height", add_points = TRUE)))
  expect_silent(suppressMessages(hill_pq(
    clean_pq(subset_samples_pq(
      data_fungi_mini, !is.na(data_fungi_mini@sam_data$Height)
    )), "Height",
    letters = TRUE
  )))
  expect_silent(suppressMessages(
    hill_pq(
      data_fungi_mini,
      "Height",
      add_points = TRUE,
      color_fac = "Time"
    )
  ))
  expect_silent(
    suppressMessages(
      hill_pq(
        data_fungi_mini,
        "Height",
        add_points = TRUE,
        color_fac = "Time",
        one_plot = TRUE,
        correction_for_sample_size = FALSE
      )
    )
  )
  expect_silent(suppressWarnings(suppressMessages(
    hill_pq(
      clean_pq(subset_samples_pq(
        data_fungi_mini, !is.na(data_fungi_mini@sam_data$Height)
      )),
      "Height",
      add_points = TRUE,
      color_fac = "Time",
      one_plot = TRUE,
      correction_for_sample_size = FALSE,
      letters = TRUE
    )
  )))
  expect_equal(length(hill_pq(data_fungi_mini, "Height", add_points = TRUE)), 4)
  expect_s3_class(hill_pq(data_fungi_mini, "Height", add_points = TRUE)[[1]], "ggplot")
})

test_that("hill_pq works with GP dataset", {
  skip_on_cran()
  expect_silent(suppressMessages(hill_pq(GP, "SampleType")))
  expect_silent(suppressMessages(hill_pq(GP, "SampleType", add_points = TRUE)))
  expect_silent(suppressMessages(hill_pq(GP, "SampleType", letters = TRUE)))
  expect_silent(suppressMessages(hill_pq(GP, "SampleType", add_points = TRUE)))
  expect_equal(length(hill_pq(GP, "SampleType", add_points = TRUE)), 4)
  expect_s3_class(hill_pq(GP, "SampleType", add_points = TRUE)[[1]], "ggplot")
})

test_that("iNEXT_pq works with data_fungi_mini dataset", {
  skip_on_cran()
  library("iNEXT")
  expect_s3_class(
    suppressWarnings(res_iNEXT <- iNEXT_pq(
      subset_taxa_pq(
        data_fungi_mini,
        taxa_sums(data_fungi_mini) > 5000
      ),
      merge_sample_by = "Height",
      q = 1,
      datatype = "abundance",
      nboot = 5
    )),
    "iNEXT"
  )
  expect_s3_class(ggiNEXT(res_iNEXT), "ggplot")
  expect_s3_class(ggiNEXT(res_iNEXT, type = 2), "ggplot")
  expect_s3_class(ggiNEXT(res_iNEXT, type = 3), "ggplot")
})


test_that("accu_plot works with GlobalPatterns dataset", {
  skip_on_cran()
  expect_silent(suppressWarnings(accu_plot(GP_archae, fact = "X.SampleID", by.fact = TRUE)))
  expect_silent(suppressWarnings(accu_plot(GP_archae, fact = "X.SampleID", by.fact = FALSE)))
  expect_silent(suppressWarnings(accu_plot(
    GP_archae,
    fact = "X.SampleID",
    by.fact = TRUE,
    print_sam_names = TRUE
  )))
  expect_silent(suppressWarnings(accu_plot(
    GP_archae,
    "SampleType",
    add_nb_seq = TRUE,
    by.fact = TRUE
  )))
  expect_silent(suppressWarnings(
    accu_plot(
      GP_archae,
      "SampleType",
      add_nb_seq = FALSE,
      by.fact = TRUE
    )
  ))
  expect_error(accu_plot(GP_archae))
})

test_that("accu_plot works with data_fungi dataset", {
  skip_on_cran()
  expect_silent(accu_plot(data_basidio, fact = "Height", by.fact = TRUE))
  expect_error(suppressWarnings(accu_plot(data_basidio,
    fact = "Height",
    by.fact = FALSE
  )))
  expect_silent(accu_plot(
    data_basidio,
    fact = "Height",
    by.fact = TRUE,
    print_sam_names = TRUE
  ))
  expect_silent(accu_plot(
    data_basidio,
    "Height",
    add_nb_seq = TRUE,
    by.fact = TRUE
  ))
  expect_silent(accu_plot(
    data_basidio,
    "Height",
    add_nb_seq = FALSE,
    by.fact = TRUE
  ))
  expect_error(accu_plot(data_basidio))
})


test_that("accu_samp_threshold works with GlobalPatterns dataset", {
  skip_on_cran()
  expect_s3_class(p <- accu_plot(GP_archae, "SampleType", add_nb_seq = TRUE, by.fact = TRUE, step = 10), "ggplot")
  expect_equal(length(accu_samp_threshold(p)), 5)
})

test_that("accu_samp_threshold works with data_fungi_mini dataset", {
  skip_on_cran()
  expect_warning(ggb <-
    ggbetween_pq(data_fungi_mini, "Time"))
  expect_equal(length(ggb), 3)
  expect_s3_class(ggbetween_pq(data_fungi_mini, fact = "Height")[[1]], "ggplot")
  expect_s3_class(
    ggbetween_pq(
      data_fungi,
      fact = "Height",
      one_plot = TRUE,
      min_SCBD = 0,
      rarefy_by_sample = TRUE
    )[[2]],
    "ggplot"
  )
  expect_s3_class(ggbetween_pq(
    data_fungi_mini,
    fact = "Height"
  )[[1]], "ggplot")
})

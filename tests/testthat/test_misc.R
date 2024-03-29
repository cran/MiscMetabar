data(data_fungi)
data("enterotype")

test_that("dist_bycol works fine", {
  expect_equal(length(
    dist_bycol(
      data_fungi@otu_table,
      as_binary_otu_table(data_fungi)@otu_table
    )
  ), 2)
  skip_on_cran()
  expect_error(length(dist_bycol(
    data_fungi@otu_table, enterotype@otu_table
  )))
})

test_that("all_object_size works fine", {
  expect_type(all_object_size(), "double")
})

test_that("diff_fct_diff_class works fine", {
  expect_equal(
    diff_fct_diff_class(
      data_fungi@sam_data$Sample_id,
      numeric_fonction = sum,
      na.rm = TRUE
    ),
    17852
  )
  skip_on_cran()
  expect_equal(
    round(diff_fct_diff_class(
      data_fungi@sam_data$Time,
      numeric_fonction = mean,
      na.rm = TRUE
    ), 2),
    5.80
  )
  expect_equal(
    diff_fct_diff_class(
      data_fungi@sam_data$Height == "Low",
      logical_method = "TRUE_if_one"
    ),
    TRUE
  )
  expect_equal(
    diff_fct_diff_class(
      data_fungi@sam_data$Height == "Low",
      logical_method = "NA_if_not_all_TRUE"
    ),
    NA
  )
  expect_equal(
    diff_fct_diff_class(
      data_fungi@sam_data$Height == "Low",
      logical_method = "FALSE_if_not_all_TRUE"
    ),
    FALSE
  )
  expect_equal(
    diff_fct_diff_class(
      data_fungi@sam_data$Height,
      character_method = "unique_or_na"
    ),
    NA
  )
  expect_equal(
    diff_fct_diff_class(
      c("IE", "IE"),
      character_method = "unique_or_na"
    ),
    "IE"
  )
  expect_equal(
    diff_fct_diff_class(
      c("IE", "IE", "TE", "TE"),
      character_method = "more_frequent"
    ),
    "IE"
  )
  expect_equal(
    diff_fct_diff_class(
      c("IE", "IE", "TE", "TE"),
      character_method = "more_frequent_without_equality"
    ),
    NA
  )
})


withr::local_envvar(
  R_USER_CACHE_DIR = tempfile(),
  .local_envir = teardown_env()
)

test_that("add_funguild_info works fine", {
  skip_on_cran()
  data_f <- subset_taxa_pq(data_fungi, taxa_sums(data_fungi) > 5000)
  expect_silent(data_f <- add_funguild_info(data_f,
    taxLevels = c(
      "Domain", "Phylum", "Class", "Order", "Family", "Genus", "Species"
    )
  ))
  expect_equal(dim(data_f@tax_table)[2], 24)
})


test_that("are_modality_even_depth works fine", {
  expect_equal(are_modality_even_depth(data_fungi, "Time")$statistic[[1]], 62.143)
  expect_equal(are_modality_even_depth(rarefy_even_depth(data_fungi), "Time")$p.value, 1)
  expect_silent(are_modality_even_depth(data_fungi, "Height", boxplot = TRUE))
})

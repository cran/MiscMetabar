data(enterotype)
data(data_fungi)

test_that("write_pq function works fine with enterotype dataset", {
  testFolder <- tempdir()
  unlink(list.files(testFolder, full.names = TRUE), recursive = TRUE)
  expect_silent(write_pq(enterotype, path = testFolder, silent = TRUE))
  skip_on_cran()
  expect_silent(write_pq(enterotype, path = testFolder, silent = TRUE, sam_data_first = TRUE))
  expect_silent(write_pq(enterotype, path = testFolder, silent = TRUE, write_sam_data = TRUE))
  expect_message(write_pq(enterotype, path = testFolder))
  expect_error(write_pq(enterotype, one_file = TRUE, path = testFolder))
  expect_s4_class(read_pq(testFolder, taxa_are_rows = TRUE), "phyloseq")
  new_data_entero <- read_pq(testFolder, taxa_are_rows = TRUE)
  expect_equal(ntaxa(new_data_entero) - ntaxa(enterotype), 0)
  expect_equal(nsamples(new_data_entero) - nsamples(enterotype), 0)
})


test_that("write_pq function works fine with data_fungi dataset", {
  testFolder <- tempdir()
  unlink(list.files(testFolder, full.names = TRUE), recursive = TRUE)
  expect_silent(write_pq(data_fungi, path = testFolder, silent = TRUE))
  skip_on_cran()
  expect_silent(write_pq(data_fungi, path = testFolder, silent = TRUE, sam_data_first = TRUE))
  expect_silent(write_pq(data_fungi, path = testFolder, silent = TRUE, write_sam_data = FALSE))
  expect_message(write_pq(data_fungi, path = testFolder, silent = TRUE, sam_data_first = TRUE, one_file = TRUE))
  expect_silent(write_pq(data_fungi, path = testFolder, silent = TRUE, write_sam_data = FALSE, one_file = TRUE))
  expect_message(write_pq(data_fungi, path = testFolder))
  expect_message(write_pq(data_fungi, one_file = TRUE, path = testFolder))
  expect_s4_class(read_pq(testFolder), "phyloseq")
  new_data_fungi <- read_pq(testFolder)
  expect_equal(ntaxa(new_data_fungi) - ntaxa(data_fungi), 0)
  expect_equal(nsamples(new_data_fungi) - nsamples(data_fungi), 0)
})

test_that("save_pq function works fine with data_fungi dataset", {
  skip_on_os("windows")
  skip_on_cran()
  testFolder <- tempdir()
  unlink(list.files(testFolder, full.names = TRUE), recursive = TRUE)
  expect_message(save_pq(data_fungi, path = testFolder, silent = TRUE))
  expect_message(save_pq(data_fungi, path = testFolder))
  expect_equal(length(list.files(testFolder)), 6)
})

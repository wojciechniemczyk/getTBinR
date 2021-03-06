context("get_tb_burden")

## Data dict summary data
tb_data <- get_tb_burden(download_data = TRUE,
                         save = TRUE)

ncols_tb_data <- ncol(tb_data)
nrows_tb_data <-  nrow(tb_data)
class_tb_data <- class(tb_data)[1]

## Expected
exp_nrows <- 3651
exp_ncols <- 71
exp_class <- "tbl_df"

test_that("TB burden data has been successfully downloaded", {
  expect_true(!is.null(tb_data))
})
test_that("Data dictionary is a tibble",{
  expect_equal(exp_class, class_tb_data)
})

test_that("TB burden data has the expected number of variables", {
  expect_equal(exp_ncols, ncols_tb_data)
})

test_that("TB burden has the expected number of entries", {
  expect_equal(exp_nrows, nrows_tb_data)
})

test_that("TB burden data is the same when downloaded using utils::read.csv", {
  tb_data_utils <- get_tb_burden(download_data = TRUE,
                                 use_utils = TRUE,
                                 burden_save_name = "TB_with_utils")
  
  expect_equal(tb_data, tb_data_utils)
})
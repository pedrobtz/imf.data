
test_that("mt_dataflow works", {

  x <- mt_dataflow()
  expect_s3_class(x, "data.frame")
  expect_length(x, 11L)
})


test_that("mt_compact_data works", {

  request_limit$set_rate(limit = 5)

  x <- mt_compact_data("IFS", list("M", "GB", "PMP_IX"))

  d <- x$CompactData$DataSet$Series$Obs
  expect_equal(class(d), "data.frame")
  expect_equal(ncol(d), 2)

  x <- mt_compact_data("IFS", list("A", "GB", "PMP_IX"),
                       start_period = "2010-01",
                       end_period =  "2015-12")
  d <- x$CompactData$DataSet$Series$Obs
  expect_s3_class(d, "data.frame")
  expect_equal(ncol(d), 2)
  expect_equal(nrow(d), 6)

  x <- mt_compact_data("DOT", list("M","GB", "TMG_CIF_USD", c("B0","W00")))
  expect_equal(x$CompactData$DataSet$Series$`@INDICATOR`, c("TMG_CIF_USD", "TMG_CIF_USD"))

  settings$verbose(FALSE)

  expect_error(mt_compact_data("WRONG", list("M", "GB", "PMP_IX")), NULL)

  x <- mt_compact_data("IFS", list("M", "WRONG", "PMP_IX"))
  expect_true(is.null(x$CompactData$DataSet$Series))

  expect_error(mt_compact_data("IFS", list("M", "GB", "PMP_IX"), start_period = "9999-01-01", end_period = "9999-12-12"), "Status code: 500")
})


test_that("mt_data_structure works", {

  x <- mt_data_structure(id = "DOT")
  expect_equal(typeof(x$Structure), "list")
  expect_length(x$Structure, 8L)

  expect_error(mt_data_structure(id = "WRONG"), regexp = NULL)

})

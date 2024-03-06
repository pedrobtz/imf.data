test_that("database works", {

  request_limit$set_rate(limit = 5)

  expect_error(load_datasets("WRONG"), "DatabaseID `WRONG` not found in Dataflow datasets")

  d <- list_datasets()
  expect_s3_class(d, "data.frame")
  expect_named(d, c("ID", "Description"))

  IFS <- load_datasets("IFS")
  DOT <- load_datasets("DOT")
  DTS <- load_datasets(c("DOT","IFS"))

  expect_length(DTS, 2L)

  expect_error(IFS$get_series(freq = "A",ref_area = "PT", indicator = "GDP"),
               regexp = "Invalid value(s) 'GDP' for dimension 'indicator'.",
               fixed = TRUE)

  d <- IFS$get_series(freq = "A", ref_area = "PT", indicator = "NGDP_D_IX")
  expect_s3_class(d, "data.frame")


  d <- IFS$get_series(freq = "A", ref_area = c("PT","CH"), indicator = c("NGDP_D_IX", "PCPI_PC_CP_A_PT"))
  expect_equal(colnames(d), c("TIME_PERIOD", "A.PT.PCPI_PC_CP_A_PT", "A.CH.PCPI_PC_CP_A_PT",
                               "A.PT.NGDP_D_IX", "A.CH.NGDP_D_IX"))

  x <- DOT$get_series(freq = "M",
                      ref_area ="GB",
                      indicator = "TMG_CIF_USD",
                      counterpart_area = c("B0","W00"),
                      start_period = "2022-01-01",
                      end_period = "2022-12-31")

  expect_equal(dim(x), c(12,3))

  foo <- function(){
    IFS <- imf.data::load_datasets("IFS")
    x <- "BFDA_BP6_USD"
    IFS$get_series(freq = "Q", indicator = x, ref_area = "US")
  }

  expect_s3_class(foo(), "data.frame")

})

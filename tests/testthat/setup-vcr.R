library(vcr)

vcr::vcr_configure(
  dir = testthat::test_path("..", "fixtures"),
  record = Sys.getenv("VCR_RECORD", "none")
)

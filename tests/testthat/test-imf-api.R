test_that("list_datasets returns a stable catalogue", {
  local_mocked_bindings(
    sdmx_structure = function(...) fixture_dataflow_response()
  )

  result <- list_datasets()

  expect_s3_class(result, "tbl_df")
  expect_named(
    result,
    c("agency", "id", "version", "name", "description", "dsd_id")
  )
  expect_equal(result$id, c("WEO", "CPI"))
  expect_equal(result$dsd_id, c("DSD_WEO", "DSD_CPI"))
})

test_that("list_dimensions resolves key order and codelists", {
  local_mocked_bindings(
    sdmx_structure = function(structure_type, ...) {
      if (structure_type == "dataflow") {
        fixture_dataflow_response()
      } else {
        fixture_dsd_response()
      }
    }
  )

  result <- list_dimensions("CPI")

  expect_equal(result$id, c("COUNTRY", "FREQUENCY", "TIME_PERIOD"))
  expect_equal(result$position, 0:2)
  expect_equal(result$codelist_id, c("CL_COUNTRY", "CL_FREQ", NA))
})

test_that("list_dimension_values combines availability and labels", {
  dimensions <- tibble::tibble(
    position = 0L,
    id = "FREQUENCY",
    type = "Dimension",
    name = "Frequency",
    codelist_agency = "IMF",
    codelist_id = "CL_FREQ",
    codelist_version = "1.0+.0"
  )
  local_mocked_bindings(
    list_dimensions = function(...) dimensions,
    sdmx_availability = function(...) fixture_availability_response(),
    sdmx_structure = function(...) fixture_codelist_response()
  )

  result <- list_dimension_values(
    "CPI",
    "FREQUENCY",
    filters = list(COUNTRY = "USA")
  )

  expect_equal(result$code, c("A", "M", "Q"))
  expect_equal(result$name, c("Annual", "Monthly", "Quarterly"))
})

test_that("list_dimension_values rejects unknown dimensions", {
  dimensions <- tibble::tibble(
    position = 0L,
    id = "FREQUENCY",
    type = "Dimension",
    name = "Frequency",
    codelist_agency = "IMF",
    codelist_id = "CL_FREQ",
    codelist_version = "1.0+.0"
  )
  local_mocked_bindings(list_dimensions = function(...) dimensions)

  expect_snapshot(
    error = TRUE,
    list_dimension_values("CPI", "NOT_A_DIMENSION")
  )
})

test_that("parse_data_message decodes series and attributes", {
  result <- parse_data_message(
    fixture_data_response(),
    attributes = c("SCALE", "STATUS")
  )

  expect_s3_class(result, "tbl_df")
  expect_named(
    result,
    c(
      "COUNTRY",
      "FREQUENCY",
      "TIME_PERIOD",
      "OBS_VALUE",
      "SCALE",
      "STATUS"
    )
  )
  expect_equal(result$COUNTRY, c("USA", "USA", "CAN"))
  expect_equal(result$FREQUENCY, c("M", "M", "Q"))
  expect_equal(result$OBS_VALUE, c(151.4, 152.7, 132.2))
  expect_equal(result$SCALE, c("0", "0", "3"))
  expect_equal(result$STATUS, c("A", NA, "A"))
})

test_that("get_data returns a typed empty result", {
  local_mocked_bindings(
    sdmx_data = function(...) fixture_data_response(empty = TRUE)
  )

  expect_snapshot(
    result <- get_data("CPI", attributes = "STATUS")
  )
  expect_s3_class(result, "tbl_df")
  expect_equal(nrow(result), 0)
  expect_type(result$OBS_VALUE, "double")
})

test_that("get_data validates requested attributes", {
  local_mocked_bindings(
    sdmx_data = function(...) fixture_data_response()
  )

  expect_snapshot(error = TRUE, get_data("CPI", attributes = "UNKNOWN"))
})

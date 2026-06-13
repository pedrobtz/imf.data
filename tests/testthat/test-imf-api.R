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

test_that("list_dimensions uses the DSD version linked by the dataflow", {
  requested_version <- NULL
  local_mocked_bindings(
    sdmx_structure = function(structure_type, version, ...) {
      if (structure_type == "dataflow") {
        fixture_dataflow_response()
      } else {
        requested_version <<- version
        fixture_dsd_response()
      }
    }
  )

  list_dimensions("CPI", version = "5.0.0")

  expect_identical(requested_version, "5.0+.0")
})

test_that("concept lookup follows the referenced concept scheme", {
  resolved <- list(
    dsd = fixture_dsd_response()$data$dataStructures[[1L]],
    concepts = fixture_dsd_response()$data$conceptSchemes
  )

  result <- dimension_records(resolved)

  expect_identical(result$codelist_id[[2L]], "CL_FREQ")
  expect_identical(result$name[[2L]], "Frequency")
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

test_that("parse_data_message rejects malformed indexed payloads", {
  short_key <- fixture_data_response()
  names(short_key$data$dataSets[[1L]]$series)[[1L]] <- "0"
  expect_snapshot(error = TRUE, parse_data_message(short_key))

  out_of_bounds <- fixture_data_response()
  names(out_of_bounds$data$dataSets[[1L]]$series)[[1L]] <- "9:0"
  expect_snapshot(error = TRUE, parse_data_message(out_of_bounds))

  bad_structure <- fixture_data_response()
  bad_structure$data$dataSets[[1L]]$structure <- 9L
  expect_snapshot(error = TRUE, parse_data_message(bad_structure))
})

test_that("parse_data_message rejects non-numeric measures", {
  response <- fixture_data_response()
  response$data$dataSets[[1L]]$series[[1L]]$observations[[1L]][[1L]] <-
    "not-a-number"

  expect_snapshot(error = TRUE, parse_data_message(response))
})

test_that("parse_data_message combines multiple response structures", {
  response <- fixture_data_response()
  second_structure <- response$data$structures[[1L]]
  second_structure$dimensions$series <- list(
    list(id = "AREA", values = list(list(id = "EUR")))
  )
  second_structure$measures$observation <- list(list(id = "ALT_VALUE"))
  second_structure$attributes$observation <- list(
    list(id = "CONFIDENTIALITY", values = list(list(id = "F")))
  )
  response$data$structures[[2L]] <- second_structure
  response$data$dataSets[[2L]] <- list(
    structure = 1L,
    series = list(
      "0" = list(
        observations = list("0" = list("2.5", 0L))
      )
    )
  )

  result <- parse_data_message(response, attributes = "CONFIDENTIALITY")

  expect_named(
    result,
    c(
      "COUNTRY",
      "FREQUENCY",
      "TIME_PERIOD",
      "OBS_VALUE",
      "CONFIDENTIALITY",
      "AREA",
      "ALT_VALUE"
    )
  )
  expect_equal(result$OBS_VALUE, c(151.4, 152.7, 132.2, NA))
  expect_equal(result$ALT_VALUE, c(NA, NA, NA, 2.5))
  expect_equal(result$CONFIDENTIALITY, c(NA, NA, NA, "F"))
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

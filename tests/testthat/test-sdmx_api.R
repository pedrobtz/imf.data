# Tests for sdmx_api.R

# --- sdmx_request (internal) ---

test_that("sdmx_request creates correct base request", {
  req <- sdmx_request("structure/dataflow", format = "json")

  expect_s3_class(req, "httr2_request")
  expect_match(req$url, "https://api.imf.org/external/sdmx/3.0/structure/dataflow")
  expect_equal(req$headers$Accept, "application/json")
})

test_that("sdmx_request sets XML accept header", {
  req <- sdmx_request("structure/dataflow", format = "xml")

  expect_equal(req$headers$Accept, "application/xml")
})

# --- sdmx_structure ---

test_that("sdmx_structure returns dataflows", {
  vcr::use_cassette("sdmx_structure_dataflows", {
    result <- sdmx_structure("dataflow", agency_id = "IMF.STA", detail = "allstubs")
  })

  expect_type(result, "list")
  expect_true("data" %in% names(result))
  expect_true("meta" %in% names(result))
})

test_that("sdmx_structure returns specific codelist", {
  vcr::use_cassette("sdmx_structure_codelist_freq", {
    result <- sdmx_structure("codelist", resource_id = "CL_FREQ")
  })

  expect_type(result, "list")
  expect_true("data" %in% names(result))
})

test_that("sdmx_structure handles references parameter", {
  vcr::use_cassette("sdmx_structure_with_references", {
    result <- sdmx_structure("dataflow",
      resource_id = "CPI",
      agency_id = "IMF.STA",
      references = "none"
    )
  })

  expect_type(result, "list")
})

# --- sdmx_data ---

test_that("sdmx_data retrieves data", {
  vcr::use_cassette("sdmx_data_cpi", {
    result <- sdmx_data("CPI",
      key = "US.PCPI_IX.*",
      agency_id = "IMF.STA",
      last_n_obs = 2
    )
  })

  expect_type(result, "list")
  expect_true("data" %in% names(result))
})

test_that("sdmx_data handles time period filters", {
  vcr::use_cassette("sdmx_data_with_period", {
    result <- sdmx_data("CPI",
      key = "US.PCPI_IX.*",
      agency_id = "IMF.STA",
      start_period = "2023-01",
      end_period = "2023-12"
    )
  })

  expect_type(result, "list")
})

test_that("sdmx_data handles first_n_obs parameter", {
  vcr::use_cassette("sdmx_data_first_n", {
    result <- sdmx_data("CPI",
      key = "US.PCPI_IX.*",
      agency_id = "IMF.STA",
      first_n_obs = 5
    )
  })

  expect_type(result, "list")
})

# --- sdmx_availability ---

test_that("sdmx_availability returns constraints", {
  vcr::use_cassette("sdmx_availability_cpi", {
    result <- sdmx_availability("CPI", agency_id = "IMF.STA")
  })

  expect_type(result, "list")
  expect_true("data" %in% names(result))
})
test_that("sdmx_availability handles mode parameter", {
  vcr::use_cassette("sdmx_availability_available_mode", {
    result <- sdmx_availability("CPI",
      agency_id = "IMF.STA",
      mode = "available"
    )
  })

  expect_type(result, "list")
})

# --- sdmx_metadata ---

test_that("sdmx_metadata returns metadatasets", {
  vcr::use_cassette("sdmx_metadata_all", {
    result <- sdmx_metadata()
  })

  expect_type(result, "list")
  expect_true("data" %in% names(result))
  expect_true("meta" %in% names(result))
})

test_that("sdmx_metadata handles detail parameter", {
  vcr::use_cassette("sdmx_metadata_full", {
    result <- sdmx_metadata(detail = "full")
  })

  expect_type(result, "list")
})

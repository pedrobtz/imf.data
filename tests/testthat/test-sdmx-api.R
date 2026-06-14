test_that("sdmx_request configures JSON requests", {
  req <- sdmx_request("structure/dataflow/IMF.STA/*/+")

  expect_s3_class(req, "httr2_request")
  expect_match(req$url, "/external/sdmx/3.0/structure/dataflow/IMF.STA")
  expect_identical(req$headers$Accept, "application/json")
  expect_identical(req$options$timeout, 60000)
  expect_identical(req$policies$retry_max_tries, 3)
})

test_that("sdmx_request configures XML requests", {
  req <- sdmx_request("structure/dataflow/IMF.STA/*/+", format = "xml")

  expect_identical(req$headers$Accept, "application/xml")
})

test_that("proxy configuration is applied to every request", {
  previous_proxy <- imf_data_state$proxy
  on.exit(imf_data_state$proxy <- previous_proxy, add = TRUE)
  clear_imf_proxy()

  previous <- set_imf_proxy(
    "http://proxy.example.com",
    port = 8080,
    username = "proxy-user",
    password = "proxy-password"
  )
  req <- sdmx_request("structure/dataflow/IMF.STA/*/+")

  expect_null(previous)
  expect_identical(req$options$proxy, "http://proxy.example.com")
  expect_identical(req$options$proxyport, 8080L)
  expect_identical(
    req$options$proxyuserpwd,
    "proxy-user:proxy-password"
  )
  expect_null(getOption("imf.data.proxy"))

  configured <- clear_imf_proxy()
  expect_identical(configured$url, "http://proxy.example.com")
  expect_identical(configured$port, 8080L)
  expect_identical(configured$authenticated, TRUE)
  expect_identical(configured$auth, "basic")
  expect_identical(
    intersect(names(configured), c("username", "password")),
    character()
  )
  expect_null(sdmx_request("structure/dataflow")$options$proxy)
})

test_that("proxy configuration validates credentials and ports", {
  expect_snapshot(
    error = TRUE,
    set_imf_proxy("http://proxy.example.com", port = 70000)
  )
  expect_snapshot(
    error = TRUE,
    set_imf_proxy("http://proxy.example.com", username = "proxy-user")
  )
  expect_snapshot(
    error = TRUE,
    set_imf_proxy("http://proxy.example.com", auth = "bearer")
  )
})

test_that("sdmx_data serializes filters and limits", {
  vcr::use_cassette("sdmx_data_filters", {
    result <- sdmx_data(
      "CPI",
      filters = list(
        COUNTRY = "USA",
        INDEX_TYPE = "CPI",
        COICOP_1999 = "_T",
        TYPE_OF_TRANSFORMATION = "IX",
        FREQUENCY = "M"
      ),
      start_period = "2026-M04",
      end_period = "2026-M05",
      last_n_obs = 2,
      include_history = TRUE
    )
  })

  series <- result$data$dataSets[[1L]]$series[[1L]]
  expect_length(series$observations, 2)
})

test_that("raw endpoint helpers return recorded responses", {
  vcr::use_cassette("sdmx_structure_codelist", {
    structure <- sdmx_structure(
      "codelist",
      agency_id = "IMF",
      resource_id = "CL_FREQ",
      version = "1.0+.0",
      detail = "full"
    )
  })
  expect_identical(structure$data$codelists[[1L]]$id, "CL_FREQ")

  vcr::use_cassette("sdmx_availability_cpi", {
    availability <- sdmx_availability(
      "CPI",
      key = "USA.CPI._T.IX.M",
      component_id = "FREQUENCY",
      mode = "available",
      references = "none"
    )
  })
  expect_length(availability$data$dataConstraints, 1)

  vcr::use_cassette("sdmx_metadata_finstats", {
    metadata <- sdmx_metadata(
      provider_id = "IMF",
      metadataset_id = "FINSTATS",
      version = "1.0.0",
      detail = "full"
    )
  })
  expect_length(metadata$data$metadataSets, 1)
})

test_that("SDMX period validation accepts standard reporting periods", {
  periods <- c(
    "2026",
    "2026-06",
    "2026-06-13",
    "2026-A1",
    "2026-S2",
    "2026-T3",
    "2026-Q4",
    "2026-M12",
    "2026-W53",
    "2026-D366",
    "2026-06-13T10:15:30+02:00"
  )

  for (period in periods) {
    expect_no_error(validate_period(period, "period"))
  }
})

test_that("request validation covers malformed scalar and filter inputs", {
  expect_no_error(validate_scalar_character(
    NULL,
    "optional",
    allow_null = TRUE
  ))
  expect_s3_class(add_query(sdmx_request("data"), list()), "httr2_request")
  expect_snapshot(error = TRUE, sdmx_request(""))
  expect_snapshot(error = TRUE, sdmx_structure(agency_id = character()))
  expect_snapshot(
    error = TRUE,
    sdmx_data("CPI", filters = "COUNTRY=USA")
  )
  expect_snapshot(
    error = TRUE,
    sdmx_data("CPI", filters = list(COUNTRY = "USA", COUNTRY = "CAN"))
  )
  expect_snapshot(
    error = TRUE,
    sdmx_data("CPI", filters = list("BAD-NAME" = "USA"))
  )
  expect_snapshot(
    error = TRUE,
    sdmx_data("CPI", filters = list(COUNTRY = NA_character_))
  )
  expect_snapshot(error = TRUE, sdmx_data("CPI", include_history = NA))
})

test_that("sdmx_perform handles no-content responses", {
  vcr::use_cassette("sdmx_no_content", record = "none", {
    result <- sdmx_data("NO_CONTENT")
  })

  expect_null(result)
})

test_that("sdmx_perform decodes JSON and returns XML unchanged", {
  vcr::use_cassette("sdmx_structure_cpi_json", {
    json <- sdmx_structure(
      "dataflow",
      agency_id = "IMF.STA",
      resource_id = "CPI"
    )
  })
  expect_identical(json$data$dataflows[[1L]]$id, "CPI")

  vcr::use_cassette("sdmx_structure_cpi_xml", {
    xml <- sdmx_structure(
      "dataflow",
      agency_id = "IMF.STA",
      resource_id = "CPI",
      detail = "referencestubs",
      format = "xml"
    )
  })
  expect_match(xml, "<message:Structure", fixed = TRUE)
})

test_that("HTTP errors include response bodies or status codes", {
  response_with_body <- structure(
    list(
      status_code = 400L,
      headers = structure(list(), class = "httr2_headers"),
      body = charToRaw(" invalid\nrequest ")
    ),
    class = "httr2_response"
  )
  empty_response <- structure(
    list(
      status_code = 503L,
      headers = structure(list(), class = "httr2_headers"),
      body = raw()
    ),
    class = "httr2_response"
  )

  expect_identical(
    sdmx_error_body(response_with_body),
    "IMF API request failed: invalid request"
  )
  expect_identical(
    sdmx_error_body(empty_response),
    "IMF API request failed with HTTP status 503."
  )
})

test_that("vcr replay mode blocks unmatched network requests", {
  vcr::local_vcr_configure(
    dir = tempdir(),
    record = "none"
  )

  condition <- tryCatch(
    vcr::use_cassette("unmatched-imf-request", {
      req <- httr2::request("https://network-must-not-run.invalid/test")
      httr2::req_perform(req)
    }),
    error = identity
  )

  expect_s3_class(condition, "vcr_unhandled")
})

test_that("raw client validation is informative", {
  expect_snapshot(error = TRUE, sdmx_structure("not-a-structure"))
  expect_snapshot(error = TRUE, sdmx_data("CPI", first_n_obs = 0))
  expect_snapshot(
    error = TRUE,
    sdmx_data("CPI", first_n_obs = 1, last_n_obs = 1)
  )
  expect_snapshot(error = TRUE, sdmx_data("CPI", start_period = "January"))
  expect_snapshot(error = TRUE, sdmx_data("CPI", start_period = "2026-02-30"))
  expect_snapshot(
    error = TRUE,
    sdmx_data("CPI", updated_after = "2026-06-13")
  )
  expect_snapshot(error = TRUE, sdmx_data("CPI", filters = list("USA")))
})

test_that("recorded CPI query contains real observations", {
  vcr::use_cassette("sdmx_data_cpi_valid", {
    result <- sdmx_data(
      "CPI",
      key = "USA.CPI._T.IX.M",
      last_n_obs = 2
    )
  })

  series <- result$data$dataSets[[1L]]$series[[1L]]
  periods <- result$data$structures[[1L]]$dimensions$observation[[1L]]$values

  expect_length(series$observations, 2)
  expect_equal(
    vapply(periods, `[[`, character(1), "value"),
    c("2026-M03", "2026-M04")
  )
})

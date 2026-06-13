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
  local_mocked_bindings(
    sdmx_perform = function(req, format) req
  )

  req <- sdmx_data(
    "CPI",
    filters = list(COUNTRY = c("USA", "CAN"), FREQUENCY = "M"),
    start_period = "2020-W01",
    end_period = "2021",
    last_n_obs = 2,
    updated_after = "2026-06-13T10:15:30Z"
  )

  expect_match(req$url, "c%5BCOUNTRY%5D=USA%2CCAN")
  expect_match(req$url, "c%5BFREQUENCY%5D=M")
  expect_match(req$url, "c%5BTIME_PERIOD%5D=ge%3A2020-W01%2Ble%3A2021")
  expect_match(req$url, "lastNObservations=2")
  expect_match(req$url, "updatedAfter=2026-06-13T10%3A15%3A30Z")
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

test_that("sdmx_perform handles no-content responses", {
  response <- structure(
    list(
      method = "GET",
      url = "https://example.com",
      status_code = 204L,
      headers = structure(list(), class = "httr2_headers"),
      body = raw()
    ),
    class = "httr2_response"
  )
  local_mocked_bindings(sdmx_send = function(req) response)

  expect_null(sdmx_perform(sdmx_request("structure/dataflow")))
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


test_that("handle works", {

  expect_contains(curl:::handle_getheaders(get_curl_handle("text")), "Accept: application/text")
  expect_contains(curl:::handle_getheaders(get_curl_handle("json")), "Accept: application/json")
})


test_that("request accept works", {

  x <- get_request("https://httpbin.org/get")

  expect_equal(x$headers$Host, "httpbin.org")
  expect_equal(x$headers$Accept, "application/json")

  x <- get_request("https://httpbin.org/get", accept = "text")
  expect_equal(x$headers$Accept, "application/text")

  settings$handle_options()

  x <- get_request("https://httpbin.org/json", accept = "json")
  expect_equal(class(x),"list")

  expect_true(is.character(get_request("https://httpbin.org/html")))

  expect_error(get_request("https://httpbin.org/xml"),
               regexp = "response type 'application/xml' not expected",
               fixed = TRUE)
})

test_that("verbose works", {

  settings$verbose(TRUE)

  get_request("https://httpbin.org/html") %>%
    expect_message(regexp = "[200][OK] GET", fixed = TRUE)

  expect_message(get_request("https://httpbin.org/json"),
                 regexp = "[200][OK] GET https://httpbin.org/json",
                 fixed = TRUE)

  settings$verbose(FALSE)
})


test_that("check status works", {

  expect_error(get_request("https://httpbin.org/status/200", accept = "text"), regexp = NA)

  expect_error(get_request("https://httpbin.org/status/400"), regexp = "Status code: 400")

})



test_that("extract_resp_content works", {

  x <- get_request("https://httpbin.org/response-headers?freeform=123")

  resp <- .last_response()

  y <- "{ \"Content-Length\": \"90\", \"Content-Type\": \"application/json\", \"freeform\": \"123\" }"
  expect_equal(extract_resp_content(resp, type = "text"), y)
  expect_equal(extract_resp_content(resp, type = "json"), jsonlite::parse_json(y))
})





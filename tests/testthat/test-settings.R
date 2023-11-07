test_that("settings works", {

  settings$verbose(TRUE)

  expect_equal(settings$verbose(), TRUE)

  expect_error(settings$verbose(3), "is not TRUE")

  settings$verbose(FALSE)

  expect_equal(settings$verbose(), FALSE)

  expect_error(get_request("https://httpbin.org/post"), regexp = "Status code: 405")

  settings$handle_options(value = list(customrequest = "POST"))

  x <- get_request("https://httpbin.org/post")
  expect_equal(x$headers$Host, "httpbin.org")

  settings$handle_options(value = NULL)

  request_limit$set_rate(limit = 50, window = 60)
  expect_equal(request_limit$get_rate(), list(rate=50, window=as.difftime(60,units = "secs")))

  request_limit$set_rate()
})

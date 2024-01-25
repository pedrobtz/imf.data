
.onAttach <- function(libname, pkgname) {

  settings$verbose(FALSE)
  settings$handle_options(list(timeout_ms = 60*5*1000))
  # limit 7 requests per 5 seconds window
  request_limit$set_rate(limit = 7, window = 5)
}

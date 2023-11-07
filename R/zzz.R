

.onAttach <- function(libname, pkgname) {

  settings$verbose(FALSE)
  # limit 7 requests per 5 seconds window
  request_limit$set_rate(limit = 7, window = 5)
}

# Maintainers may set VCR_RECORD=all when running devtools::test() to refresh
# cassettes. Package checks always use replay-only mode.
record_mode <- Sys.getenv("VCR_RECORD", unset = "none")
valid_record_modes <- c("none", "once", "new_episodes", "all")
if (!record_mode %in% valid_record_modes) {
  stop(
    "`VCR_RECORD` must be one of: none, once, new_episodes, or all.",
    call. = FALSE
  )
}

running_package_check <- nzchar(Sys.getenv("_R_CHECK_PACKAGE_NAME_")) ||
  identical(tolower(Sys.getenv("_R_CHECK_CRAN_INCOMING_")), "true")
if (running_package_check) {
  record_mode <- "none"
}

vcr::vcr_configure(
  dir = testthat::test_path("..", "fixtures"),
  record = record_mode,
  match_requests_on = c("method", "uri"),
  filter_request_headers = list("authorization", "proxy-authorization"),
  filter_response_headers = list(
    "date",
    "request-context",
    "set-cookie",
    "x-correlation-id",
    "x-envoy-upstream-service-time"
  )
)

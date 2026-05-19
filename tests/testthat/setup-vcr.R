library(vcr)

vcr::vcr_configure(
  dir = "../fixtures",
  filter_sensitive_data = list(
    "<<api_key>>" = Sys.getenv("IMF_API_KEY")
  ),
  record = "once"
)


<!-- README.md is generated from README.Rmd. Please edit that file -->

# imf.data

<!-- badges: start -->

[![Package
Version](https://www.r-pkg.org/badges/version/imf.data)](https://www.r-pkg.org/pkg/imf.data)
[![R-CMD-check](https://github.com/pedrobtz/imf.data/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/pedrobtz/imf.data/actions/workflows/R-CMD-check.yaml)
[![downloads](https://cranlogs.r-pkg.org/badges/grand-total/imf.data)](https://cranlogs.r-pkg.org/badges/grand-total/imf.data)

<!-- badges: end -->

`imf.data` provides an R interface to the [IMF SDMX 3.0
API](https://datasupport.imf.org/knowledge?id=knowledge_category&category_id=9959b2bc1b6391903dba646fbd4bcb6a).
Version 0.2.0 is a breaking migration from the retired IMF JSON service.

The package has two layers:

- A concise workflow that discovers datasets and returns tidy
  observations.
- Raw `sdmx_*()` functions for users who need the complete SDMX
  response.

## Installation

Install the released package from CRAN:

``` r
install.packages("imf.data")
```

The SDMX 3.0 rewrite is available from GitHub while version 0.2.0 is
under development:

``` r
pak::pak("pedrobtz/imf.data")
```

## Quick start

``` r
library(imf.data)

# Discover IMF Statistics Department datasets
datasets <- list_datasets("IMF.STA")
datasets[datasets$id == "CPI", ]
```

``` r
# Inspect a dataset's key dimensions
list_dimensions("CPI")
```

``` r
# Find valid frequency codes for US CPI data
list_dimension_values(
  "CPI",
  "FREQUENCY",
  filters = list(COUNTRY = "USA")
)
```

``` r
# Download the latest monthly headline CPI observations
cpi <- get_data(
  "CPI",
  filters = list(
    COUNTRY = c("USA", "CAN"),
    INDEX_TYPE = "CPI",
    COICOP_1999 = "_T",
    TYPE_OF_TRANSFORMATION = "IX",
    FREQUENCY = "M"
  ),
  last_n_obs = 12,
  attributes = "STATUS"
)
cpi
```

`get_data()` returns one row per observation. Dimension and time columns
are character vectors, `OBS_VALUE` is numeric, and requested SDMX
attributes are included as additional columns.

## Raw SDMX access

``` r
raw <- sdmx_data(
  "CPI",
  key = "USA.CPI._T.IX.M",
  last_n_obs = 2
)
```

See `vignette("getting-started")` for the complete workflow and
`vignette("migration")` when upgrading from version 0.1.x.

## Proxy configuration

httr2 respects standard proxy environment variables such as
`HTTPS_PROXY` and `NO_PROXY`. A proxy can also be configured
specifically for `imf.data`:

``` r
set_imf_proxy(
  "http://proxy.example.com",
  port = 8080,
  username = Sys.getenv("PROXY_USER"),
  password = Sys.getenv("PROXY_PASSWORD")
)

list_datasets("IMF.STA")
clear_imf_proxy()
```

The package-specific configuration applies to all raw and tidy API
functions for the remainder of the R session, until `clear_imf_proxy()`
is called.

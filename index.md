# imf.data

`imf.data` provides an R interface to the [IMF SDMX 3.0
API](https://datasupport.imf.org/knowledge?id=knowledge_category&category_id=9959b2bc1b6391903dba646fbd4bcb6a).
It supports discovering datasets, inspecting their dimensions, and
downloading observations as tidy data frames. Raw SDMX responses are
also available for advanced use.

## Installation

Install `imf.data` from CRAN:

``` r

install.packages("imf.data")
```

Install the development version from GitHub:

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

[`get_data()`](https://pedrobtz.github.io/imf.data/reference/get_data.md)
returns one row per observation. Dimension and time columns are
character vectors, `OBS_VALUE` is numeric, and requested SDMX attributes
are included as additional columns.

## Raw SDMX access

``` r

raw <- sdmx_data(
  "CPI",
  key = "USA.CPI._T.IX.M",
  last_n_obs = 2
)
```

See
[`vignette("getting-started")`](https://pedrobtz.github.io/imf.data/articles/getting-started.md)
for a complete workflow.

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
functions for the remainder of the R session, until
[`clear_imf_proxy()`](https://pedrobtz.github.io/imf.data/reference/set_imf_proxy.md)
is called.

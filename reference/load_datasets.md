# Loads Time Series Datasets

Loads Time Series Datasets

## Usage

``` r
load_datasets(id, use_cache = TRUE)
```

## Arguments

- id:

  is character vector of Dataset Series identifier.

- use_cache:

  is Boolean, defaults to TRUE, if TRUE it reloads the Dataset from
  cached values.

## Value

a dataset object for the time-series identifier, i.e. a list containing
a list 'dimensions' of data.frames with the valid dimensions values, and
a function 'get_series' to retrieve time-series data.

## Examples

``` r
DOT <- load_datasets("DOT")
#> Data service did not respond.

DOT$get_series(freq = "M",
               ref_area ="GB",
               indicator = "TMG_CIF_USD",
               counterpart_area = c("B0","W00"),
               start_period = "2022-01-01",
               end_period = "2022-12-31")
#> Dataset not loaded.
```

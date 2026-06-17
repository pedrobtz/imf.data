# Download IMF data as a tidy data frame

Query a dataflow with named dimension filters and decode the indexed
SDMX response into one row per observation.

## Usage

``` r
get_data(
  dataflow,
  filters = list(),
  agency_id = "IMF.STA",
  version = "+",
  start_period = NULL,
  end_period = NULL,
  first_n_obs = NULL,
  last_n_obs = NULL,
  attributes = character()
)
```

## Arguments

- dataflow:

  Dataflow ID.

- filters:

  Named list of dimension selections.

- agency_id:

  Maintainer ID.

- version:

  Dataflow version.

- start_period, end_period:

  Optional SDMX period bounds.

- first_n_obs, last_n_obs:

  Optional observation limits per series.

- attributes:

  Character vector of series or observation attributes to include in the
  result.

## Value

A tibble containing dimension columns, `TIME_PERIOD`, `OBS_VALUE`, and
any requested attributes.

## Examples

``` r
# \donttest{
get_data(
  "CPI",
  filters = list(
    COUNTRY = "USA",
    INDEX_TYPE = "CPI",
    COICOP_1999 = "_T",
    TYPE_OF_TRANSFORMATION = "IX",
    FREQUENCY = "M"
  ),
  last_n_obs = 2
)
#> # A tibble: 2 × 7
#>   COUNTRY INDEX_TYPE COICOP_1999 TYPE_OF_TRANSFORMATION FREQUENCY TIME_PERIOD
#>   <chr>   <chr>      <chr>       <chr>                  <chr>     <chr>      
#> 1 USA     CPI        _T          IX                     M         2026-M04   
#> 2 USA     CPI        _T          IX                     M         2026-M05   
#> # ℹ 1 more variable: OBS_VALUE <dbl>
# }
```

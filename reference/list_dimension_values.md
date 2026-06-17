# List available values for a dataset dimension

Use the IMF availability endpoint to return the codes that remain valid
for a dimension, optionally constrained by selections for other
dimensions.

## Usage

``` r
list_dimension_values(
  dataflow,
  dimension,
  filters = list(),
  agency_id = "IMF.STA",
  version = "+"
)
```

## Arguments

- dataflow:

  Dataflow ID.

- dimension:

  Dimension ID.

- filters:

  Named list of selections for other dimensions.

- agency_id:

  Maintainer ID.

- version:

  Dataflow version.

## Value

A tibble with `code`, `name`, and `description` columns.

## Examples

``` r
# \donttest{
list_dimension_values(
  "CPI",
  "FREQUENCY",
  filters = list(COUNTRY = "USA")
)
#> # A tibble: 3 × 3
#>   code  name  description
#>   <chr> <chr> <chr>      
#> 1 A     NA    NA         
#> 2 M     NA    NA         
#> 3 Q     NA    NA         
# }
```

# List IMF datasets

Return the available IMF SDMX dataflows as a stable, tidy catalogue.

## Usage

``` r
list_datasets(agency_id = "*")
```

## Arguments

- agency_id:

  Maintainer ID. Use `"*"` for all maintainers.

## Value

A tibble with `agency`, `id`, `version`, `name`, `description`, and
`dsd_id` columns.

## Examples

``` r
# \donttest{
datasets <- list_datasets("IMF.STA")
# }
```

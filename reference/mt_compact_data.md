# Calls API endpoint 'CompactData' to get Dataset time series

Calls API endpoint 'CompactData' to get Dataset time series

## Usage

``` r
mt_compact_data(id, dimensions, start_period = NA, end_period = NA)
```

## Arguments

- id:

  is a Dataset Series identifier.

- dimensions:

  is a named list with the dimensions query.

- start_period:

  is time series start date with formats.

- end_period:

  is time series end date with format. See Details for the valid
  formats.

## Value

a list with content of 'CompactData' response.

## Details

The 'start_period' and 'end_pariod' parameters should have formats:
'yyyy', 'yyyy-mm' or 'yyyy-mm-dd'.

## Examples

``` r
DOT <- mt_compact_data("DOT", list("M","GB", "TMG_CIF_USD", c("B0","W00")))
#> Data service did not respond.
```

# Migrating from imf.data 0.1.x

Version 0.2.0 is a breaking release. The IMF retired the JSON service
used by `imf.data` 0.1.x and replaced it with SDMX APIs whose
identifiers, structures, and response model differ from the old service.

## Function mapping

| Version 0.1.x | Version 0.2.0 |
|----|----|
| [`list_datasets()`](https://pedrobtz.github.io/imf.data/reference/list_datasets.md) | [`list_datasets()`](https://pedrobtz.github.io/imf.data/reference/list_datasets.md) with a new tidy schema |
| `load_datasets(id)` | `list_dimensions(id)` |
| `dataset$dimensions` | `list_dimension_values(id, dimension)` |
| `dataset$get_series(...)` | `get_data(id, filters = list(...))` |
| `mt_dataflow()` | `sdmx_structure("dataflow")` |
| `mt_data_structure()` | `sdmx_structure("datastructure")` |
| `mt_compact_data()` | [`sdmx_data()`](https://pedrobtz.github.io/imf.data/reference/sdmx_data.md) |

There are no compatibility wrappers because old dataset IDs and
dimension names do not consistently map to the new IMF Data Portal.

## Rewrite a query

An old query created a dataset object and then called its generated
`get_series()` method:

``` r

CPI <- load_datasets("CPI")
CPI$get_series(
  freq = "M",
  ref_area = "US",
  indicator = "PCPI_IX"
)
```

The new workflow first inspects the current dimensions, then uses their
SDMX names directly:

``` r

list_dimensions("CPI")

get_data(
  "CPI",
  filters = list(
    COUNTRY = "USA",
    INDEX_TYPE = "CPI",
    COICOP_1999 = "_T",
    TYPE_OF_TRANSFORMATION = "IX",
    FREQUENCY = "M"
  )
)
```

Important identifier changes include three-letter country codes such as
`USA` instead of the previous `US`, and dataset-specific dimension
layouts.

## Migrate safely

1.  Find the current dataflow with
    [`list_datasets()`](https://pedrobtz.github.io/imf.data/reference/list_datasets.md).
2.  Inspect its dimensions with
    [`list_dimensions()`](https://pedrobtz.github.io/imf.data/reference/list_dimensions.md).
3.  Validate codes with
    [`list_dimension_values()`](https://pedrobtz.github.io/imf.data/reference/list_dimension_values.md).
4.  Replace positional or generated arguments with a named `filters`
    list.
5.  Check the returned columns and units before replacing production
    results.

The IMF Data Portal is the source of truth for current dataflow
definitions and vintages.

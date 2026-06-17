# Query statistical data

Retrieve an SDMX data message from the IMF API. This is the raw
interface; use
[`get_data()`](https://pedrobtz.github.io/imf.data/reference/get_data.md)
to obtain a tidy data frame.

## Usage

``` r
sdmx_data(
  dataflow,
  key = "*",
  agency_id = "IMF.STA",
  version = "+",
  context = "dataflow",
  filters = list(),
  start_period = NULL,
  end_period = NULL,
  first_n_obs = NULL,
  last_n_obs = NULL,
  updated_after = NULL,
  include_history = FALSE,
  attributes = "dsd",
  measures = "all",
  format = c("json", "xml")
)
```

## Arguments

- dataflow:

  Dataflow ID.

- key:

  SDMX series key. Use `"*"` with `filters` for named filtering.

- agency_id:

  Maintainer ID.

- version:

  Dataflow version.

- context:

  Query context.

- filters:

  Named list of component filters.

- start_period, end_period:

  Optional SDMX period bounds.

- first_n_obs, last_n_obs:

  Optional positive observation limits. They cannot be used together.

- updated_after:

  Optional RFC 3339 timestamp.

- include_history:

  Include historical versions.

- attributes:

  Attribute detail requested from the API.

- measures:

  Measures requested from the API.

- format:

  Response format. XML responses are returned as text.

## Value

A nested list for JSON, a character value for XML, or `NULL` for an HTTP
204 response.

## Examples

``` r
# \donttest{
sdmx_data(
  "CPI",
  agency_id = "IMF.STA",
  key = "USA.CPI._T.IX.M",
  last_n_obs = 2
)
#> $meta
#> named list()
#> 
#> $data
#> $data$dataSets
#> $data$dataSets[[1]]
#> $data$dataSets[[1]]$structure
#> [1] 0
#> 
#> $data$dataSets[[1]]$action
#> [1] "Replace"
#> 
#> $data$dataSets[[1]]$series
#> $data$dataSets[[1]]$series$`0:0:0:0:0`
#> $data$dataSets[[1]]$series$`0:0:0:0:0`$attributes
#> $data$dataSets[[1]]$series$`0:0:0:0:0`$attributes[[1]]
#> [1] 0
#> 
#> $data$dataSets[[1]]$series$`0:0:0:0:0`$attributes[[2]]
#> NULL
#> 
#> $data$dataSets[[1]]$series$`0:0:0:0:0`$attributes[[3]]
#> [1] 0
#> 
#> $data$dataSets[[1]]$series$`0:0:0:0:0`$attributes[[4]]
#> [1] "2010A"
#> 
#> $data$dataSets[[1]]$series$`0:0:0:0:0`$attributes[[5]]
#> [1] "true"
#> 
#> 
#> $data$dataSets[[1]]$series$`0:0:0:0:0`$observations
#> $data$dataSets[[1]]$series$`0:0:0:0:0`$observations$`0`
#> $data$dataSets[[1]]$series$`0:0:0:0:0`$observations$`0`[[1]]
#> [1] "152.7225866809138"
#> 
#> $data$dataSets[[1]]$series$`0:0:0:0:0`$observations$`0`[[2]]
#> NULL
#> 
#> $data$dataSets[[1]]$series$`0:0:0:0:0`$observations$`0`[[3]]
#> [1] 0
#> 
#> $data$dataSets[[1]]$series$`0:0:0:0:0`$observations$`0`[[4]]
#> [1] "2010A"
#> 
#> $data$dataSets[[1]]$series$`0:0:0:0:0`$observations$`0`[[5]]
#> NULL
#> 
#> 
#> $data$dataSets[[1]]$series$`0:0:0:0:0`$observations$`1`
#> $data$dataSets[[1]]$series$`0:0:0:0:0`$observations$`1`[[1]]
#> [1] "153.6870200476484"
#> 
#> $data$dataSets[[1]]$series$`0:0:0:0:0`$observations$`1`[[2]]
#> NULL
#> 
#> $data$dataSets[[1]]$series$`0:0:0:0:0`$observations$`1`[[3]]
#> [1] 0
#> 
#> $data$dataSets[[1]]$series$`0:0:0:0:0`$observations$`1`[[4]]
#> [1] "2010A"
#> 
#> $data$dataSets[[1]]$series$`0:0:0:0:0`$observations$`1`[[5]]
#> NULL
#> 
#> 
#> 
#> 
#> 
#> 
#> 
#> $data$structures
#> $data$structures[[1]]
#> $data$structures[[1]]$dataSets
#> $data$structures[[1]]$dataSets[[1]]
#> [1] 0
#> 
#> 
#> $data$structures[[1]]$links
#> $data$structures[[1]]$links[[1]]
#> $data$structures[[1]]$links[[1]]$urn
#> [1] "urn:sdmx:org.sdmx.infomodel.datastructure.Dataflow=IMF.STA:CPI(5.0.0)"
#> 
#> $data$structures[[1]]$links[[1]]$title
#> [1] "Dataflow"
#> 
#> 
#> $data$structures[[1]]$links[[2]]
#> $data$structures[[1]]$links[[2]]$urn
#> [1] "urn:sdmx:org.sdmx.infomodel.datastructure.DataStructure=IMF.STA:DSD_CPI(5.0.0)"
#> 
#> $data$structures[[1]]$links[[2]]$title
#> [1] "DataStructureDefinition"
#> 
#> 
#> 
#> $data$structures[[1]]$dimensions
#> $data$structures[[1]]$dimensions$series
#> $data$structures[[1]]$dimensions$series[[1]]
#> $data$structures[[1]]$dimensions$series[[1]]$id
#> [1] "COUNTRY"
#> 
#> $data$structures[[1]]$dimensions$series[[1]]$keyPosition
#> [1] 0
#> 
#> $data$structures[[1]]$dimensions$series[[1]]$roles
#> list()
#> 
#> $data$structures[[1]]$dimensions$series[[1]]$values
#> $data$structures[[1]]$dimensions$series[[1]]$values[[1]]
#> $data$structures[[1]]$dimensions$series[[1]]$values[[1]]$id
#> [1] "USA"
#> 
#> 
#> 
#> 
#> $data$structures[[1]]$dimensions$series[[2]]
#> $data$structures[[1]]$dimensions$series[[2]]$id
#> [1] "INDEX_TYPE"
#> 
#> $data$structures[[1]]$dimensions$series[[2]]$keyPosition
#> [1] 1
#> 
#> $data$structures[[1]]$dimensions$series[[2]]$roles
#> list()
#> 
#> $data$structures[[1]]$dimensions$series[[2]]$values
#> $data$structures[[1]]$dimensions$series[[2]]$values[[1]]
#> $data$structures[[1]]$dimensions$series[[2]]$values[[1]]$id
#> [1] "CPI"
#> 
#> 
#> 
#> 
#> $data$structures[[1]]$dimensions$series[[3]]
#> $data$structures[[1]]$dimensions$series[[3]]$id
#> [1] "COICOP_1999"
#> 
#> $data$structures[[1]]$dimensions$series[[3]]$keyPosition
#> [1] 2
#> 
#> $data$structures[[1]]$dimensions$series[[3]]$roles
#> list()
#> 
#> $data$structures[[1]]$dimensions$series[[3]]$values
#> $data$structures[[1]]$dimensions$series[[3]]$values[[1]]
#> $data$structures[[1]]$dimensions$series[[3]]$values[[1]]$id
#> [1] "_T"
#> 
#> 
#> 
#> 
#> $data$structures[[1]]$dimensions$series[[4]]
#> $data$structures[[1]]$dimensions$series[[4]]$id
#> [1] "TYPE_OF_TRANSFORMATION"
#> 
#> $data$structures[[1]]$dimensions$series[[4]]$keyPosition
#> [1] 3
#> 
#> $data$structures[[1]]$dimensions$series[[4]]$roles
#> list()
#> 
#> $data$structures[[1]]$dimensions$series[[4]]$values
#> $data$structures[[1]]$dimensions$series[[4]]$values[[1]]
#> $data$structures[[1]]$dimensions$series[[4]]$values[[1]]$id
#> [1] "IX"
#> 
#> 
#> 
#> 
#> $data$structures[[1]]$dimensions$series[[5]]
#> $data$structures[[1]]$dimensions$series[[5]]$id
#> [1] "FREQUENCY"
#> 
#> $data$structures[[1]]$dimensions$series[[5]]$keyPosition
#> [1] 4
#> 
#> $data$structures[[1]]$dimensions$series[[5]]$roles
#> $data$structures[[1]]$dimensions$series[[5]]$roles[[1]]
#> [1] "FREQ"
#> 
#> 
#> $data$structures[[1]]$dimensions$series[[5]]$values
#> $data$structures[[1]]$dimensions$series[[5]]$values[[1]]
#> $data$structures[[1]]$dimensions$series[[5]]$values[[1]]$id
#> [1] "M"
#> 
#> 
#> 
#> 
#> 
#> $data$structures[[1]]$dimensions$observation
#> $data$structures[[1]]$dimensions$observation[[1]]
#> $data$structures[[1]]$dimensions$observation[[1]]$id
#> [1] "TIME_PERIOD"
#> 
#> $data$structures[[1]]$dimensions$observation[[1]]$keyPosition
#> [1] 5
#> 
#> $data$structures[[1]]$dimensions$observation[[1]]$values
#> $data$structures[[1]]$dimensions$observation[[1]]$values[[1]]
#> $data$structures[[1]]$dimensions$observation[[1]]$values[[1]]$value
#> [1] "2026-M04"
#> 
#> 
#> $data$structures[[1]]$dimensions$observation[[1]]$values[[2]]
#> $data$structures[[1]]$dimensions$observation[[1]]$values[[2]]$value
#> [1] "2026-M05"
#> 
#> 
#> 
#> 
#> 
#> 
#> $data$structures[[1]]$measures
#> $data$structures[[1]]$measures$observation
#> $data$structures[[1]]$measures$observation[[1]]
#> $data$structures[[1]]$measures$observation[[1]]$id
#> [1] "OBS_VALUE"
#> 
#> $data$structures[[1]]$measures$observation[[1]]$roles
#> list()
#> 
#> 
#> 
#> 
#> $data$structures[[1]]$attributes
#> $data$structures[[1]]$attributes$dimensionGroup
#> $data$structures[[1]]$attributes$dimensionGroup[[1]]
#> $data$structures[[1]]$attributes$dimensionGroup[[1]]$id
#> [1] "REPORTING_PERIOD_TYPE"
#> 
#> $data$structures[[1]]$attributes$dimensionGroup[[1]]$roles
#> list()
#> 
#> $data$structures[[1]]$attributes$dimensionGroup[[1]]$isMandatory
#> [1] FALSE
#> 
#> $data$structures[[1]]$attributes$dimensionGroup[[1]]$relationship
#> $data$structures[[1]]$attributes$dimensionGroup[[1]]$relationship$dimensions
#> $data$structures[[1]]$attributes$dimensionGroup[[1]]$relationship$dimensions[[1]]
#> [1] "TYPE_OF_TRANSFORMATION"
#> 
#> 
#> 
#> $data$structures[[1]]$attributes$dimensionGroup[[1]]$values
#> list()
#> 
#> 
#> $data$structures[[1]]$attributes$dimensionGroup[[2]]
#> $data$structures[[1]]$attributes$dimensionGroup[[2]]$id
#> [1] "TRANSFORMATION"
#> 
#> $data$structures[[1]]$attributes$dimensionGroup[[2]]$roles
#> list()
#> 
#> $data$structures[[1]]$attributes$dimensionGroup[[2]]$isMandatory
#> [1] FALSE
#> 
#> $data$structures[[1]]$attributes$dimensionGroup[[2]]$relationship
#> $data$structures[[1]]$attributes$dimensionGroup[[2]]$relationship$dimensions
#> $data$structures[[1]]$attributes$dimensionGroup[[2]]$relationship$dimensions[[1]]
#> [1] "TYPE_OF_TRANSFORMATION"
#> 
#> 
#> 
#> $data$structures[[1]]$attributes$dimensionGroup[[2]]$values
#> list()
#> 
#> 
#> $data$structures[[1]]$attributes$dimensionGroup[[3]]
#> $data$structures[[1]]$attributes$dimensionGroup[[3]]$id
#> [1] "UNIT"
#> 
#> $data$structures[[1]]$attributes$dimensionGroup[[3]]$roles
#> list()
#> 
#> $data$structures[[1]]$attributes$dimensionGroup[[3]]$isMandatory
#> [1] FALSE
#> 
#> $data$structures[[1]]$attributes$dimensionGroup[[3]]$relationship
#> $data$structures[[1]]$attributes$dimensionGroup[[3]]$relationship$dimensions
#> $data$structures[[1]]$attributes$dimensionGroup[[3]]$relationship$dimensions[[1]]
#> [1] "TYPE_OF_TRANSFORMATION"
#> 
#> 
#> 
#> $data$structures[[1]]$attributes$dimensionGroup[[3]]$values
#> list()
#> 
#> 
#> 
#> $data$structures[[1]]$attributes$series
#> $data$structures[[1]]$attributes$series[[1]]
#> $data$structures[[1]]$attributes$series[[1]]$id
#> [1] "SCALE"
#> 
#> $data$structures[[1]]$attributes$series[[1]]$roles
#> list()
#> 
#> $data$structures[[1]]$attributes$series[[1]]$isMandatory
#> [1] FALSE
#> 
#> $data$structures[[1]]$attributes$series[[1]]$relationship
#> $data$structures[[1]]$attributes$series[[1]]$relationship$dimensions
#> $data$structures[[1]]$attributes$series[[1]]$relationship$dimensions[[1]]
#> [1] "COUNTRY"
#> 
#> $data$structures[[1]]$attributes$series[[1]]$relationship$dimensions[[2]]
#> [1] "INDEX_TYPE"
#> 
#> $data$structures[[1]]$attributes$series[[1]]$relationship$dimensions[[3]]
#> [1] "COICOP_1999"
#> 
#> $data$structures[[1]]$attributes$series[[1]]$relationship$dimensions[[4]]
#> [1] "TYPE_OF_TRANSFORMATION"
#> 
#> $data$structures[[1]]$attributes$series[[1]]$relationship$dimensions[[5]]
#> [1] "FREQUENCY"
#> 
#> 
#> 
#> $data$structures[[1]]$attributes$series[[1]]$values
#> $data$structures[[1]]$attributes$series[[1]]$values[[1]]
#> $data$structures[[1]]$attributes$series[[1]]$values[[1]]$id
#> [1] "0"
#> 
#> 
#> 
#> 
#> $data$structures[[1]]$attributes$series[[2]]
#> $data$structures[[1]]$attributes$series[[2]]$id
#> [1] "DECIMALS_DISPLAYED"
#> 
#> $data$structures[[1]]$attributes$series[[2]]$roles
#> list()
#> 
#> $data$structures[[1]]$attributes$series[[2]]$isMandatory
#> [1] FALSE
#> 
#> $data$structures[[1]]$attributes$series[[2]]$relationship
#> $data$structures[[1]]$attributes$series[[2]]$relationship$dimensions
#> $data$structures[[1]]$attributes$series[[2]]$relationship$dimensions[[1]]
#> [1] "COUNTRY"
#> 
#> $data$structures[[1]]$attributes$series[[2]]$relationship$dimensions[[2]]
#> [1] "INDEX_TYPE"
#> 
#> $data$structures[[1]]$attributes$series[[2]]$relationship$dimensions[[3]]
#> [1] "COICOP_1999"
#> 
#> $data$structures[[1]]$attributes$series[[2]]$relationship$dimensions[[4]]
#> [1] "TYPE_OF_TRANSFORMATION"
#> 
#> $data$structures[[1]]$attributes$series[[2]]$relationship$dimensions[[5]]
#> [1] "FREQUENCY"
#> 
#> 
#> 
#> $data$structures[[1]]$attributes$series[[2]]$values
#> list()
#> 
#> 
#> $data$structures[[1]]$attributes$series[[3]]
#> $data$structures[[1]]$attributes$series[[3]]$id
#> [1] "OVERLAP"
#> 
#> $data$structures[[1]]$attributes$series[[3]]$roles
#> list()
#> 
#> $data$structures[[1]]$attributes$series[[3]]$isMandatory
#> [1] FALSE
#> 
#> $data$structures[[1]]$attributes$series[[3]]$relationship
#> $data$structures[[1]]$attributes$series[[3]]$relationship$dimensions
#> $data$structures[[1]]$attributes$series[[3]]$relationship$dimensions[[1]]
#> [1] "COUNTRY"
#> 
#> $data$structures[[1]]$attributes$series[[3]]$relationship$dimensions[[2]]
#> [1] "INDEX_TYPE"
#> 
#> $data$structures[[1]]$attributes$series[[3]]$relationship$dimensions[[3]]
#> [1] "COICOP_1999"
#> 
#> $data$structures[[1]]$attributes$series[[3]]$relationship$dimensions[[4]]
#> [1] "TYPE_OF_TRANSFORMATION"
#> 
#> $data$structures[[1]]$attributes$series[[3]]$relationship$dimensions[[5]]
#> [1] "FREQUENCY"
#> 
#> 
#> 
#> $data$structures[[1]]$attributes$series[[3]]$values
#> $data$structures[[1]]$attributes$series[[3]]$values[[1]]
#> $data$structures[[1]]$attributes$series[[3]]$values[[1]]$id
#> [1] "OL"
#> 
#> 
#> 
#> 
#> $data$structures[[1]]$attributes$series[[4]]
#> $data$structures[[1]]$attributes$series[[4]]$id
#> [1] "COMMON_REFERENCE_PERIOD"
#> 
#> $data$structures[[1]]$attributes$series[[4]]$roles
#> list()
#> 
#> $data$structures[[1]]$attributes$series[[4]]$isMandatory
#> [1] FALSE
#> 
#> $data$structures[[1]]$attributes$series[[4]]$relationship
#> $data$structures[[1]]$attributes$series[[4]]$relationship$dimensions
#> $data$structures[[1]]$attributes$series[[4]]$relationship$dimensions[[1]]
#> [1] "COUNTRY"
#> 
#> $data$structures[[1]]$attributes$series[[4]]$relationship$dimensions[[2]]
#> [1] "INDEX_TYPE"
#> 
#> $data$structures[[1]]$attributes$series[[4]]$relationship$dimensions[[3]]
#> [1] "COICOP_1999"
#> 
#> $data$structures[[1]]$attributes$series[[4]]$relationship$dimensions[[4]]
#> [1] "TYPE_OF_TRANSFORMATION"
#> 
#> $data$structures[[1]]$attributes$series[[4]]$relationship$dimensions[[5]]
#> [1] "FREQUENCY"
#> 
#> 
#> 
#> $data$structures[[1]]$attributes$series[[4]]$values
#> list()
#> 
#> 
#> $data$structures[[1]]$attributes$series[[5]]
#> $data$structures[[1]]$attributes$series[[5]]$id
#> [1] "IFS_FLAG"
#> 
#> $data$structures[[1]]$attributes$series[[5]]$roles
#> list()
#> 
#> $data$structures[[1]]$attributes$series[[5]]$isMandatory
#> [1] FALSE
#> 
#> $data$structures[[1]]$attributes$series[[5]]$relationship
#> $data$structures[[1]]$attributes$series[[5]]$relationship$dimensions
#> $data$structures[[1]]$attributes$series[[5]]$relationship$dimensions[[1]]
#> [1] "COUNTRY"
#> 
#> $data$structures[[1]]$attributes$series[[5]]$relationship$dimensions[[2]]
#> [1] "INDEX_TYPE"
#> 
#> $data$structures[[1]]$attributes$series[[5]]$relationship$dimensions[[3]]
#> [1] "COICOP_1999"
#> 
#> $data$structures[[1]]$attributes$series[[5]]$relationship$dimensions[[4]]
#> [1] "TYPE_OF_TRANSFORMATION"
#> 
#> $data$structures[[1]]$attributes$series[[5]]$relationship$dimensions[[5]]
#> [1] "FREQUENCY"
#> 
#> 
#> 
#> $data$structures[[1]]$attributes$series[[5]]$values
#> list()
#> 
#> 
#> 
#> $data$structures[[1]]$attributes$observation
#> $data$structures[[1]]$attributes$observation[[1]]
#> $data$structures[[1]]$attributes$observation[[1]]$id
#> [1] "PRECISION"
#> 
#> $data$structures[[1]]$attributes$observation[[1]]$roles
#> list()
#> 
#> $data$structures[[1]]$attributes$observation[[1]]$isMandatory
#> [1] FALSE
#> 
#> $data$structures[[1]]$attributes$observation[[1]]$relationship
#> $data$structures[[1]]$attributes$observation[[1]]$relationship$observation
#> named list()
#> 
#> 
#> $data$structures[[1]]$attributes$observation[[1]]$values
#> list()
#> 
#> 
#> $data$structures[[1]]$attributes$observation[[2]]
#> $data$structures[[1]]$attributes$observation[[2]]$id
#> [1] "DERIVATION_TYPE"
#> 
#> $data$structures[[1]]$attributes$observation[[2]]$roles
#> list()
#> 
#> $data$structures[[1]]$attributes$observation[[2]]$isMandatory
#> [1] FALSE
#> 
#> $data$structures[[1]]$attributes$observation[[2]]$relationship
#> $data$structures[[1]]$attributes$observation[[2]]$relationship$observation
#> named list()
#> 
#> 
#> $data$structures[[1]]$attributes$observation[[2]]$values
#> $data$structures[[1]]$attributes$observation[[2]]$values[[1]]
#> $data$structures[[1]]$attributes$observation[[2]]$values[[1]]$id
#> [1] "O"
#> 
#> 
#> 
#> 
#> $data$structures[[1]]$attributes$observation[[3]]
#> $data$structures[[1]]$attributes$observation[[3]]$id
#> [1] "REFERENCE_PERIOD"
#> 
#> $data$structures[[1]]$attributes$observation[[3]]$roles
#> list()
#> 
#> $data$structures[[1]]$attributes$observation[[3]]$isMandatory
#> [1] FALSE
#> 
#> $data$structures[[1]]$attributes$observation[[3]]$relationship
#> $data$structures[[1]]$attributes$observation[[3]]$relationship$observation
#> named list()
#> 
#> 
#> $data$structures[[1]]$attributes$observation[[3]]$values
#> list()
#> 
#> 
#> $data$structures[[1]]$attributes$observation[[4]]
#> $data$structures[[1]]$attributes$observation[[4]]$id
#> [1] "STATUS"
#> 
#> $data$structures[[1]]$attributes$observation[[4]]$roles
#> list()
#> 
#> $data$structures[[1]]$attributes$observation[[4]]$isMandatory
#> [1] FALSE
#> 
#> $data$structures[[1]]$attributes$observation[[4]]$relationship
#> $data$structures[[1]]$attributes$observation[[4]]$relationship$observation
#> named list()
#> 
#> 
#> $data$structures[[1]]$attributes$observation[[4]]$values
#> list()
#> 
#> 
#> 
#> 
#> $data$structures[[1]]$annotations
#> list()
#> 
#> 
#> 
#> 
# }
```

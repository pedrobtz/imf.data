# Query data availability

Retrieve the available dimension values matching a data query without
downloading observations.

## Usage

``` r
sdmx_availability(
  dataflow,
  key = "*",
  component_id = "*",
  agency_id = "IMF.STA",
  version = "+",
  context = "dataflow",
  filters = list(),
  mode = c("exact", "available"),
  references = "none",
  format = c("json", "xml")
)
```

## Arguments

- dataflow:

  Dataflow ID.

- key:

  SDMX series key. Use `"*"` with `filters` for named filtering.

- component_id:

  Dimension for which availability is requested.

- agency_id:

  Maintainer ID.

- version:

  Dataflow version.

- context:

  Query context.

- filters:

  Named list of component filters.

- mode:

  Return exact matches or values that remain available.

- references:

  Referenced artefacts to include.

- format:

  Response format. XML responses are returned as text.

## Value

A nested list for JSON, a character value for XML, or `NULL` for an HTTP
204 response.

## Examples

``` r
# \donttest{
sdmx_availability("CPI", component_id = "COUNTRY")
#> $data
#> $data$dataConstraints
#> $data$dataConstraints[[1]]
#> $data$dataConstraints[[1]]$links
#> $data$dataConstraints[[1]]$links[[1]]
#> $data$dataConstraints[[1]]$links[[1]]$urn
#> [1] "urn:sdmx:org.sdmx.infomodel.registry.DataConstraint=IMF.STA:CPI(5.0.0)"
#> 
#> $data$dataConstraints[[1]]$links[[1]]$type
#> [1] "dataconstraint"
#> 
#> $data$dataConstraints[[1]]$links[[1]]$rel
#> [1] "self"
#> 
#> 
#> 
#> $data$dataConstraints[[1]]$annotations
#> $data$dataConstraints[[1]]$annotations[[1]]
#> $data$dataConstraints[[1]]$annotations[[1]]$id
#> [1] "series_count"
#> 
#> $data$dataConstraints[[1]]$annotations[[1]]$title
#> [1] "29651"
#> 
#> $data$dataConstraints[[1]]$annotations[[1]]$type
#> [1] "sdmx_metrics"
#> 
#> 
#> $data$dataConstraints[[1]]$annotations[[2]]
#> $data$dataConstraints[[1]]$annotations[[2]]$id
#> [1] "time_period_start"
#> 
#> $data$dataConstraints[[1]]$annotations[[2]]$title
#> [1] "1900-01-01"
#> 
#> $data$dataConstraints[[1]]$annotations[[2]]$type
#> [1] "sdmx_metrics"
#> 
#> 
#> $data$dataConstraints[[1]]$annotations[[3]]
#> $data$dataConstraints[[1]]$annotations[[3]]$id
#> [1] "time_period_end"
#> 
#> $data$dataConstraints[[1]]$annotations[[3]]$title
#> [1] "2026-06-01"
#> 
#> $data$dataConstraints[[1]]$annotations[[3]]$type
#> [1] "sdmx_metrics"
#> 
#> 
#> 
#> $data$dataConstraints[[1]]$id
#> [1] "CPI"
#> 
#> $data$dataConstraints[[1]]$name
#> [1] "Data Constraint"
#> 
#> $data$dataConstraints[[1]]$names
#> $data$dataConstraints[[1]]$names$en
#> [1] "Data Constraint"
#> 
#> 
#> $data$dataConstraints[[1]]$description
#> [1] "Data Availability Constraint"
#> 
#> $data$dataConstraints[[1]]$descriptions
#> $data$dataConstraints[[1]]$descriptions$en
#> [1] "Data Availability Constraint"
#> 
#> 
#> $data$dataConstraints[[1]]$version
#> [1] "5.0.0"
#> 
#> $data$dataConstraints[[1]]$agencyID
#> [1] "IMF.STA"
#> 
#> $data$dataConstraints[[1]]$role
#> [1] "Actual"
#> 
#> $data$dataConstraints[[1]]$constraintAttachment
#> $data$dataConstraints[[1]]$constraintAttachment$dataStructures
#> $data$dataConstraints[[1]]$constraintAttachment$dataStructures[[1]]
#> [1] "urn:sdmx:org.sdmx.infomodel.datastructure.DataStructure=IMF.STA:DSD_CPI(5.0.0)"
#> 
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions
#> $data$dataConstraints[[1]]$cubeRegions[[1]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$include
#> [1] TRUE
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$id
#> [1] "COUNTRY"
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$include
#> [1] FALSE
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$removePrefix
#> [1] FALSE
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[1]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[1]]$value
#> [1] "ABW"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[2]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[2]]$value
#> [1] "AFG"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[3]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[3]]$value
#> [1] "AGO"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[4]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[4]]$value
#> [1] "AIA"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[5]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[5]]$value
#> [1] "ALB"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[6]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[6]]$value
#> [1] "ANT"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[7]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[7]]$value
#> [1] "ARE"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[8]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[8]]$value
#> [1] "ARG"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[9]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[9]]$value
#> [1] "ARM"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[10]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[10]]$value
#> [1] "ATG"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[11]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[11]]$value
#> [1] "AUS"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[12]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[12]]$value
#> [1] "AUT"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[13]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[13]]$value
#> [1] "AZE"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[14]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[14]]$value
#> [1] "BDI"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[15]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[15]]$value
#> [1] "BEL"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[16]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[16]]$value
#> [1] "BEN"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[17]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[17]]$value
#> [1] "BFA"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[18]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[18]]$value
#> [1] "BGD"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[19]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[19]]$value
#> [1] "BGR"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[20]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[20]]$value
#> [1] "BHR"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[21]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[21]]$value
#> [1] "BHS"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[22]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[22]]$value
#> [1] "BIH"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[23]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[23]]$value
#> [1] "BLR"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[24]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[24]]$value
#> [1] "BLZ"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[25]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[25]]$value
#> [1] "BOL"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[26]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[26]]$value
#> [1] "BRA"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[27]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[27]]$value
#> [1] "BRB"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[28]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[28]]$value
#> [1] "BRN"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[29]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[29]]$value
#> [1] "BTN"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[30]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[30]]$value
#> [1] "BWA"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[31]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[31]]$value
#> [1] "CAF"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[32]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[32]]$value
#> [1] "CAN"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[33]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[33]]$value
#> [1] "CHE"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[34]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[34]]$value
#> [1] "CHL"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[35]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[35]]$value
#> [1] "CHN"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[36]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[36]]$value
#> [1] "CIV"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[37]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[37]]$value
#> [1] "CMR"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[38]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[38]]$value
#> [1] "COD"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[39]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[39]]$value
#> [1] "COG"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[40]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[40]]$value
#> [1] "COL"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[41]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[41]]$value
#> [1] "COM"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[42]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[42]]$value
#> [1] "CPV"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[43]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[43]]$value
#> [1] "CRI"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[44]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[44]]$value
#> [1] "CUW"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[45]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[45]]$value
#> [1] "CYM"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[46]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[46]]$value
#> [1] "CYP"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[47]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[47]]$value
#> [1] "CZE"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[48]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[48]]$value
#> [1] "DEU"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[49]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[49]]$value
#> [1] "DJI"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[50]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[50]]$value
#> [1] "DMA"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[51]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[51]]$value
#> [1] "DNK"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[52]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[52]]$value
#> [1] "DOM"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[53]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[53]]$value
#> [1] "DZA"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[54]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[54]]$value
#> [1] "ECU"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[55]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[55]]$value
#> [1] "EGY"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[56]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[56]]$value
#> [1] "ESP"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[57]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[57]]$value
#> [1] "EST"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[58]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[58]]$value
#> [1] "ETH"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[59]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[59]]$value
#> [1] "FIN"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[60]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[60]]$value
#> [1] "FJI"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[61]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[61]]$value
#> [1] "FRA"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[62]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[62]]$value
#> [1] "FSM"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[63]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[63]]$value
#> [1] "G163"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[64]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[64]]$value
#> [1] "GAB"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[65]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[65]]$value
#> [1] "GBR"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[66]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[66]]$value
#> [1] "GEO"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[67]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[67]]$value
#> [1] "GHA"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[68]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[68]]$value
#> [1] "GIN"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[69]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[69]]$value
#> [1] "GLP"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[70]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[70]]$value
#> [1] "GMB"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[71]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[71]]$value
#> [1] "GNB"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[72]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[72]]$value
#> [1] "GNQ"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[73]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[73]]$value
#> [1] "GRC"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[74]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[74]]$value
#> [1] "GRD"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[75]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[75]]$value
#> [1] "GRL"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[76]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[76]]$value
#> [1] "GTM"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[77]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[77]]$value
#> [1] "GUY"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[78]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[78]]$value
#> [1] "HKG"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[79]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[79]]$value
#> [1] "HND"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[80]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[80]]$value
#> [1] "HRV"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[81]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[81]]$value
#> [1] "HTI"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[82]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[82]]$value
#> [1] "HUN"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[83]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[83]]$value
#> [1] "IDN"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[84]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[84]]$value
#> [1] "IND"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[85]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[85]]$value
#> [1] "IRL"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[86]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[86]]$value
#> [1] "IRN"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[87]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[87]]$value
#> [1] "IRQ"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[88]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[88]]$value
#> [1] "ISL"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[89]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[89]]$value
#> [1] "ISR"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[90]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[90]]$value
#> [1] "ITA"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[91]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[91]]$value
#> [1] "JAM"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[92]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[92]]$value
#> [1] "JOR"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[93]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[93]]$value
#> [1] "JPN"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[94]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[94]]$value
#> [1] "KAZ"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[95]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[95]]$value
#> [1] "KEN"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[96]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[96]]$value
#> [1] "KGZ"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[97]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[97]]$value
#> [1] "KHM"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[98]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[98]]$value
#> [1] "KIR"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[99]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[99]]$value
#> [1] "KNA"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[100]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[100]]$value
#> [1] "KOR"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[101]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[101]]$value
#> [1] "KOS"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[102]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[102]]$value
#> [1] "KWT"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[103]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[103]]$value
#> [1] "LAO"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[104]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[104]]$value
#> [1] "LBN"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[105]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[105]]$value
#> [1] "LBR"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[106]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[106]]$value
#> [1] "LBY"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[107]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[107]]$value
#> [1] "LCA"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[108]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[108]]$value
#> [1] "LKA"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[109]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[109]]$value
#> [1] "LSO"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[110]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[110]]$value
#> [1] "LTU"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[111]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[111]]$value
#> [1] "LUX"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[112]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[112]]$value
#> [1] "LVA"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[113]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[113]]$value
#> [1] "MAC"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[114]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[114]]$value
#> [1] "MAR"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[115]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[115]]$value
#> [1] "MDA"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[116]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[116]]$value
#> [1] "MDG"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[117]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[117]]$value
#> [1] "MDV"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[118]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[118]]$value
#> [1] "MEX"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[119]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[119]]$value
#> [1] "MKD"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[120]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[120]]$value
#> [1] "MLI"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[121]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[121]]$value
#> [1] "MLT"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[122]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[122]]$value
#> [1] "MMR"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[123]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[123]]$value
#> [1] "MNE"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[124]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[124]]$value
#> [1] "MNG"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[125]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[125]]$value
#> [1] "MOZ"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[126]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[126]]$value
#> [1] "MRT"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[127]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[127]]$value
#> [1] "MSR"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[128]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[128]]$value
#> [1] "MTQ"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[129]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[129]]$value
#> [1] "MUS"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[130]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[130]]$value
#> [1] "MWI"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[131]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[131]]$value
#> [1] "MYS"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[132]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[132]]$value
#> [1] "NAM"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[133]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[133]]$value
#> [1] "NCL"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[134]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[134]]$value
#> [1] "NER"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[135]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[135]]$value
#> [1] "NGA"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[136]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[136]]$value
#> [1] "NIC"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[137]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[137]]$value
#> [1] "NLD"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[138]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[138]]$value
#> [1] "NOR"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[139]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[139]]$value
#> [1] "NPL"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[140]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[140]]$value
#> [1] "NRU"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[141]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[141]]$value
#> [1] "NZL"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[142]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[142]]$value
#> [1] "OMN"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[143]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[143]]$value
#> [1] "PAK"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[144]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[144]]$value
#> [1] "PAN"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[145]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[145]]$value
#> [1] "PER"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[146]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[146]]$value
#> [1] "PHL"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[147]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[147]]$value
#> [1] "PLW"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[148]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[148]]$value
#> [1] "PNG"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[149]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[149]]$value
#> [1] "POL"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[150]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[150]]$value
#> [1] "PRT"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[151]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[151]]$value
#> [1] "PRY"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[152]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[152]]$value
#> [1] "QAT"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[153]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[153]]$value
#> [1] "ROU"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[154]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[154]]$value
#> [1] "RUS"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[155]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[155]]$value
#> [1] "RWA"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[156]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[156]]$value
#> [1] "SAU"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[157]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[157]]$value
#> [1] "SDN"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[158]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[158]]$value
#> [1] "SEN"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[159]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[159]]$value
#> [1] "SGP"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[160]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[160]]$value
#> [1] "SLB"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[161]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[161]]$value
#> [1] "SLE"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[162]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[162]]$value
#> [1] "SLV"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[163]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[163]]$value
#> [1] "SMR"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[164]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[164]]$value
#> [1] "SOM"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[165]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[165]]$value
#> [1] "SRB"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[166]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[166]]$value
#> [1] "SSD"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[167]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[167]]$value
#> [1] "STP"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[168]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[168]]$value
#> [1] "SUR"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[169]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[169]]$value
#> [1] "SVK"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[170]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[170]]$value
#> [1] "SVN"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[171]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[171]]$value
#> [1] "SWE"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[172]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[172]]$value
#> [1] "SWZ"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[173]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[173]]$value
#> [1] "SXM"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[174]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[174]]$value
#> [1] "SYC"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[175]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[175]]$value
#> [1] "SYR"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[176]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[176]]$value
#> [1] "TCD"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[177]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[177]]$value
#> [1] "TGO"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[178]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[178]]$value
#> [1] "THA"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[179]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[179]]$value
#> [1] "TJK"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[180]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[180]]$value
#> [1] "TLS"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[181]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[181]]$value
#> [1] "TON"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[182]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[182]]$value
#> [1] "TTO"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[183]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[183]]$value
#> [1] "TUN"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[184]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[184]]$value
#> [1] "TUR"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[185]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[185]]$value
#> [1] "TUV"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[186]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[186]]$value
#> [1] "TZA"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[187]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[187]]$value
#> [1] "UGA"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[188]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[188]]$value
#> [1] "UKR"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[189]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[189]]$value
#> [1] "URY"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[190]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[190]]$value
#> [1] "USA"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[191]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[191]]$value
#> [1] "UZB"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[192]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[192]]$value
#> [1] "VCT"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[193]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[193]]$value
#> [1] "VEN"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[194]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[194]]$value
#> [1] "VGB"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[195]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[195]]$value
#> [1] "VNM"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[196]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[196]]$value
#> [1] "VUT"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[197]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[197]]$value
#> [1] "WBG"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[198]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[198]]$value
#> [1] "WSM"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[199]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[199]]$value
#> [1] "YEM"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[200]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[200]]$value
#> [1] "ZAF"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[201]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[201]]$value
#> [1] "ZMB"
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[202]]
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$components[[1]]$values[[202]]$value
#> [1] "ZWE"
#> 
#> 
#> 
#> 
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$keyValues
#> list()
#> 
#> $data$dataConstraints[[1]]$cubeRegions[[1]]$annotations
#> list()
#> 
#> 
#> 
#> 
#> 
#> 
#> $meta
#> $meta$schema
#> [1] "https://raw.githubusercontent.com/sdmx-twg/sdmx-json/master/metadata-message/tools/schemas/2.0.0/sdmx-json-metadata-schema.json"
#> 
#> $meta$id
#> [1] "IDREF6927"
#> 
#> $meta$test
#> [1] FALSE
#> 
#> $meta$prepared
#> [1] "2026-06-17T06:50:28.047564564Z"
#> 
#> $meta$contentLanguages
#> $meta$contentLanguages[[1]]
#> [1] "en"
#> 
#> 
#> $meta$sender
#> $meta$sender$id
#> [1] "unknown"
#> 
#> 
#> 
# }
```

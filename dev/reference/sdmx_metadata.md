# Query metadata reports

Retrieve metadatasets from the IMF SDMX API.

## Usage

``` r
sdmx_metadata(
  provider_id = "*",
  metadataset_id = "*",
  version = "+",
  detail = c("allstubs", "full"),
  format = c("json", "xml")
)
```

## Arguments

- provider_id:

  Metadata provider ID.

- metadataset_id:

  Metadataset ID.

- version:

  Metadataset version.

- detail:

  Metadata detail level.

- format:

  Response format. XML responses are returned as text.

## Value

A nested list for JSON, a character value for XML, or `NULL` for an HTTP
204 response.

## Examples

``` r
# \donttest{
sdmx_metadata(detail = "allstubs")
#> $data
#> $data$metadataSets
#> $data$metadataSets[[1]]
#> $data$metadataSets[[1]]$annotations
#> list()
#> 
#> $data$metadataSets[[1]]$id
#> [1] "LFSI"
#> 
#> $data$metadataSets[[1]]$name
#> [1] "Financial Soundness Indicators (FSIs)"
#> 
#> $data$metadataSets[[1]]$names
#> $data$metadataSets[[1]]$names$en
#> [1] "Financial Soundness Indicators (FSIs)"
#> 
#> 
#> $data$metadataSets[[1]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[1]]$agencyID
#> [1] "IMF.STA"
#> 
#> $data$metadataSets[[1]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[1]]$attributes
#> list()
#> 
#> $data$metadataSets[[1]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[2]]
#> $data$metadataSets[[2]]$annotations
#> list()
#> 
#> $data$metadataSets[[2]]$id
#> [1] "LMFS"
#> 
#> $data$metadataSets[[2]]$name
#> [1] "Monetary and Financial Statistics (MFS)"
#> 
#> $data$metadataSets[[2]]$names
#> $data$metadataSets[[2]]$names$en
#> [1] "Monetary and Financial Statistics (MFS)"
#> 
#> 
#> $data$metadataSets[[2]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[2]]$agencyID
#> [1] "IMF.STA"
#> 
#> $data$metadataSets[[2]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[2]]$attributes
#> list()
#> 
#> $data$metadataSets[[2]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[3]]
#> $data$metadataSets[[3]]$annotations
#> list()
#> 
#> $data$metadataSets[[3]]$id
#> [1] "LGFS"
#> 
#> $data$metadataSets[[3]]$name
#> [1] "Government Finance Statistics (GFS)"
#> 
#> $data$metadataSets[[3]]$names
#> $data$metadataSets[[3]]$names$en
#> [1] "Government Finance Statistics (GFS)"
#> 
#> 
#> $data$metadataSets[[3]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[3]]$agencyID
#> [1] "IMF.STA"
#> 
#> $data$metadataSets[[3]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[3]]$attributes
#> list()
#> 
#> $data$metadataSets[[3]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[4]]
#> $data$metadataSets[[4]]$annotations
#> list()
#> 
#> $data$metadataSets[[4]]$id
#> [1] "GFA"
#> 
#> $data$metadataSets[[4]]$name
#> [1] "Global Fiscal Actions (GFA)"
#> 
#> $data$metadataSets[[4]]$names
#> $data$metadataSets[[4]]$names$en
#> [1] "Global Fiscal Actions (GFA)"
#> 
#> 
#> $data$metadataSets[[4]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[4]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[4]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[4]]$attributes
#> list()
#> 
#> $data$metadataSets[[4]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[5]]
#> $data$metadataSets[[5]]$annotations
#> list()
#> 
#> $data$metadataSets[[5]]$id
#> [1] "WBQPSD"
#> 
#> $data$metadataSets[[5]]$name
#> [1] "WB Quarterly Public Sector Debt"
#> 
#> $data$metadataSets[[5]]$names
#> $data$metadataSets[[5]]$names$en
#> [1] "WB Quarterly Public Sector Debt"
#> 
#> 
#> $data$metadataSets[[5]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[5]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[5]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[5]]$attributes
#> list()
#> 
#> $data$metadataSets[[5]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[6]]
#> $data$metadataSets[[6]]$annotations
#> list()
#> 
#> $data$metadataSets[[6]]$id
#> [1] "CID"
#> 
#> $data$metadataSets[[6]]$name
#> [1] "Macroeconomic Climate Indicators Dashboard "
#> 
#> $data$metadataSets[[6]]$names
#> $data$metadataSets[[6]]$names$en
#> [1] "Macroeconomic Climate Indicators Dashboard "
#> 
#> 
#> $data$metadataSets[[6]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[6]]$agencyID
#> [1] "IMF.STA"
#> 
#> $data$metadataSets[[6]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[6]]$attributes
#> list()
#> 
#> $data$metadataSets[[6]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[7]]
#> $data$metadataSets[[7]]$annotations
#> list()
#> 
#> $data$metadataSets[[7]]$id
#> [1] "SSBIG"
#> 
#> $data$metadataSets[[7]]$name
#> [1] "G20 Strong, Sustainable, Balanced, and Inclusive Growth (SSBIG) Dashboard"
#> 
#> $data$metadataSets[[7]]$names
#> $data$metadataSets[[7]]$names$en
#> [1] "G20 Strong, Sustainable, Balanced, and Inclusive Growth (SSBIG) Dashboard"
#> 
#> 
#> $data$metadataSets[[7]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[7]]$agencyID
#> [1] "IMF.RES"
#> 
#> $data$metadataSets[[7]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[7]]$attributes
#> list()
#> 
#> $data$metadataSets[[7]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[8]]
#> $data$metadataSets[[8]]$annotations
#> list()
#> 
#> $data$metadataSets[[8]]$id
#> [1] "LPCPS"
#> 
#> $data$metadataSets[[8]]$name
#> [1] "Primary Commodity Prices (PCPS)"
#> 
#> $data$metadataSets[[8]]$names
#> $data$metadataSets[[8]]$names$en
#> [1] "Primary Commodity Prices (PCPS)"
#> 
#> 
#> $data$metadataSets[[8]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[8]]$agencyID
#> [1] "IMF.RES"
#> 
#> $data$metadataSets[[8]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[8]]$attributes
#> list()
#> 
#> $data$metadataSets[[8]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[9]]
#> $data$metadataSets[[9]]$annotations
#> list()
#> 
#> $data$metadataSets[[9]]$id
#> [1] "BiTS"
#> 
#> $data$metadataSets[[9]]$name
#> [1] "Bilateral Trade in Services Research Dataset (BiTS)"
#> 
#> $data$metadataSets[[9]]$names
#> $data$metadataSets[[9]]$names$en
#> [1] "Bilateral Trade in Services Research Dataset (BiTS)"
#> 
#> 
#> $data$metadataSets[[9]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[9]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[9]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[9]]$attributes
#> list()
#> 
#> $data$metadataSets[[9]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[10]]
#> $data$metadataSets[[10]]$annotations
#> list()
#> 
#> $data$metadataSets[[10]]$id
#> [1] "PORTWATCH"
#> 
#> $data$metadataSets[[10]]$name
#> [1] "IMF PortWatch"
#> 
#> $data$metadataSets[[10]]$names
#> $data$metadataSets[[10]]$names$en
#> [1] "IMF PortWatch"
#> 
#> 
#> $data$metadataSets[[10]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[10]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[10]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[10]]$attributes
#> list()
#> 
#> $data$metadataSets[[10]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[11]]
#> $data$metadataSets[[11]]$annotations
#> list()
#> 
#> $data$metadataSets[[11]]$id
#> [1] "LCBLD"
#> 
#> $data$metadataSets[[11]]$name
#> [1] "Central Bank Legislation Database (CBLD)"
#> 
#> $data$metadataSets[[11]]$names
#> $data$metadataSets[[11]]$names$en
#> [1] "Central Bank Legislation Database (CBLD)"
#> 
#> 
#> $data$metadataSets[[11]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[11]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[11]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[11]]$attributes
#> list()
#> 
#> $data$metadataSets[[11]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[12]]
#> $data$metadataSets[[12]]$annotations
#> list()
#> 
#> $data$metadataSets[[12]]$id
#> [1] "WBQEDS"
#> 
#> $data$metadataSets[[12]]$name
#> [1] "WB Quarterly External Debt Statistics"
#> 
#> $data$metadataSets[[12]]$names
#> $data$metadataSets[[12]]$names$en
#> [1] "WB Quarterly External Debt Statistics"
#> 
#> 
#> $data$metadataSets[[12]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[12]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[12]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[12]]$attributes
#> list()
#> 
#> $data$metadataSets[[12]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[13]]
#> $data$metadataSets[[13]]$annotations
#> list()
#> 
#> $data$metadataSets[[13]]$id
#> [1] "ISFD"
#> 
#> $data$metadataSets[[13]]$name
#> [1] "International Stablecoin Flow Dataset (ISFD)"
#> 
#> $data$metadataSets[[13]]$names
#> $data$metadataSets[[13]]$names$en
#> [1] "International Stablecoin Flow Dataset (ISFD)"
#> 
#> 
#> $data$metadataSets[[13]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[13]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[13]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[13]]$attributes
#> list()
#> 
#> $data$metadataSets[[13]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[14]]
#> $data$metadataSets[[14]]$annotations
#> list()
#> 
#> $data$metadataSets[[14]]$id
#> [1] "CBLD"
#> 
#> $data$metadataSets[[14]]$name
#> [1] "Central Bank Legislation Database (CBLD)"
#> 
#> $data$metadataSets[[14]]$names
#> $data$metadataSets[[14]]$names$en
#> [1] "Central Bank Legislation Database (CBLD)"
#> 
#> 
#> $data$metadataSets[[14]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[14]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[14]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[14]]$attributes
#> list()
#> 
#> $data$metadataSets[[14]]$targets
#> list()
#> 
#> 
#> 
#> 
#> $meta
#> $meta$schema
#> [1] "https://raw.githubusercontent.com/sdmx-twg/sdmx-json/master/metadata-message/tools/schemas/2.0.0/sdmx-json-metadata-schema.json"
#> 
#> $meta$id
#> [1] "IDREF5230"
#> 
#> $meta$test
#> [1] FALSE
#> 
#> $meta$prepared
#> [1] "2026-11-15T06:35:01.828816241Z"
#> 
#> $meta$contentLanguages
#> $meta$contentLanguages[[1]]
#> [1] "en"
#> 
#> 
#> $meta$sender
#> $meta$sender$id
#> [1] "IMF"
#> 
#> 
#> 
# }
```

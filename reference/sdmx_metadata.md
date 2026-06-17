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
#> [1] "FACTSET"
#> 
#> $data$metadataSets[[1]]$name
#> [1] "FactSet"
#> 
#> $data$metadataSets[[1]]$names
#> $data$metadataSets[[1]]$names$en
#> [1] "FactSet"
#> 
#> 
#> $data$metadataSets[[1]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[1]]$agencyID
#> [1] "IMF"
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
#> [1] "ECONOMETRICA"
#> 
#> $data$metadataSets[[2]]$name
#> [1] "Econometrica"
#> 
#> $data$metadataSets[[2]]$names
#> $data$metadataSets[[2]]$names$en
#> [1] "Econometrica"
#> 
#> 
#> $data$metadataSets[[2]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[2]]$agencyID
#> [1] "IMF"
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
#> [1] "COUNTRYDATA_ONLINE_CDO_THE_PRS_GROUP"
#> 
#> $data$metadataSets[[3]]$name
#> [1] "CountryData Online (CDO) - The PRS Group"
#> 
#> $data$metadataSets[[3]]$names
#> $data$metadataSets[[3]]$names$en
#> [1] "CountryData Online (CDO) - The PRS Group"
#> 
#> 
#> $data$metadataSets[[3]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[3]]$agencyID
#> [1] "IMF"
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
#> [1] "CMIE_CONSUMER_PYRAMIDS"
#> 
#> $data$metadataSets[[4]]$name
#> [1] "CMIE Consumer Pyramids"
#> 
#> $data$metadataSets[[4]]$names
#> $data$metadataSets[[4]]$names$en
#> [1] "CMIE Consumer Pyramids"
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
#> [1] "FITCH_RATINGS_PRO_FUNDAMENTAL_FINANCIALS_DATA"
#> 
#> $data$metadataSets[[5]]$name
#> [1] "Fitch Ratings Pro - Fundamental Financials Data"
#> 
#> $data$metadataSets[[5]]$names
#> $data$metadataSets[[5]]$names$en
#> [1] "Fitch Ratings Pro - Fundamental Financials Data"
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
#> [1] "S_P_RATINGSDIRECT"
#> 
#> $data$metadataSets[[6]]$name
#> [1] "S&P RatingsDirect"
#> 
#> $data$metadataSets[[6]]$names
#> $data$metadataSets[[6]]$names$en
#> [1] "S&P RatingsDirect"
#> 
#> 
#> $data$metadataSets[[6]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[6]]$agencyID
#> [1] "IMF"
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
#> [1] "JUPITER_CLIMATE_SCORE_GLOBAL"
#> 
#> $data$metadataSets[[7]]$name
#> [1] "Jupiter Climate Score Global"
#> 
#> $data$metadataSets[[7]]$names
#> $data$metadataSets[[7]]$names$en
#> [1] "Jupiter Climate Score Global"
#> 
#> 
#> $data$metadataSets[[7]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[7]]$agencyID
#> [1] "IMF"
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
#> [1] "S_P_CAPITAL_IQ-AFTERMARKET_RESEARCH"
#> 
#> $data$metadataSets[[8]]$name
#> [1] "S&P Capital IQ - Aftermarket Research"
#> 
#> $data$metadataSets[[8]]$names
#> $data$metadataSets[[8]]$names$en
#> [1] "S&P Capital IQ - Aftermarket Research"
#> 
#> 
#> $data$metadataSets[[8]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[8]]$agencyID
#> [1] "IMF"
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
#> [1] "CEIC"
#> 
#> $data$metadataSets[[9]]$name
#> [1] "CEIC"
#> 
#> $data$metadataSets[[9]]$names
#> $data$metadataSets[[9]]$names$en
#> [1] "CEIC"
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
#> [1] "SP_CAPITAL_IQ_-_COMPUSTAT"
#> 
#> $data$metadataSets[[10]]$name
#> [1] "S&P Capital IQ - Compustat"
#> 
#> $data$metadataSets[[10]]$names
#> $data$metadataSets[[10]]$names$en
#> [1] "S&P Capital IQ - Compustat"
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
#> [1] "PREMISE"
#> 
#> $data$metadataSets[[11]]$name
#> [1] "Premise"
#> 
#> $data$metadataSets[[11]]$names
#> $data$metadataSets[[11]]$names$en
#> [1] "Premise"
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
#> [1] "MEFP"
#> 
#> $data$metadataSets[[12]]$name
#> [1] "MEFP Macro-Financial Commitments"
#> 
#> $data$metadataSets[[12]]$names
#> $data$metadataSets[[12]]$names$en
#> [1] "MEFP Macro-Financial Commitments"
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
#> [1] "mds-0391ad3e-f5da-4a1e-b538-f25999bc7918"
#> 
#> $data$metadataSets[[13]]$name
#> [1] "USER20____DEFAULT_ANSWER"
#> 
#> $data$metadataSets[[13]]$names
#> $data$metadataSets[[13]]$names$en
#> [1] "USER20____DEFAULT_ANSWER"
#> 
#> 
#> $data$metadataSets[[13]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[13]]$agencyID
#> [1] "IMF.FAD"
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
#> [1] "FITCH_RATINGS_PRO_-_FITCH_FUNDAMENTAL_FINANCIALS_DATA"
#> 
#> $data$metadataSets[[14]]$name
#> [1] "Fitch Ratings Pro - Fitch Fundamental Financials Data"
#> 
#> $data$metadataSets[[14]]$names
#> $data$metadataSets[[14]]$names$en
#> [1] "Fitch Ratings Pro - Fitch Fundamental Financials Data"
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
#> $data$metadataSets[[15]]
#> $data$metadataSets[[15]]$annotations
#> list()
#> 
#> $data$metadataSets[[15]]$id
#> [1] "EARTHMETRY"
#> 
#> $data$metadataSets[[15]]$name
#> [1] "Earthmetry"
#> 
#> $data$metadataSets[[15]]$names
#> $data$metadataSets[[15]]$names$en
#> [1] "Earthmetry"
#> 
#> 
#> $data$metadataSets[[15]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[15]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[15]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[15]]$attributes
#> list()
#> 
#> $data$metadataSets[[15]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[16]]
#> $data$metadataSets[[16]]$annotations
#> list()
#> 
#> $data$metadataSets[[16]]$id
#> [1] "THE_PRS_GROUP_INTERNATIONAL_COUNTRY_RISK_GUIDE_ICRG"
#> 
#> $data$metadataSets[[16]]$name
#> [1] "The PRS Group - International Country Risk Guide (ICRG)"
#> 
#> $data$metadataSets[[16]]$names
#> $data$metadataSets[[16]]$names$en
#> [1] "The PRS Group - International Country Risk Guide (ICRG)"
#> 
#> 
#> $data$metadataSets[[16]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[16]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[16]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[16]]$attributes
#> list()
#> 
#> $data$metadataSets[[16]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[17]]
#> $data$metadataSets[[17]]$annotations
#> list()
#> 
#> $data$metadataSets[[17]]$id
#> [1] "CDP"
#> 
#> $data$metadataSets[[17]]$name
#> [1] "CDP"
#> 
#> $data$metadataSets[[17]]$names
#> $data$metadataSets[[17]]$names$en
#> [1] "CDP"
#> 
#> 
#> $data$metadataSets[[17]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[17]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[17]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[17]]$attributes
#> list()
#> 
#> $data$metadataSets[[17]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[18]]
#> $data$metadataSets[[18]]$annotations
#> list()
#> 
#> $data$metadataSets[[18]]$id
#> [1] "LIGHTCAST"
#> 
#> $data$metadataSets[[18]]$name
#> [1] "Lightcast"
#> 
#> $data$metadataSets[[18]]$names
#> $data$metadataSets[[18]]$names$en
#> [1] "Lightcast"
#> 
#> 
#> $data$metadataSets[[18]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[18]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[18]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[18]]$attributes
#> list()
#> 
#> $data$metadataSets[[18]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[19]]
#> $data$metadataSets[[19]]$annotations
#> list()
#> 
#> $data$metadataSets[[19]]$id
#> [1] "CBONDS"
#> 
#> $data$metadataSets[[19]]$name
#> [1] "Cbonds"
#> 
#> $data$metadataSets[[19]]$names
#> $data$metadataSets[[19]]$names$en
#> [1] "Cbonds"
#> 
#> 
#> $data$metadataSets[[19]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[19]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[19]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[19]]$attributes
#> list()
#> 
#> $data$metadataSets[[19]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[20]]
#> $data$metadataSets[[20]]$annotations
#> list()
#> 
#> $data$metadataSets[[20]]$id
#> [1] "EUROSTAT"
#> 
#> $data$metadataSets[[20]]$name
#> [1] "Eurostat"
#> 
#> $data$metadataSets[[20]]$names
#> $data$metadataSets[[20]]$names$en
#> [1] "Eurostat"
#> 
#> 
#> $data$metadataSets[[20]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[20]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[20]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[20]]$attributes
#> list()
#> 
#> $data$metadataSets[[20]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[21]]
#> $data$metadataSets[[21]]$annotations
#> list()
#> 
#> $data$metadataSets[[21]]$id
#> [1] "IBES_GLOBAL_AGGREGATES"
#> 
#> $data$metadataSets[[21]]$name
#> [1] "IBES Global Aggregates"
#> 
#> $data$metadataSets[[21]]$names
#> $data$metadataSets[[21]]$names$en
#> [1] "IBES Global Aggregates"
#> 
#> 
#> $data$metadataSets[[21]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[21]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[21]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[21]]$attributes
#> list()
#> 
#> $data$metadataSets[[21]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[22]]
#> $data$metadataSets[[22]]$annotations
#> list()
#> 
#> $data$metadataSets[[22]]$id
#> [1] "PRIVATE_EQUITY_INTERNATIONAL_PEI"
#> 
#> $data$metadataSets[[22]]$name
#> [1] "Private Equity International (PEI)"
#> 
#> $data$metadataSets[[22]]$names
#> $data$metadataSets[[22]]$names$en
#> [1] "Private Equity International (PEI)"
#> 
#> 
#> $data$metadataSets[[22]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[22]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[22]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[22]]$attributes
#> list()
#> 
#> $data$metadataSets[[22]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[23]]
#> $data$metadataSets[[23]]$annotations
#> list()
#> 
#> $data$metadataSets[[23]]$id
#> [1] "INTERNATIONAL_HISTORICAL_STATISTICS"
#> 
#> $data$metadataSets[[23]]$name
#> [1] "International Historical Statistics"
#> 
#> $data$metadataSets[[23]]$names
#> $data$metadataSets[[23]]$names$en
#> [1] "International Historical Statistics"
#> 
#> 
#> $data$metadataSets[[23]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[23]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[23]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[23]]$attributes
#> list()
#> 
#> $data$metadataSets[[23]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[24]]
#> $data$metadataSets[[24]]$annotations
#> list()
#> 
#> $data$metadataSets[[24]]$id
#> [1] "INDEED"
#> 
#> $data$metadataSets[[24]]$name
#> [1] "Indeed"
#> 
#> $data$metadataSets[[24]]$names
#> $data$metadataSets[[24]]$names$en
#> [1] "Indeed"
#> 
#> 
#> $data$metadataSets[[24]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[24]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[24]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[24]]$attributes
#> list()
#> 
#> $data$metadataSets[[24]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[25]]
#> $data$metadataSets[[25]]$annotations
#> list()
#> 
#> $data$metadataSets[[25]]$id
#> [1] "QUADRANT"
#> 
#> $data$metadataSets[[25]]$name
#> [1] "Quadrant"
#> 
#> $data$metadataSets[[25]]$names
#> $data$metadataSets[[25]]$names$en
#> [1] "Quadrant"
#> 
#> 
#> $data$metadataSets[[25]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[25]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[25]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[25]]$attributes
#> list()
#> 
#> $data$metadataSets[[25]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[26]]
#> $data$metadataSets[[26]]$annotations
#> list()
#> 
#> $data$metadataSets[[26]]$id
#> [1] "WORLD_INTEGRATED_TRADE_SOLUTION_WITS"
#> 
#> $data$metadataSets[[26]]$name
#> [1] "World Integrated Trade Solution (WITS)"
#> 
#> $data$metadataSets[[26]]$names
#> $data$metadataSets[[26]]$names$en
#> [1] "World Integrated Trade Solution (WITS)"
#> 
#> 
#> $data$metadataSets[[26]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[26]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[26]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[26]]$attributes
#> list()
#> 
#> $data$metadataSets[[26]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[27]]
#> $data$metadataSets[[27]]$annotations
#> list()
#> 
#> $data$metadataSets[[27]]$id
#> [1] "OECD_ECONOMIC_OUTLOOK"
#> 
#> $data$metadataSets[[27]]$name
#> [1] "OECD Economic Outlook"
#> 
#> $data$metadataSets[[27]]$names
#> $data$metadataSets[[27]]$names$en
#> [1] "OECD Economic Outlook"
#> 
#> 
#> $data$metadataSets[[27]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[27]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[27]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[27]]$attributes
#> list()
#> 
#> $data$metadataSets[[27]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[28]]
#> $data$metadataSets[[28]]$annotations
#> list()
#> 
#> $data$metadataSets[[28]]$id
#> [1] "GLOBAL_PETROL_PRICES"
#> 
#> $data$metadataSets[[28]]$name
#> [1] "Global Petrol Prices"
#> 
#> $data$metadataSets[[28]]$names
#> $data$metadataSets[[28]]$names$en
#> [1] "Global Petrol Prices"
#> 
#> 
#> $data$metadataSets[[28]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[28]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[28]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[28]]$attributes
#> list()
#> 
#> $data$metadataSets[[28]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[29]]
#> $data$metadataSets[[29]]$annotations
#> list()
#> 
#> $data$metadataSets[[29]]$id
#> [1] "mds-332b67a2-b03d-4703-a847-45a4be2c7d38"
#> 
#> $data$metadataSets[[29]]$name
#> [1] "137____DEFAULT_ANSWER"
#> 
#> $data$metadataSets[[29]]$names
#> $data$metadataSets[[29]]$names$en
#> [1] "137____DEFAULT_ANSWER"
#> 
#> 
#> $data$metadataSets[[29]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[29]]$agencyID
#> [1] "IMF.STA.DS"
#> 
#> $data$metadataSets[[29]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[29]]$attributes
#> list()
#> 
#> $data$metadataSets[[29]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[30]]
#> $data$metadataSets[[30]]$annotations
#> list()
#> 
#> $data$metadataSets[[30]]$id
#> [1] "LGFS"
#> 
#> $data$metadataSets[[30]]$name
#> [1] "Government Finance Statistics (GFS)"
#> 
#> $data$metadataSets[[30]]$names
#> $data$metadataSets[[30]]$names$en
#> [1] "Government Finance Statistics (GFS)"
#> 
#> 
#> $data$metadataSets[[30]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[30]]$agencyID
#> [1] "IMF.STA"
#> 
#> $data$metadataSets[[30]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[30]]$attributes
#> list()
#> 
#> $data$metadataSets[[30]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[31]]
#> $data$metadataSets[[31]]$annotations
#> list()
#> 
#> $data$metadataSets[[31]]$id
#> [1] "ECRI_STATISTICAL_PACKAGE_2023_LENDING_TO_HOUSEHOLDS_AND_NON_FINANCIAL_CORPORATIONS_IN_EUROPE_1995-2022"
#> 
#> $data$metadataSets[[31]]$name
#> [1] "ECRI Statistical Package 2023: Lending to Households and Non-Financial Corporations in Europe (1995-2022)"
#> 
#> $data$metadataSets[[31]]$names
#> $data$metadataSets[[31]]$names$en
#> [1] "ECRI Statistical Package 2023: Lending to Households and Non-Financial Corporations in Europe (1995-2022)"
#> 
#> 
#> $data$metadataSets[[31]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[31]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[31]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[31]]$attributes
#> list()
#> 
#> $data$metadataSets[[31]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[32]]
#> $data$metadataSets[[32]]$annotations
#> list()
#> 
#> $data$metadataSets[[32]]$id
#> [1] "CRANE_DATA"
#> 
#> $data$metadataSets[[32]]$name
#> [1] "Crane Data"
#> 
#> $data$metadataSets[[32]]$names
#> $data$metadataSets[[32]]$names$en
#> [1] "Crane Data"
#> 
#> 
#> $data$metadataSets[[32]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[32]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[32]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[32]]$attributes
#> list()
#> 
#> $data$metadataSets[[32]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[33]]
#> $data$metadataSets[[33]]$annotations
#> list()
#> 
#> $data$metadataSets[[33]]$id
#> [1] "ECRI_STATISTICAL_PACKAGE_2023_LENDING_TO_HOUSEHOLDS_AND_NON-FINANCIAL_CORPORATIONS_IN_EUROPE_1995-2022"
#> 
#> $data$metadataSets[[33]]$name
#> [1] "ECRI Statistical Package 2023: Lending to Households and Non-Financial Corporations in Europe (1995-2022)"
#> 
#> $data$metadataSets[[33]]$names
#> $data$metadataSets[[33]]$names$en
#> [1] "ECRI Statistical Package 2023: Lending to Households and Non-Financial Corporations in Europe (1995-2022)"
#> 
#> 
#> $data$metadataSets[[33]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[33]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[33]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[33]]$attributes
#> list()
#> 
#> $data$metadataSets[[33]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[34]]
#> $data$metadataSets[[34]]$annotations
#> list()
#> 
#> $data$metadataSets[[34]]$id
#> [1] "DAC_ONLINE_DEVELOPMENT_ASSISTANCE_COMMITTEE_OECD"
#> 
#> $data$metadataSets[[34]]$name
#> [1] "DAC online (Development Assistance Committee - OECD)"
#> 
#> $data$metadataSets[[34]]$names
#> $data$metadataSets[[34]]$names$en
#> [1] "DAC online (Development Assistance Committee - OECD)"
#> 
#> 
#> $data$metadataSets[[34]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[34]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[34]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[34]]$attributes
#> list()
#> 
#> $data$metadataSets[[34]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[35]]
#> $data$metadataSets[[35]]$annotations
#> list()
#> 
#> $data$metadataSets[[35]]$id
#> [1] "mds-018b8278-d492-4edf-8645-0423106f757d"
#> 
#> $data$metadataSets[[35]]$name
#> [1] "138____DEFAULT_ANSWER"
#> 
#> $data$metadataSets[[35]]$names
#> $data$metadataSets[[35]]$names$en
#> [1] "138____DEFAULT_ANSWER"
#> 
#> 
#> $data$metadataSets[[35]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[35]]$agencyID
#> [1] "IMF.STA.DS"
#> 
#> $data$metadataSets[[35]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[35]]$attributes
#> list()
#> 
#> $data$metadataSets[[35]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[36]]
#> $data$metadataSets[[36]]$annotations
#> list()
#> 
#> $data$metadataSets[[36]]$id
#> [1] "MOODYS_INVESTORS_SERVICE"
#> 
#> $data$metadataSets[[36]]$name
#> [1] "Moody’s Investors Service"
#> 
#> $data$metadataSets[[36]]$names
#> $data$metadataSets[[36]]$names$en
#> [1] "Moody’s Investors Service"
#> 
#> 
#> $data$metadataSets[[36]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[36]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[36]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[36]]$attributes
#> list()
#> 
#> $data$metadataSets[[36]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[37]]
#> $data$metadataSets[[37]]$annotations
#> list()
#> 
#> $data$metadataSets[[37]]$id
#> [1] "LPCPS"
#> 
#> $data$metadataSets[[37]]$name
#> [1] "Primary Commodity Prices (PCPS)"
#> 
#> $data$metadataSets[[37]]$names
#> $data$metadataSets[[37]]$names$en
#> [1] "Primary Commodity Prices (PCPS)"
#> 
#> 
#> $data$metadataSets[[37]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[37]]$agencyID
#> [1] "IMF.RES"
#> 
#> $data$metadataSets[[37]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[37]]$attributes
#> list()
#> 
#> $data$metadataSets[[37]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[38]]
#> $data$metadataSets[[38]]$annotations
#> list()
#> 
#> $data$metadataSets[[38]]$id
#> [1] "CBLD"
#> 
#> $data$metadataSets[[38]]$name
#> [1] "Central Bank Legislation Database (CBLD)"
#> 
#> $data$metadataSets[[38]]$names
#> $data$metadataSets[[38]]$names$en
#> [1] "Central Bank Legislation Database (CBLD)"
#> 
#> 
#> $data$metadataSets[[38]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[38]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[38]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[38]]$attributes
#> list()
#> 
#> $data$metadataSets[[38]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[39]]
#> $data$metadataSets[[39]]$annotations
#> list()
#> 
#> $data$metadataSets[[39]]$id
#> [1] "CHAINALYSIS_MARKET_INTEL"
#> 
#> $data$metadataSets[[39]]$name
#> [1] "Chainalysis Market Intel"
#> 
#> $data$metadataSets[[39]]$names
#> $data$metadataSets[[39]]$names$en
#> [1] "Chainalysis Market Intel"
#> 
#> 
#> $data$metadataSets[[39]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[39]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[39]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[39]]$attributes
#> list()
#> 
#> $data$metadataSets[[39]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[40]]
#> $data$metadataSets[[40]]$annotations
#> list()
#> 
#> $data$metadataSets[[40]]$id
#> [1] "LINKEDIN"
#> 
#> $data$metadataSets[[40]]$name
#> [1] "LinkedIn"
#> 
#> $data$metadataSets[[40]]$names
#> $data$metadataSets[[40]]$names$en
#> [1] "LinkedIn"
#> 
#> 
#> $data$metadataSets[[40]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[40]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[40]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[40]]$attributes
#> list()
#> 
#> $data$metadataSets[[40]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[41]]
#> $data$metadataSets[[41]]$annotations
#> list()
#> 
#> $data$metadataSets[[41]]$id
#> [1] "PORTWATCH"
#> 
#> $data$metadataSets[[41]]$name
#> [1] "IMF PortWatch"
#> 
#> $data$metadataSets[[41]]$names
#> $data$metadataSets[[41]]$names$en
#> [1] "IMF PortWatch"
#> 
#> 
#> $data$metadataSets[[41]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[41]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[41]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[41]]$attributes
#> list()
#> 
#> $data$metadataSets[[41]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[42]]
#> $data$metadataSets[[42]]$annotations
#> list()
#> 
#> $data$metadataSets[[42]]$id
#> [1] "MSCI_GLOBAL_INTEL_PLUS"
#> 
#> $data$metadataSets[[42]]$name
#> [1] "MSCI Global Intel PLUS"
#> 
#> $data$metadataSets[[42]]$names
#> $data$metadataSets[[42]]$names$en
#> [1] "MSCI Global Intel PLUS"
#> 
#> 
#> $data$metadataSets[[42]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[42]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[42]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[42]]$attributes
#> list()
#> 
#> $data$metadataSets[[42]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[43]]
#> $data$metadataSets[[43]]$annotations
#> list()
#> 
#> $data$metadataSets[[43]]$id
#> [1] "LSEG_WORKSPACE"
#> 
#> $data$metadataSets[[43]]$name
#> [1] "LSEG Workspace"
#> 
#> $data$metadataSets[[43]]$names
#> $data$metadataSets[[43]]$names$en
#> [1] "LSEG Workspace"
#> 
#> 
#> $data$metadataSets[[43]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[43]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[43]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[43]]$attributes
#> list()
#> 
#> $data$metadataSets[[43]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[44]]
#> $data$metadataSets[[44]]$annotations
#> list()
#> 
#> $data$metadataSets[[44]]$id
#> [1] "MSCI_REAL_ESTATE"
#> 
#> $data$metadataSets[[44]]$name
#> [1] "MSCI Real Estate"
#> 
#> $data$metadataSets[[44]]$names
#> $data$metadataSets[[44]]$names$en
#> [1] "MSCI Real Estate"
#> 
#> 
#> $data$metadataSets[[44]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[44]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[44]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[44]]$attributes
#> list()
#> 
#> $data$metadataSets[[44]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[45]]
#> $data$metadataSets[[45]]$annotations
#> list()
#> 
#> $data$metadataSets[[45]]$id
#> [1] "EUIPO_AGGREGATED_TRADE_MARKS_DATA"
#> 
#> $data$metadataSets[[45]]$name
#> [1] "EUIPO Aggregated Trade Marks Data"
#> 
#> $data$metadataSets[[45]]$names
#> $data$metadataSets[[45]]$names$en
#> [1] "EUIPO Aggregated Trade Marks Data"
#> 
#> 
#> $data$metadataSets[[45]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[45]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[45]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[45]]$attributes
#> list()
#> 
#> $data$metadataSets[[45]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[46]]
#> $data$metadataSets[[46]]$annotations
#> list()
#> 
#> $data$metadataSets[[46]]$id
#> [1] "CREDIT_RESEARCH_INITIATIVE"
#> 
#> $data$metadataSets[[46]]$name
#> [1] "Credit Research Initiative"
#> 
#> $data$metadataSets[[46]]$names
#> $data$metadataSets[[46]]$names$en
#> [1] "Credit Research Initiative"
#> 
#> 
#> $data$metadataSets[[46]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[46]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[46]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[46]]$attributes
#> list()
#> 
#> $data$metadataSets[[46]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[47]]
#> $data$metadataSets[[47]]$annotations
#> list()
#> 
#> $data$metadataSets[[47]]$id
#> [1] "EUIPO_AGGREGATE_INDUSTRIAL_DESIGNS_DATA"
#> 
#> $data$metadataSets[[47]]$name
#> [1] "EUIPO Aggregate Industrial Designs Data"
#> 
#> $data$metadataSets[[47]]$names
#> $data$metadataSets[[47]]$names$en
#> [1] "EUIPO Aggregate Industrial Designs Data"
#> 
#> 
#> $data$metadataSets[[47]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[47]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[47]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[47]]$attributes
#> list()
#> 
#> $data$metadataSets[[47]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[48]]
#> $data$metadataSets[[48]]$annotations
#> list()
#> 
#> $data$metadataSets[[48]]$id
#> [1] "FSI_CONNECT"
#> 
#> $data$metadataSets[[48]]$name
#> [1] "FSI Connect"
#> 
#> $data$metadataSets[[48]]$names
#> $data$metadataSets[[48]]$names$en
#> [1] "FSI Connect"
#> 
#> 
#> $data$metadataSets[[48]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[48]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[48]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[48]]$attributes
#> list()
#> 
#> $data$metadataSets[[48]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[49]]
#> $data$metadataSets[[49]]$annotations
#> list()
#> 
#> $data$metadataSets[[49]]$id
#> [1] "RYSTAD_ENERGY"
#> 
#> $data$metadataSets[[49]]$name
#> [1] "Rystad Energy"
#> 
#> $data$metadataSets[[49]]$names
#> $data$metadataSets[[49]]$names$en
#> [1] "Rystad Energy"
#> 
#> 
#> $data$metadataSets[[49]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[49]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[49]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[49]]$attributes
#> list()
#> 
#> $data$metadataSets[[49]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[50]]
#> $data$metadataSets[[50]]$annotations
#> list()
#> 
#> $data$metadataSets[[50]]$id
#> [1] "UNCTADSTAT"
#> 
#> $data$metadataSets[[50]]$name
#> [1] "UNCTADstat"
#> 
#> $data$metadataSets[[50]]$names
#> $data$metadataSets[[50]]$names$en
#> [1] "UNCTADstat"
#> 
#> 
#> $data$metadataSets[[50]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[50]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[50]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[50]]$attributes
#> list()
#> 
#> $data$metadataSets[[50]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[51]]
#> $data$metadataSets[[51]]$annotations
#> list()
#> 
#> $data$metadataSets[[51]]$id
#> [1] "CMIE_ECONOMIC_OUTLOOK"
#> 
#> $data$metadataSets[[51]]$name
#> [1] "CMIE Economic Outlook"
#> 
#> $data$metadataSets[[51]]$names
#> $data$metadataSets[[51]]$names$en
#> [1] "CMIE Economic Outlook"
#> 
#> 
#> $data$metadataSets[[51]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[51]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[51]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[51]]$attributes
#> list()
#> 
#> $data$metadataSets[[51]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[52]]
#> $data$metadataSets[[52]]$annotations
#> list()
#> 
#> $data$metadataSets[[52]]$id
#> [1] "FINRA_TRACE_DATA"
#> 
#> $data$metadataSets[[52]]$name
#> [1] "FINRA TRACE Data"
#> 
#> $data$metadataSets[[52]]$names
#> $data$metadataSets[[52]]$names$en
#> [1] "FINRA TRACE Data"
#> 
#> 
#> $data$metadataSets[[52]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[52]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[52]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[52]]$attributes
#> list()
#> 
#> $data$metadataSets[[52]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[53]]
#> $data$metadataSets[[53]]$annotations
#> list()
#> 
#> $data$metadataSets[[53]]$id
#> [1] "BANK_FOR_INTL_SETTLEMENTS_BIS_RESTRICTED_DATA_DATA_BANK_FOR_INTL_BANKING_AND_FIN_STATS_DBSONLINE"
#> 
#> $data$metadataSets[[53]]$name
#> [1] "Bank for International Settlements (BIS) Restricted Data - Data Bank for International Banking and Financial Statistics (DBSonline)"
#> 
#> $data$metadataSets[[53]]$names
#> $data$metadataSets[[53]]$names$en
#> [1] "Bank for International Settlements (BIS) Restricted Data - Data Bank for International Banking and Financial Statistics (DBSonline)"
#> 
#> 
#> $data$metadataSets[[53]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[53]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[53]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[53]]$attributes
#> list()
#> 
#> $data$metadataSets[[53]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[54]]
#> $data$metadataSets[[54]]$annotations
#> list()
#> 
#> $data$metadataSets[[54]]$id
#> [1] "STATISTA"
#> 
#> $data$metadataSets[[54]]$name
#> [1] "Statista"
#> 
#> $data$metadataSets[[54]]$names
#> $data$metadataSets[[54]]$names$en
#> [1] "Statista"
#> 
#> 
#> $data$metadataSets[[54]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[54]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[54]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[54]]$attributes
#> list()
#> 
#> $data$metadataSets[[54]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[55]]
#> $data$metadataSets[[55]]$annotations
#> list()
#> 
#> $data$metadataSets[[55]]$id
#> [1] "SOVEREIGN_WEALTH_FUND_INSTITUTE_SWFI"
#> 
#> $data$metadataSets[[55]]$name
#> [1] "Sovereign Wealth Fund Institute (SWFI)"
#> 
#> $data$metadataSets[[55]]$names
#> $data$metadataSets[[55]]$names$en
#> [1] "Sovereign Wealth Fund Institute (SWFI)"
#> 
#> 
#> $data$metadataSets[[55]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[55]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[55]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[55]]$attributes
#> list()
#> 
#> $data$metadataSets[[55]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[56]]
#> $data$metadataSets[[56]]$annotations
#> list()
#> 
#> $data$metadataSets[[56]]$id
#> [1] "OECD_DATA_EXPLORER"
#> 
#> $data$metadataSets[[56]]$name
#> [1] "OECD Data Explorer"
#> 
#> $data$metadataSets[[56]]$names
#> $data$metadataSets[[56]]$names$en
#> [1] "OECD Data Explorer"
#> 
#> 
#> $data$metadataSets[[56]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[56]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[56]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[56]]$attributes
#> list()
#> 
#> $data$metadataSets[[56]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[57]]
#> $data$metadataSets[[57]]$annotations
#> list()
#> 
#> $data$metadataSets[[57]]$id
#> [1] "GTAP_DATABASE"
#> 
#> $data$metadataSets[[57]]$name
#> [1] "GTAP Database"
#> 
#> $data$metadataSets[[57]]$names
#> $data$metadataSets[[57]]$names$en
#> [1] "GTAP Database"
#> 
#> 
#> $data$metadataSets[[57]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[57]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[57]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[57]]$attributes
#> list()
#> 
#> $data$metadataSets[[57]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[58]]
#> $data$metadataSets[[58]]$annotations
#> list()
#> 
#> $data$metadataSets[[58]]$id
#> [1] "COINGECKO"
#> 
#> $data$metadataSets[[58]]$name
#> [1] "CoinGecko"
#> 
#> $data$metadataSets[[58]]$names
#> $data$metadataSets[[58]]$names$en
#> [1] "CoinGecko"
#> 
#> 
#> $data$metadataSets[[58]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[58]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[58]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[58]]$attributes
#> list()
#> 
#> $data$metadataSets[[58]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[59]]
#> $data$metadataSets[[59]]$annotations
#> list()
#> 
#> $data$metadataSets[[59]]$id
#> [1] "mds-79478294-296b-4236-a239-3669bcc0fd15"
#> 
#> $data$metadataSets[[59]]$name
#> [1] "USER03____DEFAULT_ANSWER"
#> 
#> $data$metadataSets[[59]]$names
#> $data$metadataSets[[59]]$names$en
#> [1] "USER03____DEFAULT_ANSWER"
#> 
#> 
#> $data$metadataSets[[59]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[59]]$agencyID
#> [1] "IMF.FAD"
#> 
#> $data$metadataSets[[59]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[59]]$attributes
#> list()
#> 
#> $data$metadataSets[[59]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[60]]
#> $data$metadataSets[[60]]$annotations
#> list()
#> 
#> $data$metadataSets[[60]]$id
#> [1] "VERISK_MAPLECROFT_-_GLOBAL_RISK_DASHBOARD"
#> 
#> $data$metadataSets[[60]]$name
#> [1] "Verisk Maplecroft - Global Risk Dashboard"
#> 
#> $data$metadataSets[[60]]$names
#> $data$metadataSets[[60]]$names$en
#> [1] "Verisk Maplecroft - Global Risk Dashboard"
#> 
#> 
#> $data$metadataSets[[60]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[60]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[60]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[60]]$attributes
#> list()
#> 
#> $data$metadataSets[[60]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[61]]
#> $data$metadataSets[[61]]$annotations
#> list()
#> 
#> $data$metadataSets[[61]]$id
#> [1] "BANK_FOR_INTERNATIONAL_SETTLEMENTS_BIS_RESTRICTED_DATA-DATA_BANK_FOR_INTERNATIONAL_BANKING_AND_FINANCIAL_STATISTICS_DBSONLINE"
#> 
#> $data$metadataSets[[61]]$name
#> [1] "Bank for International Settlements (BIS) Restricted Data-Data Bank for International Banking and Financial Statistics (DBSonline)"
#> 
#> $data$metadataSets[[61]]$names
#> $data$metadataSets[[61]]$names$en
#> [1] "Bank for International Settlements (BIS) Restricted Data-Data Bank for International Banking and Financial Statistics (DBSonline)"
#> 
#> 
#> $data$metadataSets[[61]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[61]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[61]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[61]]$attributes
#> list()
#> 
#> $data$metadataSets[[61]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[62]]
#> $data$metadataSets[[62]]$annotations
#> list()
#> 
#> $data$metadataSets[[62]]$id
#> [1] "BLOOMBERG_HIGH_FREQUENCY_DATA"
#> 
#> $data$metadataSets[[62]]$name
#> [1] "Bloomberg High Frequency Data"
#> 
#> $data$metadataSets[[62]]$names
#> $data$metadataSets[[62]]$names$en
#> [1] "Bloomberg High Frequency Data"
#> 
#> 
#> $data$metadataSets[[62]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[62]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[62]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[62]]$attributes
#> list()
#> 
#> $data$metadataSets[[62]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[63]]
#> $data$metadataSets[[63]]$annotations
#> list()
#> 
#> $data$metadataSets[[63]]$id
#> [1] "FLIGHTRADAR24"
#> 
#> $data$metadataSets[[63]]$name
#> [1] "Flightradar24"
#> 
#> $data$metadataSets[[63]]$names
#> $data$metadataSets[[63]]$names$en
#> [1] "Flightradar24"
#> 
#> 
#> $data$metadataSets[[63]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[63]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[63]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[63]]$attributes
#> list()
#> 
#> $data$metadataSets[[63]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[64]]
#> $data$metadataSets[[64]]$annotations
#> list()
#> 
#> $data$metadataSets[[64]]$id
#> [1] "SOPISCO_NEWS_ONLINE"
#> 
#> $data$metadataSets[[64]]$name
#> [1] "Sopisco News Online"
#> 
#> $data$metadataSets[[64]]$names
#> $data$metadataSets[[64]]$names$en
#> [1] "Sopisco News Online"
#> 
#> 
#> $data$metadataSets[[64]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[64]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[64]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[64]]$attributes
#> list()
#> 
#> $data$metadataSets[[64]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[65]]
#> $data$metadataSets[[65]]$annotations
#> list()
#> 
#> $data$metadataSets[[65]]$id
#> [1] "INTERNATIONAL_COUNTRY_RISK_GUIDE_ICRG-THE_PRS_GROUP"
#> 
#> $data$metadataSets[[65]]$name
#> [1] "International Country Risk Guide (ICRG) - The PRS Group"
#> 
#> $data$metadataSets[[65]]$names
#> $data$metadataSets[[65]]$names$en
#> [1] "International Country Risk Guide (ICRG) - The PRS Group"
#> 
#> 
#> $data$metadataSets[[65]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[65]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[65]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[65]]$attributes
#> list()
#> 
#> $data$metadataSets[[65]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[66]]
#> $data$metadataSets[[66]]$annotations
#> list()
#> 
#> $data$metadataSets[[66]]$id
#> [1] "CMIE_STATES_OF_INDIA"
#> 
#> $data$metadataSets[[66]]$name
#> [1] "CMIE States of India"
#> 
#> $data$metadataSets[[66]]$names
#> $data$metadataSets[[66]]$names$en
#> [1] "CMIE States of India"
#> 
#> 
#> $data$metadataSets[[66]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[66]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[66]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[66]]$attributes
#> list()
#> 
#> $data$metadataSets[[66]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[67]]
#> $data$metadataSets[[67]]$annotations
#> list()
#> 
#> $data$metadataSets[[67]]$id
#> [1] "LENS_ORG"
#> 
#> $data$metadataSets[[67]]$name
#> [1] "Lens.org"
#> 
#> $data$metadataSets[[67]]$names
#> $data$metadataSets[[67]]$names$en
#> [1] "Lens.org"
#> 
#> 
#> $data$metadataSets[[67]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[67]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[67]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[67]]$attributes
#> list()
#> 
#> $data$metadataSets[[67]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[68]]
#> $data$metadataSets[[68]]$annotations
#> list()
#> 
#> $data$metadataSets[[68]]$id
#> [1] "IEA_MONTHLY_GAS_DATA_SERVICE_MGDS"
#> 
#> $data$metadataSets[[68]]$name
#> [1] "IEA Monthly Gas Data Service (MGDS)"
#> 
#> $data$metadataSets[[68]]$names
#> $data$metadataSets[[68]]$names$en
#> [1] "IEA Monthly Gas Data Service (MGDS)"
#> 
#> 
#> $data$metadataSets[[68]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[68]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[68]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[68]]$attributes
#> list()
#> 
#> $data$metadataSets[[68]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[69]]
#> $data$metadataSets[[69]]$annotations
#> list()
#> 
#> $data$metadataSets[[69]]$id
#> [1] "LSEG_DATASTREAM"
#> 
#> $data$metadataSets[[69]]$name
#> [1] "LSEG Datastream"
#> 
#> $data$metadataSets[[69]]$names
#> $data$metadataSets[[69]]$names$en
#> [1] "LSEG Datastream"
#> 
#> 
#> $data$metadataSets[[69]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[69]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[69]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[69]]$attributes
#> list()
#> 
#> $data$metadataSets[[69]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[70]]
#> $data$metadataSets[[70]]$annotations
#> list()
#> 
#> $data$metadataSets[[70]]$id
#> [1] "BiTS"
#> 
#> $data$metadataSets[[70]]$name
#> [1] "Bilateral Trade in Services Research Dataset (BiTS)"
#> 
#> $data$metadataSets[[70]]$names
#> $data$metadataSets[[70]]$names$en
#> [1] "Bilateral Trade in Services Research Dataset (BiTS)"
#> 
#> 
#> $data$metadataSets[[70]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[70]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[70]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[70]]$attributes
#> list()
#> 
#> $data$metadataSets[[70]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[71]]
#> $data$metadataSets[[71]]$annotations
#> list()
#> 
#> $data$metadataSets[[71]]$id
#> [1] "CMIE_PROWESSDX"
#> 
#> $data$metadataSets[[71]]$name
#> [1] "CMIE Prowessdx"
#> 
#> $data$metadataSets[[71]]$names
#> $data$metadataSets[[71]]$names$en
#> [1] "CMIE Prowessdx"
#> 
#> 
#> $data$metadataSets[[71]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[71]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[71]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[71]]$attributes
#> list()
#> 
#> $data$metadataSets[[71]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[72]]
#> $data$metadataSets[[72]]$annotations
#> list()
#> 
#> $data$metadataSets[[72]]$id
#> [1] "LIPPER_FOR_INVESTMENT_MANAGEMENT"
#> 
#> $data$metadataSets[[72]]$name
#> [1] "Lipper for Investment Management"
#> 
#> $data$metadataSets[[72]]$names
#> $data$metadataSets[[72]]$names$en
#> [1] "Lipper for Investment Management"
#> 
#> 
#> $data$metadataSets[[72]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[72]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[72]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[72]]$attributes
#> list()
#> 
#> $data$metadataSets[[72]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[73]]
#> $data$metadataSets[[73]]$annotations
#> list()
#> 
#> $data$metadataSets[[73]]$id
#> [1] "EORA_GLOBAL_SUPPLY_CHAIN_DATABASE"
#> 
#> $data$metadataSets[[73]]$name
#> [1] "Eora Global Supply Chain Database"
#> 
#> $data$metadataSets[[73]]$names
#> $data$metadataSets[[73]]$names$en
#> [1] "Eora Global Supply Chain Database"
#> 
#> 
#> $data$metadataSets[[73]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[73]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[73]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[73]]$attributes
#> list()
#> 
#> $data$metadataSets[[73]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[74]]
#> $data$metadataSets[[74]]$annotations
#> list()
#> 
#> $data$metadataSets[[74]]$id
#> [1] "HISTORICAL_STATISTICS_OF_THE_UNITED_STATES"
#> 
#> $data$metadataSets[[74]]$name
#> [1] "Historical Statistics of the United States"
#> 
#> $data$metadataSets[[74]]$names
#> $data$metadataSets[[74]]$names$en
#> [1] "Historical Statistics of the United States"
#> 
#> 
#> $data$metadataSets[[74]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[74]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[74]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[74]]$attributes
#> list()
#> 
#> $data$metadataSets[[74]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[75]]
#> $data$metadataSets[[75]]$annotations
#> list()
#> 
#> $data$metadataSets[[75]]$id
#> [1] "ATERIO"
#> 
#> $data$metadataSets[[75]]$name
#> [1] "Aterio"
#> 
#> $data$metadataSets[[75]]$names
#> $data$metadataSets[[75]]$names$en
#> [1] "Aterio"
#> 
#> 
#> $data$metadataSets[[75]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[75]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[75]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[75]]$attributes
#> list()
#> 
#> $data$metadataSets[[75]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[76]]
#> $data$metadataSets[[76]]$annotations
#> list()
#> 
#> $data$metadataSets[[76]]$id
#> [1] "JBA"
#> 
#> $data$metadataSets[[76]]$name
#> [1] "JBA"
#> 
#> $data$metadataSets[[76]]$names
#> $data$metadataSets[[76]]$names$en
#> [1] "JBA"
#> 
#> 
#> $data$metadataSets[[76]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[76]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[76]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[76]]$attributes
#> list()
#> 
#> $data$metadataSets[[76]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[77]]
#> $data$metadataSets[[77]]$annotations
#> list()
#> 
#> $data$metadataSets[[77]]$id
#> [1] "UNDATA"
#> 
#> $data$metadataSets[[77]]$name
#> [1] "UNdata"
#> 
#> $data$metadataSets[[77]]$names
#> $data$metadataSets[[77]]$names$en
#> [1] "UNdata"
#> 
#> 
#> $data$metadataSets[[77]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[77]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[77]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[77]]$attributes
#> list()
#> 
#> $data$metadataSets[[77]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[78]]
#> $data$metadataSets[[78]]$annotations
#> list()
#> 
#> $data$metadataSets[[78]]$id
#> [1] "CROSS-NATIONAL_TIME-SERIES_DATA_ARCHIVE"
#> 
#> $data$metadataSets[[78]]$name
#> [1] "Cross-National Time-Series Data Archive"
#> 
#> $data$metadataSets[[78]]$names
#> $data$metadataSets[[78]]$names$en
#> [1] "Cross-National Time-Series Data Archive"
#> 
#> 
#> $data$metadataSets[[78]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[78]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[78]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[78]]$attributes
#> list()
#> 
#> $data$metadataSets[[78]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[79]]
#> $data$metadataSets[[79]]$annotations
#> list()
#> 
#> $data$metadataSets[[79]]$id
#> [1] "EUROSTAT_MICRODATA"
#> 
#> $data$metadataSets[[79]]$name
#> [1] "Eurostat Microdata"
#> 
#> $data$metadataSets[[79]]$names
#> $data$metadataSets[[79]]$names$en
#> [1] "Eurostat Microdata"
#> 
#> 
#> $data$metadataSets[[79]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[79]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[79]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[79]]$attributes
#> list()
#> 
#> $data$metadataSets[[79]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[80]]
#> $data$metadataSets[[80]]$annotations
#> list()
#> 
#> $data$metadataSets[[80]]$id
#> [1] "S_P_GLOBAL_US_ECONOMIC_SERVICE_FORMERLY_MACROECONOMIC_ADVISERS"
#> 
#> $data$metadataSets[[80]]$name
#> [1] "S&P Global US Economic Service (formerly Macroeconomic Advisers)"
#> 
#> $data$metadataSets[[80]]$names
#> $data$metadataSets[[80]]$names$en
#> [1] "S&P Global US Economic Service (formerly Macroeconomic Advisers)"
#> 
#> 
#> $data$metadataSets[[80]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[80]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[80]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[80]]$attributes
#> list()
#> 
#> $data$metadataSets[[80]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[81]]
#> $data$metadataSets[[81]]$annotations
#> list()
#> 
#> $data$metadataSets[[81]]$id
#> [1] "SUSTAINALYTICS"
#> 
#> $data$metadataSets[[81]]$name
#> [1] "Sustainalytics"
#> 
#> $data$metadataSets[[81]]$names
#> $data$metadataSets[[81]]$names$en
#> [1] "Sustainalytics"
#> 
#> 
#> $data$metadataSets[[81]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[81]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[81]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[81]]$attributes
#> list()
#> 
#> $data$metadataSets[[81]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[82]]
#> $data$metadataSets[[82]]$annotations
#> list()
#> 
#> $data$metadataSets[[82]]$id
#> [1] "VERASET"
#> 
#> $data$metadataSets[[82]]$name
#> [1] "Veraset"
#> 
#> $data$metadataSets[[82]]$names
#> $data$metadataSets[[82]]$names$en
#> [1] "Veraset"
#> 
#> 
#> $data$metadataSets[[82]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[82]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[82]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[82]]$attributes
#> list()
#> 
#> $data$metadataSets[[82]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[83]]
#> $data$metadataSets[[83]]$annotations
#> list()
#> 
#> $data$metadataSets[[83]]$id
#> [1] "MOODYS_CREDITEDGE_PLUS"
#> 
#> $data$metadataSets[[83]]$name
#> [1] "Moody’s CreditEdge Plus"
#> 
#> $data$metadataSets[[83]]$names
#> $data$metadataSets[[83]]$names$en
#> [1] "Moody’s CreditEdge Plus"
#> 
#> 
#> $data$metadataSets[[83]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[83]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[83]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[83]]$attributes
#> list()
#> 
#> $data$metadataSets[[83]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[84]]
#> $data$metadataSets[[84]]$annotations
#> list()
#> 
#> $data$metadataSets[[84]]$id
#> [1] "BANK_FOR_INTERNATIONAL_SETTLEMENTS_BIS_RESTRICTED_DATA_DATA_BANK_FOR_INTERNATIONAL_BANKING_AND_FINANCIAL_STATISTICS_DBSONLINE"
#> 
#> $data$metadataSets[[84]]$name
#> [1] "Bank for International Settlements (BIS) Restricted Data Data Bank for International Banking and Financial Statistics DBSonline"
#> 
#> $data$metadataSets[[84]]$names
#> $data$metadataSets[[84]]$names$en
#> [1] "Bank for International Settlements (BIS) Restricted Data Data Bank for International Banking and Financial Statistics DBSonline"
#> 
#> 
#> $data$metadataSets[[84]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[84]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[84]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[84]]$attributes
#> list()
#> 
#> $data$metadataSets[[84]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[85]]
#> $data$metadataSets[[85]]$annotations
#> list()
#> 
#> $data$metadataSets[[85]]$id
#> [1] "mds-02b5dbf6-ba55-4e2c-ba93-9d8334fa4473"
#> 
#> $data$metadataSets[[85]]$name
#> [1] "USER09____DEFAULT_ANSWER"
#> 
#> $data$metadataSets[[85]]$names
#> $data$metadataSets[[85]]$names$en
#> [1] "USER09____DEFAULT_ANSWER"
#> 
#> 
#> $data$metadataSets[[85]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[85]]$agencyID
#> [1] "IMF.FAD"
#> 
#> $data$metadataSets[[85]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[85]]$attributes
#> list()
#> 
#> $data$metadataSets[[85]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[86]]
#> $data$metadataSets[[86]]$annotations
#> list()
#> 
#> $data$metadataSets[[86]]$id
#> [1] "FITCH_RATINGS_PRO_RESEARCH_AND_RATINGS"
#> 
#> $data$metadataSets[[86]]$name
#> [1] "Fitch Ratings Pro - Research and Ratings"
#> 
#> $data$metadataSets[[86]]$names
#> $data$metadataSets[[86]]$names$en
#> [1] "Fitch Ratings Pro - Research and Ratings"
#> 
#> 
#> $data$metadataSets[[86]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[86]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[86]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[86]]$attributes
#> list()
#> 
#> $data$metadataSets[[86]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[87]]
#> $data$metadataSets[[87]]$annotations
#> list()
#> 
#> $data$metadataSets[[87]]$id
#> [1] "ATLAS_AI"
#> 
#> $data$metadataSets[[87]]$name
#> [1] "Atlas AI"
#> 
#> $data$metadataSets[[87]]$names
#> $data$metadataSets[[87]]$names$en
#> [1] "Atlas AI"
#> 
#> 
#> $data$metadataSets[[87]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[87]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[87]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[87]]$attributes
#> list()
#> 
#> $data$metadataSets[[87]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[88]]
#> $data$metadataSets[[88]]$annotations
#> list()
#> 
#> $data$metadataSets[[88]]$id
#> [1] "FINANCIAL_TIMES_ARCHIVE_FOR_TEXT_MINING"
#> 
#> $data$metadataSets[[88]]$name
#> [1] "Financial Times Archive for Text mining"
#> 
#> $data$metadataSets[[88]]$names
#> $data$metadataSets[[88]]$names$en
#> [1] "Financial Times Archive for Text mining"
#> 
#> 
#> $data$metadataSets[[88]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[88]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[88]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[88]]$attributes
#> list()
#> 
#> $data$metadataSets[[88]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[89]]
#> $data$metadataSets[[89]]$annotations
#> list()
#> 
#> $data$metadataSets[[89]]$id
#> [1] "BLOOMBERG_PROFESSIONAL"
#> 
#> $data$metadataSets[[89]]$name
#> [1] "Bloomberg Professional"
#> 
#> $data$metadataSets[[89]]$names
#> $data$metadataSets[[89]]$names$en
#> [1] "Bloomberg Professional"
#> 
#> 
#> $data$metadataSets[[89]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[89]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[89]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[89]]$attributes
#> list()
#> 
#> $data$metadataSets[[89]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[90]]
#> $data$metadataSets[[90]]$annotations
#> list()
#> 
#> $data$metadataSets[[90]]$id
#> [1] "SP_CAPITAL_IQ_PRO"
#> 
#> $data$metadataSets[[90]]$name
#> [1] "S&P Capital IQ Pro"
#> 
#> $data$metadataSets[[90]]$names
#> $data$metadataSets[[90]]$names$en
#> [1] "S&P Capital IQ Pro"
#> 
#> 
#> $data$metadataSets[[90]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[90]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[90]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[90]]$attributes
#> list()
#> 
#> $data$metadataSets[[90]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[91]]
#> $data$metadataSets[[91]]$annotations
#> list()
#> 
#> $data$metadataSets[[91]]$id
#> [1] "mds-fdc9f136-14e8-4273-906c-425428fa9097"
#> 
#> $data$metadataSets[[91]]$name
#> [1] "USER23____DEFAULT_ANSWER"
#> 
#> $data$metadataSets[[91]]$names
#> $data$metadataSets[[91]]$names$en
#> [1] "USER23____DEFAULT_ANSWER"
#> 
#> 
#> $data$metadataSets[[91]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[91]]$agencyID
#> [1] "IMF.FAD"
#> 
#> $data$metadataSets[[91]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[91]]$attributes
#> list()
#> 
#> $data$metadataSets[[91]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[92]]
#> $data$metadataSets[[92]]$annotations
#> list()
#> 
#> $data$metadataSets[[92]]$id
#> [1] "FITCH_RATINGS_PRO-FITCH_RESEARCH_AND_RATINGS_FORMERLY_FITCH_CONNECT"
#> 
#> $data$metadataSets[[92]]$name
#> [1] "Fitch Ratings Pro - Fitch Research and Ratings (formerly Fitch Connect)"
#> 
#> $data$metadataSets[[92]]$names
#> $data$metadataSets[[92]]$names$en
#> [1] "Fitch Ratings Pro - Fitch Research and Ratings (formerly Fitch Connect)"
#> 
#> 
#> $data$metadataSets[[92]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[92]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[92]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[92]]$attributes
#> list()
#> 
#> $data$metadataSets[[92]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[93]]
#> $data$metadataSets[[93]]$annotations
#> list()
#> 
#> $data$metadataSets[[93]]$id
#> [1] "COINDESK"
#> 
#> $data$metadataSets[[93]]$name
#> [1] "CoinDesk"
#> 
#> $data$metadataSets[[93]]$names
#> $data$metadataSets[[93]]$names$en
#> [1] "CoinDesk"
#> 
#> 
#> $data$metadataSets[[93]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[93]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[93]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[93]]$attributes
#> list()
#> 
#> $data$metadataSets[[93]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[94]]
#> $data$metadataSets[[94]]$annotations
#> list()
#> 
#> $data$metadataSets[[94]]$id
#> [1] "SP_451_RESEARCH_DATACENTER_KNOWLEDGEBASE"
#> 
#> $data$metadataSets[[94]]$name
#> [1] "S&P 451 Research Datacenter Knowledgebase"
#> 
#> $data$metadataSets[[94]]$names
#> $data$metadataSets[[94]]$names$en
#> [1] "S&P 451 Research Datacenter Knowledgebase"
#> 
#> 
#> $data$metadataSets[[94]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[94]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[94]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[94]]$attributes
#> list()
#> 
#> $data$metadataSets[[94]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[95]]
#> $data$metadataSets[[95]]$annotations
#> list()
#> 
#> $data$metadataSets[[95]]$id
#> [1] "S_P_GLOBAL_FORECAST_DATABASE_VIA_HAVER"
#> 
#> $data$metadataSets[[95]]$name
#> [1] "S&P Global Forecast Database via Haver"
#> 
#> $data$metadataSets[[95]]$names
#> $data$metadataSets[[95]]$names$en
#> [1] "S&P Global Forecast Database via Haver"
#> 
#> 
#> $data$metadataSets[[95]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[95]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[95]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[95]]$attributes
#> list()
#> 
#> $data$metadataSets[[95]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[96]]
#> $data$metadataSets[[96]]$annotations
#> list()
#> 
#> $data$metadataSets[[96]]$id
#> [1] "GLOBAL_TRADE_ALERT_GTA_NEW_INDUSTRIAL_POLICY_OBSERVATORY_NIPO"
#> 
#> $data$metadataSets[[96]]$name
#> [1] "Global Trade Alert (GTA) - New Industrial Policy Observatory (NIPO) "
#> 
#> $data$metadataSets[[96]]$names
#> $data$metadataSets[[96]]$names$en
#> [1] "Global Trade Alert (GTA) - New Industrial Policy Observatory (NIPO) "
#> 
#> 
#> $data$metadataSets[[96]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[96]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[96]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[96]]$attributes
#> list()
#> 
#> $data$metadataSets[[96]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[97]]
#> $data$metadataSets[[97]]$annotations
#> list()
#> 
#> $data$metadataSets[[97]]$id
#> [1] "BASEL_AML_INDEX"
#> 
#> $data$metadataSets[[97]]$name
#> [1] "Basel AML Index"
#> 
#> $data$metadataSets[[97]]$names
#> $data$metadataSets[[97]]$names$en
#> [1] "Basel AML Index"
#> 
#> 
#> $data$metadataSets[[97]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[97]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[97]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[97]]$attributes
#> list()
#> 
#> $data$metadataSets[[97]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[98]]
#> $data$metadataSets[[98]]$annotations
#> list()
#> 
#> $data$metadataSets[[98]]$id
#> [1] "MAPBOX"
#> 
#> $data$metadataSets[[98]]$name
#> [1] "Mapbox"
#> 
#> $data$metadataSets[[98]]$names
#> $data$metadataSets[[98]]$names$en
#> [1] "Mapbox"
#> 
#> 
#> $data$metadataSets[[98]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[98]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[98]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[98]]$attributes
#> list()
#> 
#> $data$metadataSets[[98]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[99]]
#> $data$metadataSets[[99]]$annotations
#> list()
#> 
#> $data$metadataSets[[99]]$id
#> [1] "WORLD_DATA_LAB"
#> 
#> $data$metadataSets[[99]]$name
#> [1] "World Data Lab"
#> 
#> $data$metadataSets[[99]]$names
#> $data$metadataSets[[99]]$names$en
#> [1] "World Data Lab"
#> 
#> 
#> $data$metadataSets[[99]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[99]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[99]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[99]]$attributes
#> list()
#> 
#> $data$metadataSets[[99]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[100]]
#> $data$metadataSets[[100]]$annotations
#> list()
#> 
#> $data$metadataSets[[100]]$id
#> [1] "INTERNATIONAL_BUREAU_OF_FISCAL_DOCUMENTATION_IBFD"
#> 
#> $data$metadataSets[[100]]$name
#> [1] "International Bureau of Fiscal Documentation (IBFD)"
#> 
#> $data$metadataSets[[100]]$names
#> $data$metadataSets[[100]]$names$en
#> [1] "International Bureau of Fiscal Documentation (IBFD)"
#> 
#> 
#> $data$metadataSets[[100]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[100]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[100]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[100]]$attributes
#> list()
#> 
#> $data$metadataSets[[100]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[101]]
#> $data$metadataSets[[101]]$annotations
#> list()
#> 
#> $data$metadataSets[[101]]$id
#> [1] "PENN_WORLD_TABLES"
#> 
#> $data$metadataSets[[101]]$name
#> [1] "Penn World Tables"
#> 
#> $data$metadataSets[[101]]$names
#> $data$metadataSets[[101]]$names$en
#> [1] "Penn World Tables"
#> 
#> 
#> $data$metadataSets[[101]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[101]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[101]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[101]]$attributes
#> list()
#> 
#> $data$metadataSets[[101]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[102]]
#> $data$metadataSets[[102]]$annotations
#> list()
#> 
#> $data$metadataSets[[102]]$id
#> [1] "LMFS"
#> 
#> $data$metadataSets[[102]]$name
#> [1] "Monetary and Financial Statistics (MFS)"
#> 
#> $data$metadataSets[[102]]$names
#> $data$metadataSets[[102]]$names$en
#> [1] "Monetary and Financial Statistics (MFS)"
#> 
#> 
#> $data$metadataSets[[102]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[102]]$agencyID
#> [1] "IMF.STA"
#> 
#> $data$metadataSets[[102]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[102]]$attributes
#> list()
#> 
#> $data$metadataSets[[102]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[103]]
#> $data$metadataSets[[103]]$annotations
#> list()
#> 
#> $data$metadataSets[[103]]$id
#> [1] "CONSENSUS_FORECASTS"
#> 
#> $data$metadataSets[[103]]$name
#> [1] "Consensus Forecasts - Information Only"
#> 
#> $data$metadataSets[[103]]$names
#> $data$metadataSets[[103]]$names$en
#> [1] "Consensus Forecasts - Information Only"
#> 
#> 
#> $data$metadataSets[[103]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[103]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[103]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[103]]$attributes
#> list()
#> 
#> $data$metadataSets[[103]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[104]]
#> $data$metadataSets[[104]]$annotations
#> list()
#> 
#> $data$metadataSets[[104]]$id
#> [1] "GTA_NIPO"
#> 
#> $data$metadataSets[[104]]$name
#> [1] "New Industrial Policy Observatory (NIPO)"
#> 
#> $data$metadataSets[[104]]$names
#> $data$metadataSets[[104]]$names$en
#> [1] "New Industrial Policy Observatory (NIPO)"
#> 
#> 
#> $data$metadataSets[[104]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[104]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[104]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[104]]$attributes
#> list()
#> 
#> $data$metadataSets[[104]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[105]]
#> $data$metadataSets[[105]]$annotations
#> list()
#> 
#> $data$metadataSets[[105]]$id
#> [1] "IEA_MONTHLY_OIL_DATA_SERVICE_MODS"
#> 
#> $data$metadataSets[[105]]$name
#> [1] "IEA Monthly Oil Data Service (MODS)"
#> 
#> $data$metadataSets[[105]]$names
#> $data$metadataSets[[105]]$names$en
#> [1] "IEA Monthly Oil Data Service (MODS)"
#> 
#> 
#> $data$metadataSets[[105]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[105]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[105]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[105]]$attributes
#> list()
#> 
#> $data$metadataSets[[105]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[106]]
#> $data$metadataSets[[106]]$annotations
#> list()
#> 
#> $data$metadataSets[[106]]$id
#> [1] "LSEG_REFINITIV_HIGH_FREQUENCY_DATA"
#> 
#> $data$metadataSets[[106]]$name
#> [1] "LSEG Refinitiv High Frequency Data"
#> 
#> $data$metadataSets[[106]]$names
#> $data$metadataSets[[106]]$names$en
#> [1] "LSEG Refinitiv High Frequency Data"
#> 
#> 
#> $data$metadataSets[[106]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[106]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[106]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[106]]$attributes
#> list()
#> 
#> $data$metadataSets[[106]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[107]]
#> $data$metadataSets[[107]]$annotations
#> list()
#> 
#> $data$metadataSets[[107]]$id
#> [1] "TRADE_MAP"
#> 
#> $data$metadataSets[[107]]$name
#> [1] "Trade Map"
#> 
#> $data$metadataSets[[107]]$names
#> $data$metadataSets[[107]]$names$en
#> [1] "Trade Map"
#> 
#> 
#> $data$metadataSets[[107]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[107]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[107]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[107]]$attributes
#> list()
#> 
#> $data$metadataSets[[107]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[108]]
#> $data$metadataSets[[108]]$annotations
#> list()
#> 
#> $data$metadataSets[[108]]$id
#> [1] "ARCGIS_ONLINE"
#> 
#> $data$metadataSets[[108]]$name
#> [1] "ArcGIS Online"
#> 
#> $data$metadataSets[[108]]$names
#> $data$metadataSets[[108]]$names$en
#> [1] "ArcGIS Online"
#> 
#> 
#> $data$metadataSets[[108]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[108]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[108]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[108]]$attributes
#> list()
#> 
#> $data$metadataSets[[108]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[109]]
#> $data$metadataSets[[109]]$annotations
#> list()
#> 
#> $data$metadataSets[[109]]$id
#> [1] "mds-361a4060-497e-48ff-9a30-779be4ada897"
#> 
#> $data$metadataSets[[109]]$name
#> [1] "USER16____DEFAULT_ANSWER"
#> 
#> $data$metadataSets[[109]]$names
#> $data$metadataSets[[109]]$names$en
#> [1] "USER16____DEFAULT_ANSWER"
#> 
#> 
#> $data$metadataSets[[109]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[109]]$agencyID
#> [1] "IMF.FAD"
#> 
#> $data$metadataSets[[109]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[109]]$attributes
#> list()
#> 
#> $data$metadataSets[[109]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[110]]
#> $data$metadataSets[[110]]$annotations
#> list()
#> 
#> $data$metadataSets[[110]]$id
#> [1] "EM-DAT_THE_INTERNATIONAL_DISASTER_DATABASE"
#> 
#> $data$metadataSets[[110]]$name
#> [1] "EM-DAT, the International Disaster Database"
#> 
#> $data$metadataSets[[110]]$names
#> $data$metadataSets[[110]]$names$en
#> [1] "EM-DAT, the International Disaster Database"
#> 
#> 
#> $data$metadataSets[[110]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[110]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[110]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[110]]$attributes
#> list()
#> 
#> $data$metadataSets[[110]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[111]]
#> $data$metadataSets[[111]]$annotations
#> list()
#> 
#> $data$metadataSets[[111]]$id
#> [1] "SSBIG"
#> 
#> $data$metadataSets[[111]]$name
#> [1] "G20 Strong, Sustainable, Balanced, and Inclusive Growth (SSBIG) Dashboard"
#> 
#> $data$metadataSets[[111]]$names
#> $data$metadataSets[[111]]$names$en
#> [1] "G20 Strong, Sustainable, Balanced, and Inclusive Growth (SSBIG) Dashboard"
#> 
#> 
#> $data$metadataSets[[111]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[111]]$agencyID
#> [1] "IMF.RES"
#> 
#> $data$metadataSets[[111]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[111]]$attributes
#> list()
#> 
#> $data$metadataSets[[111]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[112]]
#> $data$metadataSets[[112]]$annotations
#> list()
#> 
#> $data$metadataSets[[112]]$id
#> [1] "EM-DAT_THE_INTERNATIONAL_DISASTER_DATABASE_"
#> 
#> $data$metadataSets[[112]]$name
#> [1] "EM-DAT The International Disaster Database "
#> 
#> $data$metadataSets[[112]]$names
#> $data$metadataSets[[112]]$names$en
#> [1] "EM-DAT The International Disaster Database "
#> 
#> 
#> $data$metadataSets[[112]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[112]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[112]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[112]]$attributes
#> list()
#> 
#> $data$metadataSets[[112]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[113]]
#> $data$metadataSets[[113]]$annotations
#> list()
#> 
#> $data$metadataSets[[113]]$id
#> [1] "WIIW_-_FOREIGN_DIRECT_INVESTMENT_DATABASE"
#> 
#> $data$metadataSets[[113]]$name
#> [1] "WIIW - Foreign Direct Investment Database"
#> 
#> $data$metadataSets[[113]]$names
#> $data$metadataSets[[113]]$names$en
#> [1] "WIIW - Foreign Direct Investment Database"
#> 
#> 
#> $data$metadataSets[[113]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[113]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[113]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[113]]$attributes
#> list()
#> 
#> $data$metadataSets[[113]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[114]]
#> $data$metadataSets[[114]]$annotations
#> list()
#> 
#> $data$metadataSets[[114]]$id
#> [1] "PATSTAT_GLOBAL"
#> 
#> $data$metadataSets[[114]]$name
#> [1] "PATSTAT Global"
#> 
#> $data$metadataSets[[114]]$names
#> $data$metadataSets[[114]]$names$en
#> [1] "PATSTAT Global"
#> 
#> 
#> $data$metadataSets[[114]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[114]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[114]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[114]]$attributes
#> list()
#> 
#> $data$metadataSets[[114]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[115]]
#> $data$metadataSets[[115]]$annotations
#> list()
#> 
#> $data$metadataSets[[115]]$id
#> [1] "ICE_CTF_EMISSIONS_DATA"
#> 
#> $data$metadataSets[[115]]$name
#> [1] "ICE CTF Emissions Data"
#> 
#> $data$metadataSets[[115]]$names
#> $data$metadataSets[[115]]$names$en
#> [1] "ICE CTF Emissions Data"
#> 
#> 
#> $data$metadataSets[[115]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[115]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[115]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[115]]$attributes
#> list()
#> 
#> $data$metadataSets[[115]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[116]]
#> $data$metadataSets[[116]]$annotations
#> list()
#> 
#> $data$metadataSets[[116]]$id
#> [1] "FINAEON"
#> 
#> $data$metadataSets[[116]]$name
#> [1] "Finaeon"
#> 
#> $data$metadataSets[[116]]$names
#> $data$metadataSets[[116]]$names$en
#> [1] "Finaeon"
#> 
#> 
#> $data$metadataSets[[116]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[116]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[116]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[116]]$attributes
#> list()
#> 
#> $data$metadataSets[[116]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[117]]
#> $data$metadataSets[[117]]$annotations
#> list()
#> 
#> $data$metadataSets[[117]]$id
#> [1] "OOKLA"
#> 
#> $data$metadataSets[[117]]$name
#> [1] "Ookla"
#> 
#> $data$metadataSets[[117]]$names
#> $data$metadataSets[[117]]$names$en
#> [1] "Ookla"
#> 
#> 
#> $data$metadataSets[[117]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[117]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[117]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[117]]$attributes
#> list()
#> 
#> $data$metadataSets[[117]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[118]]
#> $data$metadataSets[[118]]$annotations
#> list()
#> 
#> $data$metadataSets[[118]]$id
#> [1] "MARKIT_PMI__PURCHASING_MANAGERS_INDEX"
#> 
#> $data$metadataSets[[118]]$name
#> [1] "Markit PMI (Purchasing Managers' Index)"
#> 
#> $data$metadataSets[[118]]$names
#> $data$metadataSets[[118]]$names$en
#> [1] "Markit PMI (Purchasing Managers' Index)"
#> 
#> 
#> $data$metadataSets[[118]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[118]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[118]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[118]]$attributes
#> list()
#> 
#> $data$metadataSets[[118]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[119]]
#> $data$metadataSets[[119]]$annotations
#> list()
#> 
#> $data$metadataSets[[119]]$id
#> [1] "AXCO"
#> 
#> $data$metadataSets[[119]]$name
#> [1] "Axco"
#> 
#> $data$metadataSets[[119]]$names
#> $data$metadataSets[[119]]$names$en
#> [1] "Axco"
#> 
#> 
#> $data$metadataSets[[119]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[119]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[119]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[119]]$attributes
#> list()
#> 
#> $data$metadataSets[[119]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[120]]
#> $data$metadataSets[[120]]$annotations
#> list()
#> 
#> $data$metadataSets[[120]]$id
#> [1] "ARGUS_OIL_AND_FUEL_PRICES"
#> 
#> $data$metadataSets[[120]]$name
#> [1] "Argus Oil and Fuel Prices"
#> 
#> $data$metadataSets[[120]]$names
#> $data$metadataSets[[120]]$names$en
#> [1] "Argus Oil and Fuel Prices"
#> 
#> 
#> $data$metadataSets[[120]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[120]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[120]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[120]]$attributes
#> list()
#> 
#> $data$metadataSets[[120]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[121]]
#> $data$metadataSets[[121]]$annotations
#> list()
#> 
#> $data$metadataSets[[121]]$id
#> [1] "SP_CAPITAL_IQ_-_AFTERMARKET_RESEARCH"
#> 
#> $data$metadataSets[[121]]$name
#> [1] "S&P Capital IQ - Aftermarket Research"
#> 
#> $data$metadataSets[[121]]$names
#> $data$metadataSets[[121]]$names$en
#> [1] "S&P Capital IQ - Aftermarket Research"
#> 
#> 
#> $data$metadataSets[[121]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[121]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[121]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[121]]$attributes
#> list()
#> 
#> $data$metadataSets[[121]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[122]]
#> $data$metadataSets[[122]]$annotations
#> list()
#> 
#> $data$metadataSets[[122]]$id
#> [1] "BIS_RESTRICTED_DATA_INTL_BANKING_AND_FIN_STATS_DB"
#> 
#> $data$metadataSets[[122]]$name
#> [1] "Bank for International Settlements (BIS) Restricted Data - Data Bank for International Banking and Financial Statistics (DBSonline)"
#> 
#> $data$metadataSets[[122]]$names
#> $data$metadataSets[[122]]$names$en
#> [1] "Bank for International Settlements (BIS) Restricted Data - Data Bank for International Banking and Financial Statistics (DBSonline)"
#> 
#> 
#> $data$metadataSets[[122]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[122]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[122]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[122]]$attributes
#> list()
#> 
#> $data$metadataSets[[122]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[123]]
#> $data$metadataSets[[123]]$annotations
#> list()
#> 
#> $data$metadataSets[[123]]$id
#> [1] "EUIPO_AGGREGATE_TRADE_MARKS_DATA"
#> 
#> $data$metadataSets[[123]]$name
#> [1] "EUIPO Aggregate Trade Marks Data"
#> 
#> $data$metadataSets[[123]]$names
#> $data$metadataSets[[123]]$names$en
#> [1] "EUIPO Aggregate Trade Marks Data"
#> 
#> 
#> $data$metadataSets[[123]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[123]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[123]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[123]]$attributes
#> list()
#> 
#> $data$metadataSets[[123]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[124]]
#> $data$metadataSets[[124]]$annotations
#> list()
#> 
#> $data$metadataSets[[124]]$id
#> [1] "GLOBAL_FINDEX_DATABASE"
#> 
#> $data$metadataSets[[124]]$name
#> [1] "Global Findex Database"
#> 
#> $data$metadataSets[[124]]$names
#> $data$metadataSets[[124]]$names$en
#> [1] "Global Findex Database"
#> 
#> 
#> $data$metadataSets[[124]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[124]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[124]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[124]]$attributes
#> list()
#> 
#> $data$metadataSets[[124]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[125]]
#> $data$metadataSets[[125]]$annotations
#> list()
#> 
#> $data$metadataSets[[125]]$id
#> [1] "INTERNATIONAL_TEA_COMMITTEE"
#> 
#> $data$metadataSets[[125]]$name
#> [1] "International Tea Committee"
#> 
#> $data$metadataSets[[125]]$names
#> $data$metadataSets[[125]]$names$en
#> [1] "International Tea Committee"
#> 
#> 
#> $data$metadataSets[[125]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[125]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[125]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[125]]$attributes
#> list()
#> 
#> $data$metadataSets[[125]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[126]]
#> $data$metadataSets[[126]]$annotations
#> list()
#> 
#> $data$metadataSets[[126]]$id
#> [1] "GOOGLE"
#> 
#> $data$metadataSets[[126]]$name
#> [1] "Google"
#> 
#> $data$metadataSets[[126]]$names
#> $data$metadataSets[[126]]$names$en
#> [1] "Google"
#> 
#> 
#> $data$metadataSets[[126]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[126]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[126]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[126]]$attributes
#> list()
#> 
#> $data$metadataSets[[126]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[127]]
#> $data$metadataSets[[127]]$annotations
#> list()
#> 
#> $data$metadataSets[[127]]$id
#> [1] "S_P_CAPITAL_IQ-COMPUSTAT"
#> 
#> $data$metadataSets[[127]]$name
#> [1] "S&P Capital IQ - Compustat"
#> 
#> $data$metadataSets[[127]]$names
#> $data$metadataSets[[127]]$names$en
#> [1] "S&P Capital IQ - Compustat"
#> 
#> 
#> $data$metadataSets[[127]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[127]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[127]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[127]]$attributes
#> list()
#> 
#> $data$metadataSets[[127]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[128]]
#> $data$metadataSets[[128]]$annotations
#> list()
#> 
#> $data$metadataSets[[128]]$id
#> [1] "TESTING_IN_PRD"
#> 
#> $data$metadataSets[[128]]$name
#> [1] "Testing in PRD"
#> 
#> $data$metadataSets[[128]]$names
#> $data$metadataSets[[128]]$names$en
#> [1] "Testing in PRD"
#> 
#> 
#> $data$metadataSets[[128]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[128]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[128]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[128]]$attributes
#> list()
#> 
#> $data$metadataSets[[128]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[129]]
#> $data$metadataSets[[129]]$annotations
#> list()
#> 
#> $data$metadataSets[[129]]$id
#> [1] "LCBLD"
#> 
#> $data$metadataSets[[129]]$name
#> [1] "Central Bank Legislation Database (CBLD)"
#> 
#> $data$metadataSets[[129]]$names
#> $data$metadataSets[[129]]$names$en
#> [1] "Central Bank Legislation Database (CBLD)"
#> 
#> 
#> $data$metadataSets[[129]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[129]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[129]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[129]]$attributes
#> list()
#> 
#> $data$metadataSets[[129]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[130]]
#> $data$metadataSets[[130]]$annotations
#> list()
#> 
#> $data$metadataSets[[130]]$id
#> [1] "BLOOMBERG_COM"
#> 
#> $data$metadataSets[[130]]$name
#> [1] "Bloomberg.com"
#> 
#> $data$metadataSets[[130]]$names
#> $data$metadataSets[[130]]$names$en
#> [1] "Bloomberg.com"
#> 
#> 
#> $data$metadataSets[[130]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[130]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[130]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[130]]$attributes
#> list()
#> 
#> $data$metadataSets[[130]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[131]]
#> $data$metadataSets[[131]]$annotations
#> list()
#> 
#> $data$metadataSets[[131]]$id
#> [1] "INSTITUTE_OF_INTERNATIONAL_FINANCE_IIF"
#> 
#> $data$metadataSets[[131]]$name
#> [1] "Institute of International Finance (IIF)"
#> 
#> $data$metadataSets[[131]]$names
#> $data$metadataSets[[131]]$names$en
#> [1] "Institute of International Finance (IIF)"
#> 
#> 
#> $data$metadataSets[[131]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[131]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[131]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[131]]$attributes
#> list()
#> 
#> $data$metadataSets[[131]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[132]]
#> $data$metadataSets[[132]]$annotations
#> list()
#> 
#> $data$metadataSets[[132]]$id
#> [1] "BANK_FOR_INTERNATIONAL_SETTLEMENTS_BIS_CONSOLIDATED_AND_LOCATIONAL_BANKING_STATISTICS"
#> 
#> $data$metadataSets[[132]]$name
#> [1] "Bank for International Settlements (BIS) Consolidated and Locational Banking Statistics"
#> 
#> $data$metadataSets[[132]]$names
#> $data$metadataSets[[132]]$names$en
#> [1] "Bank for International Settlements (BIS) Consolidated and Locational Banking Statistics"
#> 
#> 
#> $data$metadataSets[[132]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[132]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[132]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[132]]$attributes
#> list()
#> 
#> $data$metadataSets[[132]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[133]]
#> $data$metadataSets[[133]]$annotations
#> list()
#> 
#> $data$metadataSets[[133]]$id
#> [1] "mds-06b8e462-0c72-4efe-a9fe-96ec1c3c46d1"
#> 
#> $data$metadataSets[[133]]$name
#> [1] "USER14____DEFAULT_ANSWER"
#> 
#> $data$metadataSets[[133]]$names
#> $data$metadataSets[[133]]$names$en
#> [1] "USER14____DEFAULT_ANSWER"
#> 
#> 
#> $data$metadataSets[[133]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[133]]$agencyID
#> [1] "IMF.FAD"
#> 
#> $data$metadataSets[[133]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[133]]$attributes
#> list()
#> 
#> $data$metadataSets[[133]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[134]]
#> $data$metadataSets[[134]]$annotations
#> list()
#> 
#> $data$metadataSets[[134]]$id
#> [1] "ICE_CTF_EMISSIONS_DATA_FORMERLY_URGENTEM"
#> 
#> $data$metadataSets[[134]]$name
#> [1] "ICE CTF Emissions Data (formerly Urgentem)"
#> 
#> $data$metadataSets[[134]]$names
#> $data$metadataSets[[134]]$names$en
#> [1] "ICE CTF Emissions Data (formerly Urgentem)"
#> 
#> 
#> $data$metadataSets[[134]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[134]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[134]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[134]]$attributes
#> list()
#> 
#> $data$metadataSets[[134]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[135]]
#> $data$metadataSets[[135]]$annotations
#> list()
#> 
#> $data$metadataSets[[135]]$id
#> [1] "mds-341d4abb-ac2a-49b2-b29f-843476b2e99f"
#> 
#> $data$metadataSets[[135]]$name
#> [1] "128____DEFAULT_ANSWER"
#> 
#> $data$metadataSets[[135]]$names
#> $data$metadataSets[[135]]$names$en
#> [1] "128____DEFAULT_ANSWER"
#> 
#> 
#> $data$metadataSets[[135]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[135]]$agencyID
#> [1] "IMF.STA.DS"
#> 
#> $data$metadataSets[[135]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[135]]$attributes
#> list()
#> 
#> $data$metadataSets[[135]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[136]]
#> $data$metadataSets[[136]]$annotations
#> list()
#> 
#> $data$metadataSets[[136]]$id
#> [1] "QUARTERLY_PUBLIC_SECTOR_DEBT_STATISTICS_QPSD"
#> 
#> $data$metadataSets[[136]]$name
#> [1] "Quarterly Public Sector Debt Statistics (QPSD)"
#> 
#> $data$metadataSets[[136]]$names
#> $data$metadataSets[[136]]$names$en
#> [1] "Quarterly Public Sector Debt Statistics (QPSD)"
#> 
#> 
#> $data$metadataSets[[136]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[136]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[136]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[136]]$attributes
#> list()
#> 
#> $data$metadataSets[[136]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[137]]
#> $data$metadataSets[[137]]$annotations
#> list()
#> 
#> $data$metadataSets[[137]]$id
#> [1] "CAPITAL_ECONOMICS"
#> 
#> $data$metadataSets[[137]]$name
#> [1] "Capital Economics"
#> 
#> $data$metadataSets[[137]]$names
#> $data$metadataSets[[137]]$names$en
#> [1] "Capital Economics"
#> 
#> 
#> $data$metadataSets[[137]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[137]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[137]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[137]]$attributes
#> list()
#> 
#> $data$metadataSets[[137]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[138]]
#> $data$metadataSets[[138]]$annotations
#> list()
#> 
#> $data$metadataSets[[138]]$id
#> [1] "DEALOGIC"
#> 
#> $data$metadataSets[[138]]$name
#> [1] "Dealogic"
#> 
#> $data$metadataSets[[138]]$names
#> $data$metadataSets[[138]]$names$en
#> [1] "Dealogic"
#> 
#> 
#> $data$metadataSets[[138]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[138]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[138]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[138]]$attributes
#> list()
#> 
#> $data$metadataSets[[138]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[139]]
#> $data$metadataSets[[139]]$annotations
#> list()
#> 
#> $data$metadataSets[[139]]$id
#> [1] "BLOOMBERG_TAX"
#> 
#> $data$metadataSets[[139]]$name
#> [1] "Bloomberg Tax"
#> 
#> $data$metadataSets[[139]]$names
#> $data$metadataSets[[139]]$names$en
#> [1] "Bloomberg Tax"
#> 
#> 
#> $data$metadataSets[[139]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[139]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[139]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[139]]$attributes
#> list()
#> 
#> $data$metadataSets[[139]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[140]]
#> $data$metadataSets[[140]]$annotations
#> list()
#> 
#> $data$metadataSets[[140]]$id
#> [1] "FINAEON_FORMERLY_GLOBAL_FINANCIAL_DATA"
#> 
#> $data$metadataSets[[140]]$name
#> [1] "Finaeon (formerly Global Financial Data)"
#> 
#> $data$metadataSets[[140]]$names
#> $data$metadataSets[[140]]$names$en
#> [1] "Finaeon (formerly Global Financial Data)"
#> 
#> 
#> $data$metadataSets[[140]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[140]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[140]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[140]]$attributes
#> list()
#> 
#> $data$metadataSets[[140]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[141]]
#> $data$metadataSets[[141]]$annotations
#> list()
#> 
#> $data$metadataSets[[141]]$id
#> [1] "FINANCIAL_TIMES_INCENTIVESFLOW"
#> 
#> $data$metadataSets[[141]]$name
#> [1] "Financial Times IncentivesFlow"
#> 
#> $data$metadataSets[[141]]$names
#> $data$metadataSets[[141]]$names$en
#> [1] "Financial Times IncentivesFlow"
#> 
#> 
#> $data$metadataSets[[141]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[141]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[141]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[141]]$attributes
#> list()
#> 
#> $data$metadataSets[[141]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[142]]
#> $data$metadataSets[[142]]$annotations
#> list()
#> 
#> $data$metadataSets[[142]]$id
#> [1] "mds-d392f37f-1255-490d-b8d8-eb96f91b4336"
#> 
#> $data$metadataSets[[142]]$name
#> [1] "USER08____DEFAULT_ANSWER"
#> 
#> $data$metadataSets[[142]]$names
#> $data$metadataSets[[142]]$names$en
#> [1] "USER08____DEFAULT_ANSWER"
#> 
#> 
#> $data$metadataSets[[142]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[142]]$agencyID
#> [1] "IMF.FAD"
#> 
#> $data$metadataSets[[142]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[142]]$attributes
#> list()
#> 
#> $data$metadataSets[[142]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[143]]
#> $data$metadataSets[[143]]$annotations
#> list()
#> 
#> $data$metadataSets[[143]]$id
#> [1] "INTERNATIONAL_DEBT_STATISTICS_IDS"
#> 
#> $data$metadataSets[[143]]$name
#> [1] "International Debt Statistics (IDS)"
#> 
#> $data$metadataSets[[143]]$names
#> $data$metadataSets[[143]]$names$en
#> [1] "International Debt Statistics (IDS)"
#> 
#> 
#> $data$metadataSets[[143]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[143]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[143]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[143]]$attributes
#> list()
#> 
#> $data$metadataSets[[143]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[144]]
#> $data$metadataSets[[144]]$annotations
#> list()
#> 
#> $data$metadataSets[[144]]$id
#> [1] "CRUNCHBASE"
#> 
#> $data$metadataSets[[144]]$name
#> [1] "Crunchbase"
#> 
#> $data$metadataSets[[144]]$names
#> $data$metadataSets[[144]]$names$en
#> [1] "Crunchbase"
#> 
#> 
#> $data$metadataSets[[144]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[144]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[144]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[144]]$attributes
#> list()
#> 
#> $data$metadataSets[[144]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[145]]
#> $data$metadataSets[[145]]$annotations
#> list()
#> 
#> $data$metadataSets[[145]]$id
#> [1] "LFSI"
#> 
#> $data$metadataSets[[145]]$name
#> [1] "Financial Soundness Indicators (FSIs)"
#> 
#> $data$metadataSets[[145]]$names
#> $data$metadataSets[[145]]$names$en
#> [1] "Financial Soundness Indicators (FSIs)"
#> 
#> 
#> $data$metadataSets[[145]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[145]]$agencyID
#> [1] "IMF.STA"
#> 
#> $data$metadataSets[[145]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[145]]$attributes
#> list()
#> 
#> $data$metadataSets[[145]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[146]]
#> $data$metadataSets[[146]]$annotations
#> list()
#> 
#> $data$metadataSets[[146]]$id
#> [1] "INSTITUTIONAL_INVESTOR_COUNTRY_CREDIT_RATINGS"
#> 
#> $data$metadataSets[[146]]$name
#> [1] "Institutional Investor Country Credit Ratings"
#> 
#> $data$metadataSets[[146]]$names
#> $data$metadataSets[[146]]$names$en
#> [1] "Institutional Investor Country Credit Ratings"
#> 
#> 
#> $data$metadataSets[[146]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[146]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[146]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[146]]$attributes
#> list()
#> 
#> $data$metadataSets[[146]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[147]]
#> $data$metadataSets[[147]]$annotations
#> list()
#> 
#> $data$metadataSets[[147]]$id
#> [1] "ZAWYA"
#> 
#> $data$metadataSets[[147]]$name
#> [1] "Zawya"
#> 
#> $data$metadataSets[[147]]$names
#> $data$metadataSets[[147]]$names$en
#> [1] "Zawya"
#> 
#> 
#> $data$metadataSets[[147]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[147]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[147]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[147]]$attributes
#> list()
#> 
#> $data$metadataSets[[147]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[148]]
#> $data$metadataSets[[148]]$annotations
#> list()
#> 
#> $data$metadataSets[[148]]$id
#> [1] "FACTIVA_ANALYTICS_API_FOR_TEXT_MINING"
#> 
#> $data$metadataSets[[148]]$name
#> [1] "Factiva Analytics API for Text Mining"
#> 
#> $data$metadataSets[[148]]$names
#> $data$metadataSets[[148]]$names$en
#> [1] "Factiva Analytics API for Text Mining"
#> 
#> 
#> $data$metadataSets[[148]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[148]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[148]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[148]]$attributes
#> list()
#> 
#> $data$metadataSets[[148]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[149]]
#> $data$metadataSets[[149]]$annotations
#> list()
#> 
#> $data$metadataSets[[149]]$id
#> [1] "OECD_INTERNATIONAL_DEVELOPMENT_STATISTICS"
#> 
#> $data$metadataSets[[149]]$name
#> [1] "OECD International Development Statistics"
#> 
#> $data$metadataSets[[149]]$names
#> $data$metadataSets[[149]]$names$en
#> [1] "OECD International Development Statistics"
#> 
#> 
#> $data$metadataSets[[149]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[149]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[149]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[149]]$attributes
#> list()
#> 
#> $data$metadataSets[[149]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[150]]
#> $data$metadataSets[[150]]$annotations
#> list()
#> 
#> $data$metadataSets[[150]]$id
#> [1] "UN_COMTRADE"
#> 
#> $data$metadataSets[[150]]$name
#> [1] "UN Comtrade"
#> 
#> $data$metadataSets[[150]]$names
#> $data$metadataSets[[150]]$names$en
#> [1] "UN Comtrade"
#> 
#> 
#> $data$metadataSets[[150]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[150]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[150]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[150]]$attributes
#> list()
#> 
#> $data$metadataSets[[150]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[151]]
#> $data$metadataSets[[151]]$annotations
#> list()
#> 
#> $data$metadataSets[[151]]$id
#> [1] "LSEG_TRANSCRIPTS"
#> 
#> $data$metadataSets[[151]]$name
#> [1] "LSEG Transcripts"
#> 
#> $data$metadataSets[[151]]$names
#> $data$metadataSets[[151]]$names$en
#> [1] "LSEG Transcripts"
#> 
#> 
#> $data$metadataSets[[151]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[151]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[151]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[151]]$attributes
#> list()
#> 
#> $data$metadataSets[[151]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[152]]
#> $data$metadataSets[[152]]$annotations
#> list()
#> 
#> $data$metadataSets[[152]]$id
#> [1] "LIS_AND_LWS_LUXEMBOURG_INCOME_STUDY_AND_LUXEMBOURG_WEALTH_STUDY_DATABASES"
#> 
#> $data$metadataSets[[152]]$name
#> [1] "LIS and LWS (Luxembourg Income Study and Luxembourg Wealth Study) Databases"
#> 
#> $data$metadataSets[[152]]$names
#> $data$metadataSets[[152]]$names$en
#> [1] "LIS and LWS (Luxembourg Income Study and Luxembourg Wealth Study) Databases"
#> 
#> 
#> $data$metadataSets[[152]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[152]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[152]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[152]]$attributes
#> list()
#> 
#> $data$metadataSets[[152]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[153]]
#> $data$metadataSets[[153]]$annotations
#> list()
#> 
#> $data$metadataSets[[153]]$id
#> [1] "CID"
#> 
#> $data$metadataSets[[153]]$name
#> [1] "Climate Change Indicators Dashboard "
#> 
#> $data$metadataSets[[153]]$names
#> $data$metadataSets[[153]]$names$en
#> [1] "Climate Change Indicators Dashboard "
#> 
#> 
#> $data$metadataSets[[153]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[153]]$agencyID
#> [1] "IMF.STA"
#> 
#> $data$metadataSets[[153]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[153]]$attributes
#> list()
#> 
#> $data$metadataSets[[153]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[154]]
#> $data$metadataSets[[154]]$annotations
#> list()
#> 
#> $data$metadataSets[[154]]$id
#> [1] "LSEG_WORKSPACE_FORMERLY_LSEG_EIKON"
#> 
#> $data$metadataSets[[154]]$name
#> [1] "LSEG Workspace (formerly LSEG Eikon)"
#> 
#> $data$metadataSets[[154]]$names
#> $data$metadataSets[[154]]$names$en
#> [1] "LSEG Workspace (formerly LSEG Eikon)"
#> 
#> 
#> $data$metadataSets[[154]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[154]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[154]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[154]]$attributes
#> list()
#> 
#> $data$metadataSets[[154]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[155]]
#> $data$metadataSets[[155]]$annotations
#> list()
#> 
#> $data$metadataSets[[155]]$id
#> [1] "THE_PRS_GROUP_COUNTRYDATA_ONLINE_CDO"
#> 
#> $data$metadataSets[[155]]$name
#> [1] "The PRS Group - CountryData Online (CDO)"
#> 
#> $data$metadataSets[[155]]$names
#> $data$metadataSets[[155]]$names$en
#> [1] "The PRS Group - CountryData Online (CDO)"
#> 
#> 
#> $data$metadataSets[[155]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[155]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[155]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[155]]$attributes
#> list()
#> 
#> $data$metadataSets[[155]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[156]]
#> $data$metadataSets[[156]]$annotations
#> list()
#> 
#> $data$metadataSets[[156]]$id
#> [1] "WORLD_ROBOTICS_2023"
#> 
#> $data$metadataSets[[156]]$name
#> [1] "World Robotics 2023"
#> 
#> $data$metadataSets[[156]]$names
#> $data$metadataSets[[156]]$names$en
#> [1] "World Robotics 2023"
#> 
#> 
#> $data$metadataSets[[156]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[156]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[156]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[156]]$attributes
#> list()
#> 
#> $data$metadataSets[[156]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[157]]
#> $data$metadataSets[[157]]$annotations
#> list()
#> 
#> $data$metadataSets[[157]]$id
#> [1] "COSTAR"
#> 
#> $data$metadataSets[[157]]$name
#> [1] "CoStar"
#> 
#> $data$metadataSets[[157]]$names
#> $data$metadataSets[[157]]$names$en
#> [1] "CoStar"
#> 
#> 
#> $data$metadataSets[[157]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[157]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[157]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[157]]$attributes
#> list()
#> 
#> $data$metadataSets[[157]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[158]]
#> $data$metadataSets[[158]]$annotations
#> list()
#> 
#> $data$metadataSets[[158]]$id
#> [1] "ORBIS_M_A_FORMERLY_ZEPHYR"
#> 
#> $data$metadataSets[[158]]$name
#> [1] "Orbis M&A (formerly Zephyr)"
#> 
#> $data$metadataSets[[158]]$names
#> $data$metadataSets[[158]]$names$en
#> [1] "Orbis M&A (formerly Zephyr)"
#> 
#> 
#> $data$metadataSets[[158]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[158]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[158]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[158]]$attributes
#> list()
#> 
#> $data$metadataSets[[158]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[159]]
#> $data$metadataSets[[159]]$annotations
#> list()
#> 
#> $data$metadataSets[[159]]$id
#> [1] "S_P_CAPITAL_IQ"
#> 
#> $data$metadataSets[[159]]$name
#> [1] "S&P Capital IQ"
#> 
#> $data$metadataSets[[159]]$names
#> $data$metadataSets[[159]]$names$en
#> [1] "S&P Capital IQ"
#> 
#> 
#> $data$metadataSets[[159]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[159]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[159]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[159]]$attributes
#> list()
#> 
#> $data$metadataSets[[159]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[160]]
#> $data$metadataSets[[160]]$annotations
#> list()
#> 
#> $data$metadataSets[[160]]$id
#> [1] "ITU_WORLD_TELECOMMUNICATION_ICT_INDICATORS__WTI__DATABASE"
#> 
#> $data$metadataSets[[160]]$name
#> [1] "ITU World Telecommunication/ICT Indicators (WTI) Database"
#> 
#> $data$metadataSets[[160]]$names
#> $data$metadataSets[[160]]$names$en
#> [1] "ITU World Telecommunication/ICT Indicators (WTI) Database"
#> 
#> 
#> $data$metadataSets[[160]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[160]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[160]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[160]]$attributes
#> list()
#> 
#> $data$metadataSets[[160]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[161]]
#> $data$metadataSets[[161]]$annotations
#> list()
#> 
#> $data$metadataSets[[161]]$id
#> [1] "J_P_MORGAN_MARKETS"
#> 
#> $data$metadataSets[[161]]$name
#> [1] "J.P. Morgan Markets"
#> 
#> $data$metadataSets[[161]]$names
#> $data$metadataSets[[161]]$names$en
#> [1] "J.P. Morgan Markets"
#> 
#> 
#> $data$metadataSets[[161]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[161]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[161]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[161]]$attributes
#> list()
#> 
#> $data$metadataSets[[161]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[162]]
#> $data$metadataSets[[162]]$annotations
#> list()
#> 
#> $data$metadataSets[[162]]$id
#> [1] "FITCH_BMI_FORMERLY_FITCH_CONNECT"
#> 
#> $data$metadataSets[[162]]$name
#> [1] "Fitch BMI (formerly Fitch Connect)"
#> 
#> $data$metadataSets[[162]]$names
#> $data$metadataSets[[162]]$names$en
#> [1] "Fitch BMI (formerly Fitch Connect)"
#> 
#> 
#> $data$metadataSets[[162]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[162]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[162]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[162]]$attributes
#> list()
#> 
#> $data$metadataSets[[162]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[163]]
#> $data$metadataSets[[163]]$annotations
#> list()
#> 
#> $data$metadataSets[[163]]$id
#> [1] "VERISK_MAPLECROFT-GLOBAL_RISK_DASHBOARD_GRID"
#> 
#> $data$metadataSets[[163]]$name
#> [1] "Verisk Maplecroft - Global Risk Dashboard (GRiD)"
#> 
#> $data$metadataSets[[163]]$names
#> $data$metadataSets[[163]]$names$en
#> [1] "Verisk Maplecroft - Global Risk Dashboard (GRiD)"
#> 
#> 
#> $data$metadataSets[[163]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[163]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[163]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[163]]$attributes
#> list()
#> 
#> $data$metadataSets[[163]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[164]]
#> $data$metadataSets[[164]]$annotations
#> list()
#> 
#> $data$metadataSets[[164]]$id
#> [1] "SYRIA_REPORT"
#> 
#> $data$metadataSets[[164]]$name
#> [1] "Syria Report"
#> 
#> $data$metadataSets[[164]]$names
#> $data$metadataSets[[164]]$names$en
#> [1] "Syria Report"
#> 
#> 
#> $data$metadataSets[[164]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[164]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[164]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[164]]$attributes
#> list()
#> 
#> $data$metadataSets[[164]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[165]]
#> $data$metadataSets[[165]]$annotations
#> list()
#> 
#> $data$metadataSets[[165]]$id
#> [1] "AGRIHQ"
#> 
#> $data$metadataSets[[165]]$name
#> [1] "AgriHQ"
#> 
#> $data$metadataSets[[165]]$names
#> $data$metadataSets[[165]]$names$en
#> [1] "AgriHQ"
#> 
#> 
#> $data$metadataSets[[165]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[165]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[165]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[165]]$attributes
#> list()
#> 
#> $data$metadataSets[[165]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[166]]
#> $data$metadataSets[[166]]$annotations
#> list()
#> 
#> $data$metadataSets[[166]]$id
#> [1] "mds-579cdacd-488e-4afb-a851-b7789f482ed5"
#> 
#> $data$metadataSets[[166]]$name
#> [1] "USER01____DEFAULT_ANSWER"
#> 
#> $data$metadataSets[[166]]$names
#> $data$metadataSets[[166]]$names$en
#> [1] "USER01____DEFAULT_ANSWER"
#> 
#> 
#> $data$metadataSets[[166]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[166]]$agencyID
#> [1] "IMF.FAD"
#> 
#> $data$metadataSets[[166]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[166]]$attributes
#> list()
#> 
#> $data$metadataSets[[166]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[167]]
#> $data$metadataSets[[167]]$annotations
#> list()
#> 
#> $data$metadataSets[[167]]$id
#> [1] "INDEED-ONLINE_JOB_POSTINGS"
#> 
#> $data$metadataSets[[167]]$name
#> [1] "Indeed-Online Job Postings"
#> 
#> $data$metadataSets[[167]]$names
#> $data$metadataSets[[167]]$names$en
#> [1] "Indeed-Online Job Postings"
#> 
#> 
#> $data$metadataSets[[167]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[167]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[167]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[167]]$attributes
#> list()
#> 
#> $data$metadataSets[[167]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[168]]
#> $data$metadataSets[[168]]$annotations
#> list()
#> 
#> $data$metadataSets[[168]]$id
#> [1] "SP_GLOBAL_US_ECONOMIC_SERVICE"
#> 
#> $data$metadataSets[[168]]$name
#> [1] "S&P Global US Economic Service"
#> 
#> $data$metadataSets[[168]]$names
#> $data$metadataSets[[168]]$names$en
#> [1] "S&P Global US Economic Service"
#> 
#> 
#> $data$metadataSets[[168]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[168]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[168]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[168]]$attributes
#> list()
#> 
#> $data$metadataSets[[168]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[169]]
#> $data$metadataSets[[169]]$annotations
#> list()
#> 
#> $data$metadataSets[[169]]$id
#> [1] "OXFORD_ECONOMICS_ON_DATASTREAM"
#> 
#> $data$metadataSets[[169]]$name
#> [1] "Oxford Economics on Datastream"
#> 
#> $data$metadataSets[[169]]$names
#> $data$metadataSets[[169]]$names$en
#> [1] "Oxford Economics on Datastream"
#> 
#> 
#> $data$metadataSets[[169]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[169]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[169]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[169]]$attributes
#> list()
#> 
#> $data$metadataSets[[169]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[170]]
#> $data$metadataSets[[170]]$annotations
#> list()
#> 
#> $data$metadataSets[[170]]$id
#> [1] "GLOBAL_SOVEREIGN_WEALTH_FUND_SWF"
#> 
#> $data$metadataSets[[170]]$name
#> [1] "Global Sovereign Wealth Fund (SWF)"
#> 
#> $data$metadataSets[[170]]$names
#> $data$metadataSets[[170]]$names$en
#> [1] "Global Sovereign Wealth Fund (SWF)"
#> 
#> 
#> $data$metadataSets[[170]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[170]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[170]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[170]]$attributes
#> list()
#> 
#> $data$metadataSets[[170]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[171]]
#> $data$metadataSets[[171]]$annotations
#> list()
#> 
#> $data$metadataSets[[171]]$id
#> [1] "WBQEDS"
#> 
#> $data$metadataSets[[171]]$name
#> [1] "WB Quarterly External Debt Statistics"
#> 
#> $data$metadataSets[[171]]$names
#> $data$metadataSets[[171]]$names$en
#> [1] "WB Quarterly External Debt Statistics"
#> 
#> 
#> $data$metadataSets[[171]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[171]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[171]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[171]]$attributes
#> list()
#> 
#> $data$metadataSets[[171]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[172]]
#> $data$metadataSets[[172]]$annotations
#> list()
#> 
#> $data$metadataSets[[172]]$id
#> [1] "OECD_LABOR_FORCE_STATISTICS_BY_SEX_AND_AGE"
#> 
#> $data$metadataSets[[172]]$name
#> [1] "OECD Labor Force Statistics by Sex and Age"
#> 
#> $data$metadataSets[[172]]$names
#> $data$metadataSets[[172]]$names$en
#> [1] "OECD Labor Force Statistics by Sex and Age"
#> 
#> 
#> $data$metadataSets[[172]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[172]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[172]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[172]]$attributes
#> list()
#> 
#> $data$metadataSets[[172]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[173]]
#> $data$metadataSets[[173]]$annotations
#> list()
#> 
#> $data$metadataSets[[173]]$id
#> [1] "SAFEGRAPH_FOOT_TRAFFIC_INDICATOR"
#> 
#> $data$metadataSets[[173]]$name
#> [1] "SafeGraph Foot Traffic indicator"
#> 
#> $data$metadataSets[[173]]$names
#> $data$metadataSets[[173]]$names$en
#> [1] "SafeGraph Foot Traffic indicator"
#> 
#> 
#> $data$metadataSets[[173]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[173]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[173]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[173]]$attributes
#> list()
#> 
#> $data$metadataSets[[173]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[174]]
#> $data$metadataSets[[174]]$annotations
#> list()
#> 
#> $data$metadataSets[[174]]$id
#> [1] "SP_CDS_PRICING_DATA"
#> 
#> $data$metadataSets[[174]]$name
#> [1] "S&P CDS Pricing Data"
#> 
#> $data$metadataSets[[174]]$names
#> $data$metadataSets[[174]]$names$en
#> [1] "S&P CDS Pricing Data"
#> 
#> 
#> $data$metadataSets[[174]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[174]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[174]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[174]]$attributes
#> list()
#> 
#> $data$metadataSets[[174]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[175]]
#> $data$metadataSets[[175]]$annotations
#> list()
#> 
#> $data$metadataSets[[175]]$id
#> [1] "KPLER"
#> 
#> $data$metadataSets[[175]]$name
#> [1] "Kpler"
#> 
#> $data$metadataSets[[175]]$names
#> $data$metadataSets[[175]]$names$en
#> [1] "Kpler"
#> 
#> 
#> $data$metadataSets[[175]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[175]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[175]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[175]]$attributes
#> list()
#> 
#> $data$metadataSets[[175]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[176]]
#> $data$metadataSets[[176]]$annotations
#> list()
#> 
#> $data$metadataSets[[176]]$id
#> [1] "GLOBAL_SOURCE_PARTNERS_PREVIOUSLY_LATIN_SOURCE"
#> 
#> $data$metadataSets[[176]]$name
#> [1] "Global Source Partners"
#> 
#> $data$metadataSets[[176]]$names
#> $data$metadataSets[[176]]$names$en
#> [1] "Global Source Partners"
#> 
#> 
#> $data$metadataSets[[176]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[176]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[176]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[176]]$attributes
#> list()
#> 
#> $data$metadataSets[[176]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[177]]
#> $data$metadataSets[[177]]$annotations
#> list()
#> 
#> $data$metadataSets[[177]]$id
#> [1] "AIRDNA"
#> 
#> $data$metadataSets[[177]]$name
#> [1] "AirDNA"
#> 
#> $data$metadataSets[[177]]$names
#> $data$metadataSets[[177]]$names$en
#> [1] "AirDNA"
#> 
#> 
#> $data$metadataSets[[177]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[177]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[177]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[177]]$attributes
#> list()
#> 
#> $data$metadataSets[[177]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[178]]
#> $data$metadataSets[[178]]$annotations
#> list()
#> 
#> $data$metadataSets[[178]]$id
#> [1] "PERFECT_INFORMATION"
#> 
#> $data$metadataSets[[178]]$name
#> [1] "Perfect Information"
#> 
#> $data$metadataSets[[178]]$names
#> $data$metadataSets[[178]]$names$en
#> [1] "Perfect Information"
#> 
#> 
#> $data$metadataSets[[178]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[178]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[178]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[178]]$attributes
#> list()
#> 
#> $data$metadataSets[[178]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[179]]
#> $data$metadataSets[[179]]$annotations
#> list()
#> 
#> $data$metadataSets[[179]]$id
#> [1] "OECD_QUARTERLY_NATIONAL_ACCOUNTS"
#> 
#> $data$metadataSets[[179]]$name
#> [1] "OECD Quarterly National Accounts"
#> 
#> $data$metadataSets[[179]]$names
#> $data$metadataSets[[179]]$names$en
#> [1] "OECD Quarterly National Accounts"
#> 
#> 
#> $data$metadataSets[[179]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[179]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[179]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[179]]$attributes
#> list()
#> 
#> $data$metadataSets[[179]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[180]]
#> $data$metadataSets[[180]]$annotations
#> list()
#> 
#> $data$metadataSets[[180]]$id
#> [1] "FINSTATS"
#> 
#> $data$metadataSets[[180]]$name
#> [1] "FinStats"
#> 
#> $data$metadataSets[[180]]$names
#> $data$metadataSets[[180]]$names$en
#> [1] "FinStats"
#> 
#> 
#> $data$metadataSets[[180]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[180]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[180]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[180]]$attributes
#> list()
#> 
#> $data$metadataSets[[180]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[181]]
#> $data$metadataSets[[181]]$annotations
#> list()
#> 
#> $data$metadataSets[[181]]$id
#> [1] "FITCH_RATINGS_PRO-FITCH_FUNDAMENTAL_FINANCIALS_DATA_FORMERLY_FITCH_CONNECT"
#> 
#> $data$metadataSets[[181]]$name
#> [1] "Fitch Ratings Pro - Fitch Fundamental Financials Data (formerly Fitch Connect)"
#> 
#> $data$metadataSets[[181]]$names
#> $data$metadataSets[[181]]$names$en
#> [1] "Fitch Ratings Pro - Fitch Fundamental Financials Data (formerly Fitch Connect)"
#> 
#> 
#> $data$metadataSets[[181]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[181]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[181]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[181]]$attributes
#> list()
#> 
#> $data$metadataSets[[181]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[182]]
#> $data$metadataSets[[182]]$annotations
#> list()
#> 
#> $data$metadataSets[[182]]$id
#> [1] "VISIBLE_ALPHA"
#> 
#> $data$metadataSets[[182]]$name
#> [1] "Visible Alpha"
#> 
#> $data$metadataSets[[182]]$names
#> $data$metadataSets[[182]]$names$en
#> [1] "Visible Alpha"
#> 
#> 
#> $data$metadataSets[[182]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[182]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[182]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[182]]$attributes
#> list()
#> 
#> $data$metadataSets[[182]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[183]]
#> $data$metadataSets[[183]]$annotations
#> list()
#> 
#> $data$metadataSets[[183]]$id
#> [1] "GLOBAL_PROPERTY_GUIDE"
#> 
#> $data$metadataSets[[183]]$name
#> [1] "Global Property Guide"
#> 
#> $data$metadataSets[[183]]$names
#> $data$metadataSets[[183]]$names$en
#> [1] "Global Property Guide"
#> 
#> 
#> $data$metadataSets[[183]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[183]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[183]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[183]]$attributes
#> list()
#> 
#> $data$metadataSets[[183]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[184]]
#> $data$metadataSets[[184]]$annotations
#> list()
#> 
#> $data$metadataSets[[184]]$id
#> [1] "MOODYS_DEFAULT_AND_RECOVERY_DATABASE"
#> 
#> $data$metadataSets[[184]]$name
#> [1] "Moody’s Default and Recovery Database"
#> 
#> $data$metadataSets[[184]]$names
#> $data$metadataSets[[184]]$names$en
#> [1] "Moody’s Default and Recovery Database"
#> 
#> 
#> $data$metadataSets[[184]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[184]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[184]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[184]]$attributes
#> list()
#> 
#> $data$metadataSets[[184]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[185]]
#> $data$metadataSets[[185]]$annotations
#> list()
#> 
#> $data$metadataSets[[185]]$id
#> [1] "EVESTMENT"
#> 
#> $data$metadataSets[[185]]$name
#> [1] "eVestment"
#> 
#> $data$metadataSets[[185]]$names
#> $data$metadataSets[[185]]$names$en
#> [1] "eVestment"
#> 
#> 
#> $data$metadataSets[[185]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[185]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[185]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[185]]$attributes
#> list()
#> 
#> $data$metadataSets[[185]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[186]]
#> $data$metadataSets[[186]]$annotations
#> list()
#> 
#> $data$metadataSets[[186]]$id
#> [1] "TEST"
#> 
#> $data$metadataSets[[186]]$name
#> [1] "Test"
#> 
#> $data$metadataSets[[186]]$names
#> $data$metadataSets[[186]]$names$en
#> [1] "Test"
#> 
#> 
#> $data$metadataSets[[186]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[186]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[186]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[186]]$attributes
#> list()
#> 
#> $data$metadataSets[[186]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[187]]
#> $data$metadataSets[[187]]$annotations
#> list()
#> 
#> $data$metadataSets[[187]]$id
#> [1] "QUARTERLY_EXTERNAL_DEBT_STATISTICS_QEDS"
#> 
#> $data$metadataSets[[187]]$name
#> [1] "Quarterly External Debt Statistics (QEDS)"
#> 
#> $data$metadataSets[[187]]$names
#> $data$metadataSets[[187]]$names$en
#> [1] "Quarterly External Debt Statistics (QEDS)"
#> 
#> 
#> $data$metadataSets[[187]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[187]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[187]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[187]]$attributes
#> list()
#> 
#> $data$metadataSets[[187]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[188]]
#> $data$metadataSets[[188]]$annotations
#> list()
#> 
#> $data$metadataSets[[188]]$id
#> [1] "USA_TRADE_ONLINE"
#> 
#> $data$metadataSets[[188]]$name
#> [1] "USA Trade Online"
#> 
#> $data$metadataSets[[188]]$names
#> $data$metadataSets[[188]]$names$en
#> [1] "USA Trade Online"
#> 
#> 
#> $data$metadataSets[[188]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[188]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[188]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[188]]$attributes
#> list()
#> 
#> $data$metadataSets[[188]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[189]]
#> $data$metadataSets[[189]]$annotations
#> list()
#> 
#> $data$metadataSets[[189]]$id
#> [1] "CMIE_CAPEXDX"
#> 
#> $data$metadataSets[[189]]$name
#> [1] "CMIE CapExdx"
#> 
#> $data$metadataSets[[189]]$names
#> $data$metadataSets[[189]]$names$en
#> [1] "CMIE CapExdx"
#> 
#> 
#> $data$metadataSets[[189]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[189]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[189]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[189]]$attributes
#> list()
#> 
#> $data$metadataSets[[189]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[190]]
#> $data$metadataSets[[190]]$annotations
#> list()
#> 
#> $data$metadataSets[[190]]$id
#> [1] "MACROECONOMIC_ADVISERS_FORECAST_DATABASE_VIA_HAVER"
#> 
#> $data$metadataSets[[190]]$name
#> [1] "Macroeconomic Advisers Forecast Database via Haver"
#> 
#> $data$metadataSets[[190]]$names
#> $data$metadataSets[[190]]$names$en
#> [1] "Macroeconomic Advisers Forecast Database via Haver"
#> 
#> 
#> $data$metadataSets[[190]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[190]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[190]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[190]]$attributes
#> list()
#> 
#> $data$metadataSets[[190]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[191]]
#> $data$metadataSets[[191]]$annotations
#> list()
#> 
#> $data$metadataSets[[191]]$id
#> [1] "META"
#> 
#> $data$metadataSets[[191]]$name
#> [1] "Meta"
#> 
#> $data$metadataSets[[191]]$names
#> $data$metadataSets[[191]]$names$en
#> [1] "Meta"
#> 
#> 
#> $data$metadataSets[[191]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[191]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[191]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[191]]$attributes
#> list()
#> 
#> $data$metadataSets[[191]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[192]]
#> $data$metadataSets[[192]]$annotations
#> list()
#> 
#> $data$metadataSets[[192]]$id
#> [1] "BLUE_CHIP_CONSENSUS_FORECASTS_VIA_HAVER_ANALYTICS"
#> 
#> $data$metadataSets[[192]]$name
#> [1] "Blue Chip Consensus Forecasts via Haver Analytics"
#> 
#> $data$metadataSets[[192]]$names
#> $data$metadataSets[[192]]$names$en
#> [1] "Blue Chip Consensus Forecasts via Haver Analytics"
#> 
#> 
#> $data$metadataSets[[192]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[192]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[192]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[192]]$attributes
#> list()
#> 
#> $data$metadataSets[[192]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[193]]
#> $data$metadataSets[[193]]$annotations
#> list()
#> 
#> $data$metadataSets[[193]]$id
#> [1] "ORBIS_CROSSBORDER_INVESTMENT"
#> 
#> $data$metadataSets[[193]]$name
#> [1] "Orbis Crossborder Investment"
#> 
#> $data$metadataSets[[193]]$names
#> $data$metadataSets[[193]]$names$en
#> [1] "Orbis Crossborder Investment"
#> 
#> 
#> $data$metadataSets[[193]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[193]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[193]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[193]]$attributes
#> list()
#> 
#> $data$metadataSets[[193]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[194]]
#> $data$metadataSets[[194]]$annotations
#> list()
#> 
#> $data$metadataSets[[194]]$id
#> [1] "ORBIS"
#> 
#> $data$metadataSets[[194]]$name
#> [1] "Orbis"
#> 
#> $data$metadataSets[[194]]$names
#> $data$metadataSets[[194]]$names$en
#> [1] "Orbis"
#> 
#> 
#> $data$metadataSets[[194]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[194]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[194]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[194]]$attributes
#> list()
#> 
#> $data$metadataSets[[194]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[195]]
#> $data$metadataSets[[195]]$annotations
#> list()
#> 
#> $data$metadataSets[[195]]$id
#> [1] "WORLD_ROAD_STATISTICS"
#> 
#> $data$metadataSets[[195]]$name
#> [1] "World Road Statistics"
#> 
#> $data$metadataSets[[195]]$names
#> $data$metadataSets[[195]]$names$en
#> [1] "World Road Statistics"
#> 
#> 
#> $data$metadataSets[[195]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[195]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[195]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[195]]$attributes
#> list()
#> 
#> $data$metadataSets[[195]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[196]]
#> $data$metadataSets[[196]]$annotations
#> list()
#> 
#> $data$metadataSets[[196]]$id
#> [1] "SPACEKNOW"
#> 
#> $data$metadataSets[[196]]$name
#> [1] "SpaceKnow"
#> 
#> $data$metadataSets[[196]]$names
#> $data$metadataSets[[196]]$names$en
#> [1] "SpaceKnow"
#> 
#> 
#> $data$metadataSets[[196]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[196]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[196]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[196]]$attributes
#> list()
#> 
#> $data$metadataSets[[196]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[197]]
#> $data$metadataSets[[197]]$annotations
#> list()
#> 
#> $data$metadataSets[[197]]$id
#> [1] "CRYPTOCOMPARE"
#> 
#> $data$metadataSets[[197]]$name
#> [1] "CryptoCompare"
#> 
#> $data$metadataSets[[197]]$names
#> $data$metadataSets[[197]]$names$en
#> [1] "CryptoCompare"
#> 
#> 
#> $data$metadataSets[[197]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[197]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[197]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[197]]$attributes
#> list()
#> 
#> $data$metadataSets[[197]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[198]]
#> $data$metadataSets[[198]]$annotations
#> list()
#> 
#> $data$metadataSets[[198]]$id
#> [1] "ORBIS_MA"
#> 
#> $data$metadataSets[[198]]$name
#> [1] "Orbis M&A"
#> 
#> $data$metadataSets[[198]]$names
#> $data$metadataSets[[198]]$names$en
#> [1] "Orbis M&A"
#> 
#> 
#> $data$metadataSets[[198]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[198]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[198]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[198]]$attributes
#> list()
#> 
#> $data$metadataSets[[198]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[199]]
#> $data$metadataSets[[199]]$annotations
#> list()
#> 
#> $data$metadataSets[[199]]$id
#> [1] "ALLIUM"
#> 
#> $data$metadataSets[[199]]$name
#> [1] "Allium"
#> 
#> $data$metadataSets[[199]]$names
#> $data$metadataSets[[199]]$names$en
#> [1] "Allium"
#> 
#> 
#> $data$metadataSets[[199]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[199]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[199]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[199]]$attributes
#> list()
#> 
#> $data$metadataSets[[199]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[200]]
#> $data$metadataSets[[200]]$annotations
#> list()
#> 
#> $data$metadataSets[[200]]$id
#> [1] "MAPILLARY"
#> 
#> $data$metadataSets[[200]]$name
#> [1] "Mapillary"
#> 
#> $data$metadataSets[[200]]$names
#> $data$metadataSets[[200]]$names$en
#> [1] "Mapillary"
#> 
#> 
#> $data$metadataSets[[200]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[200]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[200]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[200]]$attributes
#> list()
#> 
#> $data$metadataSets[[200]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[201]]
#> $data$metadataSets[[201]]$annotations
#> list()
#> 
#> $data$metadataSets[[201]]$id
#> [1] "NUMBEO"
#> 
#> $data$metadataSets[[201]]$name
#> [1] "Numbeo"
#> 
#> $data$metadataSets[[201]]$names
#> $data$metadataSets[[201]]$names$en
#> [1] "Numbeo"
#> 
#> 
#> $data$metadataSets[[201]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[201]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[201]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[201]]$attributes
#> list()
#> 
#> $data$metadataSets[[201]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[202]]
#> $data$metadataSets[[202]]$annotations
#> list()
#> 
#> $data$metadataSets[[202]]$id
#> [1] "ESRI_ARCGIS_LIVING_ATLAS_OF_THE_WORLD"
#> 
#> $data$metadataSets[[202]]$name
#> [1] "Esri ArcGIS Living Atlas of the World"
#> 
#> $data$metadataSets[[202]]$names
#> $data$metadataSets[[202]]$names$en
#> [1] "Esri ArcGIS Living Atlas of the World"
#> 
#> 
#> $data$metadataSets[[202]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[202]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[202]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[202]]$attributes
#> list()
#> 
#> $data$metadataSets[[202]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[203]]
#> $data$metadataSets[[203]]$annotations
#> list()
#> 
#> $data$metadataSets[[203]]$id
#> [1] "IEA_ENERGY_PRICES"
#> 
#> $data$metadataSets[[203]]$name
#> [1] "IEA Energy Prices"
#> 
#> $data$metadataSets[[203]]$names
#> $data$metadataSets[[203]]$names$en
#> [1] "IEA Energy Prices"
#> 
#> 
#> $data$metadataSets[[203]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[203]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[203]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[203]]$attributes
#> list()
#> 
#> $data$metadataSets[[203]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[204]]
#> $data$metadataSets[[204]]$annotations
#> list()
#> 
#> $data$metadataSets[[204]]$id
#> [1] "WBQPSD"
#> 
#> $data$metadataSets[[204]]$name
#> [1] "WB Quarterly Public Sector Debt"
#> 
#> $data$metadataSets[[204]]$names
#> $data$metadataSets[[204]]$names$en
#> [1] "WB Quarterly Public Sector Debt"
#> 
#> 
#> $data$metadataSets[[204]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[204]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[204]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[204]]$attributes
#> list()
#> 
#> $data$metadataSets[[204]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[205]]
#> $data$metadataSets[[205]]$annotations
#> list()
#> 
#> $data$metadataSets[[205]]$id
#> [1] "FAOSTAT"
#> 
#> $data$metadataSets[[205]]$name
#> [1] "FAOSTAT"
#> 
#> $data$metadataSets[[205]]$names
#> $data$metadataSets[[205]]$names$en
#> [1] "FAOSTAT"
#> 
#> 
#> $data$metadataSets[[205]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[205]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[205]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[205]]$attributes
#> list()
#> 
#> $data$metadataSets[[205]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[206]]
#> $data$metadataSets[[206]]$annotations
#> list()
#> 
#> $data$metadataSets[[206]]$id
#> [1] "WORLD_BUREAU_OF_METAL_STATISTICS"
#> 
#> $data$metadataSets[[206]]$name
#> [1] "World Bureau of Metal Statistics"
#> 
#> $data$metadataSets[[206]]$names
#> $data$metadataSets[[206]]$names$en
#> [1] "World Bureau of Metal Statistics"
#> 
#> 
#> $data$metadataSets[[206]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[206]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[206]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[206]]$attributes
#> list()
#> 
#> $data$metadataSets[[206]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[207]]
#> $data$metadataSets[[207]]$annotations
#> list()
#> 
#> $data$metadataSets[[207]]$id
#> [1] "CHINA_DATA_ONLINE"
#> 
#> $data$metadataSets[[207]]$name
#> [1] "China Data Online"
#> 
#> $data$metadataSets[[207]]$names
#> $data$metadataSets[[207]]$names$en
#> [1] "China Data Online"
#> 
#> 
#> $data$metadataSets[[207]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[207]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[207]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[207]]$attributes
#> list()
#> 
#> $data$metadataSets[[207]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[208]]
#> $data$metadataSets[[208]]$annotations
#> list()
#> 
#> $data$metadataSets[[208]]$id
#> [1] "INDIASTAT_COM"
#> 
#> $data$metadataSets[[208]]$name
#> [1] "Indiastat.com"
#> 
#> $data$metadataSets[[208]]$names
#> $data$metadataSets[[208]]$names$en
#> [1] "Indiastat.com"
#> 
#> 
#> $data$metadataSets[[208]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[208]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[208]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[208]]$attributes
#> list()
#> 
#> $data$metadataSets[[208]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[209]]
#> $data$metadataSets[[209]]$annotations
#> list()
#> 
#> $data$metadataSets[[209]]$id
#> [1] "PANTHEON_MACROECONOMICS"
#> 
#> $data$metadataSets[[209]]$name
#> [1] "Pantheon Macroeconomics"
#> 
#> $data$metadataSets[[209]]$names
#> $data$metadataSets[[209]]$names$en
#> [1] "Pantheon Macroeconomics"
#> 
#> 
#> $data$metadataSets[[209]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[209]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[209]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[209]]$attributes
#> list()
#> 
#> $data$metadataSets[[209]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[210]]
#> $data$metadataSets[[210]]$annotations
#> list()
#> 
#> $data$metadataSets[[210]]$id
#> [1] "FACTIVA_NEWS_ARCHIVE_FOR_TEXT_MINING"
#> 
#> $data$metadataSets[[210]]$name
#> [1] "Factiva News Archive for Text Mining"
#> 
#> $data$metadataSets[[210]]$names
#> $data$metadataSets[[210]]$names$en
#> [1] "Factiva News Archive for Text Mining"
#> 
#> 
#> $data$metadataSets[[210]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[210]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[210]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[210]]$attributes
#> list()
#> 
#> $data$metadataSets[[210]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[211]]
#> $data$metadataSets[[211]]$annotations
#> list()
#> 
#> $data$metadataSets[[211]]$id
#> [1] "mds-269f82ac-3ce8-4c4a-a1db-42a3499eeac0"
#> 
#> $data$metadataSets[[211]]$name
#> [1] "USER22____DEFAULT_ANSWER"
#> 
#> $data$metadataSets[[211]]$names
#> $data$metadataSets[[211]]$names$en
#> [1] "USER22____DEFAULT_ANSWER"
#> 
#> 
#> $data$metadataSets[[211]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[211]]$agencyID
#> [1] "IMF.FAD"
#> 
#> $data$metadataSets[[211]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[211]]$attributes
#> list()
#> 
#> $data$metadataSets[[211]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[212]]
#> $data$metadataSets[[212]]$annotations
#> list()
#> 
#> $data$metadataSets[[212]]$id
#> [1] "FEDERAL_RESERVE_ECONOMIC_DATA_FRED"
#> 
#> $data$metadataSets[[212]]$name
#> [1] "Federal Reserve Economic Data (FRED)"
#> 
#> $data$metadataSets[[212]]$names
#> $data$metadataSets[[212]]$names$en
#> [1] "Federal Reserve Economic Data (FRED)"
#> 
#> 
#> $data$metadataSets[[212]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[212]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[212]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[212]]$attributes
#> list()
#> 
#> $data$metadataSets[[212]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[213]]
#> $data$metadataSets[[213]]$annotations
#> list()
#> 
#> $data$metadataSets[[213]]$id
#> [1] "OPTIONMETRICS"
#> 
#> $data$metadataSets[[213]]$name
#> [1] "OptionMetrics"
#> 
#> $data$metadataSets[[213]]$names
#> $data$metadataSets[[213]]$names$en
#> [1] "OptionMetrics"
#> 
#> 
#> $data$metadataSets[[213]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[213]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[213]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[213]]$attributes
#> list()
#> 
#> $data$metadataSets[[213]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[214]]
#> $data$metadataSets[[214]]$annotations
#> list()
#> 
#> $data$metadataSets[[214]]$id
#> [1] "mds-e22b3036-b8d6-41dd-809b-2cbdc66d61f0"
#> 
#> $data$metadataSets[[214]]$name
#> [1] "USER27____DEFAULT_ANSWER"
#> 
#> $data$metadataSets[[214]]$names
#> $data$metadataSets[[214]]$names$en
#> [1] "USER27____DEFAULT_ANSWER"
#> 
#> 
#> $data$metadataSets[[214]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[214]]$agencyID
#> [1] "IMF.FAD"
#> 
#> $data$metadataSets[[214]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[214]]$attributes
#> list()
#> 
#> $data$metadataSets[[214]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[215]]
#> $data$metadataSets[[215]]$annotations
#> list()
#> 
#> $data$metadataSets[[215]]$id
#> [1] "EUIPO_AGGREGATED_INDUSTRIAL_DESIGNS_DATA"
#> 
#> $data$metadataSets[[215]]$name
#> [1] "EUIPO Aggregated Industrial Designs Data"
#> 
#> $data$metadataSets[[215]]$names
#> $data$metadataSets[[215]]$names$en
#> [1] "EUIPO Aggregated Industrial Designs Data"
#> 
#> 
#> $data$metadataSets[[215]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[215]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[215]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[215]]$attributes
#> list()
#> 
#> $data$metadataSets[[215]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[216]]
#> $data$metadataSets[[216]]$annotations
#> list()
#> 
#> $data$metadataSets[[216]]$id
#> [1] "EPFR_GLOBAL"
#> 
#> $data$metadataSets[[216]]$name
#> [1] "EPFR Global "
#> 
#> $data$metadataSets[[216]]$names
#> $data$metadataSets[[216]]$names$en
#> [1] "EPFR Global "
#> 
#> 
#> $data$metadataSets[[216]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[216]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[216]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[216]]$attributes
#> list()
#> 
#> $data$metadataSets[[216]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[217]]
#> $data$metadataSets[[217]]$annotations
#> list()
#> 
#> $data$metadataSets[[217]]$id
#> [1] "J_P_MORGAN_EMBIG_HISTORICAL_CONSTITUENTS_DATA"
#> 
#> $data$metadataSets[[217]]$name
#> [1] "J.P. Morgan Emerging Market Bond Index Global (“EMBIG”) Historical Constituents Data"
#> 
#> $data$metadataSets[[217]]$names
#> $data$metadataSets[[217]]$names$en
#> [1] "J.P. Morgan Emerging Market Bond Index Global (“EMBIG”) Historical Constituents Data"
#> 
#> 
#> $data$metadataSets[[217]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[217]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[217]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[217]]$attributes
#> list()
#> 
#> $data$metadataSets[[217]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[218]]
#> $data$metadataSets[[218]]$annotations
#> list()
#> 
#> $data$metadataSets[[218]]$id
#> [1] "S_P_CDS_PRICING_DATA_FORMERLY_MARKIT_CDS"
#> 
#> $data$metadataSets[[218]]$name
#> [1] "S&P CDS Pricing Data (formerly Markit CDS)"
#> 
#> $data$metadataSets[[218]]$names
#> $data$metadataSets[[218]]$names$en
#> [1] "S&P CDS Pricing Data (formerly Markit CDS)"
#> 
#> 
#> $data$metadataSets[[218]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[218]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[218]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[218]]$attributes
#> list()
#> 
#> $data$metadataSets[[218]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[219]]
#> $data$metadataSets[[219]]$annotations
#> list()
#> 
#> $data$metadataSets[[219]]$id
#> [1] "mds-c2899f21-ec16-4ccb-b81d-a87ca3c861aa"
#> 
#> $data$metadataSets[[219]]$name
#> [1] "USER18____DEFAULT_ANSWER"
#> 
#> $data$metadataSets[[219]]$names
#> $data$metadataSets[[219]]$names$en
#> [1] "USER18____DEFAULT_ANSWER"
#> 
#> 
#> $data$metadataSets[[219]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[219]]$agencyID
#> [1] "IMF.FAD"
#> 
#> $data$metadataSets[[219]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[219]]$attributes
#> list()
#> 
#> $data$metadataSets[[219]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[220]]
#> $data$metadataSets[[220]]$annotations
#> list()
#> 
#> $data$metadataSets[[220]]$id
#> [1] "FOCUS_ECONOMICS_CONSENSUS_FORECAST"
#> 
#> $data$metadataSets[[220]]$name
#> [1] "FocusEconomics Consensus Forecast"
#> 
#> $data$metadataSets[[220]]$names
#> $data$metadataSets[[220]]$names$en
#> [1] "FocusEconomics Consensus Forecast"
#> 
#> 
#> $data$metadataSets[[220]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[220]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[220]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[220]]$attributes
#> list()
#> 
#> $data$metadataSets[[220]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[221]]
#> $data$metadataSets[[221]]$annotations
#> list()
#> 
#> $data$metadataSets[[221]]$id
#> [1] "FDI_MARKETS"
#> 
#> $data$metadataSets[[221]]$name
#> [1] "fDi Markets"
#> 
#> $data$metadataSets[[221]]$names
#> $data$metadataSets[[221]]$names$en
#> [1] "fDi Markets"
#> 
#> 
#> $data$metadataSets[[221]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[221]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[221]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[221]]$attributes
#> list()
#> 
#> $data$metadataSets[[221]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[222]]
#> $data$metadataSets[[222]]$annotations
#> list()
#> 
#> $data$metadataSets[[222]]$id
#> [1] "CMA_DATAVISION_CDS_DATA"
#> 
#> $data$metadataSets[[222]]$name
#> [1] "CMA Datavision CDS Data"
#> 
#> $data$metadataSets[[222]]$names
#> $data$metadataSets[[222]]$names$en
#> [1] "CMA Datavision CDS Data"
#> 
#> 
#> $data$metadataSets[[222]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[222]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[222]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[222]]$attributes
#> list()
#> 
#> $data$metadataSets[[222]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[223]]
#> $data$metadataSets[[223]]$annotations
#> list()
#> 
#> $data$metadataSets[[223]]$id
#> [1] "S_P_CAPITAL_IQ_PRO_FORMERLY_GLOBAL_MARKET_INTELLIGENCE"
#> 
#> $data$metadataSets[[223]]$name
#> [1] "S&P Capital IQ Pro (formerly Global Market Intelligence)"
#> 
#> $data$metadataSets[[223]]$names
#> $data$metadataSets[[223]]$names$en
#> [1] "S&P Capital IQ Pro (formerly Global Market Intelligence)"
#> 
#> 
#> $data$metadataSets[[223]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[223]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[223]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[223]]$attributes
#> list()
#> 
#> $data$metadataSets[[223]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[224]]
#> $data$metadataSets[[224]]$annotations
#> list()
#> 
#> $data$metadataSets[[224]]$id
#> [1] "IMD_WORLD_COMPETITIVENESS_ONLINE"
#> 
#> $data$metadataSets[[224]]$name
#> [1] "IMD World Competitiveness Online"
#> 
#> $data$metadataSets[[224]]$names
#> $data$metadataSets[[224]]$names$en
#> [1] "IMD World Competitiveness Online"
#> 
#> 
#> $data$metadataSets[[224]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[224]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[224]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[224]]$attributes
#> list()
#> 
#> $data$metadataSets[[224]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[225]]
#> $data$metadataSets[[225]]$annotations
#> list()
#> 
#> $data$metadataSets[[225]]$id
#> [1] "WRDS-WHARTON_RESEARCH_DATA_SERVICES"
#> 
#> $data$metadataSets[[225]]$name
#> [1] "WRDS - Wharton Research Data Services"
#> 
#> $data$metadataSets[[225]]$names
#> $data$metadataSets[[225]]$names$en
#> [1] "WRDS - Wharton Research Data Services"
#> 
#> 
#> $data$metadataSets[[225]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[225]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[225]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[225]]$attributes
#> list()
#> 
#> $data$metadataSets[[225]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[226]]
#> $data$metadataSets[[226]]$annotations
#> list()
#> 
#> $data$metadataSets[[226]]$id
#> [1] "DS_MONITORING_DASHBOARD"
#> 
#> $data$metadataSets[[226]]$name
#> [1] "Data Standards Monitoring Dashboard"
#> 
#> $data$metadataSets[[226]]$names
#> $data$metadataSets[[226]]$names$en
#> [1] "Data Standards Monitoring Dashboard"
#> 
#> 
#> $data$metadataSets[[226]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[226]]$agencyID
#> [1] "IMF.STA.DS"
#> 
#> $data$metadataSets[[226]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[226]]$attributes
#> list()
#> 
#> $data$metadataSets[[226]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[227]]
#> $data$metadataSets[[227]]$annotations
#> list()
#> 
#> $data$metadataSets[[227]]$id
#> [1] "BLOOMBERG_GOVERNMENT_BONDS_DATA_LICENSE"
#> 
#> $data$metadataSets[[227]]$name
#> [1] "Bloomberg Government Bonds Data License"
#> 
#> $data$metadataSets[[227]]$names
#> $data$metadataSets[[227]]$names$en
#> [1] "Bloomberg Government Bonds Data License"
#> 
#> 
#> $data$metadataSets[[227]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[227]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[227]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[227]]$attributes
#> list()
#> 
#> $data$metadataSets[[227]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[228]]
#> $data$metadataSets[[228]]$annotations
#> list()
#> 
#> $data$metadataSets[[228]]$id
#> [1] "BANKERS_ALMANAC"
#> 
#> $data$metadataSets[[228]]$name
#> [1] "Bankers Almanac"
#> 
#> $data$metadataSets[[228]]$names
#> $data$metadataSets[[228]]$names$en
#> [1] "Bankers Almanac"
#> 
#> 
#> $data$metadataSets[[228]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[228]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[228]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[228]]$attributes
#> list()
#> 
#> $data$metadataSets[[228]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[229]]
#> $data$metadataSets[[229]]$annotations
#> list()
#> 
#> $data$metadataSets[[229]]$id
#> [1] "BLOOMBERG_DATA_LICENSE"
#> 
#> $data$metadataSets[[229]]$name
#> [1] "Bloomberg Data License"
#> 
#> $data$metadataSets[[229]]$names
#> $data$metadataSets[[229]]$names$en
#> [1] "Bloomberg Data License"
#> 
#> 
#> $data$metadataSets[[229]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[229]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[229]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[229]]$attributes
#> list()
#> 
#> $data$metadataSets[[229]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[230]]
#> $data$metadataSets[[230]]$annotations
#> list()
#> 
#> $data$metadataSets[[230]]$id
#> [1] "WIND_FINANCIAL_TERMINAL"
#> 
#> $data$metadataSets[[230]]$name
#> [1] "Wind Financial Terminal"
#> 
#> $data$metadataSets[[230]]$names
#> $data$metadataSets[[230]]$names$en
#> [1] "Wind Financial Terminal"
#> 
#> 
#> $data$metadataSets[[230]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[230]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[230]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[230]]$attributes
#> list()
#> 
#> $data$metadataSets[[230]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[231]]
#> $data$metadataSets[[231]]$annotations
#> list()
#> 
#> $data$metadataSets[[231]]$id
#> [1] "mds-95bdcd35-63c2-4109-8f8e-9f5e1ad53661"
#> 
#> $data$metadataSets[[231]]$name
#> [1] "USER25____DEFAULT_ANSWER"
#> 
#> $data$metadataSets[[231]]$names
#> $data$metadataSets[[231]]$names$en
#> [1] "USER25____DEFAULT_ANSWER"
#> 
#> 
#> $data$metadataSets[[231]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[231]]$agencyID
#> [1] "IMF.FAD"
#> 
#> $data$metadataSets[[231]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[231]]$attributes
#> list()
#> 
#> $data$metadataSets[[231]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[232]]
#> $data$metadataSets[[232]]$annotations
#> list()
#> 
#> $data$metadataSets[[232]]$id
#> [1] "GDELT_DATABASE"
#> 
#> $data$metadataSets[[232]]$name
#> [1] "GDELT Database"
#> 
#> $data$metadataSets[[232]]$names
#> $data$metadataSets[[232]]$names$en
#> [1] "GDELT Database"
#> 
#> 
#> $data$metadataSets[[232]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[232]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[232]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[232]]$attributes
#> list()
#> 
#> $data$metadataSets[[232]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[233]]
#> $data$metadataSets[[233]]$annotations
#> list()
#> 
#> $data$metadataSets[[233]]$id
#> [1] "OECD_MAIN_ECONOMIC_INDICATORS"
#> 
#> $data$metadataSets[[233]]$name
#> [1] "OECD Main Economic Indicators"
#> 
#> $data$metadataSets[[233]]$names
#> $data$metadataSets[[233]]$names$en
#> [1] "OECD Main Economic Indicators"
#> 
#> 
#> $data$metadataSets[[233]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[233]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[233]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[233]]$attributes
#> list()
#> 
#> $data$metadataSets[[233]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[234]]
#> $data$metadataSets[[234]]$annotations
#> list()
#> 
#> $data$metadataSets[[234]]$id
#> [1] "MSCI_ESG_SOVEREIGN_AND_CORPORATE_RATINGS"
#> 
#> $data$metadataSets[[234]]$name
#> [1] "MSCI ESG Sovereign and Corporate Ratings"
#> 
#> $data$metadataSets[[234]]$names
#> $data$metadataSets[[234]]$names$en
#> [1] "MSCI ESG Sovereign and Corporate Ratings"
#> 
#> 
#> $data$metadataSets[[234]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[234]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[234]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[234]]$attributes
#> list()
#> 
#> $data$metadataSets[[234]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[235]]
#> $data$metadataSets[[235]]$annotations
#> list()
#> 
#> $data$metadataSets[[235]]$id
#> [1] "FITCH_RATINGS_PRO_FITCH_FUNDAMENTAL_FINANCIALS_DATA"
#> 
#> $data$metadataSets[[235]]$name
#> [1] "Fitch Ratings Pro - Fitch Fundamental Financials Data "
#> 
#> $data$metadataSets[[235]]$names
#> $data$metadataSets[[235]]$names$en
#> [1] "Fitch Ratings Pro - Fitch Fundamental Financials Data "
#> 
#> 
#> $data$metadataSets[[235]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[235]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[235]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[235]]$attributes
#> list()
#> 
#> $data$metadataSets[[235]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[236]]
#> $data$metadataSets[[236]]$annotations
#> list()
#> 
#> $data$metadataSets[[236]]$id
#> [1] "ECOANALITICA"
#> 
#> $data$metadataSets[[236]]$name
#> [1] "Ecoanalitica"
#> 
#> $data$metadataSets[[236]]$names
#> $data$metadataSets[[236]]$names$en
#> [1] "Ecoanalitica"
#> 
#> 
#> $data$metadataSets[[236]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[236]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[236]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[236]]$attributes
#> list()
#> 
#> $data$metadataSets[[236]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[237]]
#> $data$metadataSets[[237]]$annotations
#> list()
#> 
#> $data$metadataSets[[237]]$id
#> [1] "GLOBAL_HQ_FORMER_NZX_AGRI"
#> 
#> $data$metadataSets[[237]]$name
#> [1] "AgriHQ"
#> 
#> $data$metadataSets[[237]]$names
#> $data$metadataSets[[237]]$names$en
#> [1] "AgriHQ"
#> 
#> 
#> $data$metadataSets[[237]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[237]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[237]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[237]]$attributes
#> list()
#> 
#> $data$metadataSets[[237]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[238]]
#> $data$metadataSets[[238]]$annotations
#> list()
#> 
#> $data$metadataSets[[238]]$id
#> [1] "GDP_NOWCAST"
#> 
#> $data$metadataSets[[238]]$name
#> [1] "GDP Nowcast"
#> 
#> $data$metadataSets[[238]]$names
#> $data$metadataSets[[238]]$names$en
#> [1] "GDP Nowcast"
#> 
#> 
#> $data$metadataSets[[238]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[238]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[238]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[238]]$attributes
#> list()
#> 
#> $data$metadataSets[[238]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[239]]
#> $data$metadataSets[[239]]$annotations
#> list()
#> 
#> $data$metadataSets[[239]]$id
#> [1] "GALLUP_WORLD_POLL"
#> 
#> $data$metadataSets[[239]]$name
#> [1] "Gallup World Poll"
#> 
#> $data$metadataSets[[239]]$names
#> $data$metadataSets[[239]]$names$en
#> [1] "Gallup World Poll"
#> 
#> 
#> $data$metadataSets[[239]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[239]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[239]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[239]]$attributes
#> list()
#> 
#> $data$metadataSets[[239]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[240]]
#> $data$metadataSets[[240]]$annotations
#> list()
#> 
#> $data$metadataSets[[240]]$id
#> [1] "OECD_ANALYTICAL_DATABASE_ADB-FOR_INFORMATION_ONLY"
#> 
#> $data$metadataSets[[240]]$name
#> [1] "OECD Analytical Database (ADB) - For Information Only"
#> 
#> $data$metadataSets[[240]]$names
#> $data$metadataSets[[240]]$names$en
#> [1] "OECD Analytical Database (ADB) - For Information Only"
#> 
#> 
#> $data$metadataSets[[240]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[240]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[240]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[240]]$attributes
#> list()
#> 
#> $data$metadataSets[[240]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[241]]
#> $data$metadataSets[[241]]$annotations
#> list()
#> 
#> $data$metadataSets[[241]]$id
#> [1] "IEA_DATA_SERVICES"
#> 
#> $data$metadataSets[[241]]$name
#> [1] "IEA Data Services"
#> 
#> $data$metadataSets[[241]]$names
#> $data$metadataSets[[241]]$names$en
#> [1] "IEA Data Services"
#> 
#> 
#> $data$metadataSets[[241]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[241]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[241]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[241]]$attributes
#> list()
#> 
#> $data$metadataSets[[241]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[242]]
#> $data$metadataSets[[242]]$annotations
#> list()
#> 
#> $data$metadataSets[[242]]$id
#> [1] "TRADE_DATA_MONITOR_TDM"
#> 
#> $data$metadataSets[[242]]$name
#> [1] "Trade Data Monitor (TDM)"
#> 
#> $data$metadataSets[[242]]$names
#> $data$metadataSets[[242]]$names$en
#> [1] "Trade Data Monitor (TDM)"
#> 
#> 
#> $data$metadataSets[[242]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[242]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[242]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[242]]$attributes
#> list()
#> 
#> $data$metadataSets[[242]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[243]]
#> $data$metadataSets[[243]]$annotations
#> list()
#> 
#> $data$metadataSets[[243]]$id
#> [1] "FITCH_RATINGS_PRO_-_FITCH_RESEARCH_AND_RATINGS"
#> 
#> $data$metadataSets[[243]]$name
#> [1] "Fitch Ratings Pro - Fitch Research and Ratings"
#> 
#> $data$metadataSets[[243]]$names
#> $data$metadataSets[[243]]$names$en
#> [1] "Fitch Ratings Pro - Fitch Research and Ratings"
#> 
#> 
#> $data$metadataSets[[243]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[243]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[243]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[243]]$attributes
#> list()
#> 
#> $data$metadataSets[[243]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[244]]
#> $data$metadataSets[[244]]$annotations
#> list()
#> 
#> $data$metadataSets[[244]]$id
#> [1] "WIIW_FOREIGN_DIRECT_INVESTMENT_DATABASE"
#> 
#> $data$metadataSets[[244]]$name
#> [1] "WIIW - Foreign Direct Investment Database"
#> 
#> $data$metadataSets[[244]]$names
#> $data$metadataSets[[244]]$names$en
#> [1] "WIIW - Foreign Direct Investment Database"
#> 
#> 
#> $data$metadataSets[[244]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[244]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[244]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[244]]$attributes
#> list()
#> 
#> $data$metadataSets[[244]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[245]]
#> $data$metadataSets[[245]]$annotations
#> list()
#> 
#> $data$metadataSets[[245]]$id
#> [1] "WORLDSCOPE_ON_DATASTREAM"
#> 
#> $data$metadataSets[[245]]$name
#> [1] "Worldscope on Datastream"
#> 
#> $data$metadataSets[[245]]$names
#> $data$metadataSets[[245]]$names$en
#> [1] "Worldscope on Datastream"
#> 
#> 
#> $data$metadataSets[[245]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[245]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[245]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[245]]$attributes
#> list()
#> 
#> $data$metadataSets[[245]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[246]]
#> $data$metadataSets[[246]]$annotations
#> list()
#> 
#> $data$metadataSets[[246]]$id
#> [1] "A_M_BEST_NEWS_AND_RESEARCH_SERVICE"
#> 
#> $data$metadataSets[[246]]$name
#> [1] "A.M. Best News and Research Service"
#> 
#> $data$metadataSets[[246]]$names
#> $data$metadataSets[[246]]$names$en
#> [1] "A.M. Best News and Research Service"
#> 
#> 
#> $data$metadataSets[[246]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[246]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[246]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[246]]$attributes
#> list()
#> 
#> $data$metadataSets[[246]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[247]]
#> $data$metadataSets[[247]]$annotations
#> list()
#> 
#> $data$metadataSets[[247]]$id
#> [1] "ECRI_STAT_PKG_2023_LENDING_TO_HOUSEHOLDS_AND_NON-FIN_CORPS_IN_EUROPE_1995-2022"
#> 
#> $data$metadataSets[[247]]$name
#> [1] "ECRI Statistical Package 2023 Lending to Households and Non-Financial Corporations in Europe 1995-2022"
#> 
#> $data$metadataSets[[247]]$names
#> $data$metadataSets[[247]]$names$en
#> [1] "ECRI Statistical Package 2023 Lending to Households and Non-Financial Corporations in Europe 1995-2022"
#> 
#> 
#> $data$metadataSets[[247]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[247]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[247]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[247]]$attributes
#> list()
#> 
#> $data$metadataSets[[247]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[248]]
#> $data$metadataSets[[248]]$annotations
#> list()
#> 
#> $data$metadataSets[[248]]$id
#> [1] "FITCH_BMI"
#> 
#> $data$metadataSets[[248]]$name
#> [1] "Fitch BMI"
#> 
#> $data$metadataSets[[248]]$names
#> $data$metadataSets[[248]]$names$en
#> [1] "Fitch BMI"
#> 
#> 
#> $data$metadataSets[[248]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[248]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[248]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[248]]$attributes
#> list()
#> 
#> $data$metadataSets[[248]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[249]]
#> $data$metadataSets[[249]]$annotations
#> list()
#> 
#> $data$metadataSets[[249]]$id
#> [1] "HAVER_ANALYTICS"
#> 
#> $data$metadataSets[[249]]$name
#> [1] "Haver Analytics"
#> 
#> $data$metadataSets[[249]]$names
#> $data$metadataSets[[249]]$names$en
#> [1] "Haver Analytics"
#> 
#> 
#> $data$metadataSets[[249]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[249]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[249]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[249]]$attributes
#> list()
#> 
#> $data$metadataSets[[249]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[250]]
#> $data$metadataSets[[250]]$annotations
#> list()
#> 
#> $data$metadataSets[[250]]$id
#> [1] "FDDH"
#> 
#> $data$metadataSets[[250]]$name
#> [1] "Forced Displacement Data Hub"
#> 
#> $data$metadataSets[[250]]$names
#> $data$metadataSets[[250]]$names$en
#> [1] "Forced Displacement Data Hub"
#> 
#> 
#> $data$metadataSets[[250]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[250]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[250]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[250]]$attributes
#> list()
#> 
#> $data$metadataSets[[250]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[251]]
#> $data$metadataSets[[251]]$annotations
#> list()
#> 
#> $data$metadataSets[[251]]$id
#> [1] "GLOBAL_ECONOMIC_MONITOR_GEM"
#> 
#> $data$metadataSets[[251]]$name
#> [1] "Global Economic Monitor (GEM)"
#> 
#> $data$metadataSets[[251]]$names
#> $data$metadataSets[[251]]$names$en
#> [1] "Global Economic Monitor (GEM)"
#> 
#> 
#> $data$metadataSets[[251]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[251]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[251]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[251]]$attributes
#> list()
#> 
#> $data$metadataSets[[251]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[252]]
#> $data$metadataSets[[252]]$annotations
#> list()
#> 
#> $data$metadataSets[[252]]$id
#> [1] "PITCHBOOK_LEVERAGED_COMMENTARY_DATA_LCD"
#> 
#> $data$metadataSets[[252]]$name
#> [1] "PitchBook/ Leveraged Commentary & Data (LCD)"
#> 
#> $data$metadataSets[[252]]$names
#> $data$metadataSets[[252]]$names$en
#> [1] "PitchBook/ Leveraged Commentary & Data (LCD)"
#> 
#> 
#> $data$metadataSets[[252]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[252]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[252]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[252]]$attributes
#> list()
#> 
#> $data$metadataSets[[252]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[253]]
#> $data$metadataSets[[253]]$annotations
#> list()
#> 
#> $data$metadataSets[[253]]$id
#> [1] "OECD_ILIBRARY"
#> 
#> $data$metadataSets[[253]]$name
#> [1] "OECD iLibrary"
#> 
#> $data$metadataSets[[253]]$names
#> $data$metadataSets[[253]]$names$en
#> [1] "OECD iLibrary"
#> 
#> 
#> $data$metadataSets[[253]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[253]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[253]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[253]]$attributes
#> list()
#> 
#> $data$metadataSets[[253]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[254]]
#> $data$metadataSets[[254]]$annotations
#> list()
#> 
#> $data$metadataSets[[254]]$id
#> [1] "UK_OFFICE_FOR_NATIONAL_STATISTICS_ONS-TABULATED_LABOR_FORCE_AND_POPULATION_DATA"
#> 
#> $data$metadataSets[[254]]$name
#> [1] "UK Office for National Statistics (ONS) - Tabulated Labor Force and Population data"
#> 
#> $data$metadataSets[[254]]$names
#> $data$metadataSets[[254]]$names$en
#> [1] "UK Office for National Statistics (ONS) - Tabulated Labor Force and Population data"
#> 
#> 
#> $data$metadataSets[[254]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[254]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[254]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[254]]$attributes
#> list()
#> 
#> $data$metadataSets[[254]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[255]]
#> $data$metadataSets[[255]]$annotations
#> list()
#> 
#> $data$metadataSets[[255]]$id
#> [1] "HOMEBASE"
#> 
#> $data$metadataSets[[255]]$name
#> [1] "Homebase"
#> 
#> $data$metadataSets[[255]]$names
#> $data$metadataSets[[255]]$names$en
#> [1] "Homebase"
#> 
#> 
#> $data$metadataSets[[255]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[255]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[255]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[255]]$attributes
#> list()
#> 
#> $data$metadataSets[[255]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[256]]
#> $data$metadataSets[[256]]$annotations
#> list()
#> 
#> $data$metadataSets[[256]]$id
#> [1] "TOMORROW_IO"
#> 
#> $data$metadataSets[[256]]$name
#> [1] "Tomorrow.io"
#> 
#> $data$metadataSets[[256]]$names
#> $data$metadataSets[[256]]$names$en
#> [1] "Tomorrow.io"
#> 
#> 
#> $data$metadataSets[[256]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[256]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[256]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[256]]$attributes
#> list()
#> 
#> $data$metadataSets[[256]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[257]]
#> $data$metadataSets[[257]]$annotations
#> list()
#> 
#> $data$metadataSets[[257]]$id
#> [1] "SP_CAPITAL_IQ_PRO_METALS_MINING"
#> 
#> $data$metadataSets[[257]]$name
#> [1] "S&P Capital IQ Pro Metals & Mining"
#> 
#> $data$metadataSets[[257]]$names
#> $data$metadataSets[[257]]$names$en
#> [1] "S&P Capital IQ Pro Metals & Mining"
#> 
#> 
#> $data$metadataSets[[257]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[257]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[257]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[257]]$attributes
#> list()
#> 
#> $data$metadataSets[[257]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[258]]
#> $data$metadataSets[[258]]$annotations
#> list()
#> 
#> $data$metadataSets[[258]]$id
#> [1] "SDDS_NATIONAL_SUMMARY_DATA_PAGES_NSDP"
#> 
#> $data$metadataSets[[258]]$name
#> [1] "SDDS National Summary Data Pages (NSDP)"
#> 
#> $data$metadataSets[[258]]$names
#> $data$metadataSets[[258]]$names$en
#> [1] "SDDS National Summary Data Pages (NSDP)"
#> 
#> 
#> $data$metadataSets[[258]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[258]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[258]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[258]]$attributes
#> list()
#> 
#> $data$metadataSets[[258]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[259]]
#> $data$metadataSets[[259]]$annotations
#> list()
#> 
#> $data$metadataSets[[259]]$id
#> [1] "WORLD_DEVELOPMENT_INDICATORS_WDI"
#> 
#> $data$metadataSets[[259]]$name
#> [1] "World Development Indicators (WDI)"
#> 
#> $data$metadataSets[[259]]$names
#> $data$metadataSets[[259]]$names$en
#> [1] "World Development Indicators (WDI)"
#> 
#> 
#> $data$metadataSets[[259]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[259]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[259]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[259]]$attributes
#> list()
#> 
#> $data$metadataSets[[259]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[260]]
#> $data$metadataSets[[260]]$annotations
#> list()
#> 
#> $data$metadataSets[[260]]$id
#> [1] "PENSIONS_INVESTMENTS"
#> 
#> $data$metadataSets[[260]]$name
#> [1] "Pensions & Investments"
#> 
#> $data$metadataSets[[260]]$names
#> $data$metadataSets[[260]]$names$en
#> [1] "Pensions & Investments"
#> 
#> 
#> $data$metadataSets[[260]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[260]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[260]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[260]]$attributes
#> list()
#> 
#> $data$metadataSets[[260]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[261]]
#> $data$metadataSets[[261]]$annotations
#> list()
#> 
#> $data$metadataSets[[261]]$id
#> [1] "PITCHBOOK"
#> 
#> $data$metadataSets[[261]]$name
#> [1] "PitchBook"
#> 
#> $data$metadataSets[[261]]$names
#> $data$metadataSets[[261]]$names$en
#> [1] "PitchBook"
#> 
#> 
#> $data$metadataSets[[261]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[261]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[261]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[261]]$attributes
#> list()
#> 
#> $data$metadataSets[[261]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[262]]
#> $data$metadataSets[[262]]$annotations
#> list()
#> 
#> $data$metadataSets[[262]]$id
#> [1] "WORLD_BANK_GENDER_STATISTICS_DATABASE"
#> 
#> $data$metadataSets[[262]]$name
#> [1] "World Bank Gender Statistics Database"
#> 
#> $data$metadataSets[[262]]$names
#> $data$metadataSets[[262]]$names$en
#> [1] "World Bank Gender Statistics Database"
#> 
#> 
#> $data$metadataSets[[262]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[262]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[262]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[262]]$attributes
#> list()
#> 
#> $data$metadataSets[[262]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[263]]
#> $data$metadataSets[[263]]$annotations
#> list()
#> 
#> $data$metadataSets[[263]]$id
#> [1] "mds-4de7e4d1-3801-4bef-b853-c8f7112ca6ac"
#> 
#> $data$metadataSets[[263]]$name
#> [1] "USER30____DEFAULT_ANSWER"
#> 
#> $data$metadataSets[[263]]$names
#> $data$metadataSets[[263]]$names$en
#> [1] "USER30____DEFAULT_ANSWER"
#> 
#> 
#> $data$metadataSets[[263]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[263]]$agencyID
#> [1] "IMF.FAD"
#> 
#> $data$metadataSets[[263]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[263]]$attributes
#> list()
#> 
#> $data$metadataSets[[263]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[264]]
#> $data$metadataSets[[264]]$annotations
#> list()
#> 
#> $data$metadataSets[[264]]$id
#> [1] "SP_CAPITAL_IQ"
#> 
#> $data$metadataSets[[264]]$name
#> [1] "S&P Capital IQ"
#> 
#> $data$metadataSets[[264]]$names
#> $data$metadataSets[[264]]$names$en
#> [1] "S&P Capital IQ"
#> 
#> 
#> $data$metadataSets[[264]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[264]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[264]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[264]]$attributes
#> list()
#> 
#> $data$metadataSets[[264]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[265]]
#> $data$metadataSets[[265]]$annotations
#> list()
#> 
#> $data$metadataSets[[265]]$id
#> [1] "JOINT_EXTERNAL_DEBT_HUB_JEDH"
#> 
#> $data$metadataSets[[265]]$name
#> [1] "Joint External Debt Hub (JEDH)"
#> 
#> $data$metadataSets[[265]]$names
#> $data$metadataSets[[265]]$names$en
#> [1] "Joint External Debt Hub (JEDH)"
#> 
#> 
#> $data$metadataSets[[265]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[265]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[265]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[265]]$attributes
#> list()
#> 
#> $data$metadataSets[[265]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[266]]
#> $data$metadataSets[[266]]$annotations
#> list()
#> 
#> $data$metadataSets[[266]]$id
#> [1] "SP_GLOBAL_FORECAST_DATABASE_VIA_HAVER"
#> 
#> $data$metadataSets[[266]]$name
#> [1] "S&P Global Forecast Database via Haver"
#> 
#> $data$metadataSets[[266]]$names
#> $data$metadataSets[[266]]$names$en
#> [1] "S&P Global Forecast Database via Haver"
#> 
#> 
#> $data$metadataSets[[266]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[266]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[266]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[266]]$attributes
#> list()
#> 
#> $data$metadataSets[[266]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[267]]
#> $data$metadataSets[[267]]$annotations
#> list()
#> 
#> $data$metadataSets[[267]]$id
#> [1] "UNACAST"
#> 
#> $data$metadataSets[[267]]$name
#> [1] "Unacast"
#> 
#> $data$metadataSets[[267]]$names
#> $data$metadataSets[[267]]$names$en
#> [1] "Unacast"
#> 
#> 
#> $data$metadataSets[[267]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[267]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[267]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[267]]$attributes
#> list()
#> 
#> $data$metadataSets[[267]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[268]]
#> $data$metadataSets[[268]]$annotations
#> list()
#> 
#> $data$metadataSets[[268]]$id
#> [1] "SP_RATINGSDIRECT"
#> 
#> $data$metadataSets[[268]]$name
#> [1] "S&P RatingsDirect"
#> 
#> $data$metadataSets[[268]]$names
#> $data$metadataSets[[268]]$names$en
#> [1] "S&P RatingsDirect"
#> 
#> 
#> $data$metadataSets[[268]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[268]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[268]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[268]]$attributes
#> list()
#> 
#> $data$metadataSets[[268]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[269]]
#> $data$metadataSets[[269]]$annotations
#> list()
#> 
#> $data$metadataSets[[269]]$id
#> [1] "INTERNATIONAL_BOND_INDEXES_VIA_HAVER_ANALYTICS"
#> 
#> $data$metadataSets[[269]]$name
#> [1] "International Bond Indexes via Haver Analytics"
#> 
#> $data$metadataSets[[269]]$names
#> $data$metadataSets[[269]]$names$en
#> [1] "International Bond Indexes via Haver Analytics"
#> 
#> 
#> $data$metadataSets[[269]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[269]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[269]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[269]]$attributes
#> list()
#> 
#> $data$metadataSets[[269]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[270]]
#> $data$metadataSets[[270]]$annotations
#> list()
#> 
#> $data$metadataSets[[270]]$id
#> [1] "BOND_RADAR"
#> 
#> $data$metadataSets[[270]]$name
#> [1] "Bond Radar"
#> 
#> $data$metadataSets[[270]]$names
#> $data$metadataSets[[270]]$names$en
#> [1] "Bond Radar"
#> 
#> 
#> $data$metadataSets[[270]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[270]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[270]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[270]]$attributes
#> list()
#> 
#> $data$metadataSets[[270]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[271]]
#> $data$metadataSets[[271]]$annotations
#> list()
#> 
#> $data$metadataSets[[271]]$id
#> [1] "ECONOMIST_INTELLIGENCE_UNIT_EIU"
#> 
#> $data$metadataSets[[271]]$name
#> [1] "Economist Intelligence Unit (EIU)"
#> 
#> $data$metadataSets[[271]]$names
#> $data$metadataSets[[271]]$names$en
#> [1] "Economist Intelligence Unit (EIU)"
#> 
#> 
#> $data$metadataSets[[271]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[271]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[271]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[271]]$attributes
#> list()
#> 
#> $data$metadataSets[[271]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[272]]
#> $data$metadataSets[[272]]$annotations
#> list()
#> 
#> $data$metadataSets[[272]]$id
#> [1] "mds-b60439f0-c911-47a4-848e-00af80a43289"
#> 
#> $data$metadataSets[[272]]$name
#> [1] "USER11____DEFAULT_ANSWER"
#> 
#> $data$metadataSets[[272]]$names
#> $data$metadataSets[[272]]$names$en
#> [1] "USER11____DEFAULT_ANSWER"
#> 
#> 
#> $data$metadataSets[[272]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[272]]$agencyID
#> [1] "IMF.FAD"
#> 
#> $data$metadataSets[[272]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[272]]$attributes
#> list()
#> 
#> $data$metadataSets[[272]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[273]]
#> $data$metadataSets[[273]]$annotations
#> list()
#> 
#> $data$metadataSets[[273]]$id
#> [1] "WORLD_ROBOTICS"
#> 
#> $data$metadataSets[[273]]$name
#> [1] "World Robotics"
#> 
#> $data$metadataSets[[273]]$names
#> $data$metadataSets[[273]]$names$en
#> [1] "World Robotics"
#> 
#> 
#> $data$metadataSets[[273]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[273]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[273]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[273]]$attributes
#> list()
#> 
#> $data$metadataSets[[273]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[274]]
#> $data$metadataSets[[274]]$annotations
#> list()
#> 
#> $data$metadataSets[[274]]$id
#> [1] "AIRFINITY_COVID-19_INTELLIGENCE_PLATFORM_TOOL"
#> 
#> $data$metadataSets[[274]]$name
#> [1] "Airfinity: COVID-19 Intelligence Platform Tool"
#> 
#> $data$metadataSets[[274]]$names
#> $data$metadataSets[[274]]$names$en
#> [1] "Airfinity: COVID-19 Intelligence Platform Tool"
#> 
#> 
#> $data$metadataSets[[274]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[274]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[274]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[274]]$attributes
#> list()
#> 
#> $data$metadataSets[[274]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[275]]
#> $data$metadataSets[[275]]$annotations
#> list()
#> 
#> $data$metadataSets[[275]]$id
#> [1] "SWIFT_WATCH"
#> 
#> $data$metadataSets[[275]]$name
#> [1] "SWIFT Watch"
#> 
#> $data$metadataSets[[275]]$names
#> $data$metadataSets[[275]]$names$en
#> [1] "SWIFT Watch"
#> 
#> 
#> $data$metadataSets[[275]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[275]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[275]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[275]]$attributes
#> list()
#> 
#> $data$metadataSets[[275]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[276]]
#> $data$metadataSets[[276]]$annotations
#> list()
#> 
#> $data$metadataSets[[276]]$id
#> [1] "SP_GLOBAL_PURCHASING_MANAGERS_INDEX_PMI"
#> 
#> $data$metadataSets[[276]]$name
#> [1] "S&P Global Purchasing Managers' Index (PMI)"
#> 
#> $data$metadataSets[[276]]$names
#> $data$metadataSets[[276]]$names$en
#> [1] "S&P Global Purchasing Managers' Index (PMI)"
#> 
#> 
#> $data$metadataSets[[276]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[276]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[276]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[276]]$attributes
#> list()
#> 
#> $data$metadataSets[[276]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[277]]
#> $data$metadataSets[[277]]$annotations
#> list()
#> 
#> $data$metadataSets[[277]]$id
#> [1] "ENERDATA_GLOBAL_DATABASE_ON_ENERGY_MARKETS_AND_CO2_EMISSIONS"
#> 
#> $data$metadataSets[[277]]$name
#> [1] "Enerdata Global Database on Energy Markets and CO2 Emissions"
#> 
#> $data$metadataSets[[277]]$names
#> $data$metadataSets[[277]]$names$en
#> [1] "Enerdata Global Database on Energy Markets and CO2 Emissions"
#> 
#> 
#> $data$metadataSets[[277]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[277]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[277]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[277]]$attributes
#> list()
#> 
#> $data$metadataSets[[277]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[278]]
#> $data$metadataSets[[278]]$annotations
#> list()
#> 
#> $data$metadataSets[[278]]$id
#> [1] "LSEG_TRANSCRIPTS_FORMERLY_REFINITIV_TRANSCRIPTS"
#> 
#> $data$metadataSets[[278]]$name
#> [1] "LSEG Transcripts (formerly Refinitiv Transcripts) "
#> 
#> $data$metadataSets[[278]]$names
#> $data$metadataSets[[278]]$names$en
#> [1] "LSEG Transcripts (formerly Refinitiv Transcripts) "
#> 
#> 
#> $data$metadataSets[[278]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[278]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[278]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[278]]$attributes
#> list()
#> 
#> $data$metadataSets[[278]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[279]]
#> $data$metadataSets[[279]]$annotations
#> list()
#> 
#> $data$metadataSets[[279]]$id
#> [1] "EXANTE_DATA"
#> 
#> $data$metadataSets[[279]]$name
#> [1] "Exante Data"
#> 
#> $data$metadataSets[[279]]$names
#> $data$metadataSets[[279]]$names$en
#> [1] "Exante Data"
#> 
#> 
#> $data$metadataSets[[279]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[279]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[279]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[279]]$attributes
#> list()
#> 
#> $data$metadataSets[[279]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[280]]
#> $data$metadataSets[[280]]$annotations
#> list()
#> 
#> $data$metadataSets[[280]]$id
#> [1] "OECD_PUBLICATIONS"
#> 
#> $data$metadataSets[[280]]$name
#> [1] "OECD Publications"
#> 
#> $data$metadataSets[[280]]$names
#> $data$metadataSets[[280]]$names$en
#> [1] "OECD Publications"
#> 
#> 
#> $data$metadataSets[[280]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[280]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[280]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[280]]$attributes
#> list()
#> 
#> $data$metadataSets[[280]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[281]]
#> $data$metadataSets[[281]]$annotations
#> list()
#> 
#> $data$metadataSets[[281]]$id
#> [1] "UNWTO-UNITED_NATIONS_WORLD_TOURISM_DATABASE"
#> 
#> $data$metadataSets[[281]]$name
#> [1] "UNWTO - United Nations World Tourism Database"
#> 
#> $data$metadataSets[[281]]$names
#> $data$metadataSets[[281]]$names$en
#> [1] "UNWTO - United Nations World Tourism Database"
#> 
#> 
#> $data$metadataSets[[281]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[281]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[281]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[281]]$attributes
#> list()
#> 
#> $data$metadataSets[[281]]$targets
#> list()
#> 
#> 
#> $data$metadataSets[[282]]
#> $data$metadataSets[[282]]$annotations
#> list()
#> 
#> $data$metadataSets[[282]]$id
#> [1] "IRAQ_OIL_REPORT_AND_IRAQ_OIL_AND_FINANCIAL_DATASET"
#> 
#> $data$metadataSets[[282]]$name
#> [1] "Iraq Oil Report and Iraq Oil and Financial Dataset"
#> 
#> $data$metadataSets[[282]]$names
#> $data$metadataSets[[282]]$names$en
#> [1] "Iraq Oil Report and Iraq Oil and Financial Dataset"
#> 
#> 
#> $data$metadataSets[[282]]$version
#> [1] "1.0.0"
#> 
#> $data$metadataSets[[282]]$agencyID
#> [1] "IMF"
#> 
#> $data$metadataSets[[282]]$action
#> [1] "Information"
#> 
#> $data$metadataSets[[282]]$attributes
#> list()
#> 
#> $data$metadataSets[[282]]$targets
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
#> [1] "IDREF2281"
#> 
#> $meta$test
#> [1] FALSE
#> 
#> $meta$prepared
#> [1] "2026-06-17T06:53:39.396488199Z"
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

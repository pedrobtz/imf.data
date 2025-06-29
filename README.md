
<!-- README.md is generated from README.Rmd. Please edit that file -->

# imf.data

<!-- badges: start -->
[![PackageVersion](https://www.r-pkg.org/badges/version/imf.data)](https://www.r-pkg.org/pkg/imf.data)
[![R-CMD-check](https://github.com/pedrobtz/imf.data/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/pedrobtz/imf.data/actions/workflows/R-CMD-check.yaml)
[![downloads](https://cranlogs.r-pkg.org/badges/grand-total/imf.data)](https://cranlogs.r-pkg.org/badges/grand-total/imf.data)
<!-- badges: end -->

The goal of imf.data is to provide an interface to [IMF
Data](https://data.imf.org/) via the [IMF Data REST
API](https://datahelp.imf.org/knowledgebase/articles/667681-json-restful-web-service).

## Installation

Install the released version of remotes from CRAN:

``` r
install.packages("imf.data")
```

## Usage

``` r
library(imf.data)

# list all available time-series
list_datasets()
#>             ID                                                        Description
#> 1       AFRREO              Sub-Saharan Africa Regional Economic Outlook (AFRREO)
#> 2 AFRREO201410 Sub-Saharan Africa Regional Economic Outlook (AFRREO) October 2014
#> 3 AFRREO201504   Sub-Saharan Africa Regional Economic Outlook (AFRREO) April 2015
#> 4 AFRREO201510 Sub-Saharan Africa Regional Economic Outlook (AFRREO) October 2015
#> 5 AFRREO201604   Sub-Saharan Africa Regional Economic Outlook (AFRREO) April 2016
#> 6 AFRREO201610 Sub-Saharan Africa Regional Economic Outlook (AFRREO) October 2016
#> 7 AFRREO201704   Sub-Saharan Africa Regional Economic Outlook (AFRREO) April 2017
#>  [ reached 'max' / getOption("max.print") -- omitted 316 rows ]
```

``` r
# load IFS time-series
IFS <- load_datasets("IFS")

# see possible values for dimension 'ref_area'
IFS$dimensions$ref_area
#>   Value         Description
#> 1    AF         Afghanistan
#> 2    AL             Albania
#> 3    DZ             Algeria
#> 4    AD             Andorra
#> 5    AO              Angola
#> 6    AI            Anguilla
#> 7    AG Antigua and Barbuda
#>  [ reached 'max' / getOption("max.print") -- omitted 264 rows ]

# get time-series for GDP of Portugal, with Annual frequency
IFS$get_series(freq = "A", ref_area = "PT", indicator = "NGDP_D_IX")
#>   TIME_PERIOD   A.PT.NGDP_D_IX
#> 1        1995  65.121159550493
#> 2        1996 66.6781968283958
#> 3        1997 69.2687835398304
#> 4        1998 71.9183372769496
#> 5        1999 74.3423648876999
#> 6        2000 76.8850736800294
#> 7        2001 79.7421096759417
#>  [ reached 'max' / getOption("max.print") -- omitted 22 rows ]
```

``` r
# load DOT time-series
DOT <- load_datasets("DOT")

DOT$get_series(freq = "M",
               ref_area = "PT",
               indicator = "TMG_CIF_USD",
               counterpart_area = c("B0","W00"),
               start_period = "2022-01-01",
               end_period = "2022-12-31")
#>   TIME_PERIOD M.PT.TMG_CIF_USD.B0 M.PT.TMG_CIF_USD.W00
#> 1     2022-01         5901.778786          8595.602054
#> 2     2022-02         6627.285827          9310.123613
#> 3     2022-03         7284.719861          10072.49156
#> 4     2022-04         6643.374962          9309.040471
#> 5     2022-05         7099.878914         10332.531519
#>  [ reached 'max' / getOption("max.print") -- omitted 7 rows ]
```

``` r
HPDD <- load_datasets("HPDD")

HPDD$dimensions$indicator
#>        Value       Description
#> 1 GGXWDG_GDP Debt to GDP Ratio

d <- HPDD$get_series(freq = "A",
                     ref_area = c("PT","ES"),
                     indicator = "GGXWDG_GDP", 
                     start_period = "1974")
# see original data
ls_series <- attr(d, "original_data")
```

``` r
# melt the results 
library(data.table)

cols <- lapply(HPDD$dimensions, function(x)NULL)

melt(as.data.table(d), measure.vars = measurev(cols, sep="."))
#>     TIME_PERIOD   freq ref_area  indicator            value
#>          <char> <char>   <char>     <char>           <char>
#>  1:        1974      A       PT GGXWDG_GDP 13.5038251401281
#>  2:        1975      A       PT GGXWDG_GDP 19.1667501320296
#>  [ reached getOption("max.print") -- omitted 83 rows ]
```


<!-- README.md is generated from README.Rmd. Please edit that file -->

# imf.data

<!-- badges: start -->

[![](https://www.r-pkg.org/badges/version/imf.data)](https://www.r-pkg.org/pkg/imf.data)
[![R-CMD-check](https://github.com/pedrobtz/imf.data/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/pedrobtz/imf.data/actions/workflows/R-CMD-check.yaml)
[![codecov](https://codecov.io/gh/pedrobtz/imf.data/graph/badge.svg?token=VQQI8WH9GR)](https://codecov.io/gh/pedrobtz/imf.data)
[![](https://cranlogs.r-pkg.org/badges/grand-total/imf.data)](https://cranlogs.r-pkg.org/badges/grand-total/imf.data)
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
dt <- list_datasets()
head(dt,3)
#>               ID
#> 297       AFRREO
#> 41  AFRREO201410
#> 110 AFRREO201504
#>                                                            Description
#> 297              Sub-Saharan Africa Regional Economic Outlook (AFRREO)
#> 41  Sub-Saharan Africa Regional Economic Outlook (AFRREO) October 2014
#> 110   Sub-Saharan Africa Regional Economic Outlook (AFRREO) April 2015
```

``` r
# load IFS time-series
IFS <- load_datasets("IFS")

# see possible values for dimension 'ref_area'
tail(IFS$dimensions$ref_area)
#>               Value                                      Description
#> 273 1C_SRF_plus_EMU                               SRF (including EA)
#> 274          1C_SRF                                    SRF Countries
#> 275              F6                               Sub-Saharan Africa
#> 276              7A WAEMU (West African Economic and Monetary Union)
#> 277             A10                               Western Hemisphere
#> 278             W00                  All Countries, excluding the IO

# get time-series for GDP of Portugal, with Annual frequency
x <- IFS$get_series(freq = "A", ref_area = "PT", indicator = "NGDP_D_IX")
head(x)
#>   TIME_PERIOD   A.PT.NGDP_D_IX
#> 1        1995  65.121159550493
#> 2        1996 66.6781968283958
#> 3        1997 69.2687835398304
#> 4        1998 71.9183372769496
#> 5        1999 74.3423648876999
#> 6        2000 76.8850736800294
```

``` r
# load DOT time-series
DOT <- load_datasets("DOT")

y <- DOT$get_series(freq = "M",
                    ref_area = "PT",
                    indicator = "TMG_CIF_USD",
                    counterpart_area = c("B0","W00"),
                    start_period = "2022-01-01",
                    end_period = "2022-12-31")
head(y)
#>   TIME_PERIOD M.PT.TMG_CIF_USD.B0 M.PT.TMG_CIF_USD.W00
#> 1     2022-01         5899.209507          8592.410482
#> 2     2022-02         6625.214152          9306.561169
#> 3     2022-03         7271.456185         10056.201211
#> 4     2022-04         6639.368158          9427.777556
#> 5     2022-05         7095.966482         10432.681421
#> 6     2022-06          6778.13623         10180.535376
```

``` r
HPDD <- load_datasets("HPDD")

HPDD$dimensions$indicator
#>        Value       Description
#> 1 GGXWDG_GDP Debt to GDP Ratio

x <- HPDD$get_series(freq = "A",
                     ref_area = c("PT","ES"),
                     indicator = "GGXWDG_GDP", 
                     start_period = "1974")

tail(x)
#>    TIME_PERIOD  A.PT.GGXWDG_GDP  A.ES.GGXWDG_GDP
#> 37        2010 96.1833185365076 60.0657865156585
#> 38        2011 111.389678797878 69.4619949496129
#> 39        2012 126.209890062282 85.4108429414156
#> 40        2013  129.00084417095 93.6746787462474
#> 41        2014 130.165394937574 99.2870917054055
#> 42        2015  128.97682231548 99.2599490376345
```

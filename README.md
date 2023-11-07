
<!-- README.md is generated from README.Rmd. Please edit that file -->

# imf.data

<!-- badges: start -->

[![R-CMD-check](https://github.com/pedrobtz/imf.data/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/pedrobtz/imf.data/actions/workflows/R-CMD-check.yaml)
[![codecov](https://codecov.io/gh/pedrobtz/imf.data/graph/badge.svg?token=VQQI8WH9GR)](https://codecov.io/gh/pedrobtz/imf.data)
<!-- badges: end -->

The goal of imf.data is to provide an interface to [IMF
Data](https://data.imf.org/) via the [IMF Data REST
API](https://datahelp.imf.org/knowledgebase/articles/667681-json-restful-web-service).

## Installation

You can install the development version of imf.data like so:

``` r
renv::install("github::pedrobtz/imf.data")
```

## Usage

``` r
library(imf.data)

# list all available time-series
dt <- list_datasets()
head(dt,3)
#>            Id                         Description
#> 1 BOP_2017M06 Balance of Payments (BOP), 2017 M06
#> 2  BOP_2020M3 Balance of Payments (BOP), 2020 M03
#> 3 BOP_2017M11 Balance of Payments (BOP), 2017 M11
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

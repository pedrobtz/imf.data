
<!-- README.md is generated from README.Rmd. Please edit that file -->

# imf.data

<!-- badges: start -->

[![Package
Version](https://www.r-pkg.org/badges/version/imf.data)](https://www.r-pkg.org/pkg/imf.data)
[![R-CMD-check](https://github.com/pedrobtz/imf.data/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/pedrobtz/imf.data/actions/workflows/R-CMD-check.yaml)
[![codecov](https://codecov.io/gh/pedrobtz/imf.data/graph/badge.svg?token=VQQI8WH9GR)](https://codecov.io/gh/pedrobtz/imf.data)
[![Code
Coverage](https://cranlogs.r-pkg.org/badges/grand-total/imf.data)](https://cranlogs.r-pkg.org/badges/grand-total/imf.data)
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
#>               ID                                                        Description
#> 297       AFRREO              Sub-Saharan Africa Regional Economic Outlook (AFRREO)
#> 41  AFRREO201410 Sub-Saharan Africa Regional Economic Outlook (AFRREO) October 2014
#> 110 AFRREO201504   Sub-Saharan Africa Regional Economic Outlook (AFRREO) April 2015
#> 58  AFRREO201510 Sub-Saharan Africa Regional Economic Outlook (AFRREO) October 2015
#> 78  AFRREO201604   Sub-Saharan Africa Regional Economic Outlook (AFRREO) April 2016
#> 21  AFRREO201610 Sub-Saharan Africa Regional Economic Outlook (AFRREO) October 2016
#> 34  AFRREO201704   Sub-Saharan Africa Regional Economic Outlook (AFRREO) April 2017
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
#>  [ reached 'max' / getOption("max.print") -- omitted 271 rows ]

IFS$dimensions$indicator
#>              Value                                                                               Description
#> 1       NFIAXD_XDC                      Acquisitions less Disposals of Valuables, Nominal, Domestic Currency
#> 2    NFIAXD_SA_XDC Acquisitions less Disposals of Valuables, Nominal, Seasonally Adjusted, Domestic Currency
#> 3   NFIAXD_NSA_XDC          Acquisitions less Disposals of Valuables, Nominal, Unadjusted, Domestic Currency
#> 4     NFIAXD_R_XDC                         Acquisitions less Disposals of Valuables, Real, Domestic Currency
#> 5  NFIAXD_R_SA_XDC    Acquisitions less Disposals of Valuables, Real, Seasonally Adjusted, Domestic Currency
#> 6 NFIAXD_R_NSA_XDC             Acquisitions less Disposals of Valuables, Real, Unadjusted, Domestic Currency

# get time-series for GDP Deflator Index of Portugal, with Annual frequency
IFS$get_series(freq = "A", ref_area = "PT", indicator = "NGDP_D_IX")
#>   TIME_PERIOD   A.PT.NGDP_D_IX
#> 1        1995  65.121159550493
#> 2        1996 66.6781968283958
#> 3        1997 69.2687835398304
#> 4        1998 71.9183372769496
#> 5        1999 74.3423648876999
#> 6        2000 76.8850736800294
#> 7        2001 79.7421096759417
#>  [ reached 'max' / getOption("max.print") -- omitted 21 rows ]
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
#> 1     2022-01         5899.209507          8592.410482
#> 2     2022-02         6625.214152          9306.561169
#> 3     2022-03         7271.456185         10056.201211
#> 4     2022-04         6639.368158          9427.777556
#> 5     2022-05         7095.966482         10432.681421
#>  [ reached 'max' / getOption("max.print") -- omitted 7 rows ]
```

``` r
HPDD <- load_datasets("HPDD")

HPDD$dimensions$indicator
#>        Value       Description
#> 1 GGXWDG_GDP Debt to GDP Ratio

HPDD$get_series(freq = "A",
                ref_area = c("PT","ES"),
                indicator = "GGXWDG_GDP", 
                start_period = "1974")
#>   TIME_PERIOD  A.PT.GGXWDG_GDP  A.ES.GGXWDG_GDP
#> 1        1974 13.5038251401281 8.40504508036064
#> 2        1975 19.1667501320296 7.25030408773679
#> 3        1976 24.5259382117236 13.0038706110036
#> 4        1977 26.8756607793361 15.3279581608194
#> 5        1978 29.8913266186709 14.3281987356424
#>  [ reached 'max' / getOption("max.print") -- omitted 37 rows ]
```

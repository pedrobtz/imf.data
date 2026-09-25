# List the dimensions of an IMF dataset

Resolve a dataflow's data structure and return its dimensions in SDMX
key order, including the associated codelist where one is declared.

## Usage

``` r
list_dimensions(dataflow, agency_id = "IMF.STA", version = "+")
```

## Arguments

- dataflow:

  Dataflow ID.

- agency_id:

  Maintainer ID.

- version:

  Dataflow version. `"+"` selects the latest stable version.

## Value

A tibble describing each dimension and its codelist.

## Examples

``` r
# \donttest{
list_dimensions("CPI")
#> # A tibble: 6 × 7
#>   position id           type  name  codelist_agency codelist_id codelist_version
#>      <int> <chr>        <chr> <chr> <chr>           <chr>       <chr>           
#> 1        0 COUNTRY      Dime… Coun… IMF             CL_COUNTRY  1.0+.0          
#> 2        1 INDEX_TYPE   Dime… Inde… IMF             CL_INDEX_T… 2.0+.0          
#> 3        2 COICOP_1999  Dime… Expe… IMF             CL_COICOP_… 1.0+.0          
#> 4        3 TYPE_OF_TRA… Dime… Type… IMF.STA         CL_CPI_TYP… 5.0+.0          
#> 5        4 FREQUENCY    Dime… FREQ… NA              NA          NA              
#> 6        5 TIME_PERIOD  Time… TIME… NA              NA          NA              
# }
```

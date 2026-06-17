# Query structural metadata

Retrieve IMF SDMX structural metadata such as dataflows, data
structures, codelists, and concept schemes.

## Usage

``` r
sdmx_structure(
  structure_type = "dataflow",
  agency_id = "*",
  resource_id = "*",
  version = "+",
  detail = NULL,
  references = NULL,
  format = c("json", "xml")
)
```

## Arguments

- structure_type:

  Type of structure to retrieve.

- agency_id:

  Maintainer ID. Use `"*"` for all maintainers.

- resource_id:

  Resource ID. Use `"*"` for all resources.

- version:

  Resource version. `"+"` selects the latest stable version.

- detail:

  Optional SDMX detail level.

- references:

  Optional referenced artefacts to include.

- format:

  Response format. XML responses are returned as text.

## Value

A nested list for JSON, a character value for XML, or `NULL` for an HTTP
204 response.

## Examples

``` r
# \donttest{
sdmx_structure("dataflow", agency_id = "IMF.STA", detail = "allstubs")
#> $data
#> $data$dataflows
#> $data$dataflows[[1]]
#> $data$dataflows[[1]]$annotations
#> list()
#> 
#> $data$dataflows[[1]]$id
#> [1] "MFS_CBS"
#> 
#> $data$dataflows[[1]]$name
#> [1] "Monetary and Financial Statistics (MFS), Central Bank Data"
#> 
#> $data$dataflows[[1]]$names
#> $data$dataflows[[1]]$names$en
#> [1] "Monetary and Financial Statistics (MFS), Central Bank Data"
#> 
#> 
#> $data$dataflows[[1]]$version
#> [1] "24.0.0"
#> 
#> $data$dataflows[[1]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[2]]
#> $data$dataflows[[2]]$annotations
#> list()
#> 
#> $data$dataflows[[2]]$id
#> [1] "CPI"
#> 
#> $data$dataflows[[2]]$name
#> [1] "Consumer Price Index (CPI)"
#> 
#> $data$dataflows[[2]]$names
#> $data$dataflows[[2]]$names$en
#> [1] "Consumer Price Index (CPI)"
#> 
#> 
#> $data$dataflows[[2]]$version
#> [1] "5.0.0"
#> 
#> $data$dataflows[[2]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[3]]
#> $data$dataflows[[3]]$annotations
#> list()
#> 
#> $data$dataflows[[3]]$id
#> [1] "MFS_IR"
#> 
#> $data$dataflows[[3]]$name
#> [1] "Monetary and Financial Statistics (MFS), Interest Rate"
#> 
#> $data$dataflows[[3]]$names
#> $data$dataflows[[3]]$names$en
#> [1] "Monetary and Financial Statistics (MFS), Interest Rate"
#> 
#> 
#> $data$dataflows[[3]]$version
#> [1] "9.0.0"
#> 
#> $data$dataflows[[3]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[4]]
#> $data$dataflows[[4]]$annotations
#> list()
#> 
#> $data$dataflows[[4]]$id
#> [1] "GS_LI"
#> 
#> $data$dataflows[[4]]$name
#> [1] "Gender Statistics (GS) Labor and Income "
#> 
#> $data$dataflows[[4]]$names
#> $data$dataflows[[4]]$names$en
#> [1] "Gender Statistics (GS) Labor and Income "
#> 
#> 
#> $data$dataflows[[4]]$version
#> [1] "1.0.0"
#> 
#> $data$dataflows[[4]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[5]]
#> $data$dataflows[[5]]$annotations
#> list()
#> 
#> $data$dataflows[[5]]$id
#> [1] "ITG_WCA_2026_FEB_VINTAGE"
#> 
#> $data$dataflows[[5]]$name
#> [1] "International Trade in Goods, World and Country Aggregates 2026 February "
#> 
#> $data$dataflows[[5]]$names
#> $data$dataflows[[5]]$names$en
#> [1] "International Trade in Goods, World and Country Aggregates 2026 February "
#> 
#> 
#> $data$dataflows[[5]]$version
#> [1] "1.0.0"
#> 
#> $data$dataflows[[5]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[6]]
#> $data$dataflows[[6]]$annotations
#> list()
#> 
#> $data$dataflows[[6]]$id
#> [1] "FA"
#> 
#> $data$dataflows[[6]]$name
#> [1] "Fund Accounts (FA)"
#> 
#> $data$dataflows[[6]]$names
#> $data$dataflows[[6]]$names$en
#> [1] "Fund Accounts (FA)"
#> 
#> 
#> $data$dataflows[[6]]$version
#> [1] "8.0.0"
#> 
#> $data$dataflows[[6]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[7]]
#> $data$dataflows[[7]]$annotations
#> list()
#> 
#> $data$dataflows[[7]]$id
#> [1] "SPE_2026_JAN_VINTAGE"
#> 
#> $data$dataflows[[7]]$name
#> [1] "Special Purpose Entities (SPEs) 2026 January"
#> 
#> $data$dataflows[[7]]$names
#> $data$dataflows[[7]]$names$en
#> [1] "Special Purpose Entities (SPEs) 2026 January"
#> 
#> 
#> $data$dataflows[[7]]$version
#> [1] "1.0.0"
#> 
#> $data$dataflows[[7]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[8]]
#> $data$dataflows[[8]]$annotations
#> list()
#> 
#> $data$dataflows[[8]]$id
#> [1] "QGDP_WCA_2026_APR_VINTAGE"
#> 
#> $data$dataflows[[8]]$name
#> [1] "Quarterly Gross Domestic Product (GDP), World and Country Aggregates 2026 April"
#> 
#> $data$dataflows[[8]]$names
#> $data$dataflows[[8]]$names$en
#> [1] "Quarterly Gross Domestic Product (GDP), World and Country Aggregates 2026 April"
#> 
#> 
#> $data$dataflows[[8]]$version
#> [1] "1.0.0"
#> 
#> $data$dataflows[[8]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[9]]
#> $data$dataflows[[9]]$annotations
#> list()
#> 
#> $data$dataflows[[9]]$id
#> [1] "PI"
#> 
#> $data$dataflows[[9]]$name
#> [1] "Production Indexes (PI)"
#> 
#> $data$dataflows[[9]]$names
#> $data$dataflows[[9]]$names$en
#> [1] "Production Indexes (PI)"
#> 
#> 
#> $data$dataflows[[9]]$version
#> [1] "2.0.0"
#> 
#> $data$dataflows[[9]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[10]]
#> $data$dataflows[[10]]$annotations
#> list()
#> 
#> $data$dataflows[[10]]$id
#> [1] "ANEA_2026_APR_VINTAGE"
#> 
#> $data$dataflows[[10]]$name
#> [1] "National Economic Accounts (NEA), Annual Data 2026 April"
#> 
#> $data$dataflows[[10]]$names
#> $data$dataflows[[10]]$names$en
#> [1] "National Economic Accounts (NEA), Annual Data 2026 April"
#> 
#> 
#> $data$dataflows[[10]]$version
#> [1] "1.0.0"
#> 
#> $data$dataflows[[10]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[11]]
#> $data$dataflows[[11]]$annotations
#> list()
#> 
#> $data$dataflows[[11]]$id
#> [1] "PPI"
#> 
#> $data$dataflows[[11]]$name
#> [1] "Producer Price Index (PPI)"
#> 
#> $data$dataflows[[11]]$names
#> $data$dataflows[[11]]$names$en
#> [1] "Producer Price Index (PPI)"
#> 
#> 
#> $data$dataflows[[11]]$version
#> [1] "3.0.0"
#> 
#> $data$dataflows[[11]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[12]]
#> $data$dataflows[[12]]$annotations
#> list()
#> 
#> $data$dataflows[[12]]$id
#> [1] "MFS_CBS_2026_JAN_VINTAGE"
#> 
#> $data$dataflows[[12]]$name
#> [1] "Monetary and Financial Statistics (MFS), Central Bank Data 2026 January"
#> 
#> $data$dataflows[[12]]$names
#> $data$dataflows[[12]]$names$en
#> [1] "Monetary and Financial Statistics (MFS), Central Bank Data 2026 January"
#> 
#> 
#> $data$dataflows[[12]]$version
#> [1] "1.0.0"
#> 
#> $data$dataflows[[12]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[13]]
#> $data$dataflows[[13]]$annotations
#> list()
#> 
#> $data$dataflows[[13]]$id
#> [1] "ANEA_2026_FEB_VINTAGE"
#> 
#> $data$dataflows[[13]]$name
#> [1] "National Economic Accounts (NEA), Annual Data 2026 February"
#> 
#> $data$dataflows[[13]]$names
#> $data$dataflows[[13]]$names$en
#> [1] "National Economic Accounts (NEA), Annual Data 2026 February"
#> 
#> 
#> $data$dataflows[[13]]$version
#> [1] "1.0.0"
#> 
#> $data$dataflows[[13]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[14]]
#> $data$dataflows[[14]]$annotations
#> list()
#> 
#> $data$dataflows[[14]]$id
#> [1] "MFS_ODC_2026_MAY_VINTAGE"
#> 
#> $data$dataflows[[14]]$name
#> [1] "Monetary and Financial Statistics (MFS), Other Depository Corporations 2026 May"
#> 
#> $data$dataflows[[14]]$names
#> $data$dataflows[[14]]$names$en
#> [1] "Monetary and Financial Statistics (MFS), Other Depository Corporations 2026 May"
#> 
#> 
#> $data$dataflows[[14]]$version
#> [1] "1.0.0"
#> 
#> $data$dataflows[[14]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[15]]
#> $data$dataflows[[15]]$annotations
#> list()
#> 
#> $data$dataflows[[15]]$id
#> [1] "GS_LEPM"
#> 
#> $data$dataflows[[15]]$name
#> [1] "Gender Statistics (GS) Leadership and empowerment (LEPM)"
#> 
#> $data$dataflows[[15]]$names
#> $data$dataflows[[15]]$names$en
#> [1] "Gender Statistics (GS) Leadership and empowerment (LEPM)"
#> 
#> 
#> $data$dataflows[[15]]$version
#> [1] "2.0.0"
#> 
#> $data$dataflows[[15]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[16]]
#> $data$dataflows[[16]]$annotations
#> list()
#> 
#> $data$dataflows[[16]]$id
#> [1] "GENENVPROEXP"
#> 
#> $data$dataflows[[16]]$name
#> [1] "Government Environmental Protection Expenditures"
#> 
#> $data$dataflows[[16]]$names
#> $data$dataflows[[16]]$names$en
#> [1] "Government Environmental Protection Expenditures"
#> 
#> 
#> $data$dataflows[[16]]$version
#> [1] "1.0.2"
#> 
#> $data$dataflows[[16]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[17]]
#> $data$dataflows[[17]]$annotations
#> list()
#> 
#> $data$dataflows[[17]]$id
#> [1] "QGDP_WCA_2026_MAY_VINTAGE"
#> 
#> $data$dataflows[[17]]$name
#> [1] "Quarterly Gross Domestic Product (GDP), World and Country Aggregates 2026 May "
#> 
#> $data$dataflows[[17]]$names
#> $data$dataflows[[17]]$names$en
#> [1] "Quarterly Gross Domestic Product (GDP), World and Country Aggregates 2026 May "
#> 
#> 
#> $data$dataflows[[17]]$version
#> [1] "1.0.0"
#> 
#> $data$dataflows[[17]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[18]]
#> $data$dataflows[[18]]$annotations
#> list()
#> 
#> $data$dataflows[[18]]$id
#> [1] "CPI_WCA_2026_FEB_VINTAGE"
#> 
#> $data$dataflows[[18]]$name
#> [1] "Consumer Price Index (CPI), World and Country Aggregates (CPI_WCA) 2026 February "
#> 
#> $data$dataflows[[18]]$names
#> $data$dataflows[[18]]$names$en
#> [1] "Consumer Price Index (CPI), World and Country Aggregates (CPI_WCA) 2026 February "
#> 
#> 
#> $data$dataflows[[18]]$version
#> [1] "1.0.0"
#> 
#> $data$dataflows[[18]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[19]]
#> $data$dataflows[[19]]$annotations
#> list()
#> 
#> $data$dataflows[[19]]$id
#> [1] "LS_2026_MAY_VINTAGE"
#> 
#> $data$dataflows[[19]]$name
#> [1] "Labor Statistics (LS) 2026 May"
#> 
#> $data$dataflows[[19]]$names
#> $data$dataflows[[19]]$names$en
#> [1] "Labor Statistics (LS) 2026 May"
#> 
#> 
#> $data$dataflows[[19]]$version
#> [1] "1.0.0"
#> 
#> $data$dataflows[[19]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[20]]
#> $data$dataflows[[20]]$annotations
#> list()
#> 
#> $data$dataflows[[20]]$id
#> [1] "GS_SDO"
#> 
#> $data$dataflows[[20]]$name
#> [1] "Gender Statistics (GS) Social, demographic and other"
#> 
#> $data$dataflows[[20]]$names
#> $data$dataflows[[20]]$names$en
#> [1] "Gender Statistics (GS) Social, demographic and other"
#> 
#> 
#> $data$dataflows[[20]]$version
#> [1] "1.0.0"
#> 
#> $data$dataflows[[20]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[21]]
#> $data$dataflows[[21]]$annotations
#> list()
#> 
#> $data$dataflows[[21]]$id
#> [1] "CFBL"
#> 
#> $data$dataflows[[21]]$name
#> [1] "Carbon Footprint of Bank Loans"
#> 
#> $data$dataflows[[21]]$names
#> $data$dataflows[[21]]$names$en
#> [1] "Carbon Footprint of Bank Loans"
#> 
#> 
#> $data$dataflows[[21]]$version
#> [1] "1.0.3"
#> 
#> $data$dataflows[[21]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[22]]
#> $data$dataflows[[22]]$annotations
#> list()
#> 
#> $data$dataflows[[22]]$id
#> [1] "GS_LGRGHTS"
#> 
#> $data$dataflows[[22]]$name
#> [1] "Gender Statistics (GS) Legal Rights"
#> 
#> $data$dataflows[[22]]$names
#> $data$dataflows[[22]]$names$en
#> [1] "Gender Statistics (GS) Legal Rights"
#> 
#> 
#> $data$dataflows[[22]]$version
#> [1] "1.0.1"
#> 
#> $data$dataflows[[22]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[23]]
#> $data$dataflows[[23]]$annotations
#> list()
#> 
#> $data$dataflows[[23]]$id
#> [1] "QNEA_2026_JAN_VINTAGE"
#> 
#> $data$dataflows[[23]]$name
#> [1] "National Economic Accounts (NEA), Quarterly Data 2026 January"
#> 
#> $data$dataflows[[23]]$names
#> $data$dataflows[[23]]$names$en
#> [1] "National Economic Accounts (NEA), Quarterly Data 2026 January"
#> 
#> 
#> $data$dataflows[[23]]$version
#> [1] "1.0.0"
#> 
#> $data$dataflows[[23]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[24]]
#> $data$dataflows[[24]]$annotations
#> list()
#> 
#> $data$dataflows[[24]]$id
#> [1] "AEA"
#> 
#> $data$dataflows[[24]]$name
#> [1] "Air Emissions Accounts (AEA)"
#> 
#> $data$dataflows[[24]]$names
#> $data$dataflows[[24]]$names$en
#> [1] "Air Emissions Accounts (AEA)"
#> 
#> 
#> $data$dataflows[[24]]$version
#> [1] "7.0.0"
#> 
#> $data$dataflows[[24]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[25]]
#> $data$dataflows[[25]]$annotations
#> list()
#> 
#> $data$dataflows[[25]]$id
#> [1] "CPI_WCA_2026_APR_VINTAGE"
#> 
#> $data$dataflows[[25]]$name
#> [1] "Consumer Price Index (CPI), World and Country Aggregates (CPI_WCA) 2026 April"
#> 
#> $data$dataflows[[25]]$names
#> $data$dataflows[[25]]$names$en
#> [1] "Consumer Price Index (CPI), World and Country Aggregates (CPI_WCA) 2026 April"
#> 
#> 
#> $data$dataflows[[25]]$version
#> [1] "1.0.0"
#> 
#> $data$dataflows[[25]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[26]]
#> $data$dataflows[[26]]$annotations
#> list()
#> 
#> $data$dataflows[[26]]$id
#> [1] "MFS_ODC"
#> 
#> $data$dataflows[[26]]$name
#> [1] "Monetary and Financial Statistics (MFS), Other Depository Corporations"
#> 
#> $data$dataflows[[26]]$names
#> $data$dataflows[[26]]$names$en
#> [1] "Monetary and Financial Statistics (MFS), Other Depository Corporations"
#> 
#> 
#> $data$dataflows[[26]]$version
#> [1] "10.0.0"
#> 
#> $data$dataflows[[26]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[27]]
#> $data$dataflows[[27]]$annotations
#> list()
#> 
#> $data$dataflows[[27]]$id
#> [1] "IIPCC_2026_MAY_VINTAGE"
#> 
#> $data$dataflows[[27]]$name
#> [1] "Currency Composition of the International Investment Position (IIPCC) 2026 May"
#> 
#> $data$dataflows[[27]]$names
#> $data$dataflows[[27]]$names$en
#> [1] "Currency Composition of the International Investment Position (IIPCC) 2026 May"
#> 
#> 
#> $data$dataflows[[27]]$version
#> [1] "1.0.0"
#> 
#> $data$dataflows[[27]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[28]]
#> $data$dataflows[[28]]$annotations
#> list()
#> 
#> $data$dataflows[[28]]$id
#> [1] "BOP_2026_JAN_VINTAGE"
#> 
#> $data$dataflows[[28]]$name
#> [1] "Balance of Payments (BOP) 2026 January"
#> 
#> $data$dataflows[[28]]$names
#> $data$dataflows[[28]]$names$en
#> [1] "Balance of Payments (BOP) 2026 January"
#> 
#> 
#> $data$dataflows[[28]]$version
#> [1] "1.0.0"
#> 
#> $data$dataflows[[28]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[29]]
#> $data$dataflows[[29]]$annotations
#> list()
#> 
#> $data$dataflows[[29]]$id
#> [1] "QNEA_2026_APR_VINTAGE"
#> 
#> $data$dataflows[[29]]$name
#> [1] "National Economic Accounts (NEA), Quarterly Data 2026 April"
#> 
#> $data$dataflows[[29]]$names
#> $data$dataflows[[29]]$names$en
#> [1] "National Economic Accounts (NEA), Quarterly Data 2026 April"
#> 
#> 
#> $data$dataflows[[29]]$version
#> [1] "1.0.0"
#> 
#> $data$dataflows[[29]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[30]]
#> $data$dataflows[[30]]$annotations
#> list()
#> 
#> $data$dataflows[[30]]$id
#> [1] "QGFS_2026_FEB_VINTAGE"
#> 
#> $data$dataflows[[30]]$name
#> [1] "Quarterly Government Finance Statistics (QGFS) 2026 February"
#> 
#> $data$dataflows[[30]]$names
#> $data$dataflows[[30]]$names$en
#> [1] "Quarterly Government Finance Statistics (QGFS) 2026 February"
#> 
#> 
#> $data$dataflows[[30]]$version
#> [1] "1.0.0"
#> 
#> $data$dataflows[[30]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[31]]
#> $data$dataflows[[31]]$annotations
#> list()
#> 
#> $data$dataflows[[31]]$id
#> [1] "LS_2026_FEB_VINTAGE"
#> 
#> $data$dataflows[[31]]$name
#> [1] "Labor Statistics (LS) 2026 February"
#> 
#> $data$dataflows[[31]]$names
#> $data$dataflows[[31]]$names$en
#> [1] "Labor Statistics (LS) 2026 February"
#> 
#> 
#> $data$dataflows[[31]]$version
#> [1] "1.0.0"
#> 
#> $data$dataflows[[31]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[32]]
#> $data$dataflows[[32]]$annotations
#> list()
#> 
#> $data$dataflows[[32]]$id
#> [1] "GS_HEALTH"
#> 
#> $data$dataflows[[32]]$name
#> [1] "Gender Statistics (GS) Health"
#> 
#> $data$dataflows[[32]]$names
#> $data$dataflows[[32]]$names$en
#> [1] "Gender Statistics (GS) Health"
#> 
#> 
#> $data$dataflows[[32]]$version
#> [1] "5.0.0"
#> 
#> $data$dataflows[[32]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[33]]
#> $data$dataflows[[33]]$annotations
#> list()
#> 
#> $data$dataflows[[33]]$id
#> [1] "MFS_ODC_2026_APR_VINTAGE"
#> 
#> $data$dataflows[[33]]$name
#> [1] "Monetary and Financial Statistics (MFS), Other Depository Corporations 2026 April"
#> 
#> $data$dataflows[[33]]$names
#> $data$dataflows[[33]]$names$en
#> [1] "Monetary and Financial Statistics (MFS), Other Depository Corporations 2026 April"
#> 
#> 
#> $data$dataflows[[33]]$version
#> [1] "1.0.0"
#> 
#> $data$dataflows[[33]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[34]]
#> $data$dataflows[[34]]$annotations
#> list()
#> 
#> $data$dataflows[[34]]$id
#> [1] "ESG_FINANCE_CURRENCY"
#> 
#> $data$dataflows[[34]]$name
#> [1] "Sustainable Bonds by Type of Currency"
#> 
#> $data$dataflows[[34]]$names
#> $data$dataflows[[34]]$names$en
#> [1] "Sustainable Bonds by Type of Currency"
#> 
#> 
#> $data$dataflows[[34]]$version
#> [1] "3.0.3"
#> 
#> $data$dataflows[[34]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[35]]
#> $data$dataflows[[35]]$annotations
#> list()
#> 
#> $data$dataflows[[35]]$id
#> [1] "CPI_WCA_2026_MAY_VINTAGE"
#> 
#> $data$dataflows[[35]]$name
#> [1] "Consumer Price Index (CPI), World and Country Aggregates (CPI_WCA) 2026 May"
#> 
#> $data$dataflows[[35]]$names
#> $data$dataflows[[35]]$names$en
#> [1] "Consumer Price Index (CPI), World and Country Aggregates (CPI_WCA) 2026 May"
#> 
#> 
#> $data$dataflows[[35]]$version
#> [1] "1.0.0"
#> 
#> $data$dataflows[[35]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[36]]
#> $data$dataflows[[36]]$annotations
#> list()
#> 
#> $data$dataflows[[36]]$id
#> [1] "DIP"
#> 
#> $data$dataflows[[36]]$name
#> [1] "Direct Investment Positions by Counterpart Economy (formerly CDIS)"
#> 
#> $data$dataflows[[36]]$names
#> $data$dataflows[[36]]$names$en
#> [1] "Direct Investment Positions by Counterpart Economy (formerly CDIS)"
#> 
#> 
#> $data$dataflows[[36]]$version
#> [1] "12.0.1"
#> 
#> $data$dataflows[[36]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[37]]
#> $data$dataflows[[37]]$annotations
#> list()
#> 
#> $data$dataflows[[37]]$id
#> [1] "UNFCCC"
#> 
#> $data$dataflows[[37]]$name
#> [1] "Greenhouse Gas Emissions (UNFCCC)"
#> 
#> $data$dataflows[[37]]$names
#> $data$dataflows[[37]]$names$en
#> [1] "Greenhouse Gas Emissions (UNFCCC)"
#> 
#> 
#> $data$dataflows[[37]]$version
#> [1] "3.0.0"
#> 
#> $data$dataflows[[37]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[38]]
#> $data$dataflows[[38]]$annotations
#> list()
#> 
#> $data$dataflows[[38]]$id
#> [1] "MFS_FC"
#> 
#> $data$dataflows[[38]]$name
#> [1] "Monetary and Financial Statistics (MFS), Financial Corporations"
#> 
#> $data$dataflows[[38]]$names
#> $data$dataflows[[38]]$names$en
#> [1] "Monetary and Financial Statistics (MFS), Financial Corporations"
#> 
#> 
#> $data$dataflows[[38]]$version
#> [1] "9.0.0"
#> 
#> $data$dataflows[[38]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[39]]
#> $data$dataflows[[39]]$annotations
#> list()
#> 
#> $data$dataflows[[39]]$id
#> [1] "EER"
#> 
#> $data$dataflows[[39]]$name
#> [1] "Effective Exchange Rate (EER)"
#> 
#> $data$dataflows[[39]]$names
#> $data$dataflows[[39]]$names$en
#> [1] "Effective Exchange Rate (EER)"
#> 
#> 
#> $data$dataflows[[39]]$version
#> [1] "6.0.0"
#> 
#> $data$dataflows[[39]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[40]]
#> $data$dataflows[[40]]$annotations
#> list()
#> 
#> $data$dataflows[[40]]$id
#> [1] "PI_WCA_2026_JAN_VINTAGE"
#> 
#> $data$dataflows[[40]]$name
#> [1] "Production Indexes, World and Country Group Aggregates 2026 January"
#> 
#> $data$dataflows[[40]]$names
#> $data$dataflows[[40]]$names$en
#> [1] "Production Indexes, World and Country Group Aggregates 2026 January"
#> 
#> 
#> $data$dataflows[[40]]$version
#> [1] "1.0.0"
#> 
#> $data$dataflows[[40]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[41]]
#> $data$dataflows[[41]]$annotations
#> list()
#> 
#> $data$dataflows[[41]]$id
#> [1] "GFS_SOO"
#> 
#> $data$dataflows[[41]]$name
#> [1] "GFS Statement of Operations "
#> 
#> $data$dataflows[[41]]$names
#> $data$dataflows[[41]]$names$en
#> [1] "GFS Statement of Operations "
#> 
#> 
#> $data$dataflows[[41]]$version
#> [1] "12.0.0"
#> 
#> $data$dataflows[[41]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[42]]
#> $data$dataflows[[42]]$annotations
#> list()
#> 
#> $data$dataflows[[42]]$id
#> [1] "QNEA_2026_MAY_VINTAGE"
#> 
#> $data$dataflows[[42]]$name
#> [1] "National Economic Accounts (NEA), Quarterly Data 2026 May"
#> 
#> $data$dataflows[[42]]$names
#> $data$dataflows[[42]]$names$en
#> [1] "National Economic Accounts (NEA), Quarterly Data 2026 May"
#> 
#> 
#> $data$dataflows[[42]]$version
#> [1] "1.0.0"
#> 
#> $data$dataflows[[42]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[43]]
#> $data$dataflows[[43]]$annotations
#> list()
#> 
#> $data$dataflows[[43]]$id
#> [1] "ANEA_2026_MAY_VINTAGE"
#> 
#> $data$dataflows[[43]]$name
#> [1] "National Economic Accounts (NEA), Annual Data 2026 May"
#> 
#> $data$dataflows[[43]]$names
#> $data$dataflows[[43]]$names$en
#> [1] "National Economic Accounts (NEA), Annual Data 2026 May"
#> 
#> 
#> $data$dataflows[[43]]$version
#> [1] "1.0.0"
#> 
#> $data$dataflows[[43]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[44]]
#> $data$dataflows[[44]]$annotations
#> list()
#> 
#> $data$dataflows[[44]]$id
#> [1] "EER_2026_JAN_VINTAGE"
#> 
#> $data$dataflows[[44]]$name
#> [1] "Effective Exchange Rates (ER) 2026 January"
#> 
#> $data$dataflows[[44]]$names
#> $data$dataflows[[44]]$names$en
#> [1] "Effective Exchange Rates (ER) 2026 January"
#> 
#> 
#> $data$dataflows[[44]]$version
#> [1] "1.0.0"
#> 
#> $data$dataflows[[44]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[45]]
#> $data$dataflows[[45]]$annotations
#> list()
#> 
#> $data$dataflows[[45]]$id
#> [1] "ANEA"
#> 
#> $data$dataflows[[45]]$name
#> [1] "National Economic Accounts (NEA), Annual Data"
#> 
#> $data$dataflows[[45]]$names
#> $data$dataflows[[45]]$names$en
#> [1] "National Economic Accounts (NEA), Annual Data"
#> 
#> 
#> $data$dataflows[[45]]$version
#> [1] "6.0.1"
#> 
#> $data$dataflows[[45]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[46]]
#> $data$dataflows[[46]]$annotations
#> list()
#> 
#> $data$dataflows[[46]]$id
#> [1] "GFS_COFOG"
#> 
#> $data$dataflows[[46]]$name
#> [1] "GFS Government Expenditures by Function"
#> 
#> $data$dataflows[[46]]$names
#> $data$dataflows[[46]]$names$en
#> [1] "GFS Government Expenditures by Function"
#> 
#> 
#> $data$dataflows[[46]]$version
#> [1] "11.0.0"
#> 
#> $data$dataflows[[46]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[47]]
#> $data$dataflows[[47]]$annotations
#> list()
#> 
#> $data$dataflows[[47]]$id
#> [1] "ANEA_2026_JAN_VINTAGE"
#> 
#> $data$dataflows[[47]]$name
#> [1] "National Economic Accounts (NEA), Annual Data 2026 January"
#> 
#> $data$dataflows[[47]]$names
#> $data$dataflows[[47]]$names$en
#> [1] "National Economic Accounts (NEA), Annual Data 2026 January"
#> 
#> 
#> $data$dataflows[[47]]$version
#> [1] "1.0.0"
#> 
#> $data$dataflows[[47]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[48]]
#> $data$dataflows[[48]]$annotations
#> list()
#> 
#> $data$dataflows[[48]]$id
#> [1] "FSIC"
#> 
#> $data$dataflows[[48]]$name
#> [1] "Financial Soundness Indicators (FSI), Core and Additional Indicators"
#> 
#> $data$dataflows[[48]]$names
#> $data$dataflows[[48]]$names$en
#> [1] "Financial Soundness Indicators (FSI), Core and Additional Indicators"
#> 
#> 
#> $data$dataflows[[48]]$version
#> [1] "13.0.1"
#> 
#> $data$dataflows[[48]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[49]]
#> $data$dataflows[[49]]$annotations
#> list()
#> 
#> $data$dataflows[[49]]$id
#> [1] "EER_INPUTS_2026_APR_VINTAGE"
#> 
#> $data$dataflows[[49]]$name
#> [1] "Effective Exchange Rates (EER), Inputs 2026 April"
#> 
#> $data$dataflows[[49]]$names
#> $data$dataflows[[49]]$names$en
#> [1] "Effective Exchange Rates (EER), Inputs 2026 April"
#> 
#> 
#> $data$dataflows[[49]]$version
#> [1] "1.0.0"
#> 
#> $data$dataflows[[49]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[50]]
#> $data$dataflows[[50]]$annotations
#> list()
#> 
#> $data$dataflows[[50]]$id
#> [1] "MFS_FMP_2026_APR_VINTAGE"
#> 
#> $data$dataflows[[50]]$name
#> [1] "Monetary and Financial Statistics (MFS), Financial Market Prices 2026 April"
#> 
#> $data$dataflows[[50]]$names
#> $data$dataflows[[50]]$names$en
#> [1] "Monetary and Financial Statistics (MFS), Financial Market Prices 2026 April"
#> 
#> 
#> $data$dataflows[[50]]$version
#> [1] "1.0.0"
#> 
#> $data$dataflows[[50]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[51]]
#> $data$dataflows[[51]]$annotations
#> list()
#> 
#> $data$dataflows[[51]]$id
#> [1] "IIPCC_2026_APR_VINTAGE"
#> 
#> $data$dataflows[[51]]$name
#> [1] "Currency Composition of the International Investment Position (IIPCC) 2026 April"
#> 
#> $data$dataflows[[51]]$names
#> $data$dataflows[[51]]$names$en
#> [1] "Currency Composition of the International Investment Position (IIPCC) 2026 April"
#> 
#> 
#> $data$dataflows[[51]]$version
#> [1] "1.0.0"
#> 
#> $data$dataflows[[51]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[52]]
#> $data$dataflows[[52]]$annotations
#> list()
#> 
#> $data$dataflows[[52]]$id
#> [1] "IIP_2026_JAN_VINTAGE"
#> 
#> $data$dataflows[[52]]$name
#> [1] "International Investment Position (IIP) 2026 January"
#> 
#> $data$dataflows[[52]]$names
#> $data$dataflows[[52]]$names$en
#> [1] "International Investment Position (IIP) 2026 January"
#> 
#> 
#> $data$dataflows[[52]]$version
#> [1] "1.0.0"
#> 
#> $data$dataflows[[52]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[53]]
#> $data$dataflows[[53]]$annotations
#> list()
#> 
#> $data$dataflows[[53]]$id
#> [1] "BOP"
#> 
#> $data$dataflows[[53]]$name
#> [1] "Balance of Payments (BOP)"
#> 
#> $data$dataflows[[53]]$names
#> $data$dataflows[[53]]$names$en
#> [1] "Balance of Payments (BOP)"
#> 
#> 
#> $data$dataflows[[53]]$version
#> [1] "21.0.0"
#> 
#> $data$dataflows[[53]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[54]]
#> $data$dataflows[[54]]$annotations
#> list()
#> 
#> $data$dataflows[[54]]$id
#> [1] "FD"
#> 
#> $data$dataflows[[54]]$name
#> [1] "Fiscal Decentralization (FD)"
#> 
#> $data$dataflows[[54]]$names
#> $data$dataflows[[54]]$names$en
#> [1] "Fiscal Decentralization (FD)"
#> 
#> 
#> $data$dataflows[[54]]$version
#> [1] "6.0.0"
#> 
#> $data$dataflows[[54]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[55]]
#> $data$dataflows[[55]]$annotations
#> list()
#> 
#> $data$dataflows[[55]]$id
#> [1] "IL_2026_JAN_VINTAGE"
#> 
#> $data$dataflows[[55]]$name
#> [1] "International Liquidity (IL) 2026 January"
#> 
#> $data$dataflows[[55]]$names
#> $data$dataflows[[55]]$names$en
#> [1] "International Liquidity (IL) 2026 January"
#> 
#> 
#> $data$dataflows[[55]]$version
#> [1] "1.0.0"
#> 
#> $data$dataflows[[55]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[56]]
#> $data$dataflows[[56]]$annotations
#> list()
#> 
#> $data$dataflows[[56]]$id
#> [1] "FSI_COUNTRY_METADATA_TABLE_2"
#> 
#> $data$dataflows[[56]]$name
#> [1] "Financial Soundness Indicators (FSI), Country Metadata Table 2"
#> 
#> $data$dataflows[[56]]$names
#> $data$dataflows[[56]]$names$en
#> [1] "Financial Soundness Indicators (FSI), Country Metadata Table 2"
#> 
#> 
#> $data$dataflows[[56]]$version
#> [1] "3.0.0"
#> 
#> $data$dataflows[[56]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[57]]
#> $data$dataflows[[57]]$annotations
#> list()
#> 
#> $data$dataflows[[57]]$id
#> [1] "EER_2026_APR_VINTAGE"
#> 
#> $data$dataflows[[57]]$name
#> [1] "Effective Exchange Rates (ER) 2026 April"
#> 
#> $data$dataflows[[57]]$names
#> $data$dataflows[[57]]$names$en
#> [1] "Effective Exchange Rates (ER) 2026 April"
#> 
#> 
#> $data$dataflows[[57]]$version
#> [1] "1.0.0"
#> 
#> $data$dataflows[[57]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[58]]
#> $data$dataflows[[58]]$annotations
#> list()
#> 
#> $data$dataflows[[58]]$id
#> [1] "MFS_FMP_2026_FEB_VINTAGE"
#> 
#> $data$dataflows[[58]]$name
#> [1] "Monetary and Financial Statistics (MFS), Financial Market Prices 2026 February"
#> 
#> $data$dataflows[[58]]$names
#> $data$dataflows[[58]]$names$en
#> [1] "Monetary and Financial Statistics (MFS), Financial Market Prices 2026 February"
#> 
#> 
#> $data$dataflows[[58]]$version
#> [1] "1.0.0"
#> 
#> $data$dataflows[[58]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[59]]
#> $data$dataflows[[59]]$annotations
#> list()
#> 
#> $data$dataflows[[59]]$id
#> [1] "ESG_FINANCE"
#> 
#> $data$dataflows[[59]]$name
#> [1] "Sustainable Bonds"
#> 
#> $data$dataflows[[59]]$names
#> $data$dataflows[[59]]$names$en
#> [1] "Sustainable Bonds"
#> 
#> 
#> $data$dataflows[[59]]$version
#> [1] "2.0.3"
#> 
#> $data$dataflows[[59]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[60]]
#> $data$dataflows[[60]]$annotations
#> list()
#> 
#> $data$dataflows[[60]]$id
#> [1] "CO2EEIEM"
#> 
#> $data$dataflows[[60]]$name
#> [1] "Carbon Emission Per Unit of Output (CO2EEIEM)"
#> 
#> $data$dataflows[[60]]$names
#> $data$dataflows[[60]]$names$en
#> [1] "Carbon Emission Per Unit of Output (CO2EEIEM)"
#> 
#> 
#> $data$dataflows[[60]]$version
#> [1] "2.0.2"
#> 
#> $data$dataflows[[60]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[61]]
#> $data$dataflows[[61]]$annotations
#> list()
#> 
#> $data$dataflows[[61]]$id
#> [1] "EER_2026_FEB_VINTAGE"
#> 
#> $data$dataflows[[61]]$name
#> [1] "Effective Exchange Rates (ER) 2026 February"
#> 
#> $data$dataflows[[61]]$names
#> $data$dataflows[[61]]$names$en
#> [1] "Effective Exchange Rates (ER) 2026 February"
#> 
#> 
#> $data$dataflows[[61]]$version
#> [1] "1.0.0"
#> 
#> $data$dataflows[[61]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[62]]
#> $data$dataflows[[62]]$annotations
#> list()
#> 
#> $data$dataflows[[62]]$id
#> [1] "GFS_BS"
#> 
#> $data$dataflows[[62]]$name
#> [1] "GFS Balance Sheet"
#> 
#> $data$dataflows[[62]]$names
#> $data$dataflows[[62]]$names$en
#> [1] "GFS Balance Sheet"
#> 
#> 
#> $data$dataflows[[62]]$version
#> [1] "12.0.0"
#> 
#> $data$dataflows[[62]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[63]]
#> $data$dataflows[[63]]$annotations
#> list()
#> 
#> $data$dataflows[[63]]$id
#> [1] "MFS_DC_2026_MAY_VINTAGE"
#> 
#> $data$dataflows[[63]]$name
#> [1] "Monetary and Financial Statistics (MFS), Depository Corporations 2026 May"
#> 
#> $data$dataflows[[63]]$names
#> $data$dataflows[[63]]$names$en
#> [1] "Monetary and Financial Statistics (MFS), Depository Corporations 2026 May"
#> 
#> 
#> $data$dataflows[[63]]$version
#> [1] "1.0.0"
#> 
#> $data$dataflows[[63]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[64]]
#> $data$dataflows[[64]]$annotations
#> list()
#> 
#> $data$dataflows[[64]]$id
#> [1] "LS"
#> 
#> $data$dataflows[[64]]$name
#> [1] "Labor Statistics (LS)"
#> 
#> $data$dataflows[[64]]$names
#> $data$dataflows[[64]]$names$en
#> [1] "Labor Statistics (LS)"
#> 
#> 
#> $data$dataflows[[64]]$version
#> [1] "9.0.0"
#> 
#> $data$dataflows[[64]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[65]]
#> $data$dataflows[[65]]$annotations
#> list()
#> 
#> $data$dataflows[[65]]$id
#> [1] "ER_2026_JAN_VINTAGE"
#> 
#> $data$dataflows[[65]]$name
#> [1] "Exchange Rates (ER) 2026 January"
#> 
#> $data$dataflows[[65]]$names
#> $data$dataflows[[65]]$names$en
#> [1] "Exchange Rates (ER) 2026 January"
#> 
#> 
#> $data$dataflows[[65]]$version
#> [1] "1.0.0"
#> 
#> $data$dataflows[[65]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[66]]
#> $data$dataflows[[66]]$annotations
#> list()
#> 
#> $data$dataflows[[66]]$id
#> [1] "IMTS"
#> 
#> $data$dataflows[[66]]$name
#> [1] "International Trade in Goods (by partner country) (IMTS)"
#> 
#> $data$dataflows[[66]]$names
#> $data$dataflows[[66]]$names$en
#> [1] "International Trade in Goods (by partner country) (IMTS)"
#> 
#> 
#> $data$dataflows[[66]]$version
#> [1] "1.0.0"
#> 
#> $data$dataflows[[66]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[67]]
#> $data$dataflows[[67]]$annotations
#> list()
#> 
#> $data$dataflows[[67]]$id
#> [1] "ITG"
#> 
#> $data$dataflows[[67]]$name
#> [1] "International Trade in Goods (ITG)"
#> 
#> $data$dataflows[[67]]$names
#> $data$dataflows[[67]]$names$en
#> [1] "International Trade in Goods (ITG)"
#> 
#> 
#> $data$dataflows[[67]]$version
#> [1] "4.0.0"
#> 
#> $data$dataflows[[67]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[68]]
#> $data$dataflows[[68]]$annotations
#> list()
#> 
#> $data$dataflows[[68]]$id
#> [1] "PI_WCA_2026_FEB_VINTAGE"
#> 
#> $data$dataflows[[68]]$name
#> [1] "Production Indexes, World and Country Group Aggregates 2026 February"
#> 
#> $data$dataflows[[68]]$names
#> $data$dataflows[[68]]$names$en
#> [1] "Production Indexes, World and Country Group Aggregates 2026 February"
#> 
#> 
#> $data$dataflows[[68]]$version
#> [1] "1.0.0"
#> 
#> $data$dataflows[[68]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[69]]
#> $data$dataflows[[69]]$annotations
#> list()
#> 
#> $data$dataflows[[69]]$id
#> [1] "QGFS_2026_MAY_VINTAGE"
#> 
#> $data$dataflows[[69]]$name
#> [1] "Quarterly Government Finance Statistics (QGFS) 2026 May"
#> 
#> $data$dataflows[[69]]$names
#> $data$dataflows[[69]]$names$en
#> [1] "Quarterly Government Finance Statistics (QGFS) 2026 May"
#> 
#> 
#> $data$dataflows[[69]]$version
#> [1] "1.0.0"
#> 
#> $data$dataflows[[69]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[70]]
#> $data$dataflows[[70]]$annotations
#> list()
#> 
#> $data$dataflows[[70]]$id
#> [1] "QGFS_2026_APR_VINTAGE"
#> 
#> $data$dataflows[[70]]$name
#> [1] "Quarterly Government Finance Statistics (QGFS) 2026 April "
#> 
#> $data$dataflows[[70]]$names
#> $data$dataflows[[70]]$names$en
#> [1] "Quarterly Government Finance Statistics (QGFS) 2026 April "
#> 
#> 
#> $data$dataflows[[70]]$version
#> [1] "1.0.0"
#> 
#> $data$dataflows[[70]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[71]]
#> $data$dataflows[[71]]$annotations
#> list()
#> 
#> $data$dataflows[[71]]$id
#> [1] "MFS_OFC"
#> 
#> $data$dataflows[[71]]$name
#> [1] "Monetary and Financial Statistics (MFS), Other Financial Corporations"
#> 
#> $data$dataflows[[71]]$names
#> $data$dataflows[[71]]$names$en
#> [1] "Monetary and Financial Statistics (MFS), Other Financial Corporations"
#> 
#> 
#> $data$dataflows[[71]]$version
#> [1] "7.0.0"
#> 
#> $data$dataflows[[71]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[72]]
#> $data$dataflows[[72]]$annotations
#> list()
#> 
#> $data$dataflows[[72]]$id
#> [1] "LS_2026_APR_VINTAGE"
#> 
#> $data$dataflows[[72]]$name
#> [1] "Labor Statistics (LS) 2026 April"
#> 
#> $data$dataflows[[72]]$names
#> $data$dataflows[[72]]$names$en
#> [1] "Labor Statistics (LS) 2026 April"
#> 
#> 
#> $data$dataflows[[72]]$version
#> [1] "1.0.0"
#> 
#> $data$dataflows[[72]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[73]]
#> $data$dataflows[[73]]$annotations
#> list()
#> 
#> $data$dataflows[[73]]$id
#> [1] "MFS_MA_2026_MAY_VINTAGE"
#> 
#> $data$dataflows[[73]]$name
#> [1] "Monetary and Financial Statistics (MFS), Monetary Aggregates 2026 May"
#> 
#> $data$dataflows[[73]]$names
#> $data$dataflows[[73]]$names$en
#> [1] "Monetary and Financial Statistics (MFS), Monetary Aggregates 2026 May"
#> 
#> 
#> $data$dataflows[[73]]$version
#> [1] "1.0.0"
#> 
#> $data$dataflows[[73]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[74]]
#> $data$dataflows[[74]]$annotations
#> list()
#> 
#> $data$dataflows[[74]]$id
#> [1] "PI_WCA_2026_APR_VINTAGE"
#> 
#> $data$dataflows[[74]]$name
#> [1] "Production Indexes, World and Country Group Aggregates 2026 April"
#> 
#> $data$dataflows[[74]]$names
#> $data$dataflows[[74]]$names$en
#> [1] "Production Indexes, World and Country Group Aggregates 2026 April"
#> 
#> 
#> $data$dataflows[[74]]$version
#> [1] "1.0.0"
#> 
#> $data$dataflows[[74]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[75]]
#> $data$dataflows[[75]]$annotations
#> list()
#> 
#> $data$dataflows[[75]]$id
#> [1] "MFS_DC_2026_FEB_VINTAGE"
#> 
#> $data$dataflows[[75]]$name
#> [1] "Monetary and Financial Statistics (MFS), Depository Corporations 2026 February"
#> 
#> $data$dataflows[[75]]$names
#> $data$dataflows[[75]]$names$en
#> [1] "Monetary and Financial Statistics (MFS), Depository Corporations 2026 February"
#> 
#> 
#> $data$dataflows[[75]]$version
#> [1] "1.0.0"
#> 
#> $data$dataflows[[75]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[76]]
#> $data$dataflows[[76]]$annotations
#> list()
#> 
#> $data$dataflows[[76]]$id
#> [1] "PIP"
#> 
#> $data$dataflows[[76]]$name
#> [1] "Portfolio Investment Positions by Counterpart Economy (formerly CPIS)"
#> 
#> $data$dataflows[[76]]$names
#> $data$dataflows[[76]]$names$en
#> [1] "Portfolio Investment Positions by Counterpart Economy (formerly CPIS)"
#> 
#> 
#> $data$dataflows[[76]]$version
#> [1] "5.0.0"
#> 
#> $data$dataflows[[76]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[77]]
#> $data$dataflows[[77]]$annotations
#> list()
#> 
#> $data$dataflows[[77]]$id
#> [1] "MFS_IR_2026_JAN_VINTAGE"
#> 
#> $data$dataflows[[77]]$name
#> [1] "Monetary and Financial Statistics (MFS), Interest Rate 2026 January"
#> 
#> $data$dataflows[[77]]$names
#> $data$dataflows[[77]]$names$en
#> [1] "Monetary and Financial Statistics (MFS), Interest Rate 2026 January"
#> 
#> 
#> $data$dataflows[[77]]$version
#> [1] "1.0.0"
#> 
#> $data$dataflows[[77]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[78]]
#> $data$dataflows[[78]]$annotations
#> list()
#> 
#> $data$dataflows[[78]]$id
#> [1] "GFS_SOEF"
#> 
#> $data$dataflows[[78]]$name
#> [1] "GFS Statement of Other Economic Flows"
#> 
#> $data$dataflows[[78]]$names
#> $data$dataflows[[78]]$names$en
#> [1] "GFS Statement of Other Economic Flows"
#> 
#> 
#> $data$dataflows[[78]]$version
#> [1] "11.0.0"
#> 
#> $data$dataflows[[78]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[79]]
#> $data$dataflows[[79]]$annotations
#> list()
#> 
#> $data$dataflows[[79]]$id
#> [1] "PI_WCA"
#> 
#> $data$dataflows[[79]]$name
#> [1] "Production Indexes, World and Country Group Aggregates"
#> 
#> $data$dataflows[[79]]$names
#> $data$dataflows[[79]]$names$en
#> [1] "Production Indexes, World and Country Group Aggregates"
#> 
#> 
#> $data$dataflows[[79]]$version
#> [1] "1.0.0"
#> 
#> $data$dataflows[[79]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[80]]
#> $data$dataflows[[80]]$annotations
#> list()
#> 
#> $data$dataflows[[80]]$id
#> [1] "CO2E"
#> 
#> $data$dataflows[[80]]$name
#> [1] "CO2 emissions embodied in domestic final demand, production, and trade (CO2E)"
#> 
#> $data$dataflows[[80]]$names
#> $data$dataflows[[80]]$names$en
#> [1] "CO2 emissions embodied in domestic final demand, production, and trade (CO2E)"
#> 
#> 
#> $data$dataflows[[80]]$version
#> [1] "2.0.1"
#> 
#> $data$dataflows[[80]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[81]]
#> $data$dataflows[[81]]$annotations
#> list()
#> 
#> $data$dataflows[[81]]$id
#> [1] "FSICDM"
#> 
#> $data$dataflows[[81]]$name
#> [1] "Financial Soundness Indicators (FSI), Concentration and Distribution Measures"
#> 
#> $data$dataflows[[81]]$names
#> $data$dataflows[[81]]$names$en
#> [1] "Financial Soundness Indicators (FSI), Concentration and Distribution Measures"
#> 
#> 
#> $data$dataflows[[81]]$version
#> [1] "7.0.0"
#> 
#> $data$dataflows[[81]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[82]]
#> $data$dataflows[[82]]$annotations
#> list()
#> 
#> $data$dataflows[[82]]$id
#> [1] "QGFS_2026_JAN_VINTAGE"
#> 
#> $data$dataflows[[82]]$name
#> [1] "Quarterly Government Finance Statistics (QGFS) 2026 January"
#> 
#> $data$dataflows[[82]]$names
#> $data$dataflows[[82]]$names$en
#> [1] "Quarterly Government Finance Statistics (QGFS) 2026 January"
#> 
#> 
#> $data$dataflows[[82]]$version
#> [1] "1.0.0"
#> 
#> $data$dataflows[[82]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[83]]
#> $data$dataflows[[83]]$annotations
#> list()
#> 
#> $data$dataflows[[83]]$id
#> [1] "SDG"
#> 
#> $data$dataflows[[83]]$name
#> [1] "IMF Reported SDG Data"
#> 
#> $data$dataflows[[83]]$names
#> $data$dataflows[[83]]$names$en
#> [1] "IMF Reported SDG Data"
#> 
#> 
#> $data$dataflows[[83]]$version
#> [1] "2.0.1"
#> 
#> $data$dataflows[[83]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[84]]
#> $data$dataflows[[84]]$annotations
#> list()
#> 
#> $data$dataflows[[84]]$id
#> [1] "INFORMRISK"
#> 
#> $data$dataflows[[84]]$name
#> [1] "Climate-Driven INFORM Risk Indicator"
#> 
#> $data$dataflows[[84]]$names
#> $data$dataflows[[84]]$names$en
#> [1] "Climate-Driven INFORM Risk Indicator"
#> 
#> 
#> $data$dataflows[[84]]$version
#> [1] "1.0.4"
#> 
#> $data$dataflows[[84]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[85]]
#> $data$dataflows[[85]]$annotations
#> list()
#> 
#> $data$dataflows[[85]]$id
#> [1] "EER_2026_MAY_VINTAGE"
#> 
#> $data$dataflows[[85]]$name
#> [1] "Effective Exchange Rates (ER) 2026 May"
#> 
#> $data$dataflows[[85]]$names
#> $data$dataflows[[85]]$names$en
#> [1] "Effective Exchange Rates (ER) 2026 May"
#> 
#> 
#> $data$dataflows[[85]]$version
#> [1] "1.0.0"
#> 
#> $data$dataflows[[85]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[86]]
#> $data$dataflows[[86]]$annotations
#> list()
#> 
#> $data$dataflows[[86]]$id
#> [1] "ER"
#> 
#> $data$dataflows[[86]]$name
#> [1] "Exchange Rates (ER)"
#> 
#> $data$dataflows[[86]]$names
#> $data$dataflows[[86]]$names$en
#> [1] "Exchange Rates (ER)"
#> 
#> 
#> $data$dataflows[[86]]$version
#> [1] "4.0.1"
#> 
#> $data$dataflows[[86]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[87]]
#> $data$dataflows[[87]]$annotations
#> list()
#> 
#> $data$dataflows[[87]]$id
#> [1] "CPI_WCA"
#> 
#> $data$dataflows[[87]]$name
#> [1] "Consumer Price Index (CPI), World and Country Aggregates (CPI_WCA)"
#> 
#> $data$dataflows[[87]]$names
#> $data$dataflows[[87]]$names$en
#> [1] "Consumer Price Index (CPI), World and Country Aggregates (CPI_WCA)"
#> 
#> 
#> $data$dataflows[[87]]$version
#> [1] "3.0.0"
#> 
#> $data$dataflows[[87]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[88]]
#> $data$dataflows[[88]]$annotations
#> list()
#> 
#> $data$dataflows[[88]]$id
#> [1] "FLTRI"
#> 
#> $data$dataflows[[88]]$name
#> [1] "Forward Looking Transition Risk Indicators"
#> 
#> $data$dataflows[[88]]$names
#> $data$dataflows[[88]]$names$en
#> [1] "Forward Looking Transition Risk Indicators"
#> 
#> 
#> $data$dataflows[[88]]$version
#> [1] "2.0.1"
#> 
#> $data$dataflows[[88]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[89]]
#> $data$dataflows[[89]]$annotations
#> list()
#> 
#> $data$dataflows[[89]]$id
#> [1] "MFS_FMP_2026_MAY_VINTAGE"
#> 
#> $data$dataflows[[89]]$name
#> [1] "Monetary and Financial Statistics (MFS), Financial Market Prices 2026 May"
#> 
#> $data$dataflows[[89]]$names
#> $data$dataflows[[89]]$names$en
#> [1] "Monetary and Financial Statistics (MFS), Financial Market Prices 2026 May"
#> 
#> 
#> $data$dataflows[[89]]$version
#> [1] "1.0.0"
#> 
#> $data$dataflows[[89]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[90]]
#> $data$dataflows[[90]]$annotations
#> list()
#> 
#> $data$dataflows[[90]]$id
#> [1] "QGDP_WCA_2026_FEB_VINTAGE"
#> 
#> $data$dataflows[[90]]$name
#> [1] "Quarterly Gross Domestic Product (GDP), World and Country Aggregates 2026 February "
#> 
#> $data$dataflows[[90]]$names
#> $data$dataflows[[90]]$names$en
#> [1] "Quarterly Gross Domestic Product (GDP), World and Country Aggregates 2026 February "
#> 
#> 
#> $data$dataflows[[90]]$version
#> [1] "1.0.0"
#> 
#> $data$dataflows[[90]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[91]]
#> $data$dataflows[[91]]$annotations
#> list()
#> 
#> $data$dataflows[[91]]$id
#> [1] "ER_2026_MAY_VINTAGE"
#> 
#> $data$dataflows[[91]]$name
#> [1] "Exchange Rates (ER) 2026 May"
#> 
#> $data$dataflows[[91]]$names
#> $data$dataflows[[91]]$names$en
#> [1] "Exchange Rates (ER) 2026 May"
#> 
#> 
#> $data$dataflows[[91]]$version
#> [1] "1.0.0"
#> 
#> $data$dataflows[[91]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[92]]
#> $data$dataflows[[92]]$annotations
#> list()
#> 
#> $data$dataflows[[92]]$id
#> [1] "WPFXI"
#> 
#> $data$dataflows[[92]]$name
#> [1] "Working Paper Foreign Exchange Intervention (WPFXI) A Dataset of Public Data and Proxies"
#> 
#> $data$dataflows[[92]]$names
#> $data$dataflows[[92]]$names$en
#> [1] "Working Paper Foreign Exchange Intervention (WPFXI) A Dataset of Public Data and Proxies"
#> 
#> 
#> $data$dataflows[[92]]$version
#> [1] "1.0.2"
#> 
#> $data$dataflows[[92]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[93]]
#> $data$dataflows[[93]]$annotations
#> list()
#> 
#> $data$dataflows[[93]]$id
#> [1] "BOP_2026_FEB_VINTAGE"
#> 
#> $data$dataflows[[93]]$name
#> [1] "Balance of Payments (BOP) 2026 February"
#> 
#> $data$dataflows[[93]]$names
#> $data$dataflows[[93]]$names$en
#> [1] "Balance of Payments (BOP) 2026 February"
#> 
#> 
#> $data$dataflows[[93]]$version
#> [1] "1.0.0"
#> 
#> $data$dataflows[[93]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[94]]
#> $data$dataflows[[94]]$annotations
#> list()
#> 
#> $data$dataflows[[94]]$id
#> [1] "CRBRATE"
#> 
#> $data$dataflows[[94]]$name
#> [1] "Carbon Rates"
#> 
#> $data$dataflows[[94]]$names
#> $data$dataflows[[94]]$names$en
#> [1] "Carbon Rates"
#> 
#> 
#> $data$dataflows[[94]]$version
#> [1] "2.0.2"
#> 
#> $data$dataflows[[94]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[95]]
#> $data$dataflows[[95]]$annotations
#> list()
#> 
#> $data$dataflows[[95]]$id
#> [1] "LS_2026_JAN_VINTAGE"
#> 
#> $data$dataflows[[95]]$name
#> [1] "Labor Statistics (LS) 2026 January"
#> 
#> $data$dataflows[[95]]$names
#> $data$dataflows[[95]]$names$en
#> [1] "Labor Statistics (LS) 2026 January"
#> 
#> 
#> $data$dataflows[[95]]$version
#> [1] "1.0.0"
#> 
#> $data$dataflows[[95]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[96]]
#> $data$dataflows[[96]]$annotations
#> list()
#> 
#> $data$dataflows[[96]]$id
#> [1] "IIPCC_2026_JAN_VINTAGE"
#> 
#> $data$dataflows[[96]]$name
#> [1] "Currency Composition of the International Investment Position (IIPCC) 2026 January "
#> 
#> $data$dataflows[[96]]$names
#> $data$dataflows[[96]]$names$en
#> [1] "Currency Composition of the International Investment Position (IIPCC) 2026 January "
#> 
#> 
#> $data$dataflows[[96]]$version
#> [1] "1.0.0"
#> 
#> $data$dataflows[[96]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[97]]
#> $data$dataflows[[97]]$annotations
#> list()
#> 
#> $data$dataflows[[97]]$id
#> [1] "BOP_AGG"
#> 
#> $data$dataflows[[97]]$name
#> [1] "Balance of Payments and International Investment Position Statistics (BOP/IIP), World and Country Group Aggregates"
#> 
#> $data$dataflows[[97]]$names
#> $data$dataflows[[97]]$names$en
#> [1] "Balance of Payments and International Investment Position Statistics (BOP/IIP), World and Country Group Aggregates"
#> 
#> 
#> $data$dataflows[[97]]$version
#> [1] "9.0.1"
#> 
#> $data$dataflows[[97]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[98]]
#> $data$dataflows[[98]]$annotations
#> list()
#> 
#> $data$dataflows[[98]]$id
#> [1] "ER_2026_APR_VINTAGE"
#> 
#> $data$dataflows[[98]]$name
#> [1] "Exchange Rates (ER) 2026 April"
#> 
#> $data$dataflows[[98]]$names
#> $data$dataflows[[98]]$names$en
#> [1] "Exchange Rates (ER) 2026 April"
#> 
#> 
#> $data$dataflows[[98]]$version
#> [1] "1.0.0"
#> 
#> $data$dataflows[[98]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[99]]
#> $data$dataflows[[99]]$annotations
#> list()
#> 
#> $data$dataflows[[99]]$id
#> [1] "IL_2026_MAY_VINTAGE"
#> 
#> $data$dataflows[[99]]$name
#> [1] "International Liquidity (IL) 2026 May"
#> 
#> $data$dataflows[[99]]$names
#> $data$dataflows[[99]]$names$en
#> [1] "International Liquidity (IL) 2026 May"
#> 
#> 
#> $data$dataflows[[99]]$version
#> [1] "1.0.0"
#> 
#> $data$dataflows[[99]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[100]]
#> $data$dataflows[[100]]$annotations
#> list()
#> 
#> $data$dataflows[[100]]$id
#> [1] "PI_WCA_2026_MAY_VINTAGE"
#> 
#> $data$dataflows[[100]]$name
#> [1] "Production Indexes, World and Country Group Aggregates 2026 May"
#> 
#> $data$dataflows[[100]]$names
#> $data$dataflows[[100]]$names$en
#> [1] "Production Indexes, World and Country Group Aggregates 2026 May"
#> 
#> 
#> $data$dataflows[[100]]$version
#> [1] "1.0.0"
#> 
#> $data$dataflows[[100]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[101]]
#> $data$dataflows[[101]]$annotations
#> list()
#> 
#> $data$dataflows[[101]]$id
#> [1] "MFS_FC_2026_JAN_VINTAGE"
#> 
#> $data$dataflows[[101]]$name
#> [1] "Monetary and Financial Statistics (MFS), Financial Corporations 2026 January"
#> 
#> $data$dataflows[[101]]$names
#> $data$dataflows[[101]]$names$en
#> [1] "Monetary and Financial Statistics (MFS), Financial Corporations 2026 January"
#> 
#> 
#> $data$dataflows[[101]]$version
#> [1] "1.0.0"
#> 
#> $data$dataflows[[101]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[102]]
#> $data$dataflows[[102]]$annotations
#> list()
#> 
#> $data$dataflows[[102]]$id
#> [1] "CPI_2026_APR_VINTAGE"
#> 
#> $data$dataflows[[102]]$name
#> [1] "Consumer Price Index (CPI) 2026 April"
#> 
#> $data$dataflows[[102]]$names
#> $data$dataflows[[102]]$names$en
#> [1] "Consumer Price Index (CPI) 2026 April"
#> 
#> 
#> $data$dataflows[[102]]$version
#> [1] "1.0.0"
#> 
#> $data$dataflows[[102]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[103]]
#> $data$dataflows[[103]]$annotations
#> list()
#> 
#> $data$dataflows[[103]]$id
#> [1] "IL_2026_FEB_VINTAGE"
#> 
#> $data$dataflows[[103]]$name
#> [1] "International Liquidity (IL) 2026 February"
#> 
#> $data$dataflows[[103]]$names
#> $data$dataflows[[103]]$names$en
#> [1] "International Liquidity (IL) 2026 February"
#> 
#> 
#> $data$dataflows[[103]]$version
#> [1] "1.0.0"
#> 
#> $data$dataflows[[103]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[104]]
#> $data$dataflows[[104]]$annotations
#> list()
#> 
#> $data$dataflows[[104]]$id
#> [1] "IIP_2026_APR_VINTAGE"
#> 
#> $data$dataflows[[104]]$name
#> [1] "International Investment Position (IIP) 2026 April"
#> 
#> $data$dataflows[[104]]$names
#> $data$dataflows[[104]]$names$en
#> [1] "International Investment Position (IIP) 2026 April"
#> 
#> 
#> $data$dataflows[[104]]$version
#> [1] "1.0.0"
#> 
#> $data$dataflows[[104]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[105]]
#> $data$dataflows[[105]]$annotations
#> list()
#> 
#> $data$dataflows[[105]]$id
#> [1] "PPI_2026_JAN_VINTAGE"
#> 
#> $data$dataflows[[105]]$name
#> [1] "Producer Price Index (PPI) 2026 January"
#> 
#> $data$dataflows[[105]]$names
#> $data$dataflows[[105]]$names$en
#> [1] "Producer Price Index (PPI) 2026 January"
#> 
#> 
#> $data$dataflows[[105]]$version
#> [1] "1.0.0"
#> 
#> $data$dataflows[[105]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[106]]
#> $data$dataflows[[106]]$annotations
#> list()
#> 
#> $data$dataflows[[106]]$id
#> [1] "GS_ATF"
#> 
#> $data$dataflows[[106]]$name
#> [1] "Gender Statistics (GS) Access to Finance (ATF)"
#> 
#> $data$dataflows[[106]]$names
#> $data$dataflows[[106]]$names$en
#> [1] "Gender Statistics (GS) Access to Finance (ATF)"
#> 
#> 
#> $data$dataflows[[106]]$version
#> [1] "1.0.0"
#> 
#> $data$dataflows[[106]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[107]]
#> $data$dataflows[[107]]$annotations
#> list()
#> 
#> $data$dataflows[[107]]$id
#> [1] "ER_2026_FEB_VINTAGE"
#> 
#> $data$dataflows[[107]]$name
#> [1] "Exchange Rates (ER) 2026 February"
#> 
#> $data$dataflows[[107]]$names
#> $data$dataflows[[107]]$names$en
#> [1] "Exchange Rates (ER) 2026 February"
#> 
#> 
#> $data$dataflows[[107]]$version
#> [1] "2.0.0"
#> 
#> $data$dataflows[[107]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[108]]
#> $data$dataflows[[108]]$annotations
#> list()
#> 
#> $data$dataflows[[108]]$id
#> [1] "MFS_IR_2026_FEB_VINTAGE"
#> 
#> $data$dataflows[[108]]$name
#> [1] "Monetary and Financial Statistics (MFS), Interest Rate 2026 February"
#> 
#> $data$dataflows[[108]]$names
#> $data$dataflows[[108]]$names$en
#> [1] "Monetary and Financial Statistics (MFS), Interest Rate 2026 February"
#> 
#> 
#> $data$dataflows[[108]]$version
#> [1] "1.0.0"
#> 
#> $data$dataflows[[108]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[109]]
#> $data$dataflows[[109]]$annotations
#> list()
#> 
#> $data$dataflows[[109]]$id
#> [1] "FFS"
#> 
#> $data$dataflows[[109]]$name
#> [1] "Fossil Fuel Subsidies"
#> 
#> $data$dataflows[[109]]$names
#> $data$dataflows[[109]]$names$en
#> [1] "Fossil Fuel Subsidies"
#> 
#> 
#> $data$dataflows[[109]]$version
#> [1] "1.0.2"
#> 
#> $data$dataflows[[109]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[110]]
#> $data$dataflows[[110]]$annotations
#> list()
#> 
#> $data$dataflows[[110]]$id
#> [1] "ITG_2026_FEB_VINTAGE"
#> 
#> $data$dataflows[[110]]$name
#> [1] "International Trade in Goods (ITG) 2026 February"
#> 
#> $data$dataflows[[110]]$names
#> $data$dataflows[[110]]$names$en
#> [1] "International Trade in Goods (ITG) 2026 February"
#> 
#> 
#> $data$dataflows[[110]]$version
#> [1] "1.0.0"
#> 
#> $data$dataflows[[110]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[111]]
#> $data$dataflows[[111]]$annotations
#> list()
#> 
#> $data$dataflows[[111]]$id
#> [1] "MFS_FC_2026_MAY_VINTAGE"
#> 
#> $data$dataflows[[111]]$name
#> [1] "Monetary and Financial Statistics (MFS), Financial Corporations 2026 May"
#> 
#> $data$dataflows[[111]]$names
#> $data$dataflows[[111]]$names$en
#> [1] "Monetary and Financial Statistics (MFS), Financial Corporations 2026 May"
#> 
#> 
#> $data$dataflows[[111]]$version
#> [1] "1.0.0"
#> 
#> $data$dataflows[[111]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[112]]
#> $data$dataflows[[112]]$annotations
#> list()
#> 
#> $data$dataflows[[112]]$id
#> [1] "RE"
#> 
#> $data$dataflows[[112]]$name
#> [1] "Renewable Energy"
#> 
#> $data$dataflows[[112]]$names
#> $data$dataflows[[112]]$names$en
#> [1] "Renewable Energy"
#> 
#> 
#> $data$dataflows[[112]]$version
#> [1] "2.0.1"
#> 
#> $data$dataflows[[112]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[113]]
#> $data$dataflows[[113]]$annotations
#> list()
#> 
#> $data$dataflows[[113]]$id
#> [1] "MFS_FMP_2026_JAN_VINTAGE"
#> 
#> $data$dataflows[[113]]$name
#> [1] "Monetary and Financial Statistics (MFS), Financial Market Prices 2026 January "
#> 
#> $data$dataflows[[113]]$names
#> $data$dataflows[[113]]$names$en
#> [1] "Monetary and Financial Statistics (MFS), Financial Market Prices 2026 January "
#> 
#> 
#> $data$dataflows[[113]]$version
#> [1] "1.0.0"
#> 
#> $data$dataflows[[113]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[114]]
#> $data$dataflows[[114]]$annotations
#> list()
#> 
#> $data$dataflows[[114]]$id
#> [1] "IL_2026_APR_VINTAGE"
#> 
#> $data$dataflows[[114]]$name
#> [1] "International Liquidity (IL) 2026 April"
#> 
#> $data$dataflows[[114]]$names
#> $data$dataflows[[114]]$names$en
#> [1] "International Liquidity (IL) 2026 April"
#> 
#> 
#> $data$dataflows[[114]]$version
#> [1] "1.0.0"
#> 
#> $data$dataflows[[114]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[115]]
#> $data$dataflows[[115]]$annotations
#> list()
#> 
#> $data$dataflows[[115]]$id
#> [1] "MFS_IR_2026_APR_VINTAGE"
#> 
#> $data$dataflows[[115]]$name
#> [1] "Monetary and Financial Statistics (MFS), Interest Rate 2026 April"
#> 
#> $data$dataflows[[115]]$names
#> $data$dataflows[[115]]$names$en
#> [1] "Monetary and Financial Statistics (MFS), Interest Rate 2026 April"
#> 
#> 
#> $data$dataflows[[115]]$version
#> [1] "1.0.0"
#> 
#> $data$dataflows[[115]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[116]]
#> $data$dataflows[[116]]$annotations
#> list()
#> 
#> $data$dataflows[[116]]$id
#> [1] "MFS_FC_2026_APR_VINTAGE"
#> 
#> $data$dataflows[[116]]$name
#> [1] "Monetary and Financial Statistics (MFS), Financial Corporations 2026 April"
#> 
#> $data$dataflows[[116]]$names
#> $data$dataflows[[116]]$names$en
#> [1] "Monetary and Financial Statistics (MFS), Financial Corporations 2026 April"
#> 
#> 
#> $data$dataflows[[116]]$version
#> [1] "1.0.0"
#> 
#> $data$dataflows[[116]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[117]]
#> $data$dataflows[[117]]$annotations
#> list()
#> 
#> $data$dataflows[[117]]$id
#> [1] "IIP_2026_MAY_VINTAGE"
#> 
#> $data$dataflows[[117]]$name
#> [1] "International Investment Position (IIP) 2026 May"
#> 
#> $data$dataflows[[117]]$names
#> $data$dataflows[[117]]$names$en
#> [1] "International Investment Position (IIP) 2026 May"
#> 
#> 
#> $data$dataflows[[117]]$version
#> [1] "1.0.0"
#> 
#> $data$dataflows[[117]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[118]]
#> $data$dataflows[[118]]$annotations
#> list()
#> 
#> $data$dataflows[[118]]$id
#> [1] "MFS_MA_2026_APR_VINTAGE"
#> 
#> $data$dataflows[[118]]$name
#> [1] "Monetary and Financial Statistics (MFS), Monetary Aggregates 2026 April"
#> 
#> $data$dataflows[[118]]$names
#> $data$dataflows[[118]]$names$en
#> [1] "Monetary and Financial Statistics (MFS), Monetary Aggregates 2026 April"
#> 
#> 
#> $data$dataflows[[118]]$version
#> [1] "1.0.0"
#> 
#> $data$dataflows[[118]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[119]]
#> $data$dataflows[[119]]$annotations
#> list()
#> 
#> $data$dataflows[[119]]$id
#> [1] "MFS_MA_2026_FEB_VINTAGE"
#> 
#> $data$dataflows[[119]]$name
#> [1] "Monetary and Financial Statistics (MFS), Monetary Aggregates 2026 February"
#> 
#> $data$dataflows[[119]]$names
#> $data$dataflows[[119]]$names$en
#> [1] "Monetary and Financial Statistics (MFS), Monetary Aggregates 2026 February"
#> 
#> 
#> $data$dataflows[[119]]$version
#> [1] "1.0.0"
#> 
#> $data$dataflows[[119]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[120]]
#> $data$dataflows[[120]]$annotations
#> list()
#> 
#> $data$dataflows[[120]]$id
#> [1] "PI_2026_APR_VINTAGE"
#> 
#> $data$dataflows[[120]]$name
#> [1] "Production Indexes (PI) 2026 April"
#> 
#> $data$dataflows[[120]]$names
#> $data$dataflows[[120]]$names$en
#> [1] "Production Indexes (PI) 2026 April"
#> 
#> 
#> $data$dataflows[[120]]$version
#> [1] "1.0.0"
#> 
#> $data$dataflows[[120]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[121]]
#> $data$dataflows[[121]]$annotations
#> list()
#> 
#> $data$dataflows[[121]]$id
#> [1] "IMTS_2025_DEC_VINTAGE"
#> 
#> $data$dataflows[[121]]$name
#> [1] "International Trade in Goods (by partner country) (IMTS) 2025 December"
#> 
#> $data$dataflows[[121]]$names
#> $data$dataflows[[121]]$names$en
#> [1] "International Trade in Goods (by partner country) (IMTS) 2025 December"
#> 
#> 
#> $data$dataflows[[121]]$version
#> [1] "1.0.0"
#> 
#> $data$dataflows[[121]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[122]]
#> $data$dataflows[[122]]$annotations
#> list()
#> 
#> $data$dataflows[[122]]$id
#> [1] "PI_2026_FEB_VINTAGE"
#> 
#> $data$dataflows[[122]]$name
#> [1] "Production Indexes (PI) 2026 February"
#> 
#> $data$dataflows[[122]]$names
#> $data$dataflows[[122]]$names$en
#> [1] "Production Indexes (PI) 2026 February"
#> 
#> 
#> $data$dataflows[[122]]$version
#> [1] "1.0.0"
#> 
#> $data$dataflows[[122]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[123]]
#> $data$dataflows[[123]]$annotations
#> list()
#> 
#> $data$dataflows[[123]]$id
#> [1] "COFER"
#> 
#> $data$dataflows[[123]]$name
#> [1] "Currency Composition of Official Foreign Exchange Reserves (COFER)"
#> 
#> $data$dataflows[[123]]$names
#> $data$dataflows[[123]]$names$en
#> [1] "Currency Composition of Official Foreign Exchange Reserves (COFER)"
#> 
#> $data$dataflows[[123]]$names$ar
#> [1] "تكوين عملات احتياطيات النقد الأجنبي الرسمية"
#> 
#> $data$dataflows[[123]]$names$es
#> [1] "Composición de las reservas oficiales de divisas"
#> 
#> $data$dataflows[[123]]$names$fr
#> [1] "Composition monétaire des réserves officielles de change (COFER)"
#> 
#> $data$dataflows[[123]]$names$ja
#> [1] "公的外貨準備の通貨別構成（COFER）"
#> 
#> $data$dataflows[[123]]$names$pt
#> [1] "Composição por moeda das reservas cambiais oficiais (COFER)"
#> 
#> $data$dataflows[[123]]$names$ru
#> [1] "Валютная структура официальных валютных резервов (ВСОВР)"
#> 
#> $data$dataflows[[123]]$names$zh
#> [1] "官方外汇储备的货币构成（COFER）"
#> 
#> 
#> $data$dataflows[[123]]$version
#> [1] "7.0.1"
#> 
#> $data$dataflows[[123]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[124]]
#> $data$dataflows[[124]]$annotations
#> list()
#> 
#> $data$dataflows[[124]]$id
#> [1] "MFS_IR_2026_MAY_VINTAGE"
#> 
#> $data$dataflows[[124]]$name
#> [1] "Monetary and Financial Statistics (MFS), Interest Rate 2026 May"
#> 
#> $data$dataflows[[124]]$names
#> $data$dataflows[[124]]$names$en
#> [1] "Monetary and Financial Statistics (MFS), Interest Rate 2026 May"
#> 
#> 
#> $data$dataflows[[124]]$version
#> [1] "1.0.0"
#> 
#> $data$dataflows[[124]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[125]]
#> $data$dataflows[[125]]$annotations
#> list()
#> 
#> $data$dataflows[[125]]$id
#> [1] "MFS_OFC_2026_FEB_VINTAGE"
#> 
#> $data$dataflows[[125]]$name
#> [1] "Monetary and Financial Statistics (MFS), Other Financial Corporations 2026 February"
#> 
#> $data$dataflows[[125]]$names
#> $data$dataflows[[125]]$names$en
#> [1] "Monetary and Financial Statistics (MFS), Other Financial Corporations 2026 February"
#> 
#> 
#> $data$dataflows[[125]]$version
#> [1] "1.0.0"
#> 
#> $data$dataflows[[125]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[126]]
#> $data$dataflows[[126]]$annotations
#> list()
#> 
#> $data$dataflows[[126]]$id
#> [1] "PI_2026_MAY_VINTAGE"
#> 
#> $data$dataflows[[126]]$name
#> [1] "Production Indexes (PI) 2026 May"
#> 
#> $data$dataflows[[126]]$names
#> $data$dataflows[[126]]$names$en
#> [1] "Production Indexes (PI) 2026 May"
#> 
#> 
#> $data$dataflows[[126]]$version
#> [1] "1.0.0"
#> 
#> $data$dataflows[[126]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[127]]
#> $data$dataflows[[127]]$annotations
#> list()
#> 
#> $data$dataflows[[127]]$id
#> [1] "MFS_DC_2026_APR_VINTAGE"
#> 
#> $data$dataflows[[127]]$name
#> [1] "Monetary and Financial Statistics (MFS), Depository Corporations 2026 April"
#> 
#> $data$dataflows[[127]]$names
#> $data$dataflows[[127]]$names$en
#> [1] "Monetary and Financial Statistics (MFS), Depository Corporations 2026 April"
#> 
#> 
#> $data$dataflows[[127]]$version
#> [1] "1.0.0"
#> 
#> $data$dataflows[[127]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[128]]
#> $data$dataflows[[128]]$annotations
#> list()
#> 
#> $data$dataflows[[128]]$id
#> [1] "ENVTX"
#> 
#> $data$dataflows[[128]]$name
#> [1] "Environmental Taxes"
#> 
#> $data$dataflows[[128]]$names
#> $data$dataflows[[128]]$names$en
#> [1] "Environmental Taxes"
#> 
#> 
#> $data$dataflows[[128]]$version
#> [1] "1.0.2"
#> 
#> $data$dataflows[[128]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[129]]
#> $data$dataflows[[129]]$annotations
#> list()
#> 
#> $data$dataflows[[129]]$id
#> [1] "MFS_ODC_2026_JAN_VINTAGE"
#> 
#> $data$dataflows[[129]]$name
#> [1] "Monetary and Financial Statistics (MFS), Other Depository Corporations 2026 January"
#> 
#> $data$dataflows[[129]]$names
#> $data$dataflows[[129]]$names$en
#> [1] "Monetary and Financial Statistics (MFS), Other Depository Corporations 2026 January"
#> 
#> 
#> $data$dataflows[[129]]$version
#> [1] "1.0.0"
#> 
#> $data$dataflows[[129]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[130]]
#> $data$dataflows[[130]]$annotations
#> list()
#> 
#> $data$dataflows[[130]]$id
#> [1] "WPCPER"
#> 
#> $data$dataflows[[130]]$name
#> [1] "Crypto-based Parallel Exchange Rates (Working Paper dataset WP-CPER)"
#> 
#> $data$dataflows[[130]]$names
#> $data$dataflows[[130]]$names$en
#> [1] "Crypto-based Parallel Exchange Rates (Working Paper dataset WP-CPER)"
#> 
#> 
#> $data$dataflows[[130]]$version
#> [1] "6.0.0"
#> 
#> $data$dataflows[[130]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[131]]
#> $data$dataflows[[131]]$annotations
#> list()
#> 
#> $data$dataflows[[131]]$id
#> [1] "BOP_2026_MAY_VINTAGE"
#> 
#> $data$dataflows[[131]]$name
#> [1] "Balance of Payments (BOP) 2026 May"
#> 
#> $data$dataflows[[131]]$names
#> $data$dataflows[[131]]$names$en
#> [1] "Balance of Payments (BOP) 2026 May"
#> 
#> 
#> $data$dataflows[[131]]$version
#> [1] "1.0.0"
#> 
#> $data$dataflows[[131]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[132]]
#> $data$dataflows[[132]]$annotations
#> list()
#> 
#> $data$dataflows[[132]]$id
#> [1] "CPI_2026_MAY_VINTAGE"
#> 
#> $data$dataflows[[132]]$name
#> [1] "Consumer Price Index (CPI) 2026 May"
#> 
#> $data$dataflows[[132]]$names
#> $data$dataflows[[132]]$names$en
#> [1] "Consumer Price Index (CPI) 2026 May"
#> 
#> 
#> $data$dataflows[[132]]$version
#> [1] "1.0.0"
#> 
#> $data$dataflows[[132]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[133]]
#> $data$dataflows[[133]]$annotations
#> list()
#> 
#> $data$dataflows[[133]]$id
#> [1] "MFS_FC_2026_FEB_VINTAGE"
#> 
#> $data$dataflows[[133]]$name
#> [1] "Monetary and Financial Statistics (MFS), Financial Corporations 2026 February"
#> 
#> $data$dataflows[[133]]$names
#> $data$dataflows[[133]]$names$en
#> [1] "Monetary and Financial Statistics (MFS), Financial Corporations 2026 February"
#> 
#> 
#> $data$dataflows[[133]]$version
#> [1] "1.0.0"
#> 
#> $data$dataflows[[133]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[134]]
#> $data$dataflows[[134]]$annotations
#> list()
#> 
#> $data$dataflows[[134]]$id
#> [1] "MFS_MA_2026_JAN_VINTAGE"
#> 
#> $data$dataflows[[134]]$name
#> [1] "Monetary and Financial Statistics (MFS), Monetary Aggregates 2026 January "
#> 
#> $data$dataflows[[134]]$names
#> $data$dataflows[[134]]$names$en
#> [1] "Monetary and Financial Statistics (MFS), Monetary Aggregates 2026 January "
#> 
#> 
#> $data$dataflows[[134]]$version
#> [1] "1.0.0"
#> 
#> $data$dataflows[[134]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[135]]
#> $data$dataflows[[135]]$annotations
#> list()
#> 
#> $data$dataflows[[135]]$id
#> [1] "COFER_2025_OCT_VINTAGE"
#> 
#> $data$dataflows[[135]]$name
#> [1] "Currency Composition of Official Foreign Exchange Reserves (COFER) 2025 October"
#> 
#> $data$dataflows[[135]]$names
#> $data$dataflows[[135]]$names$en
#> [1] "Currency Composition of Official Foreign Exchange Reserves (COFER) 2025 October"
#> 
#> 
#> $data$dataflows[[135]]$version
#> [1] "1.0.0"
#> 
#> $data$dataflows[[135]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[136]]
#> $data$dataflows[[136]]$annotations
#> list()
#> 
#> $data$dataflows[[136]]$id
#> [1] "NDGAIN"
#> 
#> $data$dataflows[[136]]$name
#> [1] "IMF-Adapted ND-GAIN Index (NDGAIN)"
#> 
#> $data$dataflows[[136]]$names
#> $data$dataflows[[136]]$names$en
#> [1] "IMF-Adapted ND-GAIN Index (NDGAIN)"
#> 
#> 
#> $data$dataflows[[136]]$version
#> [1] "1.0.1"
#> 
#> $data$dataflows[[136]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[137]]
#> $data$dataflows[[137]]$annotations
#> list()
#> 
#> $data$dataflows[[137]]$id
#> [1] "IMTS_2026_MAY_VINTAGE"
#> 
#> $data$dataflows[[137]]$name
#> [1] "International Trade in Goods (by partner country) (IMTS) 2026 May"
#> 
#> $data$dataflows[[137]]$names
#> $data$dataflows[[137]]$names$en
#> [1] "International Trade in Goods (by partner country) (IMTS) 2026 May"
#> 
#> 
#> $data$dataflows[[137]]$version
#> [1] "1.0.0"
#> 
#> $data$dataflows[[137]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[138]]
#> $data$dataflows[[138]]$annotations
#> list()
#> 
#> $data$dataflows[[138]]$id
#> [1] "CPI_2026_FEB_VINTAGE"
#> 
#> $data$dataflows[[138]]$name
#> [1] "Consumer Price Index (CPI) 2026 February"
#> 
#> $data$dataflows[[138]]$names
#> $data$dataflows[[138]]$names$en
#> [1] "Consumer Price Index (CPI) 2026 February"
#> 
#> 
#> $data$dataflows[[138]]$version
#> [1] "2.0.0"
#> 
#> $data$dataflows[[138]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[139]]
#> $data$dataflows[[139]]$annotations
#> list()
#> 
#> $data$dataflows[[139]]$id
#> [1] "ITG_2026_APR_VINTAGE"
#> 
#> $data$dataflows[[139]]$name
#> [1] "International Trade in Goods (ITG) 2026 April"
#> 
#> $data$dataflows[[139]]$names
#> $data$dataflows[[139]]$names$en
#> [1] "International Trade in Goods (ITG) 2026 April"
#> 
#> 
#> $data$dataflows[[139]]$version
#> [1] "1.0.0"
#> 
#> $data$dataflows[[139]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[140]]
#> $data$dataflows[[140]]$annotations
#> list()
#> 
#> $data$dataflows[[140]]$id
#> [1] "IMTS_2026_APR_VINTAGE"
#> 
#> $data$dataflows[[140]]$name
#> [1] "International Trade in Goods (by partner country) (IMTS) 2026 April"
#> 
#> $data$dataflows[[140]]$names
#> $data$dataflows[[140]]$names$en
#> [1] "International Trade in Goods (by partner country) (IMTS) 2026 April"
#> 
#> 
#> $data$dataflows[[140]]$version
#> [1] "1.0.0"
#> 
#> $data$dataflows[[140]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[141]]
#> $data$dataflows[[141]]$annotations
#> list()
#> 
#> $data$dataflows[[141]]$id
#> [1] "FA_2026_JAN_VINTAGE"
#> 
#> $data$dataflows[[141]]$name
#> [1] "Fund Accounts (FA) 2026 January"
#> 
#> $data$dataflows[[141]]$names
#> $data$dataflows[[141]]$names$en
#> [1] "Fund Accounts (FA) 2026 January"
#> 
#> 
#> $data$dataflows[[141]]$version
#> [1] "1.0.0"
#> 
#> $data$dataflows[[141]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[142]]
#> $data$dataflows[[142]]$annotations
#> list()
#> 
#> $data$dataflows[[142]]$id
#> [1] "MFS_DC_2026_JAN_VINTAGE"
#> 
#> $data$dataflows[[142]]$name
#> [1] "Monetary and Financial Statistics (MFS), Depository Corporations 2026 January"
#> 
#> $data$dataflows[[142]]$names
#> $data$dataflows[[142]]$names$en
#> [1] "Monetary and Financial Statistics (MFS), Depository Corporations 2026 January"
#> 
#> 
#> $data$dataflows[[142]]$version
#> [1] "1.0.0"
#> 
#> $data$dataflows[[142]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[143]]
#> $data$dataflows[[143]]$annotations
#> list()
#> 
#> $data$dataflows[[143]]$id
#> [1] "IIP_2026_FEB_VINTAGE"
#> 
#> $data$dataflows[[143]]$name
#> [1] "International Investment Position (IIP) 2026 February"
#> 
#> $data$dataflows[[143]]$names
#> $data$dataflows[[143]]$names$en
#> [1] "International Investment Position (IIP) 2026 February"
#> 
#> 
#> $data$dataflows[[143]]$version
#> [1] "1.0.0"
#> 
#> $data$dataflows[[143]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[144]]
#> $data$dataflows[[144]]$annotations
#> list()
#> 
#> $data$dataflows[[144]]$id
#> [1] "GFS_SSUC"
#> 
#> $data$dataflows[[144]]$name
#> [1] "GFS Statement of Sources and Uses of Cash"
#> 
#> $data$dataflows[[144]]$names
#> $data$dataflows[[144]]$names$en
#> [1] "GFS Statement of Sources and Uses of Cash"
#> 
#> 
#> $data$dataflows[[144]]$version
#> [1] "10.0.0"
#> 
#> $data$dataflows[[144]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[145]]
#> $data$dataflows[[145]]$annotations
#> list()
#> 
#> $data$dataflows[[145]]$id
#> [1] "IL"
#> 
#> $data$dataflows[[145]]$name
#> [1] "International Liquidity (IL)"
#> 
#> $data$dataflows[[145]]$names
#> $data$dataflows[[145]]$names$en
#> [1] "International Liquidity (IL)"
#> 
#> 
#> $data$dataflows[[145]]$version
#> [1] "13.0.1"
#> 
#> $data$dataflows[[145]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[146]]
#> $data$dataflows[[146]]$annotations
#> list()
#> 
#> $data$dataflows[[146]]$id
#> [1] "TEG"
#> 
#> $data$dataflows[[146]]$name
#> [1] "Trade in Low Carbon Technology Goods (TEG)"
#> 
#> $data$dataflows[[146]]$names
#> $data$dataflows[[146]]$names$en
#> [1] "Trade in Low Carbon Technology Goods (TEG)"
#> 
#> 
#> $data$dataflows[[146]]$version
#> [1] "3.0.2"
#> 
#> $data$dataflows[[146]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[147]]
#> $data$dataflows[[147]]$annotations
#> list()
#> 
#> $data$dataflows[[147]]$id
#> [1] "ITG_2026_MAY_VINTAGE"
#> 
#> $data$dataflows[[147]]$name
#> [1] "International Trade in Goods (ITG) 2026 May"
#> 
#> $data$dataflows[[147]]$names
#> $data$dataflows[[147]]$names$en
#> [1] "International Trade in Goods (ITG) 2026 May"
#> 
#> 
#> $data$dataflows[[147]]$version
#> [1] "1.0.0"
#> 
#> $data$dataflows[[147]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[148]]
#> $data$dataflows[[148]]$annotations
#> list()
#> 
#> $data$dataflows[[148]]$id
#> [1] "GFS_SFCP"
#> 
#> $data$dataflows[[148]]$name
#> [1] "GFS Stocks and Flows by Counterparty"
#> 
#> $data$dataflows[[148]]$names
#> $data$dataflows[[148]]$names$en
#> [1] "GFS Stocks and Flows by Counterparty"
#> 
#> 
#> $data$dataflows[[148]]$version
#> [1] "10.0.0"
#> 
#> $data$dataflows[[148]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[149]]
#> $data$dataflows[[149]]$annotations
#> list()
#> 
#> $data$dataflows[[149]]$id
#> [1] "BOP_2026_APR_VINTAGE"
#> 
#> $data$dataflows[[149]]$name
#> [1] "Balance of Payments (BOP) 2026 April"
#> 
#> $data$dataflows[[149]]$names
#> $data$dataflows[[149]]$names$en
#> [1] "Balance of Payments (BOP) 2026 April"
#> 
#> 
#> $data$dataflows[[149]]$version
#> [1] "1.0.0"
#> 
#> $data$dataflows[[149]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[150]]
#> $data$dataflows[[150]]$annotations
#> list()
#> 
#> $data$dataflows[[150]]$id
#> [1] "NSDP"
#> 
#> $data$dataflows[[150]]$name
#> [1] "National Summary Data Page (NSDP)"
#> 
#> $data$dataflows[[150]]$names
#> $data$dataflows[[150]]$names$en
#> [1] "National Summary Data Page (NSDP)"
#> 
#> 
#> $data$dataflows[[150]]$version
#> [1] "7.0.0"
#> 
#> $data$dataflows[[150]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[151]]
#> $data$dataflows[[151]]$annotations
#> list()
#> 
#> $data$dataflows[[151]]$id
#> [1] "ESG_FINANCE_ISSUER"
#> 
#> $data$dataflows[[151]]$name
#> [1] "Sustainable Bonds by Type of Issuer"
#> 
#> $data$dataflows[[151]]$names
#> $data$dataflows[[151]]$names$en
#> [1] "Sustainable Bonds by Type of Issuer"
#> 
#> 
#> $data$dataflows[[151]]$version
#> [1] "2.0.3"
#> 
#> $data$dataflows[[151]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[152]]
#> $data$dataflows[[152]]$annotations
#> list()
#> 
#> $data$dataflows[[152]]$id
#> [1] "FA_2026_FEB_VINTAGE"
#> 
#> $data$dataflows[[152]]$name
#> [1] "Fund Accounts (FA) 2026 February"
#> 
#> $data$dataflows[[152]]$names
#> $data$dataflows[[152]]$names$en
#> [1] "Fund Accounts (FA) 2026 February"
#> 
#> 
#> $data$dataflows[[152]]$version
#> [1] "1.0.0"
#> 
#> $data$dataflows[[152]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[153]]
#> $data$dataflows[[153]]$annotations
#> list()
#> 
#> $data$dataflows[[153]]$id
#> [1] "MFS_CBS_2026_FEB_VINTAGE"
#> 
#> $data$dataflows[[153]]$name
#> [1] "Monetary and Financial Statistics (MFS), Central Bank Data 2026 February"
#> 
#> $data$dataflows[[153]]$names
#> $data$dataflows[[153]]$names$en
#> [1] "Monetary and Financial Statistics (MFS), Central Bank Data 2026 February"
#> 
#> 
#> $data$dataflows[[153]]$version
#> [1] "1.0.0"
#> 
#> $data$dataflows[[153]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[154]]
#> $data$dataflows[[154]]$annotations
#> list()
#> 
#> $data$dataflows[[154]]$id
#> [1] "MFS_CBS_2026_APR_VINTAGE"
#> 
#> $data$dataflows[[154]]$name
#> [1] "Monetary and Financial Statistics (MFS), Central Bank Data 2026 April "
#> 
#> $data$dataflows[[154]]$names
#> $data$dataflows[[154]]$names$en
#> [1] "Monetary and Financial Statistics (MFS), Central Bank Data 2026 April "
#> 
#> 
#> $data$dataflows[[154]]$version
#> [1] "1.0.0"
#> 
#> $data$dataflows[[154]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[155]]
#> $data$dataflows[[155]]$annotations
#> list()
#> 
#> $data$dataflows[[155]]$id
#> [1] "QGDP_WCA_2026_JAN_VINTAGE"
#> 
#> $data$dataflows[[155]]$name
#> [1] "Quarterly Gross Domestic Product (GDP), World and Country Aggregates 2026 January"
#> 
#> $data$dataflows[[155]]$names
#> $data$dataflows[[155]]$names$en
#> [1] "Quarterly Gross Domestic Product (GDP), World and Country Aggregates 2026 January"
#> 
#> 
#> $data$dataflows[[155]]$version
#> [1] "1.0.0"
#> 
#> $data$dataflows[[155]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[156]]
#> $data$dataflows[[156]]$annotations
#> list()
#> 
#> $data$dataflows[[156]]$id
#> [1] "SPE_2026_MAY_VINTAGE"
#> 
#> $data$dataflows[[156]]$name
#> [1] "Special Purpose Entities (SPEs) 2026 May "
#> 
#> $data$dataflows[[156]]$names
#> $data$dataflows[[156]]$names$en
#> [1] "Special Purpose Entities (SPEs) 2026 May "
#> 
#> 
#> $data$dataflows[[156]]$version
#> [1] "1.0.0"
#> 
#> $data$dataflows[[156]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[157]]
#> $data$dataflows[[157]]$annotations
#> list()
#> 
#> $data$dataflows[[157]]$id
#> [1] "MFS_NSRF"
#> 
#> $data$dataflows[[157]]$name
#> [1] "Monetary and Financial Statistics (MFS),  Non-Standard Data"
#> 
#> $data$dataflows[[157]]$names
#> $data$dataflows[[157]]$names$en
#> [1] "Monetary and Financial Statistics (MFS),  Non-Standard Data"
#> 
#> 
#> $data$dataflows[[157]]$version
#> [1] "1.0.3"
#> 
#> $data$dataflows[[157]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[158]]
#> $data$dataflows[[158]]$annotations
#> list()
#> 
#> $data$dataflows[[158]]$id
#> [1] "QNEA"
#> 
#> $data$dataflows[[158]]$name
#> [1] "National Economic Accounts (NEA), Quarterly Data"
#> 
#> $data$dataflows[[158]]$names
#> $data$dataflows[[158]]$names$en
#> [1] "National Economic Accounts (NEA), Quarterly Data"
#> 
#> 
#> $data$dataflows[[158]]$version
#> [1] "7.0.0"
#> 
#> $data$dataflows[[158]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[159]]
#> $data$dataflows[[159]]$annotations
#> list()
#> 
#> $data$dataflows[[159]]$id
#> [1] "PPI_2026_APR_VINTAGE"
#> 
#> $data$dataflows[[159]]$name
#> [1] "Producer Price Index (PPI) 2026 April"
#> 
#> $data$dataflows[[159]]$names
#> $data$dataflows[[159]]$names$en
#> [1] "Producer Price Index (PPI) 2026 April"
#> 
#> 
#> $data$dataflows[[159]]$version
#> [1] "1.0.0"
#> 
#> $data$dataflows[[159]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[160]]
#> $data$dataflows[[160]]$annotations
#> list()
#> 
#> $data$dataflows[[160]]$id
#> [1] "FAS"
#> 
#> $data$dataflows[[160]]$name
#> [1] "Financial Access Survey (FAS)"
#> 
#> $data$dataflows[[160]]$names
#> $data$dataflows[[160]]$names$en
#> [1] "Financial Access Survey (FAS)"
#> 
#> 
#> $data$dataflows[[160]]$version
#> [1] "5.0.0"
#> 
#> $data$dataflows[[160]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[161]]
#> $data$dataflows[[161]]$annotations
#> list()
#> 
#> $data$dataflows[[161]]$id
#> [1] "IIPCC_2026_FEB_VINTAGE"
#> 
#> $data$dataflows[[161]]$name
#> [1] "Currency Composition of the International Investment Position (IIPCC) 2026 February"
#> 
#> $data$dataflows[[161]]$names
#> $data$dataflows[[161]]$names$en
#> [1] "Currency Composition of the International Investment Position (IIPCC) 2026 February"
#> 
#> 
#> $data$dataflows[[161]]$version
#> [1] "1.0.0"
#> 
#> $data$dataflows[[161]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[162]]
#> $data$dataflows[[162]]$annotations
#> list()
#> 
#> $data$dataflows[[162]]$id
#> [1] "PPI_2026_FEB_VINTAGE"
#> 
#> $data$dataflows[[162]]$name
#> [1] "Producer Price Index (PPI) 2026 February"
#> 
#> $data$dataflows[[162]]$names
#> $data$dataflows[[162]]$names$en
#> [1] "Producer Price Index (PPI) 2026 February"
#> 
#> 
#> $data$dataflows[[162]]$version
#> [1] "1.0.0"
#> 
#> $data$dataflows[[162]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[163]]
#> $data$dataflows[[163]]$annotations
#> list()
#> 
#> $data$dataflows[[163]]$id
#> [1] "MFS_OFC_2026_MAY_VINTAGE"
#> 
#> $data$dataflows[[163]]$name
#> [1] "Monetary and Financial Statistics (MFS), Other Financial Corporations 2026 May"
#> 
#> $data$dataflows[[163]]$names
#> $data$dataflows[[163]]$names$en
#> [1] "Monetary and Financial Statistics (MFS), Other Financial Corporations 2026 May"
#> 
#> 
#> $data$dataflows[[163]]$version
#> [1] "1.0.0"
#> 
#> $data$dataflows[[163]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[164]]
#> $data$dataflows[[164]]$annotations
#> list()
#> 
#> $data$dataflows[[164]]$id
#> [1] "IRFCL"
#> 
#> $data$dataflows[[164]]$name
#> [1] "International Reserves and Foreign Currency Liquidity (IRFCL)"
#> 
#> $data$dataflows[[164]]$names
#> $data$dataflows[[164]]$names$en
#> [1] "International Reserves and Foreign Currency Liquidity (IRFCL)"
#> 
#> 
#> $data$dataflows[[164]]$version
#> [1] "11.0.0"
#> 
#> $data$dataflows[[164]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[165]]
#> $data$dataflows[[165]]$annotations
#> list()
#> 
#> $data$dataflows[[165]]$id
#> [1] "MFS_DC"
#> 
#> $data$dataflows[[165]]$name
#> [1] "Monetary and Financial Statistics (MFS), Depository Corporations"
#> 
#> $data$dataflows[[165]]$names
#> $data$dataflows[[165]]$names$en
#> [1] "Monetary and Financial Statistics (MFS), Depository Corporations"
#> 
#> 
#> $data$dataflows[[165]]$version
#> [1] "8.0.0"
#> 
#> $data$dataflows[[165]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[166]]
#> $data$dataflows[[166]]$annotations
#> list()
#> 
#> $data$dataflows[[166]]$id
#> [1] "SPE"
#> 
#> $data$dataflows[[166]]$name
#> [1] "Special Purpose Entities (SPEs)"
#> 
#> $data$dataflows[[166]]$names
#> $data$dataflows[[166]]$names$en
#> [1] "Special Purpose Entities (SPEs)"
#> 
#> 
#> $data$dataflows[[166]]$version
#> [1] "13.0.0"
#> 
#> $data$dataflows[[166]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[167]]
#> $data$dataflows[[167]]$annotations
#> list()
#> 
#> $data$dataflows[[167]]$id
#> [1] "SPE_2026_APR_VINTAGE"
#> 
#> $data$dataflows[[167]]$name
#> [1] "Special Purpose Entities (SPEs) 2026 April"
#> 
#> $data$dataflows[[167]]$names
#> $data$dataflows[[167]]$names$en
#> [1] "Special Purpose Entities (SPEs) 2026 April"
#> 
#> 
#> $data$dataflows[[167]]$version
#> [1] "1.0.0"
#> 
#> $data$dataflows[[167]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[168]]
#> $data$dataflows[[168]]$annotations
#> list()
#> 
#> $data$dataflows[[168]]$id
#> [1] "MFS_MA"
#> 
#> $data$dataflows[[168]]$name
#> [1] "Monetary and Financial Statistics (MFS), Monetary Aggregates"
#> 
#> $data$dataflows[[168]]$names
#> $data$dataflows[[168]]$names$en
#> [1] "Monetary and Financial Statistics (MFS), Monetary Aggregates"
#> 
#> 
#> $data$dataflows[[168]]$version
#> [1] "10.0.1"
#> 
#> $data$dataflows[[168]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[169]]
#> $data$dataflows[[169]]$annotations
#> list()
#> 
#> $data$dataflows[[169]]$id
#> [1] "MFS_OFC_2026_APR_VINTAGE"
#> 
#> $data$dataflows[[169]]$name
#> [1] "Monetary and Financial Statistics (MFS), Other Financial Corporations 2026 April"
#> 
#> $data$dataflows[[169]]$names
#> $data$dataflows[[169]]$names$en
#> [1] "Monetary and Financial Statistics (MFS), Other Financial Corporations 2026 April"
#> 
#> 
#> $data$dataflows[[169]]$version
#> [1] "1.0.0"
#> 
#> $data$dataflows[[169]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[170]]
#> $data$dataflows[[170]]$annotations
#> list()
#> 
#> $data$dataflows[[170]]$id
#> [1] "FA_2026_APR_VINTAGE"
#> 
#> $data$dataflows[[170]]$name
#> [1] "Fund Accounts (FA) 2026 April"
#> 
#> $data$dataflows[[170]]$names
#> $data$dataflows[[170]]$names$en
#> [1] "Fund Accounts (FA) 2026 April"
#> 
#> 
#> $data$dataflows[[170]]$version
#> [1] "1.0.0"
#> 
#> $data$dataflows[[170]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[171]]
#> $data$dataflows[[171]]$annotations
#> list()
#> 
#> $data$dataflows[[171]]$id
#> [1] "MFS_CBS_2026_MAY_VINTAGE"
#> 
#> $data$dataflows[[171]]$name
#> [1] "Monetary and Financial Statistics (MFS), Central Bank Data 2026 May"
#> 
#> $data$dataflows[[171]]$names
#> $data$dataflows[[171]]$names$en
#> [1] "Monetary and Financial Statistics (MFS), Central Bank Data 2026 May"
#> 
#> 
#> $data$dataflows[[171]]$version
#> [1] "1.0.0"
#> 
#> $data$dataflows[[171]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[172]]
#> $data$dataflows[[172]]$annotations
#> list()
#> 
#> $data$dataflows[[172]]$id
#> [1] "QGFS"
#> 
#> $data$dataflows[[172]]$name
#> [1] "Quarterly Government Finance Statistics (QGFS)"
#> 
#> $data$dataflows[[172]]$names
#> $data$dataflows[[172]]$names$en
#> [1] "Quarterly Government Finance Statistics (QGFS)"
#> 
#> 
#> $data$dataflows[[172]]$version
#> [1] "12.0.0"
#> 
#> $data$dataflows[[172]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[173]]
#> $data$dataflows[[173]]$annotations
#> list()
#> 
#> $data$dataflows[[173]]$id
#> [1] "SPE_2026_FEB_VINTAGE"
#> 
#> $data$dataflows[[173]]$name
#> [1] "Special Purpose Entities (SPEs) 2026 February"
#> 
#> $data$dataflows[[173]]$names
#> $data$dataflows[[173]]$names$en
#> [1] "Special Purpose Entities (SPEs) 2026 February"
#> 
#> 
#> $data$dataflows[[173]]$version
#> [1] "1.0.0"
#> 
#> $data$dataflows[[173]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[174]]
#> $data$dataflows[[174]]$annotations
#> list()
#> 
#> $data$dataflows[[174]]$id
#> [1] "QGDP_WCA"
#> 
#> $data$dataflows[[174]]$name
#> [1] "Quarterly Gross Domestic Product (GDP), World and Country Aggregates"
#> 
#> $data$dataflows[[174]]$names
#> $data$dataflows[[174]]$names$en
#> [1] "Quarterly Gross Domestic Product (GDP), World and Country Aggregates"
#> 
#> 
#> $data$dataflows[[174]]$version
#> [1] "4.0.0"
#> 
#> $data$dataflows[[174]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[175]]
#> $data$dataflows[[175]]$annotations
#> list()
#> 
#> $data$dataflows[[175]]$id
#> [1] "ITG_2026_JAN_VINTAGE"
#> 
#> $data$dataflows[[175]]$name
#> [1] "International Trade in Goods (ITG) 2026 January"
#> 
#> $data$dataflows[[175]]$names
#> $data$dataflows[[175]]$names$en
#> [1] "International Trade in Goods (ITG) 2026 January"
#> 
#> 
#> $data$dataflows[[175]]$version
#> [1] "1.0.0"
#> 
#> $data$dataflows[[175]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[176]]
#> $data$dataflows[[176]]$annotations
#> list()
#> 
#> $data$dataflows[[176]]$id
#> [1] "IIPCC"
#> 
#> $data$dataflows[[176]]$name
#> [1] "Currency Composition of the International Investment Position (IIPCC)"
#> 
#> $data$dataflows[[176]]$names
#> $data$dataflows[[176]]$names$en
#> [1] "Currency Composition of the International Investment Position (IIPCC)"
#> 
#> 
#> $data$dataflows[[176]]$version
#> [1] "13.0.0"
#> 
#> $data$dataflows[[176]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[177]]
#> $data$dataflows[[177]]$annotations
#> list()
#> 
#> $data$dataflows[[177]]$id
#> [1] "FSIBSIS"
#> 
#> $data$dataflows[[177]]$name
#> [1] "Financial Soundness Indicators (FSI), Balance Sheet, Income Statement and Memorandum Series"
#> 
#> $data$dataflows[[177]]$names
#> $data$dataflows[[177]]$names$en
#> [1] "Financial Soundness Indicators (FSI), Balance Sheet, Income Statement and Memorandum Series"
#> 
#> 
#> $data$dataflows[[177]]$version
#> [1] "18.0.0"
#> 
#> $data$dataflows[[177]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[178]]
#> $data$dataflows[[178]]$annotations
#> list()
#> 
#> $data$dataflows[[178]]$id
#> [1] "CPI_WCA_2026_JAN_VINTAGE"
#> 
#> $data$dataflows[[178]]$name
#> [1] "Consumer Price Index (CPI), World and Country Aggregates (CPI_WCA) 2026 January"
#> 
#> $data$dataflows[[178]]$names
#> $data$dataflows[[178]]$names$en
#> [1] "Consumer Price Index (CPI), World and Country Aggregates (CPI_WCA) 2026 January"
#> 
#> 
#> $data$dataflows[[178]]$version
#> [1] "1.0.0"
#> 
#> $data$dataflows[[178]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[179]]
#> $data$dataflows[[179]]$annotations
#> list()
#> 
#> $data$dataflows[[179]]$id
#> [1] "FA_2026_MAY_VINTAGE"
#> 
#> $data$dataflows[[179]]$name
#> [1] "Fund Accounts (FA) 2026 May"
#> 
#> $data$dataflows[[179]]$names
#> $data$dataflows[[179]]$names$en
#> [1] "Fund Accounts (FA) 2026 May"
#> 
#> 
#> $data$dataflows[[179]]$version
#> [1] "1.0.0"
#> 
#> $data$dataflows[[179]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[180]]
#> $data$dataflows[[180]]$annotations
#> list()
#> 
#> $data$dataflows[[180]]$id
#> [1] "CCI"
#> 
#> $data$dataflows[[180]]$name
#> [1] "Climate Change Indicators"
#> 
#> $data$dataflows[[180]]$names
#> $data$dataflows[[180]]$names$en
#> [1] "Climate Change Indicators"
#> 
#> 
#> $data$dataflows[[180]]$version
#> [1] "4.0.1"
#> 
#> $data$dataflows[[180]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[181]]
#> $data$dataflows[[181]]$annotations
#> list()
#> 
#> $data$dataflows[[181]]$id
#> [1] "QNEA_2026_FEB_VINTAGE"
#> 
#> $data$dataflows[[181]]$name
#> [1] "National Economic Accounts (NEA), Quarterly Data 2026 February"
#> 
#> $data$dataflows[[181]]$names
#> $data$dataflows[[181]]$names$en
#> [1] "National Economic Accounts (NEA), Quarterly Data 2026 February"
#> 
#> 
#> $data$dataflows[[181]]$version
#> [1] "1.0.0"
#> 
#> $data$dataflows[[181]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[182]]
#> $data$dataflows[[182]]$annotations
#> list()
#> 
#> $data$dataflows[[182]]$id
#> [1] "NA_MAIN"
#> 
#> $data$dataflows[[182]]$name
#> [1] "National Accounts Main Aggregates (SDMX)"
#> 
#> $data$dataflows[[182]]$names
#> $data$dataflows[[182]]$names$en
#> [1] "National Accounts Main Aggregates (SDMX)"
#> 
#> 
#> $data$dataflows[[182]]$version
#> [1] "1.0.0"
#> 
#> $data$dataflows[[182]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[183]]
#> $data$dataflows[[183]]$annotations
#> list()
#> 
#> $data$dataflows[[183]]$id
#> [1] "MFS_ODC_2026_FEB_VINTAGE"
#> 
#> $data$dataflows[[183]]$name
#> [1] "Monetary and Financial Statistics (MFS), Other Depository Corporations 2026 February"
#> 
#> $data$dataflows[[183]]$names
#> $data$dataflows[[183]]$names$en
#> [1] "Monetary and Financial Statistics (MFS), Other Depository Corporations 2026 February"
#> 
#> 
#> $data$dataflows[[183]]$version
#> [1] "1.0.0"
#> 
#> $data$dataflows[[183]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[184]]
#> $data$dataflows[[184]]$annotations
#> list()
#> 
#> $data$dataflows[[184]]$id
#> [1] "GS_CGI"
#> 
#> $data$dataflows[[184]]$name
#> [1] "Gender Statistics (GS) Composite Gender Indices (CGI)"
#> 
#> $data$dataflows[[184]]$names
#> $data$dataflows[[184]]$names$en
#> [1] "Gender Statistics (GS) Composite Gender Indices (CGI)"
#> 
#> 
#> $data$dataflows[[184]]$version
#> [1] "3.0.0"
#> 
#> $data$dataflows[[184]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[185]]
#> $data$dataflows[[185]]$annotations
#> list()
#> 
#> $data$dataflows[[185]]$id
#> [1] "PPI_2026_MAY_VINTAGE"
#> 
#> $data$dataflows[[185]]$name
#> [1] "Producer Price Index (PPI) 2026 May"
#> 
#> $data$dataflows[[185]]$names
#> $data$dataflows[[185]]$names$en
#> [1] "Producer Price Index (PPI) 2026 May"
#> 
#> 
#> $data$dataflows[[185]]$version
#> [1] "1.0.0"
#> 
#> $data$dataflows[[185]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[186]]
#> $data$dataflows[[186]]$annotations
#> list()
#> 
#> $data$dataflows[[186]]$id
#> [1] "GS_ED"
#> 
#> $data$dataflows[[186]]$name
#> [1] "Gender Statistics (GS) Education"
#> 
#> $data$dataflows[[186]]$names
#> $data$dataflows[[186]]$names$en
#> [1] "Gender Statistics (GS) Education"
#> 
#> 
#> $data$dataflows[[186]]$version
#> [1] "3.0.0"
#> 
#> $data$dataflows[[186]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[187]]
#> $data$dataflows[[187]]$annotations
#> list()
#> 
#> $data$dataflows[[187]]$id
#> [1] "CPI_2026_JAN_VINTAGE"
#> 
#> $data$dataflows[[187]]$name
#> [1] "Consumer Price Index (CPI) 2026 January"
#> 
#> $data$dataflows[[187]]$names
#> $data$dataflows[[187]]$names$en
#> [1] "Consumer Price Index (CPI) 2026 January"
#> 
#> 
#> $data$dataflows[[187]]$version
#> [1] "1.0.0"
#> 
#> $data$dataflows[[187]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[188]]
#> $data$dataflows[[188]]$annotations
#> list()
#> 
#> $data$dataflows[[188]]$id
#> [1] "MFS_FMP"
#> 
#> $data$dataflows[[188]]$name
#> [1] "Monetary and Financial Statistics (MFS): Financial Market Prices"
#> 
#> $data$dataflows[[188]]$names
#> $data$dataflows[[188]]$names$en
#> [1] "Monetary and Financial Statistics (MFS): Financial Market Prices"
#> 
#> 
#> $data$dataflows[[188]]$version
#> [1] "3.0.0"
#> 
#> $data$dataflows[[188]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[189]]
#> $data$dataflows[[189]]$annotations
#> list()
#> 
#> $data$dataflows[[189]]$id
#> [1] "PI_2026_JAN_VINTAGE"
#> 
#> $data$dataflows[[189]]$name
#> [1] "Production Indexes (PI) 2026 January"
#> 
#> $data$dataflows[[189]]$names
#> $data$dataflows[[189]]$names$en
#> [1] "Production Indexes (PI) 2026 January"
#> 
#> 
#> $data$dataflows[[189]]$version
#> [1] "1.0.0"
#> 
#> $data$dataflows[[189]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[190]]
#> $data$dataflows[[190]]$annotations
#> list()
#> 
#> $data$dataflows[[190]]$id
#> [1] "IIP"
#> 
#> $data$dataflows[[190]]$name
#> [1] "International Investment Position (IIP)"
#> 
#> $data$dataflows[[190]]$names
#> $data$dataflows[[190]]$names$en
#> [1] "International Investment Position (IIP)"
#> 
#> 
#> $data$dataflows[[190]]$version
#> [1] "13.0.0"
#> 
#> $data$dataflows[[190]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> $data$dataflows[[191]]
#> $data$dataflows[[191]]$annotations
#> list()
#> 
#> $data$dataflows[[191]]$id
#> [1] "MFS_OFC_2026_JAN_VINTAGE"
#> 
#> $data$dataflows[[191]]$name
#> [1] "Monetary and Financial Statistics (MFS), Other Financial Corporations 2026 January"
#> 
#> $data$dataflows[[191]]$names
#> $data$dataflows[[191]]$names$en
#> [1] "Monetary and Financial Statistics (MFS), Other Financial Corporations 2026 January"
#> 
#> 
#> $data$dataflows[[191]]$version
#> [1] "1.0.0"
#> 
#> $data$dataflows[[191]]$agencyID
#> [1] "IMF.STA"
#> 
#> 
#> 
#> 
#> $meta
#> $meta$schema
#> [1] "https://raw.githubusercontent.com/sdmx-twg/sdmx-json/master/metadata-message/tools/schemas/2.0.0/sdmx-json-metadata-schema.json"
#> 
#> $meta$id
#> [1] "IDREF8788"
#> 
#> $meta$test
#> [1] FALSE
#> 
#> $meta$prepared
#> [1] "2026-06-17T06:50:29.111265940Z"
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
sdmx_structure("codelist", "IMF", "CL_FREQ")
#> $data
#> $data$codelists
#> $data$codelists[[1]]
#> $data$codelists[[1]]$annotations
#> $data$codelists[[1]]$annotations[[1]]
#> $data$codelists[[1]]$annotations[[1]]$id
#> [1] "origin"
#> 
#> $data$codelists[[1]]$annotations[[1]]$value
#> [1] "INTEGRATION"
#> 
#> 
#> $data$codelists[[1]]$annotations[[2]]
#> $data$codelists[[1]]$annotations[[2]]$id
#> [1] "isFinal"
#> 
#> 
#> $data$codelists[[1]]$annotations[[3]]
#> $data$codelists[[1]]$annotations[[3]]$id
#> [1] "lastUpdatedAt"
#> 
#> $data$codelists[[1]]$annotations[[3]]$value
#> [1] "2026-03-02T23:15:42.880372Z"
#> 
#> 
#> 
#> $data$codelists[[1]]$id
#> [1] "CL_FREQ"
#> 
#> $data$codelists[[1]]$name
#> [1] "Frequency"
#> 
#> $data$codelists[[1]]$names
#> $data$codelists[[1]]$names$en
#> [1] "Frequency"
#> 
#> 
#> $data$codelists[[1]]$description
#> [1] "This code list provides a set of values indicating the \"frequency\" of the data (e.g. weekly, monthly, quarterly). The concept “frequency” may refer to various stages in the production process, e.g. data collection or data dissemination. For example, a time series could be disseminated at annual frequency but the underlying data are compiled monthly. The code list is applicable for all different uses of \"frequency\". This code list was formally adopted on 4 December 2013. More information about and supporting material for this code list and SDMX code lists in general (e.g. list of generic codes for expressing general concepts like \"Total\", \"Unknown\", etc.; syntaxes for the creation of further codes; general guidelines for the creation of SDMX code lists) can be found at this address: https://sdmx.org/?page_id=4345."
#> 
#> $data$codelists[[1]]$descriptions
#> $data$codelists[[1]]$descriptions$en
#> [1] "This code list provides a set of values indicating the \"frequency\" of the data (e.g. weekly, monthly, quarterly). The concept “frequency” may refer to various stages in the production process, e.g. data collection or data dissemination. For example, a time series could be disseminated at annual frequency but the underlying data are compiled monthly. The code list is applicable for all different uses of \"frequency\". This code list was formally adopted on 4 December 2013. More information about and supporting material for this code list and SDMX code lists in general (e.g. list of generic codes for expressing general concepts like \"Total\", \"Unknown\", etc.; syntaxes for the creation of further codes; general guidelines for the creation of SDMX code lists) can be found at this address: https://sdmx.org/?page_id=4345."
#> 
#> 
#> $data$codelists[[1]]$version
#> [1] "1.2.0"
#> 
#> $data$codelists[[1]]$agencyID
#> [1] "IMF"
#> 
#> $data$codelists[[1]]$isPartial
#> [1] FALSE
#> 
#> $data$codelists[[1]]$codes
#> $data$codelists[[1]]$codes[[1]]
#> $data$codelists[[1]]$codes[[1]]$annotations
#> list()
#> 
#> $data$codelists[[1]]$codes[[1]]$id
#> [1] "A"
#> 
#> $data$codelists[[1]]$codes[[1]]$name
#> [1] "Annual"
#> 
#> $data$codelists[[1]]$codes[[1]]$names
#> $data$codelists[[1]]$codes[[1]]$names$en
#> [1] "Annual"
#> 
#> $data$codelists[[1]]$codes[[1]]$names$ar
#> [1] "سنوية"
#> 
#> $data$codelists[[1]]$codes[[1]]$names$ru
#> [1] "Годовые"
#> 
#> $data$codelists[[1]]$codes[[1]]$names$pt
#> [1] "Anual"
#> 
#> $data$codelists[[1]]$codes[[1]]$names$ja
#> [1] "年次"
#> 
#> $data$codelists[[1]]$codes[[1]]$names$fr
#> [1] "Annuel"
#> 
#> $data$codelists[[1]]$codes[[1]]$names$es
#> [1] "Anual"
#> 
#> $data$codelists[[1]]$codes[[1]]$names$zh
#> [1] "每年"
#> 
#> 
#> $data$codelists[[1]]$codes[[1]]$description
#> [1] "To be used for data collected or disseminated every year."
#> 
#> $data$codelists[[1]]$codes[[1]]$descriptions
#> $data$codelists[[1]]$codes[[1]]$descriptions$en
#> [1] "To be used for data collected or disseminated every year."
#> 
#> $data$codelists[[1]]$codes[[1]]$descriptions$ar
#> [1] "تُستخدم لتوصيف البيانات التي يتم جمعها أو نشرها على أساس سنوي."
#> 
#> $data$codelists[[1]]$codes[[1]]$descriptions$ru
#> [1] "Используется для данных, собираемых или распространяемых каждый год."
#> 
#> $data$codelists[[1]]$codes[[1]]$descriptions$pt
#> [1] "Utilizado para dados compilados ou divulgados anualmente."
#> 
#> $data$codelists[[1]]$codes[[1]]$descriptions$ja
#> [1] "毎年収集または公表されるデータに使用。"
#> 
#> $data$codelists[[1]]$codes[[1]]$descriptions$fr
#> [1] "À utiliser pour les données recueillies ou diffusées chaque année."
#> 
#> $data$codelists[[1]]$codes[[1]]$descriptions$es
#> [1] "Se usa para datos recopilados o divulgados cada año."
#> 
#> $data$codelists[[1]]$codes[[1]]$descriptions$zh
#> [1] "用于每年收集或发布的数据。"
#> 
#> 
#> 
#> $data$codelists[[1]]$codes[[2]]
#> $data$codelists[[1]]$codes[[2]]$annotations
#> list()
#> 
#> $data$codelists[[1]]$codes[[2]]$id
#> [1] "D"
#> 
#> $data$codelists[[1]]$codes[[2]]$name
#> [1] "Daily"
#> 
#> $data$codelists[[1]]$codes[[2]]$names
#> $data$codelists[[1]]$codes[[2]]$names$en
#> [1] "Daily"
#> 
#> $data$codelists[[1]]$codes[[2]]$names$ar
#> [1] "يومية"
#> 
#> $data$codelists[[1]]$codes[[2]]$names$ru
#> [1] "Ежедневные"
#> 
#> $data$codelists[[1]]$codes[[2]]$names$pt
#> [1] "Diário"
#> 
#> $data$codelists[[1]]$codes[[2]]$names$ja
#> [1] "日次"
#> 
#> $data$codelists[[1]]$codes[[2]]$names$fr
#> [1] "Quotidien"
#> 
#> $data$codelists[[1]]$codes[[2]]$names$es
#> [1] "Diaria"
#> 
#> $data$codelists[[1]]$codes[[2]]$names$zh
#> [1] "每日"
#> 
#> 
#> $data$codelists[[1]]$codes[[2]]$description
#> [1] "To be used for data collected or disseminated every day."
#> 
#> $data$codelists[[1]]$codes[[2]]$descriptions
#> $data$codelists[[1]]$codes[[2]]$descriptions$en
#> [1] "To be used for data collected or disseminated every day."
#> 
#> $data$codelists[[1]]$codes[[2]]$descriptions$ar
#> [1] "تُستخدم لتوصيف البيانات التي يتم جمعها أو نشرها على أساس يومي."
#> 
#> $data$codelists[[1]]$codes[[2]]$descriptions$ru
#> [1] "Используется для данных, собираемых или распространяемых каждый день."
#> 
#> $data$codelists[[1]]$codes[[2]]$descriptions$pt
#> [1] "Utilizado para dados compilados ou divulgados diariamente."
#> 
#> $data$codelists[[1]]$codes[[2]]$descriptions$ja
#> [1] "毎日収集または公表されるデータに使用。"
#> 
#> $data$codelists[[1]]$codes[[2]]$descriptions$fr
#> [1] "À utiliser pour les données recueillies ou diffusées chaque jour."
#> 
#> $data$codelists[[1]]$codes[[2]]$descriptions$es
#> [1] "Se usa para datos recopilados o divulgados cada día."
#> 
#> $data$codelists[[1]]$codes[[2]]$descriptions$zh
#> [1] "用于每天收集或发布的数据。"
#> 
#> 
#> 
#> $data$codelists[[1]]$codes[[3]]
#> $data$codelists[[1]]$codes[[3]]$annotations
#> list()
#> 
#> $data$codelists[[1]]$codes[[3]]$id
#> [1] "M"
#> 
#> $data$codelists[[1]]$codes[[3]]$name
#> [1] "Monthly"
#> 
#> $data$codelists[[1]]$codes[[3]]$names
#> $data$codelists[[1]]$codes[[3]]$names$en
#> [1] "Monthly"
#> 
#> $data$codelists[[1]]$codes[[3]]$names$ar
#> [1] "شهرية"
#> 
#> $data$codelists[[1]]$codes[[3]]$names$ru
#> [1] "Месячные"
#> 
#> $data$codelists[[1]]$codes[[3]]$names$pt
#> [1] "Mensal"
#> 
#> $data$codelists[[1]]$codes[[3]]$names$ja
#> [1] "月次"
#> 
#> $data$codelists[[1]]$codes[[3]]$names$fr
#> [1] "Mensuel"
#> 
#> $data$codelists[[1]]$codes[[3]]$names$es
#> [1] "Mensual"
#> 
#> $data$codelists[[1]]$codes[[3]]$names$zh
#> [1] "每月"
#> 
#> 
#> $data$codelists[[1]]$codes[[3]]$description
#> [1] "To be used for data collected or disseminated every month."
#> 
#> $data$codelists[[1]]$codes[[3]]$descriptions
#> $data$codelists[[1]]$codes[[3]]$descriptions$en
#> [1] "To be used for data collected or disseminated every month."
#> 
#> $data$codelists[[1]]$codes[[3]]$descriptions$ar
#> [1] "تُستخدم لتوصيف البيانات التي يتم جمعها أو نشرها على أساس شهري."
#> 
#> $data$codelists[[1]]$codes[[3]]$descriptions$ru
#> [1] "Используется для данных, собираемых или распространяемых каждый месяц."
#> 
#> $data$codelists[[1]]$codes[[3]]$descriptions$pt
#> [1] "Utilizado para dados compilados ou divulgados mensalmente."
#> 
#> $data$codelists[[1]]$codes[[3]]$descriptions$ja
#> [1] "毎月収集または公表されるデータに使用。"
#> 
#> $data$codelists[[1]]$codes[[3]]$descriptions$fr
#> [1] "À utiliser pour les données recueillies ou diffusées chaque mois."
#> 
#> $data$codelists[[1]]$codes[[3]]$descriptions$es
#> [1] "Se usa para datos recopilados o divulgados cada mes."
#> 
#> $data$codelists[[1]]$codes[[3]]$descriptions$zh
#> [1] "用于每月收集或发布的数据。"
#> 
#> 
#> 
#> $data$codelists[[1]]$codes[[4]]
#> $data$codelists[[1]]$codes[[4]]$annotations
#> list()
#> 
#> $data$codelists[[1]]$codes[[4]]$id
#> [1] "Q"
#> 
#> $data$codelists[[1]]$codes[[4]]$name
#> [1] "Quarterly"
#> 
#> $data$codelists[[1]]$codes[[4]]$names
#> $data$codelists[[1]]$codes[[4]]$names$en
#> [1] "Quarterly"
#> 
#> $data$codelists[[1]]$codes[[4]]$names$ar
#> [1] "ربع سنوية"
#> 
#> $data$codelists[[1]]$codes[[4]]$names$ru
#> [1] "Квартальные"
#> 
#> $data$codelists[[1]]$codes[[4]]$names$pt
#> [1] "Trimestral"
#> 
#> $data$codelists[[1]]$codes[[4]]$names$ja
#> [1] "四半期"
#> 
#> $data$codelists[[1]]$codes[[4]]$names$fr
#> [1] "Trimestriel"
#> 
#> $data$codelists[[1]]$codes[[4]]$names$es
#> [1] "Trimestral"
#> 
#> $data$codelists[[1]]$codes[[4]]$names$zh
#> [1] "每季度"
#> 
#> 
#> $data$codelists[[1]]$codes[[4]]$description
#> [1] "To be used for data collected or disseminated every quarter."
#> 
#> $data$codelists[[1]]$codes[[4]]$descriptions
#> $data$codelists[[1]]$codes[[4]]$descriptions$en
#> [1] "To be used for data collected or disseminated every quarter."
#> 
#> $data$codelists[[1]]$codes[[4]]$descriptions$ar
#> [1] "تُستخدم لتوصيف البيانات التي يتم جمعها أو نشرها على أساس ربع سنوي."
#> 
#> $data$codelists[[1]]$codes[[4]]$descriptions$ru
#> [1] "Используется для данных, собираемых или распространяемых каждый квартал."
#> 
#> $data$codelists[[1]]$codes[[4]]$descriptions$pt
#> [1] "Utilizado para dados compilados ou divulgados trimestralmente."
#> 
#> $data$codelists[[1]]$codes[[4]]$descriptions$ja
#> [1] "四半期ごとに収集または公表されるデータに使用。"
#> 
#> $data$codelists[[1]]$codes[[4]]$descriptions$fr
#> [1] "À utiliser pour les données recueillies ou diffusées chaque trimestre."
#> 
#> $data$codelists[[1]]$codes[[4]]$descriptions$es
#> [1] "Se usa para datos recopilados o divulgados cada trimestre."
#> 
#> $data$codelists[[1]]$codes[[4]]$descriptions$zh
#> [1] "用于每季度收集或发布的数据。"
#> 
#> 
#> 
#> $data$codelists[[1]]$codes[[5]]
#> $data$codelists[[1]]$codes[[5]]$annotations
#> list()
#> 
#> $data$codelists[[1]]$codes[[5]]$id
#> [1] "S"
#> 
#> $data$codelists[[1]]$codes[[5]]$name
#> [1] "Half-yearly, semester"
#> 
#> $data$codelists[[1]]$codes[[5]]$names
#> $data$codelists[[1]]$codes[[5]]$names$en
#> [1] "Half-yearly, semester"
#> 
#> $data$codelists[[1]]$codes[[5]]$names$ar
#> [1] "نصف سنوية"
#> 
#> $data$codelists[[1]]$codes[[5]]$names$ru
#> [1] "Полугодовые, шестимесячные"
#> 
#> $data$codelists[[1]]$codes[[5]]$names$pt
#> [1] "Semestral"
#> 
#> $data$codelists[[1]]$codes[[5]]$names$ja
#> [1] "半期"
#> 
#> $data$codelists[[1]]$codes[[5]]$names$fr
#> [1] "Semestriel"
#> 
#> $data$codelists[[1]]$codes[[5]]$names$es
#> [1] "Semestral"
#> 
#> $data$codelists[[1]]$codes[[5]]$names$zh
#> [1] "每半年"
#> 
#> 
#> $data$codelists[[1]]$codes[[5]]$description
#> [1] "To be used for data collected or disseminated every semester."
#> 
#> $data$codelists[[1]]$codes[[5]]$descriptions
#> $data$codelists[[1]]$codes[[5]]$descriptions$en
#> [1] "To be used for data collected or disseminated every semester."
#> 
#> $data$codelists[[1]]$codes[[5]]$descriptions$ar
#> [1] "تُستخدم لتوصيف البيانات التي يتم جمعها أو نشرها على أساس نصف سنوي."
#> 
#> $data$codelists[[1]]$codes[[5]]$descriptions$ru
#> [1] "Используется для данных, собираемых или распространяемых каждые шесть месяцев."
#> 
#> $data$codelists[[1]]$codes[[5]]$descriptions$pt
#> [1] "Utilizado para dados compilados ou divulgados semestralmente."
#> 
#> $data$codelists[[1]]$codes[[5]]$descriptions$ja
#> [1] "半期ごとに収集または公表されるデータに使用。"
#> 
#> $data$codelists[[1]]$codes[[5]]$descriptions$fr
#> [1] "À utiliser pour les données recueillies ou diffusées chaque semestre."
#> 
#> $data$codelists[[1]]$codes[[5]]$descriptions$es
#> [1] "Se usa para datos recopilados o divulgados cada semestre."
#> 
#> $data$codelists[[1]]$codes[[5]]$descriptions$zh
#> [1] "用于每半年收集或发布的数据。"
#> 
#> 
#> 
#> $data$codelists[[1]]$codes[[6]]
#> $data$codelists[[1]]$codes[[6]]$annotations
#> list()
#> 
#> $data$codelists[[1]]$codes[[6]]$id
#> [1] "W"
#> 
#> $data$codelists[[1]]$codes[[6]]$name
#> [1] "Weekly"
#> 
#> $data$codelists[[1]]$codes[[6]]$names
#> $data$codelists[[1]]$codes[[6]]$names$en
#> [1] "Weekly"
#> 
#> $data$codelists[[1]]$codes[[6]]$names$ar
#> [1] "أسبوعية"
#> 
#> $data$codelists[[1]]$codes[[6]]$names$ru
#> [1] "Недельные"
#> 
#> $data$codelists[[1]]$codes[[6]]$names$pt
#> [1] "Semanal"
#> 
#> $data$codelists[[1]]$codes[[6]]$names$ja
#> [1] "週次"
#> 
#> $data$codelists[[1]]$codes[[6]]$names$fr
#> [1] "Hebdomadaire"
#> 
#> $data$codelists[[1]]$codes[[6]]$names$es
#> [1] "Semanal"
#> 
#> $data$codelists[[1]]$codes[[6]]$names$zh
#> [1] "每周"
#> 
#> 
#> $data$codelists[[1]]$codes[[6]]$description
#> [1] "To be used for data collected or disseminated every week."
#> 
#> $data$codelists[[1]]$codes[[6]]$descriptions
#> $data$codelists[[1]]$codes[[6]]$descriptions$en
#> [1] "To be used for data collected or disseminated every week."
#> 
#> $data$codelists[[1]]$codes[[6]]$descriptions$ar
#> [1] "تُستخدم لتوصيف البيانات التي يتم جمعها أو نشرها على أساس أسبوعي."
#> 
#> $data$codelists[[1]]$codes[[6]]$descriptions$ru
#> [1] "Используется для данных, собираемых или распространяемых каждую неделю."
#> 
#> $data$codelists[[1]]$codes[[6]]$descriptions$pt
#> [1] "Utilizado para dados compilados ou divulgados semanalmente."
#> 
#> $data$codelists[[1]]$codes[[6]]$descriptions$ja
#> [1] "毎週収集または公表されるデータに使用。"
#> 
#> $data$codelists[[1]]$codes[[6]]$descriptions$fr
#> [1] "À utiliser pour les données recueillies ou diffusées chaque semaine."
#> 
#> $data$codelists[[1]]$codes[[6]]$descriptions$es
#> [1] "Se usa para datos recopilados o divulgados cada semana."
#> 
#> $data$codelists[[1]]$codes[[6]]$descriptions$zh
#> [1] "用于每周收集或发布的数据。"
#> 
#> 
#> 
#> $data$codelists[[1]]$codes[[7]]
#> $data$codelists[[1]]$codes[[7]]$annotations
#> list()
#> 
#> $data$codelists[[1]]$codes[[7]]$id
#> [1] "A2"
#> 
#> $data$codelists[[1]]$codes[[7]]$name
#> [1] "Biennial"
#> 
#> $data$codelists[[1]]$codes[[7]]$names
#> $data$codelists[[1]]$codes[[7]]$names$en
#> [1] "Biennial"
#> 
#> 
#> $data$codelists[[1]]$codes[[7]]$description
#> [1] "To be used for data collected or disseminated every two years."
#> 
#> $data$codelists[[1]]$codes[[7]]$descriptions
#> $data$codelists[[1]]$codes[[7]]$descriptions$en
#> [1] "To be used for data collected or disseminated every two years."
#> 
#> 
#> 
#> $data$codelists[[1]]$codes[[8]]
#> $data$codelists[[1]]$codes[[8]]$annotations
#> list()
#> 
#> $data$codelists[[1]]$codes[[8]]$id
#> [1] "A3"
#> 
#> $data$codelists[[1]]$codes[[8]]$name
#> [1] "Triennial"
#> 
#> $data$codelists[[1]]$codes[[8]]$names
#> $data$codelists[[1]]$codes[[8]]$names$en
#> [1] "Triennial"
#> 
#> 
#> $data$codelists[[1]]$codes[[8]]$description
#> [1] "To be used for data collected or disseminated every three years."
#> 
#> $data$codelists[[1]]$codes[[8]]$descriptions
#> $data$codelists[[1]]$codes[[8]]$descriptions$en
#> [1] "To be used for data collected or disseminated every three years."
#> 
#> 
#> 
#> $data$codelists[[1]]$codes[[9]]
#> $data$codelists[[1]]$codes[[9]]$annotations
#> list()
#> 
#> $data$codelists[[1]]$codes[[9]]$id
#> [1] "A4"
#> 
#> $data$codelists[[1]]$codes[[9]]$name
#> [1] "Quadrennial"
#> 
#> $data$codelists[[1]]$codes[[9]]$names
#> $data$codelists[[1]]$codes[[9]]$names$en
#> [1] "Quadrennial"
#> 
#> 
#> $data$codelists[[1]]$codes[[9]]$description
#> [1] "To be used for data collected or disseminated every four years."
#> 
#> $data$codelists[[1]]$codes[[9]]$descriptions
#> $data$codelists[[1]]$codes[[9]]$descriptions$en
#> [1] "To be used for data collected or disseminated every four years."
#> 
#> 
#> 
#> $data$codelists[[1]]$codes[[10]]
#> $data$codelists[[1]]$codes[[10]]$annotations
#> list()
#> 
#> $data$codelists[[1]]$codes[[10]]$id
#> [1] "A5"
#> 
#> $data$codelists[[1]]$codes[[10]]$name
#> [1] "Quinquennial"
#> 
#> $data$codelists[[1]]$codes[[10]]$names
#> $data$codelists[[1]]$codes[[10]]$names$en
#> [1] "Quinquennial"
#> 
#> 
#> $data$codelists[[1]]$codes[[10]]$description
#> [1] "To be used for data collected or disseminated every five years."
#> 
#> $data$codelists[[1]]$codes[[10]]$descriptions
#> $data$codelists[[1]]$codes[[10]]$descriptions$en
#> [1] "To be used for data collected or disseminated every five years."
#> 
#> 
#> 
#> $data$codelists[[1]]$codes[[11]]
#> $data$codelists[[1]]$codes[[11]]$annotations
#> list()
#> 
#> $data$codelists[[1]]$codes[[11]]$id
#> [1] "A10"
#> 
#> $data$codelists[[1]]$codes[[11]]$name
#> [1] "Decennial"
#> 
#> $data$codelists[[1]]$codes[[11]]$names
#> $data$codelists[[1]]$codes[[11]]$names$en
#> [1] "Decennial"
#> 
#> 
#> $data$codelists[[1]]$codes[[11]]$description
#> [1] "To be used for data collected or disseminated every ten years."
#> 
#> $data$codelists[[1]]$codes[[11]]$descriptions
#> $data$codelists[[1]]$codes[[11]]$descriptions$en
#> [1] "To be used for data collected or disseminated every ten years."
#> 
#> 
#> 
#> $data$codelists[[1]]$codes[[12]]
#> $data$codelists[[1]]$codes[[12]]$annotations
#> list()
#> 
#> $data$codelists[[1]]$codes[[12]]$id
#> [1] "A20"
#> 
#> $data$codelists[[1]]$codes[[12]]$name
#> [1] "Bidecennial"
#> 
#> $data$codelists[[1]]$codes[[12]]$names
#> $data$codelists[[1]]$codes[[12]]$names$en
#> [1] "Bidecennial"
#> 
#> 
#> $data$codelists[[1]]$codes[[12]]$description
#> [1] "To be used for data collected or disseminated every twenty years."
#> 
#> $data$codelists[[1]]$codes[[12]]$descriptions
#> $data$codelists[[1]]$codes[[12]]$descriptions$en
#> [1] "To be used for data collected or disseminated every twenty years."
#> 
#> 
#> 
#> $data$codelists[[1]]$codes[[13]]
#> $data$codelists[[1]]$codes[[13]]$annotations
#> list()
#> 
#> $data$codelists[[1]]$codes[[13]]$id
#> [1] "A30"
#> 
#> $data$codelists[[1]]$codes[[13]]$name
#> [1] "Tridecennial"
#> 
#> $data$codelists[[1]]$codes[[13]]$names
#> $data$codelists[[1]]$codes[[13]]$names$en
#> [1] "Tridecennial"
#> 
#> 
#> $data$codelists[[1]]$codes[[13]]$description
#> [1] "To be used for data collected or disseminated every thirty years."
#> 
#> $data$codelists[[1]]$codes[[13]]$descriptions
#> $data$codelists[[1]]$codes[[13]]$descriptions$en
#> [1] "To be used for data collected or disseminated every thirty years."
#> 
#> 
#> 
#> $data$codelists[[1]]$codes[[14]]
#> $data$codelists[[1]]$codes[[14]]$annotations
#> list()
#> 
#> $data$codelists[[1]]$codes[[14]]$id
#> [1] "A_3"
#> 
#> $data$codelists[[1]]$codes[[14]]$name
#> [1] "Three times a year"
#> 
#> $data$codelists[[1]]$codes[[14]]$names
#> $data$codelists[[1]]$codes[[14]]$names$en
#> [1] "Three times a year"
#> 
#> 
#> $data$codelists[[1]]$codes[[14]]$description
#> [1] "To be used for data collected or disseminated three times a year."
#> 
#> $data$codelists[[1]]$codes[[14]]$descriptions
#> $data$codelists[[1]]$codes[[14]]$descriptions$en
#> [1] "To be used for data collected or disseminated three times a year."
#> 
#> 
#> 
#> $data$codelists[[1]]$codes[[15]]
#> $data$codelists[[1]]$codes[[15]]$annotations
#> list()
#> 
#> $data$codelists[[1]]$codes[[15]]$id
#> [1] "M2"
#> 
#> $data$codelists[[1]]$codes[[15]]$name
#> [1] "Bimonthly"
#> 
#> $data$codelists[[1]]$codes[[15]]$names
#> $data$codelists[[1]]$codes[[15]]$names$en
#> [1] "Bimonthly"
#> 
#> 
#> $data$codelists[[1]]$codes[[15]]$description
#> [1] "To be used for data collected or disseminated every two months."
#> 
#> $data$codelists[[1]]$codes[[15]]$descriptions
#> $data$codelists[[1]]$codes[[15]]$descriptions$en
#> [1] "To be used for data collected or disseminated every two months."
#> 
#> 
#> 
#> $data$codelists[[1]]$codes[[16]]
#> $data$codelists[[1]]$codes[[16]]$annotations
#> list()
#> 
#> $data$codelists[[1]]$codes[[16]]$id
#> [1] "M_2"
#> 
#> $data$codelists[[1]]$codes[[16]]$name
#> [1] "Semimonthly"
#> 
#> $data$codelists[[1]]$codes[[16]]$names
#> $data$codelists[[1]]$codes[[16]]$names$en
#> [1] "Semimonthly"
#> 
#> 
#> $data$codelists[[1]]$codes[[16]]$description
#> [1] "To be used for data collected or disseminated twice a month."
#> 
#> $data$codelists[[1]]$codes[[16]]$descriptions
#> $data$codelists[[1]]$codes[[16]]$descriptions$en
#> [1] "To be used for data collected or disseminated twice a month."
#> 
#> 
#> 
#> $data$codelists[[1]]$codes[[17]]
#> $data$codelists[[1]]$codes[[17]]$annotations
#> list()
#> 
#> $data$codelists[[1]]$codes[[17]]$id
#> [1] "M_3"
#> 
#> $data$codelists[[1]]$codes[[17]]$name
#> [1] "Three times a month"
#> 
#> $data$codelists[[1]]$codes[[17]]$names
#> $data$codelists[[1]]$codes[[17]]$names$en
#> [1] "Three times a month"
#> 
#> 
#> $data$codelists[[1]]$codes[[17]]$description
#> [1] "To be used for data collected or disseminated three times a month."
#> 
#> $data$codelists[[1]]$codes[[17]]$descriptions
#> $data$codelists[[1]]$codes[[17]]$descriptions$en
#> [1] "To be used for data collected or disseminated three times a month."
#> 
#> 
#> 
#> $data$codelists[[1]]$codes[[18]]
#> $data$codelists[[1]]$codes[[18]]$annotations
#> list()
#> 
#> $data$codelists[[1]]$codes[[18]]$id
#> [1] "W2"
#> 
#> $data$codelists[[1]]$codes[[18]]$name
#> [1] "Biweekly"
#> 
#> $data$codelists[[1]]$codes[[18]]$names
#> $data$codelists[[1]]$codes[[18]]$names$en
#> [1] "Biweekly"
#> 
#> 
#> $data$codelists[[1]]$codes[[18]]$description
#> [1] "To be used for data collected or disseminated every two weeks."
#> 
#> $data$codelists[[1]]$codes[[18]]$descriptions
#> $data$codelists[[1]]$codes[[18]]$descriptions$en
#> [1] "To be used for data collected or disseminated every two weeks."
#> 
#> 
#> 
#> $data$codelists[[1]]$codes[[19]]
#> $data$codelists[[1]]$codes[[19]]$annotations
#> list()
#> 
#> $data$codelists[[1]]$codes[[19]]$id
#> [1] "W3"
#> 
#> $data$codelists[[1]]$codes[[19]]$name
#> [1] "Triweekly"
#> 
#> $data$codelists[[1]]$codes[[19]]$names
#> $data$codelists[[1]]$codes[[19]]$names$en
#> [1] "Triweekly"
#> 
#> 
#> $data$codelists[[1]]$codes[[19]]$description
#> [1] "To be used for data collected or disseminated every three weeks."
#> 
#> $data$codelists[[1]]$codes[[19]]$descriptions
#> $data$codelists[[1]]$codes[[19]]$descriptions$en
#> [1] "To be used for data collected or disseminated every three weeks."
#> 
#> 
#> 
#> $data$codelists[[1]]$codes[[20]]
#> $data$codelists[[1]]$codes[[20]]$annotations
#> list()
#> 
#> $data$codelists[[1]]$codes[[20]]$id
#> [1] "W4"
#> 
#> $data$codelists[[1]]$codes[[20]]$name
#> [1] "Four-weekly"
#> 
#> $data$codelists[[1]]$codes[[20]]$names
#> $data$codelists[[1]]$codes[[20]]$names$en
#> [1] "Four-weekly"
#> 
#> 
#> $data$codelists[[1]]$codes[[20]]$description
#> [1] "To be used for data collected or disseminated every four weeks."
#> 
#> $data$codelists[[1]]$codes[[20]]$descriptions
#> $data$codelists[[1]]$codes[[20]]$descriptions$en
#> [1] "To be used for data collected or disseminated every four weeks."
#> 
#> 
#> 
#> $data$codelists[[1]]$codes[[21]]
#> $data$codelists[[1]]$codes[[21]]$annotations
#> list()
#> 
#> $data$codelists[[1]]$codes[[21]]$id
#> [1] "W_2"
#> 
#> $data$codelists[[1]]$codes[[21]]$name
#> [1] "Semiweekly"
#> 
#> $data$codelists[[1]]$codes[[21]]$names
#> $data$codelists[[1]]$codes[[21]]$names$en
#> [1] "Semiweekly"
#> 
#> 
#> $data$codelists[[1]]$codes[[21]]$description
#> [1] "To be used for data collected or disseminated twice a week."
#> 
#> $data$codelists[[1]]$codes[[21]]$descriptions
#> $data$codelists[[1]]$codes[[21]]$descriptions$en
#> [1] "To be used for data collected or disseminated twice a week."
#> 
#> 
#> 
#> $data$codelists[[1]]$codes[[22]]
#> $data$codelists[[1]]$codes[[22]]$annotations
#> list()
#> 
#> $data$codelists[[1]]$codes[[22]]$id
#> [1] "W_3"
#> 
#> $data$codelists[[1]]$codes[[22]]$name
#> [1] "Three times a week"
#> 
#> $data$codelists[[1]]$codes[[22]]$names
#> $data$codelists[[1]]$codes[[22]]$names$en
#> [1] "Three times a week"
#> 
#> 
#> $data$codelists[[1]]$codes[[22]]$description
#> [1] "To be used for data collected or disseminated three times a week."
#> 
#> $data$codelists[[1]]$codes[[22]]$descriptions
#> $data$codelists[[1]]$codes[[22]]$descriptions$en
#> [1] "To be used for data collected or disseminated three times a week."
#> 
#> 
#> 
#> $data$codelists[[1]]$codes[[23]]
#> $data$codelists[[1]]$codes[[23]]$annotations
#> list()
#> 
#> $data$codelists[[1]]$codes[[23]]$id
#> [1] "D_2"
#> 
#> $data$codelists[[1]]$codes[[23]]$name
#> [1] "Twice a day"
#> 
#> $data$codelists[[1]]$codes[[23]]$names
#> $data$codelists[[1]]$codes[[23]]$names$en
#> [1] "Twice a day"
#> 
#> 
#> $data$codelists[[1]]$codes[[23]]$description
#> [1] "To be used for data collected or disseminated twice a day."
#> 
#> $data$codelists[[1]]$codes[[23]]$descriptions
#> $data$codelists[[1]]$codes[[23]]$descriptions$en
#> [1] "To be used for data collected or disseminated twice a day."
#> 
#> 
#> 
#> $data$codelists[[1]]$codes[[24]]
#> $data$codelists[[1]]$codes[[24]]$annotations
#> list()
#> 
#> $data$codelists[[1]]$codes[[24]]$id
#> [1] "H"
#> 
#> $data$codelists[[1]]$codes[[24]]$name
#> [1] "Hourly"
#> 
#> $data$codelists[[1]]$codes[[24]]$names
#> $data$codelists[[1]]$codes[[24]]$names$en
#> [1] "Hourly"
#> 
#> 
#> $data$codelists[[1]]$codes[[24]]$description
#> [1] "To be used for data collected or disseminated every hour."
#> 
#> $data$codelists[[1]]$codes[[24]]$descriptions
#> $data$codelists[[1]]$codes[[24]]$descriptions$en
#> [1] "To be used for data collected or disseminated every hour."
#> 
#> 
#> 
#> $data$codelists[[1]]$codes[[25]]
#> $data$codelists[[1]]$codes[[25]]$annotations
#> list()
#> 
#> $data$codelists[[1]]$codes[[25]]$id
#> [1] "H2"
#> 
#> $data$codelists[[1]]$codes[[25]]$name
#> [1] "Bihourly"
#> 
#> $data$codelists[[1]]$codes[[25]]$names
#> $data$codelists[[1]]$codes[[25]]$names$en
#> [1] "Bihourly"
#> 
#> 
#> $data$codelists[[1]]$codes[[25]]$description
#> [1] "To be used for data collected or disseminated every two hours."
#> 
#> $data$codelists[[1]]$codes[[25]]$descriptions
#> $data$codelists[[1]]$codes[[25]]$descriptions$en
#> [1] "To be used for data collected or disseminated every two hours."
#> 
#> 
#> 
#> $data$codelists[[1]]$codes[[26]]
#> $data$codelists[[1]]$codes[[26]]$annotations
#> list()
#> 
#> $data$codelists[[1]]$codes[[26]]$id
#> [1] "H3"
#> 
#> $data$codelists[[1]]$codes[[26]]$name
#> [1] "Trihourly"
#> 
#> $data$codelists[[1]]$codes[[26]]$names
#> $data$codelists[[1]]$codes[[26]]$names$en
#> [1] "Trihourly"
#> 
#> 
#> $data$codelists[[1]]$codes[[26]]$description
#> [1] "To be used for data collected or disseminated every three hours."
#> 
#> $data$codelists[[1]]$codes[[26]]$descriptions
#> $data$codelists[[1]]$codes[[26]]$descriptions$en
#> [1] "To be used for data collected or disseminated every three hours."
#> 
#> 
#> 
#> $data$codelists[[1]]$codes[[27]]
#> $data$codelists[[1]]$codes[[27]]$annotations
#> list()
#> 
#> $data$codelists[[1]]$codes[[27]]$id
#> [1] "B"
#> 
#> $data$codelists[[1]]$codes[[27]]$name
#> [1] "Daily – business week"
#> 
#> $data$codelists[[1]]$codes[[27]]$names
#> $data$codelists[[1]]$codes[[27]]$names$en
#> [1] "Daily – business week"
#> 
#> 
#> $data$codelists[[1]]$codes[[27]]$description
#> [1] "Similar to \"daily\", however there are no observations for Saturdays and Sundays (so, neither “missing values” nor “numeric values” should be provided for Saturday and Sunday)"
#> 
#> $data$codelists[[1]]$codes[[27]]$descriptions
#> $data$codelists[[1]]$codes[[27]]$descriptions$en
#> [1] "Similar to \"daily\", however there are no observations for Saturdays and Sundays (so, neither “missing values” nor “numeric values” should be provided for Saturday and Sunday)"
#> 
#> 
#> 
#> $data$codelists[[1]]$codes[[28]]
#> $data$codelists[[1]]$codes[[28]]$annotations
#> list()
#> 
#> $data$codelists[[1]]$codes[[28]]$id
#> [1] "N"
#> 
#> $data$codelists[[1]]$codes[[28]]$name
#> [1] "Minutely"
#> 
#> $data$codelists[[1]]$codes[[28]]$names
#> $data$codelists[[1]]$codes[[28]]$names$en
#> [1] "Minutely"
#> 
#> 
#> $data$codelists[[1]]$codes[[28]]$description
#> [1] "While N denotes \"minutely\", usually, there may be no observations every minute (for several series the frequency is usually \"irregular\" within a day/days). And though observations may be sparse (not collected or disseminated every minute), missing values do not need to be given for the minutes when no observations exist: in any case the time stamp determines when an observation is observed."
#> 
#> $data$codelists[[1]]$codes[[28]]$descriptions
#> $data$codelists[[1]]$codes[[28]]$descriptions$en
#> [1] "While N denotes \"minutely\", usually, there may be no observations every minute (for several series the frequency is usually \"irregular\" within a day/days). And though observations may be sparse (not collected or disseminated every minute), missing values do not need to be given for the minutes when no observations exist: in any case the time stamp determines when an observation is observed."
#> 
#> 
#> 
#> $data$codelists[[1]]$codes[[29]]
#> $data$codelists[[1]]$codes[[29]]$annotations
#> list()
#> 
#> $data$codelists[[1]]$codes[[29]]$id
#> [1] "I"
#> 
#> $data$codelists[[1]]$codes[[29]]$name
#> [1] "Irregular"
#> 
#> $data$codelists[[1]]$codes[[29]]$names
#> $data$codelists[[1]]$codes[[29]]$names$en
#> [1] "Irregular"
#> 
#> 
#> $data$codelists[[1]]$codes[[29]]$description
#> [1] "To be used with irregular time series that stores data for a sequence of arbitrary timepoints. Irregular time series are appropriate when the data arrives unpredictably, such as when the application records every stock trade or when random events are recorded (the interval between each element can be a different length)"
#> 
#> $data$codelists[[1]]$codes[[29]]$descriptions
#> $data$codelists[[1]]$codes[[29]]$descriptions$en
#> [1] "To be used with irregular time series that stores data for a sequence of arbitrary timepoints. Irregular time series are appropriate when the data arrives unpredictably, such as when the application records every stock trade or when random events are recorded (the interval between each element can be a different length)"
#> 
#> 
#> 
#> $data$codelists[[1]]$codes[[30]]
#> $data$codelists[[1]]$codes[[30]]$annotations
#> list()
#> 
#> $data$codelists[[1]]$codes[[30]]$id
#> [1] "OA"
#> 
#> $data$codelists[[1]]$codes[[30]]$name
#> [1] "Occasional annual"
#> 
#> $data$codelists[[1]]$codes[[30]]$names
#> $data$codelists[[1]]$codes[[30]]$names$en
#> [1] "Occasional annual"
#> 
#> 
#> $data$codelists[[1]]$codes[[30]]$description
#> [1] "The event occurs occasionally with an infrequent update that could span from 1 year to several years between events. It implies a survey that experiences a gap for several years prior to the next survey update (this is commonly linked to funding available to run a specific survey (i.e. health surveys), whereas a regular annual survey refers typically to ‘programs’ that are funded regularly and fall under the Statistics Act, and therefore never experience a gap)"
#> 
#> $data$codelists[[1]]$codes[[30]]$descriptions
#> $data$codelists[[1]]$codes[[30]]$descriptions$en
#> [1] "The event occurs occasionally with an infrequent update that could span from 1 year to several years between events. It implies a survey that experiences a gap for several years prior to the next survey update (this is commonly linked to funding available to run a specific survey (i.e. health surveys), whereas a regular annual survey refers typically to ‘programs’ that are funded regularly and fall under the Statistics Act, and therefore never experience a gap)"
#> 
#> 
#> 
#> $data$codelists[[1]]$codes[[31]]
#> $data$codelists[[1]]$codes[[31]]$annotations
#> list()
#> 
#> $data$codelists[[1]]$codes[[31]]$id
#> [1] "OM"
#> 
#> $data$codelists[[1]]$codes[[31]]$name
#> [1] "Occasional monthly"
#> 
#> $data$codelists[[1]]$codes[[31]]$names
#> $data$codelists[[1]]$codes[[31]]$names$en
#> [1] "Occasional monthly"
#> 
#> 
#> $data$codelists[[1]]$codes[[31]]$description
#> [1] "The event occurs occasionally with an infrequent update that could span from 1 month to several months between events. It implies a survey that experiences a gap for several months prior to the next survey update."
#> 
#> $data$codelists[[1]]$codes[[31]]$descriptions
#> $data$codelists[[1]]$codes[[31]]$descriptions$en
#> [1] "The event occurs occasionally with an infrequent update that could span from 1 month to several months between events. It implies a survey that experiences a gap for several months prior to the next survey update."
#> 
#> 
#> 
#> $data$codelists[[1]]$codes[[32]]
#> $data$codelists[[1]]$codes[[32]]$annotations
#> list()
#> 
#> $data$codelists[[1]]$codes[[32]]$id
#> [1] "_O"
#> 
#> $data$codelists[[1]]$codes[[32]]$name
#> [1] "Other"
#> 
#> $data$codelists[[1]]$codes[[32]]$names
#> $data$codelists[[1]]$codes[[32]]$names$en
#> [1] "Other"
#> 
#> 
#> $data$codelists[[1]]$codes[[32]]$description
#> [1] "To be used when the qualitative or quantitative values that a variable takes in a data set is associated to multiple occurrences with frequency other than the already defined ones (for example every 5 hours and 32 minutes etc.)"
#> 
#> $data$codelists[[1]]$codes[[32]]$descriptions
#> $data$codelists[[1]]$codes[[32]]$descriptions$en
#> [1] "To be used when the qualitative or quantitative values that a variable takes in a data set is associated to multiple occurrences with frequency other than the already defined ones (for example every 5 hours and 32 minutes etc.)"
#> 
#> 
#> 
#> $data$codelists[[1]]$codes[[33]]
#> $data$codelists[[1]]$codes[[33]]$annotations
#> list()
#> 
#> $data$codelists[[1]]$codes[[33]]$id
#> [1] "_U"
#> 
#> $data$codelists[[1]]$codes[[33]]$name
#> [1] "Unspecified"
#> 
#> $data$codelists[[1]]$codes[[33]]$names
#> $data$codelists[[1]]$codes[[33]]$names$en
#> [1] "Unspecified"
#> 
#> 
#> $data$codelists[[1]]$codes[[33]]$description
#> [1] "To be used when a set of values are reported within a time range but not associated to sub ranges. Often this could happen in case of missing or sparse information. (Let’s say we have two observations for 2020 but we do not know if they are part of a monthly reporting or quarterly reporting)"
#> 
#> $data$codelists[[1]]$codes[[33]]$descriptions
#> $data$codelists[[1]]$codes[[33]]$descriptions$en
#> [1] "To be used when a set of values are reported within a time range but not associated to sub ranges. Often this could happen in case of missing or sparse information. (Let’s say we have two observations for 2020 but we do not know if they are part of a monthly reporting or quarterly reporting)"
#> 
#> 
#> 
#> $data$codelists[[1]]$codes[[34]]
#> $data$codelists[[1]]$codes[[34]]$annotations
#> list()
#> 
#> $data$codelists[[1]]$codes[[34]]$id
#> [1] "_Z"
#> 
#> $data$codelists[[1]]$codes[[34]]$name
#> [1] "Not applicable"
#> 
#> $data$codelists[[1]]$codes[[34]]$names
#> $data$codelists[[1]]$codes[[34]]$names$en
#> [1] "Not applicable"
#> 
#> 
#> $data$codelists[[1]]$codes[[34]]$description
#> [1] "To be used when the qualitative or quantitative values that a variable takes in a data set is not associated to multiple occurrences (only single occurrence exists) one can use the _Z as frequency."
#> 
#> $data$codelists[[1]]$codes[[34]]$descriptions
#> $data$codelists[[1]]$codes[[34]]$descriptions$en
#> [1] "To be used when the qualitative or quantitative values that a variable takes in a data set is not associated to multiple occurrences (only single occurrence exists) one can use the _Z as frequency."
#> 
#> 
#> 
#> 
#> $data$codelists[[1]]$codelistExtensions
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
#> [1] "IDREF9529"
#> 
#> $meta$test
#> [1] FALSE
#> 
#> $meta$prepared
#> [1] "2026-06-17T06:50:29.217079481Z"
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

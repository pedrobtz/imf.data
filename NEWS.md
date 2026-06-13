# imf.data 0.2.0

* This is a breaking migration from the retired IMF JSON service to the IMF
  SDMX 3.0 API. The legacy `load_datasets()` and `$get_series()` workflow has
  been removed.
* `get_data()` accepts named dimension filters and returns one tidy row per
  observation.
* `list_datasets()` returns a stable catalogue of IMF SDMX dataflows.
* `list_dimensions()` resolves a dataflow's ordered dimensions and codelists.
* `list_dimension_values()` returns available codes and labels for a dimension.
* `sdmx_availability()`, `sdmx_data()`, `sdmx_metadata()`, and
  `sdmx_structure()` provide validated low-level access to SDMX 3.0 responses.
* `set_imf_proxy()` and `clear_imf_proxy()` configure an authenticated proxy for
  every IMF API request in the current R session.

# imf.data 0.1.7

* [#11](https://github.com/pedrobtz/imf.data/issues/11) fix issue with handling Series with empty/NULL data for some dimensions.

# imf.data 0.1.6

* [#9](https://github.com/pedrobtz/imf.data/issues/9) fix issue with handling Series with multiple value (Obs + other indicators).

# imf.data 0.1.5

* [#5](https://github.com/pedrobtz/imf.data/issues/5) fix/change behavior of 'template_get' to evaluate function arguments within the calling environment.

# imf.data 0.1.4

* set 'curl' timeout to 5 minutes.

# imf.data 0.1.3

* improve error handling, when service responds with html message.

# imf.data 0.1.2

* [#2](https://github.com/pedrobtz/imf.data/issues/2) fix bug while extracting the dimensions for database, when a dimension has a single value. 

# imf.data 0.1.1

* make methods fail gracefully with an informative message if the resource is not available.

# imf.data 0.1.0

* Initial GitHub version.

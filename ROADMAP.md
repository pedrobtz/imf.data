# imf.data SDMX 3.0 Roadmap

`imf.data` 0.2.0 is a breaking migration from the retired IMF JSON service to
the [IMF SDMX 3.0 API](https://datasupport.imf.org/knowledge?id=knowledge_category&category_id=9959b2bc1b6391903dba646fbd4bcb6a).
This document is the source of truth for completing and releasing that
migration.

## Release Goal

Provide two supported layers:

1. A concise tidy workflow based on `list_datasets()`, `list_dimensions()`,
   `list_dimension_values()`, and `get_data()`.
2. An advanced raw interface based on `sdmx_structure()`, `sdmx_data()`,
   `sdmx_availability()`, and `sdmx_metadata()`.

The legacy `load_datasets()` object and `$get_series()` workflow will not be
restored. Users upgrading from 0.1.x must migrate to the new functions.

## P0: Package Foundation

- [x] Include tests in source package builds.
- [x] Exclude local development directories from source packages.
- [x] Remove tracked editor-specific settings.
- [x] Keep compatibility with R 4.0 by avoiding the base pipe.
- [x] Point package metadata to the official IMF API page.
- [x] Confirm `R CMD check --as-cran` reports no errors, warnings, or notes.

## P0: Raw SDMX Client

- [x] Validate paths, contexts, formats, periods, filters, and limits.
- [x] Add timeouts, bounded retries, and informative HTTP errors.
- [x] Support package-level authenticated proxy configuration.
- [x] Handle HTTP 204 responses.
- [x] Preserve unsimplified SDMX JSON for reliable index decoding.
- [x] Keep XML responses available as raw text.
- [ ] Monitor the IMF API for media-type or schema changes.

## P1: Discovery

- [x] Return a stable tidy dataflow catalogue.
- [x] Resolve dataflow data structures and ordered dimensions.
- [x] Return available dimension values for constrained selections.
- [x] Enrich available values with codelist labels when provided.

## P1: Tidy Retrieval

- [x] Accept named component filters.
- [x] Decode indexed dimensions, observations, measures, and attributes.
- [x] Return one tidy row per observation.
- [x] Return typed empty results with an informative warning.
- [x] Support multiple series and first/last observation limits.

## P1: Testing

- [x] Cover request construction and input validation.
- [x] Cover discovery normalization and codelist enrichment.
- [x] Cover multiple-series parsing, attributes, and empty responses.
- [x] Replace broad historical cassettes with small semantic fixtures.
- [x] Add a scheduled live CPI smoke test.

## P2: Documentation and Release

- [x] Rewrite the README around the SDMX 3.0 workflow.
- [x] Publish a 0.1.x to 0.2.0 migration guide.
- [x] Add an end-to-end vignette.
- [x] Synchronize roxygen documentation, `NAMESPACE`, and pkgdown navigation.
- [x] Update `NEWS.md` and CRAN submission comments.
- [ ] Pass the full remote CI matrix.

## Release Criteria

Version 0.2.0 can be submitted to CRAN when:

- `R CMD check --as-cran` runs the complete test suite with
  `0 errors | 0 warnings | 0 notes`.
- README and pkgdown builds do not require a live network connection.
- A scheduled live test verifies that a current CPI query returns observations.
- Every exported function has synchronized documentation and focused tests.
- Migration guidance clearly describes the breaking API change.

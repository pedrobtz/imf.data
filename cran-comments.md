## R CMD check results

0 errors | 0 warnings | 0 notes

Checked locally on:

* macOS Tahoe 26.5, R 4.5.2

## Internet access

HTTP integration tests replay committed `vcr` cassettes in `record = "none"`
mode, which guarantees that package checks do not make network requests. A
separate scheduled GitHub Actions workflow performs the live IMF API smoke test.

## Breaking changes

Version 0.2.0 replaces the decommissioned IMF JSON API with the IMF SDMX 3.0
API. It removes the legacy dataset object interface and introduces a tidy
discovery and retrieval workflow. The package includes a migration vignette.

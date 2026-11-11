# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working
with code in this repository.

## Shared conventions

The portfolio’s shared rules are synced into `.claude/shared/` from
`pedrobtz/packages:claude/shared/`. Never edit them here. Where this
file and a shared file disagree, this file wins for this package.

@.claude/shared/workflow.md @.claude/shared/r-package.md
@.claude/shared/ci.md @.claude/shared/correctness.md
@.claude/shared/assurance.md

This package predates those files and departs from them in a few places.
Each departure is stated as one below, in the section it belongs to.

## What this is

An R client for the IMF SDMX 3.0 REST API at
`https://api.imf.org/external/sdmx/3.0`. It has two layers: a raw layer
([`sdmx_structure()`](https://pedrobtz.github.io/imf.data/dev/reference/sdmx_structure.md),
[`sdmx_data()`](https://pedrobtz.github.io/imf.data/dev/reference/sdmx_data.md),
[`sdmx_availability()`](https://pedrobtz.github.io/imf.data/dev/reference/sdmx_availability.md),
[`sdmx_metadata()`](https://pedrobtz.github.io/imf.data/dev/reference/sdmx_metadata.md))
that returns the API response as a nested list (JSON) or text (XML), and
a tidy layer
([`list_datasets()`](https://pedrobtz.github.io/imf.data/dev/reference/list_datasets.md),
[`list_dimensions()`](https://pedrobtz.github.io/imf.data/dev/reference/list_dimensions.md),
[`list_dimension_values()`](https://pedrobtz.github.io/imf.data/dev/reference/list_dimension_values.md),
[`get_data()`](https://pedrobtz.github.io/imf.data/dev/reference/get_data.md))
that returns tibbles.
[`set_imf_proxy()`](https://pedrobtz.github.io/imf.data/dev/reference/set_imf_proxy.md)
and
[`clear_imf_proxy()`](https://pedrobtz.github.io/imf.data/dev/reference/set_imf_proxy.md)
configure an HTTP proxy for the session. Every call goes to the API;
nothing is cached between calls.

Deviation from the zero-dependency rule: runtime dependencies are
`httr2` (\>= 1.0.0) and `tibble`.

There is no design or roadmap document and no `.agents/` directory. The
exported docs, the two vignettes (`getting-started`, `migration`) and
the tests are the contract.

## Current state

On CRAN as 0.2.0 (published 2026-07-06). `main` is the development
version, `0.2.0.9000`, with no changes yet under its `NEWS.md` heading.
Version 0.2.0 replaced the decommissioned IMF JSON API used by 0.1.x
with SDMX 3.0, a breaking change; `vignettes/migration.Rmd` maps the old
functions to the new ones.

Gaps from the shared rules, as of 2026-11-11:

- CI is not yet on `pedrobtz/r-actions`: `R-CMD-check.yaml` is the
  hand-rolled r-lib template, so it does not count as the pre-submission
  check. Issue [\#23](https://github.com/pedrobtz/imf.data/issues/23)
  tracks the move, and a coverage workflow with it.
- No `cran-release.yaml`; the `.9000` bump was a hand-made pull request.
- No `.agents/assurance.md`.
- Errors are plain `stop(..., call. = FALSE)` and warnings plain
  [`warning()`](https://rdrr.io/r/base/warning.html), with no condition
  classes. Tests pin the wording with snapshots instead of asserting on
  classes.
- `cran-comments.md` still lists a local macOS check as its test
  environment, not CI legs.

## Versions and dependents

The current version’s parent issue is
[\#21](https://github.com/pedrobtz/imf.data/issues/21), `v0.2.1`. The
`cran-release` reminder is
[\#20](https://github.com/pedrobtz/imf.data/issues/20). Sibling packages
that depend on this one: none.

## Commands

The shared commands apply. Specific to this package:

``` sh
Rscript -e 'lintr::lint_package()'               # as lint.yaml runs it
VCR_RECORD=all Rscript -e 'devtools::test()'     # re-record every cassette
```

Any lint fails `lint.yaml`. Re-recording calls the live API.

`VCR_RECORD` accepts `none` (the default), `once`, `new_episodes` or
`all`. Recording needs network access to the IMF API; review the
cassette diff before committing it.

## Architecture

Two R files, collated in a fixed order (`Collate:` in `DESCRIPTION`):
`R/sdmx_api.R` first, then `R/imf_api.R`.

- **`R/sdmx_api.R`, the raw layer.** Argument validators
  (`validate_scalar_character()`, `validate_choice()`,
  `validate_period()`, `validate_rfc3339()`, `validate_filters()` and
  the proxy validators), the request builder `sdmx_request()` and
  `sdmx_perform()`. `sdmx_request()` sets the `Accept` header, the
  proxy, a `imf.data/<version>` user agent, a 60-second timeout, three
  tries with retry on failure, and an error body that surfaces the API’s
  message. `sdmx_send()` is the one place a request is performed.
  `sdmx_perform()` returns `NULL` for HTTP 204.
- **`R/imf_api.R`, the tidy layer.** `resolve_dsd()` follows a dataflow
  to its data structure definition (two
  [`sdmx_structure()`](https://pedrobtz.github.io/imf.data/dev/reference/sdmx_structure.md)
  calls, with `references = "datastructure"` then `"children"`).
  `codelist_labels()` turns a codelist into `code`, `name`,
  `description`. `parse_data_message()` decodes an SDMX-JSON data
  message into rows; `decode_key()`, `zero_based_position()` and the
  attribute decoders map the message’s zero-based indices onto dimension
  and attribute values. Malformed input goes through
  `malformed_response()`.
- **State.** `imf_data_state`, an environment in `R/sdmx_api.R`, holds
  the proxy configuration and nothing else. Credentials stay there; the
  functions return only `proxy_summary()`, which redacts them.

## Invariants that are easy to break

- **No network during checks.** Tests replay `vcr` cassettes from
  `tests/fixtures/`. `tests/testthat/setup-vcr.R` forces
  `record = "none"` whenever `_R_CHECK_PACKAGE_NAME_` is set or
  `_R_CHECK_CRAN_INCOMING_` is true, whatever `VCR_RECORD` says, and a
  test asserts that an unmatched request fails with `vcr_unhandled`.
  `cran-comments.md` promises CRAN this.
- **Cassettes are matched on method and URI only.** A change to the
  query string a function builds (parameter names, order, the `c[DIM]`
  filter syntax, `ge:`/`le:` period bounds) breaks replay until the
  cassette is re-recorded.
- **Proxy credentials never leave the package.**
  [`set_imf_proxy()`](https://pedrobtz.github.io/imf.data/dev/reference/set_imf_proxy.md)
  and
  [`clear_imf_proxy()`](https://pedrobtz.github.io/imf.data/dev/reference/set_imf_proxy.md)
  return the redacted summary, and `setup-vcr.R` filters `authorization`
  and `proxy-authorization` headers out of cassettes, along with
  volatile response headers.
- **SDMX-JSON indices are zero-based.** Series keys such as `"0:1"` and
  observation keys index into the structure’s `values` lists, and
  `zero_based_position()` adds one and rejects anything that is not a
  non-negative whole number below `.Machine$integer.max`.
- **Empty results are a warning and a typed empty tibble, not an
  error.**
  [`get_data()`](https://pedrobtz.github.io/imf.data/dev/reference/get_data.md)
  warns on HTTP 204 and on zero matched observations, and returns a
  tibble with the expected column types.
- **`first_n_obs` and `last_n_obs` exclude each other**, and periods
  must be one of the SDMX forms `validate_period()` accepts (year,
  month, date, reporting period, RFC 3339).

## Testing

- `tests/testthat/test-sdmx-api.R` covers the raw layer and
  `tests/testthat/test-imf-api.R` the tidy layer. Each HTTP test wraps
  its calls in `vcr::use_cassette("<name>", ...)`, with the cassette at
  `tests/fixtures/<name>.yml`.
- `tests/testthat/helper-fixtures.R` provides `fixture_data_response()`,
  a hand-built SDMX-JSON data message (two series, one empty variant)
  for testing the parser without a cassette.
- Validation errors are checked with
  `expect_snapshot(error = TRUE, ...)`, snapshots in
  `tests/testthat/_snaps/`. This is a deviation from asserting on
  condition classes, because the package raises none.
- The live API is exercised only by `live-api-smoke.yaml`, never by the
  test suite.

## Continuous integration

None of the workflows call `pedrobtz/r-actions` yet (see Current state).

- `R-CMD-check.yaml`: the r-lib template matrix, macOS and Windows
  release and Ubuntu devel, release and oldrel-1. No CRAN-like
  containers.
- `lint.yaml`:
  [`lintr::lint_package()`](https://lintr.r-lib.org/reference/lint.html)
  with `LINTR_ERROR_ON_LINT=true`, so any lint fails. `.lintr` allows
  lines up to 120 characters, CamelCase or snake_case names, and drops
  `return_linter`; `R/imf_api.R` turns off `object_usage_linter` for the
  whole file.
- `live-api-smoke.yaml`: weekly (Monday 06:17 UTC) and on dispatch,
  fetches the last two US CPI observations from the live API and checks
  their shape. It is the only place the real API is called.
- `pkgdown.yaml`: the r-lib template, deploying to `gh-pages` with
  `clean: false`. `_pkgdown.yml` uses `development: mode: auto`.

# Configure an HTTP proxy

Configure a proxy for all subsequent IMF API requests in the current R
session. Credentials are kept in package-private session state, passed
to
[`httr2::req_proxy()`](https://httr2.r-lib.org/reference/req_proxy.html),
and omitted from returned configuration summaries.

## Usage

``` r
set_imf_proxy(
  url,
  port = NULL,
  username = NULL,
  password = NULL,
  auth = proxy_auth_methods
)

clear_imf_proxy()
```

## Arguments

- url:

  Proxy URL, including its scheme and hostname.

- port:

  Optional proxy port.

- username, password:

  Optional proxy credentials. Supply both or neither.

- auth:

  Proxy authentication method supported by
  [`httr2::req_proxy()`](https://httr2.r-lib.org/reference/req_proxy.html).

## Value

A redacted summary of the previous proxy configuration, invisibly.

## Details

Standard proxy environment variables such as `HTTPS_PROXY`,
`HTTP_PROXY`, and `NO_PROXY` continue to work when no package-specific
proxy is set.

## Examples

``` r
# Not run: requires a reachable proxy server. The example points at a
# placeholder host, so executing it would route a real request through a
# non-existent proxy and fail.
if (FALSE) { # \dontrun{
set_imf_proxy(
  "http://proxy.example.com",
  port = 8080,
  username = "proxy_user",
  password = "proxy_password"
)

list_datasets("IMF.STA")
clear_imf_proxy()
} # }
```

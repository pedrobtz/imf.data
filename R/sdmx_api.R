#' IMF SDMX 3.0 API
#'
#' Low-level access to the IMF SDMX 3.0 structure, data, availability, and
#' metadata endpoints. These functions return the API response without
#' converting it to a tidy data frame. See [get_data()] for the higher-level
#' interface.
#'
#' @name sdmx_api
NULL

sdmx_base_url <- "https://api.imf.org/external/sdmx/3.0"

structure_types <- c(
  "datastructure",
  "metadatastructure",
  "dataflow",
  "metadataflow",
  "provisionagreement",
  "structureset",
  "process",
  "categorisation",
  "dataconstraint",
  "metadataconstraint",
  "conceptscheme",
  "codelist",
  "categoryscheme",
  "hierarchy",
  "hierarchyassociation",
  "agencyscheme",
  "dataproviderscheme",
  "dataconsumerscheme",
  "organisationunitscheme",
  "transformationscheme",
  "rulesetscheme",
  "userdefinedoperatorscheme",
  "customtypescheme",
  "namepersonalisationscheme",
  "vtlmappingscheme",
  "valuelist",
  "structuremap",
  "representationmap",
  "conceptschememap",
  "categoryschememap",
  "organisationschememap",
  "reportingtaxonomymap",
  "*"
)

query_contexts <- c("dataflow", "datastructure", "provisionagreement", "*")

proxy_auth_methods <- c(
  "basic",
  "digest",
  "digest_ie",
  "bearer",
  "negotiate",
  "ntlm",
  "ntlm_wb",
  "any",
  "anysafe"
)

validate_scalar_character <- function(x, name, allow_null = FALSE) {
  if (allow_null && is.null(x)) {
    return(invisible(x))
  }
  if (!is.character(x) || length(x) != 1L || is.na(x) || !nzchar(x)) {
    stop(
      sprintf("`%s` must be one non-empty character value.", name),
      call. = FALSE
    )
  }
  invisible(x)
}

validate_choice <- function(x, choices, name) {
  validate_scalar_character(x, name)
  if (!x %in% choices) {
    stop(
      sprintf(
        "`%s` must be one of: %s.",
        name,
        paste(shQuote(choices), collapse = ", ")
      ),
      call. = FALSE
    )
  }
  invisible(x)
}

validate_count <- function(x, name) {
  if (is.null(x)) {
    return(invisible(x))
  }
  if (length(x) != 1L || is.na(x) || !is.numeric(x) || x < 1 || x %% 1 != 0) {
    stop(sprintf("`%s` must be a positive whole number.", name), call. = FALSE)
  }
  invisible(x)
}

validate_period <- function(x, name) {
  if (is.null(x)) {
    return(invisible(x))
  }
  validate_scalar_character(x, name)
  if (!grepl("^[0-9]{4}([-QM][0-9]{1,2}|-[0-9]{2}(-[0-9]{2})?)?$", x)) {
    stop(sprintf("`%s` is not a supported SDMX period.", name), call. = FALSE)
  }
  invisible(x)
}

validate_filters <- function(filters) {
  if (!is.list(filters)) {
    stop("`filters` must be a named list.", call. = FALSE)
  }
  if (!length(filters)) {
    return(invisible(filters))
  }
  filter_names <- names(filters)
  if (is.null(filter_names) || any(!nzchar(filter_names))) {
    stop(
      "Every element of `filters` must have a dimension name.",
      call. = FALSE
    )
  }
  if (anyDuplicated(filter_names)) {
    stop("Dimension names in `filters` must be unique.", call. = FALSE)
  }
  valid_name <- grepl("^[A-Za-z][A-Za-z0-9_]*$", filter_names)
  if (any(!valid_name)) {
    stop(
      "Filter names may contain only letters, numbers, and underscores.",
      call. = FALSE
    )
  }
  valid_value <- vapply(
    filters,
    function(value) {
      is.atomic(value) && length(value) > 0L && !anyNA(value)
    },
    logical(1)
  )
  if (any(!valid_value)) {
    stop(
      "Every filter must contain one or more non-missing atomic values.",
      call. = FALSE
    )
  }
  invisible(filters)
}

validate_proxy_port <- function(port) {
  if (is.null(port)) {
    return(invisible(port))
  }
  if (
    length(port) != 1L ||
      is.na(port) ||
      !is.numeric(port) ||
      port %% 1 != 0 ||
      port < 1 ||
      port > 65535
  ) {
    stop("`port` must be a whole number between 1 and 65535.", call. = FALSE)
  }
  invisible(port)
}

validate_proxy_credentials <- function(username, password) {
  if (xor(is.null(username), is.null(password))) {
    stop(
      "`username` and `password` must be supplied together.",
      call. = FALSE
    )
  }
  if (!is.null(username)) {
    validate_scalar_character(username, "username")
    if (!is.character(password) || length(password) != 1L || is.na(password)) {
      stop("`password` must be one character value.", call. = FALSE)
    }
  }
  invisible(NULL)
}

#' Configure an HTTP proxy
#'
#' Configure a proxy for all subsequent IMF API requests in the current R
#' session. Credentials are passed to [httr2::req_proxy()] and are not embedded
#' in the proxy URL.
#'
#' Standard proxy environment variables such as `HTTPS_PROXY`, `HTTP_PROXY`,
#' and `NO_PROXY` continue to work when no package-specific proxy is set.
#'
#' @param url Proxy URL, including its scheme and hostname.
#' @param port Optional proxy port.
#' @param username,password Optional proxy credentials. Supply both or neither.
#' @param auth Proxy authentication method supported by [httr2::req_proxy()].
#'
#' @return The previous proxy configuration, invisibly.
#' @export
#'
#' @examples
#' \dontrun{
#' set_imf_proxy(
#'   "http://proxy.example.com",
#'   port = 8080,
#'   username = Sys.getenv("PROXY_USER"),
#'   password = Sys.getenv("PROXY_PASSWORD")
#' )
#'
#' list_datasets("IMF.STA")
#' clear_imf_proxy()
#' }
set_imf_proxy <- function(
  url,
  port = NULL,
  username = NULL,
  password = NULL,
  auth = proxy_auth_methods
) {
  validate_scalar_character(url, "url")
  validate_proxy_port(port)
  validate_proxy_credentials(username, password)
  auth <- match.arg(auth)

  previous <- getOption("imf.data.proxy")
  options(
    imf.data.proxy = list(
      url = url,
      port = if (is.null(port)) NULL else as.integer(port),
      username = username,
      password = password,
      auth = auth
    )
  )
  invisible(previous)
}

#' @rdname set_imf_proxy
#' @export
clear_imf_proxy <- function() {
  previous <- getOption("imf.data.proxy")
  options(imf.data.proxy = NULL)
  invisible(previous)
}

apply_proxy <- function(req) {
  proxy <- getOption("imf.data.proxy")
  if (is.null(proxy)) {
    return(req)
  }
  do.call(httr2::req_proxy, c(list(req), proxy))
}

add_query <- function(req, query) {
  query <- query[!vapply(query, is.null, logical(1))]
  if (!length(query)) {
    return(req)
  }
  do.call(httr2::req_url_query, c(list(req), query))
}

filter_query <- function(filters) {
  validate_filters(filters)
  if (!length(filters)) {
    return(list())
  }
  values <- lapply(filters, function(value) {
    paste(as.character(value), collapse = ",")
  })
  names(values) <- paste0("c[", names(filters), "]")
  values
}

sdmx_error_body <- function(resp) {
  body <- tryCatch(
    httr2::resp_body_string(resp),
    error = function(cnd) ""
  )
  body <- trimws(gsub("[\r\n]+", " ", body))
  if (nzchar(body)) {
    sprintf("IMF API request failed: %s", body)
  } else {
    sprintf(
      "IMF API request failed with HTTP status %s.",
      httr2::resp_status(resp)
    )
  }
}

sdmx_send <- function(req) {
  httr2::req_perform(req)
}

sdmx_request <- function(path, format = c("json", "xml")) {
  format <- match.arg(format)
  validate_scalar_character(path, "path")
  accept <- if (format == "json") "application/json" else "application/xml"

  req <- httr2::request(sdmx_base_url)
  req <- httr2::req_url_path_append(req, path)
  req <- httr2::req_headers(req, Accept = accept)
  req <- apply_proxy(req)
  req <- httr2::req_user_agent(
    req,
    sprintf(
      "imf.data/%s (https://github.com/pedrobtz/imf.data)",
      utils::packageVersion("imf.data")
    )
  )
  req <- httr2::req_timeout(req, seconds = 60)
  req <- httr2::req_retry(
    req,
    max_tries = 3,
    retry_on_failure = TRUE
  )
  httr2::req_error(req, body = sdmx_error_body)
}

sdmx_perform <- function(req, format = c("json", "xml")) {
  format <- match.arg(format)
  resp <- sdmx_send(req)
  if (httr2::resp_status(resp) == 204L) {
    return(NULL)
  }
  if (format == "xml") {
    return(httr2::resp_body_string(resp))
  }
  httr2::resp_body_json(resp, check_type = TRUE, simplifyVector = FALSE)
}

#' Query structural metadata
#'
#' Retrieve IMF SDMX structural metadata such as dataflows, data structures,
#' codelists, and concept schemes.
#'
#' @param structure_type Type of structure to retrieve.
#' @param agency_id Maintainer ID. Use `"*"` for all maintainers.
#' @param resource_id Resource ID. Use `"*"` for all resources.
#' @param version Resource version. `"+"` selects the latest stable version.
#' @param detail Optional SDMX detail level.
#' @param references Optional referenced artefacts to include.
#' @param format Response format. XML responses are returned as text.
#'
#' @return A nested list for JSON, a character value for XML, or `NULL` for
#'   an HTTP 204 response.
#' @export
#'
#' @examples
#' \dontrun{
#' sdmx_structure("dataflow", agency_id = "IMF.STA", detail = "allstubs")
#' sdmx_structure("codelist", "IMF", "CL_FREQ")
#' }
sdmx_structure <- function(
  structure_type = "dataflow",
  agency_id = "*",
  resource_id = "*",
  version = "+",
  detail = NULL,
  references = NULL,
  format = c("json", "xml")
) {
  validate_choice(structure_type, structure_types, "structure_type")
  validate_scalar_character(agency_id, "agency_id")
  validate_scalar_character(resource_id, "resource_id")
  validate_scalar_character(version, "version")
  validate_scalar_character(detail, "detail", allow_null = TRUE)
  validate_scalar_character(references, "references", allow_null = TRUE)
  format <- match.arg(format)

  path <- paste(
    "structure",
    structure_type,
    agency_id,
    resource_id,
    version,
    sep = "/"
  )
  req <- sdmx_request(path, format)
  req <- add_query(req, list(detail = detail, references = references))
  sdmx_perform(req, format)
}

#' Query statistical data
#'
#' Retrieve an SDMX data message from the IMF API. This is the raw interface;
#' use [get_data()] to obtain a tidy data frame.
#'
#' @param dataflow Dataflow ID.
#' @param key SDMX series key. Use `"*"` with `filters` for named filtering.
#' @param agency_id Maintainer ID.
#' @param version Dataflow version.
#' @param context Query context.
#' @param filters Named list of component filters.
#' @param start_period,end_period Optional SDMX period bounds.
#' @param first_n_obs,last_n_obs Optional positive observation limits. They
#'   cannot be used together.
#' @param updated_after Optional RFC 3339 timestamp.
#' @param include_history Include historical versions.
#' @param attributes Attribute detail requested from the API.
#' @param measures Measures requested from the API.
#' @param format Response format. XML responses are returned as text.
#'
#' @return A nested list for JSON, a character value for XML, or `NULL` for
#'   an HTTP 204 response.
#' @export
#'
#' @examples
#' \dontrun{
#' sdmx_data(
#'   "CPI",
#'   agency_id = "IMF.STA",
#'   key = "USA.CPI._T.IX.M",
#'   last_n_obs = 2
#' )
#' }
sdmx_data <- function(
  dataflow,
  key = "*",
  agency_id = "IMF.STA",
  version = "+",
  context = "dataflow",
  filters = list(),
  start_period = NULL,
  end_period = NULL,
  first_n_obs = NULL,
  last_n_obs = NULL,
  updated_after = NULL,
  include_history = FALSE,
  attributes = "dsd",
  measures = "all",
  format = c("json", "xml")
) {
  validate_scalar_character(dataflow, "dataflow")
  validate_scalar_character(key, "key")
  validate_scalar_character(agency_id, "agency_id")
  validate_scalar_character(version, "version")
  validate_choice(context, query_contexts, "context")
  validate_filters(filters)
  validate_period(start_period, "start_period")
  validate_period(end_period, "end_period")
  validate_count(first_n_obs, "first_n_obs")
  validate_count(last_n_obs, "last_n_obs")
  validate_scalar_character(updated_after, "updated_after", allow_null = TRUE)
  if (
    !is.logical(include_history) ||
      length(include_history) != 1L ||
      is.na(include_history)
  ) {
    stop("`include_history` must be TRUE or FALSE.", call. = FALSE)
  }
  if (!is.null(first_n_obs) && !is.null(last_n_obs)) {
    stop("Use only one of `first_n_obs` and `last_n_obs`.", call. = FALSE)
  }
  format <- match.arg(format)

  path <- paste("data", context, agency_id, dataflow, version, key, sep = "/")
  query <- filter_query(filters)
  time_filter <- character()
  if (!is.null(start_period)) {
    time_filter <- c(time_filter, paste0("ge:", start_period))
  }
  if (!is.null(end_period)) {
    time_filter <- c(time_filter, paste0("le:", end_period))
  }
  if (length(time_filter)) {
    query[["c[TIME_PERIOD]"]] <- paste(time_filter, collapse = "+")
  }
  query$firstNObservations <- first_n_obs
  query$lastNObservations <- last_n_obs
  query$updatedAfter <- updated_after
  query$includeHistory <- if (include_history) "true" else NULL
  query$attributes <- attributes
  query$measures <- measures

  req <- add_query(sdmx_request(path, format), query)
  sdmx_perform(req, format)
}

#' Query data availability
#'
#' Retrieve the available dimension values matching a data query without
#' downloading observations.
#'
#' @inheritParams sdmx_data
#' @param component_id Dimension for which availability is requested.
#' @param mode Return exact matches or values that remain available.
#' @param references Referenced artefacts to include.
#'
#' @return A nested list for JSON, a character value for XML, or `NULL` for
#'   an HTTP 204 response.
#' @export
#'
#' @examples
#' \dontrun{
#' sdmx_availability("CPI", component_id = "COUNTRY")
#' }
sdmx_availability <- function(
  dataflow,
  key = "*",
  component_id = "*",
  agency_id = "IMF.STA",
  version = "+",
  context = "dataflow",
  filters = list(),
  mode = c("exact", "available"),
  references = "none",
  format = c("json", "xml")
) {
  validate_scalar_character(dataflow, "dataflow")
  validate_scalar_character(key, "key")
  validate_scalar_character(component_id, "component_id")
  validate_scalar_character(agency_id, "agency_id")
  validate_scalar_character(version, "version")
  validate_choice(context, query_contexts, "context")
  validate_filters(filters)
  validate_scalar_character(references, "references")
  mode <- match.arg(mode)
  format <- match.arg(format)

  path <- paste(
    "availability",
    context,
    agency_id,
    dataflow,
    version,
    key,
    component_id,
    sep = "/"
  )
  query <- filter_query(filters)
  query$mode <- mode
  query$references <- references
  req <- add_query(sdmx_request(path, format), query)
  sdmx_perform(req, format)
}

#' Query metadata reports
#'
#' Retrieve metadatasets from the IMF SDMX API.
#'
#' @param provider_id Metadata provider ID.
#' @param metadataset_id Metadataset ID.
#' @param version Metadataset version.
#' @param detail Metadata detail level.
#' @param format Response format. XML responses are returned as text.
#'
#' @return A nested list for JSON, a character value for XML, or `NULL` for
#'   an HTTP 204 response.
#' @export
#'
#' @examples
#' \dontrun{
#' sdmx_metadata(detail = "allstubs")
#' }
sdmx_metadata <- function(
  provider_id = "*",
  metadataset_id = "*",
  version = "+",
  detail = c("allstubs", "full"),
  format = c("json", "xml")
) {
  validate_scalar_character(provider_id, "provider_id")
  validate_scalar_character(metadataset_id, "metadataset_id")
  validate_scalar_character(version, "version")
  detail <- match.arg(detail)
  format <- match.arg(format)

  path <- paste(
    "metadata/metadataset",
    provider_id,
    metadataset_id,
    version,
    sep = "/"
  )
  req <- add_query(sdmx_request(path, format), list(detail = detail))
  sdmx_perform(req, format)
}

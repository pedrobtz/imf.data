#' IMF SDMX 3.0 API Wrapper
#'
#' Simple wrapper for the IMF SDMX 3.0 API using httr2.
#' Base URL: https://api.imf.org/external/sdmx/3.0
#'
#' @name sdmx_api
NULL

# Base URL for the IMF SDMX 3.0 API
SDMX_BASE_URL <- "https://api.imf.org/external/sdmx/3.0"

#' Create a base request for the IMF SDMX API
#'
#' @param path Character. The API endpoint path.
#' @param format Character. Response format: "json" or "xml". Default is "json".
#' @return An httr2 request object.
#' @keywords internal
sdmx_request <- function(path, format = c("json", "xml")) {
  format <- match.arg(format)
  accept <- if (format == "json") "application/json" else "application/xml"

  httr2::request(SDMX_BASE_URL) |>
    httr2::req_url_path_append(path) |>
    httr2::req_headers(Accept = accept) |>
    httr2::req_user_agent("imf.data R package")
}

#' Perform an API request and return the response
#'
#' @param req An httr2 request object.
#' @param format Character. Response format: "json" or "xml".
#' @return Parsed response (list for JSON, character for XML).
#' @keywords internal
sdmx_perform <- function(req, format = "json") {
  # Fetch from API (httr2 handles caching automatically)
  resp <- httr2::req_perform(req)

  result <- if (format == "json") {
    httr2::resp_body_json(resp, check_type = TRUE, simplifyDataFrame = TRUE)
  } else {
    httr2::resp_body_string(resp)
  }

  result
}

#' Query structural metadata from the IMF SDMX API
#'
#' Retrieve structural metadata such as codelists, dataflows, data structures, etc.
#'
#' @param structure_type Character. Type of structure to query. One of:
#'   "datastructure", "dataflow", "codelist", "conceptscheme", or "*" for all.
#' @param agency_id Character. Agency ID (e.g., "IMF.STA"). Use "*" for all. Default is "*".
#' @param resource_id Character. Resource ID. Use "*" for all. Default is "*".
#' @param version Character. Version. Use "+" for latest stable, "~" for latest. Default is "+".
#' @param detail Character. Level of detail: "full", "allstubs", "referencestubs", etc.
#' @param references Character. Which references to include: "none", "children", "descendants", etc.
#' @param format Character. Response format: "json" or "xml". Default is "json".
#' @return Parsed API response.
#' @export
#' @examples
#' \dontrun{
#' # Get all dataflows
#' sdmx_structure("dataflow")
#'
#' # Get a specific codelist
#' sdmx_structure("codelist", resource_id = "CL_COUNTRY")
#'
#' # Get all codelists as stubs
#' sdmx_structure("codelist", detail = "allstubs")
#' }
sdmx_structure <- function(structure_type = "dataflow",
                           agency_id = "*",
                           resource_id = "*",
                           version = "+",
                           detail = NULL,
                           references = NULL,
                           format = c("json", "xml")) {
  format <- match.arg(format)

  path <- paste("structure", structure_type, agency_id, resource_id, version, sep = "/")

  req <- sdmx_request(path, format)

  if (!is.null(detail)) {
    req <- httr2::req_url_query(req, detail = detail)
  }

  if (!is.null(references)) {
    req <- httr2::req_url_query(req, references = references)
  }

  sdmx_perform(req, format)
}

#' Query data from the IMF SDMX API
#'
#' Retrieve statistical data from the IMF SDMX API.
#'
#' @param dataflow Character. The dataflow ID (e.g., "CPI", "BOP").
#' @param key Character. Dimension filter key (e.g., "USA.CPI.*.IX.M"). Default is "*" (all).
#' @param agency_id Character. Agency ID. Default is "*".
#' @param version Character. Dataflow version. Default is "+" (latest stable).
#' @param context Character. Query context: "dataflow", "datastructure", or "provisionagreement".
#' @param start_period Character. Start period filter (e.g., "2020-01").
#' @param end_period Character. End period filter (e.g., "2023-12").
#' @param first_n_obs Integer. Return only first N observations per series.
#' @param last_n_obs Integer. Return only last N observations per series.
#' @param updated_after Character. ISO datetime. Only return data updated after this time.
#' @param include_history Logical. Include historical versions. Default is FALSE.
#' @param format Character. Response format: "json" or "xml". Default is "json".
#' @return Parsed API response.
#' @export
#' @examples
#' \dontrun{
#' # Get CPI data for USA
#' sdmx_data("CPI", key = "USA.*.*.*.*", agency_id = "IMF.STA")
#'
#' # Get last 12 observations
#' sdmx_data("CPI", key = "USA.*.*.*.*", agency_id = "IMF.STA", last_n_obs = 12)
#' }
sdmx_data <- function(dataflow,
                      key = "*",
                      agency_id = "*",
                      version = "+",
                      context = "dataflow",
                      start_period = NULL,
                      end_period = NULL,
                      first_n_obs = NULL,
                      last_n_obs = NULL,
                      updated_after = NULL,
                      include_history = FALSE,
                      format = c("json", "xml")) {
  format <- match.arg(format)

  path <- paste("data", context, agency_id, dataflow, version, key, sep = "/")

  req <- sdmx_request(path, format)


  # Add time period filter
  if (!is.null(start_period) && !is.null(end_period)) {
    req <- httr2::req_url_query(req,
      `c[TIME_PERIOD]` = paste0("ge:", start_period, "+le:", end_period)
    )
  } else if (!is.null(start_period)) {
    req <- httr2::req_url_query(req, `c[TIME_PERIOD]` = paste0("ge:", start_period))
  } else if (!is.null(end_period)) {
    req <- httr2::req_url_query(req, `c[TIME_PERIOD]` = paste0("le:", end_period))
  }
  if (!is.null(first_n_obs)) {
    req <- httr2::req_url_query(req, firstNObservations = first_n_obs)
  }
  if (!is.null(last_n_obs)) {
    req <- httr2::req_url_query(req, lastNObservations = last_n_obs)
  }
  if (!is.null(updated_after)) {
    req <- httr2::req_url_query(req, updatedAfter = updated_after)
  }
  if (include_history) {
    req <- httr2::req_url_query(req, includeHistory = "true")
  }

  sdmx_perform(req, format)
}

#' Query data availability from the IMF SDMX API
#'
#' Check which data is available without retrieving the actual data.
#' Useful for building data query forms.
#'
#' @param dataflow Character. The dataflow ID.
#' @param key Character. Dimension filter key. Default is "*".
#' @param component_id Character. Component ID to get availability for. Default is "*".
#' @param agency_id Character. Agency ID. Default is "*".
#' @param version Character. Version. Default is "+" (latest stable).
#' @param context Character. Query context. Default is "dataflow".
#' @param mode Character. "exact" or "available". Default is "exact".
#' @param references Character. References to include. Default is "none".
#' @param format Character. Response format: "json" or "xml". Default is "json".
#' @return Parsed API response.
#' @export
#' @examples
#' \dontrun{
#' # Check availability for CPI dataflow
#' sdmx_availability("CPI", agency_id = "IMF.STA")
#' }
sdmx_availability <- function(dataflow,
                              key = "*",
                              component_id = "*",
                              agency_id = "*",
                              version = "+",
                              context = "dataflow",
                              mode = c("exact", "available"),
                              references = "none",
                              format = c("json", "xml")) {
  format <- match.arg(format)
  mode <- match.arg(mode)

  path <- paste("availability", context, agency_id, dataflow, version, key, component_id, sep = "/")

  req <- sdmx_request(path, format) |>
    httr2::req_url_query(mode = mode, references = references)

  sdmx_perform(req, format)
}

#' Query metadata from the IMF SDMX API
#'
#' Retrieve metadatasets from the API.
#'
#' @param provider_id Character. Provider ID. Default is "*".
#' @param metadataset_id Character. Metadataset ID. Default is "*".
#' @param version Character. Version. Default is "+" (latest stable).
#' @param detail Character. Detail level: "full" or "allstubs". Default is "allstubs".
#' @param format Character. Response format: "json" or "xml". Default is "json".
#' @return Parsed API response.
#' @export
#' @examples
#' \dontrun{
#' # Get all metadatasets
#' sdmx_metadata()
#' }
sdmx_metadata <- function(provider_id = "*",
                          metadataset_id = "*",
                          version = "+",
                          detail = c("allstubs", "full"),
                          format = c("json", "xml")) {
  format <- match.arg(format)
  detail <- match.arg(detail)

  path <- paste("metadata/metadataset", provider_id, metadataset_id, version, sep = "/")

  req <- sdmx_request(path, format) |>
    httr2::req_url_query(detail = detail)

  sdmx_perform(req, format)
}

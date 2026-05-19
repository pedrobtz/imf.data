#' Reorder columns by atomicity

#' List available IMF datasets
#'
#' Returns a data frame of all available datasets (dataflows) from the IMF SDMX API.
#'
#' @param agency_id Character. Agency ID filter. Default is "*" (all agencies).
#' @param atomic_only Logical. If TRUE (default), return only atomic columns (character, numeric, integer, logical). If FALSE, return all columns including list-columns.
#' @return A data frame (or data.table if installed) with columns: id, name, description, version, agencyID, structure, dsd_id.
#' @export
#' @examples
#' \dontrun{
#' # List all datasets
#' datasets <- list_datasets()
#'
#' # Filter by agency
#' datasets <- list_datasets(agency_id = "IMF.STA")
#'
#' # Get all columns including list-columns
#' datasets <- list_datasets(atomic_only = FALSE)
#' }
list_datasets <- function() {

  sdmx_structure("dataflow") |>
    _$data$dataflows |>
    as_tibble_recursive() |>
    add_dsd_id() |>
    reorder_columns() |>
    sort_by(~id)
}

#' List all data structures
#'
#' Returns a data frame of all data structures from the IMF SDMX API.
#'
#' @return A data frame (or data.table if installed) with columns for data structure information.
#' @export
#' @examples
#' \dontrun{
#' # List all data structures
#' dims <- list_dimensions()
#' }
list_dimensions <- function() {
  sdmx_structure("datastructure") |>
    _$data$dataStructures |>
    as_tibble_recursive() |>
    reorder_columns() |>
    sort_by(~id)
}

#' List all codelists
#'
#' Returns a data frame of all codelists from the IMF SDMX API.
#' Codelists contain standardized value sets (e.g., countries, frequencies, units).
#'
#' @param agency_id Character. Agency ID (e.g., "IMF.STA"). Use "*" for all. Default is "*".
#' @param resource_id Character. Resource ID (e.g., "CL_COUNTRY"). Use "*" for all. Default is "*".
#' @return A data frame with columns for codelist information.
#' @export
#' @examples
#' \dontrun{
#' # List all codelists
#' codelists <- list_codelists()
#'
#' # Get a specific codelist
#' countries <- list_codelists(resource_id = "CL_COUNTRY")
#'
#' # Get all codelists from a specific agency
#' sta_codelists <- list_codelists(agency_id = "IMF.STA")
#' }
list_codelists <- function(agency_id = "*", resource_id = "*") {
  sdmx_structure("codelist", agency_id = agency_id, resource_id = resource_id) |>
    _$data$codelists |>
    as_tibble_recursive() |>
    reorder_columns() |>
    sort_by(~id)
}


#' Extract dimensions from data structure
#'
#' @param dsd A data structure object.
#' @return A data frame with dimension information.
#' @keywords internal
extract_dimensions <- function(dsd) {
  if (is.null(dsd)) {
    stop("Data structure not found")
  }

  dims <- dsd$dataStructureComponents$dimensionList$dimensions
  time_dims <- dsd$dataStructureComponents$dimensionList$timeDimensions

  # Combine regular dimensions and time dimensions
  all_dims <- c(dims, time_dims)

  if (is.null(all_dims) || length(all_dims) == 0) {
    return(data.frame(
      id = character(),
      position = integer(),
      stringsAsFactors = FALSE
    ))
  }

  data.frame(
    id = sapply(all_dims, function(d) d$id %||% NA_character_),
    position = sapply(all_dims, function(d) d$position %||% NA_integer_),
    stringsAsFactors = FALSE,
    row.names = NULL
  )
}

#' Extract codelist ID from enumeration URN
#'
#' @param urn Character. The enumeration URN.
#' @return Character. The codelist ID or NA if not found.
#' @keywords internal
extract_codelist_id <- function(urn) {
  if (is.null(urn) || is.na(urn) || urn == "") {
    return(NA_character_)
  }
  # Pattern: urn:sdmx:org.sdmx.infomodel.codelist.Codelist=IMF.STA:CL_COUNTRY(1.0)
  match <- regmatches(urn, regexec(":([^:()]+)\\([^)]+\\)$", urn))[[1]]
  if (length(match) >= 2) {
    match[2]
  } else {
    NA_character_
  }
}

#' Null-coalescing operator
#' @param x Left operand.
#' @param y Right operand (default value).
#' @return x if not NULL, otherwise y.
#' @keywords internal
`%||%` <- function(x, y) if (is.null(x)) y else x

#' Extract DSD ID from structure URN
#'
#' Extracts the data structure definition ID from a full URN.
#' Example: "urn:sdmx:org.sdmx.infomodel.datastructure.DataStructure=IMF.STA:DSD_IMTS(1.0+.0)"
#' returns "DSD_IMTS".
#'
#' @param urn Character. The full structure URN.
#' @return Character. The DSD ID or NA if not found.
#' @keywords internal
extract_dsd_id <- function(urn) {
  if (is.null(urn) || is.na(urn) || urn == "") {
    return(NA_character_)
  }
  # Pattern: ...AgencyID:ResourceID(Version)

  match <- regmatches(urn, regexec(":([^:()]+)\\([^)]+\\)$", urn))[[1]]
  if (length(match) >= 2) {
    match[2]
  } else {
    NA_character_
  }
}

#' Add DSD ID column to dataflows
#'
#' @param df A data frame containing a 'structure' column with URNs.
#' @return A data frame with an added 'dsd_id' column extracted from the structure URN.
#' @keywords internal
add_dsd_id <- function(df) {
  df$dsd_id <- sapply(df$structure, extract_dsd_id)
  df
}

#' Convert to tibble recursively
#'
#' Converts a data frame to tibble and recursively converts any nested data frames
#' in list columns to tibbles as well.
#'
#' @param x A data frame or list.
#' @return A tibble with nested data frames also converted to tibbles.
#' @keywords internal
as_tibble_recursive <- function(x) {
  if (is.data.frame(x)) {
    # Convert the data frame to tibble and recurse into list columns
    result <- tibble::as_tibble(x)
    result[] <- lapply(result, as_tibble_recursive)
    result
  } else if (is.list(x)) {
    # Recurse into list elements
    lapply(x, as_tibble_recursive)
  } else {
    # Return atomic values as-is
    x
  }
}

#' Reorder columns by atomicity
#'
#' @param df A data frame.
#' @return A data frame with atomic columns first and non-atomic columns at the end.
#' @keywords internal
reorder_columns <- function(df) {
  # Move non-atomic columns to the end
  atomic_cols <- names(df)[sapply(df, is.atomic)]
  non_atomic_cols <- names(df)[!sapply(df, is.atomic)]
  df[, c(atomic_cols, non_atomic_cols)]
}

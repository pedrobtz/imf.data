# Functions in this file intentionally use helpers from sdmx_api.R.
# nolint start: object_usage_linter.

empty_tibble <- function(columns) {
  values <- lapply(columns, function(type) {
    switch(
      type,
      character = character(),
      integer = integer(),
      numeric = numeric(),
      logical = logical()
    )
  })
  names(values) <- names(columns)
  tibble::as_tibble(values)
}

value_or_na <- function(x) {
  if (is.null(x) || !length(x)) NA_character_ else as.character(x[[1L]])
}

first_existing <- function(x, names) {
  for (name in names) {
    if (!is.null(x[[name]])) {
      return(x[[name]])
    }
  }
  NULL
}

parse_urn <- function(urn) {
  if (is.null(urn) || length(urn) != 1L || is.na(urn)) {
    return(list(
      agency = NA_character_,
      id = NA_character_,
      version = NA_character_,
      item = NA_character_
    ))
  }
  matched <- regexec(
    "=([^:]+):([^()]+)\\(([^)]+)\\)(?:\\.([^.]+))?$",
    urn,
    perl = TRUE
  )
  parts <- regmatches(urn, matched)[[1L]]
  if (length(parts) < 4L) {
    return(list(
      agency = NA_character_,
      id = NA_character_,
      version = NA_character_,
      item = NA_character_
    ))
  }
  list(
    agency = parts[[2L]],
    id = parts[[3L]],
    version = parts[[4L]],
    item = if (length(parts) == 5L) parts[[5L]] else NA_character_
  )
}

extract_concept_id <- function(urn) {
  parse_urn(urn)$item
}

version_matches <- function(reference, candidate) {
  if (is.na(reference) || is.na(candidate)) {
    return(FALSE)
  }
  if (identical(reference, "+") || identical(reference, candidate)) {
    return(TRUE)
  }
  plus <- regexpr("+", reference, fixed = TRUE)[[1L]]
  if (plus < 1L) {
    return(FALSE)
  }
  prefix <- substr(reference, 1L, plus - 1L)
  suffix <- substr(reference, plus + 1L, nchar(reference))
  startsWith(candidate, prefix) && endsWith(candidate, suffix)
}

find_concept <- function(concept_schemes, concept_identity) {
  identity <- parse_urn(concept_identity)
  if (
    is.null(concept_schemes) ||
      anyNA(unlist(identity[c("agency", "id", "version", "item")]))
  ) {
    return(NULL)
  }

  schemes <- Filter(
    function(scheme) {
      identical(scheme$agencyID, identity$agency) &&
        identical(scheme$id, identity$id) &&
        version_matches(identity$version, scheme$version)
    },
    concept_schemes
  )
  if (!length(schemes)) {
    return(NULL)
  }
  concepts <- unlist(
    lapply(schemes, function(scheme) scheme$concepts),
    recursive = FALSE
  )
  matches <- Filter(
    function(concept) identical(concept$id, identity$item),
    concepts
  )
  if (!length(matches)) NULL else matches[[1L]]
}

extract_dataflow <- function(response) {
  flows <- response$data$dataflows
  if (is.null(flows) || !length(flows)) {
    return(NULL)
  }
  flows[[1L]]
}

resolve_dsd <- function(dataflow, agency_id, version) {
  flow_response <- sdmx_structure(
    "dataflow",
    agency_id = agency_id,
    resource_id = dataflow,
    version = version,
    references = "datastructure"
  )
  flow <- extract_dataflow(flow_response)
  if (is.null(flow)) {
    stop(
      sprintf(
        "Dataflow `%s:%s` was not found.",
        agency_id,
        dataflow
      ),
      call. = FALSE
    )
  }
  dsd_urn <- parse_urn(flow$structure)
  if (is.na(dsd_urn$id)) {
    stop(
      "The dataflow response does not identify a data structure.",
      call. = FALSE
    )
  }
  structure_response <- sdmx_structure(
    "datastructure",
    agency_id = dsd_urn$agency,
    resource_id = dsd_urn$id,
    version = dsd_urn$version,
    references = "children"
  )
  structures <- structure_response$data$dataStructures
  if (is.null(structures) || !length(structures)) {
    stop(
      sprintf("Data structure `%s` was not found.", dsd_urn$id),
      call. = FALSE
    )
  }
  list(
    flow = flow,
    dsd = structures[[1L]],
    concepts = structure_response$data$conceptSchemes
  )
}

dimension_records <- function(resolved) {
  descriptor <- resolved$dsd$dataStructureComponents$dimensionList
  dimensions <- c(descriptor$dimensions, descriptor$timeDimensions)
  records <- lapply(dimensions, function(dimension) {
    concept <- find_concept(resolved$concepts, dimension$conceptIdentity)
    enumeration <- concept$coreRepresentation$enumeration
    codelist <- parse_urn(enumeration)
    concept_name <- first_existing(concept, c("name", "id"))
    if (is.null(concept_name)) {
      concept_name <- dimension$id
    }
    list(
      position = as.integer(dimension$position),
      id = value_or_na(dimension$id),
      type = value_or_na(dimension$type),
      name = value_or_na(concept_name),
      codelist_agency = codelist$agency,
      codelist_id = codelist$id,
      codelist_version = codelist$version
    )
  })
  if (!length(records)) {
    return(empty_tibble(c(
      position = "integer",
      id = "character",
      type = "character",
      name = "character",
      codelist_agency = "character",
      codelist_id = "character",
      codelist_version = "character"
    )))
  }
  out <- do.call(
    rbind,
    lapply(records, function(record) {
      data.frame(record, stringsAsFactors = FALSE, check.names = FALSE)
    })
  )
  out$position <- as.integer(out$position)
  out <- out[order(out$position), , drop = FALSE]
  rownames(out) <- NULL
  tibble::as_tibble(out)
}

#' List IMF datasets
#'
#' Return the available IMF SDMX dataflows as a stable, tidy catalogue.
#'
#' @param agency_id Maintainer ID. Use `"*"` for all maintainers.
#'
#' @return A tibble with `agency`, `id`, `version`, `name`, `description`,
#'   and `dsd_id` columns.
#' @export
#'
#' @examples
#' \dontrun{
#' datasets <- list_datasets("IMF.STA")
#' }
list_datasets <- function(agency_id = "*") {
  validate_scalar_character(agency_id, "agency_id")
  response <- sdmx_structure(
    "dataflow",
    agency_id = agency_id,
    detail = "referencestubs"
  )
  flows <- response$data$dataflows
  if (is.null(flows) || !length(flows)) {
    return(empty_tibble(c(
      agency = "character",
      id = "character",
      version = "character",
      name = "character",
      description = "character",
      dsd_id = "character"
    )))
  }
  rows <- lapply(flows, function(flow) {
    data.frame(
      agency = value_or_na(flow$agencyID),
      id = value_or_na(flow$id),
      version = value_or_na(flow$version),
      name = value_or_na(flow$name),
      description = value_or_na(flow$description),
      dsd_id = parse_urn(flow$structure)$id,
      stringsAsFactors = FALSE
    )
  })
  out <- do.call(rbind, rows)
  out <- out[order(out$agency, out$id), , drop = FALSE]
  rownames(out) <- NULL
  tibble::as_tibble(out)
}

#' List the dimensions of an IMF dataset
#'
#' Resolve a dataflow's data structure and return its dimensions in SDMX key
#' order, including the associated codelist where one is declared.
#'
#' @param dataflow Dataflow ID.
#' @param agency_id Maintainer ID.
#' @param version Dataflow version. `"+"` selects the latest stable version.
#'
#' @return A tibble describing each dimension and its codelist.
#' @export
#'
#' @examples
#' \dontrun{
#' list_dimensions("CPI")
#' }
list_dimensions <- function(dataflow, agency_id = "IMF.STA", version = "+") {
  validate_scalar_character(dataflow, "dataflow")
  validate_scalar_character(agency_id, "agency_id")
  validate_scalar_character(version, "version")
  dimension_records(resolve_dsd(dataflow, agency_id, version))
}

availability_values <- function(response, dimension) {
  constraints <- response$data$dataConstraints
  if (is.null(constraints) || !length(constraints)) {
    return(character())
  }
  values <- character()
  for (constraint in constraints) {
    regions <- constraint$cubeRegions
    if (is.null(regions)) {
      next
    }
    for (region in regions) {
      components <- region$components
      if (is.null(components)) {
        next
      }
      for (component in components) {
        if (!identical(component$id, dimension) || is.null(component$values)) {
          next
        }
        values <- c(
          values,
          vapply(
            component$values,
            function(value) {
              value_or_na(first_existing(value, c("value", "id")))
            },
            character(1)
          )
        )
      }
    }
  }
  unique(values[!is.na(values)])
}

codelist_labels <- function(agency, id, version) {
  if (is.na(agency) || is.na(id)) {
    return(empty_tibble(c(
      code = "character",
      name = "character",
      description = "character"
    )))
  }
  response <- sdmx_structure(
    "codelist",
    agency_id = agency,
    resource_id = id,
    version = version
  )
  codelists <- response$data$codelists
  if (is.null(codelists) || !length(codelists)) {
    return(empty_tibble(c(
      code = "character",
      name = "character",
      description = "character"
    )))
  }
  codes <- codelists[[1L]]$codes
  if (is.null(codes) || !length(codes)) {
    return(empty_tibble(c(
      code = "character",
      name = "character",
      description = "character"
    )))
  }
  tibble::as_tibble(do.call(
    rbind,
    lapply(codes, function(code) {
      data.frame(
        code = value_or_na(code$id),
        name = value_or_na(code$name),
        description = value_or_na(code$description),
        stringsAsFactors = FALSE
      )
    })
  ))
}

#' List available values for a dataset dimension
#'
#' Use the IMF availability endpoint to return the codes that remain valid for
#' a dimension, optionally constrained by selections for other dimensions.
#'
#' @param dataflow Dataflow ID.
#' @param dimension Dimension ID.
#' @param filters Named list of selections for other dimensions.
#' @param agency_id Maintainer ID.
#' @param version Dataflow version.
#'
#' @return A tibble with `code`, `name`, and `description` columns.
#' @export
#'
#' @examples
#' \dontrun{
#' list_dimension_values(
#'   "CPI",
#'   "FREQUENCY",
#'   filters = list(COUNTRY = "USA")
#' )
#' }
list_dimension_values <- function(
  dataflow,
  dimension,
  filters = list(),
  agency_id = "IMF.STA",
  version = "+"
) {
  validate_scalar_character(dimension, "dimension")
  validate_filters(filters)
  dimensions <- list_dimensions(dataflow, agency_id, version)
  index <- match(dimension, dimensions$id)
  if (is.na(index)) {
    stop(
      sprintf(
        "Unknown dimension `%s`. Available dimensions: %s.",
        dimension,
        paste(dimensions$id, collapse = ", ")
      ),
      call. = FALSE
    )
  }
  response <- sdmx_availability(
    dataflow,
    component_id = dimension,
    agency_id = agency_id,
    version = version,
    filters = filters,
    mode = "available"
  )
  values <- availability_values(response, dimension)
  if (!length(values)) {
    return(empty_tibble(c(
      code = "character",
      name = "character",
      description = "character"
    )))
  }
  labels <- codelist_labels(
    dimensions$codelist_agency[[index]],
    dimensions$codelist_id[[index]],
    dimensions$codelist_version[[index]]
  )
  out <- data.frame(
    code = values,
    name = NA_character_,
    description = NA_character_,
    stringsAsFactors = FALSE
  )
  matched <- match(out$code, labels$code)
  found <- !is.na(matched)
  out$name[found] <- labels$name[matched[found]]
  out$description[found] <- labels$description[matched[found]]
  tibble::as_tibble(out)
}

malformed_response <- function(format, ...) {
  stop(
    sprintf(paste0("Malformed SDMX response: ", format), ...),
    call. = FALSE
  )
}

zero_based_position <- function(index, label) {
  valid_numeric <- is.numeric(index) &&
    length(index) == 1L &&
    !is.na(index) &&
    is.finite(index) &&
    index >= 0 &&
    index %% 1 == 0
  valid_character <- is.character(index) &&
    length(index) == 1L &&
    !is.na(index) &&
    grepl("^[0-9]+$", index)
  if (!valid_numeric && !valid_character) {
    malformed_response("%s must be a non-negative whole number.", label)
  }
  value <- as.numeric(index)
  if (value >= .Machine$integer.max) {
    malformed_response("%s is too large.", label)
  }
  as.integer(value) + 1L
}

dimension_value <- function(dimension, index) {
  if (is.null(index) || length(index) == 1L && is.na(index)) {
    return(NA_character_)
  }
  dimension_id <- value_or_na(dimension$id)
  label <- if (is.na(dimension_id)) {
    "A dimension index"
  } else {
    sprintf("The index for dimension `%s`", dimension_id)
  }
  position <- zero_based_position(index, label)
  values <- dimension$values
  if (is.null(values) || position > length(values)) {
    malformed_response(
      "%s points outside its declared values.",
      label
    )
  }
  value_or_na(first_existing(values[[position]], c("id", "value", "name")))
}

decode_key <- function(key, dimensions) {
  if (!length(dimensions)) {
    return(character())
  }
  if (!is.character(key) || length(key) != 1L || is.na(key)) {
    malformed_response("An indexed key is not one character value.")
  }
  indices <- strsplit(key, ":", fixed = TRUE)[[1L]]
  if (length(indices) != length(dimensions)) {
    malformed_response(
      "key `%s` contains %d indices but its structure declares %d dimensions.",
      key,
      length(indices),
      length(dimensions)
    )
  }
  decoded <- vapply(
    seq_along(dimensions),
    function(i) {
      dimension_value(dimensions[[i]], indices[[i]])
    },
    character(1)
  )
  names(decoded) <- vapply(
    dimensions,
    function(dimension) {
      value_or_na(dimension$id)
    },
    character(1)
  )
  decoded
}

decode_attribute <- function(value, definition) {
  if (is.null(value) || !length(value)) {
    return(NA_character_)
  }
  if (
    is.numeric(value) &&
      !is.null(definition$values) &&
      length(definition$values)
  ) {
    return(dimension_value(definition, value))
  }
  as.character(value[[1L]])
}

decode_attributes <- function(values, definitions) {
  if (!length(definitions)) {
    return(character())
  }
  decoded <- vapply(
    seq_along(definitions),
    function(i) {
      value <- if (i <= length(values)) values[[i]] else NULL
      decode_attribute(value, definitions[[i]])
    },
    character(1)
  )
  names(decoded) <- vapply(
    definitions,
    function(definition) {
      value_or_na(definition$id)
    },
    character(1)
  )
  decoded
}

component_names <- function(structures, path) {
  names <- unlist(
    lapply(structures, function(structure) {
      components <- structure[[path[[1L]]]][[path[[2L]]]]
      if (is.null(components)) {
        return(character())
      }
      vapply(
        components,
        function(component) value_or_na(component$id),
        character(1)
      )
    }),
    use.names = FALSE
  )
  unique(names[!is.na(names)])
}

empty_data_result <- function(structures, attributes) {
  dimension_names <- unique(c(
    component_names(structures, c("dimensions", "series")),
    component_names(structures, c("dimensions", "observation"))
  ))
  measure_names <- component_names(
    structures,
    c("measures", "observation")
  )
  if (!length(measure_names)) {
    measure_names <- "OBS_VALUE"
  }
  columns <- rep("character", length(dimension_names))
  names(columns) <- dimension_names
  measure_columns <- rep("numeric", length(measure_names))
  names(measure_columns) <- measure_names
  columns <- c(columns, measure_columns)
  if (length(attributes)) {
    attribute_columns <- rep("character", length(attributes))
    names(attribute_columns) <- attributes
    columns <- c(columns, attribute_columns)
  }
  empty_tibble(columns)
}

parse_measure <- function(value, definition) {
  text <- value_or_na(value)
  if (is.na(text)) {
    return(NA_real_)
  }
  numeric_pattern <- paste0(
    "^[+-]?((([0-9]+)(\\.[0-9]*)?)|(\\.[0-9]+))",
    "([eE][+-]?[0-9]+)?$"
  )
  measure_id <- value_or_na(definition$id)
  if (!grepl(numeric_pattern, text)) {
    malformed_response(
      "measure `%s` contains non-numeric value %s.",
      measure_id,
      encodeString(text, quote = "\"")
    )
  }
  as.numeric(text)
}

bind_data_rows <- function(rows, measure_names) {
  column_names <- unique(unlist(lapply(rows, names), use.names = FALSE))
  frames <- lapply(rows, function(row) {
    missing <- setdiff(column_names, names(row))
    for (name in missing) {
      row[[name]] <- if (name %in% measure_names) {
        NA_real_
      } else {
        NA_character_
      }
    }
    as.data.frame(
      row[column_names],
      stringsAsFactors = FALSE,
      check.names = FALSE
    )
  })
  out <- do.call(rbind, frames)
  for (measure in intersect(measure_names, names(out))) {
    out[[measure]] <- as.numeric(out[[measure]])
  }
  rownames(out) <- NULL
  tibble::as_tibble(out)
}

parse_data_message <- function(response, attributes = character()) {
  if (is.null(response)) {
    return(empty_data_result(list(), attributes))
  }
  structures <- response$data$structures
  data_sets <- response$data$dataSets
  if (is.null(data_sets) || !length(data_sets)) {
    return(empty_data_result(structures, attributes))
  }
  if (is.null(structures) || !length(structures)) {
    malformed_response("data sets were returned without a structure.")
  }
  measure_names <- component_names(structures, c("measures", "observation"))
  rows <- list()
  row_index <- 0L
  for (data_set in data_sets) {
    structure_index <- zero_based_position(
      if (is.null(data_set$structure)) 0L else data_set$structure,
      "A data structure index"
    )
    if (structure_index > length(structures)) {
      malformed_response(
        "a data structure index points outside the structures array."
      )
    }
    structure <- structures[[structure_index]]
    series <- data_set$series
    if (is.null(series) || !length(series)) {
      next
    }
    if (is.null(names(series)) || any(!nzchar(names(series)))) {
      malformed_response("the series collection contains an unkeyed series.")
    }
    series_dimensions <- structure$dimensions$series
    observation_dimensions <- structure$dimensions$observation
    measure_definitions <- structure$measures$observation
    series_attributes <- structure$attributes$series
    observation_attributes <- structure$attributes$observation
    measure_count <- length(measure_definitions)

    for (series_key in names(series)) {
      series_item <- series[[series_key]]
      series_values <- decode_key(series_key, series_dimensions)
      series_attribute_values <- decode_attributes(
        series_item$attributes,
        series_attributes
      )
      observations <- series_item$observations
      if (is.null(observations) || !length(observations)) {
        next
      }
      if (is.null(names(observations)) || any(!nzchar(names(observations)))) {
        malformed_response(
          "a series contains an observation without an indexed key."
        )
      }
      for (observation_key in names(observations)) {
        observation <- observations[[observation_key]]
        if (!is.list(observation)) {
          malformed_response("an observation is not an indexed value array.")
        }
        observation_values <- decode_key(
          observation_key,
          observation_dimensions
        )
        measures <- observation[seq_len(measure_count)]
        measure_values <- vapply(
          seq_along(measure_definitions),
          function(i) {
            parse_measure(measures[[i]], measure_definitions[[i]])
          },
          numeric(1)
        )
        names(measure_values) <- vapply(
          measure_definitions,
          function(definition) value_or_na(definition$id),
          character(1)
        )
        attribute_values <- if (measure_count < length(observation)) {
          observation[seq.int(measure_count + 1L, length(observation))]
        } else {
          list()
        }
        observation_attribute_values <- decode_attributes(
          attribute_values,
          observation_attributes
        )
        all_attributes <- c(
          series_attribute_values,
          observation_attribute_values
        )
        selected_attributes <- rep(NA_character_, length(attributes))
        names(selected_attributes) <- attributes
        present_attributes <- intersect(attributes, names(all_attributes))
        selected_attributes[present_attributes] <-
          all_attributes[present_attributes]
        row_index <- row_index + 1L
        rows[[row_index]] <- c(
          as.list(series_values),
          as.list(observation_values),
          as.list(measure_values),
          as.list(selected_attributes)
        )
      }
    }
  }
  if (!length(rows)) {
    return(empty_data_result(structures, attributes))
  }
  bind_data_rows(rows, measure_names)
}

available_attributes <- function(response) {
  if (
    is.null(response$data$structures) ||
      !length(response$data$structures)
  ) {
    return(character())
  }
  structures <- response$data$structures
  unique(c(
    component_names(structures, c("attributes", "series")),
    component_names(structures, c("attributes", "observation"))
  )
  )
}

#' Download IMF data as a tidy data frame
#'
#' Query a dataflow with named dimension filters and decode the indexed SDMX
#' response into one row per observation.
#'
#' @param dataflow Dataflow ID.
#' @param filters Named list of dimension selections.
#' @param agency_id Maintainer ID.
#' @param version Dataflow version.
#' @param start_period,end_period Optional SDMX period bounds.
#' @param first_n_obs,last_n_obs Optional observation limits per series.
#' @param attributes Character vector of series or observation attributes to
#'   include in the result.
#'
#' @return A tibble containing dimension columns, `TIME_PERIOD`, `OBS_VALUE`,
#'   and any requested attributes.
#' @export
#'
#' @examples
#' \dontrun{
#' get_data(
#'   "CPI",
#'   filters = list(
#'     COUNTRY = "USA",
#'     INDEX_TYPE = "CPI",
#'     COICOP_1999 = "_T",
#'     TYPE_OF_TRANSFORMATION = "IX",
#'     FREQUENCY = "M"
#'   ),
#'   last_n_obs = 2
#' )
#' }
get_data <- function(
  dataflow,
  filters = list(),
  agency_id = "IMF.STA",
  version = "+",
  start_period = NULL,
  end_period = NULL,
  first_n_obs = NULL,
  last_n_obs = NULL,
  attributes = character()
) {
  validate_filters(filters)
  if (!is.character(attributes) || anyNA(attributes)) {
    stop("`attributes` must be a character vector.", call. = FALSE)
  }
  response <- sdmx_data(
    dataflow,
    agency_id = agency_id,
    version = version,
    filters = filters,
    start_period = start_period,
    end_period = end_period,
    first_n_obs = first_n_obs,
    last_n_obs = last_n_obs
  )
  if (is.null(response)) {
    warning("The IMF API returned no content for this query.", call. = FALSE)
    return(empty_tibble(c(
      TIME_PERIOD = "character",
      OBS_VALUE = "numeric"
    )))
  }
  valid_attributes <- available_attributes(response)
  unknown <- setdiff(attributes, valid_attributes)
  if (length(unknown)) {
    stop(
      sprintf(
        "Unknown attributes: %s. Available attributes: %s.",
        paste(unknown, collapse = ", "),
        paste(valid_attributes, collapse = ", ")
      ),
      call. = FALSE
    )
  }
  result <- parse_data_message(response, attributes)
  if (!nrow(result)) {
    warning("No observations matched the query.", call. = FALSE)
  }
  result
}

# nolint end

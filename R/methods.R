
#' Calls API endpoint 'Dataflow'
#'
#' @returns a list with content of 'Dataflow' response.
#' @examples
#' DF <- mt_dataflow()
#'
#' @export
mt_dataflow <- local({
  .data <- NULL
  function(){
    if(is.null(.data)){
      resp <- get_request(url = build_api_path("Dataflow"))
      if(is.null(resp) || is.character(resp)){
        return(null_response(resp))
      }

      .data <<- resp$Structure$Dataflows$Dataflow
    }
    return(.data)
  }
})


#' Calls API endpoint 'DataStructure'
#'
#' @param id is a Dataset Series identifier.
#' @returns a list with content of 'DataStructure' response.
#'
#' @examples
#' DOT <- mt_data_structure("DOT")
#'
#' @export
mt_data_structure <- function(id){
  ls_dts <- mt_dataflow()
  if(is.null(ls_dts)) return(invisible(NULL))

  stopifnot(is.character(id), length(id) == 1L)

  ls_ids <- sapply(ls_dts,function(x)x$KeyFamilyRef$KeyFamilyID)

  if(!id %in% ls_ids)
    stop(sprintf("DatabaseID `%s` not found in Dataflow datasets", id))
  resp <- get_request(url = build_api_path(paste0("DataStructure/", id)))
  if(is.null(resp) || is.character(resp)){
    return(null_response(resp))
  }
  return(resp)
}


#' Calls API endpoint 'CompactData' to get Dataset time series
#'
#' @param id is a Dataset Series identifier.
#' @param dimensions is a named list with the dimensions query.
#' @param start_period is time series start date with formats.
#' @param end_period is time series end date with format.
#' See Details for the valid formats.
#' @returns a list with content of 'CompactData' response.
#'
#' @details
#' The 'start_period' and 'end_pariod' parameters should have formats:
#' 'yyyy', 'yyyy-mm' or 'yyyy-mm-dd'.
#'
#' @examples
#' IFS <- mt_compact_data("IFS", list("M", "GB", "PMP_IX"))
#' IFS <- mt_compact_data("IFS", list("M", "GB", "PMP_IX"), start_period = "2000-01")
#' DOT <- mt_compact_data("DOT", list("M","GB", "TMG_CIF_USD", c("B0","W00")))
#'
#' @export
mt_compact_data <- function(id,
                            dimensions,
                            start_period = NA,
                            end_period = NA){
  query <- build_query(dimensions)
  dates <- na.omit(c("startPeriod=" = start_period, "endPeriod=" = end_period))
  dates <- paste0(names(dates), dates, collapse = "&")
  path <- sprintf("CompactData/%s/%s", id, query)
  path <- paste(path, dates, sep = "?")
  resp <- get_request(url = build_api_path(path))
  if(is.null(resp) || is.character(resp)){
    return(null_response(resp))
  }
  return(resp)
}


build_query <- function(dimensions){
  x <- lapply(dimensions, paste,collapse = "+")
  x <- paste(unlist(x), collapse = ".")
  return(x)
}

null_response <- function(msg = NULL){
  if(is.null(msg))
    message("Data service did not respond.")
  else
    message("Data service response:","\n", msg)
  return(invisible(NULL))
}


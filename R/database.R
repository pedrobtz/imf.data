
#' List all available Time Series Datasets
#'
#' @return a data.frame with columns 'Id' and 'Description'.
#' @export
#'
#' @examples
#' d <- list_datasets()
#' head(d)

list_datasets <- function(){
  x <- mt_dataflow()
  if(is.null(x)) return(invisible(NULL))
  res <- data.frame(ID = sapply(x,function(y)y$KeyFamilyRef$KeyFamilyID),
                    Description = sapply(x,function(y)y$Name$`#text`))
  res <- res[ order(res$ID), ]
  rownames(res) <- NULL
  return(res)
}


#' Loads Time Series Datasets
#'
#' @param id is character vector of Dataset Series identifier.
#' @param use_cache is Boolean, defaults to TRUE, if TRUE it reloads the Dataset
#' from cached values.
#' @return a dataset object for the time-series identifier, i.e. a list containing
#' a list 'dimensions' of data.frames with the valid dimensions values, and a
#' function 'get_series' to retrieve time-series data.
#'
#' @examples
#' IFS <- load_datasets("IFS")
#' DOT <- load_datasets("DOT")
#'
#' DOT$get_series(freq = "M",
#'                ref_area ="GB",
#'                indicator = "TMG_CIF_USD",
#'                counterpart_area = c("B0","W00"),
#'                start_period = "2022-01-01",
#'                end_period = "2022-12-31")
#'
#' DTS <- load_datasets(c("DOT","IFS"))
#'
#' @name load_datasets
#' @export
load_datasets <- local({

  .DataStr <- list()
  .DimNames <- list()
  .DimValues <- list()

  get0 <- function(params, id){

    dimensions <- params[names(.DimValues[[id]])]

    for(i in names(dimensions))
      validate_dimension_values(accepted = .DimValues[[id]],
                                dimension = i,
                                value = dimensions[[i]])

    res <- mt_compact_data(id = id,
                           dimensions = dimensions,
                           start_period = params$start_period,
                           end_period = params$end_period)

    if(is.null(res)) return(invisible(NULL))

    series <- res$CompactData$DataSet$Series

    if(is.null(series)){
      x <- .last_response()
      path <- sub("^.+(CompactData/.+)$", "\\1",x$url)
      warning(sprintf("Request '%s' returned empty data", path), call. = FALSE)
      return(invisible(NULL))
    }

    series <- cbind_series(transform_series(series, dimensions))
    row.names(series) <- NULL
    return(series)
  }

  function(id, use_cache = TRUE){

    if(length(id) > 1L){
      names(id) <- id
      return(lapply(id, function(x){
        try(load_datasets(x, use_cache), silent = FALSE)
      }))
    }

    if(is.null(.DataStr[[id]]) || isFALSE(use_cache)){
      data_str <- mt_data_structure(id)
      if(!is.null(data_str)){

        dim_name <- extract_dimension_names(data_str)
        dim_values <- extract_dimension_values(data_str, dim_name)

        .DataStr[[id]] <<- data_str
        .DimNames[[id]] <<- dim_name
        .DimValues[[id]] <<- dim_values
        dim_name0 <- .DimNames[[id]]$Name

      } else {
        dim_values <- NULL
        dim_name0 <- NULL
      }
    } else {
      dim_values <- .DimValues[[id]]
      dim_name0 <- .DimNames[[id]]$Name
    }

    get_series <- make_get_function(dim_name0, id)

    mts <- list(id = id,
                dimensions = dim_values,
                get_series = get_series)

    class(mts) <- c("imf_db", class(mts))

    return(mts)
  }
})


extract_dimension_names <- function(data_str){
  d <- rbind_list(data_str$Structure$KeyFamilies$KeyFamily$Components$Dimension)
  res <- d[, c("@codelist","@conceptRef") ]
  colnames(res) <- c("Codelist", "Name")
  res$Name <- tolower(res$Name)
  res$Num <- seq_along(res$Name)
  row.names(res) <- NULL
  return(res)
}


extract_dimension_values <- function(data_str, dimensions){
  ls_values <- lapply(data_str$Structure$CodeLists$CodeList,"[[","Code")
  names(ls_values) <- sapply(data_str$Structure$CodeLists$CodeList,"[[", "@id")
  ls_values <- lapply(ls_values, rbind_list)

  ls_values <- ls_values[dimensions$Codelist]
  names(ls_values) <- dimensions$Name

  lapply(ls_values, function(x){
    x <- x[, c("@value","Description.#text")]
    colnames(x) <- c("Value","Description")
    row.names(x) <- NULL
    return(x)
  })
}


validate_dimension_values <- function(accepted, dimension, value){

  accepted_values <- accepted[[dimension]]$Value

  i <- which(!value %in% accepted_values)

  if(length(i) > 0L){
    j <- paste0(value[i], collapse = ", ")
    stop(sprintf("Invalid value(s) '%s' for dimension '%s'.", j, dimension))
  }
  return(TRUE)
}


make_get_function <- function(params = NULL,
                              id,
                              template = template_get,
                              envir = parent.frame(1L)){

  stopifnot(is.function(template))

  body(template) <- eval(substitute(substitute(X, list(ID = id)),
                                    env = list(X=body(template))))

  if(is.null(params)){
    foo <- formals(function(...){})
    template <- function(){
      message("Dataset not loaded.")
      return(invisible(NULL))
    }
  } else {
    names(params) <- params
    foo <- lapply(params, function(i)alist(x=)$x)
  }

  foo <- c(foo, formals(template))
  foo[[length(foo)+1]] <- body(template)
  foo <- as.function.default(foo, envir = envir)

  return(foo)
}


utils::globalVariables(c("ID"))

template_get <- function(start_period = NULL, end_period = NULL){
  x <- eval(as_list(match.call()))
  return(get0(x, ID))
}


as_list <- function(x){
  stopifnot(is.language(x))
  x[[1]] <- as.symbol("list")
  return(x)
}

cbind_series <- function(series){
  if(length(series) == 1L)
    return(series[[1]])

  stopifnot(is.list(series), length(series) > 1L)

  res <- Reduce(x = series, function(x,y){
    merge(x, y, by = "TIME_PERIOD", all = TRUE)
  })
  row.names(res) <- NULL
  return(res)
}

rbind_list <- function(x){
  if(!is.null(names(x))){
    res <- as.data.frame(x,check.names = FALSE, stringsAsFactors = FALSE)
    return(res)
  }

  res <- lapply(x, as.data.frame, check.names = FALSE, stringsAsFactors = FALSE)

  cols <- unique(unlist(lapply(res, names)))
  res <- lapply(res, function(y) {
    z <- setdiff(cols, names(y))
    if(length(z) > 0L)
      y <- data.frame(c(y, sapply(z,function(i) NA)), check.names = FALSE, stringsAsFactors = FALSE)
    return(y)
  })

  res <- Reduce(rbind, res)
  row.names(res) <- NULL
  return(res)
}

transform_series <- function(series, dimensions){

  if(!is.null(names(series)))
    series <- list(series)

  ls_names <- paste0("@",toupper(names(dimensions)))

  res <- lapply(series, function(x){

    stopifnot("Obs" %in% names(x))
    stopifnot(all(ls_names %in% names(x)))

    d <- rbind_list(x$Obs)
    colnames(d) <- c("TIME_PERIOD", paste(x[ls_names], collapse = "."))

    return(d)
  })

  row.names(res) <- NULL
  return(res)
}


#' List all available Time Series Datasets
#'
#' @return a data.frame with columns 'Id' and 'Description'.
#' @export
#'
#' @examples
#' list_datasets()
#'

list_datasets <- function(){
  d <- mt_dataflow()
  d <- subset(d, select = c("KeyFamilyRef.KeyFamilyID", "Name.#text"))
  colnames(d) <- c("Id", "Description")
  return(d)
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
#'  DTS <- load_datasets(c("DOT","IFS"))
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

    series <- res$CompactData$DataSet$Series

    if(is.null(series)){
      x <- .last_response()
      path <- sub("^.+(CompactData/.+)$", "\\1",x$url)
      warning(sprintf("Request '%s' returned empty data", path), call. = FALSE)
      return(invisible(NULL))
    } else {
      series <- as.list(series)
    }

    query <- cat_query(series, dimensions)
    series <- rename_series(series$Obs, query)
    series <- cbind_series(series)

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
      dim_name <- extract_dimension_names(data_str)
      dim_values <- extract_dimension_values(data_str, dim_name)

      .DataStr[[id]] <<- data_str
      .DimNames[[id]] <<- dim_name
      .DimValues[[id]] <<- dim_values
    }

    get_series <- make_get_function(.DimNames[[id]]$Name, id)

    mts <- list(id = id,
                dimensions = .DimValues[[id]],
                get_series = get_series)

    class(mts) <- c("imf_db", class(mts))

    return(mts)
  }
})


extract_dimension_names <- function(data_str){
  y <- c("@codelist","@conceptRef")
  x <- data_str$Structure$KeyFamilies$KeyFamily$Components$Dimension[, y ]
  colnames(x) <- c("Codelist", "Name")
  x$Name <- tolower(x$Name)
  x$Num <- seq_along(x$Name)
  return(x)
}


extract_dimension_values <- function(data_str, dimensions){
  ls_values <- data_str$Structure$CodeLists$CodeList$Code
  names(ls_values) <- data_str$Structure$CodeLists$CodeList$`@id`

  ls_values <- ls_values[dimensions$Codelist]
  names(ls_values) <- dimensions$Name

  lapply(ls_values, function(x){
      x <- x[, c("@value","Description.#text")]
      colnames(x) <- c("Value","Description")
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


make_get_function <- function(params,
                              id,
                              defaults = NA,
                              template = template_get,
                              envir = parent.frame(1L)){

  stopifnot(is.function(template))

  body(template) <- eval(substitute(substitute(X, list(ID = id)),
                                    env = list(X=body(template))))

  force(defaults)
  names(params) <- params
  foo <- lapply(params, function(i)alist(x=)$x)

  if(!is.null(defaults))
    foo <- modifyList(foo, lapply(as.list(params), function(i)defaults))

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

rename_series <- function(series, query){
  if(length(query) > 1L){
    return(mapply(series, query, FUN = rename_series, SIMPLIFY = FALSE))
  }
  stopifnot(is.data.frame(series), ncol(series) == 2L)
  colnames(series) <- c("TIME_PERIOD", query)
  return(series)
}


cbind_series <- function(series){
  if(is.data.frame(series))
    return(series)

  stopifnot(is.list(series), length(series) > 1L)

  Reduce(x = series, function(x,y){
    merge(x, y, by = "TIME_PERIOD", all = TRUE)
  })
}

cat_query <- function(series, dimensions){
  x <- series[ paste0("@",toupper(names(dimensions))) ]
  x <- as.data.frame(x)
  query <- apply(x, 1, paste,collapse = ".")
  return(query)
}



settings <- local({

  .data <- list(verbose = FALSE,
                handle_options = NULL)

  setter <- function(name, check_fun = is.logical){
    function(value){
      if(!missing(value)){
        stopifnot(check_fun(value))
        .data[[name]] <<- value
      }
      return(.data[[name]])
    }
  }

  list(handle_options = setter("handle_options",
                               check_fun = function(x){
                                 is.list(x) || is.null(x)
                                 })
       ,
       verbose = setter("verbose", check_fun = is.logical))
})


request_limit <- local({

  .data <- as.POSIXct(numeric(0))
  .time_window <- NULL
  .rate_limit <- NULL

  set_rate <- function(limit = 10L,
                       window = 5,
                       units = "secs"){
    window <- as.difftime(tim = window, units = units)

    stopifnot(is.infinite(limit) || (as.integer(limit) && limit > 0))
    stopifnot(is(window,"difftime") && window > 0)

    .time_window <<- window
    .rate_limit <<- limit
    return(get_rate())
  }

  get_rate <- function(){
    list(rate = .rate_limit, window = .time_window)
  }

  set_rate()

  consume <- function(){

    if(is.infinite(.rate_limit))
      return(invisible(0))

    x <-  Sys.time() - .data
    i <- .time_window > x
    x <- x[i]
    .data <<- .data[i]

    if(length(.data) >= .rate_limit){
      ztime <- .time_window - x[1]

      if(settings$verbose())
        message(sprintf("Rate Limit exceeded: waiting for %s seconds.", round(ztime, digits = 2)))

      Sys.sleep(ztime)
    }

      .data <<- c(.data, Sys.time())
      return(0)
    }

  res <- list(set_rate = set_rate,
              get_rate = get_rate,
              consume = consume)
  class(res) <- c("request_limiter", class(res))

  return(res)
})

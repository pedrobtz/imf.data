
get_request <- function(url, accept = c("json","text")){
  type <- match.arg(accept)

  request_limit$consume()
  resp <- try(curl::curl_fetch_memory(url = url,
                                  handle = get_curl_handle(accept)),
              silent = TRUE)

  if(is(resp,"try-error")){
    if(settings$verbose()) message(resp)
    return(invisible(NULL))
  }

  on.exit(.last_response(resp))

  if(settings$verbose())
    print_response(resp, url)

  if(resp$status != 200)
    stop(status_error_msg(resp))

  if(grepl("json", resp$type))
    res <- extract_resp_content(resp, "json")
  else if(grepl("html", resp$type))
    res <- extract_resp_content(resp, "html")
  else
    stop(sprintf("response type '%s' not expected.", resp$type))
  return(res)
}


get_curl_handle <- function(accept = c("json", "text"),
                            opts = settings$handle_options()){

  accept <- match.arg(accept)
  h <- curl::new_handle()
  curl::handle_setheaders(handle = h,
                          .list = list("Accept" = paste0("application/", accept)))
  if(!is.null(opts))
    curl::handle_setopt(handle = h, .list = opts)

  return(h)
}


api_base_path <- function(){
  "http://dataservices.imf.org/REST/SDMX_JSON.svc"
}


build_api_path <- function(path){
  paste(api_base_path(), path, sep = "/")
}

status_error_msg <- function(resp){
  txt <- extract_resp_content(resp, type = "text")
  msg <- sprintf("Request to '%s'\nStatus code: %d\nContent: \n%s",
                 resp$url, resp$status, txt)
  return(msg)
}

extract_resp_content <- function(resp, type = c("text", "json", "html")){
  type <- match.arg(type)
  txt <- rawToChar(resp$content)

  if(type %in% c("text","html"))
    return(extract_html_body(txt))

  if(type == "json"){
    ans <- jsonlite::fromJSON(txt, flatten = TRUE, simplifyVector = TRUE)
    return(ans)
  }
}

print_response <- function(resp, path){
  status <- ifelse(resp$status == 200,"OK","ERROR")
  message(sprintf("[%s][%s] GET %s", resp$status, status, path))
}

extract_html_body <- function(x){
  x <- sub(".+<body>(.+)</body>","\\1", x)
  x <- gsub("<[^>]*>"," ", x)
  x <- gsub("[\r\n ]+"," ", x)
  x <- gsub("\\s+"," ", x)
  trimws(x)
}

.last_response <- local({
  .resp <- NULL
  function(response = NULL){
    if(!is.null(response))
      .resp <<- response

    return(.resp)
  }
})

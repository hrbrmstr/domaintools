#64.246.165.240

domaintools_url_base <- "http://api.domaintools.com/v1/"

#' Get or set DOMAINTOOLS_API_USERNAME value
#'
#' The API wrapper functions in this package all rely on a DomainTools
#' username residing in the environment variables \code{DOMAINTOOLS_API_USERNAME}
#' The easiest way to accomplish this is to set it in the `.Renviron` file in your home directory.
#'
#' @param force Force setting a new DomainTools username for the current environment?
#' @return atomic character vector containing the DomainTools username
#' @export
domaintools_username <- function(force = FALSE) {

  env <- Sys.getenv('DOMAINTOOLS_API_USERNAME')
  if (!identical(env, "") && !force) return(env)

  if (!interactive()) {
    stop("Please set env var DOMAINTOOLS_API_USERNAME to your DomainTools username",
         call. = FALSE)
  }

  message("Couldn't find env var DOMAINTOOLS_API_USERNAME See ?domaintools_username for more details.")
  message("Please enter your username and press enter:")
  pat <- readline(": ")

  if (identical(pat, "")) {
    stop("DomainTools username entry failed", call. = FALSE)
  }

  message("Updating DOMAINTOOLS_API_USERNAME env var")
  Sys.setenv(DOMAINTOOLS_API_USERNAME = pat)

  pat

}
#' Get or set DOMAINTOOLS_API_KEY value
#'
#' The API wrapper functions in this package all rely on a DomainTools API key
#' in the environment variables \code{DOMAINTOOLS_API_KEY}. The easiest way to
#' accomplish this is to set it in the `.Renviron` file in your home directory.
#'
#' @param force Force setting a new DomainTools API key for the current environment?
#' @return atomic character vector containing the DomainTools API key
#' @export
domaintools_api_key <- function(force = FALSE) {

  env <- Sys.getenv('DOMAINTOOLS_API_KEY')
  if (!identical(env, "") && !force) return(env)

  if (!interactive()) {
    stop("Please set env var DOMAINTOOLS_API_KEY to your DomainTools API key",
         call. = FALSE)
  }

  message("Couldn't find env var DOMAINTOOLS_API_KEY See ?domaintools_api_key for more details.")
  message("Please enter your API key and press enter:")
  pat <- readline(": ")

  if (identical(pat, "")) {
    stop("DomainTools API keyentry failed", call. = FALSE)
  }

  message("Updating DOMAINTOOLS_API_KEY env var")
  Sys.setenv(DOMAINTOOLS_API_KEY = pat)

  pat

}

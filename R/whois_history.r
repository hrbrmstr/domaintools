#' Whois History
#'
#' The Whois History API provides a list of historic Whois records for a
#' domain name. The format for each record is similar to that returned by
#' the Recent Whois API although some fields may be missing if the data was
#' not available when the record was stored in our system.
#'
#' @param domain domain to perform the Whois query on
#' @note In rare cases, you may request a domain for which no recent Whois
#'       record is available. If that occurs, the system will respond with
#'       an error.
#' @export
#' @references \url{http://www.domaintools.com/resources/api-documentation/whois-history/}
#' @return a \code{list} of Whois history result detais for the \code{domain}
#' @examples
#' whois_history("domaintools.com")
#' whois_history("dailychanges.com")
whois_history <- function(domain) {

  url <- paste0(domaintools_url_base, trimws(domain), "/whois/history")

  res <- POST(url,
              query=list(api_username=domaintools_username(),
                         api_key=domaintools_api_key()))

  stop_for_status(res)

  jsonlite::fromJSON(content(res, as="text"))

}

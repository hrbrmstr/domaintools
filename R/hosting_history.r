#' Hosting History
#'
#' The Hosting History API provides a list of changes that have
#' occurred in a Domain Name's registrar, IP address, and name servers.
#' IP and name server events include	the value before and after the change
#' and indicate the type of action that triggered the event.
#'
#' @param domain domain to perform the Whois query on
#' @note In rare cases, you may request a domain for which no recent Whois
#'       record is available. If that occurs, the system will respond with
#'       an error.
#' @export
#' @references \url{http://www.domaintools.com/resources/api-documentation/hosting-history/}
#' @return a \code{list} of hosting history result detais for the \code{domain}
#' @examples
#' hosting_history("domaintools.com")
#' hosting_history("dailychanges.com")
hosting_history <- function(domain) {

  url <- paste0(domaintools_url_base, trimws(domain), "/whois/hosting-history")

  res <- POST(url,
              query=list(api_username=domaintools_username(),
                         api_key=domaintools_api_key()))

  stop_for_status(res)

  jsonlite::fromJSON(content(res, as="text"))

}

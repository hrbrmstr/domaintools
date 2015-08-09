#' Whois Lookup
#'
#' The Whois Lookup API provides the ownership record for a domain name or IP
#' address with basic registration details. The API is optimized to respond
#' quickly and is designed to handle a high volume of parallel requests. This
#' is the ideal product to use if you have a busy web site or a long list of
#' domains that you need to process.
#'
#' The response includes the most recent Whois record we have for the domain
#' name or IP address you provided in the URL. This ensures a consistently fast
#' response without a dependency on external servers and usually returns a
#' record updated within the last few days. You can use the date property in
#' the whois response node to check the age of the record and confirm it was
#' updated recently enough for your needs.
#'
#' @param domain domain to perform the Whois query on
#' @note In rare cases, you may request a domain for which no recent Whois
#'       record is available. If that occurs, the system will respond with
#'       an error.
#' @export
#' @references \url{http://www.domaintools.com/resources/api-documentation/whois-lookup/}
#' @return a \code{list} of basic Whois result detais for the \code{domain}
#' @examples
#' whois("domaintools.com")
#' whois("dailychanges.com")
whois <- function(domain) {

  url <- paste0(domaintools_url_base, trimws(domain), "/whois")

  res <- POST(url,
              query=list(api_username=domaintools_username(),
                         api_key=domaintools_api_key))

  stop_for_status(res)

  jsonlite::fromJSON(content(res, as="text"))

}

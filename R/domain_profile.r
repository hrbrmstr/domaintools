#' Domain Profile
#'
#' The Domain Profile API provides basic domain name registration details and
#' a preview of additional data available from DomainTools membership and
#' report products. The preview data is especially useful for DomainTools
#' affiliates who want to show useful information on a domain name or a
#' registrant in their affiliate link.
#'
#' @param domain domain to perform the profile query on
#' @note Note that not all data elements in the response will be available
#'       for all domains.
#' @export
#' @references \url{http://www.domaintools.com/resources/api-documentation/domain-profile/}
#' @return a \code{list} of domain profileresult detais for the \code{domain}
#' @examples
#' domain_profile("domaintools.com")
#' domain_profile("dailychanges.com")
domain_profile <- function(domain) {

  url <- paste0(domaintools_url_base, trimws(domain))

  res <- POST(url,
              query=list(api_username=domaintools_username(),
                         api_key=domaintools_api_key))

  stop_for_status(res)

  jsonlite::fromJSON(content(res, as="text"))

}

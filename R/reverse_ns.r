#' Reverse Nameserver
#'
#' The Reverse Name Server API provides a list of domain names that share the
#' same primary or secondary name server. You can request a name server
#' directly, or you can provide a domain name and the API will provide the
#' list of domain names pointed to the same name servers as those listed as
#' the primary and secondary name servers on the domain name you requested.
#'
#' @param domain domain to perform the  query on
#' @param limit Limits the size of the domain list than can appear in a
#'        response.
#' @export
#' @references \url{http://www.domaintools.com/resources/api-documentation/reverse-name-server/}
#' @return a \code{list} of result detais for the \code{domain}
#' @examples
#' reverse_ns("domaintools.net")
reverse_ns <- function(domain, limit=NULL) {

  url <- paste0(domaintools_url_base, trimws(domain), "/name-server-domains")

  res <- POST(url,
              query=list(api_username=domaintools_username(),
                         api_key=domaintools_api_key))

  stop_for_status(res)

  jsonlite::fromJSON(content(res, as="text"))

}

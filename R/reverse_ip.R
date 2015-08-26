#' Reverse IP
#'
#' The Reverse IP API provides a list of domain names that share the same
#' Internet host (i.e. the same IP address).
#'
#' @param ip IP address to perform the reverse IP query
#' @param limit Limits the size of the domain list than can appear in a
#'        response. The limit is applied per-IP address, not for the entire
#'        request.
#' @note In rare cases, you may request an IP for which no recent Whois
#'       record is available. If that occurs, the system will respond with
#'       an error.
#' @export
#' @references \url{http://www.domaintools.com/resources/api-documentation/reverse-ip/}
#' @return a \code{list} of result detais for the \code{ip}
#' @examples
#' reverse_ip("64.246.165.240")
reverse_ip <- function(ip, limit=NULL) {

  url <- paste0(domaintools_url_base, trimws(ip), "/host-domains")

  res <- POST(url,
              query=list(api_username=domaintools_username(),
                         api_key=domaintools_api_key()))

  stop_for_status(res)

  jsonlite::fromJSON(content(res, as="text"))

}

#' Shared IPs
#'
#' The Reverse IP API provides a list of domain names that share the same
#' Internet host (i.e. the same IP address).
#'
#' @param hostname IP address to perform the reverse IP query
#' @param limit Limits the size of the domain list than can appear in a
#'        response. The limit is applied per-IP address, not for the entire
#'        request.
#' @note In rare cases, you may request an IP for which no recent Whois
#'       record is available. If that occurs, the system will respond with
#'       an error.
#' @export
#' @references \url{http://www.domaintools.com/resources/api-documentation/reverse-ip/}
#' @return a \code{list} of result detais for the \code{hostname}
#' @examples
#' shared_ips("domaintools.com")
shared_ips <- function(hostname, limit=NULL) {

  url <- paste0(domaintools_url_base, trimws(hostname), "/reverse-ip")

  res <- POST(url,
              query=list(api_username=domaintools_username(),
                         api_key=domaintools_api_key),)

  stop_for_status(res)

  jsonlite::fromJSON(content(res, as="text"))

}

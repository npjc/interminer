#' Specify an intermine data warehouse
#'
#' @section Supported Mines:
#'
#' Interminer currently supports a subset of InterMine's data warehouses:
#'
#' \itemize{
#' \item "FlyMine"
#' \item "modMine"
#' \item "YeastMine"
#'
#' }
#'
#' @aliases mine
#' @param mine character string; name of intermine data warehouse
#' @return named list.
#' @export
im <- function(mine){
  structure(list(url = ws_url(mine),
       service = character(1),
       query = vector("list",0)),
       class = "im")
}

#' url for an intermine data warehouse
#' @param mine character string; name of intermine data warehouse
#' @keywords internal
#' @return intermine url
ws_url <- function(mine) {

  domain <- switch(tolower(mine),
                   flymine = "flymine.org",
                   modmine = "intermine.modencode.org",
                   yeastmine = "yeastmine.yeastgenome.org")

  paste0("http://www.",domain)
}

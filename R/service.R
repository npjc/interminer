#' parse im object in preparation for a given service
#' @param im im object
#' @keywords internal
parse_for_service <- function(im, as) {
  switch(im$service,
         "query/service/regions" = prep_service_regions(im, as),
         "query/service/query/results" = prep_service_query(im, as),
         "query/service/list" = prep_service_list(im, as)
  )
}

#' parse im for regions type query
#' @param im im object
#' @keywords internal
prep_service_regions <- function(im, as) {
  if (as %in% c("gff3","bed","fasta")) {
    im[["service"]] <- stringi::stri_join(im$service, as, sep="/")
  }
  im[["query"]][["organism"]] <- jsonlite::unbox(im$query$organism)
  im[["query"]] <- jsonlite::toJSON(im$query)
  im
}

#' parse im for arbitrary query
#' @param im im object
#' @keywords internal
prep_service_query <- function(im, as) {
  stop("not yet implemented")
}

#' parse im for list type query
#' @param im im object
#' @keywords internal
prep_service_list <- function(im, as) {
  stop("not yet implemented")
}

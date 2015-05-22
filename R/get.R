#' GET query results
#'
#' @section as:
#' If querying sequence features then one of "gff3", "fasta", "bed". For
#' arbitrary queries defaults to "tab".
#'
#' @param im im object from \code{\link{im}}
#' @param as character string of the format to accept
#' @param path character string (optional) specifying the path to write query
#' results to.
#' @export
im_get <- function(im, as = "tab", path) {

  # if we are getting features overlapping regions
  im[["service"]] <- stringi::stri_join(im[["service"]], as, sep="/")
  im[["query"]][["organism"]] <- jsonlite::unbox(im$query$organism)
  im[["query"]] <- jsonlite::toJSON(im[["query"]])
  im

  httr::GET(im$url, path = im$service, query = im["query"], httr::accept("*/*"))
}

#' @rdname im_get
#' @inheritParams im_get
#' @export
im_get_gff3 <- function(im, path) {
  im_get(im, as = "gff3", path)
}

#' @rdname im_get
#' @inheritParams im_get
#' @export
im_get_fasta <- function(im, path) {
  im_get(im, as = "fasta", path)
}

#' @rdname im_get
#' @inheritParams im_get
#' @export
im_get_bed <- function(im, path) {
  im_get(im, as = "bed", path)
}

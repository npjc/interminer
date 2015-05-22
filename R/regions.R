#' add interval regions to im object
#'
#' @param im im object from \code{\link{im}}
#' @param name character string path to interval file or name or R object
#' @param features character vector of intermine sequence feature objects
#' @param organism character string of organism to query
#' @param cse_cols integer vector specifying the index of chromosome, start and
#' end columns.
#' @export
im_regions <- function(im, name, features, organism, cse_cols = 1:3L) {
  regions <- parse_regions(name, cse_cols)
  feature_types <- parse_features(features)
  im[["query"]] <- list(regions = regions,
                        featureTypes = feature_types,
                        organism = organism)
  im[["service"]] <- "query/service/regions"
  im
}

#' Convert regions to intermine acceptable format
#'
#' @param name chracter string; path to .bed or .gff3 file or data.frame object
#' containing chromosome, start and end columns.
#' @param cse_cols integer vector; indicates the chromosome, start, end columns
#' of a data.frame or file.
#' @return returns a character vector of with each region of the form "c:s..e".
#' @keywords internal
parse_regions <- function(name, cse_cols = 1:3L) {
  skip <- 0
  if (is.character(name)) {
    if (stringi::stri_endswith_fixed(name,".gff3")) {
      cse_cols <- c(1,4:5L)
      skip <- "##"
    }

    if (stringi::stri_endswith_fixed(name,".bed")) skip <- "track"

    df <- data.table::fread(name, select = cse_cols,skip=skip)
    data.table::setattr(df,"class","data.frame")
  }
  if (is.list(name)) {
    df <- name[,cse_cols]
  }
  stringi::stri_join(df[,1], ":", df[,2], "..", df[,3])
}

#' Convert features to intermine acceptable format
#'
#' @param feature_types character vector; each element must be an intermine
#' sequence feature.
#' @return space-separated string of featureTypes.
#' @keywords internal
parse_features <- function(feature_types) {
  stringi::stri_trans_totitle(feature_types)
}

#' parse results of a request
#' @param r request object
#' @param path character string (optional) specifying the path to write query
#' results to.
#' @keywords internal
parse_results <- function(r, as, path) {
  # to write to file
  if(!is.null(path)) {
    httr::content(r, "raw") %>%
      writeBin(path)
    return(cat("wrote file to:",path))
  }

  # to parse
  switch(as,
         "gff3" = parse_gff3_results(r),
         "fasta" = parse_fasta_results(r),
         "bed" = parse_bed_results(r),
         "tab" = parse_tab_results(r),
         "text" = httr::content(r,"text"),
         "request" = r)
}

#' parse gff3 results into data.frame
#' @param r request object
#' @keywords internal
parse_gff3_results <- function(r) {
  out <- httr::content(r,"text") %>%
    data.table::fread(skip = "##", header=FALSE)
  data.table::setattr(out,"class","data.frame")
  data.table::setnames(out,c("seqname", "source", "feature", "start", "end",
                             "score", "strand", "frame", "group"))
  out
}

#' parse fasta results into named list
#' @param r request object
#' @keywords internal
parse_fasta_results <- function(r) {
  warning("no parsing available for fasta yet. \n returning text.")
  httr::content(r,"text")
}

#' parse bed results into data.frame
#' @param r request object
#' @keywords internal
parse_bed_results <- function(r) {
  out <- httr::content(r,"text") %>%
    data.table::fread(skip = "track", header=FALSE)

  bed_cols <- c("chrom", "chromStart", "chromEnd", "name", "score", "strand",
                "thickStart", "thickEnd", "itemRgb", "blockCount", "blockSizes",
                "blockStarts")
  data.table::setnames(out,bed_cols[1:ncol(out)])
  data.table::setattr(out,"class","data.frame")
  out
}

#' parse general tabular results into data.frame
#' @param r request object
#' @keywords internal
parse_tab_results <- function(r) {
  out <- httr::content(r,"text") %>%
    data.table::fread()
  data.table::setattr(out,"class","data.frame")
  out
}

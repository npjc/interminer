#' Easily Query InterMine Data Warehouses in R.
#'
#' @section Package Design:
#'
#' Interminer exposes a subset of the InterMine Web API. It provides functions
#' to define queries over a chosen mine abstracting away the XML and JSON stuff.
#' Once a query is defined it is passed to one of the retrieval functions which
#' will submit the query, retrieve the results in the appropriate format.
#'
#' @section Define Queries:
#'
#' Queries over InterMine use a graph-based format:
#' \itemize{
#'  \item Begin by specifying which mine to query \code{im}
#'
#'  \item Add a path to query from \code{im_path}
#'
#'  \item Define output columns to view \code{im_view}
#'
#'  \item Constrain a query \code{im_constrain} (optional)
#'
#'  \item Apply joins to query elements \code{im_join} (optional)
#'
#'  \item Query over interval regions \code{im_regions}:
#' }
#'
#' @section Retrieve Query Results:
#'
#' These functions take a query element as input and return the parsed result.
#'
#' \itemize{
#'  \item \code{im_get_gff3}: get results of a query as gff3 file or data.frame
#'
#'  \item \code{im_get_fasta}: as fasta file or named list
#'
#'  \item \code{im_get_bed}: get results of a query as bed file or data.frame
#'
#'  \item \code{im_get}: more general, more flexible, user-parses result.
#' }
#'
#'
#' @docType package
#' @name interminer
NULL

.onAttach <- function(...) {
  packageStartupMessage("Beginner developer minions about. ",
                        "Be on the lookout. ")
}

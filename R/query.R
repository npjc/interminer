#' select what to view
#' @export
im_query <- function(im, view) {
  im[["service"]] <- "query/service/query/results"
  im[["query"]] <- prep_query(view)
  im
}

#' constrain the view
#' @export
im_constrain <- function(im, path, op, value,
                         type = NULL, extraValue = NULL, code = NULL) {
  constraint_attribs <- list(path = path, op = op, value = value, type = type,
                             extraValue = extraValue, code = code)
  constraint <- htmltools::tag("constraint",constraint_attribs)
  im[["query"]] <- htmltools::tagAppendChild(im$query, constraint)
  im
}


#' prepare a query object
#' @keywords internal
#' @param model
#' @param view
prep_query <- function(view, model = "genomic", name = NULL, sortOrder = NULL,
                       constraintLogic = NULL) {
  query_attribs <- list(view = view,
                        model= model,
                        name = name,
                        sortOrder = sortOrder,
                        constraintLogic = constraintLogic)
  htmltools::tag("query",query_attribs)
}

# debug:
# im <- im("flymine")

# htmltools::tag("query", list())
# also:
# htmltools::tagAppendAttributes()
# htmltools::tagAppendChild()
# htmltools::tagAppendChildren()

# <query name="short genes on the X chromosome" model="genomic" view="Gene.id">
#   <constraint path="Gene.chromosome.primaryIdentifier" op="=" value="X"/>
#     <constraint path="Gene.length" op="&lt;" value="100"/>
#       </query>
#
# htmltools::tag("query",list(model="genomic",view="Gene.id")) %>%
#       htmltools::tagAppendChild(htmltools::tag("constraint", list(
#         path="Gene.chromosome.primaryIdentifier", op="=",value="X"))) %>%
#       htmltools::tagAppendChild(htmltools::tagAppendChild("constraint", list(
#         path="Gene.length", op="<",value="100")))
#
# query <- htmltools::tag("query",list(model="genomic",view="Gene.id"))
# c1 <- htmltools::tag("constraint",list(path="Gene.chromosome.primaryIdentifier", op="=",value="X"))
# c2 <- htmltools::tag("constraint",list(path="Gene.length", op="<",value="100"))
# query <- htmltools::tagAppendChildren(query,c1,c2)
#
# im[["query"]] <- list(query = query)
# httr::GET(im$url, path = im$service, query = list(query = as.character(im$query$query)))

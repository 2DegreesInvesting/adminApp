pull_item_matching <- function(x, pattern) {
  nms <- sort(names(x)[grepl(pattern, names(x))])
  unlist(lapply(nms, \(.x) x[[.x]]))
}

get_grants <- function(input, pattern = "grant") {
  grants <- pull_item_matching(input, pattern)
  grants[!grants %in% ""]
}

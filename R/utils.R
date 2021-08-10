pull_item_matching <- function(x, pattern) {
  nms <- sort(names(x)[grepl(pattern, names(x))])
  unlist(lapply(nms, \(.x) x[[.x]]))
}

get_grants <- function(input, pattern = "grant") {
  grants <- pull_item_matching(input, pattern)
  grants[!grants %in% ""]
}

alert <- function() {
  paste(
    "WARNING: This tool doesn't transmit anything to 2DII. It just helps",
    "figure out what numbers to put in yourtemplates."
  )
}

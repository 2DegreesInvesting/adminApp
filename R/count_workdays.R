#' Calculate total pay between two dates
#'
#' @param first Atomic string. First pay date (yyyy-mm-dd).
#' @param last Atomic string. Last pay date (yyyy-mm-dd).
#' @param daily Atomic double.
#'
#' @return Atomic double.
#' @export
#'
#' @examples
#' first <- "2021-05-28"
#' last <- "2021-06-27"
#' count_workdays(first = "2021-05-28", last = "2021-06-27")
count_workdays <- function(first, last) {
  sum(weekdays_between(first, last) %in% workdays())
}

#' @examples
#' all_days <- weekdays_between(first, last)
#' table(all_days)
#'
#' workdays <- all_days[all_days %in% workdays()]
#' table(workdays)
#' @noRd
weekdays_between <- function(first, last) {
  range <- seq(as.Date(first), as.Date(last), "days")
  weekdays(range, abbreviate = TRUE)
}

workdays <- function() c("Mon", "Tue", "Wed", "Thu", "Fri")

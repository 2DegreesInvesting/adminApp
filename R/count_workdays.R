#' Calculate total pay between two dates
#'
#' Email on Wed, May 26, 2021 at 8:12 PM: "The daily rates that were calculated
#' from our annualized salary excluded vacation / holiday days.  To get around a
#' recalculation, **we will submit monthly invoices in which the amount due will
#' be the number of weekdays within the invoice period, irrespective of holidays
#' or vacation days spent**. This means that our first invoice will cover the
#' time period of April 28th to May 27th and our monthly rate for this time
#' period will be 22 days (22 * daily rate as documented in our contracts)."
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

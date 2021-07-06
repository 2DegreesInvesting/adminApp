tabPanelInfo <- function() {
  tabPanel(
    "Info",
    p(
      paste(
        "Contractors submit monthly invoices in which the amount of days of",
        "service equal the number of weekdays within the invoice period,",
        "irrespective of holidays or vacation days spent."
      )
    ),
    p("- The first invoice covered April 28 to May 27 (22 days)."),
    p("- The second invoice covered May 28 to June 30 (24 days)."),
    p("- Other invoices cover full months, e.g. July 1 to 31 (22 days).")
  )
}

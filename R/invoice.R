invoiceInfo <- function() {
  paste(
    "Contractors submit monthly invoices in which the amount of days of",
    "service equal the number of weekdays within the invoice period,",
    "irrespective of holidays or vacation days spent. The first invoice",
    "covered April 28 to May 27 (22 days); The second invoice covered May",
    "28 to June 30 (24 days). Other invoices cover full months, e.g. July",
    "1 to 31 (22 days)."
  )
}

invoice <- function(start = "2021-04-28", end = "2021-05-27") {
  mainPanel(
    dateRangeInput("range", "Range of service", start = start, end = end),
    numericInput("daily_rate", "Daily rate (in contract)", value = 0),
    strong(p("Number of work days to charge for")),
    verbatimTextOutput("invoice_days_to_charge_for"),
    strong(p("Total to charge for")),
    verbatimTextOutput("invoice_amount_to_charge")
  )
}

tabPanelCalculate <- function(start = "2021-04-28", end = "2021-05-27") {
  tabPanel(
    "Calculate",

    dateRangeInput("range", "Range of service", start = start, end = end),
    numericInput("daily_rate", "Daily rate (in contract)", value = 0),

    strong(p("Number of work days to charge for")),
    verbatimTextOutput("count"),

    strong(p("Total to charge for")),
    verbatimTextOutput("charge")
  )
}

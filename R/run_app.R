#' litigationRisk app
#'
#' @return Called for its side effect.
#' @export
#'
#' @examples
#' if (interactive()) {
#'  run_app()
#' }
run_app <- function() {
  ui <- fluidPage(
    p(
      paste(
        "Contractors submit monthly invoices in which the amount",
        "of days of service equal the number of weekdays within the",
        "invoice period, irrespective of holidays or vacation days",
        "spent. For example, the first invoice covered the time",
        "range from April 28th to May 27th, resulting in 22 work",
        "days to charge for."
      )
    ),

    dateRangeInput(
      "range",
      "Range of service",
      start = "2021-04-28",
      end = "2021-05-27"
    ),

    strong(p("Number of work days to charge for")),
    verbatimTextOutput("count")
  )

  server <- function(input, output, session) {
    data_range <- reactive(input$range)
    output$count <- renderPrint({
      count_workdays(data_range()[[1]], data_range()[[2]])
    })
  }

  shinyApp(ui, server)
}

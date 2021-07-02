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
    dateRangeInput("range_in", "Invoice range"),

    h1(p("Review")),
    p("Invoice range:"),
    verbatimTextOutput("range_out")
  )

  server <- function(input, output, session) {
    output$range_out <- renderPrint(input$range_in)
  }

  shinyApp(ui, server)
}

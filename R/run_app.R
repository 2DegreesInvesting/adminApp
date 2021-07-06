#' litigationRisk app
#'
#' @return Called for its side effect.
#' @export
#'
#' @examples
#' if (interactive()) {
#'   run_app()
#' }
run_app <- function() {
  ui <- fluidPage(tabsetPanel(
    id = "tabs",
    tabPanelCalculate(),
    tabPanelInfo()
  ))

  server <- function(input, output, session) {
    n_days <-
      reactive(count_workdays(input$range[[1]], input$range[[2]]))
    output$count <- renderText(n_days())
    output$charge <- renderText(n_days() * input$daily_rate)
  }

  shinyApp(ui, server)
}

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
  ui <- fluidPage(
    tabsetPanel(
      id = "tabs",
      tabPanel("Timesheet", timesheet()),
      tabPanel("Invoice", sidebarPanel(p(invoiceInfo())), invoice())
    )
  )

  server <- function(input, output, session) {
    n_days <- reactive(count_workdays(input$range[[1]], input$range[[2]]))
    output$invoice_days_to_charge_for <- renderText(n_days())
    output$invoice_amount_to_charge <- renderText(n_days() * input$daily_rate)

    output$timesheet_days_per_grant <- renderPrint({
      grants <- get_grants(input)
      percents <- pull_item_matching(input, "pcnt")
      percents <- setNames(percents, grants)
      percents <- percents[percents != 0]

      abort_if_allocation_is_not_100(percents)
      as.list(days_per_grant(percents, input$days_to_fill))
    })
  }

  shinyApp(ui, server)
}

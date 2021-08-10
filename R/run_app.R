#' Run the adminApp
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
    theme = theme_2dii(),
    tabsetPanel(
      id = "tabs",
      tabPanel(
        "Invoice",
        sidebarPanel(strong(alert()), hr(), p(invoiceInfo())), invoice()
      ),
      tabPanel(
        "Timesheet",
        sidebarPanel(strong(alert()), hr(), p(timesheetInfo())), timesheet()
      )
    )
  )

  server <- function(input, output, session) {
    thematic_shiny()

    n_days <- reactive(count_workdays(input$range[[1]], input$range[[2]]))
    output$invoice_days_to_charge_for <- renderText(n_days())
    output$invoice_amount_to_charge <- renderText(n_days() * input$daily_rate)

    output$timesheet_days_per_grant <- renderPrint({
      grants <- get_grants(input)
      percents <- pull_item_matching(input, "pcnt")
      names(percents) <- grants
      percents <- percents[percents != 0]

      abort_if_allocation_is_not_100(percents)
      out <- as.list(days_per_grant(percents, input$days_to_fill))
      format_days_hours(out)
    })
  }

  shinyApp(ui, server)
}

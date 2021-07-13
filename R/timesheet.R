days_per_grant <- function(percents, days_to_fill) {
  unlist(lapply(percents, function(x) x * days_to_fill / 100))
}

abort_if_allocation_is_not_100 <- function(x) {
  sum_pcnt <- Reduce(sum, x)

  if (sum_pcnt != 100) {
    stop(
      "Percent time allocation must sum 100%, not ", sum_pcnt, ".",
      call. = FALSE
    )
  }

  invisible(x)
}

# Jul 13, 2021 at 8:03 AM Léonie Ségala <leonie@2degrees-investing.org>
allocation_demo <- function() {
  "list(iki_pacta = 17, iki_impact = 80, ecf = 3)"
}

timesheet <- function() {
  mainPanel(
    textInput(
      "percents", "Time allocation per grant (%)", value = allocation_demo()
    ),

    numericInput("days_to_fill", "Days to fill in the timesheet", 20),

    strong("Days to allocate to each grant"),
    verbatimTextOutput("timesheet_days_per_grant")
  )
}


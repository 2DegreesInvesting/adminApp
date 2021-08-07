timesheetInfo <- function() {
  paste(
    "The number of grant-work days are 8-hour days you worked for grants. This",
    "excludes annual leave and holidays. For example, if a month had 22",
    "weekdays, of which one was a public holiday and one was a vacation, then",
    "the number of grant-work days is 20. You should also allocate one day to",
    "annual leave and one day to public holiday."
  )
}

timesheet <- function() {
  mainPanel(
    fluidRow(
      column(4, textInput("grant1", "Grant name", "IKI PACTA (WP1/2)")),
      column(4, numericInput("pcnt1", "Allocation (%)", 17, 0, 100))
    ),
    fluidRow(
      column(4, textInput("grant2", "", "IKI IMPACT (WP8)")),
      column(4, numericInput("pcnt2", "", 80, 0, 100))
    ),
    fluidRow(
      column(4, textInput("grant3", "", "ECF")),
      column(4, numericInput("pcnt3", "", 3, 0, 100))
    ),
    fluidRow(
      column(4, textInput("grant4", "", "?")),
      column(4, numericInput("pcnt4", "", 0, 0, 100))
    ),
    fluidRow(
      column(4, textInput("grant5", "", "?")),
      column(4, numericInput("pcnt5", "", 0, 0, 100))
    ),
    numericInput("days_to_fill", "Number of grant-work days", 20),
    strong("Days to allocate to each grant"),
    verbatimTextOutput("timesheet_days_per_grant")
  )
}

format_days_hours <- function(x) {
  days <- map(x, trunc)
  hours <- map2(x, days, ~ round((.x - .y) * 8))
  out <- sprintf("%sd + %sh", days, hours)
  as.list(set_names(out, names(x)))
}

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
  "iki_pacta_wp1_2 = 17, iki_impact_wp8 = 80, ecf = 3"
}

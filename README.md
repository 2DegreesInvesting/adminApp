
<!-- README.md is generated from README.Rmd. Please edit that file -->

# adminApp <a href='https://github.com/2DegreesInvesting/r2dii.usethis'><img src='https://imgur.com/A5ASZPE.png' align='right' height='43' /></a>

<!-- badges: start -->

[![lifecycle](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
[![CRAN
status](https://www.r-pkg.org/badges/version/adminApp)](https://CRAN.R-project.org/package=adminApp)
[![R-CMD-check](https://github.com/2DegreesInvesting/adminApp/workflows/R-CMD-check/badge.svg)](https://github.com/2DegreesInvesting/adminApp/actions)
[![Codecov test
coverage](https://codecov.io/gh/2DegreesInvesting/adminApp/branch/master/graph/badge.svg)](https://codecov.io/gh/2DegreesInvesting/adminApp?branch=master)
<!-- badges: end -->

The goal of adminApp is to help with administration tasks. **It doesn’t
transmit anything to 2DII**. It just helps figure out what numbers to
put in your templates. For example, it helps you calculate the number of
days to put on the invoice, and help break down the BeeBole allocations.

## Installation

Install the development version of adminApp from GitHub with:

``` r
# install.packages("devtools")
devtools::install_github("2DegreesInvesting/adminApp")
```

## Example

``` r
if (interactive()) {
  adminApp::run_app()
}
```

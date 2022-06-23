library(testthat)
# library(devtools)

# Load all code in R/
devtools::load_all()

# Running tests ---------------------------------------------------------------------------------------------------
# See https://testthat.r-lib.org/
# Also https://devtools.r-lib.org/ for package development
devtools::test()

test_local(path = ".")

test_check("ProgRdemo")

# If this was not an R package we could do things manually:
library(testthat)
source("R/distConversion.R")
test_file("tests/testthat/test-distConversion.R")

# Test coverage ---------------------------------------------------------------------------------------------------
# library(covr)
# See https://covr.r-lib.org/

# Basic overview
covr::package_coverage()

# Fancy report
covr::report()

# Same thing, wrapper from devtools
devtools::test_coverage()

# Missing coverage
cov <- covr::package_coverage()
covr::zero_coverage(cov)

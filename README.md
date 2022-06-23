# ProgRdemo

This is an example project to illustrate the use of `testthat` and `covr` for automatic code testing and test coverage metrics.  
The project is structured as an R package, but the software and techniques used are applicable to non-package projects as well.

## Overview of important files


├── DESCRIPTION  
├── NAMESPACE  
├── ProgRdemo.Rproj  
├── **R**  
│   ├── **distConversion.R**  
│   └── **textLikelihood.R**  
├── attic  
│   └── scratch.R  
├── man  
└── **tests**  
    ├── testthat  
    │   ├── **test-distConversion.R**  
    │   └── **test-textLikelihood.R**  
    └── testthat.R  


## Usage

See `attic/scratch.R`.

### Running tests

```r
library(testthat) # See https://testthat.r-lib.org/
# library(devtools) # Optional but useful, see also https://devtools.r-lib.org/ 

# Load all code in R/, alternative to manually sourcing each file
# devtools::load_all()

test_local(path = ".")

test_check("ProgRdemo")

# Alternatively via devtools
# devtools::test()
```

If this was not an R package we could do things manually:

```r
library(testthat)

# Source file if not already loaded anyway
source("R/distConversion.R")

# Manually run each test script individually
test_file("tests/testthat/test-distConversion.R")
```

### Test coverage

```r
library(covr) # See https://covr.r-lib.org/

# Basic overview
covr::package_coverage()

# Fancy report
covr::report()

# Same thing, wrapper from devtools
# devtools::test_coverage()

# Missing test coverage coverage display
cov <- covr::package_coverage()
covr::zero_coverage(cov)
```

Or in a non-package environment with explicit file paths:

```r
covr::file_coverage(
  source_files = "R/distConversion.R",
  test_files = "tests/testthat/test-distConversion.R"
)
```

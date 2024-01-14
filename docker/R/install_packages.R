install.packages("renv")

renv::install(exclude=("camtraptor"))
install.packages("devtools")

# Arkdb installation from source
# https://github.com/ropensci/arkdb
devtools::install_github("cboettig/arkdb@v0.0.14")

# Installing Apache Arrow from binaries
# https://arrow.apache.org/docs/r/articles/install.html
options(
  HTTPUserAgent =
    sprintf(
      "R/%s R (%s)",
      getRversion(),
      paste(getRversion(), R.version["platform"], R.version["arch"], R.version["os"])
    )
)
Sys.setenv(LIBARROW_BINARY = "true", LIBARROW_MINIMAL = "false")
install.packages("arrow", repos = "https://packagemanager.rstudio.com/all/__linux__/focal/latest", libs_only = TRUE)

# Install frictionless package from rOpenSci R-universe
install.packages("frictionless", repos = "https://ropensci.r-universe.dev")
if ( ! library("frictionless", character.only=TRUE, logical.return=TRUE) ) {
  quit(status=1, save='no')
}

# Install camtraptor package from GitHub
devtools::install_github("inbo/camtraptor", ref = "v0.24.0", build_vignettes = FALSE, build_manual = FALSE)
if ( ! library("camtraptor", character.only=TRUE, logical.return=TRUE) ) {
  quit(status=1, save='no')
}

#https://github.com/ropensci/arkdb
#Arkdb installation from source
remotes::install_github("cboettig/arkdb")

#https://arrow.apache.org/docs/r/articles/install.html
#Installing Apache Arrow from binaries
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

#Install source packages
install.packages(c("jqr","leaflet","leaflet.providers","EML","emld","R.methodsS3","contentid","RJSONIO","rgeos","storr"), dependencies = FALSE, libs_only = TRUE)

# Or rOpenSci R-universe
install.packages("frictionless", repos = "https://ropensci.r-universe.dev")

#Install camtraptor package from github
remotes::install_github("inbo/camtraptor", build_vignettes = FALSE, build_manual = FALSE)
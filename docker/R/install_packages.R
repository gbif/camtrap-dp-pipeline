install.packages(c("jqr","leaflet","leaflet.providers","EML","emld","frictionless","R.methodsS3","duckdb","contentid","RJSONIO","rgeos","storr","nycflights13","RPostgres"), dependencies = TRUE)
devtools::install_github("cboettig/arkdb")
options(
  HTTPUserAgent =
    sprintf(
      "R/%s R (%s)",
      getRversion(),
      paste(getRversion(), R.version["platform"], R.version["arch"], R.version["os"])
    )
)
install.packages("arrow", repos = "https://packagemanager.rstudio.com/all/__linux__/focal/latest")
remotes::install_github("inbo/camtraptor", build_vignettes = FALSE, build_manual = FALSE)
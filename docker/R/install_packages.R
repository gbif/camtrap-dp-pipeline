options(
  HTTPUserAgent =
    sprintf(
      "R/%s R (%s)",
      getRversion(),
      paste(getRversion(), R.version["platform"], R.version["arch"], R.version["os"])
    )
)

install.packages("arrow", repos = "https://packagemanager.rstudio.com/all/__linux__/focal/latest")
install.packages(c("jqr","leaflet","leaflet.providers","EML","emld","frictionless","R.methodsS3","arkdb","duckdb","contentid","RJSONIO","rgeos"), dependencies = TRUE, libs_only= TRUE)
remotes::install_github("inbo/camtraptor", build_vignettes = FALSE, build_manual = FALSE)
options(
  HTTPUserAgent =
    sprintf(
      "R/%s R (%s)",
      getRversion(),
      paste(getRversion(), R.version["platform"], R.version["arch"], R.version["os"])
    )
)

install.packages("arrow", repos = "https://packagemanager.rstudio.com/all/__linux__/focal/latest")

install.packages(c("dplyr","here","EML","plumber", "assertthat", "datapackage", "dplyr", "glue", "here",
                   "htmltools", "jsonlite", "leaflet", "lubridate", "purrr", "readr", "rlang", "stringr", "tidyr",
                   "datapackage", "leaflet", "config", "iterators", "jsonvalidate", "rlist", "tableschema.r",
                   "urltools", "V8"), dependencies = TRUE)
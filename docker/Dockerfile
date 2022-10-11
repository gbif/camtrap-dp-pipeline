FROM r-base
RUN apt-get update && apt-get -y install build-essential libxml2-dev libssl-dev libcurl4-openssl-dev libssl-dev libsodium-dev software-properties-common \
    && mkdir -p "/usr/local/gbif/camtrap-dp/{R,dwca,dp}"  \
    && add-apt-repository ppa:c2d4u.team/c2d4u4.0+ \
    && apt -y install r-cran-plumber r-cran-assertthat r-cran-dbi r-cran-dplyr r-cran-glue r-cran-htmltools r-cran-lifecycle r-cran-lubridate r-cran-purrr \
                      r-cran-rcolorbrewer r-cran-readr r-cran-rlang r-cran-rsqlite r-cran-stringr r-cran-tidyr r-cran-uuid r-cran-covr r-cran-knitr r-cran-rmarkdown \
                      r-cran-testthat r-cran-knitr r-cran-pkgdown r-cran-roxygen2 r-cran-rversions r-cran-urlchecker r-cran-here r-cran-remotes r-cran-lifecycle \
                      r-cran-colorspace r-cran-labeling r-cran-farver r-cran-isoband r-cran-gtable r-cran-viridislite r-cran-terra r-cran-sp r-cran-curl r-cran-evaluate \
                      r-cran-purrr r-cran-png r-cran-markdown r-cran-crosstalk r-cran-htmlwidgets r-cran-tidyselect r-cran-munsell \
                      r-cran-gridextra r-cran-raster r-cran-scales r-cran-vroom r-cran-v8
COPY ["R/server.R","R/dp_dwca.R","R/install_packages.R","/usr/local/gbif/camtrap-dp/R/"]
WORKDIR "/usr/local/gbif/camtrap-dp/R/"
RUN ["Rscript", "install_packages.R"]
VOLUME ["/usr/local/gbif/camtrap-dp/dwca/", "/usr/local/gbif/camtrap-dp/dp/"]
ENTRYPOINT ["Rscript", "/usr/local/gbif/camtrap-dp/R/server.R"]
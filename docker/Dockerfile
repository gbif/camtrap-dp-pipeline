FROM r-base
RUN apt-get update && apt-get -y install build-essential libxml2-dev libssl-dev libcurl4-openssl-dev libssl-dev libsodium-dev && mkdir -p "/usr/local/gbif/camtrap-dp/{R,dwca,dp}"
COPY R/install_packages.R /usr/local/gbif/camtrap-dp/R/
RUN Rscript /usr/local/gbif/camtrap-dp/R/install_packages.R
VOLUME ["/usr/local/gbif/camtrap-dp/dwca/", "/usr/local/gbif/camtrap-dp/dp/"]
ENTRYPOINT ["Rscript", "/usr/local/gbif/camtrap-dp/R/server.R"]
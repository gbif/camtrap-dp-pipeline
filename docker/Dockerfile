# Note: using an R image based on an LTS Ubuntu
# https://github.com/rocker-org/rocker-versioned2
FROM rocker/r-ver:4

# Install required system packages
RUN apt update \
    && apt -y install build-essential curl libcurl4-openssl-dev libfontconfig1-dev libfreetype6-dev libfribidi-dev libgdal-dev \
                      libharfbuzz-dev libjpeg-dev libjq-dev libnode-dev libpng-dev libpq-dev libsodium-dev libssl-dev \
                      libtiff5-dev libv8-dev libxml2-dev software-properties-common

# Install Apache Arrow libraries
RUN curl https://apache.jfrog.io/artifactory/arrow/$(lsb_release --id --short | tr 'A-Z' 'a-z')/apache-arrow-apt-source-latest-$(lsb_release --codename --short).deb -o /tmp/apache-arrow-apt-source-latest-$(lsb_release --codename --short).deb \
    && apt install -y -V /tmp/apache-arrow-apt-source-latest-$(lsb_release --codename --short).deb \
    && apt update -y \
    && apt install -y libarrow-dev

# Installing source packages
RUN mkdir -p /R/dwca /R/dp
WORKDIR "/R/"
COPY ["R/install_packages.R", "/R/"]
RUN ["Rscript", "install_packages.R"]

COPY ["R/convert-dp-dwca.R", "R/resources/meta.xml", "/R/"]

# General configs
VOLUME ["/R/dwca/", "/R/dp/", "/R/logs/"]
ENTRYPOINT ["Rscript", "convert-dp-dwca.R"]

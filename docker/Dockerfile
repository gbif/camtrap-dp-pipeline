FROM r-base
RUN apt-get update
RUN apt-get -y install build-essential libxml2-dev libssl-dev libcurl4-openssl-dev libssl-dev libsodium-dev
RUN mkdir -p "/usr/local/gbif/camera-trap-dp/R/"
RUN mkdir "/usr/local/gbif/camera-trap-dp/dwca/"
RUN mkdir "/usr/local/gbif/camera-trap-dp/dp/"
ADD R/install_packages.R /usr/local/gbif/camera-trap-dp/R/
RUN Rscript /usr/local/gbif/camera-trap-dp/R/install_packages.R
VOLUME ["/usr/local/gbif/camera-trap-dp/dwca/", "/usr/local/gbif/camera-trap-dp/dp/"]
ENTRYPOINT ["Rscript", "/usr/local/gbif/camera-trap-dp/R/server.R"]
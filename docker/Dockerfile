FROM r-base
RUN apt-get update
RUN apt-get -y install libcurl4-openssl-dev libssl-dev libsodium-dev
RUN mkdir -p "/usr/local/gbif/camera-trap-dp/R/"
RUN mkdir "/usr/local/gbif/camera-trap-dp/dwca/"
RUN mkdir "/usr/local/gbif/camera-trap-dp/dp/"
ADD R/install_packages.R /usr/local/gbif/camera-trap-dp/R/
RUN Rscript /usr/local/gbif/camera-trap-dp/R/install_packages.R
RUN wget -O /usr/local/gbif/camera-trap-dp/R/camtraptorv0.2.0.tar.gz https://github.com/inbo/camtraptor/archive/refs/tags/v0.2.0.tar.gz
RUN R CMD INSTALL /usr/local/gbif/camera-trap-dp/R/camtraptorv0.2.0.tar.gz
VOLUME ["/usr/local/gbif/camera-trap-dp/dwca/", "/usr/local/gbif/camera-trap-dp/dp/"]
ENTRYPOINT ["Rscript", "/usr/local/gbif/camera-trap-dp/R/server.R"]
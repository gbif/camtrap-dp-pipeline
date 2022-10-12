# Camtraptor docker server

This package contains an HTTP server to run that transformation of [CamTrapDP](https://tdwg.github.io/camtrap-dp/) into a DwC-A directory (expanded).
It simply assumes the existence of two directories `/usr/local/gbif/camtrap-dp/dp` in which the data package must be copied (extracted in directory)
and `/usr/local/gbif/camtrap-dp/dwca` in which the results are copied.

The [service](R/dp_dwca.R) accepts two parameters `dataset_key` and `dataset_title` (used for the generated EML), the generated Dwc-A will be copied to `/usr/local/gbif/camtrap-dp/dwca/{dataset_key}` directory.

By-default the service listens on port 8000 and it can't be changed, this service is meant to be executed from a container (i.e. Docker) and the listening port can be mapped
to a more convenient port outside the container.

This server doesn't support any locking mechanism when the same _dataset_key_ or input directory is used by parallel request, such functionality is out of the scope of this simple service.


## Dockerfile

The [Dockerfile file](Dockerfile) creates an image trying to use binary packages whenever is possible, some source packages are installed by using the file [install_packages.R](R/install_packages.R)
Additionally,the file provides volume definitions for the input and output directories, and also 8000 as the listening port.

The image can be built using the [build.sh](build.sh) by simply running the script.

The entry-point executes a [plumber server](R/server.R) that exposes the service described in the section above.


## Docker container

To run/create a container, execute the script [run.sh](run.sh), it provides some default mappings for ports and volumes.
Preliminary testing recommends a minimum of 4 GB to run this container, after several executions the memory seems to peek at 3.5 GB.
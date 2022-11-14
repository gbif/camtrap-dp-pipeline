#!/bin/bash
#
# Converts an unpacked Camtrap DataPackage to an unpacked DWCA.
#
# ./run.sh source-dp-dir dest-dwca-dir "Example dataset title"

if [[ ! -d "$1" ]]; then
    echo "First argument $1 is not a directory"
    exit 1
fi

if [[ -z "$4" ]]; then
    echo "Third argument should be project title"
    exit 1
fi

docker run --rm \
       --user $(id -u):$(id -g) \
       --volume $(realpath $1):/R/dp/:ro \
       --volume $(realpath $2):/R/dwca/ \
       docker.gbif.org/rgbifcamtrap:dev \
       "$3"

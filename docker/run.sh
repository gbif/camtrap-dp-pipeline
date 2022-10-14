#!/bin/bash
#
# Expects the DP to be in the folder $PWD/dp, and the DWCA to go to $PWD/dwca
#
# ./run.sh datapackage.json "Example dataset"

docker run --rm -it \
       -v $PWD/dp:/usr/local/gbif/camtrap-dp/dp \
       -v $PWD/dwca:/usr/local/gbif/camtrap-dp/dwca/ \
       "rgbifcamtrap:0.1" \
       Rscript convert-dp-dwca.R /usr/local/gbif/camtrap-dp/dp /usr/local/gbif/camtrap-dp/dwca "$1" "$2"

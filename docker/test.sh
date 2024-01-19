#!/bin/bash
#
# Tests converting an unpacked Camtrap DataPackage to an unpacked DWCA.
#
# ./test.sh

if [[ ! -d test ]]; then
    mkdir test
    curl --progress-bar -o test/mica-full.zip 'https://ipt3.gbif-uat.org/archive.do?r=mica-full'
    unzip -d test/mica-full-dp test/mica-full.zip
fi

rm -Rf test/mica-full-dwca
mkdir test/mica-full-dwca

docker run --pull always --rm \
       --user $(id -u):$(id -g) \
       --volume $(realpath test/mica-full-dp):/R/dp/:ro \
       --volume $(realpath test/mica-full-dwca):/R/dwca/ \
       docker.gbif.org/rgbifcamtrap:dev \
       "MICA - Full dataset"

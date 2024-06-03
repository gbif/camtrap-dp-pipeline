#!/bin/bash
#
# Tests converting an unpacked Camtrap DataPackage to an unpacked DWCA.
#
# ./test.sh

if [[ ! -d test ]]; then
    mkdir test
    curl --progress-bar -o test/mica-camtrap-dp.zip 'https://ipt.gbif-uat.org/archive.do?r=mica-camtrap-dp'
    unzip -d test/mica-camtrap-dp-dp test/mica-camtrap-dp.zip
fi

rm -Rf test/mica-camtrap-dp-dwca
mkdir test/mica-camtrap-dp-dwca

docker run --rm \
       --user $(id -u):$(id -g) \
       --volume $(realpath test/mica-camtrap-dp-dp):/R/dp/:ro \
       --volume $(realpath test/mica-camtrap-dp-dwca):/R/dwca/ \
       docker.gbif.org/rgbifcamtrap:dev \
       "MICA - Full dataset"

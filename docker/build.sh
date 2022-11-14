#!/bin/bash
DOCKER_BUILDKIT=1 docker build --no-cache -t docker.gbif.org/rgbifcamtrap:dev .

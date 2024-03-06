#!/bin/bash

docker build -t damanikjosh/virtualgl-turbovnc:latest -t damanikjosh/virtualgl-turbovnc:virtualgl3.1-ubuntu22.04 --build-arg="VIRTUALGL_VERSION=3.1" --build-arg="TURBOVNC_VERSION=3.1" --build-arg="UBUNTU_VERSION=22.04" .
docker build -t damanikjosh/virtualgl-turbovnc:virtualgl3.1-ubuntu20.04 --build-arg="VIRTUALGL_VERSION=3.1" --build-arg="TURBOVNC_VERSION=3.1" --build-arg="UBUNTU_VERSION=20.04" .
docker push damanikjosh/virtualgl-turbovnc --all-tags
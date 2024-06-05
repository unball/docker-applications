#!/bin/bash

docker run --name firasim -it --rm \
  -e DISPLAY=$DISPLAY \
  -v /tmp/.X11-unix:/tmp/.X11-unix --user="$(id --user):$(id --group)" \
  --network=host \
  unball/firasim:latest

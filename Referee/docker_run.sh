#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "Uso: $0 missing 2 arguments, A1: 3v3, 5v5 | A2: false, true"
    exit 1  # não há argumentos
fi

xhost +local:docker

docker run --name referee -it --rm \
  -e DISPLAY  \
  -v /tmp/.X11-unix:/tmp/.X11-unix --user="$(id --user):$(id --group)" \
  --network=host \
  unball/referee:latest /bin/bash -c "/referee/VSSReferee/bin/VSSReferee --$1 --record=$2"

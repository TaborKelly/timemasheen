#!/bin/bash -xe

if [ $# -ne 1 ]
  then
    echo "We expect exactly one argument the path to bind mount for data extrication."
    echo "ex: $0 /output"
    exit 1
fi

MEMORY_LIMIT=512m

docker run --privileged \
           --mount type=bind,source=$1,target=/output \
           -it \
           timemasheen

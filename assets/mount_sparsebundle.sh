#/usr/bin/env bash

if [ $# -ne 1 ]
  then
    echo "We expect exactly one argument, the path to the sparsebundle to mount"
    echo "ex: $0 /mnt/disk/ShareRoot/your.sparsebundle"
    exit 1
fi

/sparsebundlefs/sparsebundlefs "$1" /mnt/sparsebundle
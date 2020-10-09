#/usr/bin/env bash

if [ $# -ne 1 ]
  then
    echo "We expect exactly one argument, the path to the partition to mount"
    echo "ex: $0 /dev/sda3"
    exit 1
fi

mount $1 /mnt/disk
#/usr/bin/env bash

# start
START=$(parted /mnt/sparsebundle/sparsebundle.dmg unit B print | sed -n "s/^\s*[[:digit:]]\+\s*\([[:digit:]]\+\)B.*hfsx.*/\1/p")

# size
SIZE=$(parted /mnt/sparsebundle/sparsebundle.dmg unit B print | sed -n "s/^\s*[[:digit:]]\+\s*[[:digit:]]\+B\s*[[:digit:]]\+B\s*\([[:digit:]]\+\)B.*hfsx.*/\1/p")

echo $START $SIZE
LOOP_DEV=$(losetup -f /mnt/sparsebundle/sparsebundle.dmg --offset $START --sizelimit $SIZE --show)

mount -t hfsplus $LOOP_DEV /mnt/dmg
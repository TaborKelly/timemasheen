# timemasheen
A docker image to help read data off of a hard disk drive from an Apple Time Machine.

This image uses [torarnv/sparsebundlefs](https://github.com/torarnv/sparsebundlefs) and [rpedde/tmfuse](https://github.com/rpedde/tmfuse) to make your old Time Machine backups accessible.

I mostly created this container because Ubuntu 20.04 is too new to use the python2 based FUSE that tmfuse uses.

## Usage
Example usage from my workstation
```
./build.sh
# eg ./run.sh /work/output; this will be bind mounted to /output in the container
./run.sh /some/directory/to/bind/mount/into/the/container
# obviously, your device goes here
./mount_disk.sh /dev/sda3
# obviously, your sparsebundle path goes here
./mount_sparsebundle.sh /mnt/disk/ShareRoot/some.sparsebundle
# here parted may complain about RW vs RO but should work
./mount_dmg.sh
./mount_translated.sh
cd /mnt/translated # poke around
cp /mnt/translated/some/path /output # copy stuff out
```

## Further reading
Not used is [isnotajoke/fuse-time-machine](https://github.com/isnotajoke/fuse-time-machine) which may still be of interest.

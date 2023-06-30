#!/bin/bash

# Run mylfs script with sudo
sudo ./mylfs.sh -m

# Assign the output of 'pwd' command to the LFS variable
# Export the LFS variable
export LFS=$(pwd)/mnt/lfs

# Function to run umount command after chroot exit
run_umount() {
  sudo ./mylfs.sh -u
}

# Trap the EXIT signal and execute the run_umount function
trap run_umount EXIT

# Enter chroot environment
sudo chroot "$LFS" /usr/bin/env -i   \
    HOME=/root                  \
    TERM="$TERM"                \
    PS1='(lfs chroot) \u:\w\$ ' \
    PATH=/usr/bin:/usr/sbin     \
    /bin/bash --login

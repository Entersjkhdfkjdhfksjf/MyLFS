#!/bin/bash

# Pacman installation script for Linux From Scratch 11.3

# Set up temporary directory for building
build_dir="/tmp/pacman_build"
mkdir -p "$build_dir"
cd "$build_dir"

# Download Pacman source code
pacman_version="5.2.2"
pacman_tarball="pacman-$pacman_version.tar.gz"
pacman_url="https://sources.archlinux.org/other/pacman/$pacman_tarball"
wget "$pacman_url"

# Extract the source code
tar -xf "$pacman_tarball"
cd "pacman-$pacman_version"

# Configure and build Pacman
./configure --prefix=/usr
make

# Install Pacman
sudo make install

# Clean up
cd ..
rm -rf "$build_dir"

echo "Pacman installation completed."


#!/bin/bash
#############################################################################
##
##  set environment variables for the installation of aix on qemu
##
#############################################################################

# the aix version we're going to install
VERSION="7.2tl3"

# name of the virtual machine
NAME="template-aix-$VERSION"

# storage type of the disk image
DISK_TYPE="qcow2"

# full name of the disk image
DISK_NAME="$NAME.img"

# initial size of the disk image
DISK_SIZE="240G"

# number of cpu's
CPUS="2"

# amout of ram memory
MEMORY="4G"

# path to the installation cdrom image
CDROM="/data/iso/aix/$VERSION/aix_7200-03-00_1of2_92018.iso"

### EOF #####################################################################

#!/bin/bash
#############################################################################
##
##  create a virtual disk image for aix
##
#############################################################################

# load the environment variables
source aix-settings.sh

# create the disk image
qemu-img create -f $DISK_TYPE $DISK_NAME $DISK_SIZE

### EOF #####################################################################

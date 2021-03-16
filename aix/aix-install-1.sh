#!/bin/bash
#############################################################################
##
##  boot from the aix installation cd
##
#############################################################################

# load the environment variables
source aix-settings.sh

# boot from the cd
qemu-system-ppc64 \
  -name $NAME \
  -nographic \
  -cpu POWER9 \
  -machine pseries-2.12 \
  -smp cpus=$CPUS \
  -m $MEMORY \
  -d guest_errors \
  -serial mon:stdio \
  -cdrom $CDROM \
  -hda $DISK_NAME \
  -prom-env "input-device=/vdevice/vty@71000000" \
  -prom-env "output-device=/vdevice/vty@71000000" \
  -prom-env boot-command='boot cdrom:'

  #-machine cap-htm=off \
  #-bios /usr/share/qemu/openbios-ppc \
  #-prom-env "boot-command=dev / 0 0 s\" ibm,aix-diagnostics\" property boot cdrom:\ppc\chrp\bootfile.exe -s verbose" \
  #-net nic,macaddr=ba:be:00:fa:ce:01,model=virtio \
  #-net user,hostfwd=tcp::2003-:22

### EOF #####################################################################

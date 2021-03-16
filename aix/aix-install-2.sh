#!/bin/bash
#############################################################################
##
##  the fresh installed aix needs to be altered to be able to boot
##
#############################################################################

# to be able to alter the installation we have to boot from the installation
# cd again. two disk images are defined. the first one is the installation we
# just finished in the previous step. the second one is a temporary image
# with a virtual scsi interface.

# load the environment variables
source aix-settings.sh

# create a temporary disk image
qemu-img create -f $DISK_TYPE temp.img $DISK_SIZE

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
  -drive file=temp.img,if=none,id=drive-virtio-disk0 \
  -device virtio-scsi-pci,id=scsi \
  -device scsi-hd,drive=drive-virtio-disk0 \
  -prom-env "input-device=/vdevice/vty@71000000" \
  -prom-env "output-device=/vdevice/vty@71000000" \
  -prom-env boot-command='boot cdrom:'

# remove the temporary disk image
#rm temp.img

# some stuff I've tried but didn't work

  #-machine cap-htm=off \
  #-bios /usr/share/qemu/openbios-ppc \
  #-prom-env "boot-command=dev / 0 0 s\" ibm,aix-diagnostics\" property boot cdrom:\ppc\chrp\bootfile.exe -s verbose" \
  #-net nic,macaddr=ba:be:00:fa:ce:01,model=virtio \
  #-net user,hostfwd=tcp::2003-:22

### EOF #####################################################################

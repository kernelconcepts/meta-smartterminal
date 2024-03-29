#!/bin/sh

# configuration
DSTDIR=/boot
SRCDIR=${RAUC_SLOT_MOUNT_POINT}/boot

# copy bootloader
cmp -s ${SRCDIR}/u-boot.bin ${DSTDIR}/kernel7.img && echo "skip copy kernel7.img" || cp "${SRCDIR}/u-boot.bin" "${DSTDIR}/kernel7.img"
if [ $? -ne 0 ]; then
	echo Error copying file kernel7.img
	exit 2
fi

# copy rauc boot selection script
cmp -s ${SRCDIR}/boot_selection.scr ${DSTDIR}/boot_selection.scr && echo "skip copy boot_selection.scr" || cp "${SRCDIR}/boot_selection.scr" "${DSTDIR}/boot_selection.scr"
if [ $? -ne 0 ]; then
	echo Error copying file boot_selection.scr
	exit 2
fi

# copy kernel image
cmp -s ${SRCDIR}/uImage ${DSTDIR}/uImage && echo "skip copy uImage" || cp "${SRCDIR}/uImage" "${DSTDIR}/uImage"
if [ $? -ne 0 ]; then
	echo Error copying file uImage
	exit 2
fi

# copy devicetree / devictree overlays if needed
# TODO


sync

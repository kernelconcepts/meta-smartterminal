#!/bin/sh

# configuration
DSTDIR=/boot
SRCDIR=${RAUC_SLOT_MOUNT_POINT}/boot

# copy bootcode blob
cmp -s ${SRCDIR}/bootcode.bin ${DSTDIR}/bootcode.bin && echo "skip copy bootcode.bin" || cp "${SRCDIR}/bootcode.bin" "${DSTDIR}/bootcode.bin"
if [ $? -ne 0 ]; then
	echo Error copying file bootcode.bin
	exit 2
fi

# copy raspi boot stuff

rm -f ${DSTDIR}/fixup4*.dat
rm -f ${DSTDIR}/start4*.elf
for f in $(ls ${SRCDIR}/*.elf ${SRCDIR}/*.dat)
do
    f=$(basename ${f})
    cmp -s "${SRCDIR}/${f}" "${DSTDIR}/${f}" && echo "skip ${f}" || cp "${SRCDIR}/${f}" "${DSTDIR}/${f}"
    if [ $? -ne 0 ]; then
        echo Error copying bootstuff ${f}
        exit 2
    fi
done

# copy bootloader
cmp -s ${SRCDIR}/u-boot.bin ${DSTDIR}/kernel7.img && echo "skip copy kernel7.img" || cp "${SRCDIR}/u-boot.bin" "${DSTDIR}/kernel7.img"
if [ $? -ne 0 ]; then
	echo Error copying file kernel7.img
	exit 2
fi

# copy bootloader environment
cmp -s ${SRCDIR}/uboot.env ${DSTDIR}/uboot.env && echo "skip copy uboot.env" || cp "${SRCDIR}/uboot.env" "${DSTDIR}/uboot.env"
if [ $? -ne 0 ]; then
        echo Error copying file uboot.env
        exit 2
fi

# copy rauc boot selection script
cmp -s ${SRCDIR}/boot_selection.scr ${DSTDIR}/boot_selection.scr && echo "skip copy boot_selection.scr" || cp "${SRCDIR}/boot_selection.scr" "${DSTDIR}/boot_selection.scr"
if [ $? -ne 0 ]; then
	echo Error copying file boot_selection.scr
	exit 2
fi

# copy boot script
cmp -s ${SRCDIR}/boot.scr ${DSTDIR}/boot.scr && echo "skip copy boot.scr" || cp "${SRCDIR}/boot.scr" "${DSTDIR}/boot.scr"
if [ $? -ne 0 ]; then
	echo Error copying file boot.scr
	exit 2
fi

# copy kernel image
cmp -s ${SRCDIR}/uImage ${DSTDIR}/uImage && echo "skip copy uImage" || cp "${SRCDIR}/uImage" "${DSTDIR}/uImage"
if [ $? -ne 0 ]; then
	echo Error copying file uImage
	exit 2
fi

# copy configuration
cmp -s ${SRCDIR}/config.txt ${DSTDIR}/config.txt && echo "skip copy config" || cp "${SRCDIR}/config.txt" "${DSTDIR}/config.txt"
if [ $? -ne 0 ]; then
	echo Error copying config
	exit 2
fi

# copy kernel cmdline
cmp -s ${SRCDIR}/cmdline.txt ${DSTDIR}/cmdline.txt && echo "skip copy kernel cmdline" || cp "${SRCDIR}/cmdline.txt" "${DSTDIR}/cmdline.txt"
if [ $? -ne 0 ]; then
	echo Error copying kernel cmdline
	exit 2
fi

# copy devicetrees
for f in $(ls ${SRCDIR}/*.dtb)
do
    f=$(basename ${f})
    cmp -s "${SRCDIR}/${f}" "${DSTDIR}/${f}" && echo "skip ${f}" || cp "${SRCDIR}/${f}" "${DSTDIR}/${f}"
    if [ $? -ne 0 ]; then
        echo Error copying devicetree ${f}
        exit 2
    fi
done

# copy devicetree overlays
for f in $(ls ${SRCDIR}/*.dtbo)
do
    f=$(basename ${f})
    cmp -s "${SRCDIR}/${f}" "${DSTDIR}/overlays/${f}" && echo "skip ${f}" || cp "${SRCDIR}/${f}" "${DSTDIR}/overlays/${f}"
    if [ $? -ne 0 ]; then
        echo Error copying overlay ${f}
        exit 2
    fi
done

# copy overlay map
#cmp -s "${SRCDIR}/overlay_map.dtb" "${DSTDIR}/overlays/overlay_map.dtb" && echo "skip overlay_map.dtb" || cp "${SRCDIR}/overlay_map.dtb" "${DSTDIR}/overlays/overlay_map.dtb"
#if [ $? -ne 0 ]; then
#    echo Error copying overlay map
#    exit 2
#fi

sync

exit 0

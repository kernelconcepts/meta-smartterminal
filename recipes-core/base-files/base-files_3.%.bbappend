FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

dirs755 += "/data"

do_install_append () {
    touch ${D}${sysconfdir}/resolv.conf
    cat >> ${D}${sysconfdir}/fstab <<EOF
    /dev/mmcblk0p1	/boot	vfat	defaults,sync,noatime,flush	0	0
    /dev/mmcblk0p4	/data	ext4	defaults	0	0
EOF
}

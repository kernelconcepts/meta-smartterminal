FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

SRC_URI_append = " file://dhclient.conf"

do_install_append () {
    install -d ${D}/${sysconfdir}/dhcp
    install -m 644 ${WORKDIR}/dhclient.conf ${D}/${sysconfdir}/dhcp
}

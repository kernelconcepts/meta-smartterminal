FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI:append = " file://dhclient.conf"

do_install:append () {
    install -d ${D}/${sysconfdir}/dhcp
    install -m 644 ${WORKDIR}/dhclient.conf ${D}/${sysconfdir}/dhcp
}

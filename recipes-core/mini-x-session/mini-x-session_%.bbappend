FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI += "file://session \
"

do_install:append () {
    install -d ${D}/${sysconfdir}/mini_x
    install -m 755 ${WORKDIR}/session ${D}/${sysconfdir}/mini_x
}

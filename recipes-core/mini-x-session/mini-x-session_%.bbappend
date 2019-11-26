FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

SRC_URI += "file://session \
"

do_install_append () {
    install -d ${D}/${sysconfdir}/mini_x
    install -m 755 ${WORKDIR}/session ${D}/${sysconfdir}/mini_x
}

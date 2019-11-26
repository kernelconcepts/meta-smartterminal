FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

SRC_URI_append = " file://vdo-bootsplash-6.pnm"

do_install_append() {
	install -d ${D}/opt/vdo/
	install -m644 ${WORKDIR}/vdo-bootsplash-6.pnm ${D}/opt/vdo/
}

FILES_${PN} += "/opt/vdo"

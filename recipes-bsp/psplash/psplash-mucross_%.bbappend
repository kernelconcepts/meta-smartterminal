FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

SRC_URI_remove = "git://git.labs.kernelconcepts.de/psplash.git;protocol=git;branch=master"

SRC_URI_append = " git://gitlab.kernelconcepts.de/public-projects/psplash.git;protocol=https;branch=master \
                   file://vdo-bootsplash-6.pnm \
                 "



do_install_append() {
	install -d ${D}/opt/vdo/
	install -m644 ${WORKDIR}/vdo-bootsplash-6.pnm ${D}/opt/vdo/
}

FILES_${PN} += "/opt/vdo"

FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI = "git://gitlab.kernelconcepts.de/public-projects/psplash.git;protocol=https;branch=master \
           file://psplash-poky-img.h \
           file://psplash-bar-img.h \
           file://psplash-default \
           file://psplash-init \
           file://splashfuncs \
           file://vdo-bootsplash-6.pnm \
           file://0001-psplash-fix-use-of-inline-function.patch \
           "

do_install:append() {
	install -d ${D}/opt/vdo/
	install -m644 ${WORKDIR}/vdo-bootsplash-6.pnm ${D}/opt/vdo/
}

FILES:${PN} += "/opt/vdo"

DESCRIPTION = "udev rules for VDO Terminal"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

SRC_URI = " file://99-vdo.rules \
            file://99-usb-automount.rules \
            file://udev-cp210x-newid.sh \
          "


S = "${WORKDIR}"

INHIBIT_DEFAULT_DEPS = "1"

do_configure[noexec] = "1"

do_compile () {
    sed -i 's:@BINDIR@:${bindir}:g' ${S}/*rules
}

do_install () {
    install -d ${D}${sysconfdir}/udev/rules.d
    install -m 0644 ${WORKDIR}/99-vdo.rules ${D}${sysconfdir}/udev/rules.d/
    install -m 0644 ${WORKDIR}/99-usb-automount.rules ${D}${sysconfdir}/udev/rules.d/
    install -d ${D}${bindir}
    install -m 0755 ${WORKDIR}/udev-cp210x-newid.sh ${D}${bindir}/
}

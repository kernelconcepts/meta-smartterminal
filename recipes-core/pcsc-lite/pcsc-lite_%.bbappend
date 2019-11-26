FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

SRC_URI += "file://pcscd.sh \
"

do_install_append () {
    install -d ${D}/${sysconfdir}/init.d
    install -m 755 ${WORKDIR}/pcscd.sh ${D}/${sysconfdir}/init.d
}

FILES_${PN} += "${sysconfdir}/init.d/pcscd.sh"

inherit update-rc.d

INITSCRIPT_PACKAGES = "pcsc-lite"
INITSCRIPT_NAME = "pcscd.sh"
INITSCRIPT_PARAMS = "defaults"

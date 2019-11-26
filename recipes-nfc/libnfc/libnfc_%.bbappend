FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

SRCREV = "c59219905c7fa136205d4f65edd3f9dfc4efe239"

SRC_URI += "file://libnfc.conf \
            file://pn532.conf \
"

do_install_append () {
    install -d ${D}/${sysconfdir}/nfc
    install -m 644 ${WORKDIR}/libnfc.conf ${D}/${sysconfdir}/nfc
    install -d ${D}/${sysconfdir}/nfc/devices.d
    install -m 644 ${WORKDIR}/pn532.conf ${D}/${sysconfdir}/nfc/devices.d
}

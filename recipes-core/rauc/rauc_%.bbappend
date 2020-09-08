FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

SRC_URI_append = " file://system.conf \
                   file://rauc-mark-good.service \
                   file://rauc-mark-good.init \
                   file://mountboot.sh \
                 "

RAUC_KEYRING_FILE := "${THISDIR}/../../openssl-ca/dev/ca.cert.pem"

do_install_append() {
	install -d ${D}${sysconfdir}/rauc/certs
	install -m 755 ${WORKDIR}/mountboot.sh ${D}/usr/bin
}

FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

SRC_URI_append = " file://system.conf"

RAUC_KEYRING_FILE := "${THISDIR}/../../openssl-ca/dev/ca.cert.pem"

do_install_append() {
	install -d ${D}${sysconfdir}/rauc/certs
}

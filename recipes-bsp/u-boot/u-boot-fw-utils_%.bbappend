FILESEXTRAPATHS_prepend := "${THISDIR}/${BPN}:"

SRC_URI += "file://fw_env.config"

do_install_append() {
	install -m644 ${WORKDIR}/fw_env.config ${D}${sysconfdir}
}

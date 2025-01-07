FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI += "\
	file://lighttpd.conf \
	file://lighttpd \
"

do_install:append () {
    install -m 0644 ${WORKDIR}/lighttpd.conf ${D}/${sysconfdir}/
    install -m 0755 ${WORKDIR}/lighttpd ${D}${sysconfdir}/init.d
    rm -f ${D}/${sysconfdir}/lighttpd/lighttpd.conf
    rmdir ${D}/${sysconfdir}/lighttpd
}

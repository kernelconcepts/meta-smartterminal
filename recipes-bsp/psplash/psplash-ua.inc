inherit update-alternatives

do_install:append() {
	mv ${D}${bindir}/psplash ${D}${bindir}/psplash.${PN}
}

ALTERNATIVE:${PN} = "psplash"
ALTERNATIVE_LINK_NAME[psplash] = "${bindir}/psplash"
ALTERNATIVE_TARGET[psplash] = "${bindir}/psplash.${PN}"

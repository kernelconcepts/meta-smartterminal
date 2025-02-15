DESCRIPTION = "Userspace framebuffer boot logo based on usplash."
HOMEPAGE = "http://projects.o-hand.com/psplash"
SECTION = "base"
LICENSE = "GPLv2+"
PROVIDES = "virtual/psplash"
RPROVIDES:${PN} = "virtual-psplash"
RCONFLICTS:${PN} = "exquisite"

SRCREV = "422"
PV = "0.0+svnr${SRCPV}"
PR = "r34"

# You can create your own pslash-poky-img.h by doing
# ./make-image-header.sh <file>.png POKY
# and rename the resulting .h to pslash-poky-img.h (for the logo)
# respectively psplash-bar-img.h (BAR) for the bar.
# You might also want to patch the colors (see patch)

inherit autotools pkgconfig update-rc.d

do_configure:append() {
	install -m 0644 ${WORKDIR}/psplash-poky-img.h ${S}/
	install -m 0644 ${WORKDIR}/psplash-bar-img.h ${S}/

	if [ -e "${WORKDIR}/psplash.h" ]; then
		install -m 0644 ${WORKDIR}/psplash.h ${S}/
	fi
}

do_install:prepend() {
	install -d ${D}/mnt/.splash/
	install -d ${D}${sysconfdir}/default/
	install -m 0644 ${WORKDIR}/psplash-default ${D}${sysconfdir}/default/psplash
	install -d ${D}${sysconfdir}/init.d/
	install -m 0755 ${WORKDIR}/psplash-init ${D}${sysconfdir}/init.d/psplash
	install -d ${D}${bindir}
	ln -s psplash-write ${D}${bindir}/splash-write
	install -d ${D}${sysconfdir}/default
	install -m 0755 ${WORKDIR}/splashfuncs ${D}${sysconfdir}/default/splashfuncs
}

INITSCRIPT_NAME = "psplash"
INITSCRIPT_PARAMS = "start 01 S . stop 20 0 1 6 ."

PACKAGES =+ "psplash-support"

RDEPENDS:${PN} += "psplash-support"
FILES:psplash-support += "/mnt/.splash ${sysconfdir} ${bindir}/psplash-write ${bindir}/splash-write"

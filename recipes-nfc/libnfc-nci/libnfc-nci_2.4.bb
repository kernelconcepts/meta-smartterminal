SUMMARY = "LIB NFC-NCI "
SECTION = "libs"
LICENSE = "Apache-2.0"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=89aea4e17d99a7cacdbeed46a0096b10"

#TARGET_CC_ARCH += "${LDFLAGS}"

SRCREV = "R2.4"
SRC_URI = "git://github.com/NXPNFCLinux/linux_libnfc-nci.git"

S = "${WORKDIR}/git"

inherit autotools pkgconfig

EXTRA_OECONF += "i2c_available=yes --prefix=${WORKDIR}"


#INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
#INHIBIT_PACKAGE_STRIP = "1"

#PACKAGES = "${PN}"

#FILES:${PN} += "${libdir}/lib*.so"
FILES:${PN} += "${libdir}"
FILES:${PN}-dev = "${includedir} ${libdir}/libnfc_nci_linux.so"


#SECTION:${PN}-dev = "devel"
#ALLOW_EMPTY:${PN}-dev = "1"
#RDEPENDS:${PN}-dev = "${PN} (= ${EXTENDPKGV})"
#RDEPENDS:${PN} = "${PN}-dev (= ${EXTENDPKGV})"


do_compile:append() {
    for i in $(find ${B} -name "*.pc") ; do
        sed -i -e s:${WORKDIR}:/usr:g \
                  $i
    done
}

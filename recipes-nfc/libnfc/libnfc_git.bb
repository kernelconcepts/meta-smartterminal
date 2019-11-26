SUMMARY = "Library which allows userspace application access to NFC devices."
HOMEPAGE = "http://nfc-tools.org/index.php?title=Libnfc"
SECTION = "libs"
LICENSE = "LGPLv3"
LIC_FILES_CHKSUM = "file://COPYING;md5=b52f2d57d10c4f7ee67a7eb9615d5d24"

DEPENDS = "libusb"

SRCREV = "c59219905c7fa136205d4f65edd3f9dfc4efe239"
PV = "1.7.1+git${SRCPV}"
SRC_URI = "git://github.com/nfc-tools/libnfc.git"

S = "${WORKDIR}/git"

inherit autotools pkgconfig

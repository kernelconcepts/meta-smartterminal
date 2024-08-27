SUMMARY = "Library which allows userspace application access to NFC devices."
HOMEPAGE = "http://nfc-tools.org/index.php?title=Libnfc"
SECTION = "libs"
LICENSE = "LGPLv3"
LIC_FILES_CHKSUM = "file://COPYING;md5=b52f2d57d10c4f7ee67a7eb9615d5d24"
SRC_URI[sha256sum] = "7eba09b45c98330f89cba159f49a4cc7cd39598d582673083605b79683332e1e"

DEPENDS = "libusb"

SRCREV = "c59219905c7fa136205d4f65edd3f9dfc4efe239"
PV = "1.7.1+git${SRCPV}"
SRC_URI = "git://github.com/nfc-tools/libnfc.git;protocol=https;branch=master"

S = "${WORKDIR}/git"

inherit autotools pkgconfig

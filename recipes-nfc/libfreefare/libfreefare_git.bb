SUMMARY = "The libfreefare project provides a convenient API for MIFARE card manipulations."
HOMEPAGE = "http://nfc-tools.org/index.php?title=Libfreefare"
SECTION = "libs"
LICENSE = "LGPLv2.1+"
LIC_FILES_CHKSUM = "file://COPYING;md5=9827bc32c2b36ae4121d6583b582c9c0"

DEPENDS = "libusb-compat libnfc openssl"

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-${PV}:"

SRCREV = "5459806659d5f6aa0e7705b88c48775ea6c861a6"
SRC_URI = "git://github.com/nfc-tools/libfreefare.git"
PV = "0.4.0+git${SRCPV}"


S = "${WORKDIR}/git"

inherit autotools pkgconfig

# The autotools configuration I am basing this on seems to have a problem with a race condition when parallel make is enabled
PARALLEL_MAKE = ""


SUMMARY = "The libfreefare project provides a convenient API for MIFARE card manipulations."
HOMEPAGE = "http://nfc-tools.org/index.php?title=Libfreefare"
SECTION = "libs"
LICENSE = "LGPLv2.1+"
LIC_FILES_CHKSUM = "file://COPYING;md5=9827bc32c2b36ae4121d6583b582c9c0"
SRC_URI[sha256sum] = "be759bb26336719323640c77f5f91e4f939450d403b75885fa63e2a1fe85f286"

DEPENDS = "libusb-compat libnfc openssl"

FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}-${PV}:"

SRCREV = "e95406c0d1b417ff6db7ff8ee95df1b5981ec7b5"
SRC_URI = "git://github.com/nfc-tools/libfreefare.git;protocol=https;branch=master"
PV = "0.4.0+git${SRCPV}"


S = "${WORKDIR}/git"

inherit autotools pkgconfig

# The autotools configuration I am basing this on seems to have a problem with a race condition when parallel make is enabled
PARALLEL_MAKE = ""


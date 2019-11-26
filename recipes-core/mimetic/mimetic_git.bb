SUMMARY = "mimetic is a free, MIT licensed, Email library (MIME)"
HOMEPAGE = "https://github.com/kernelconcepts/mimetic"
SECTION = "libs"
LICENSE = "MIT"

LIC_FILES_CHKSUM = "file://LICENSE;md5=b49da7df0ca479ef01ff7f2d799eabee"

DEPENDS += "gcc-runtime"

PV = "0.9.8+git${SRCPV}"

SRCREV = "0b999e720b67e441a3c8904aea6af315e75abbd4"
SRC_URI = "git://github.com/kernelconcepts/mimetic;protocol=https \
           file://0001-disable-tests-windows-and-examples.patch"


S = "${WORKDIR}/git"

inherit autotools pkgconfig


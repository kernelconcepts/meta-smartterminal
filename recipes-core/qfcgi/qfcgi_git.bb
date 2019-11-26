SUMMARY = "FastCGI implementation for Qt"
LICENSE = "LGPLv3"

SRCBRANCH="port-qt5-qmake"
SRCREV = "c1501d56ffa281c898d75b912a2ba525b59fad59"
PV = "0.0+git${SRCPV}"

SRC_URI = "git://github.com/kernelconcepts/qfcgi.git;protocol=https;branch=${SRCBRANCH}"

LIC_FILES_CHKSUM = "file://LICENSE;md5=c8156b3403995b12675506b785491cd2"

DEPENDS = "qtbase"

inherit qmake5

S = "${WORKDIR}/git"

PACKAGES += "${PN}-example"
FILES_${PN}-example = "/opt"

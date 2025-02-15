SUMMARY = "VDO SmartTerminal main application"
LICENSE = "CLOSED"

DEPENDS = "qtbase qtdeclarative qtquickcontrols qtquickcontrols2 pcsc-lite libnfc libfreefare qtserialport qttools-native qfcgi mimetic avahi"

# Add packages with all used external tools here
RDEPENDS:${PN} += "gnupg coreutils qtgraphicaleffects-qmlplugins"

inherit bin_package

FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI = "file://smartterminal-app_2.2.1.20.tar.gz;unpack=0 \
"

INSANE_SKIP:${PN} = "ldflags"
INHIBIT_PACKAGE_STRIP = "1"
INHIBIT_SYSROOT_STRIP = "1"
INHIBIT_PACKAGE_DEBUG_SPLIT = "1"

do_install() {
    tar -C ${D}/ -xzf ${WORKDIR}/smartterminal-app_2.2.1.20.tar.gz --owner=root:0 --group=root:0
}

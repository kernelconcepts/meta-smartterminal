SUMMARY = "VDO SmartTerminal main application"
LICENSE = "CLOSED"

DEPENDS = "qtbase qtdeclarative qtquickcontrols qtquickcontrols2 pcsc-lite libnfc libfreefare qtserialport qttools-native qfcgi mimetic"

# Add packages with all used external tools here
RDEPENDS_${PN} += "gnupg coreutils qtgraphicaleffects-qmlplugins"

inherit base bin_package

FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

SRC_URI = "file://smartterminal-app.tar.gz;unpack=0 \
"

INSANE_SKIP_${PN} = "ldflags"
INHIBIT_PACKAGE_STRIP = "1"
INHIBIT_SYSROOT_STRIP = "1"
INHIBIT_PACKAGE_DEBUG_SPLIT = "1"

do_install() {
    tar -C ${D}/ -xzf ${WORKDIR}/smartterminal-app.tar.gz --owner=root:0 --group=root:0
}

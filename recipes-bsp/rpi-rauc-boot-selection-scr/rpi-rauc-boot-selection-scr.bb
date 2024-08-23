SUMMARY = "U-boot boot selection script for rauc for Raspberry Pi"
COMPATIBLE_MACHINE = "(vdo-smartterminal)"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

DEPENDS = "u-boot-mkimage-native"

INHIBIT_DEFAULT_DEPS = "1"

SRC_URI = "file://boot_selection.cmd"

do_compile() {
    mkimage -T script -C none -n "boot selection script" -d "${WORKDIR}/boot_selection.cmd" boot_selection.scr
}

inherit deploy 
#nopackages

do_deploy() {
    install -d ${DEPLOYDIR}
    install -m 0644 boot_selection.scr ${DEPLOYDIR}
}

addtask do_deploy after do_compile before do_build

do_install() {
        install -d ${D}/boot
        install -m 0644 boot_selection.scr ${D}/boot
}

FILES:${PN} += "/boot"

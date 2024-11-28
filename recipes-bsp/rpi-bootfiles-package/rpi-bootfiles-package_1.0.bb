DESCRIPTION = "Package RPI closed bootfiles for VDO Terminal filesystem"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

inherit deploy bin_package

DEPENDS = "rpi-bootfiles rpi-u-boot-scr"
PACKAGE_ARCH = "${MACHINE_ARCH}"

INHIBIT_DEFAULT_DEPS = "1"

do_fetch[noexec] = "1"
do_configure[noexec] = "1"
do_compile[noexec] = "1"


INSANE_SKIP_${PN} = "ldflags arch"
INHIBIT_PACKAGE_STRIP = "1"
INHIBIT_SYSROOT_STRIP = "1"
INHIBIT_PACKAGE_DEBUG_SPLIT = "1"

FILES_${PN} = "/boot"

do_install () {
    install -d ${D}/boot
    install -m755 ${DEPLOY_DIR_IMAGE}/${BOOTFILES_DIR_NAME}/*.bin ${D}/boot/
    install -m755 ${DEPLOY_DIR_IMAGE}/${BOOTFILES_DIR_NAME}/*.elf ${D}/boot/
    install -m644 ${DEPLOY_DIR_IMAGE}/${BOOTFILES_DIR_NAME}/*.dat ${D}/boot/
    install -m644 ${DEPLOY_DIR_IMAGE}/boot.scr ${D}/boot/
}


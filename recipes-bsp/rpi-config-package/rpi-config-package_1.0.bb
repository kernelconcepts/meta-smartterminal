DESCRIPTION = "Package RPI text config for VDO Terminal filesystem"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

inherit deploy

DEPENDS = "rpi-config rpi-cmdline"
PACKAGE_ARCH = "${MACHINE_ARCH}"

INHIBIT_DEFAULT_DEPS = "1"

BOOTFILES_DIR_NAME = "bcm2835-bootfiles"

do_fetch[noexec] = "1"
do_configure[noexec] = "1"
do_compile[noexec] = "1"

FILES_${PN} = "/boot"

do_install () {
    install -D -m644 ${DEPLOY_DIR_IMAGE}/${BOOTFILES_DIR_NAME}/config.txt ${D}/boot/config.txt
    install -m644 ${DEPLOY_DIR_IMAGE}/${BOOTFILES_DIR_NAME}/cmdline.txt ${D}/boot/cmdline.txt
}


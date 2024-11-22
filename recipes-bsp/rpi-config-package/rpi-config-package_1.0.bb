DESCRIPTION = "Package RPI config.txt for VDO Terminal filesystem"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

inherit deploy

DEPENDS = "rpi-config"
PACKAGE_ARCH = "${MACHINE_ARCH}"

INHIBIT_DEFAULT_DEPS = "1"

do_fetch[noexec] = "1"
do_configure[noexec] = "1"
do_compile[noexec] = "1"

FILES:${PN} = "/boot"

do_install () {
    install -D -m644 ${DEPLOY_DIR_IMAGE}/${BOOTFILES_DIR_NAME}/config.txt ${D}/boot/config.txt
}


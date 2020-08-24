FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"

SRC_URI = " file://system-update-hook.sh"

RAUC_BUNDLE_HOOKS[file] = "system-update-hook.sh"
RAUC_BUNDLE_HOOKS[hooks] = "post-install"
RAUC_SLOT_rootfs[hooks] = "post-install"


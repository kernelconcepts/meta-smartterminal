FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

DEPENDS_append_rpi = " rpi-rauc-boot-selection-scr"

SRC_URI += "file://0001-board-raspberrypi-rpi-never-cache-old-eth-mac-in-env.patch \
"

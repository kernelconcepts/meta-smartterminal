FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

DEPENDS:append_rpi = " rpi-rauc-boot-selection-scr"

# SRC_URI += "file://0001-board-raspberrypi-rpi-never-cache-old-eth-mac-in-env.patch
#             file://0002-fix-issue-on-sd-host-driver.patch
#"

SRC_URI += "file://fw_env.config"

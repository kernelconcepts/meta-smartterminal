FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

DEPENDS:append_rpi = " rpi-rauc-boot-selection-scr"

SRC_URI += "\
    file://0001-board-raspberrypi-rpi-never-cache-old-eth-mac-in-env.patch \
    file://0003-set-config_sys_bootm_len.patch \
"

SRC_URI += "file://fw_env.config"

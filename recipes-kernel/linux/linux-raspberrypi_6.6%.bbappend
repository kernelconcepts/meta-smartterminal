SUMMARY = "Linux Kernel for VDO Terminal 4, based on the Raspberry-PI 3B+"

FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
DEPENDS += "lz4-native"

COMPATIBLE_MACHINE_vdo-smartterminal = "(vdo-smartterminal)"

SRC_URI += "file://vdo-terminal-4-i2c-gpio-overlay.dts;subdir=git/arch/${ARCH}/boot/dts/overlays \
            file://vdo-terminal-4-i2c-rtc-gpio-overlay.dts;subdir=git/arch/${ARCH}/boot/dts/overlays \
            file://vdo-terminal-4-i2c-edt-ft5406-gpio-overlay.dts;subdir=git/arch/${ARCH}/boot/dts/overlays \
            file://vdo-terminal-4-pwm-2chan-overlay.dts;subdir=git/arch/${ARCH}/boot/dts/overlays \
            file://vdo-terminal-4-pwm-backlight-overlay.dts;subdir=git/arch/${ARCH}/boot/dts/overlays \
            file://vdo-terminal-4-dpi18-overlay.dts;subdir=git/arch/${ARCH}/boot/dts/overlays \
            file://defconfig \
            file://rauc.cfg \
"


KERNEL_MODULE_AUTOLOAD += "i2c-dev rtc-ds1307"

CMDLINE:append = " consoleblank=0  vt.global_cursor_default=0 video=DPI-1:800x480@60,rotate=180"

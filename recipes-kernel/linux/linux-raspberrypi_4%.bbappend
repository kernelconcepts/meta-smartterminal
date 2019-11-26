SUMMARY = "Linux Kernel for VDO SmartTerminal, based on the Raspberry-PI 3B+"
#
FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
DEPENDS += "lz4-native"

COMPATIBLE_MACHINE_vdo-smartterminal = "(vdo-smartterminal)"

LINUX_VERSION = "4.14.114"

SRCREV = "caa653325d58e5062907ec378269e77e6018f2ee"

SRC_URI += "file://vdo-terminal-4-i2c-gpio-overlay.dts;subdir=git/arch/${ARCH}/boot/dts/overlays \
            file://vdo-terminal-4-i2c-rtc-gpio-overlay.dts;subdir=git/arch/${ARCH}/boot/dts/overlays \
            file://vdo-terminal-4-i2c-edt-ft5406-gpio-overlay.dts;subdir=git/arch/${ARCH}/boot/dts/overlays \
	    file://vdo-terminal-4-pwm-2chan-overlay.dts;subdir=git/arch/${ARCH}/boot/dts/overlays \
	    file://vdo-terminal-4-pwm-backlight-overlay.dts;subdir=git/arch/${ARCH}/boot/dts/overlays \
	    file://vdo-terminal-4-dpi18-overlay.dts;subdir=git/arch/${ARCH}/boot/dts/overlays \
            file://defconfig \
            file://rauc.cfg \
"

SRC_URI += "file://0001-drivers-input-touchscreen-update-edt-ft5x06.patch \
"

KERNEL_DEVICETREE += "overlays/vdo-terminal-4-i2c-gpio.dtbo \
                      overlays/vdo-terminal-4-i2c-rtc-gpio.dtbo \
                      overlays/vdo-terminal-4-i2c-edt-ft5406-gpio.dtbo \
                      overlays/vdo-terminal-4-pwm-2chan.dtbo \
                      overlays/vdo-terminal-4-pwm-backlight.dtbo \
                      overlays/vdo-terminal-4-dpi18.dtbo \
"

KERNEL_MODULE_AUTOLOAD += "i2c-dev rtc-ds1307"

CMDLINE_append = " consoleblank=0  vt.global_cursor_default=0"
